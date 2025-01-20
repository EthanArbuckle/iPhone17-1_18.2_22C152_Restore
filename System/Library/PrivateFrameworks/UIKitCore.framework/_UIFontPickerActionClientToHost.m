@interface _UIFontPickerActionClientToHost
+ (id)actionForPickerDidCancel;
+ (id)actionForPickerDidSelectFont:(id)a3;
- (void)performActionForSceneController:(id)a3;
@end

@implementation _UIFontPickerActionClientToHost

+ (id)actionForPickerDidSelectFont:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:&unk_1ED3F6D98 forSetting:0];
  v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_secureDataFromObject:", v5);

  [v6 setObject:v7 forSetting:1];
  v8 = (void *)[objc_alloc((Class)a1) initWithInfo:v6 responder:0];

  return v8;
}

+ (id)actionForPickerDidCancel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v3 setObject:&unk_1ED3F6DB0 forSetting:0];
  v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

- (void)performActionForSceneController:(id)a3
{
  id v5 = a3;
  id v6 = [(_UIFontPickerActionClientToHost *)self info];
  v7 = [v6 objectForSetting:0];
  uint64_t v8 = [v7 integerValue];

  v9 = [v5 delegate];

  if (([v9 conformsToProtocol:&unk_1ED43E108] & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIFontPickerActionClientToHost.m", 46, @"Scene controller's delegate (%@) does not conform to _UIFontPickerViewControllerHost", objc_opt_class() object file lineNumber description];
  }
  id v14 = v9;
  if (v8 == 1)
  {
    [v14 _pickerDidCancel];
  }
  else if (!v8)
  {
    v10 = [(_UIFontPickerActionClientToHost *)self info];
    v11 = [v10 objectForSetting:1];
    v12 = objc_msgSend(off_1E52D39C0, "bs_secureDecodedFromData:", v11);

    [v14 _pickerDidSelectFont:v12];
  }
}

@end