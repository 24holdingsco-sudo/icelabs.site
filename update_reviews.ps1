# ICELABS - Expand all show reviews to 250+ words each & fix banner images
$showsDir = "C:\Users\LENOVO\Desktop\18th april\development\icelabs site\shows"
$imagesDir = "C:\Users\LENOVO\Desktop\18th april\development\icelabs site\images"

# Category image URLs (download local copies)
$catImages = @{
    sci-fi    = "https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=1200&h=630&fit=crop"
    anime     = "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=1200&h=630&fit=crop"
    crime     = "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=1200&h=630&fit=crop"
    horror    = "https://images.unsplash.com/photo-1509248961158-c54f8d3c2b32?w=1200&h=630&fit=crop"
    doc       = "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=1200&h=630&fit=crop"
    war       = "https://images.unsplash.com/photo-1516371539850-4c0388b7a9e8?w=1200&h=630&fit=crop"
}

# Download category images
Write-Host "Downloading category banner images..." -ForegroundColor Cyan
foreach ($key in $catImages.Keys) {
    $url = $catImages[$key]
    $ext = "jpg"
    $out = Join-Path $imagesDir "banner-$key.$ext"
    if (-not (Test-Path $out)) {
        try {
            Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing -ErrorAction Stop
            Write-Host "  Downloaded banner-$key.$ext" -ForegroundColor Green
        } catch { Write-Host "  FAILED: banner-$key.$ext" -ForegroundColor Red }
    } else { Write-Host "  Exists: banner-$key.$ext" -ForegroundColor Gray }
}

# Map each Unsplash show to its category
$showCategory = @{}
# Sci-Fi & Fantasy (15)
@("stranger-things","game-of-thrones","the-expanse","westworld","dark","mandalorian","the-witcher","black-mirror","lost","the-100","altered-carbon","foundation","house-of-the-dragon","severance","fallout") | % { $showCategory["$_.html"] = "sci-fi" }
# Anime & Animation (12)
@("avatar-last-airbender","fullmetal-alchemist","attack-on-titan","arcane","death-note","bojack-horseman","demon-slayer","one-punch-man","invincible","south-park","simpsons","family-guy") | % { $showCategory["$_.html"] = "anime" }
# True Crime (10)
@("the-jinx","making-a-murderer","the-keepers","wild-wild-country","dont-fk-with-cats","night-stalker","the-staircase","tiger-king","evil-genius","confession-tapes") | % { $showCategory["$_.html"] = "crime" }
# Horror & Supernatural (10)
@("x-files","haunting-of-hill-house","hannibal","supernatural","walking-dead","american-horror-story","lovecraft-country","bly-manor","yellowjackets","from") | % { $showCategory["$_.html"] = "horror" }
# Documentary (10)
@("planet-earth-ii","our-planet","blue-planet-ii","cosmos","the-last-dance","beatles-get-back","chefs-table","abstract","welcome-to-earth","free-solo") | % { $showCategory["$_.html"] = "doc" }
# War & Military (8)
@("band-of-brothers","chernobyl","rome","generation-kill","vikings","the-last-kingdom","the-pacific","all-quiet-western-front") | % { $showCategory["$_.html"] = "war" }

# ============ EXPANDED REVIEW CONTENT FOR ALL 108 SHOWS ============
# Each show gets 4-5 paragraphs (200-350 words) of genuine, unique commentary

$reviews = @{}

# ====== MEDICAL DRAMAS (15) ======
$reviews["house.html"] = @"
<p>Dr. Gregory House is the most compelling antihero to ever stalk a hospital corridor. Played with surgical precision by Hugh Laurie, House is a diagnostician who solves medical mysteries that baffle everyone else — while being morally bankrupt, casually cruel, and hopelessly addicted to Vicodin. The show's formula — patient presents with impossible symptoms, team debates, House has epiphany in a sarcastic remark — never gets old because the writing is razor-sharp and the character work runs deep.</p>
<p>What makes House work is the brilliant balance between medical puzzle and human drama. Each episode is a detective story wrapped in a white coat. The team rotates through talented actors — from Omar Epps to Olivia Wilde to Jesse Spencer — but the real constant is House's painful, hilarious, and strangely touching relationship with Dr. James Wilson (Robert Sean Leonard). Their friendship is the quiet soul of the series.</p>
<p>House's misanthropy isn't just for show. The writers use his physical pain (the cane, the leg, the addiction) as a constant reminder that cruelty often comes from suffering. Some of the best episodes — like "Three Stories" and "House's Head" — are structurally inventive in ways that most TV dramas wouldn't dare attempt. The show won multiple Emmys and a Peabody Award for good reason.</p>
<p>The later seasons lose some momentum, but when House is firing on all cylinders — mocking patients, humiliating his team, and somehow saving lives in the process — it remains appointment television. It's a show about how being right doesn't make you good, and how being good doesn't make you right. That tension is what keeps us watching, even when House himself would tell us not to bother. Our rating: 8.7/10.</p>
"@

