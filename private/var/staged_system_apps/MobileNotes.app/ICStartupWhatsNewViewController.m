@interface ICStartupWhatsNewViewController
- (BOOL)isHandwritingRefinementSupported;
- (ICModelAvailabilityManager)modelAvailabilityManager;
- (id)startupNavigationController;
- (unint64_t)audioRecordingSupport;
- (unint64_t)callRecordingSupport;
- (void)addAudioItemWithTranscription:(BOOL)a3 summarization:(BOOL)a4;
- (void)addButtons;
- (void)addCallItemWithTranscription:(BOOL)a3 summarization:(BOOL)a4;
- (void)addCollapsibleSectionsItem;
- (void)addHandwrittenNotesItem;
- (void)addHighlightItemWithCollapseText:(BOOL)a3;
- (void)addItems;
- (void)addItemsForVision;
- (void)addItemsForiPad;
- (void)addItemsForiPhone;
- (void)addLotsMoreItem;
- (void)addMathNotesItemWithHandwriting:(BOOL)a3 compact:(BOOL)a4;
- (void)didTapContinueButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICStartupWhatsNewViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)ICStartupWhatsNewViewController;
  [(ICStartupWhatsNewViewController *)&v4 viewDidLoad];
  [(ICStartupWhatsNewViewController *)self addItems];
  [(ICStartupWhatsNewViewController *)self addButtons];
  v3 = [(ICStartupWhatsNewViewController *)self view];
  [v3 setAccessibilityViewIsModal:1];
}

- (ICModelAvailabilityManager)modelAvailabilityManager
{
  return +[ICModelAvailabilityManager sharedInstance];
}

- (unint64_t)audioRecordingSupport
{
  v3 = [(ICStartupWhatsNewViewController *)self modelAvailabilityManager];
  if ([v3 supportsGreymatter])
  {
    unint64_t v4 = 3;
  }
  else
  {
    v5 = [(ICStartupWhatsNewViewController *)self modelAvailabilityManager];
    if ([v5 supportsGeneralASR]) {
      unint64_t v4 = 2;
    }
    else {
      unint64_t v4 = 1;
    }
  }
  return v4;
}

- (unint64_t)callRecordingSupport
{
  v3 = [(ICStartupWhatsNewViewController *)self modelAvailabilityManager];
  if ([v3 supportsGreymatter])
  {
    unint64_t v4 = 3;
  }
  else
  {
    v5 = [(ICStartupWhatsNewViewController *)self modelAvailabilityManager];
    if ([v5 supportsCallTranscription])
    {
      unint64_t v4 = 2;
    }
    else
    {
      v6 = [(ICStartupWhatsNewViewController *)self modelAvailabilityManager];
      unint64_t v4 = [v6 supportsCallRecording];
    }
  }

  return v4;
}

- (BOOL)isHandwritingRefinementSupported
{
  return +[PKRecognitionController currentDeviceSupportsAutoRefine];
}

- (void)addButtons
{
  id v7 = +[OBBoldTrayButton boldButton];
  v3 = [v7 configuration];
  unint64_t v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"Continue" value:&stru_10063F3D8 table:0];
  [v3 setTitle:v5];

  [v7 setConfiguration:v3];
  [v7 addTarget:self action:"didTapContinueButton:" forControlEvents:0x2000];
  v6 = [(ICStartupWhatsNewViewController *)self buttonTray];
  [v6 addButton:v7];
}

- (void)addItems
{
  if (+[UIDevice ic_isVision])
  {
    [(ICStartupWhatsNewViewController *)self addItemsForVision];
  }
  else if (+[UIDevice ic_isiPad])
  {
    [(ICStartupWhatsNewViewController *)self addItemsForiPad];
  }
  else
  {
    [(ICStartupWhatsNewViewController *)self addItemsForiPhone];
  }
}

