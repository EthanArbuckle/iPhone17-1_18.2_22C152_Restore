@interface _UISignalAnalytics
+ (id)getIAChannelGenmoji;
+ (id)getIAChannelGenmojiCreation;
+ (id)getIAChannelWritingTools;
+ (id)getIAPayloadKeyGenmojiEditType;
+ (id)getIAPayloadKeyGenmojiImageType;
+ (id)getIAPayloadKeyGenmojiUsageIsInline;
+ (id)getIAPayloadKeyGenmojiUsageSource;
+ (id)getIAPayloadKeyGenmojiUsageType;
+ (id)getIAPayloadKeyWritingToolsUI;
+ (id)getIAPayloadValueGenmojiEditTypeDelete;
+ (id)getIAPayloadValueGenmojiEditTypeRearrange;
+ (id)getIAPayloadValueGenmojiImageTypeEmoji;
+ (id)getIAPayloadValueGenmojiImageTypeGenmoji;
+ (id)getIAPayloadValueGenmojiImageTypeMemoji;
+ (id)getIAPayloadValueGenmojiImageTypeStickers1P;
+ (id)getIAPayloadValueGenmojiImageTypeStickers3P;
+ (id)getIAPayloadValueGenmojiUnspecified;
+ (id)getIAPayloadValueGenmojiUsageSourceCandidateBarSuggestion;
+ (id)getIAPayloadValueGenmojiUsageSourceCreationSheet;
+ (id)getIAPayloadValueGenmojiUsageSourceEmojiKeyboardPicker;
+ (id)getIAPayloadValueGenmojiUsageSourceEmojiSearch;
+ (id)getIAPayloadValueGenmojiUsageSourceRecentsTab;
+ (id)getIAPayloadValueGenmojiUsageTypePeelAndStick;
+ (id)getIAPayloadValueGenmojiUsageTypeTap;
+ (id)getIAPayloadValueGenmojiUsageTypeTapback;
+ (id)getIAPayloadValueWritingToolsUICandidateBar;
+ (id)getIAPayloadValueWritingToolsUIMenu;
+ (id)getIAPayloadValueWritingToolsUIUnspecified;
+ (id)getIASignalGenmojiCreationCreateNewEmojiButtonShown;
+ (id)getIASignalGenmojiCreationCreateNewEmojiDismissed;
+ (id)getIASignalGenmojiCreationCreateNewEmojiSelected;
+ (id)getIASignalGenmojiEdit;
+ (id)getIASignalGenmojiExistingGenmojiLongPressedThenNewEmojiSelected;
+ (id)getIASignalGenmojiUsage;
+ (id)getIASignalWritingToolsPanelRequested;
+ (void)sendGenmojiCreationSignal:(id)a3 payload:(id)a4;
+ (void)sendGenmojiSignal:(id)a3 payload:(id)a4;
+ (void)sendSignal:(id)a3 toChannel:(id)a4 withPayload:(id)a5;
+ (void)sendWritingToolsSignal:(id)a3 payload:(id)a4;
@end

@implementation _UISignalAnalytics

+ (void)sendSignal:(id)a3 toChannel:(id)a4 withPayload:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v10 = (void *)getIASignalAnalyticsClass_softClass;
  uint64_t v18 = getIASignalAnalyticsClass_softClass;
  if (!getIASignalAnalyticsClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getIASignalAnalyticsClass_block_invoke;
    v13[3] = &unk_1E52D9900;
    v14 = &v15;
    InputAnalyticsLibraryCore();
    v16[3] = (uint64_t)objc_getClass("IASignalAnalytics");
    getIASignalAnalyticsClass_softClass = *(void *)(v14[1] + 24);
    v10 = (void *)v16[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v15, 8);
  if (v11)
  {
    [v11 sendSignal:v7 toChannel:v8 withPayload:v9];
  }
  else
  {
    v12 = _UISignalAnalyticsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13[0]) = 0;
      _os_log_error_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Could not soft link InputAnalytics", (uint8_t *)v13, 2u);
    }
  }
}

+ (void)sendGenmojiSignal:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[_UISignalAnalytics getIAChannelGenmoji];
  +[_UISignalAnalytics sendSignal:v6 toChannel:v7 withPayload:v5];
}

+ (void)sendGenmojiCreationSignal:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[_UISignalAnalytics getIAChannelGenmojiCreation];
  +[_UISignalAnalytics sendSignal:v6 toChannel:v7 withPayload:v5];
}

+ (void)sendWritingToolsSignal:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[_UISignalAnalytics getIAChannelWritingTools];
  +[_UISignalAnalytics sendSignal:v6 toChannel:v7 withPayload:v5];
}

+ (id)getIAChannelGenmoji
{
  return @"Genmoji";
}

+ (id)getIAChannelGenmojiCreation
{
  return @"GenmojiCreation";
}

