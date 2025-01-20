@interface _UIColorPickerActionHostToClient
+ (id)actionForConfiguration:(id)a3;
+ (id)actionForDismissEyeDropper:(BOOL)a3;
+ (id)actionForSelectedColor:(id)a3 withColorSpace:(id)a4;
- (void)performActionForHostedWindowScene:(id)a3;
@end

@implementation _UIColorPickerActionHostToClient

+ (id)actionForSelectedColor:(id)a3 withColorSpace:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9B8];
  id v7 = a4;
  v8 = objc_msgSend(v6, "bs_secureDataFromObject:", a3);
  id v9 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v9 setObject:&unk_1ED3F3CD8 forSetting:0];
  [v9 setObject:v8 forSetting:1];
  [v9 setObject:v7 forSetting:2];

  v10 = (void *)[objc_alloc((Class)a1) initWithInfo:v9 responder:0];
  return v10;
}

+ (id)actionForConfiguration:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_secureDataFromObject:", a3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v5 setObject:&unk_1ED3F3CF0 forSetting:0];
  [v5 setObject:v4 forSetting:3];
  v6 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];

  return v6;
}

+ (id)actionForDismissEyeDropper:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v5 setObject:&unk_1ED3F3D08 forSetting:0];
  [v5 setFlag:v3 forSetting:4];
  v6 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];

  return v6;
}

- (void)performActionForHostedWindowScene:(id)a3
{
  id v22 = [a3 delegate];
  if (([v22 conformsToProtocol:&unk_1ED7008E0] & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_UIColorPickerActionHostToClient.m", 62, @"Scene's delegate (%@) does not conform to _UIHostedWindowSceneDelegate", objc_opt_class() object file lineNumber description];
  }
  id v5 = [v22 window];
  v6 = [v5 rootViewController];

  if (([v6 conformsToProtocol:&unk_1ED6D2D18] & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_UIColorPickerActionHostToClient.m", 65, @"Scene delegate's root view controller (%@) does not conform to _UIColorPickerViewProviding", objc_opt_class() object file lineNumber description];
  }
  id v7 = v6;
  v8 = [(_UIColorPickerActionHostToClient *)self info];
  id v9 = [v8 objectForSetting:0];
  uint64_t v10 = [v9 integerValue];

  if (!v10)
  {
    v14 = [(_UIColorPickerActionHostToClient *)self info];
    v15 = [v14 objectForSetting:1];
    v13 = +[UIColor bs_secureDecodedFromData:v15];

    v16 = [(_UIColorPickerActionHostToClient *)self info];
    v17 = [v16 objectForSetting:2];

    [v7 _setSelectedColor:v13 colorSpace:v17];
LABEL_10:

    goto LABEL_12;
  }
  if (v10 != 2)
  {
    if (v10 != 1) {
      goto LABEL_12;
    }
    v11 = [(_UIColorPickerActionHostToClient *)self info];
    v12 = [v11 objectForSetting:3];
    v13 = +[_UIColorPickerViewControllerConfiguration bs_secureDecodedFromData:v12];

    [v7 _setConfiguration:v13];
    goto LABEL_10;
  }
  v18 = [(_UIColorPickerActionHostToClient *)self info];
  uint64_t v19 = [v18 BOOLForSetting:4];

  [v7 dismissEyedropper:v19];
LABEL_12:
}

@end