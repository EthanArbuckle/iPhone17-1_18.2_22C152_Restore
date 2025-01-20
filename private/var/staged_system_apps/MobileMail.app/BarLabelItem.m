@interface BarLabelItem
+ (id)_boldAttributes;
+ (id)_defaultAttributes;
- (BarLabelItem)initWithTitle:(id)a3 style:(int64_t)a4;
- (BarLabelItem)initWithTitle:(id)a3 width:(double)a4 style:(int64_t)a5;
- (BarLabelItem)initWithWidth:(double)a3 style:(int64_t)a4;
- (void)setTitle:(id)a3;
@end

@implementation BarLabelItem

+ (id)_boldAttributes
{
  if (qword_100699388 != -1) {
    dispatch_once(&qword_100699388, &stru_100604498);
  }
  v2 = (void *)qword_100699380;

  return v2;
}

+ (id)_defaultAttributes
{
  if (qword_100699398 != -1) {
    dispatch_once(&qword_100699398, &stru_1006044B8);
  }
  v2 = (void *)qword_100699390;

  return v2;
}

- (BarLabelItem)initWithTitle:(id)a3 style:(int64_t)a4
{
  return [(BarLabelItem *)self initWithTitle:a3 width:a4 style:0.0];
}

- (BarLabelItem)initWithWidth:(double)a3 style:(int64_t)a4
{
  return [(BarLabelItem *)self initWithTitle:0 width:a4 style:a3];
}

- (BarLabelItem)initWithTitle:(id)a3 width:(double)a4 style:(int64_t)a5
{
  id v7 = a3;
  id v8 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v12.receiver = self;
  v12.super_class = (Class)BarLabelItem;
  v9 = [(BarLabelItem *)&v12 initWithCustomView:v8];
  v10 = v9;
  if (v9)
  {
    v9->_itemStyle = a5;
    [(BarLabelItem *)v9 setTitle:v7];
  }

  return v10;
}

- (void)setTitle:(id)a3
{
  id v9 = a3;
  v4 = [(BarLabelItem *)self customView];
  if (!v9)
  {
    [v4 setText:0];
    goto LABEL_10;
  }
  int64_t itemStyle = self->_itemStyle;
  if (itemStyle)
  {
    if (itemStyle != 1)
    {
      id v7 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = [(id)objc_opt_class() _boldAttributes];
  }
  else
  {
    uint64_t v6 = [(id)objc_opt_class() _defaultAttributes];
  }
  id v7 = (void *)v6;
LABEL_9:
  id v8 = [objc_alloc((Class)NSAttributedString) initWithString:v9 attributes:v7];
  [v4 setAttributedText:v8];
  [v4 sizeToFit];

LABEL_10:
}

@end