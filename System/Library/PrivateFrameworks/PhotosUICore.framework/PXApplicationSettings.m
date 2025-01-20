@interface PXApplicationSettings
+ (PXApplicationSettings)sharedInstance;
+ (id)attributedStringTransformedForDisplay:(id)a3;
+ (id)settingsControllerModule;
+ (id)stringTransformedForDisplay:(id)a3;
- (BOOL)_wantsPseudoStringsForDisplay;
- (BOOL)enablePlayMovieAction;
- (BOOL)enableSlideshowAction;
- (BOOL)shouldClearUndoStackAutomatically;
- (BOOL)wantsPseudostringsWithIncreasedLength;
- (BOOL)wantsPseudostringsWithSpecialCharacters;
- (NSString)stringWithSpecialCharacters;
- (double)backgroundThresholdDurationForUndoActionsInvalidation;
- (double)defaultNavigationTimeoutDuration;
- (id)parentSettings;
- (int64_t)pseudoStringsLengthIncreaseFactor;
- (void)setBackgroundThresholdDurationForUndoActionsInvalidation:(double)a3;
- (void)setDefaultNavigationTimeoutDuration:(double)a3;
- (void)setDefaultValues;
- (void)setEnablePlayMovieAction:(BOOL)a3;
- (void)setEnableSlideshowAction:(BOOL)a3;
- (void)setPseudoStringsLengthIncreaseFactor:(int64_t)a3;
- (void)setShouldClearUndoStackAutomatically:(BOOL)a3;
- (void)setStringWithSpecialCharacters:(id)a3;
- (void)setWantsPseudostringsWithIncreasedLength:(BOOL)a3;
- (void)setWantsPseudostringsWithSpecialCharacters:(BOOL)a3;
@end

@implementation PXApplicationSettings

- (BOOL)wantsPseudostringsWithSpecialCharacters
{
  return self->_wantsPseudostringsWithSpecialCharacters;
}

+ (PXApplicationSettings)sharedInstance
{
  if (sharedInstance_onceToken_139427 != -1) {
    dispatch_once(&sharedInstance_onceToken_139427, &__block_literal_global_139428);
  }
  v2 = (void *)sharedInstance_sharedInstance_139429;
  return (PXApplicationSettings *)v2;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXApplicationSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXApplicationSettings *)self setDefaultNavigationTimeoutDuration:2.0];
  [(PXApplicationSettings *)self setWantsPseudostringsWithSpecialCharacters:0];
  [(PXApplicationSettings *)self setStringWithSpecialCharacters:@"นี้ लड्डू चाँद लड्डू चाँद"];
  [(PXApplicationSettings *)self setWantsPseudostringsWithIncreasedLength:0];
  [(PXApplicationSettings *)self setPseudoStringsLengthIncreaseFactor:2];
  [(PXApplicationSettings *)self setEnableSlideshowAction:0];
  [(PXApplicationSettings *)self setEnablePlayMovieAction:1];
  [(PXApplicationSettings *)self setShouldClearUndoStackAutomatically:1];
  [(PXApplicationSettings *)self setBackgroundThresholdDurationForUndoActionsInvalidation:480.0];
}

- (void)setWantsPseudostringsWithSpecialCharacters:(BOOL)a3
{
  self->_wantsPseudostringsWithSpecialCharacters = a3;
}

- (void)setWantsPseudostringsWithIncreasedLength:(BOOL)a3
{
  self->_wantsPseudostringsWithIncreasedLength = a3;
}

- (void)setStringWithSpecialCharacters:(id)a3
{
}

- (void)setShouldClearUndoStackAutomatically:(BOOL)a3
{
  self->_shouldClearUndoStackAutomatically = a3;
}

- (void)setPseudoStringsLengthIncreaseFactor:(int64_t)a3
{
  self->_pseudoStringsLengthIncreaseFactor = a3;
}

- (void)setEnableSlideshowAction:(BOOL)a3
{
  self->_enableSlideshowAction = a3;
}

- (void)setEnablePlayMovieAction:(BOOL)a3
{
  self->_enablePlayMovieAction = a3;
}

- (void)setDefaultNavigationTimeoutDuration:(double)a3
{
  self->_defaultNavigationTimeoutDuration = a3;
}

