@interface VOSOutputEventCategory
+ (NSArray)allCategories;
+ (VOSOutputEventCategory)interaction;
+ (id)appFeedback;
+ (id)braille;
+ (id)system;
+ (id)textEditing;
+ (id)voiceOverFeedback;
- (BOOL)containsOutputEvent:(id)a3;
- (NSArray)outputEvents;
- (NSString)localizedCategoryName;
- (VOSOutputEventCategory)init;
- (VOSOutputEventCategory)initWithOutputEvents:(id)a3 localizedCategoryName:(id)a4;
- (void)setLocalizedCategoryName:(id)a3;
- (void)setOutputEvents:(id)a3;
@end

@implementation VOSOutputEventCategory

+ (VOSOutputEventCategory)interaction
{
  v18[11] = *MEMORY[0x263EF8340];
  v17 = +[VOSOutputEvent DidFocusOnElement];
  v18[0] = v17;
  v16 = +[VOSOutputEvent DidFocusOnScreenRecognitionElement];
  v18[1] = v16;
  v2 = +[VOSOutputEvent DidActivateElement];
  v18[2] = v2;
  v3 = +[VOSOutputEvent DidWrapBackwards];
  v18[3] = v3;
  v4 = +[VOSOutputEvent DidWrapForwards];
  v18[4] = v4;
  v5 = +[VOSOutputEvent DidScrollByPage];
  v18[5] = v5;
  v6 = +[VOSOutputEvent BoundaryEncountered];
  v18[6] = v6;
  v7 = +[VOSOutputEvent NoItemExists];
  v18[7] = v7;
  v8 = +[VOSOutputEvent IsInteractable];
  v18[8] = v8;
  v9 = +[VOSOutputEvent InteractIn];
  v18[9] = v9;
  v10 = +[VOSOutputEvent InteractOut];
  v18[10] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:11];

  v12 = [VOSOutputEventCategory alloc];
  v13 = VOSLocString(@"VOSOutputEventCategory.Interaction");
  v14 = [(VOSOutputEventCategory *)v12 initWithOutputEvents:v11 localizedCategoryName:v13];

  return v14;
}

+ (id)voiceOverFeedback
{
  v37[30] = *MEMORY[0x263EF8340];
  v36 = +[VOSOutputEvent ScreenDidChange];
  v37[0] = v36;
  v35 = +[VOSOutputEvent DidSyncWithSystemFocus];
  v37[1] = v35;
  v34 = +[VOSOutputEvent DidEnterTargetArea];
  v37[2] = v34;
  v33 = +[VOSOutputEvent DidLeaveTargetArea];
  v37[3] = v33;
  v32 = +[VOSOutputEvent DidEnterTouchContainer];
  v37[4] = v32;
  v31 = +[VOSOutputEvent DidSelectPreviousRotor];
  v37[5] = v31;
  v30 = +[VOSOutputEvent DidSelectNextRotor];
  v37[6] = v30;
  v29 = +[VOSOutputEvent PreviousRotorProgress];
  v37[7] = v29;
  v28 = +[VOSOutputEvent NextRotorProgress];
  v37[8] = v28;
  v27 = +[VOSOutputEvent DidBeginPassthrough];
  v37[9] = v27;
  v26 = +[VOSOutputEvent NoResultsFound];
  v37[10] = v26;
  v25 = +[VOSOutputEvent DidRecognizeMLContent];
  v37[11] = v25;
  v24 = +[VOSOutputEvent DidEnableQuickNav];
  v37[12] = v24;
  v23 = +[VOSOutputEvent DidDisableQuickNav];
  v37[13] = v23;
  v22 = +[VOSOutputEvent SensitiveContent];
  v37[14] = v22;
  v21 = +[VOSOutputEvent Startup];
  v37[15] = v21;
  v20 = +[VOSOutputEvent BSIDidEnableTyping];
  v37[16] = v20;
  v19 = +[VOSOutputEvent BSIDidEnableCommand];
  v37[17] = v19;
  v17 = +[VOSOutputEvent BSIDidDisable];
  v37[18] = v17;
  v16 = +[VOSOutputEvent BSIDidCalibrate];
  v37[19] = v16;
  v2 = +[VOSOutputEvent BSIDidCarriageReturn];
  v37[20] = v2;
  v3 = +[VOSOutputEvent BSIDidType];
  v37[21] = v3;
  v4 = +[VOSOutputEvent BSIDidDelete];
  v37[22] = v4;
  v5 = +[VOSOutputEvent BSIDidEnterSpace];
  v37[23] = v5;
  v6 = +[VOSOutputEvent BSIDidEnterChord];
  v37[24] = v6;
  v7 = +[VOSOutputEvent TutorialSuccess];
  v37[25] = v7;
  v8 = +[VOSOutputEvent TutorialMagicTapStart];
  v37[26] = v8;
  v9 = +[VOSOutputEvent TutorialMagicTapStop];
  v37[27] = v9;
  v10 = +[VOSOutputEvent BrailleDisplayReconnectionTriggered];
  v37[28] = v10;
  v11 = +[VOSOutputEvent UnknownCommand];
  v37[29] = v11;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:30];

  v12 = [VOSOutputEventCategory alloc];
  v13 = VOSLocString(@"VOSOutputEventCategory.VoiceOverFeedback");
  v14 = [(VOSOutputEventCategory *)v12 initWithOutputEvents:v18 localizedCategoryName:v13];

  return v14;
}

