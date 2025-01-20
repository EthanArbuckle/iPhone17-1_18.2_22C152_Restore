@interface BookmarksBarLabelButton
+ (id)labelButton;
+ (id)labelButtonWithButtonStyle:(int64_t)a3;
+ (id)labelButtonWithSiteIcon;
- (BOOL)_canShowIcon;
- (BOOL)canBecomeFirstResponder;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)usesLightControls;
- (BookmarksBarLabelButton)initWithFrame:(CGRect)a3;
- (BookmarksBarLabelButtonDelegate)delegate;
- (CGRect)_bookmarksBarLabelButtonHitRect;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)themeColor;
- (UIEdgeInsets)cursorRegionInset;
- (WebBookmark)bookmark;
- (id)accessibilityIdentifier;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (int64_t)buttonStyle;
- (void)_editBookmark:(id)a3;
- (void)_handleLongPressGestureRecognizer:(id)a3;
- (void)_installFaviconView;
- (void)_openInNewTabs:(id)a3;
- (void)_setIcon:(id)a3;
- (void)_updateFaviconForURL:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setButtonStyle:(int64_t)a3;
- (void)setCursorRegionInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setThemeColor:(id)a3;
- (void)setUsesLightControls:(BOOL)a3;
@end

@implementation BookmarksBarLabelButton

+ (id)labelButtonWithButtonStyle:(int64_t)a3
{
  v4 = [a1 buttonWithType:1];
  v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  v6 = [v4 titleLabel];
  [v6 setFont:v5];

  [v4 setButtonStyle:a3];
  if (a3 <= 1) {
    [v4 _installFaviconView];
  }
  return v4;
}

+ (id)labelButtonWithSiteIcon
{
  v2 = [a1 buttonWithType:1];
  v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  v4 = [v2 titleLabel];
  [v4 setFont:v3];

  [v2 _installFaviconView];
  return v2;
}

+ (id)labelButton
{
  v2 = [a1 buttonWithType:1];
  v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  v4 = [v2 titleLabel];
  [v4 setFont:v3];

  return v2;
}

- (BookmarksBarLabelButton)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)BookmarksBarLabelButton;
  v3 = -[BookmarksBarLabelButton initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v3 action:sel__handleLongPressGestureRecognizer_];
    longPressGestureRecognizer = v3->_longPressGestureRecognizer;
    v3->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v4;

    [(BookmarksBarLabelButton *)v3 addGestureRecognizer:v3->_longPressGestureRecognizer];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB2088]) initWithTarget:v3 action:sel__handleLongPressGestureRecognizer_];
    [(BookmarksBarLabelButton *)v3 addGestureRecognizer:v6];

    objc_initWeak(&location, v3);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __41__BookmarksBarLabelButton_initWithFrame___block_invoke;
    v15 = &unk_1E6D78D70;
    objc_copyWeak(&v16, &location);
    [(BookmarksBarLabelButton *)v3 setPointerStyleProvider:&v12];
    id v7 = objc_alloc(MEMORY[0x1E4FB1758]);
    uint64_t v8 = objc_msgSend(v7, "initWithDelegate:", v3, v12, v13, v14, v15);
    editMenuInteraction = v3->_editMenuInteraction;
    v3->_editMenuInteraction = (UIEditMenuInteraction *)v8;

    [(BookmarksBarLabelButton *)v3 addInteraction:v3->_editMenuInteraction];
    v10 = v3;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v3;
}

id __41__BookmarksBarLabelButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 bounds];
  objc_msgSend(v3, "contentRectForBounds:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(v3, "titleRectForContentRect:");
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  objc_msgSend(v3, "imageRectForContentRect:", v6, v8, v10, v12);
  CGFloat x = v44.origin.x;
  CGFloat y = v44.origin.y;
  CGFloat width = v44.size.width;
  CGFloat height = v44.size.height;
  if (!CGRectIsEmpty(v44))
  {
    v45.origin.CGFloat x = v14;
    v45.origin.CGFloat y = v16;
    v45.size.CGFloat width = v18;
    v45.size.CGFloat height = v20;
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    CGRect v46 = CGRectUnion(v45, v49);
    double v14 = v46.origin.x;
    double v16 = v46.origin.y;
    double v18 = v46.size.width;
    double v20 = v46.size.height;
  }
  if ([WeakRetained _canShowIcon])
  {
    double v25 = v14 + -29.0;
    double v26 = v16 + -6.0;
    double v27 = v18 + 37.0;
    double v28 = v20 + 12.0;
  }
  else
  {
    v47.origin.CGFloat x = v14;
    v47.origin.CGFloat y = v16;
    v47.size.CGFloat width = v18;
    v47.size.CGFloat height = v20;
    CGRect v48 = CGRectInset(v47, -8.0, -6.0);
    double v25 = v48.origin.x;
    double v26 = v48.origin.y;
    double v27 = v48.size.width;
    double v28 = v48.size.height;
  }
  v29 = [v3 superview];
  objc_msgSend(v29, "convertRect:fromView:", v3, v25, v26, v27, v28);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  v38 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v3];
  v39 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v38];
  v40 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:", v31, v33, v35, v37);
  v41 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v39 shape:v40];

  return v41;
}

