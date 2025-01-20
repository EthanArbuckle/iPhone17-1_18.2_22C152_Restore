@interface _UIRemoteKeyboardPlaceholderView
+ (id)placeholderForView:(id)a3;
+ (id)placeholderWithWidth:(double)a3 height:(double)a4;
+ (id)placeholderWithWidthSizer:(id)a3 heightWithScene:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalMinimumHeightPlaceholder;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)refreshPlaceholder;
- (CGRect)_compatibleBounds;
- (CGSize)fixedSize;
- (CGSize)intrinsicContentSize;
- (CGSize)leftContentViewSize;
- (CGSize)rightContentViewSize;
- (NSString)description;
- (UIView)associatedView;
- (UIView)fallbackView;
- (UIView)placeheldView;
- (_UIRemoteKeyboardPlaceholderView)initWithSize:(CGSize)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_configureDebugOverlayIfNecessary;
- (void)setAssociatedView:(id)a3;
- (void)setFallbackView:(id)a3;
- (void)setFixedSize:(CGSize)a3;
@end

@implementation _UIRemoteKeyboardPlaceholderView

+ (id)placeholderForView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [_UIRemoteKeyboardPlaceholderView alloc];
    [v4 frame];
    uint64_t v8 = -[_UIRemoteKeyboardPlaceholderView initWithSize:](v5, "initWithSize:", v6, v7);
    v9 = (void *)v8;
    if (v8)
    {
      objc_storeStrong((id *)(v8 + 408), a3);
      id v10 = v9;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_UIRemoteKeyboardPlaceholderView)initWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)_UIRemoteKeyboardPlaceholderView;
  v5 = -[UIView initWithSize:](&v8, sel_initWithSize_);
  double v6 = v5;
  if (v5)
  {
    v5->_fixedSize.CGFloat width = width;
    v5->_fixedSize.CGFloat height = height;
    [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIRemoteKeyboardPlaceholderView *)v6 _configureDebugOverlayIfNecessary];
  }
  return v6;
}

+ (id)placeholderWithWidth:(double)a3 height:(double)a4
{
  id v4 = -[_UIRemoteKeyboardPlaceholderView initWithSize:]([_UIRemoteKeyboardPlaceholderView alloc], "initWithSize:", a3, a4);
  return v4;
}

+ (id)placeholderWithWidthSizer:(id)a3 heightWithScene:(id)a4
{
  v5 = (double (**)(void))a3;
  id v6 = a4;
  if (v5)
  {
    double v7 = -[_UIRemoteKeyboardPlaceholderView initWithSize:]([_UIRemoteKeyboardPlaceholderView alloc], "initWithSize:", v5[2](v5), 0.0);
    if (v7)
    {
      uint64_t v8 = [v5 copy];
      id sizeBlock = v7->_sizeBlock;
      v7->_id sizeBlock = (id)v8;

      objc_storeWeak((id *)&v7->_sceneForHeight, v6);
      id v10 = v7;
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (UIView)placeheldView
{
  mirroredView = self->_mirroredView;
  if (!mirroredView) {
    mirroredView = self->_fallbackView;
  }
  return mirroredView;
}

- (CGSize)intrinsicContentSize
{
  if (self->_mirroredView)
  {
    [(UIView *)self->_mirroredView bounds];
    double width = v2;
    double height = v4;
  }
  else
  {
    double width = self->_fixedSize.width;
    double height = self->_fixedSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(_UIRemoteKeyboardPlaceholderView *)self placeheldView];
  if (!v8) {
    goto LABEL_4;
  }
  v9 = (void *)v8;
  id v10 = [(_UIRemoteKeyboardPlaceholderView *)self placeheldView];
  v11 = [v10 window];

  if (v11)
  {
    v12 = [(_UIRemoteKeyboardPlaceholderView *)self placeheldView];
    v13 = [(_UIRemoteKeyboardPlaceholderView *)self placeheldView];
    -[UIView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v13, x, y);
    unsigned __int8 v14 = objc_msgSend(v12, "pointInside:withEvent:", v7);
  }
  else
  {
LABEL_4:
    v16.receiver = self;
    v16.super_class = (Class)_UIRemoteKeyboardPlaceholderView;
    unsigned __int8 v14 = -[UIView pointInside:withEvent:](&v16, sel_pointInside_withEvent_, v7, x, y);
  }

  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)refreshPlaceholder
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_mirroredView)
  {
    [(UIView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    [(UIView *)self->_mirroredView bounds];
    if (v4 != v8 || v6 != v7)
    {
LABEL_14:
      [(UIView *)self invalidateIntrinsicContentSize];
      LOBYTE(sizeBlock) = 1;
      return (char)sizeBlock;
    }
  }
  id sizeBlock = (double (**)(id, SEL))self->_sizeBlock;
  if (sizeBlock)
  {
    p_fixedSize = &self->_fixedSize;
    self->_fixedSize.double width = sizeBlock[2](sizeBlock, a2);
    v12 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneForHeight);
    [v12 intersectionHeightForWindowScene:WeakRetained isLocalMinimumHeightOut:&self->_isLocalMinimumHeight ignoreHorizontalOffset:1];
    self->_fixedSize.double height = v14;

    v15 = KeyboardArbiterClientLog_1();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v29.double width = p_fixedSize->width;
      v29.double height = self->_fixedSize.height;
      objc_super v16 = NSStringFromCGSize(v29);
      [(UIView *)self bounds];
      v30.double width = v17;
      v30.double height = v18;
      v19 = NSStringFromCGSize(v30);
      int v24 = 138412546;
      v25 = v16;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "-[_UIRemoteKeyboardPlaceholderView refreshPlaceholder]  refreshPlaceholder: size=%@ [previous size=%@]", (uint8_t *)&v24, 0x16u);
    }
    [(UIView *)self bounds];
    if (v21 == p_fixedSize->width && v20 == self->_fixedSize.height)
    {
      LOBYTE(sizeBlock) = 0;
      return (char)sizeBlock;
    }
    goto LABEL_14;
  }
  return (char)sizeBlock;
}