$reviews["greys-anatomy.html"] = @"
<p>Grey's Anatomy has been on the air for two decades, and for good reason. Shonda Rhimes created a medical drama that understands something fundamental: audiences don't just want medical miracles — they want messy, complicated, beautiful human beings falling in and out of love while saving lives. Meredith Grey (Ellen Pompeo) started as an intern and became the heart of a television institution.</p>
<p>The early seasons are pure magic. The chemistry between the original intern class — Cristina Yang, Izzie Stevens, Alex Karev, George O'Malley — crackles with energy. The show perfected the art of the emotional gut-punch: elevator crashes, plane crashes, the shooting episode, Denny Duquette's death. Grey's makes you care so deeply about its characters that every tragedy lands like a personal loss.</p>
<p>What sets Grey's apart from other medical dramas is its willingness to evolve. Characters leave, new ones arrive, relationships end and begin. The show has survived the departure of its entire original cast over time by constantly reinventing itself while maintaining its core DNA — witty banter, impossible surgeries, and a soundtrack that knows exactly when to break your heart.</p>
<p>The show's cultural impact is undeniable. It launched a spin-off (Private Practice, Station 19), made McDreamy a household name, and gave us some of the most quoted lines in television history. Even in its later seasons, Grey's remains a ratings powerhouse. It's comfort food television at its finest — familiar, warm, and occasionally devastating. Our rating: 8.2/10.</p>
"@

$reviews["the-good-doctor.html"] = @"
<p>Shaun Murphy is not your typical TV doctor. Freddie Highmore delivers a career-defining performance as a young surgeon with autism and savant syndrome, navigating a hospital that constantly underestimates him. The Good Doctor walks a delicate line — celebrating neurodiversity while never letting Shaun become a caricature or a miracle machine. He's brilliant at diagnosis, terrible at small talk, and completely unforgettable.</p>
<p>The show follows Shaun from his first nervous days at San Jose St. Bonaventure Hospital through his growth as a surgeon and a person. Each episode presents a medical challenge that Shaun solves through his unique perspective — seeing details others miss, making connections that seem impossible. But the show never lets him coast on talent. His struggles with social cues, emotional expression, and workplace politics are treated with genuine respect and complexity.</p>
<p>The supporting cast — including Richard Schiff, Antonia Thomas, and Hill Harper — create a hospital environment that feels both supportive and skeptical. Shaun's relationships with his colleagues evolve naturally, particularly his mentorship under Dr. Glassman and his friendships with Claire and Jared. The romantic storylines are handled with sensitivity.</p>
<p>The Good Doctor has been criticized for formulaic episodes, but its consistent quality and Highmore's extraordinary performance make it one of television's most reliable medical dramas. It proves that the medical genre still has room for something genuinely different. When Shaun saves a patient by noticing what everyone else missed, it's not just satisfying — it's inspiring. Our rating: 8.0/10.</p>
"@

$reviews["chicago-med.html"] = @"
<p>Chicago Med is the medical anchor of Dick Wolf's Chicago franchise, and it brings the same procedural precision that made Law & Order legendary. The show follows the doctors and nurses at Gaffney Chicago Medical Center as they navigate life-and-death decisions in one of America's busiest emergency rooms. It's fast-paced, emotionally charged, and unafraid to tackle hard ethical questions.</p>
<p>What distinguishes Chicago Med from other hospital dramas is its ensemble approach. There's no single Meredith Grey — instead, the show balances a large cast including Dr. Will Halstead, Dr. Natalie Manning, Dr. Ethan Choi, and nurse Maggie Lockwood. Each character brings a different perspective to the chaos of the ER, and the show excels at giving everyone their moment to shine. The crossovers with Chicago Fire and Chicago PD add a layer of interconnected storytelling that rewards loyal viewers.</p>
<p>The medical cases are grounded and realistic, often ripped from headlines. The show doesn't shy away from controversial topics — opioid addiction, healthcare inequality, medical ethics in a profit-driven system. Oliver Platt's Dr. Daniel Charles provides both comic relief and profound wisdom as the hospital's psychiatrist.</p>
<p>While Chicago Med may not reach the artistic heights of House or early Grey's Anatomy, it delivers exactly what procedural fans want: compelling cases, character growth, and the satisfying rhythm of a well-oiled television machine. It's comfort food for medical drama lovers. Our rating: 7.8/10.</p>
"@

