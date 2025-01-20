@interface CollectionsFilterSizeController
- (CGSize)sizeForFilter:(id)a3;
- (CollectionsFilterSizeController)initWithCollectionsFilterDisplayStyle:(int64_t)a3 inContext:(int64_t)a4;
- (UIEdgeInsets)filterPillInset;
- (UIEdgeInsets)sectionInset;
- (double)defaultFilterHeight;
- (double)defaultHeight;
- (double)minimumInterItemSpacingForSectionAtIndex:(int64_t)a3;
- (double)minimumLineSpacingForSectionAtIndex:(int64_t)a3;
- (int64_t)displayStyle;
- (void)setDefaultFilterHeight:(double)a3;
- (void)setDisplayStyle:(int64_t)a3;
- (void)setFilterPillInset:(UIEdgeInsets)a3;
- (void)setSectionInset:(UIEdgeInsets)a3;
@end

@implementation CollectionsFilterSizeController

- (CollectionsFilterSizeController)initWithCollectionsFilterDisplayStyle:(int64_t)a3 inContext:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CollectionsFilterSizeController;
  v6 = [(CollectionsFilterSizeController *)&v11 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_displayStyle = a3;
  v6->_context = a4;
  double v8 = 40.0;
  if (a3 == 1) {
    double v8 = 16.0;
  }
  [(CollectionsFilterSizeController *)v6 setDefaultFilterHeight:v8];
  if (MapsFeature_IsEnabled_Maps269())
  {
    -[CollectionsFilterSizeController setFilterPillInset:](v7, "setFilterPillInset:", 6.0, 12.0, 6.0, 12.0);
    [(CollectionsFilterSizeController *)v7 setDefaultFilterHeight:32.0];
  }
  else
  {
    -[CollectionsFilterSizeController setFilterPillInset:](v7, "setFilterPillInset:", 15.0, 15.0, 15.0, 15.0);
  }
  switch(a4)
  {
    case 2:
      [(CollectionsFilterSizeController *)v7 setDefaultFilterHeight:32.0];
      double v9 = 2.0;
LABEL_15:
      [(CollectionsFilterSizeController *)v7 setSectionInset:v9];
      return v7;
    case 1:
      double v9 = 12.0;
      goto LABEL_15;
    case 0:
      double v9 = 13.0;
      if (v7->_displayStyle != 1) {
        double v9 = 16.0;
      }
      goto LABEL_15;
  }
  return v7;
}

- (CGSize)sizeForFilter:(id)a3
{
  NSAttributedStringKey v22 = NSFontAttributeName;
  id v4 = a3;
  v5 = [v4 filterFont];
  v23 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  v7 = [v4 filterTitle];

  [v7 sizeWithAttributes:v6];
  double v9 = v8;
  double v11 = v10;

  [(CollectionsFilterSizeController *)self defaultFilterHeight];
  if (v12 > v11)
  {
    [(CollectionsFilterSizeController *)self defaultFilterHeight];
    double v11 = v13;
  }
  [(CollectionsFilterSizeController *)self setDefaultFilterHeight:v11];
  [(CollectionsFilterSizeController *)self filterPillInset];
  double v15 = v14;
  [(CollectionsFilterSizeController *)self filterPillInset];
  double v17 = v16;
  [(CollectionsFilterSizeController *)self defaultFilterHeight];
  double v19 = v18;

  double v20 = v9 + v15 + v17;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (double)minimumLineSpacingForSectionAtIndex:(int64_t)a3
{
  [(CollectionsFilterSizeController *)self filterPillInset];
  return v3;
}

- (double)minimumInterItemSpacingForSectionAtIndex:(int64_t)a3
{
  int IsEnabled_Maps269 = MapsFeature_IsEnabled_Maps269();
  double result = 10.0;
  if (IsEnabled_Maps269) {
    return 8.0;
  }
  return result;
}

- (double)defaultHeight
{
  double defaultFilterHeight = self->_defaultFilterHeight;
  [(CollectionsFilterSizeController *)self sectionInset];
  double v5 = defaultFilterHeight + v4;
  [(CollectionsFilterSizeController *)self sectionInset];
  return v5 + v6;
}

- (UIEdgeInsets)filterPillInset
{
  double top = self->_filterPillInset.top;
  double left = self->_filterPillInset.left;
  double bottom = self->_filterPillInset.bottom;
  double right = self->_filterPillInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setFilterPillInset:(UIEdgeInsets)a3
{
  self->_filterPillInset = a3;
}

- (UIEdgeInsets)sectionInset
{
  double top = self->_sectionInset.top;
  double left = self->_sectionInset.left;
  double bottom = self->_sectionInset.bottom;
  double right = self->_sectionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
}

- (double)defaultFilterHeight
{
  return self->_defaultFilterHeight;
}

- (void)setDefaultFilterHeight:(double)a3
{
  self->_double defaultFilterHeight = a3;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(int64_t)a3
{
  self->_displayStyle = a3;
}

@end