- (void)addItemsForVision
{
  [(ICStartupWhatsNewViewController *)self addMathNotesItemWithHandwriting:0 compact:1];
  [(ICStartupWhatsNewViewController *)self addHighlightItemWithCollapseText:0];
  [(ICStartupWhatsNewViewController *)self addCollapsibleSectionsItem];

  [(ICStartupWhatsNewViewController *)self addAudioItemWithTranscription:0 summarization:0];
}

- (void)addItemsForiPad
{
  unint64_t v3 = [(ICStartupWhatsNewViewController *)self audioRecordingSupport];
  unint64_t v4 = [(ICStartupWhatsNewViewController *)self audioRecordingSupport];
  unsigned int v5 = [(ICStartupWhatsNewViewController *)self isHandwritingRefinementSupported];
  if (v4 == 3)
  {
    uint64_t v6 = 1;
    goto LABEL_5;
  }
  if (v3 >= 2)
  {
    uint64_t v6 = 0;
LABEL_5:
    [(ICStartupWhatsNewViewController *)self addAudioItemWithTranscription:1 summarization:v6];
    if (v5)
    {
      [(ICStartupWhatsNewViewController *)self addHandwrittenNotesItem];
      [(ICStartupWhatsNewViewController *)self addMathNotesItemWithHandwriting:1 compact:0];
      [(ICStartupWhatsNewViewController *)self addHighlightItemWithCollapseText:1];
    }
    else
    {
      [(ICStartupWhatsNewViewController *)self addMathNotesItemWithHandwriting:1 compact:0];
      [(ICStartupWhatsNewViewController *)self addHighlightItemWithCollapseText:0];
      [(ICStartupWhatsNewViewController *)self addCollapsibleSectionsItem];
    }
    return;
  }
  if (v5)
  {
    [(ICStartupWhatsNewViewController *)self addHandwrittenNotesItem];
    [(ICStartupWhatsNewViewController *)self addMathNotesItemWithHandwriting:1 compact:0];
    [(ICStartupWhatsNewViewController *)self addHighlightItemWithCollapseText:1];
  }
  else
  {
    [(ICStartupWhatsNewViewController *)self addMathNotesItemWithHandwriting:0 compact:0];
    [(ICStartupWhatsNewViewController *)self addHighlightItemWithCollapseText:0];
    [(ICStartupWhatsNewViewController *)self addCollapsibleSectionsItem];
  }

  [(ICStartupWhatsNewViewController *)self addAudioItemWithTranscription:0 summarization:0];
}