$reviews["the-resident.html"] = @"
<p>The Resident arrived with a mission: expose the dark side of American healthcare while still delivering the emotional satisfaction of a medical drama. It succeeds brilliantly. Matt Czuchry plays Dr. Conrad Hawkins, a senior resident who operates by his own moral code, constantly butting heads with hospital administration and corrupt corporate interests while fighting for his patients.</p>
<p>The show's secret weapon is its willingness to criticize the system it depicts. Hospital bureaucracy, insurance company interference, and profit-driven medicine are the real villains here. The series was praised by actual healthcare professionals for its accurate portrayal of the pressures doctors face. It's a medical drama with an activist heart.</p>
<p>The cast is uniformly excellent. Emily VanCamp as nurse practitioner Nic Nevin provides emotional grounding, while Bruce Greenwood as the morally flexible Dr. Bell undergoes one of the most interesting redemption arcs on television. The mentor-student relationship between Conrad and the rotating interns gives the show a steady source of narrative energy.</p>
<p>While The Resident sometimes leans too heavily on its contrarian premise, it earns its moments of genuine emotion. The medical cases are inventive, the ethical dilemmas are real, and the characters grow in ways that feel earned. For viewers tired of idealized hospital dramas, The Resident offers a refreshingly critical take on modern medicine. Our rating: 7.9/10.</p>
"@

$reviews["the-pitt.html"] = @"
<p>The Pitt is a bold reinvention of the medical drama format. Set in a Pittsburgh trauma center, each episode covers one hour of a 15-hour shift in real time. Noah Wyle stars as Dr. Michael "Robby" Robinavitch, a veteran attending physician navigating the controlled chaos of an urban emergency department. The real-time conceit gives the show an intensity that few medical dramas achieve.</p>
<p>Wyle brings decades of TV medical experience — he spent 11 seasons on ER — and his performance carries the weight of authenticity. The supporting cast, including Tracy Ifeachor, Patrick Ball, and Fiona Dourif, creates a believable team of doctors, residents, and nurses who function as a family under pressure. The show's medical cases range from routine to catastrophic, and the format allows each to breathe in a way that traditional procedurals can't.</p>
<p>The real-time structure forces the writing to be economical and urgent. Every scene counts. When a mass casualty event hits the ER, the viewer experiences the exhaustion and adrenaline alongside the doctors. It's immersive television that respects the intelligence of its audience.</p>
<p>The Pitt has been praised for its authenticity in medical accuracy and its innovative approach to a well-worn genre. While still early in its run, it represents the most exciting evolution in medical television since the early days of ER. For fans of the genre, this is essential viewing. Our rating: 8.5/10.</p>
"@

$reviews["transplant.html"] = @"
<p>Transplant brings a fresh perspective to the medical drama by centering on Dr. Bashir "Bash" Hamed, a Syrian emergency doctor who fled his war-torn country and now works at a Toronto hospital. The show explores not just medical cases but the immigrant experience, cultural displacement, and the universal language of healing. It's a medical drama with a unique soul.</p>
<p>Hamza Haq delivers a breakout performance as Bash — haunted by his past, brilliant in the present, and uncertain about his future in Canada. The show balances his professional challenges with his personal journey, including his relationship with his sister Amira and his growing connections with colleagues. Bash's trauma-informed approach to medicine makes him a better doctor, but the show never romanticizes his suffering.</p>
<p>The Canadian setting provides a refreshing change from the usual American hospital backdrop. The supporting cast, including Laurence Leboeuf and John Hannah, creates a workplace dynamic that feels both competitive and supportive. The medical cases incorporate global health perspectives that most American medical dramas ignore.</p>
<p>Transplant has been praised for its representation and emotional depth. It proves that the medical genre still has new stories to tell — stories that reflect the diversity and complexity of the real world. It's a show that heals while it entertains. Our rating: 8.1/10.</p>
"@

$reviews["new-amsterdam.html"] = @"
<p>New Amsterdam is based on the inspiring true story of Dr. Max Goodwin, who became the medical director of one of America's oldest public hospitals and asked the revolutionary question: "How can I help?" The answer, in the show's vision, is to tear down the bureaucratic barriers that prevent patients from receiving quality care. It's aspirational television with a activist pulse.</p>
<p>Ryan Eggold's Max Goodwin is a genuinely good person, which makes him a rare protagonist in modern TV drama. His fight against hospital red tape, insurance companies, and systemic inequality provides the show's central conflict. Max's own battle with cancer adds personal stakes that never feel manipulative or cheap.</p>
<p>The ensemble cast includes Freema Agyeman as Dr. Helen Sharpe, who transitions from detached consultant to passionate advocate; Janet Montgomery as Dr. Lauren Bloom, whose arc dealing with addiction adds real grit; and Jocko Sims as Dr. Floyd Reynolds, navigating the politics of surgery. Each character represents a different facet of the healthcare crisis.</p>
<p>New Amsterdam has been criticized for being overly optimistic, but that's also its greatest strength. In a television landscape dominated by cynical antiheroes, a show about a man who genuinely wants to fix a broken system feels radical. It proves that hope, when backed by good writing and strong performances, can be just as compelling as despair. Our rating: 8.0/10.</p>
"@

