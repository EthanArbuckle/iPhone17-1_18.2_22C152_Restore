@interface UICalendarViewDecoration
+ (UICalendarViewDecoration)decorationWithColor:(UIColor *)color size:(UICalendarViewDecorationSize)size;
+ (UICalendarViewDecoration)decorationWithCustomViewProvider:(void *)customViewProvider;
+ (UICalendarViewDecoration)decorationWithImage:(UIImage *)image;
+ (UICalendarViewDecoration)decorationWithImage:(UIImage *)image color:(UIColor *)color size:(UICalendarViewDecorationSize)size;
+ (double)_referenceHeightForTraitCollection:(id)a3;
- (UICalendarViewDecoration)init;
- (UICalendarViewDecoration)initWithCustomViewProvider:(void *)customViewProvider;
- (UICalendarViewDecoration)initWithDecorationItem:(id)a3;
- (UICalendarViewDecoration)initWithImage:(UIImage *)image color:(UIColor *)color size:(UICalendarViewDecorationSize)size;
- (UIView)_decorationView;
- (UIView)_parent;
- (id)_decorationViewForReuseView:(id)a3;
- (id)_decorationViewReusableKey;
- (void)_setDecorationView:(id)a3;
- (void)_setParent:(id)a3;
@end

@implementation UICalendarViewDecoration

- (UICalendarViewDecoration)init
{
  return [(UICalendarViewDecoration *)self initWithImage:0 color:0 size:1];
}

- (UICalendarViewDecoration)initWithImage:(UIImage *)image color:(UIColor *)color size:(UICalendarViewDecorationSize)size
{
  v8 = color;
  v9 = image;
  v10 = [[_UICalendarViewImageDecoration alloc] initWithImage:v9 color:v8 size:size];

  v11 = [(UICalendarViewDecoration *)self initWithDecorationItem:v10];
  return v11;
}

- (UICalendarViewDecoration)initWithCustomViewProvider:(void *)customViewProvider
{
  v4 = customViewProvider;
  v5 = [[_UICalendarViewCustomViewDecoration alloc] initWithCustomViewProvider:v4];

  v6 = [(UICalendarViewDecoration *)self initWithDecorationItem:v5];
  return v6;
}

- (UICalendarViewDecoration)initWithDecorationItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICalendarViewDecoration;
  v6 = [(UICalendarViewDecoration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_decoration, a3);
  }

  return v7;
}

+ (UICalendarViewDecoration)decorationWithColor:(UIColor *)color size:(UICalendarViewDecorationSize)size
{
  v6 = color;
  v7 = (void *)[objc_alloc((Class)a1) initWithImage:0 color:v6 size:size];

  return (UICalendarViewDecoration *)v7;
}

+ (UICalendarViewDecoration)decorationWithImage:(UIImage *)image
{
  v4 = image;
  id v5 = (void *)[objc_alloc((Class)a1) initWithImage:v4 color:0 size:1];

  return (UICalendarViewDecoration *)v5;
}

+ (UICalendarViewDecoration)decorationWithImage:(UIImage *)image color:(UIColor *)color size:(UICalendarViewDecorationSize)size
{
  v8 = color;
  objc_super v9 = image;
  v10 = (void *)[objc_alloc((Class)a1) initWithImage:v9 color:v8 size:size];

  return (UICalendarViewDecoration *)v10;
}

+ (UICalendarViewDecoration)decorationWithCustomViewProvider:(void *)customViewProvider
{
  v4 = customViewProvider;
  id v5 = (void *)[objc_alloc((Class)a1) initWithCustomViewProvider:v4];

  return (UICalendarViewDecoration *)v5;
}

- (UIView)_parent
{
  return [(_UICalendarViewDecorationItem *)self->_decoration _parent];
}

- (void)_setParent:(id)a3
{
}

- (UIView)_decorationView
{
  return [(_UICalendarViewDecorationItem *)self->_decoration _decorationView];
}

- (void)_setDecorationView:(id)a3
{
}

- (id)_decorationViewForReuseView:(id)a3
{
  return [(_UICalendarViewDecorationItem *)self->_decoration _decorationViewForReuseView:a3];
}

- (id)_decorationViewReusableKey
{
  return [(_UICalendarViewDecorationItem *)self->_decoration _decorationViewReusableKey];
}

+ (double)_referenceHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (!_MergedGlobals_3_20
     || *((void *)v4 + 13) != *(void *)(_MergedGlobals_3_20 + 104)
     || *((void *)v4 + 15) != *(void *)(_MergedGlobals_3_20 + 120)))
  {
    v6 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption2" compatibleWithTraitCollection:v4];
    v7 = +[UIImageSymbolConfiguration configurationWithScale:3];
    v8 = +[UIImageSymbolConfiguration configurationWithFont:v6];
    objc_super v9 = [v8 configurationByApplyingConfiguration:v7];
    v10 = +[UIImage systemImageNamed:@"square" withConfiguration:v9];
    objc_storeStrong((id *)&_MergedGlobals_3_20, a3);
    [v10 size];
    qword_1EB25CF28 = v11;
  }
  double v12 = *(double *)&qword_1EB25CF28;

  return v12;
}

- (void).cxx_destruct
{
}

@end