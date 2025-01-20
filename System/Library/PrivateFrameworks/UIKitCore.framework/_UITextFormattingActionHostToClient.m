@interface _UITextFormattingActionHostToClient
+ (id)actionForConfiguration:(id)a3;
+ (id)actionForFormattingDescriptor:(id)a3;
- (void)performActionForHostedWindowScene:(id)a3;
@end

@implementation _UITextFormattingActionHostToClient

+ (id)actionForConfiguration:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:&unk_1ED3F6798 forSetting:0];
  v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_secureDataFromObject:", v5);

  [v6 setObject:v7 forSetting:1];
  v8 = (void *)[objc_alloc((Class)a1) initWithInfo:v6 responder:0];

  return v8;
}

+ (id)actionForFormattingDescriptor:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:&unk_1ED3F67B0 forSetting:0];
  v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_secureDataFromObject:", v5);

  [v6 setObject:v7 forSetting:2];
  v8 = (void *)[objc_alloc((Class)a1) initWithInfo:v6 responder:0];

  return v8;
}

- (void)performActionForHostedWindowScene:(id)a3
{
  id v5 = a3;
  id v6 = [(_UITextFormattingActionHostToClient *)self info];
  v7 = [v6 objectForSetting:0];
  uint64_t v8 = [v7 integerValue];

  id v19 = [v5 delegate];

  if (([v19 conformsToProtocol:&unk_1ED7008E0] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UITextFormattingActionHostToClient.m", 52, @"Scene's delegate (%@) does not conform to _UIHostedWindowSceneDelegate", objc_opt_class() object file lineNumber description];
  }
  v9 = [v19 window];
  v10 = [v9 rootViewController];

  if (([v10 conformsToProtocol:&unk_1ED7014E0] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_UITextFormattingActionHostToClient.m", 55, @"Scene delegate's root view controller (%@) does not conform to _UITextFormattingViewProviding", objc_opt_class() object file lineNumber description];
  }
  id v11 = v10;
  if (v8 == 1)
  {
    v15 = [(_UITextFormattingActionHostToClient *)self info];
    v16 = [v15 objectForSetting:2];
    v14 = +[UITextFormattingViewControllerFormattingDescriptor bs_secureDecodedFromData:v16];

    [v11 _setFormattingDescriptor:v14];
  }
  else
  {
    if (v8) {
      goto LABEL_10;
    }
    v12 = [(_UITextFormattingActionHostToClient *)self info];
    v13 = [v12 objectForSetting:1];
    v14 = +[UITextFormattingViewControllerConfiguration bs_secureDecodedFromData:v13];

    [v11 _setConfiguration:v14];
  }

LABEL_10:
}

@end