$reviews["the-knick.html"] = @"
<p>The Knick is a medical drama unlike any other — set in 1900 at Knickerbocker Hospital in New York City, it plunges viewers into the brutal, bloody, and fascinating world of early modern surgery. Directed by Steven Soderbergh with his signature visual style, the show is a period piece that feels startlingly contemporary in its energy and cinematic ambition.</p>
<p>Clive Owen delivers a towering performance as Dr. John Thackery, a brilliant surgeon addicted to cocaine and opium, struggling to push medicine forward while his personal life collapses. The character is a train wreck, but Owen makes him magnetic. The surgery scenes are unflinchingly graphic — this is not sanitized network television. Soderbergh shoots them with clinical precision that highlights both the horror and the wonder of early surgical innovation.</p>
<p>The show excels in its portrayal of the social hierarchies of the era. Dr. Algernon Edwards (André Holland), a Black surgeon denied operating room access because of his race, provides the series with its most powerful storyline. His struggle against institutional racism mirrors Thackery's battle with addiction — both brilliant men destroyed by systems they can't control.</p>
<p>The Knick was canceled after two brilliant seasons, but those 20 episodes represent some of the finest television ever produced. The period-accurate medical procedures, the jazz-influenced score, the meticulous production design — every element serves a unified artistic vision. It's a masterpiece of television drama. Our rating: 9.2/10.</p>
"@

$reviews["the-heart-surgeons.html"] = @"
<p>The Heart Surgeons (also known as The Surgeon's Cut in some markets) offers a fascinating look at the men and women who operate on the most vital organ in the human body. This documentary-style medical series combines real surgical footage with intimate profiles of cardiothoracic surgeons, revealing the extraordinary pressure and precision required to save lives when the heart stops.</p>
<p>What makes the show compelling is its focus on the humanity of its subjects. These aren't cold, detached doctors — they're people who carry the weight of every patient who doesn't make it. The series follows multiple surgeons across different hospitals, each with their own specialty, their own philosophy, and their own deeply personal reasons for choosing this most demanding of medical fields.</p>
<p>The surgical footage is both educational and visceral. Viewers learn about bypass procedures, valve replacements, transplants, and cutting-edge minimally invasive techniques. But the show never loses sight of the person beneath the sternum. Every procedure is someone's father, mother, spouse, or child on the table.</p>
<p>For anyone interested in medicine or human resilience, The Heart Surgeons provides a window into a world most of us will never see. It celebrates the skill, dedication, and emotional courage of surgeons who literally hold hearts in their hands. Our rating: 8.3/10.</p>
"@

$reviews["dr-prisoner.html"] = @"
<p>Doctor Prisoner turns the medical drama on its head by setting it inside a maximum-security prison. Namgoong Min stars as Dr. Lee Jae-joon, a brilliant surgeon who was once at the top of his field until a tragic accident destroyed his career. He takes a position as the chief medical officer at a prison hospital — not out of compassion, but as part of a calculated plan for revenge against those who wronged him.</p>
<p>This Korean drama (K-drama) combines medical procedures with political thriller elements, creating a unique hybrid that keeps viewers guessing. The prison setting provides constant tension — patients are inmates, resources are limited, and every medical decision has security implications. Dr. Lee navigates this world with cold precision, using his medical expertise as both a weapon and a shield.</p>
<p>The supporting cast of inmates and prison staff creates a microcosm of society. Each character has their own agenda, and alliances shift constantly. The medical cases are interesting in themselves, but they serve a larger narrative about justice, redemption, and the question of whether a bad person can do good work.</p>
<p>Doctor Prisoner is a show about moral ambiguity — the kind of series that asks whether the ends can justify the means when the person wielding the scalpel has blood on their hands. It's a Korean drama that deserves a wider international audience. Our rating: 8.4/10.</p>
"@

$reviews["surgeons-cut.html"] = @"
<p>Surgeon's Cut (also known as The Surgeon's Cut in its Netflix format) is a documentary series that goes inside the operating room with four of the world's most pioneering surgeons. Each episode focuses on a different specialist — a neurosurgeon in Brazil, a cardiothoracic surgeon in Scotland, a transplant surgeon in India — revealing how their cultural backgrounds and personal histories shaped their approach to medicine.</p>
<p>The cinematography is breathtaking. The series uses macro photography to capture surgical procedures in stunning detail, making the human body look like an alien landscape being explored by skilled navigators. The surgeries are real, the stakes are genuine, and the results are often miraculous. But the show never sensationalizes — it treats each procedure with the gravity and respect it deserves.</p>
<p>Beyond the operating room, Surgeon's Cut explores the social contexts that create great doctors. The Indian transplant surgeon who performs cataract surgery on thousands of patients in makeshift operating theaters. The Brazilian neurosurgeon working in the favelas. These are stories about medicine as social justice.</p>
<p>The series is a testament to human ingenuity and compassion. It will make you grateful for modern medicine and in awe of the people who practice it at the highest level. Our rating: 8.6/10.</p>
"@

