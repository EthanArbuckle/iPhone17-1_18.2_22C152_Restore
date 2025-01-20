@interface SearchUIHeroButton
- (SFButtonItem)buttonItem;
- (SearchUIHeroButton)initWithTitle:(id)a3 image:(id)a4 command:(id)a5;
- (void)didMoveToWindow;
- (void)setButtonItem:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithTitle:(id)a3 image:(id)a4;
@end

@implementation SearchUIHeroButton

- (SearchUIHeroButton)initWithTitle:(id)a3 image:(id)a4 command:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIHeroButton;
  v9 = [(SearchUIHeroButton *)&v16 init];
  if (v9)
  {
    v10 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v10 setImagePlacement:1];
    objc_msgSend(v10, "setContentInsets:", 8.0, 4.0, 11.0, 4.0);
    [v10 setImagePadding:2.0];
    v11 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2998] scale:2];
    [v10 setPreferredSymbolConfigurationForImage:v11];

    v12 = objc_opt_new();
    v13 = [v10 background];
    [v13 setCustomView:v12];

    v14 = [v10 background];
    [v14 setCornerRadius:8.0];

    [(SearchUIHeroButton *)v9 setConfiguration:v10];
    [(SearchUIHeroButton *)v9 updateWithTitle:v7 image:v8];
  }
  return v9;
}

- (void)updateWithTitle:(id)a3 image:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4FB0850];
  id v9 = a4;
  v10 = [v8 defaultParagraphStyle];
  v11 = (void *)[v10 mutableCopy];

  [v11 setAlignment:1];
  if (v7)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
    v16[0] = *MEMORY[0x1E4FB06F8];
    v10 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB28D8] isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
    v16[1] = *MEMORY[0x1E4FB0738];
    v17[0] = v10;
    v17[1] = v11;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    v13 = (void *)[v12 initWithString:v7 attributes:v4];
  }
  else
  {
    v13 = 0;
  }
  v14 = [(SearchUIHeroButton *)self configuration];
  [v14 setAttributedTitle:v13];

  if (v7)
  {
  }
  v15 = [(SearchUIHeroButton *)self configuration];
  [v15 setImage:v9];

  [(SearchUIHeroButton *)self setNeedsUpdateConfiguration];
  [(SearchUIHeroButton *)self setTitle:v7 forState:0];
  [(SearchUIHeroButton *)self setImage:v9 forState:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIHeroButton;
  [(SearchUIHeroButton *)&v9 traitCollectionDidChange:v4];
  v5 = [(SearchUIHeroButton *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUIHeroButton *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(SearchUIHeroButton *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIHeroButton;
  [(SearchUIHeroButton *)&v3 didMoveToWindow];
  [(SearchUIHeroButton *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUIHeroButton;
  id v4 = a3;
  [(SearchUIHeroButton *)&v9 tlk_updateForAppearance:v4];
  v5 = (void *)MEMORY[0x1E4FAE060];
  unsigned int v6 = objc_msgSend(v4, "isDark", v9.receiver, v9.super_class);

  uint64_t v7 = [v5 appearanceWithStyle:v6];
  uint64_t v8 = [v7 primaryColor];
  [(SearchUIHeroButton *)self setTintColor:v8];
}

- (SFButtonItem)buttonItem
{
  return (SFButtonItem *)objc_getProperty(self, a2, 744, 1);
}

- (void)setButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end