- (void)addItemsForiPhone
{
  unint64_t v3 = [(ICStartupWhatsNewViewController *)self audioRecordingSupport];
  unint64_t v4 = [(ICStartupWhatsNewViewController *)self audioRecordingSupport];
  unint64_t v5 = [(ICStartupWhatsNewViewController *)self callRecordingSupport];
  unint64_t v6 = [(ICStartupWhatsNewViewController *)self callRecordingSupport];
  unint64_t v7 = [(ICStartupWhatsNewViewController *)self callRecordingSupport];
  if (v4 == 3 && v7 == 3)
  {
    [(ICStartupWhatsNewViewController *)self addAudioItemWithTranscription:1 summarization:1];
    v8 = self;
    uint64_t v9 = 1;
    uint64_t v10 = 1;
LABEL_13:
    [(ICStartupWhatsNewViewController *)v8 addCallItemWithTranscription:v9 summarization:v10];
    [(ICStartupWhatsNewViewController *)self addMathNotesItemWithHandwriting:0 compact:1];
    [(ICStartupWhatsNewViewController *)self addHighlightItemWithCollapseText:1];
    return;
  }
  if (v3 >= 2 && v6 >= 2)
  {
    v11 = self;
    uint64_t v12 = 1;
LABEL_11:
    [(ICStartupWhatsNewViewController *)v11 addAudioItemWithTranscription:v12 summarization:0];
    v8 = self;
    uint64_t v9 = 1;
    goto LABEL_12;
  }
  v11 = self;
  if (v6 >= 2)
  {
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  if (v5 == 1)
  {
    [(ICStartupWhatsNewViewController *)self addAudioItemWithTranscription:0 summarization:0];
    v8 = self;
    uint64_t v9 = 0;
LABEL_12:
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  [(ICStartupWhatsNewViewController *)self addMathNotesItemWithHandwriting:0 compact:1];
  [(ICStartupWhatsNewViewController *)self addHighlightItemWithCollapseText:0];
  [(ICStartupWhatsNewViewController *)self addCollapsibleSectionsItem];

  [(ICStartupWhatsNewViewController *)self addAudioItemWithTranscription:0 summarization:0];
}

- (void)addAudioItemWithTranscription:(BOOL)a3 summarization:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = +[NSBundle mainBundle];
  v8 = v7;
  if (a3)
  {
    id v14 = [v7 localizedStringForKey:@"Audio Transcripts" value:&stru_10063F3D8 table:0];

    uint64_t v9 = +[NSBundle mainBundle];
    uint64_t v10 = v9;
    if (v4) {
      CFStringRef v11 = @"Record and transcribe audio, and have your device summarize the recording.";
    }
    else {
      CFStringRef v11 = @"Record and transcribe audio in your note.";
    }
  }
  else
  {
    id v14 = [v7 localizedStringForKey:@"Audio Recording" value:&stru_10063F3D8 table:0];

    uint64_t v9 = +[NSBundle mainBundle];
    uint64_t v10 = v9;
    CFStringRef v11 = @"Record audio directly in Notes.";
  }
  uint64_t v12 = [v9 localizedStringForKey:v11 value:&stru_10063F3D8 table:0];

  v13 = +[UIImage ic_systemImageNamed:@"waveform"];
  [(ICStartupWhatsNewViewController *)self addBulletedListItemWithTitle:v14 description:v12 image:v13];
}

- (void)addCallItemWithTranscription:(BOOL)a3 summarization:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = +[NSBundle mainBundle];
  v8 = v7;
  if (a3)
  {
    id v14 = [v7 localizedStringForKey:@"Call Transcripts" value:&stru_10063F3D8 table:0];

    uint64_t v9 = +[NSBundle mainBundle];
    uint64_t v10 = v9;
    if (v4) {
      CFStringRef v11 = @"Capture a phone conversation as text and audio, then view a summary of the call.";
    }
    else {
      CFStringRef v11 = @"Capture a phone conversation as text and audio.";
    }
  }
  else
  {
    id v14 = [v7 localizedStringForKey:@"Call Recording" value:&stru_10063F3D8 table:0];

    uint64_t v9 = +[NSBundle mainBundle];
    uint64_t v10 = v9;
    CFStringRef v11 = @"Start a recording while you’re on a call.";
  }
  uint64_t v12 = [v9 localizedStringForKey:v11 value:&stru_10063F3D8 table:0];

  v13 = +[UIImage ic_systemImageNamed:@"phone.badge.waveform.fill"];
  [(ICStartupWhatsNewViewController *)self addBulletedListItemWithTitle:v14 description:v12 image:v13];
}

- (void)addCollapsibleSectionsItem
{
  unint64_t v3 = +[NSBundle mainBundle];
  id v7 = [v3 localizedStringForKey:@"Collapsible Sections" value:&stru_10063F3D8 table:0];

  BOOL v4 = +[NSBundle mainBundle];
  unint64_t v5 = [v4 localizedStringForKey:@"Collapse text under a header to simplify your note’s appearance." value:&stru_10063F3D8 table:0];

  unint64_t v6 = +[UIImage ic_systemImageNamed:@"chevron.forward"];
  [(ICStartupWhatsNewViewController *)self addBulletedListItemWithTitle:v7 description:v5 image:v6];
}