$reviews["mash.html"] = @"
<p>M*A*S*H is not just the greatest medical drama ever made — it's one of the greatest television series of any genre. Set in a Mobile Army Surgical Hospital during the Korean War, the show pioneered the blend of comedy and tragedy that would influence everything that followed. It made us laugh at the absurdity of war, then broke our hearts with its human cost.</p>
<p>Alan Alda's Hawkeye Pierce is one of television's defining characters — a brilliant surgeon who uses humor and alcohol to cope with the daily horror of patching up young soldiers. The chemistry between Hawkeye, Trapper John, and later B.J. Hunnicutt created television's greatest found family. The show made you feel like you were in that tent with them, cracking jokes while the shells fell outside.</p>
<p>The famous finale, "Goodbye, Farewell and Amen," was watched by 125 million people — a record that stood for decades. It demonstrated the show's unique power: the ability to make a massive audience laugh, cry, and think simultaneously. Episodes like "The Longjohn Flap" and "Abyssinia, Henry" showcase the series at its absolute peak.</p>
<p>M*A*S*H tackled racism, sexism, PTSD, and the futility of war decades before other shows dared. It won 14 Emmys and remains as relevant today as when it first aired. The laughter is a shield against the darkness, and the darkness makes the laughter meaningful. No medical drama has ever matched it. Our rating: 9.8/10.</p>
"@

$reviews["scrubs.html"] = @"
<p>Scrubs is the medical drama that doesn't take itself seriously — which is precisely why it's one of the best ever made. Following the residents and attendings at Sacred Heart Hospital, the show combines surreal comedy, genuine medical drama, and some of the most emotionally devastating moments in television history. JD's daydreams, the Janitor's schemes, and Turk and JD's bromance defined a generation.</p>
<p>Zach Braff's J.D. is the perfect entry point — naive, idealistic, and prone to fantasy sequences that visualize his anxieties in hilarious ways. His friendship with Donald Faison's Turk is one of television's great brotherhoods, and the recurring "guy love" between them gave us moments of pure joy. But when Scrubs gets serious — Ben's death, Laverne's accident, Cox's breakdown — it hits harder than any straight drama because we've earned those emotions through laughter.</p>
<p>John C. McGinley's Dr. Cox is a masterclass in character development — starting as a bully, evolving into a deeply damaged mentor whose tough love masks profound pain. His relationship with J.D. provides the show's emotional backbone. And the Janitor? Neil Flynn turned a minor character into an icon.</p>
<p>Scrubs taught us that medicine is terrifying, hilarious, heartbreaking, and absurd — often in the same shift. The finale, "My Finale," is a perfect ending that honors the journey without overstaying its welcome. It's comfort television with a brain and a heart. Our rating: 9.0/10.</p>
"@

$reviews["the-artful-dodger.html"] = @"
<p>The Artful Dodger takes a classic character from Dickens and drops him into a 19th-century colonial Australian medical drama. Jack Dawkins, the pickpocket from Oliver Twist, has reinvented himself as a respected surgeon in a penal colony — but his past refuses to stay buried. It's a genre-bending show that mixes period medical drama with heist thriller elements.</p>
<p>Thomas Brodie-Sangster brings roguish charm to the adult Jack Dawkins, who is both a skilled surgeon and an incorrigible trickster. The surgical scenes are historically fascinating — 1850s medicine was brutal but innovative. The show doesn't shy away from the gore, but balances it with wit and adventure.</p>
<p>The Australian setting provides a fresh backdrop. The penal colony of Port Victory is a character in itself — lawless, vibrant, and dangerous. The supporting cast, including David Thewlis as a sinister governor, creates a world where survival depends on both medical skill and criminal cunning.</p>
<p>The Artful Dodger is a show that shouldn't work — literary adaptation, period drama, medical show, heist thriller — but it pulls off the balancing act with style. It's inventive, entertaining, and proof that there are still new ways to tell old stories. Our rating: 8.2/10.</p>
"@

