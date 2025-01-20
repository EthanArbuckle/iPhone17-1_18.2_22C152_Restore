@interface _PUIStylePickerMicaAssetView
- (BOOL)setState:(id)a3;
- (BOOL)setState:(id)a3 animated:(BOOL)a4;
- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6;
- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7;
- (CAStateControllerDelegate)stateControllerDelegate;
- (CGSize)iconSize;
- (CGSize)intrinsicContentSize;
- (NSArray)publishedObjectNames;
- (_PUIStylePickerMicaAssetView)initWithFrame:(CGRect)a3;
- (id)publishedObjectWithName:(id)a3;
- (void)_layoutPackageView;
- (void)layoutSubviews;
- (void)setIconSize:(CGSize)a3;
- (void)setStateControllerDelegate:(id)a3;
- (void)updateAsset:(id)a3 bundle:(id)a4;
@end

@implementation _PUIStylePickerMicaAssetView

- (_PUIStylePickerMicaAssetView)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)_PUIStylePickerMicaAssetView;
  v5 = -[_PUIStylePickerMicaAssetView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    v5->_iconSize.CGFloat width = width;
    v5->_iconSize.CGFloat height = height;
    [(_PUIStylePickerMicaAssetView *)v5 setUserInteractionEnabled:0];
  }
  return v6;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_PUIStylePickerMicaAssetView;
  [(_PUIStylePickerMicaAssetView *)&v3 layoutSubviews];
  [(_PUIStylePickerMicaAssetView *)self _layoutPackageView];
}

- (void)updateAsset:(id)a3 bundle:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = [(_PUIStylePickerMicaAssetView *)self stateControllerDelegate];
  packageView = self->_packageView;
  if (packageView)
  {
    [(BSUICAPackageView *)packageView setStateControllerDelegate:0];
    [(BSUICAPackageView *)self->_packageView removeFromSuperview];
  }
  if ([v13 length])
  {
    if (!v6)
    {
      v9 = (void *)MEMORY[0x263F086E0];
      v10 = self;
      id v6 = [v9 bundleForClass:v10];
    }
    v11 = (BSUICAPackageView *)[objc_alloc(MEMORY[0x263F29D30]) initWithPackageName:v13 inBundle:v6];
    v12 = self->_packageView;
    self->_packageView = v11;

    [(_PUIStylePickerMicaAssetView *)self addSubview:self->_packageView];
    [(_PUIStylePickerMicaAssetView *)self _layoutPackageView];
    [(BSUICAPackageView *)self->_packageView setStateControllerDelegate:v7];
  }
}

- (void)setIconSize:(CGSize)a3
{
  if (self->_iconSize.width != a3.width || self->_iconSize.height != a3.height)
  {
    self->_iconSize = a3;
    [(_PUIStylePickerMicaAssetView *)self invalidateIntrinsicContentSize];
    [(_PUIStylePickerMicaAssetView *)self setNeedsUpdateConstraints];
    [(_PUIStylePickerMicaAssetView *)self setNeedsLayout];
  }
}

- (CAStateControllerDelegate)stateControllerDelegate
{
  return (CAStateControllerDelegate *)[(BSUICAPackageView *)self->_packageView stateControllerDelegate];
}

- (void)setStateControllerDelegate:(id)a3
{
}

- (NSArray)publishedObjectNames
{
  return (NSArray *)[(BSUICAPackageView *)self->_packageView publishedObjectNames];
}

- (id)publishedObjectWithName:(id)a3
{
  return (id)[(BSUICAPackageView *)self->_packageView publishedObjectWithName:a3];
}

- (BOOL)setState:(id)a3
{
  return [(BSUICAPackageView *)self->_packageView setState:a3];
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return [(BSUICAPackageView *)self->_packageView setState:a3 animated:a4];
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  v11 = (void (**)(id, void))a6;
  packageView = self->_packageView;
  if (packageView)
  {
    char v13 = [(BSUICAPackageView *)packageView setState:v10 animated:v8 transitionSpeed:v11 completion:a5];
  }
  else
  {
    if (v11) {
      v11[2](v11, 0);
    }
    char v13 = 0;
  }

  return v13;
}

- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  v14 = (void (**)(id, void))a7;
  packageView = self->_packageView;
  if (packageView)
  {
    char v16 = [(BSUICAPackageView *)packageView setState:v12 onLayer:v13 animated:v9 transitionSpeed:v14 completion:a6];
  }
  else
  {
    if (v14) {
      v14[2](v14, 0);
    }
    char v16 = 0;
  }

  return v16;
}

- (void)_layoutPackageView
{
  [(_PUIStylePickerMicaAssetView *)self intrinsicContentSize];
  [(_PUIStylePickerMicaAssetView *)self bounds];
  UIRectCenteredRect();
  packageView = self->_packageView;
  -[BSUICAPackageView setFrame:](packageView, "setFrame:");
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end