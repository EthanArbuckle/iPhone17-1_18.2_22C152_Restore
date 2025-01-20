@interface CarSmallWidgetCollectionViewCell
+ (BOOL)isSubtitleHidden;
+ (double)bottomMargin;
+ (double)imageTopMargin;
- (CarFocusableCollectionItemDelegate)delegate;
- (CarSmallWidgetCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)focusColor;
- (void)focusableItemSelected;
- (void)setDelegate:(id)a3;
@end

@implementation CarSmallWidgetCollectionViewCell

+ (double)imageTopMargin
{
  return 0.0;
}

+ (BOOL)isSubtitleHidden
{
  return 1;
}

+ (double)bottomMargin
{
  return 0.0;
}

- (CarSmallWidgetCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarSmallWidgetCollectionViewCell;
  v3 = -[CarShortcutCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"_focusColorDidChange" name:CRSUIDashboardWidgetWindowFocusHighlightColorDidChangeNotification object:0];

    [(CarSmallWidgetCollectionViewCell *)v3 setAccessibilityIdentifier:@"CarSmallWidgetCollectionViewCell"];
  }
  return v3;
}

- (id)focusColor
{
  v3 = [(CarSmallWidgetCollectionViewCell *)self window];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(CarSmallWidgetCollectionViewCell *)self window];
    objc_super v6 = [v5 focusHighlightColor];
  }
  else
  {
    objc_super v6 = +[UIColor _carSystemFocusColor];
  }

  return v6;
}

- (void)focusableItemSelected
{
  id v3 = [(CarSmallWidgetCollectionViewCell *)self delegate];
  [v3 didSelectFocusableCollectionCell:self];
}

- (CarFocusableCollectionItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)(&self->super._focusOverridden + 1));

  return (CarFocusableCollectionItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end