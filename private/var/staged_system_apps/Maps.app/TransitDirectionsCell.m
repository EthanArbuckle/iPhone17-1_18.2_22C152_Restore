@interface TransitDirectionsCell
+ (Class)cellClassForListItem:(id)a3;
+ (Class)collectionCellClassForListItem:(id)a3;
+ (Class)stepViewClass;
+ (id)cellIdentifierForListItem:(id)a3;
+ (id)cellMapping;
+ (id)collectionCellMapping;
+ (id)dequeueCellForListItem:(id)a3 fromCollectionView:(id)a4 atIndexPath:(id)a5;
+ (id)dequeueCellForListItem:(id)a3 fromTableView:(id)a4 atIndexPath:(id)a5;
+ (void)registerCellsForCollectionView:(id)a3;
+ (void)registerCellsForTableView:(id)a3;
- (BOOL)useLeadingInstructionMarginAsLeadingSeparatorInset;
- (BOOL)useNavigationMetrics;
- (CGRect)_separatorFrame;
- (TransitDirectionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (TransitDirectionsListItem)transitListItem;
- (TransitDirectionsStepView)stepView;
- (UIView)trailingView;
- (double)_calculatedSeparatorHeight;
- (double)leadingInstructionMargin;
- (int64_t)navigationState;
- (unint64_t)displayOptions;
- (void)_setCalculatedSeparatorHeight:(double)a3;
- (void)configureWithItem:(id)a3;
- (void)prepareForReuse;
- (void)setAccessoryType:(int64_t)a3;
- (void)setDisplayOptions:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLeadingInstructionMargin:(double)a3;
- (void)setNavigationState:(int64_t)a3;
- (void)setTrailingView:(id)a3;
- (void)setUseLeadingInstructionMarginAsLeadingSeparatorInset:(BOOL)a3;
- (void)setUseNavigationMetrics:(BOOL)a3;
@end

@implementation TransitDirectionsCell

+ (Class)stepViewClass
{
  [a1 doesNotRecognizeSelector:a2];

  return (Class)objc_opt_class();
}

- (TransitDirectionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v32.receiver = self;
  v32.super_class = (Class)TransitDirectionsCell;
  v4 = [(TransitDirectionsCell *)&v32 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    [(TransitDirectionsCell *)v4 setBackgroundColor:v5];

    v6 = +[UIColor clearColor];
    v7 = [(TransitDirectionsCell *)v4 backgroundView];
    [v7 setBackgroundColor:v6];

    id v8 = objc_alloc((Class)[(id)objc_opt_class() stepViewClass]);
    v9 = [(TransitDirectionsCell *)v4 contentView];
    [v9 bounds];
    v10 = [v8 initWithFrame:];
    stepView = v4->_stepView;
    v4->_stepView = v10;

    [(TransitDirectionsStepView *)v4->_stepView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TransitDirectionsStepView *)v4->_stepView setCell:v4];
    v12 = [(TransitDirectionsCell *)v4 contentView];
    [v12 addSubview:v4->_stepView];

    id v13 = objc_alloc_init((Class)NSMutableArray);
    v30 = [(TransitDirectionsStepView *)v4->_stepView topAnchor];
    v31 = [(TransitDirectionsCell *)v4 contentView];
    v29 = [v31 topAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v33[0] = v28;
    v26 = [(TransitDirectionsStepView *)v4->_stepView leadingAnchor];
    v27 = [(TransitDirectionsCell *)v4 contentView];
    v25 = [v27 leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v33[1] = v24;
    v23 = [(TransitDirectionsCell *)v4 contentView];
    v14 = [v23 bottomAnchor];
    v15 = [(TransitDirectionsStepView *)v4->_stepView bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v33[2] = v16;
    v17 = [(TransitDirectionsCell *)v4 contentView];
    v18 = [v17 trailingAnchor];
    v19 = [(TransitDirectionsStepView *)v4->_stepView trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v33[3] = v20;
    v21 = +[NSArray arrayWithObjects:v33 count:4];
    [v13 addObjectsFromArray:v21];

    +[NSLayoutConstraint activateConstraints:v13];
  }
  return v4;
}

- (TransitDirectionsListItem)transitListItem
{
  return [(TransitDirectionsStepView *)self->_stepView transitListItem];
}

- (void)configureWithItem:(id)a3
{
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsCell;
  [(TransitDirectionsCell *)&v3 prepareForReuse];
  [(TransitDirectionsStepView *)self->_stepView prepareForReuse];
}

- (CGRect)_separatorFrame
{
  v21.receiver = self;
  v21.super_class = (Class)TransitDirectionsCell;
  [(TransitDirectionsCell *)&v21 _separatorFrame];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  if (self->_useLeadingInstructionMarginAsLeadingSeparatorInset)
  {
    if (MKApplicationLayoutDirectionIsRightToLeft())
    {
      v22.origin.x = v4;
      v22.origin.y = v6;
      v22.size.width = v8;
      v22.size.height = v10;
      double MaxX = CGRectGetMaxX(v22);
      [(TransitDirectionsCell *)self bounds];
      double v12 = CGRectGetMaxX(v23);
      [(TransitDirectionsStepView *)self->_stepView leadingInstructionMargin];
      double v14 = MaxX - (v12 - v13);
    }
    else
    {
      [(TransitDirectionsStepView *)self->_stepView leadingInstructionMargin];
      double v16 = v15;
      v24.origin.x = v4;
      v24.origin.y = v6;
      v24.size.width = v8;
      v24.size.height = v10;
      double v14 = v16 - CGRectGetMinX(v24);
      double v4 = v4 + v14;
    }
    double v8 = v8 - v14;
  }
  double v17 = v4;
  double v18 = v6;
  double v19 = v8;
  double v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)setUseLeadingInstructionMarginAsLeadingSeparatorInset:(BOOL)a3
{
  if (self->_useLeadingInstructionMarginAsLeadingSeparatorInset != a3)
  {
    self->_useLeadingInstructionMarginAsLeadingSeparatorInset = a3;
    id v4 = [(TransitDirectionsCell *)self separatorStyle];
    [(TransitDirectionsCell *)self setSeparatorStyle:((uint64_t)v4 + 1) % 3];
    [(TransitDirectionsCell *)self setSeparatorStyle:v4];
  }
}

- (void)setAccessoryType:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsCell;
  -[TransitDirectionsCell setAccessoryType:](&v6, "setAccessoryType:");
  double v5 = 0.0;
  if (!a3) {
    double v5 = 16.0;
  }
  [(TransitDirectionsStepView *)self->_stepView _setTrailingGuideToContentViewDistance:v5];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsCell;
  [(TransitDirectionsCell *)&v6 setHighlighted:a3 animated:a4];
  [(TransitDirectionsStepView *)self->_stepView setHighlighted:v4];
}

- (BOOL)useNavigationMetrics
{
  return [(TransitDirectionsStepView *)self->_stepView useNavigationMetrics];
}

- (void)setUseNavigationMetrics:(BOOL)a3
{
}

- (int64_t)navigationState
{
  return [(TransitDirectionsStepView *)self->_stepView navigationState];
}

- (void)setNavigationState:(int64_t)a3
{
}

- (unint64_t)displayOptions
{
  return [(TransitDirectionsStepView *)self->_stepView displayOptions];
}

- (void)setDisplayOptions:(unint64_t)a3
{
}

- (double)leadingInstructionMargin
{
  [(TransitDirectionsStepView *)self->_stepView leadingInstructionMargin];
  return result;
}

- (void)setLeadingInstructionMargin:(double)a3
{
}

- (UIView)trailingView
{
  return [(TransitDirectionsStepView *)self->_stepView trailingView];
}

- (void)setTrailingView:(id)a3
{
}

- (BOOL)useLeadingInstructionMarginAsLeadingSeparatorInset
{
  return self->_useLeadingInstructionMarginAsLeadingSeparatorInset;
}

- (TransitDirectionsStepView)stepView
{
  return self->_stepView;
}

- (double)_calculatedSeparatorHeight
{
  return self->__calculatedSeparatorHeight;
}

- (void)_setCalculatedSeparatorHeight:(double)a3
{
  self->__calculatedSeparatorHeight = a3;
}

- (void).cxx_destruct
{
}

+ (id)cellMapping
{
  if (qword_10160FF30 != -1) {
    dispatch_once(&qword_10160FF30, &stru_1012FFF80);
  }
  v2 = (void *)qword_10160FF28;

  return v2;
}

+ (Class)cellClassForListItem:(id)a3
{
  BOOL v4 = [a1 cellIdentifierForListItem:a3];
  double v5 = [a1 cellMapping];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  return (Class)v6;
}

+ (id)cellIdentifierForListItem:(id)a3
{
  id v3 = a3;
  switch((unint64_t)[v3 type])
  {
    case 0uLL:
    case 1uLL:
      BOOL v4 = (objc_class *)objc_opt_class();
      double v5 = NSStringFromClass(v4);
      if ([v3 type]) {
        CFStringRef v6 = @".Destination";
      }
      else {
        CFStringRef v6 = @".Origin";
      }
      double v7 = [v5 stringByAppendingString:v6];

      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
      double v8 = (objc_class *)objc_opt_class();
      double v7 = NSStringFromClass(v8);
      break;
    default:
      double v7 = 0;
      break;
  }

  return v7;
}

+ (void)registerCellsForTableView:(id)a3
{
  id v4 = a3;
  double v5 = [a1 cellMapping];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008EE09C;
  v7[3] = &unk_1012FFFA8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

+ (id)dequeueCellForListItem:(id)a3 fromTableView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  CGFloat v10 = [a1 cellIdentifierForListItem:a3];
  v11 = [v9 dequeueReusableCellWithIdentifier:v10 forIndexPath:v8];

  return v11;
}

+ (id)collectionCellMapping
{
  if (qword_10160FF40 != -1) {
    dispatch_once(&qword_10160FF40, &stru_1012FFFC8);
  }
  v2 = (void *)qword_10160FF38;

  return v2;
}

+ (Class)collectionCellClassForListItem:(id)a3
{
  id v4 = [a1 cellIdentifierForListItem:a3];
  double v5 = [a1 collectionCellMapping];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return (Class)v6;
}

+ (void)registerCellsForCollectionView:(id)a3
{
  id v4 = a3;
  double v5 = [a1 collectionCellMapping];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008EE5B0;
  v7[3] = &unk_1012FFFA8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

+ (id)dequeueCellForListItem:(id)a3 fromCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  CGFloat v10 = [a1 cellIdentifierForListItem:a3];
  v11 = [v9 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v8];

  return v11;
}

@end