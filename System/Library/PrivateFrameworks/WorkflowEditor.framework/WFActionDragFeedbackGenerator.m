@interface WFActionDragFeedbackGenerator
- (BOOL)initializedReorderSound;
- (NSDate)lastDragStartDate;
- (unsigned)reorderSound;
- (void)dealloc;
- (void)draggingActionsEnteredDeletionZone:(id)a3;
- (void)draggingInsertedActions:(id)a3 intoWorkflow:(id)a4 atIndex:(unint64_t)a5;
- (void)draggingItemSnapped;
- (void)draggingMovedActions:(id)a3 fromIndexes:(id)a4 toIndexes:(id)a5 inWorkflow:(id)a6;
- (void)draggingRemovedActions:(id)a3;
- (void)draggingStarted;
- (void)playReorderSound;
- (void)setInitializedReorderSound:(BOOL)a3;
- (void)setLastDragStartDate:(id)a3;
- (void)setReorderSound:(unsigned int)a3;
@end

@implementation WFActionDragFeedbackGenerator

- (void).cxx_destruct
{
}

- (void)setReorderSound:(unsigned int)a3
{
  self->_reorderSound = a3;
}

- (void)setInitializedReorderSound:(BOOL)a3
{
  self->_initializedReorderSound = a3;
}

- (BOOL)initializedReorderSound
{
  return self->_initializedReorderSound;
}

- (void)setLastDragStartDate:(id)a3
{
}

- (NSDate)lastDragStartDate
{
  return self->_lastDragStartDate;
}

- (void)dealloc
{
  if (self->_initializedReorderSound) {
    AudioServicesDisposeSystemSoundID(self->_reorderSound);
  }
  v3.receiver = self;
  v3.super_class = (Class)WFActionDragFeedbackGenerator;
  [(WFActionDragFeedbackGenerator *)&v3 dealloc];
}

- (void)playReorderSound
{
  SystemSoundID v2 = [(WFActionDragFeedbackGenerator *)self reorderSound];
  AudioServicesPlaySystemSoundWithCompletion(v2, 0);
}

- (unsigned)reorderSound
{
  if (!self->_initializedReorderSound)
  {
    objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    CFURLRef v4 = [v3 URLForResource:@"Reorder" withExtension:@"aiff"];

    self->_initializedReorderSound = AudioServicesCreateSystemSoundID(v4, &self->_reorderSound) == 0;
  }
  return self->_reorderSound;
}

- (void)draggingActionsEnteredDeletionZone:(id)a3
{
  id v10 = a3;
  [(WFActionDragFeedbackGenerator *)self draggingItemSnapped];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    UIAccessibilityNotifications v4 = *MEMORY[0x263F83188];
    v5 = NSString;
    v6 = WFLocalizedString(@"Release to remove %@");
    v7 = [v10 firstObject];
    v8 = [v7 localizedName];
    v9 = objc_msgSend(v5, "stringWithFormat:", v6, v8);
    UIAccessibilityPostNotification(v4, v9);
  }
}

- (void)draggingMovedActions:(id)a3 fromIndexes:(id)a4 toIndexes:(id)a5 inWorkflow:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(WFActionDragFeedbackGenerator *)self draggingItemSnapped];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v14 = [v13 actions];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __87__WFActionDragFeedbackGenerator_draggingMovedActions_fromIndexes_toIndexes_inWorkflow___block_invoke;
    v26 = &unk_264BFD2D0;
    id v27 = v10;
    v15 = objc_msgSend(v14, "if_objectsPassingTest:", &v23);

    unint64_t v16 = [v11 lastIndex];
    if (v16 <= [v12 lastIndex])
    {
      v17 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v12, "firstIndex") - 1);
      v18 = NSString;
      v19 = @"moved below %@";
    }
    else
    {
      v17 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v12, "lastIndex") - objc_msgSend(v12, "count") + 1);
      v18 = NSString;
      v19 = @"moved above %@";
    }
    v20 = WFLocalizedString(v19);
    v21 = [v17 accessibilityName];
    v22 = objc_msgSend(v18, "localizedStringWithFormat:", v20, v21, v23, v24, v25, v26);

    UIAccessibilityPostNotification(*MEMORY[0x263F83188], v22);
    [(WFActionDragFeedbackGenerator *)self playReorderSound];
  }
}

uint64_t __87__WFActionDragFeedbackGenerator_draggingMovedActions_fromIndexes_toIndexes_inWorkflow___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)draggingRemovedActions:(id)a3
{
  id v9 = a3;
  [(WFActionDragFeedbackGenerator *)self draggingItemSnapped];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    UIAccessibilityNotifications v4 = NSString;
    v5 = WFLocalizedString(@"removed %@");
    v6 = [v9 firstObject];
    v7 = [v6 accessibilityName];
    v8 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v7);

    UIAccessibilityPostNotification(*MEMORY[0x263F83188], v8);
  }
}

- (void)draggingInsertedActions:(id)a3 intoWorkflow:(id)a4 atIndex:(unint64_t)a5
{
  id v21 = a3;
  id v8 = a4;
  [(WFActionDragFeedbackGenerator *)self draggingItemSnapped];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v9 = [v8 actions];
    id v10 = v9;
    if (a5)
    {
      id v11 = [v9 objectAtIndex:a5 - 1];

      id v12 = NSString;
      id v13 = WFLocalizedString(@"added %1$@ to shortcut below %2$@");
      v14 = [v21 firstObject];
      v15 = [v14 accessibilityName];
      unint64_t v16 = [v11 localizedName];
      v17 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v15, v16);
    }
    else
    {
      if ([v9 count])
      {
        v18 = [v8 actions];
        id v11 = [v18 objectAtIndex:0];
      }
      else
      {
        id v11 = 0;
      }

      v19 = [v21 firstObject];
      id v13 = [v19 accessibilityName];

      v20 = NSString;
      if (!v11)
      {
        v14 = WFLocalizedString(@"added %@ to shortcut");
        v17 = objc_msgSend(v20, "localizedStringWithFormat:", v14, v13);
        goto LABEL_10;
      }
      v14 = WFLocalizedString(@"added %1$@ to shortcut above %2$@");
      v15 = [v11 accessibilityName];
      v17 = objc_msgSend(v20, "localizedStringWithFormat:", v14, v13, v15);
    }

LABEL_10:
    UIAccessibilityPostNotification(*MEMORY[0x263F83188], v17);
    [(WFActionDragFeedbackGenerator *)self playReorderSound];
  }
}

- (void)draggingItemSnapped
{
  [(NSDate *)self->_lastDragStartDate timeIntervalSinceNow];
  if (fabs(v3) >= 0.3)
  {
    v4.receiver = self;
    v4.super_class = (Class)WFActionDragFeedbackGenerator;
    [(WFDragFeedbackGenerator *)&v4 draggingItemSnapped];
  }
}

- (void)draggingStarted
{
  v7.receiver = self;
  v7.super_class = (Class)WFActionDragFeedbackGenerator;
  [(WFDragFeedbackGenerator *)&v7 draggingStarted];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    UIAccessibilityNotifications v3 = *MEMORY[0x263F83188];
    objc_super v4 = WFLocalizedString(@"dragging");
    UIAccessibilityPostNotification(v3, v4);
  }
  v5 = [MEMORY[0x263EFF910] date];
  lastDragStartDate = self->_lastDragStartDate;
  self->_lastDragStartDate = v5;
}

@end