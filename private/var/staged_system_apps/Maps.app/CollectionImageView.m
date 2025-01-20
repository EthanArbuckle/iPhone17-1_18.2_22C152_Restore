@interface CollectionImageView
- (BOOL)editing;
- (CollectionHandlerInfo)collectionInfo;
- (CollectionImageView)init;
- (CollectionImageView)initWithFrame:(CGRect)a3 makeCornersRounded:(BOOL)a4;
- (CollectionImageViewDelegate)delegate;
- (void)_addVibrancyIfNeeded;
- (void)_createViews;
- (void)_enableShadow:(BOOL)a3 imageView:(id)a4;
- (void)_updateGlyph;
- (void)_updateImages;
- (void)didMoveToWindow;
- (void)imageAction:(id)a3;
- (void)layoutSubviews;
- (void)setCollectionInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
@end

@implementation CollectionImageView

- (CollectionImageView)initWithFrame:(CGRect)a3 makeCornersRounded:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CollectionImageView;
  v5 = -[CollectionImageView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(CollectionImageView *)v5 setAccessibilityIgnoresInvertColors:1];
    v6->_makeCornersRoundedForMainView = a4;
    [(CollectionImageView *)v6 _createViews];
  }
  return v6;
}

- (CollectionImageView)init
{
  return -[CollectionImageView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)imageAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained collectionImageViewButtonSelected:self];
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_BOOL editing = a3;
    if ([(CollectionHandlerInfo *)self->_collectionInfo canEditImage]) {
      BOOL editing = self->_editing;
    }
    else {
      BOOL editing = 0;
    }
    [(UIButton *)self->_editButton setEnabled:editing];
    [(CollectionImageView *)self _updateGlyph];
  }
}

- (void)setCollectionInfo:(id)a3
{
  v5 = (CollectionHandlerInfo *)a3;
  collectionInfo = self->_collectionInfo;
  if (collectionInfo != v5)
  {
    v7 = v5;
    [(CollectionHandlerInfo *)collectionInfo removeObserver:self];
    objc_storeStrong((id *)&self->_collectionInfo, a3);
    [(CollectionHandlerInfo *)self->_collectionInfo addObserver:self];
    [(CollectionImageView *)self _updateImages];
    v5 = v7;
  }
}

- (void)_enableShadow:(BOOL)a3 imageView:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v4)
  {
    v6 = +[UIColor whiteColor];
    [v5 setTintColor:v6];

    v7 = [v5 layer];
    [v7 setShadowOffset:0.0, 0.0];

    id v8 = +[UIColor colorWithWhite:0.2 alpha:1.0];
    id v9 = [v8 CGColor];
    v10 = [v5 layer];
    [v10 setShadowColor:v9];

    v11 = [v5 layer];
    LODWORD(v12) = 1050253722;
    [v11 setShadowOpacity:v12];

    id v14 = [v5 layer];

    [v14 setShadowRadius:3.0];
  }
  else
  {
    v13 = +[UIColor colorWithWhite:0.620000005 alpha:1.0];
    [v5 setTintColor:v13];

    id v14 = [v5 layer];

    [v14 setShadowOpacity:0.0];
  }
}

- (void)_updateImages
{
  if ([(CollectionHandlerInfo *)self->_collectionInfo isFavoriteCollection])
  {
    [(UIImageView *)self->_mainImageView setImage:0];
  }
  else
  {
    v3 = [(CollectionHandlerInfo *)self->_collectionInfo image];
    [(UIImageView *)self->_mainImageView setImage:v3];

    BOOL v4 = [(CollectionImageView *)self theme];
    id v5 = [v4 imageBackgroundColor];
    [(UIImageView *)self->_mainImageView setTintColor:v5];

    [(CollectionImageView *)self _addVibrancyIfNeeded];
  }

  [(CollectionImageView *)self _updateGlyph];
}

- (void)_updateGlyph
{
  [(UIImageView *)self->_glyphImageView setTintColor:0];
  [(UIImageView *)self->_glyphImageView setBackgroundColor:0];
  [(UIImageView *)self->_glyphImageView _setContinuousCornerRadius:0.0];
  [(UIImageView *)self->_glyphImageView setHidden:0];
  if ([(CollectionHandlerInfo *)self->_collectionInfo handlerType] == (id)1)
  {
    [(CollectionImageView *)self _enableShadow:0 imageView:self->_glyphImageView];
    v3 = [(CollectionImageView *)self theme];
    BOOL v4 = [v3 keyColor];
    [(UIImageView *)self->_glyphImageView setTintColor:v4];

LABEL_5:
    uint64_t v5 = [(CollectionHandlerInfo *)self->_collectionInfo glyphImage];
LABEL_6:
    v6 = (void *)v5;
    [(UIImageView *)self->_glyphImageView setImage:v5];

    goto LABEL_7;
  }
  if ([(CollectionHandlerInfo *)self->_collectionInfo handlerType] == (id)2)
  {
    [(CollectionImageView *)self _enableShadow:0 imageView:self->_glyphImageView];
    v3 = +[UIColor systemGrayColor];
    [(UIImageView *)self->_glyphImageView setTintColor:v3];
    goto LABEL_5;
  }
  if ([(CollectionHandlerInfo *)self->_collectionInfo isFavoriteCollection])
  {
    [(CollectionImageView *)self _enableShadow:0 imageView:self->_glyphImageView];
    v11 = [(CollectionImageView *)self theme];
    double v12 = [v11 favoriteCollectionIconBackgroundColor];
    [(UIImageView *)self->_glyphImageView setBackgroundColor:v12];

    v13 = [(CollectionImageView *)self theme];
    id v14 = [v13 favoriteCollectionIconColor];
    [(UIImageView *)self->_glyphImageView setTintColor:v14];

    v15 = [(CollectionHandlerInfo *)self->_collectionInfo glyphImage];
    [(UIImageView *)self->_glyphImageView setImage:v15];

    [(UIImageView *)self->_glyphImageView _setContinuousCornerRadius:8.0];
  }
  else
  {
    if (self->_editing)
    {
      v16 = [(UIImageView *)self->_mainImageView image];
      BOOL v17 = v16 != 0;

      [(CollectionImageView *)self _enableShadow:v17 imageView:self->_glyphImageView];
      uint64_t v5 = +[UIImage systemImageNamed:@"camera.fill"];
      goto LABEL_6;
    }
    [(UIImageView *)self->_glyphImageView setImage:0];
    [(UIImageView *)self->_glyphImageView setHidden:1];
  }
LABEL_7:
  v7 = [(UIImageView *)self->_glyphImageView image];
  unsigned int v8 = [v7 isSymbolImage];

  glyphImageView = self->_glyphImageView;
  if (v8) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 1;
  }

  [(UIImageView *)glyphImageView setContentMode:v10];
}

