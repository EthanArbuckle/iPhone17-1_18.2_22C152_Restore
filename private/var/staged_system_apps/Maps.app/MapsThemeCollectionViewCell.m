@interface MapsThemeCollectionViewCell
+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize;
- (MapsThemeCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)didMoveToWindow;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MapsThemeCollectionViewCell

+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize
{
  return 1;
}

- (MapsThemeCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MapsThemeCollectionViewCell;
  v3 = -[MapsThemeCollectionViewCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(MapsThemeCollectionViewCell *)v3 setBackgroundColor:v4];

    id v5 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(MapsThemeCollectionViewCell *)v3 setBackgroundView:v5];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeCollectionViewCell;
  [(MapsThemeCollectionViewCell *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(MapsThemeCollectionViewCell *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    objc_super v7 = [(MapsThemeCollectionViewCell *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(MapsThemeCollectionViewCell *)self updateTheme];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MapsThemeCollectionViewCell;
  [(MapsThemeCollectionViewCell *)&v4 didMoveToWindow];
  v3 = [(MapsThemeCollectionViewCell *)self window];

  if (v3) {
    [(MapsThemeCollectionViewCell *)self updateTheme];
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_maps_overridePreferredLayoutAttributesWithCompressedSize"))
  {
    id v5 = [v4 copy];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    CGFloat v13 = v12;
    v14 = [(MapsThemeCollectionViewCell *)self contentView];
    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.height = v13;
    [v14 _maps_compressedSizeForWidth:0 withBlock:CGRectGetWidth(v19)];
    double v16 = v15;

    [v5 setFrame:v7, v9, v11, v16];
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

@end