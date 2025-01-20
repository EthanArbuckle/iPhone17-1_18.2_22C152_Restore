@interface _UIFontPickerActionHostToClient
+ (id)actionForConfiguration:(id)a3;
+ (id)actionForHideNavigationBar:(BOOL)a3;
+ (id)actionForSelectedFontDescriptors:(id)a3 scrollToVisible:(BOOL)a4;
+ (id)actionForShowsGrabber:(BOOL)a3;
- (void)performActionForHostedWindowScene:(id)a3;
@end

@implementation _UIFontPickerActionHostToClient

+ (id)actionForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v5 setObject:&unk_1ED3F5958 forSetting:0];
  [v5 setObject:v4 forSetting:1];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v6 = (void (*)(void))_MergedGlobals_1178;
  v17 = _MergedGlobals_1178;
  if (!_MergedGlobals_1178)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getFSFontPickerSupportListenerEndpointSymbolLoc_block_invoke_0;
    v13[3] = &unk_1E52D9900;
    v13[4] = &v14;
    __getFSFontPickerSupportListenerEndpointSymbolLoc_block_invoke_0(v13);
    v6 = (void (*)(void))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (v6)
  {
    v7 = v6();
    objc_msgSend(v4, "set_clientFontContextEndpoint:", v7);

    v8 = _UIFontPickerLoadRecentFontDescriptors();
    [v4 _setClientRecentFonts:v8];

    v9 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];
    return v9;
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"NSXPCListenerEndpoint *_FSFontPickerSupportListenerEndpoint(void)"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"_UIFontPickerActionHostToClient.m", 19, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)actionForSelectedFontDescriptors:(id)a3 scrollToVisible:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setObject:&unk_1ED3F5970 forSetting:0];
  v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_secureDataFromObject:", v7);

  [v8 setObject:v9 forSetting:2];
  v10 = [NSNumber numberWithBool:v4];
  [v8 setObject:v10 forSetting:3];

  v11 = (void *)[objc_alloc((Class)a1) initWithInfo:v8 responder:0];
  return v11;
}

+ (id)actionForHideNavigationBar:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v5 setObject:&unk_1ED3F5988 forSetting:0];
  v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forSetting:4];

  id v7 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];
  return v7;
}

+ (id)actionForShowsGrabber:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v5 setObject:&unk_1ED3F59A0 forSetting:0];
  v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forSetting:5];

  id v7 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];
  return v7;
}

- (void)performActionForHostedWindowScene:(id)a3
{
  id v28 = [a3 delegate];
  if (([v28 conformsToProtocol:&unk_1ED7008E0] & 1) == 0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_UIFontPickerActionHostToClient.m", 80, @"Scene's delegate (%@) does not conform to _UIHostedWindowSceneDelegate", objc_opt_class() object file lineNumber description];
  }
  id v5 = [v28 window];
  v6 = [v5 rootViewController];

  if (([v6 conformsToProtocol:&unk_1ED7011E0] & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"_UIFontPickerActionHostToClient.m", 83, @"Scene delegate's root view controller (%@) does not conform to _UIFontPickerClientActionHandling", objc_opt_class() object file lineNumber description];
  }
  id v7 = v6;
  id v8 = [(_UIFontPickerActionHostToClient *)self info];
  v9 = [v8 objectForSetting:0];
  uint64_t v10 = [v9 integerValue];

  switch(v10)
  {
    case 0:
      v11 = [(_UIFontPickerActionHostToClient *)self info];
      v12 = [v11 objectForSetting:1];

      [v7 applyFontPickerConfiguration:v12];
      goto LABEL_8;
    case 1:
      v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
      v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = [(_UIFontPickerActionHostToClient *)self info];
      v15 = [v14 objectForSetting:2];
      uint64_t v16 = objc_msgSend(v13, "bs_secureDecodedFromData:withAdditionalClasses:", v15, v12);

      v17 = [(_UIFontPickerActionHostToClient *)self info];
      v18 = [v17 objectForSetting:3];
      uint64_t v19 = [v18 BOOLValue];

      [v7 applySelectedFontDescriptors:v16 scrollToVisible:v19];
LABEL_8:

      break;
    case 2:
      v20 = [(_UIFontPickerActionHostToClient *)self info];
      v21 = [v20 objectForSetting:4];
      uint64_t v22 = [v21 BOOLValue];

      [v7 applyHideNavigationBar:v22];
      break;
    case 3:
      v23 = [(_UIFontPickerActionHostToClient *)self info];
      v24 = [v23 objectForSetting:5];
      uint64_t v25 = [v24 BOOLValue];

      [v7 applyShowsGrabber:v25];
      break;
    default:
      break;
  }
}

@end