- (BOOL)_canShowIcon
{
  return self->_faviconView && !self->_hasLeadingEmoji;
}

- (void)_installFaviconView
{
  if (!self->_faviconView)
  {
    id v3 = (SFFaviconView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F78288]), "initWithFrame:", 0.0, 0.0, 18.0, 18.0);
    faviconView = self->_faviconView;
    self->_faviconView = v3;

    [(SFFaviconView *)self->_faviconView setIconContentMode:1];
    [(SFFaviconView *)self->_faviconView setUserInteractionEnabled:0];
    [(BookmarksBarLabelButton *)self addSubview:self->_faviconView];
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__BookmarksBarLabelButton__installFaviconView__block_invoke;
    v5[3] = &unk_1E6D78630;
    objc_copyWeak(&v6, &location);
    [(SFFaviconView *)self->_faviconView setTrailingInsetChangeHandler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __46__BookmarksBarLabelButton__installFaviconView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

- (void)_handleLongPressGestureRecognizer:(id)a3
{
  id v6 = a3;
  if ([v6 state] == 1)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB1750];
    [v6 locationInView:self];
    double v5 = objc_msgSend(v4, "configurationWithIdentifier:sourcePoint:", 0);
    [(UIEditMenuInteraction *)self->_editMenuInteraction presentEditMenuWithConfiguration:v5];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_openInNewTabs:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksBarLabelButtonDidSelectOpenInNewTab:self];
  }
}

- (void)_editBookmark:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarksBarLabelButtonDidSelectEdit:self];
  }
}

- (void)_setIcon:(id)a3
{
  id v5 = a3;
  if ([(BookmarksBarLabelButton *)self _canShowIcon]) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }
  [(SFFaviconView *)self->_faviconView setIcon:v4];
}

- (void)_updateFaviconForURL:(id)a3
{
  id v4 = a3;
  if (self->_faviconView)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F98AE8]), "initWithURL:iconSize:fallbackType:iconDownloadingEnabled:", v4, 1, 1, 16.0, 16.0);
    objc_initWeak(&location, self);
    id v6 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__BookmarksBarLabelButton__updateFaviconForURL___block_invoke;
    v9[3] = &unk_1E6D78D98;
    objc_copyWeak(&v10, &location);
    double v7 = [v6 registerRequest:v5 priority:2 responseHandler:v9];
    id faviconToken = self->_faviconToken;
    self->_id faviconToken = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __48__BookmarksBarLabelButton__updateFaviconForURL___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v5 favicon];
    [WeakRetained _setIcon:v4];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)BookmarksBarLabelButton;
  -[BookmarksBarLabelButton sizeThatFits:](&v12, sel_sizeThatFits_, a3.width, a3.height);
  double v7 = v6;
  if (self->_buttonStyle == 1)
  {
    double v8 = [(BookmarksBarLabelButton *)self imageForState:0];

    if (v8) {
      double v9 = 25.0;
    }
    else {
      double v9 = 21.0;
    }
  }
  else
  {
    double v9 = v5;
    if ([(BookmarksBarLabelButton *)self _canShowIcon])
    {
      double v9 = v9 + 21.0;
      if (width > 0.0) {
        double v9 = fmax(width, v9);
      }
    }
  }
  double v10 = v9;
  double v11 = v7;
  result.CGFloat height = v11;
  result.double width = v10;
  return result;
}