- (void)addHandwrittenNotesItem
{
  unint64_t v3 = +[NSBundle mainBundle];
  id v7 = [v3 localizedStringForKey:@"Beautiful, Handwritten Notes", &stru_10063F3D8, 0 value table];

  BOOL v4 = +[NSBundle mainBundle];
  unint64_t v5 = [v4 localizedStringForKey:@"Your handwriting is refined automatically as you write and can reflow to the next line like typed text." value:&stru_10063F3D8 table:0];

  unint64_t v6 = +[UIImage ic_systemImageNamed:@"pencil.and.outline"];
  [(ICStartupWhatsNewViewController *)self addBulletedListItemWithTitle:v7 description:v5 image:v6];
}

- (void)addHighlightItemWithCollapseText:(BOOL)a3
{
  unint64_t v5 = +[NSBundle mainBundle];
  unint64_t v6 = v5;
  if (a3)
  {
    id v12 = [v5 localizedStringForKey:@"Highlight and Collapse Text" value:&stru_10063F3D8 table:0];

    id v7 = +[NSBundle mainBundle];
    v8 = v7;
    CFStringRef v9 = @"Highlight text to emphasize it, or collapse text under a header to simplify your note’s appearance.";
  }
  else
  {
    id v12 = [v5 localizedStringForKey:@"Highlighting" value:&stru_10063F3D8 table:0];

    id v7 = +[NSBundle mainBundle];
    v8 = v7;
    CFStringRef v9 = @"Highlight text to emphasize it with color.";
  }
  uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_10063F3D8 table:0];

  CFStringRef v11 = +[UIImage ic_systemImageNamed:@"highlighter"];
  [(ICStartupWhatsNewViewController *)self addBulletedListItemWithTitle:v12 description:v10 image:v11];
}

- (void)addLotsMoreItem
{
  unint64_t v3 = +[NSBundle mainBundle];
  id v7 = [v3 localizedStringForKey:@"And Lots More…" value:&stru_10063F3D8 table:0];

  BOOL v4 = +[NSBundle mainBundle];
  unint64_t v5 = [v4 localizedStringForKey:@"Collapse text under headers, highlight text, and create images with the new Image Wand tool.", &stru_10063F3D8, 0 value table];

  unint64_t v6 = +[UIImage ic_systemImageNamed:@"surprisebox"];
  [(ICStartupWhatsNewViewController *)self addBulletedListItemWithTitle:v7 description:v5 image:v6];
}

- (void)addMathNotesItemWithHandwriting:(BOOL)a3 compact:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = +[NSBundle mainBundle];
  id v14 = [v7 localizedStringForKey:@"Math in Notes" value:&stru_10063F3D8 table:0];

  v8 = +[NSBundle mainBundle];
  CFStringRef v9 = v8;
  CFStringRef v10 = @"Type an expression into your note to have it solve automatically. You can also find notes you created in the Calculator app in the new Math Notes folder.";
  if (v5) {
    CFStringRef v10 = @"Type or handwrite an expression into your note to have it solve automatically. You can also find notes you created in the Calculator app in the new Math Notes folder.";
  }
  if (v4) {
    CFStringRef v11 = @"Type an expression into your note to have it solve automatically.";
  }
  else {
    CFStringRef v11 = v10;
  }
  id v12 = [v8 localizedStringForKey:v11 value:&stru_10063F3D8 table:0];

  v13 = +[UIImage ic_systemImageNamed:@"math.operators"];
  [(ICStartupWhatsNewViewController *)self addBulletedListItemWithTitle:v14 description:v12 image:v13];
}

- (id)startupNavigationController
{
  objc_opt_class();
  unint64_t v3 = [(ICStartupWhatsNewViewController *)self navigationController];
  BOOL v4 = ICCheckedDynamicCast();

  return v4;
}

- (void)didTapContinueButton:(id)a3
{
  +[ICStartupController setLastShownStartupWelcomeScreenVersionToCurrentVersion];
  id v4 = [(ICStartupWhatsNewViewController *)self startupNavigationController];
  [v4 dismiss];
}

@end