- (void)setBackgroundThresholdDurationForUndoActionsInvalidation:(double)a3
{
  self->_backgroundThresholdDurationForUndoActionsInvalidation = a3;
}

void __39__PXApplicationSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 applicationSettings];
  v1 = (void *)sharedInstance_sharedInstance_139429;
  sharedInstance_sharedInstance_139429 = v0;
}

- (void).cxx_destruct
{
}

- (double)backgroundThresholdDurationForUndoActionsInvalidation
{
  return self->_backgroundThresholdDurationForUndoActionsInvalidation;
}

- (BOOL)shouldClearUndoStackAutomatically
{
  return self->_shouldClearUndoStackAutomatically;
}

- (BOOL)enablePlayMovieAction
{
  return self->_enablePlayMovieAction;
}

- (BOOL)enableSlideshowAction
{
  return self->_enableSlideshowAction;
}

- (int64_t)pseudoStringsLengthIncreaseFactor
{
  return self->_pseudoStringsLengthIncreaseFactor;
}

- (BOOL)wantsPseudostringsWithIncreasedLength
{
  return self->_wantsPseudostringsWithIncreasedLength;
}

- (NSString)stringWithSpecialCharacters
{
  return self->_stringWithSpecialCharacters;
}

- (double)defaultNavigationTimeoutDuration
{
  return self->_defaultNavigationTimeoutDuration;
}

- (BOOL)_wantsPseudoStringsForDisplay
{
  if ([(PXApplicationSettings *)self wantsPseudostringsWithSpecialCharacters]) {
    return 1;
  }
  return [(PXApplicationSettings *)self wantsPseudostringsWithIncreasedLength];
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)attributedStringTransformedForDisplay:(id)a3
{
  id v3 = a3;
  v4 = +[PXApplicationSettings sharedInstance];
  if (![v4 _wantsPseudoStringsForDisplay])
  {
    v5 = v3;
LABEL_3:

    goto LABEL_4;
  }
  uint64_t v7 = [v3 length];

  v5 = v3;
  if (v7)
  {
    v4 = +[PXApplicationSettings sharedInstance];
    v8 = (void *)[v3 mutableCopy];
    if ([v4 wantsPseudostringsWithIncreasedLength]
      && [v4 pseudoStringsLengthIncreaseFactor] >= 2)
    {
      uint64_t v9 = 1;
      do
      {
        [v8 appendAttributedString:v3];
        ++v9;
      }
      while (v9 < [v4 pseudoStringsLengthIncreaseFactor]);
    }
    if ([v4 wantsPseudostringsWithSpecialCharacters])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
      v11 = [v4 stringWithSpecialCharacters];
      v12 = (void *)[v10 initWithString:v11];
      [v8 insertAttributedString:v12 atIndex:0];
    }
    v5 = (void *)[v8 copy];

    goto LABEL_3;
  }
LABEL_4:

  return v5;
}

+ (id)stringTransformedForDisplay:(id)a3
{
  id v3 = a3;
  v4 = +[PXApplicationSettings sharedInstance];
  if (![v4 _wantsPseudoStringsForDisplay])
  {
    v5 = v3;
LABEL_3:

    goto LABEL_4;
  }
  uint64_t v7 = [v3 length];

  v5 = v3;
  if (v7)
  {
    v4 = +[PXApplicationSettings sharedInstance];
    v5 = v3;
    if ([v4 wantsPseudostringsWithIncreasedLength])
    {
      v5 = objc_msgSend(v3, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v3, "length") * objc_msgSend(v4, "pseudoStringsLengthIncreaseFactor"), v3, 0);
    }
    if ([v4 wantsPseudostringsWithSpecialCharacters])
    {
      v8 = [v4 stringWithSpecialCharacters];
      uint64_t v9 = [v8 stringByAppendingString:v5];

      v5 = (void *)v9;
    }
    goto LABEL_3;
  }
LABEL_4:

  return v5;
}