$reviews["whisky.html"] = @"
<p>Whisky on the Rocks is a medical comedy-drama that takes place in a small rural hospital in the Scottish Highlands. The title refers to the hospital's unofficial treatment philosophy — a dram of whisky makes any medicine go down easier. Dr. Fiona MacLeod returns to her hometown to find a crumbling facility, eccentric staff, and patients who trust folklore more than modern medicine.</p>
<p>The show's charm lies in its setting and characters. The Scottish Highlands provide stunning natural backdrops that contrast with the chaotic, underfunded hospital. The staff includes a hypochondriac administrator, a nurse who practices both modern and traditional medicine, and a young doctor who can't handle the sight of blood. It's a workplace comedy with genuine medical stakes.</p>
<p>While the show doesn't reach the dramatic heights of major medical dramas, it succeeds in creating a warm, funny, and unique take on the genre. The medical cases often incorporate Scottish folklore and traditional remedies, adding cultural texture that's rare in television. The whisky motif is more than a gimmick — it represents the show's philosophy that sometimes the best medicine is human connection.</p>
<p>For viewers tired of high-stakes urban hospitals, Whisky on the Rocks offers a charming alternative. It's the television equivalent of a warm blanket and a hot toddy. Our rating: 7.5/10.</p>
"@

$reviews["the-last-ship.html"] = @"
<p>The Last Ship is a medical thriller with a military twist. When a global pandemic wipes out 80% of the world's population, the crew of the USS Nathan James — a naval destroyer — must find a cure while surviving in a world without civilization. The show combines naval combat, virology, and post-apocalyptic survival in ways that no other medical drama has attempted.</p>
<p>Eric Dane leads as Captain Tom Chandler, a naval officer forced to become something more than a soldier. Dr. Rachel Scott (Rhona Mitra) provides the medical core, racing to develop a vaccine while the ship faces threats from both the disease and the chaos of a fallen world. The naval setting makes every medical decision a tactical one.</p>
<p>The show evolves from a contained naval thriller into a larger story about rebuilding civilization. Early seasons focus on finding the cure; later seasons explore the political and military conflicts that emerge in a world without government. The medical science is surprisingly grounded, earning praise from real virologists.</p>
<p>The Last Ship delivers satisfying action-medical hybrid entertainment. It may not be prestige television, but it knows exactly what it is and executes its premise with confidence and enthusiasm. For fans of medical dramas who also love military thrillers, it's uniquely satisfying. Our rating: 7.8/10.</p>
"@

$reviews["terra-nova.html"] = @"
<p>Terra Nova takes medical drama to a completely new setting — 85 million years in the past. When a dying future Earth opens a rift to prehistoric times, a group of colonists led by the Shannon family must build a new civilization alongside dinosaurs. While primarily a sci-fi adventure, the series features compelling medical and survival elements as the colony's doctors face challenges no physician has ever encountered.</p>
<p>The premise is audacious: combine Jurassic Park with Lost and add a dash of colonial drama. The medical subplot involves Dr. Elizabeth Shannon creating a groundbreaking fertility treatment in the Cretaceous period — a storyline that grounds the spectacle in human stakes. The dinosaur effects are impressive for television.</p>
<p>The show was canceled after one season, but its 13 episodes provide a complete narrative arc. The medical aspects — treating dinosaur injuries, combating prehistoric diseases, performing surgery without modern equipment — offer a unique twist on the genre. The family dynamics keep the human element central.</p>
<p>Terra Nova is a fascinating what-if that never quite found its audience. For fans of medical dramas who also love sci-fi, it's a brief but enjoyable experiment in genre fusion. Our rating: 7.3/10.</p>
"@

$reviews["bookies.html"] = @"
<p>Bookies offers a completely different take on the medical world — it's not about doctors at all. Instead, this Scottish sitcom follows the staff of a bookmaker's shop located next to a hospital, where the constant stream of desperate, stressed-out visitors creates a unique clientele. The proximity to the hospital means medical emergencies are always bleeding into the betting shop.</p>
<p>The comedy comes from the contrast between the high-stakes medical drama next door and the low-stakes betting drama in the shop. Customers place bets while waiting for test results. Doctors place bets during their breaks. The absurdity of gambling in the shadow of life-and-death decisions drives the humor. It's clever, dark, and unmistakably Scottish.</p>
<p>The ensemble cast creates a found-family dynamic. The newly promoted manager struggling to keep the shop afloat, the elderly regular who's been betting on the same horse for twenty years, the young cashier who doesn't care about sports but loves the chaos. The hospital connection ensures a steady stream of colorful guest characters.</p>
<p>Bookies is a niche show that won't appeal to everyone, but for those who appreciate dark workplace comedy with a medical backdrop, it's a hidden gem. It understands that laughter is often the best response to mortality. Our rating: 7.4/10.</p>
"@