- (void)setBookmark:(id)a3
{
  double v5 = (WebBookmark *)a3;
  p_bookmark = &self->_bookmark;
  if (self->_bookmark != v5)
  {
    double v19 = v5;
    objc_storeStrong((id *)&self->_bookmark, a3);
    double v7 = [(WebBookmark *)*p_bookmark title];
    self->_hasLeadingEmoji = [(__CFString *)v7 safari_hasLeadingEmojiSafariIsRightToLeft:[(BookmarksBarLabelButton *)self _sf_usesLeftToRightLayout] ^ 1];
    int v8 = [(WebBookmark *)*p_bookmark showIconOnly];
    int64_t buttonStyle = self->_buttonStyle;
    if (v8)
    {
      if (buttonStyle != 2)
      {
        self->_int64_t buttonStyle = 1;
LABEL_6:
        if ([(WebBookmark *)*p_bookmark isFolder] && !self->_hasLeadingEmoji)
        {
          self->_int64_t buttonStyle = 0;
        }
        else if (self->_buttonStyle == 1)
        {
          if (self->_hasLeadingEmoji)
          {
            uint64_t v10 = [(__CFString *)v7 safari_leadingEmojiSafariIsRightToLeft:[(BookmarksBarLabelButton *)self _sf_usesLeftToRightLayout] ^ 1];

            double v7 = (__CFString *)v10;
          }
          else
          {

            double v7 = &stru_1F3C268E8;
          }
        }
      }
    }
    else if (buttonStyle == 1)
    {
      goto LABEL_6;
    }
    [(BookmarksBarLabelButton *)self setTitle:v7 forState:0];
    if ([(WebBookmark *)*p_bookmark isFolder])
    {
      double v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.down"];
      [(BookmarksBarLabelButton *)self setImage:v11 forState:0];

      objc_super v12 = (void *)MEMORY[0x1E4FB1830];
      double v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
      double v14 = [v12 configurationWithFont:v13 scale:1];
      [(BookmarksBarLabelButton *)self setPreferredSymbolConfiguration:v14 forImageInState:0];

      double v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"folder"];
      [(BookmarksBarLabelButton *)self _setIcon:v15];
    }
    else
    {
      double v16 = [MEMORY[0x1E4F78580] fallbackFavicon];
      [(BookmarksBarLabelButton *)self _setIcon:v16];

      id v17 = objc_alloc(MEMORY[0x1E4F1CB10]);
      double v18 = [(WebBookmark *)*p_bookmark address];
      double v15 = (void *)[v17 initWithString:v18];

      [(BookmarksBarLabelButton *)self _updateFaviconForURL:v15];
    }

    [(BookmarksBarLabelButton *)self setNeedsLayout];
    double v5 = v19;
  }
}

- (void)setThemeColor:(id)a3
{
}