- (CGSize)fixedSize
{
  if (self->_mirroredView)
  {
    [(UIView *)self->_mirroredView bounds];
    double width = v2;
    double height = v4;
  }
  else
  {
    double width = self->_fixedSize.width;
    double height = self->_fixedSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFixedSize:(CGSize)a3
{
  self->_fixedSize = a3;
  if (!self->_mirroredView) {
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (NSString)description
{
  double v3 = NSString;
  if (self->_mirroredView)
  {
    double v4 = [NSString stringWithFormat:@"mirrored=%@", self->_mirroredView];
  }
  else
  {
    double v5 = NSStringFromCGSize(self->_fixedSize);
    double v4 = [v3 stringWithFormat:@"size=%@", v5];
  }
  double v6 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)_UIRemoteKeyboardPlaceholderView;
  double v7 = [(UIView *)&v10 description];
  double v8 = [v6 stringWithFormat:@"<%@; %@>", v7, v4];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = (id *)v5;
    double v7 = v6;
    if (self->_mirroredView)
    {
      char v8 = objc_msgSend(v6[51], "isEqual:");
LABEL_14:

      goto LABEL_15;
    }
    fallbackView = self->_fallbackView;
    if (fallbackView)
    {
      double v3 = [v6 fallbackView];
      if (![(UIView *)fallbackView isEqual:v3])
      {
        char v8 = 0;
        goto LABEL_13;
      }
      associatedView = self->_associatedView;
      if (!associatedView)
      {
        char v8 = 1;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      associatedView = self->_associatedView;
      if (!associatedView)
      {
        if (self->_fixedSize.width == *((double *)v6 + 52) && self->_fixedSize.height == *((double *)v6 + 53))
        {
          [(UIView *)self frame];
          double v15 = v14;
          double v17 = v16;
          [v7 frame];
          char v8 = v17 == v19 && v15 == v18;
        }
        else
        {
          char v8 = 0;
        }
        goto LABEL_14;
      }
    }
    v11 = [v7 associatedView];
    char v8 = [(UIView *)associatedView isEqual:v11];

    if (!fallbackView) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  char v8 = 0;
LABEL_15:

  return v8;
}

- (BOOL)isLocalMinimumHeightPlaceholder
{
  return self->_isLocalMinimumHeight;
}

- (void)_configureDebugOverlayIfNecessary
{
  if (qword_1EB25C690 != -1) {
    dispatch_once(&qword_1EB25C690, &__block_literal_global_274_0);
  }
  if (qword_1EB25C698)
  {
    -[UIView setBackgroundColor:](self, "setBackgroundColor:");
    id v3 = [(UIView *)self layer];
    [v3 setAllowsHitTesting:0];
  }
}

- (UIView)fallbackView
{
  return self->_fallbackView;
}

- (void)setFallbackView:(id)a3
{
}

- (UIView)associatedView
{
  return self->_associatedView;
}

- (void)setAssociatedView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedView, 0);
  objc_storeStrong((id *)&self->_fallbackView, 0);
  objc_destroyWeak((id *)&self->_sceneForHeight);
  objc_storeStrong(&self->_sizeBlock, 0);
  objc_storeStrong((id *)&self->_mirroredView, 0);
}

- (CGRect)_compatibleBounds
{
  if (self->_mirroredView)
  {
    [(UIView *)self->_mirroredView _compatibleBounds];
  }
  else
  {
    double width = self->_fixedSize.width;
    double height = self->_fixedSize.height;
    double v2 = 0.0;
    double v3 = 0.0;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGSize)leftContentViewSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)rightContentViewSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

@end