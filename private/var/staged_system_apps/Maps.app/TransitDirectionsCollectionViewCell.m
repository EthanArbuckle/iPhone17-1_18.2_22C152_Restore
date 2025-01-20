@interface TransitDirectionsCollectionViewCell
+ (Class)stepViewClass;
- (BOOL)useNavigationMetrics;
- (TransitDirectionsCollectionViewCell)initWithFrame:(CGRect)a3;
- (TransitDirectionsListItem)transitListItem;
- (TransitDirectionsStepView)stepView;
- (UIView)trailingView;
- (double)leadingInstructionMargin;
- (int64_t)navigationState;
- (unint64_t)displayOptions;
- (void)configureWithItem:(id)a3;
- (void)prepareForReuse;
- (void)setDisplayOptions:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLeadingInstructionMargin:(double)a3;
- (void)setNavigationState:(int64_t)a3;
- (void)setTrailingView:(id)a3;
- (void)setUseNavigationMetrics:(BOOL)a3;
@end

@implementation TransitDirectionsCollectionViewCell

+ (Class)stepViewClass
{
  [a1 doesNotRecognizeSelector:a2];

  return (Class)objc_opt_class();
}

- (TransitDirectionsCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TransitDirectionsCollectionViewCell;
  v3 = -[TransitDirectionsCollectionViewCell initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(TransitDirectionsCollectionViewCell *)v3 setBackgroundColor:v4];

    v5 = +[UIColor clearColor];
    v6 = [(TransitDirectionsCollectionViewCell *)v3 contentView];
    [v6 setBackgroundColor:v5];

    [(TransitDirectionsCollectionViewCell *)v3 setClipsToBounds:1];
    uint64_t v7 = [(TransitDirectionsCollectionViewCell *)v3 contentView];
    stepView = v3->_stepView;
    v3->_stepView = (TransitDirectionsStepView *)v7;

    [(TransitDirectionsStepView *)v3->_stepView setCell:v3];
    +[RoutingAppearanceManager configureBackgroundViewForStepCell:v3];
  }
  return v3;
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
  v3.super_class = (Class)TransitDirectionsCollectionViewCell;
  [(TransitDirectionsCollectionViewCell *)&v3 prepareForReuse];
  [(TransitDirectionsStepView *)self->_stepView prepareForReuse];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsCollectionViewCell;
  -[TransitDirectionsCollectionViewCell setHighlighted:](&v5, "setHighlighted:");
  [(TransitDirectionsStepView *)self->_stepView setHighlighted:v3];
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
  [(TransitDirectionsStepView *)self->_stepView setNavigationState:a3];

  [(TransitDirectionsCollectionViewCell *)self setNeedsUpdateConfiguration];
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

- (TransitDirectionsStepView)stepView
{
  return self->_stepView;
}

- (void).cxx_destruct
{
}

@end