- (UIColor)themeColor
{
  return (UIColor *)[(SFFaviconView *)self->_faviconView themeColor];
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)BookmarksBarLabelButton;
  -[BookmarksBarLabelButton titleRectForContentRect:](&v30, sel_titleRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  if ([(BookmarksBarLabelButton *)self _canShowIcon])
  {
    [(SFFaviconView *)self->_faviconView frame];
    double v9 = v8;
    [(SFFaviconView *)self->_faviconView frame];
    if (v7 >= v9)
    {
      double v14 = v10;
      [(SFFaviconView *)self->_faviconView frame];
      double v16 = (v7 - v15) * 0.5;
      [(SFFaviconView *)self->_faviconView frame];
      double v18 = v17;
      [(SFFaviconView *)self->_faviconView frame];
      -[SFFaviconView setFrame:](self->_faviconView, "setFrame:", v14, v16, v18);
      double v12 = 0.0;
    }
    else
    {
      double v12 = (v11 - v7) * 0.5;
    }
    [(SFFaviconView *)self->_faviconView trailingInset];
    double v13 = 21.0 - v19;
    double v20 = [(BookmarksBarLabelButton *)self imageForState:0];
    if (v20)
    {
      v21 = [(BookmarksBarLabelButton *)self _imageView];
      objc_msgSend(v21, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v23 = v22;
    }
    else
    {
      double v23 = 0.0;
    }

    v31.origin.CGFloat x = v13;
    v31.origin.CGFloat y = v12;
    v31.size.double width = v5;
    v31.size.CGFloat height = v7;
    double Width = CGRectGetWidth(v31);
    [(BookmarksBarLabelButton *)self bounds];
    double v25 = CGRectGetWidth(v32);
    v33.origin.CGFloat x = v13;
    v33.origin.CGFloat y = v12;
    v33.size.double width = v5;
    v33.size.CGFloat height = v7;
    double v5 = fmin(Width, v25 - CGRectGetMinX(v33) - v23);
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v26 = v13;
  double v27 = v12;
  double v28 = v5;
  double v29 = v7;
  result.size.CGFloat height = v29;
  result.size.double width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[BookmarksBarLabelButton titleRectForContentRect:](self, "titleRectForContentRect:");
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v38.receiver = self;
  v38.super_class = (Class)BookmarksBarLabelButton;
  -[BookmarksBarLabelButton titleRectForContentRect:](&v38, sel_titleRectForContentRect_, x, y, width, height);
  CGFloat v35 = v17;
  CGFloat v36 = v16;
  CGFloat v33 = v19;
  CGFloat v34 = v18;
  v37.receiver = self;
  v37.super_class = (Class)BookmarksBarLabelButton;
  -[BookmarksBarLabelButton imageRectForContentRect:](&v37, sel_imageRectForContentRect_, x, y, width, height);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v39.origin.double x = v9;
  v39.origin.double y = v11;
  v39.size.double width = v13;
  v39.size.double height = v15;
  CGRectGetMaxX(v39);
  _SFRoundFloatToPixels();
  double v27 = v26;
  v40.origin.double x = v9;
  v40.origin.double y = v11;
  v40.size.double width = v13;
  v40.size.double height = v15;
  double MinY = CGRectGetMinY(v40);
  v41.origin.double y = v35;
  v41.origin.double x = v36;
  v41.size.double height = v33;
  v41.size.double width = v34;
  double v29 = v21 + MinY - CGRectGetMinY(v41);
  double v30 = v27;
  double v31 = v23;
  double v32 = v25;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v29;
  result.origin.double x = v30;
  return result;
}

- (CGRect)_bookmarksBarLabelButtonHitRect
{
  [(BookmarksBarLabelButton *)self bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  UIEdgeInsetsMin();
  double v11 = v5 + v10;
  double v14 = v7 - (v12 + v13);
  double v16 = v9 - (v10 + v15);
  double v17 = v3 + v12;
  double v18 = v11;
  double v19 = v14;
  result.size.double height = v16;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(BookmarksBarLabelButton *)self _bookmarksBarLabelButtonHitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  double v5 = (void *)MEMORY[0x1E4FB1AD8];
  [(BookmarksBarLabelButton *)self _bookmarksBarLabelButtonHitRect];
  return (id)objc_msgSend(v5, "regionWithRect:identifier:", @"BookmarksBarLabelButton");
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3, a4, a5);
  double v7 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  double v8 = [(BookmarksBarLabelButton *)self bookmark];
  int v9 = [v7 bookmarkContainsLeafBookmark:v8];

  if (v9)
  {
    CGFloat v10 = [(BookmarksBarLabelButton *)self bookmark];
    [v10 isFolder];
    CGFloat v11 = _WBSLocalizedString();

    double v12 = [MEMORY[0x1E4FB1638] commandWithTitle:v11 image:0 action:sel__openInNewTabs_ propertyList:0];
    [v12 setAccessibilityIdentifier:@"OpenInNewTab"];
    [v6 addObject:v12];
  }
  double v13 = _WBSLocalizedString();
  double v14 = [MEMORY[0x1E4FB1638] commandWithTitle:v13 image:0 action:sel__editBookmark_ propertyList:0];
  [v14 setAccessibilityIdentifier:@"Edit"];
  [v6 addObject:v14];
  double v15 = [MEMORY[0x1E4FB1970] menuWithChildren:v6];
  [v15 setAccessibilityIdentifier:@"SafariContextMenu"];

  return v15;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  [(BookmarksBarLabelButton *)self bounds];
  if (self->_buttonStyle != 1) {
    goto LABEL_4;
  }
  if ([(BookmarksBarLabelButton *)self _canShowIcon])
  {
    [(SFFaviconView *)self->_faviconView bounds];
LABEL_4:
    double v6 = v5;
    goto LABEL_6;
  }
  double v7 = [(BookmarksBarLabelButton *)self titleLabel];
  [v7 bounds];
  double v6 = v8;

LABEL_6:
  -[BookmarksBarLabelButton convertRect:fromView:](self, "convertRect:fromView:", self, 0.0, 0.0, v6, 15.0);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (id)accessibilityIdentifier
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"Type";
  int v3 = [(WebBookmark *)self->_bookmark isFolder];
  double v4 = @"Bookmark";
  if (v3) {
    double v4 = @"Folder";
  }
  v13[0] = v4;
  v12[1] = @"PerBookmarkShowTitle";
  int v5 = [(WebBookmark *)self->_bookmark showIconOnly];
  double v6 = @"true";
  if (v5) {
    double v6 = @"false";
  }
  v13[1] = v6;
  v12[2] = @"ShowingIcon";
  BOOL v7 = [(BookmarksBarLabelButton *)self _canShowIcon];
  double v8 = @"Emoji";
  if (v7) {
    double v8 = @"Favicon";
  }
  v13[2] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  double v10 = WBSMakeAccessibilityIdentifier();

  return v10;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (BOOL)usesLightControls
{
  return self->_usesLightControls;
}

- (void)setUsesLightControls:(BOOL)a3
{
  self->_usesLightControls = a3;
}

- (BookmarksBarLabelButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BookmarksBarLabelButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)cursorRegionInset
{
  double top = self->_cursorRegionInset.top;
  double left = self->_cursorRegionInset.left;
  double bottom = self->_cursorRegionInset.bottom;
  double right = self->_cursorRegionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCursorRegionInset:(UIEdgeInsets)a3
{
  self->_cursorRegionInset = a3;
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(int64_t)a3
{
  self->_int64_t buttonStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong(&self->_faviconToken, 0);
  objc_storeStrong((id *)&self->_faviconView, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
}

@end