+ (id)settingsControllerModule
{
  v63[6] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  id v40 = (id)MEMORY[0x1E4F94160];
  id v3 = (void *)MEMORY[0x1E4F941D8];
  v57 = NSStringFromSelector(sel_defaultNavigationTimeoutDuration);
  v56 = [v3 rowWithTitle:@"Navigation Timeout" valueKeyPath:v57];
  v55 = [v56 minValue:0.0 maxValue:10.0];
  v54 = objc_msgSend(v55, "px_increment:", 0.2);
  v62 = v54;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  v52 = [v2 sectionWithRows:v53 title:@"Durations"];
  v63[0] = v52;
  v4 = (void *)MEMORY[0x1E4F94160];
  v5 = (void *)MEMORY[0x1E4F941F0];
  v51 = NSStringFromSelector(sel_wantsPseudostringsWithSpecialCharacters);
  v50 = [v5 rowWithTitle:@"Special Characters" valueKeyPath:v51];
  v61[0] = v50;
  v6 = (void *)MEMORY[0x1E4F941F0];
  v49 = NSStringFromSelector(sel_wantsPseudostringsWithIncreasedLength);
  v48 = [v6 rowWithTitle:@"Increased Length" valueKeyPath:v49];
  v61[1] = v48;
  uint64_t v7 = (void *)MEMORY[0x1E4F94108];
  v47 = NSStringFromSelector(sel_pseudoStringsLengthIncreaseFactor);
  v46 = [v7 rowWithTitle:@"Factor" valueKeyPath:v47];
  v44 = objc_msgSend(v46, "px_possibleValues:", &unk_1F02D48B8);
  v8 = (void *)MEMORY[0x1E4F28F60];
  v45 = NSStringFromSelector(sel_wantsPseudostringsWithIncreasedLength);
  v43 = objc_msgSend(v8, "predicateWithFormat:", @"%K == YES", v45);
  v42 = [v44 condition:v43];
  v61[2] = v42;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
  v38 = [v4 sectionWithRows:v39 title:@"Pseudo Strings"];
  v63[1] = v38;
  uint64_t v9 = (void *)MEMORY[0x1E4F94160];
  id v10 = (void *)MEMORY[0x1E4F941F0];
  v37 = NSStringFromSelector(sel_enableSlideshowAction);
  v36 = [v10 rowWithTitle:@"Slideshow (Legacy)" valueKeyPath:v37];
  v60[0] = v36;
  v11 = (void *)MEMORY[0x1E4F941F0];
  v35 = NSStringFromSelector(sel_enablePlayMovieAction);
  v34 = [v11 rowWithTitle:@"Play as Slideshow" valueKeyPath:v35];
  v60[1] = v34;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  v32 = [v9 sectionWithRows:v33 title:@"Actions"];
  v63[2] = v32;
  v12 = (void *)MEMORY[0x1E4F94160];
  v13 = (void *)MEMORY[0x1E4F941F0];
  v31 = NSStringFromSelector(sel_shouldClearUndoStackAutomatically);
  v30 = [v13 rowWithTitle:@"Clear Undo After Background" valueKeyPath:v31];
  v59[0] = v30;
  v14 = (void *)MEMORY[0x1E4F941D8];
  v29 = NSStringFromSelector(sel_backgroundThresholdDurationForUndoActionsInvalidation);
  v28 = [v14 rowWithTitle:@"Max Background (seconds)" valueKeyPath:v29];
  v15 = [v28 minValue:0.0 maxValue:3600.0];
  v16 = objc_msgSend(v15, "px_increment:", 5.0);
  v59[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  v18 = [v12 sectionWithRows:v17 title:@"Undo"];
  v63[3] = v18;
  v19 = (void *)MEMORY[0x1E4F94160];
  v20 = (void *)MEMORY[0x1E4F940F8];
  v21 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_152086];
  v22 = [v20 rowWithTitle:@"GreenTea Status" action:v21];
  v58 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  v24 = [v19 sectionWithRows:v23 title:@"GreenTea"];
  v63[4] = v24;
  v25 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v63[5] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:6];
  id v41 = [v40 moduleWithTitle:@"Application" contents:v26];

  return v41;
}

uint64_t __53__PXApplicationSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int v4 = PLIsChinaSKU();
  v5 = NSString;
  v6 = @"NO";
  if (v4) {
    v6 = @"YES";
  }
  uint64_t v7 = v6;
  v8 = [v5 stringWithFormat:@"Is device in GreenTea: %@", v7];

  uint64_t v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"GreenTea Status" message:v8 preferredStyle:1];
  id v10 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
  [v9 addAction:v10];

  [v3 presentViewController:v9 animated:1 completion:0];
  return 1;
}

@end