@interface _UITextFormattingActionClientToHost
+ (id)actionForChangeValue:(id)a3 textAttributesData:(id)a4;
+ (id)actionForDidFinish;
+ (id)actionForPresentColorPickerWithRect:(CGRect)a3 selectedColor:(id)a4;
+ (id)actionForPresentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4;
+ (id)actionForPresentTypographySettingsForFont:(id)a3;
- (void)performActionForSceneController:(id)a3;
@end

@implementation _UITextFormattingActionClientToHost

+ (id)actionForChangeValue:(id)a3 textAttributesData:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9B8];
  id v7 = a4;
  v8 = objc_msgSend(v6, "bs_secureDataFromObject:", a3);
  id v9 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v9 setObject:&unk_1ED3F7080 forSetting:0];
  [v9 setObject:v7 forSetting:6];

  [v9 setObject:v8 forSetting:1];
  v10 = (void *)[objc_alloc((Class)a1) initWithInfo:v9 responder:0];

  return v10;
}

+ (id)actionForPresentColorPickerWithRect:(CGRect)a3 selectedColor:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_secureDataFromObject:", a4);
  id v10 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v10 setObject:&unk_1ED3F7098 forSetting:0];
  [v10 setObject:v9 forSetting:3];
  *(CGFloat *)v14 = x;
  *(CGFloat *)&v14[1] = y;
  *(CGFloat *)&v14[2] = width;
  *(CGFloat *)&v14[3] = height;
  v11 = [MEMORY[0x1E4F29238] valueWithBytes:v14 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v10 setObject:v11 forSetting:2];

  v12 = (void *)[objc_alloc((Class)a1) initWithInfo:v10 responder:0];
  return v12;
}

+ (id)actionForPresentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9B8];
  id v7 = a3;
  v8 = objc_msgSend(v6, "bs_secureDataFromObject:", a4);
  id v9 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v9 setObject:&unk_1ED3F70B0 forSetting:0];
  [v9 setObject:v7 forSetting:4];

  [v9 setObject:v8 forSetting:5];
  id v10 = (void *)[objc_alloc((Class)a1) initWithInfo:v9 responder:0];

  return v10;
}

+ (id)actionForPresentTypographySettingsForFont:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_secureDataFromObject:", a3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v5 setObject:&unk_1ED3F70C8 forSetting:0];
  [v5 setObject:v4 forSetting:5];
  v6 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];

  return v6;
}

+ (id)actionForDidFinish
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v3 setObject:&unk_1ED3F70E0 forSetting:0];
  v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

- (void)performActionForSceneController:(id)a3
{
  id v5 = [a3 delegate];
  if (([v5 conformsToProtocol:&unk_1ED658EA0] & 1) == 0)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"_UITextFormattingActionClientToHost.m", 95, @"Scene controller's delegate (%@) does not conform to _UITextFormattingRemoteViewControllerHost", objc_opt_class() object file lineNumber description];
  }
  id v34 = v5;
  v6 = [(_UITextFormattingActionClientToHost *)self info];
  id v7 = [v6 objectForSetting:0];
  uint64_t v8 = [v7 integerValue];

  switch(v8)
  {
    case 0:
      id v9 = [(_UITextFormattingActionClientToHost *)self info];
      id v10 = [v9 objectForSetting:1];
      v11 = +[UITextFormattingViewControllerChangeValue bs_secureDecodedFromData:v10];

      v12 = [(_UITextFormattingActionClientToHost *)self info];
      v13 = [v12 objectForSetting:6];

      [v34 _textFormattingDidChangeValue:v11 textAttributesData:v13];
      goto LABEL_9;
    case 1:
      [v34 _textFormattingDidFinish];
      break;
    case 2:
      v14 = [(_UITextFormattingActionClientToHost *)self info];
      v15 = [v14 objectForSetting:3];
      v11 = +[UIColor bs_secureDecodedFromData:v15];

      v16 = [(_UITextFormattingActionClientToHost *)self info];
      v17 = [v16 objectForSetting:2];
      [v17 CGRectValue];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;

      objc_msgSend(v34, "_presentColorPicker:selectedColor:", v11, v19, v21, v23, v25);
      goto LABEL_10;
    case 3:
      v26 = [(_UITextFormattingActionClientToHost *)self info];
      v11 = [v26 objectForSetting:4];

      v13 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
      v27 = (void *)MEMORY[0x1E4F1C978];
      v28 = [(_UITextFormattingActionClientToHost *)self info];
      v29 = [v28 objectForSetting:5];
      v30 = objc_msgSend(v27, "bs_secureDecodedFromData:withAdditionalClasses:", v29, v13);

      [v34 _presentFontPickerWithConfiguration:v11 selectedFonts:v30];
      goto LABEL_9;
    case 4:
      v11 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
      v31 = [(_UITextFormattingActionClientToHost *)self info];
      v32 = [v31 objectForSetting:5];
      v13 = objc_msgSend(off_1E52D39B8, "bs_secureDecodedFromData:withAdditionalClasses:", v32, v11);

      [v34 _presentTypographySettingsForFont:v13];
LABEL_9:

LABEL_10:
      break;
    default:
      break;
  }
}

@end