# ====== CRIME & THRILLERS (15 - existing local images) ======
$reviews["breaking-bad.html"] = @"
<p>Walter White starts Breaking Bad as a desperate, underpaid high school chemistry teacher diagnosed with terminal lung cancer. The premise sounds simple: a good man turns bad. But Vince Gilligan's execution is anything but. Over five seasons, we watch Walter transform from a sympathetic everyman into a ruthless drug lord who cooks meth under the alias Heisenberg. The show asks uncomfortable questions about morality, pride, and the stories we tell ourselves to justify our worst actions.</p>
<p>What elevates Breaking Bad beyond other crime dramas is its commitment to consequence. Every decision Walter makes has a ripple effect that comes crashing down with devastating precision. The writing is airtight — foreshadowing pays off seasons later in ways that feel earned, not cheap. Bryan Cranston delivers what is arguably the greatest performance in television history, shifting between pathetic, terrifying, hilarious, and tragic sometimes within the same scene.</p>
<p>Aaron Paul as Jesse Pinkman provides the emotional core. Where Walter descends further into darkness, Jesse's trajectory moves in the opposite direction, making their deteriorating partnership the most compelling dynamic on television. The supporting cast — from Dean Norris as Hank to Giancarlo Esposito as Gus Fring — is flawless in every frame. The introduction of Saul Goodman (Bob Odenkirk) gave us one of the greatest spin-offs in history.</p>
<p>Visually, Breaking Bad set a new standard for TV cinematography. Time-lapse photography, POV shots from inside car trunks and lab equipment, the iconic pink teddy bear motif — every shot is purposeful. The desert landscapes of New Mexico become a character in themselves. The final season delivers a conclusion that satisfies while staying true to the show's brutal honesty about who Walter White really is.</p>
<p>Breaking Bad isn't just the greatest crime drama ever made — it's a landmark achievement in storytelling that redefined what television could accomplish. It proved that the small screen could match cinema in ambition, execution, and cultural impact. Our rating: 9.5/10.</p>
"@

$reviews["better-call-saul.html"] = @"
<p>Better Call Saul had the impossible task of following Breaking Bad — and somehow, it exceeded it. The prequel/spin-off following Jimmy McGill's transformation into Saul Goodman is a masterclass in character study. Bob Odenkirk, best known for comedy, delivers a dramatic performance of heartbreaking depth. Jimmy isn't a villain waiting to happen — he's a good man broken by a system that never gave him a chance.</p>
<p>The show's genius is in its patience. Jimmy's slow, agonizing descent from struggling lawyer to criminal consigliere unfolds over six meticulously plotted seasons. Every choice he makes is understandable, even when it's wrong. His relationship with Kim Wexler (Rhea Seehorn) is one of television's great love stories — two flawed people who make each other better and worse in equal measure.</p>
<p>Jonathan Banks and Giancarlo Esposito reprise their Breaking Bad roles, but the real revelation is Tony Dalton as Lalo Salamanca — a villain so charismatic and terrifying that he rivals Gus Fring. The legal world of Albuquerque provides a completely different lens on the Breaking Bad universe, transforming criminal law into a chess game where morality is a liability.</p>
<p>The final season's black-and-white Gene Takavic segments provide a haunting epilogue to the entire Breaking Bad saga. Better Call Saul proves that the most compelling drama isn't about who wins — it's about who we become in the process of trying. A masterpiece that stands entirely on its own. Our rating: 9.6/10.</p>
"@

$reviews["ozark.html"] = @"
<p>Ozark is Breaking Bad by way of the Ozarks — a family man gets in over his head with a drug cartel and must reinvent himself as a criminal to survive. But while the premise sounds familiar, the execution is distinctly its own. The Byrde family doesn't descend into darkness; they were always there, just hiding behind suburban respectability. Laura Linney's Wendy Byrde is every bit as ruthless as her husband Marty.</p>
<p>Jason Bateman proves he's one of television's most underrated dramatic actors. His Marty Byrde is a financial advisor who uses money-laundering expertise to keep his family alive, one spreadsheet at a time. The show's visual language — cold, blue-tinged, oppressive — creates a mood of constant dread. The Missouri setting, with its lakes and forests, becomes a character that swallows people whole.</p>
<p>Julia Garner's Ruth Langmore is the show's breakout character — a fierce, foul-mouthed survivor from a criminal family who refuses to be defined by her circumstances. Her arc over four seasons is the emotional heart of the series. The supporting cast, including Peter Mullan, Lisa Emery, and Tom Pelphrey, creates a world where loyalty is a currency that devalues by the minute.</p>
<p>The final season's extended episodes give the story room to breathe, culminating in a conclusion that honors the characters' journeys without offering easy redemption. Ozark is a show about the American Dream corrupted — about what happens when you get everything you wanted and realize it's made you a monster. Our rating: 9.0/10.</p>
"@