+ (id)appFeedback
{
  v13[6] = *MEMORY[0x263EF8340];
  v2 = +[VOSOutputEvent ItemIsLoading];
  v13[0] = v2;
  v3 = +[VOSOutputEvent ItemDidLoad];
  v13[1] = v3;
  v4 = +[VOSOutputEvent PopoverDidAppear];
  v13[2] = v4;
  v5 = +[VOSOutputEvent AlertDidAppear];
  v13[3] = v5;
  v6 = +[VOSOutputEvent NotificationDidAppear];
  v13[4] = v6;
  v7 = +[VOSOutputEvent DidReorderItem];
  v13[5] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:6];

  v9 = [VOSOutputEventCategory alloc];
  v10 = VOSLocString(@"VOSOutputEventCategory.AppFeedback");
  v11 = [(VOSOutputEventCategory *)v9 initWithOutputEvents:v8 localizedCategoryName:v10];

  return v11;
}

+ (id)braille
{
  v12[5] = *MEMORY[0x263EF8340];
  v2 = +[VOSOutputEvent BrailleDisplayConnected];
  v3 = +[VOSOutputEvent BrailleDisplayDisconnected];
  v12[1] = v3;
  v4 = +[VOSOutputEvent ItemMemorizationSucceeded];
  v12[2] = v4;
  v5 = +[VOSOutputEvent ItemMemorizationFailed];
  v12[3] = v5;
  v6 = +[VOSOutputEvent ItemMemorizationInProgress];
  v12[4] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];

  v8 = [VOSOutputEventCategory alloc];
  v9 = VOSLocString(@"VOSOutputEventCategory.Braille");
  v10 = [(VOSOutputEventCategory *)v8 initWithOutputEvents:v7 localizedCategoryName:v9];

  return v10;
}

