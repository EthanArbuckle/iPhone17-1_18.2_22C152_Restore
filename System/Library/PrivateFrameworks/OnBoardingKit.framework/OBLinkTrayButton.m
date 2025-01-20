@interface OBLinkTrayButton
+ (id)linkButton;
- (BOOL)_supportsMacIdiom;
- (void)updateConfiguration;
@end

@implementation OBLinkTrayButton

+ (id)linkButton
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___OBLinkTrayButton;
  v2 = objc_msgSendSuper2(&v8, sel_buttonWithType_, 1);
  v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBaseBackgroundColor:v4];

  [v3 setButtonSize:3];
  [v3 setTitleAlignment:2];
  [v3 contentInsets];
  double v6 = v5;
  [v3 contentInsets];
  objc_msgSend(v3, "setContentInsets:", v6, 0.0);
  [v2 setConfiguration:v3];

  return v2;
}

- (void)updateConfiguration
{
  v18.receiver = self;
  v18.super_class = (Class)OBLinkTrayButton;
  [(OBLinkTrayButton *)&v18 updateConfiguration];
  v3 = [(OBLinkTrayButton *)self configuration];
  v4 = [(OBLinkTrayButton *)self configuration];
  int v5 = [v4 showsActivityIndicator];

  if (v5) {
    [v3 setTitle:0];
  }
  double v6 = [(OBTrayButton *)self buttonFont];
  v7 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  objc_super v8 = (void *)[v7 mutableCopy];

  [v8 setAlignment:1];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __39__OBLinkTrayButton_updateConfiguration__block_invoke;
  v15 = &unk_1E58AEA38;
  id v16 = v6;
  id v17 = v8;
  id v9 = v8;
  id v10 = v6;
  [v3 setTitleTextAttributesTransformer:&v12];
  v11 = objc_msgSend(v3, "background", v12, v13, v14, v15);
  [v11 setCornerRadius:14.0];

  [(OBLinkTrayButton *)self setConfiguration:v3];
}

id __39__OBLinkTrayButton_updateConfiguration__block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *MEMORY[0x1E4FB0738];
  v7[0] = *MEMORY[0x1E4FB06F8];
  v7[1] = v1;
  uint64_t v2 = *(void *)(a1 + 40);
  v8[0] = *(void *)(a1 + 32);
  v8[1] = v2;
  v7[2] = *MEMORY[0x1E4FB0808];
  BOOL v3 = UIAccessibilityButtonShapesEnabled();
  v4 = &unk_1EEC378F8;
  if (v3) {
    v4 = &unk_1EEC378E0;
  }
  v8[2] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  return v5;
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

@end