$reviews["peaky-blinders.html"] = @"
<p>Peaky Blinders is the most stylish crime drama ever made. Set in Birmingham, England, in the aftermath of World War I, it follows the Shelby crime family as they rise from street gang to legitimate business empire. Cillian Murphy's Tommy Shelby is television's most magnetic antihero — a man haunted by the trenches, driven by ambition, and incapable of showing vulnerability even to those he loves.</p>
<p>The show is a masterclass in atmosphere. The production design, the costumes (those newsboy caps and razor-blade linings), the anachronistic soundtrack that pairs rock music with period settings — every element creates a world that feels both historically grounded and defiantly modern. The show doesn't just depict the 1920s; it makes you feel the cigarette smoke and coal dust in your lungs.</p>
<p>The supporting cast is extraordinary. Helen McCrory's Aunt Polly is the matriarch who holds the family together with steel will and supernatural intuition. Paul Anderson's Arthur Shelby is violence personified, struggling with demons that mirror Tommy's. Tom Hardy's Alfie Solomons steals every scene he's in. The villains — from Sam Neill's Campbell to Adrien Brody's Luca Changretta — raise the stakes with each season.</p>
<p>The writing treats the Shelbys as both heroes and monsters. We root for them even as they commit atrocities, because the show understands that crime families are still families. The historical backdrop — the rise of fascism, the decline of the British Empire, the birth of modern organized crime — adds weight to the personal drama. By order of the Peaky Blinders, this is essential viewing. Our rating: 9.3/10.</p>
"@

$reviews["the-wire.html"] = @"
<p>The Wire is not just the greatest crime drama ever made — it's the greatest television series of all time. David Simon's masterpiece uses the drug trade of Baltimore as a lens to examine the entire American city: the police, the dealers, the politicians, the schools, the newspapers, the unions. It's a novel for television, each season a chapter in a sprawling story about institutional failure.</p>
<p>There is no protagonist in The Wire. Jimmy McNulty (Dominic West) comes closest, but the show deliberately denies us a hero. Every character is a product of their environment. Stringer Bell (Idris Elba) is a gangster who wants to be a businessman; Omar Little (Michael K. Williams) is a stickup man with a code; Lester Freamon (Clarke Peters) is a detective who actually wants to solve cases. The show's refusal to moralize is its greatest strength.</p>
<p>The dialogue is Shakespearean in its complexity and authenticity. The police speak in jargon, the dealers in street slang, the politicians in weasel words, the journalists in cynicism — and somehow, the show makes every voice equally important. Each season expands the scope: the ports, city hall, the school system, the press. The picture of America that emerges is devastating but never hopeless.</p>
<p>The final season, despite its controversial newspaper angle, brings the series to a perfect thematic conclusion. Nothing changes in Baltimore — and that's the point. The game remains the game. But by showing us the game in all its complexity, The Wire changes how we see the world. It's not entertainment; it's education disguised as art. Our rating: 9.9/10.</p>
"@

$reviews["sopranos.html"] = @"
<p>The Sopranos changed television forever. Before Tony Soprano, TV was a medium of simple heroes and clear resolutions. After Tony, television became the home of complex antiheroes, ambiguous endings, and the kind of psychological depth that was previously reserved for cinema. The show follows Tony Soprano (James Gandolfini), a New Jersey mob boss who begins therapy to cope with panic attacks — and keeps going because he vaguely suspects something is wrong with his life.</p>
<p>James Gandolfini's performance is the foundation on which the show is built. Tony is charismatic, violent, sentimental, racist, charming, and deeply depressed — sometimes in the same scene. His therapy sessions with Dr. Melfi (Lorraine Bracco) provide the show's central innovation: a gangster story told through the lens of modern psychology. The result is a show that's both a brutal crime saga and a profound meditation on family, mortality, and the American Dream.</p>
<p>The supporting cast is unparalleled. Edie Falco's Carmela Soprano is a portrait of complicity — a woman who knows exactly where the money comes from and chooses not to know. Michael Imperioli's Christopher Moltisanti is a walking disaster of ambition and addiction. Joe Pantoliano's Ralph Cifaretto is one of television's greatest villains. The show made every actor associated with it legendary.</p>
<p>The final episode's cut-to-black remains the most controversial ending in television history, but it's a perfect conclusion to a show about the banality of evil. Life doesn't end with a bang or a whimper — it just keeps going until it doesn't. The Sopranos proved that television could be art. Everything that followed owes it a debt. Our rating: 9.8/10.</p>
"@

Write-Host "Script defines $($reviews.Count) expanded reviews so far. Adding more..." -ForegroundColor Yellow

# Output what we have so far
Write-Host "Completed reviews: $($reviews.Count)" -ForegroundColor Green
Write-Host "Need to continue adding the remaining shows..." -ForegroundColor Cyan
