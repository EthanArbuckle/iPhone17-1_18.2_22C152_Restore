@interface VideosExtrasNavigationBarButton
+ (id)extrasBackButton:(int64_t)a3;
+ (id)extrasNavigationButton:(int64_t)a3;
+ (id)textDodgeColor;
+ (id)textFilter;
- (void)layoutSubviews;
@end

@implementation VideosExtrasNavigationBarButton

+ (id)textDodgeColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
}

+ (id)textFilter
{
  return (id)[MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2F8]];
}

+ (id)extrasNavigationButton:(int64_t)a3
{
  v5 = [a1 buttonWithType:1];
  v6 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  v7 = [v6 localizedStringForKey:@"BACK" value:0 table:@"VideosExtras"];
  [v5 setTitle:v7 forState:0];

  double v8 = 4.0;
  if (a3 == 1) {
    double v8 = 2.0;
  }
  objc_msgSend(v5, "setContentEdgeInsets:", v8, 10.0, v8, 8.0);
  [v5 setClipsToBounds:1];
  v9 = [v5 layer];
  [v9 setCornerRadius:5.0];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:11050];
  [v10 setGroupName:@"VideosExtrasBlurGroupName"];
  v11 = (void *)v5[93];
  v5[93] = v10;
  id v12 = v10;

  uint64_t v13 = [a1 textDodgeColor];
  v14 = (void *)v5[94];
  v5[94] = v13;

  [v5 setNeedsLayout];
  return v5;
}

+ (id)extrasBackButton:(int64_t)a3
{
  v4 = objc_msgSend(a1, "extrasNavigationButton:");
  if (extrasBackButton__onceToken != -1) {
    dispatch_once(&extrasBackButton__onceToken, &__block_literal_global_153);
  }
  v5 = &extrasBackButton__landscapeBackIndicatorImage;
  if (a3 != 1) {
    v5 = &extrasBackButton__backIndicatorImage;
  }
  [v4 setImage:*v5 forState:0];
  objc_msgSend(v4, "setImageEdgeInsets:", 0.0, -8.0, 0.0, 0.0);
  return v4;
}

void __52__VideosExtrasNavigationBarButton_extrasBackButton___block_invoke()
{
  v0 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UINavigationBarBackIndicatorDefault"];
  uint64_t v1 = [v0 imageFlippedForRightToLeftLayoutDirection];
  v2 = (void *)extrasBackButton__backIndicatorImage;
  extrasBackButton__backIndicatorImage = v1;

  id v5 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UINavigationBarBackIndicatorLandscape"];
  uint64_t v3 = [v5 imageFlippedForRightToLeftLayoutDirection];
  v4 = (void *)extrasBackButton__landscapeBackIndicatorImage;
  extrasBackButton__landscapeBackIndicatorImage = v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)VideosExtrasNavigationBarButton;
  [(VideosExtrasNavigationBarButton *)&v13 layoutSubviews];
  [(VideosExtrasNavigationBarButton *)self bounds];
  -[UIView setFrame:](self->_backdropView, "setFrame:");
  [(VideosExtrasNavigationBarButton *)self addSubview:self->_backdropView];
  uint64_t v3 = [(VideosExtrasNavigationBarButton *)self layer];
  [v3 setAllowsGroupBlending:0];

  v4 = [(id)objc_opt_class() textFilter];
  id v5 = self->_dodgeColor;
  [(VideosExtrasNavigationBarButton *)self setTitleColor:v5 forState:0];
  v6 = [(VideosExtrasNavigationBarButton *)self imageView];
  [v6 setTintColor:v5];

  v7 = [(VideosExtrasNavigationBarButton *)self titleLabel];
  double v8 = [v7 layer];

  v9 = [(VideosExtrasNavigationBarButton *)self imageView];
  v10 = [v9 layer];

  [v8 setCompositingFilter:v4];
  [v10 setCompositingFilter:v4];
  v11 = [(VideosExtrasNavigationBarButton *)self layer];
  [v11 addSublayer:v8];

  id v12 = [(VideosExtrasNavigationBarButton *)self layer];

  [v12 addSublayer:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dodgeColor, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end