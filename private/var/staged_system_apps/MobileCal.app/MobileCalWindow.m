@interface MobileCalWindow
- (CGSize)mainContentSize;
- (MobileCalWindow)init;
@end

@implementation MobileCalWindow

- (MobileCalWindow)init
{
  v6.receiver = self;
  v6.super_class = (Class)MobileCalWindow;
  v2 = [(MobileCalWindow *)&v6 init];
  if (v2)
  {
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    v3 = +[NSArray arrayWithObjects:v7 count:2];
    id v4 = [(MobileCalWindow *)v2 registerForTraitChanges:v3 withHandler:&stru_1001D4D70];
  }
  return v2;
}

- (CGSize)mainContentSize
{
  [(MobileCalWindow *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(MobileCalWindow *)self rootViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = [(MobileCalWindow *)self rootViewController];
    [v9 mainContentSize];
    double v11 = v10;
    double v13 = v12;

    if (v11 != CGSizeZero.width || v13 != CGSizeZero.height)
    {
      double v6 = v13;
      double v4 = v11;
    }
  }
  double v14 = v4;
  double v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

@end