+ (id)getIAChannelWritingTools
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getIAChannelWritingToolsSymbolLoc_ptr;
  uint64_t v11 = getIAChannelWritingToolsSymbolLoc_ptr;
  if (!getIAChannelWritingToolsSymbolLoc_ptr)
  {
    v3 = InputAnalyticsLibrary();
    v9[3] = (uint64_t)dlsym(v3, "IAChannelWritingTools");
    getIAChannelWritingToolsSymbolLoc_ptr = v9[3];
    v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    v4 = *v2;
    return v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getIAChannelWritingTools(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"_UISignalAnalytics.m", 22, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)getIASignalGenmojiUsage
{
  return @"Usage";
}

+ (id)getIASignalGenmojiEdit
{
  return @"Edit";
}

+ (id)getIASignalGenmojiCreationCreateNewEmojiSelected
{
  return @"CreateNewEmojiSelected";
}

+ (id)getIASignalGenmojiCreationCreateNewEmojiButtonShown
{
  return @"CreateNewEmojiButtonShown";
}

+ (id)getIASignalGenmojiCreationCreateNewEmojiDismissed
{
  return @"CreateNewEmojiDismissed";
}

+ (id)getIASignalGenmojiExistingGenmojiLongPressedThenNewEmojiSelected
{
  return @"ExistingGenmojiLongPressedThenNewEmojiSelected";
}

+ (id)getIAPayloadKeyGenmojiImageType
{
  return @"ImageType";
}

+ (id)getIAPayloadKeyGenmojiUsageSource
{
  return @"UsageSource";
}

+ (id)getIAPayloadKeyGenmojiUsageType
{
  return @"UsageType";
}

+ (id)getIAPayloadKeyGenmojiUsageIsInline
{
  return @"UsageIsInline";
}

+ (id)getIAPayloadKeyGenmojiEditType
{
  return @"EditType";
}

+ (id)getIAPayloadValueGenmojiUnspecified
{
  return @"Unspecified";
}

+ (id)getIAPayloadValueGenmojiImageTypeGenmoji
{
  return @"Genmoji";
}

+ (id)getIAPayloadValueGenmojiImageTypeStickers1P
{
  return @"Stickers1P";
}

+ (id)getIAPayloadValueGenmojiImageTypeStickers3P
{
  return @"Stickers3P";
}

+ (id)getIAPayloadValueGenmojiImageTypeMemoji
{
  return @"Memoji";
}

+ (id)getIAPayloadValueGenmojiImageTypeEmoji
{
  return @"Emoji";
}

+ (id)getIAPayloadValueGenmojiUsageSourceCreationSheet
{
  return @"CreationSheet";
}

+ (id)getIAPayloadValueGenmojiUsageSourceRecentsTab
{
  return @"RecentsTab";
}

+ (id)getIAPayloadValueGenmojiUsageSourceEmojiKeyboardPicker
{
  return @"KeyboardPicker";
}

+ (id)getIAPayloadValueGenmojiUsageSourceEmojiSearch
{
  return @"EmojiSearch";
}

+ (id)getIAPayloadValueGenmojiUsageSourceCandidateBarSuggestion
{
  return @"CandidateBarSuggestions";
}

+ (id)getIAPayloadValueGenmojiUsageTypeTap
{
  return @"Tap";
}

+ (id)getIAPayloadValueGenmojiUsageTypePeelAndStick
{
  return @"PeelAndStick";
}

+ (id)getIAPayloadValueGenmojiUsageTypeTapback
{
  return @"Tapback";
}

+ (id)getIAPayloadValueGenmojiEditTypeRearrange
{
  return @"Rearrange";
}

+ (id)getIAPayloadValueGenmojiEditTypeDelete
{
  return @"Delete";
}

+ (id)getIASignalWritingToolsPanelRequested
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getIASignalWritingToolsPanelRequestedSymbolLoc_ptr;
  uint64_t v11 = getIASignalWritingToolsPanelRequestedSymbolLoc_ptr;
  if (!getIASignalWritingToolsPanelRequestedSymbolLoc_ptr)
  {
    v3 = InputAnalyticsLibrary();
    v9[3] = (uint64_t)dlsym(v3, "IASignalWritingToolsPanelRequested");
    getIASignalWritingToolsPanelRequestedSymbolLoc_ptr = v9[3];
    v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    v4 = *v2;
    return v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getIASignalWritingToolsPanelRequested(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"_UISignalAnalytics.m", 23, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)getIAPayloadKeyWritingToolsUI
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getIAPayloadKeyWritingToolsUISymbolLoc_ptr;
  uint64_t v11 = getIAPayloadKeyWritingToolsUISymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsUISymbolLoc_ptr)
  {
    v3 = InputAnalyticsLibrary();
    v9[3] = (uint64_t)dlsym(v3, "IAPayloadKeyWritingToolsUI");
    getIAPayloadKeyWritingToolsUISymbolLoc_ptr = v9[3];
    v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    v4 = *v2;
    return v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getIAPayloadKeyWritingToolsUI(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"_UISignalAnalytics.m", 24, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)getIAPayloadValueWritingToolsUIUnspecified
{
  return @"Unspecified";
}

+ (id)getIAPayloadValueWritingToolsUIMenu
{
  return @"Menu";
}

+ (id)getIAPayloadValueWritingToolsUICandidateBar
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void **)getIAPayloadValueWritingToolsUICandidateBarSymbolLoc_ptr;
  uint64_t v11 = getIAPayloadValueWritingToolsUICandidateBarSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsUICandidateBarSymbolLoc_ptr)
  {
    v3 = InputAnalyticsLibrary();
    v9[3] = (uint64_t)dlsym(v3, "IAPayloadValueWritingToolsUICandidateBar");
    getIAPayloadValueWritingToolsUICandidateBarSymbolLoc_ptr = v9[3];
    v2 = (void **)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    v4 = *v2;
    return v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"NSString *getIAPayloadValueWritingToolsUICandidateBar(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"_UISignalAnalytics.m", 26, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

@end