+ (id)textEditing
{
  v14[7] = *MEMORY[0x263EF8340];
  v2 = +[VOSOutputEvent CollaborationOccurred];
  v3 = +[VOSOutputEvent InsertionPointDidMove];
  v14[1] = v3;
  v4 = +[VOSOutputEvent AutofillDidAppear];
  v14[2] = v4;
  v5 = +[VOSOutputEvent AutofillDidDismiss];
  v14[3] = v5;
  v6 = +[VOSOutputEvent DidChangeTextSelectionDirection];
  v14[4] = v6;
  v7 = +[VOSOutputEvent DidSelectAutofill];
  v14[5] = v7;
  v8 = +[VOSOutputEvent DidEnterSecureText];
  v14[6] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:7];

  v10 = [VOSOutputEventCategory alloc];
  v11 = VOSLocString(@"VOSOutputEventCategory.TextEditing");
  v12 = [(VOSOutputEventCategory *)v10 initWithOutputEvents:v9 localizedCategoryName:v11];

  return v12;
}

+ (id)system
{
  v20[13] = *MEMORY[0x263EF8340];
  v19 = +[VOSOutputEvent TouchIDAuthenticated];
  v20[0] = v19;
  v18 = +[VOSOutputEvent TouchIDFailed];
  v20[1] = v18;
  v17 = +[VOSOutputEvent ReachabilityDidBegin];
  v20[2] = v17;
  v16 = +[VOSOutputEvent ReachabilityDidEnd];
  v20[3] = v16;
  v2 = +[VOSOutputEvent DockDidAppear];
  v20[4] = v2;
  v3 = +[VOSOutputEvent DockDidDisappear];
  v20[5] = v3;
  v4 = +[VOSOutputEvent FolderWillOpen];
  v20[6] = v4;
  v5 = +[VOSOutputEvent FolderDidOpen];
  v20[7] = v5;
  v6 = +[VOSOutputEvent FolderDidClose];
  v20[8] = v6;
  v7 = +[VOSOutputEvent KeyboardAppeared];
  v20[9] = v7;
  v8 = +[VOSOutputEvent KeyboardDisappeared];
  v20[10] = v8;
  v9 = +[VOSOutputEvent DidChangeVolume];
  v20[11] = v9;
  v10 = +[VOSOutputEvent ScreenDidTurnOff];
  v20[12] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:13];

  v12 = [VOSOutputEventCategory alloc];
  v13 = VOSLocString(@"VOSOutputEventCategory.System");
  v14 = [(VOSOutputEventCategory *)v12 initWithOutputEvents:v11 localizedCategoryName:v13];

  return v14;
}

+ (NSArray)allCategories
{
  v10[6] = *MEMORY[0x263EF8340];
  v2 = +[VOSOutputEventCategory interaction];
  v10[0] = v2;
  v3 = +[VOSOutputEventCategory voiceOverFeedback];
  v10[1] = v3;
  v4 = +[VOSOutputEventCategory appFeedback];
  v10[2] = v4;
  v5 = +[VOSOutputEventCategory braille];
  v10[3] = v5;
  v6 = +[VOSOutputEventCategory textEditing];
  v10[4] = v6;
  v7 = +[VOSOutputEventCategory system];
  v10[5] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:6];

  return (NSArray *)v8;
}

- (VOSOutputEventCategory)initWithOutputEvents:(id)a3 localizedCategoryName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VOSOutputEventCategory;
  v8 = [(VOSOutputEventCategory *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(VOSOutputEventCategory *)v8 setLocalizedCategoryName:v7];
    [(VOSOutputEventCategory *)v9 setOutputEvents:v6];
  }

  return v9;
}

- (VOSOutputEventCategory)init
{
  return [(VOSOutputEventCategory *)self initWithOutputEvents:MEMORY[0x263EFFA68] localizedCategoryName:&stru_26CC86DC0];
}

- (BOOL)containsOutputEvent:(id)a3
{
  id v4 = a3;
  v5 = [(VOSOutputEventCategory *)self outputEvents];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSArray)outputEvents
{
  return self->_outputEvents;
}

- (void)setOutputEvents:(id)a3
{
}

- (NSString)localizedCategoryName
{
  return self->_localizedCategoryName;
}

- (void)setLocalizedCategoryName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCategoryName, 0);

  objc_storeStrong((id *)&self->_outputEvents, 0);
}

@end