- (void)_addVibrancyIfNeeded
{
  if (sub_1000BBB44(self) != 5)
  {
    if ([(CollectionHandlerInfo *)self->_collectionInfo hasDefaultImage])
    {
      if (!self->_visualEffectView)
      {
        v3 = +[UIBlurEffect effectWithStyle:1100];
        BOOL v4 = +[UIVibrancyEffect effectForBlurEffect:v3 style:6];
        uint64_t v5 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v4];
        visualEffectView = self->_visualEffectView;
        self->_visualEffectView = v5;

        [(CollectionImageView *)self addSubview:self->_visualEffectView];
        [(CollectionImageView *)self sendSubviewToBack:self->_visualEffectView];
      }
      v7 = +[UIColor whiteColor];
      [(UIImageView *)self->_mainImageView setTintColor:v7];

      id v9 = [(UIVisualEffectView *)self->_visualEffectView contentView];
      [(UIVisualEffectView *)v9 addSubview:self->_mainImageView];
      unsigned int v8 = v9;
    }
    else
    {
      [(CollectionImageView *)self addSubview:self->_mainImageView];
      [(CollectionImageView *)self sendSubviewToBack:self->_mainImageView];
      unsigned int v8 = self->_visualEffectView;
      self->_visualEffectView = 0;
    }
  }
}

- (void)didMoveToWindow
{
  v3 = [(CollectionImageView *)self window];

  if (v3)
  {
    BOOL v4 = [(CollectionImageView *)self superview];
    if (v4)
    {
      while (1)
      {
        id v7 = v4;
        if ([v4 conformsToProtocol:&OBJC_PROTOCOL___MKVibrantGroup]) {
          break;
        }
        uint64_t v5 = [v7 superview];

        BOOL v4 = (void *)v5;
        if (!v5) {
          return;
        }
      }
      v6 = [v7 vibrancyGroupName];
      [(UIVisualEffectView *)self->_visualEffectView _setGroupName:v6];
    }
  }
}

- (void)_createViews
{
  [(CollectionImageView *)self setAccessibilityIdentifier:@"CollectionImageView"];
  id v3 = objc_alloc((Class)UIImageView);
  [(CollectionImageView *)self bounds];
  id obj = [v3 initWithFrame:];
  [obj setClipsToBounds:1];
  [obj setContentMode:2];
  p_mainImageView = &self->_mainImageView;
  objc_storeStrong((id *)&self->_mainImageView, obj);
  [(UIImageView *)self->_mainImageView setAccessibilityIdentifier:@"CollectionImageViewMainImage"];
  if (sub_1000BBB44(self) == 5) {
    [(CollectionImageView *)self addSubview:*p_mainImageView];
  }
  if (self->_makeCornersRoundedForMainView) {
    [(UIImageView *)*p_mainImageView _setContinuousCornerRadius:8.0];
  }
  uint64_t v5 = [(UIImageView *)[objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
  [(UIImageView *)v5 setAccessibilityIdentifier:@"CollectionImageViewGlyphImage"];
  [(CollectionImageView *)self addSubview:v5];
  glyphImageView = self->_glyphImageView;
  self->_glyphImageView = v5;
  id v7 = v5;

  unsigned int v8 = +[UIButton buttonWithType:0];
  [(UIButton *)v8 setAccessibilityIdentifier:@"CollectionImageViewButton"];
  [(CollectionImageView *)self addSubview:v8];
  [(UIButton *)v8 addTarget:self action:"imageAction:" forControlEvents:64];
  editButton = self->_editButton;
  self->_editButton = v8;
  uint64_t v10 = v8;

  [(UIButton *)self->_editButton setEnabled:0];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CollectionImageView;
  [(CollectionImageView *)&v13 layoutSubviews];
  [(CollectionImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIButton setFrame:](self->_editButton, "setFrame:");
  -[UIImageView setFrame:](self->_mainImageView, "setFrame:", v4, v6, v8, v10);
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:", v4, v6, v8, v10);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  CGFloat v11 = CGRectGetWidth(v14) * 0.361111111;
  -[UIImageView setFrame:](self->_glyphImageView, "setFrame:", v4, v6, v8, v10);
  double v12 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:2 scale:v11];
  [(UIImageView *)self->_glyphImageView setPreferredSymbolConfiguration:v12];
}

- (CollectionHandlerInfo)collectionInfo
{
  return self->_collectionInfo;
}

- (CollectionImageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CollectionImageViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)editing
{
  return self->_editing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionInfo, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);

  objc_storeStrong((id *)&self->_mainImageView, 0);
}

@end