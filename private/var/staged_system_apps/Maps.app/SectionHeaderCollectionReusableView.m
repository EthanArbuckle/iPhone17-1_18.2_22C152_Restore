@interface SectionHeaderCollectionReusableView
+ (NSString)reuseIdentifier;
+ (double)estimatedHeight;
+ (double)heightWhenFirstNonEmptySection:(BOOL)a3 title:(id)a4 actionTitle:(id)a5 availableWidth:(double)a6 traitCollection:(id)a7;
- (BOOL)firstNonEmptySection;
- (BOOL)showsBottomHairline;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSString)actionTitle;
- (NSString)title;
- (SectionHeaderCollectionReusableView)initWithFrame:(CGRect)a3;
- (SectionHeaderCollectionReusableView)initWithTitle:(id)a3 isFirstNonEmptySection:(BOOL)a4;
- (SectionHeaderView)sectionHeaderView;
- (id)actionHandler;
- (void)layoutMarginsDidChange;
- (void)prepareForReuse;
- (void)setAccessibilityIdentifiersWithBaseString:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setActionTitle:(id)a3 completionHandler:(id)a4;
- (void)setFirstNonEmptySection:(BOOL)a3;
- (void)setFirstNonEmptySection:(BOOL)a3 topMargin:(double)a4;
- (void)setSectionHeaderView:(id)a3;
- (void)setShowsBottomHairline:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SectionHeaderCollectionReusableView

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SectionHeaderCollectionReusableView;
  id v4 = a3;
  [(SectionHeaderCollectionReusableView *)&v9 traitCollectionDidChange:v4];
  v5 = [(SectionHeaderCollectionReusableView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8) {
    [(SectionHeaderCollectionReusableView *)self invalidateIntrinsicContentSize];
  }
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SectionHeaderCollectionReusableView;
  [(SectionHeaderCollectionReusableView *)&v3 layoutMarginsDidChange];
  [(SectionHeaderCollectionReusableView *)self invalidateIntrinsicContentSize];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  [(SectionHeaderCollectionReusableView *)self layoutMargins];
  double v11 = width - v10;
  [(SectionHeaderCollectionReusableView *)self layoutMargins];
  double v13 = v11 - v12;
  v14 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  [v14 updateConstraintsWithAvailableWidthWithoutMargins:v13];

  v19.receiver = self;
  v19.super_class = (Class)SectionHeaderCollectionReusableView;
  *(float *)&double v15 = a4;
  *(float *)&double v16 = a5;
  -[SectionHeaderCollectionReusableView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v19, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v15, v16);
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (SectionHeaderCollectionReusableView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SectionHeaderCollectionReusableView;
  objc_super v3 = -[SectionHeaderCollectionReusableView initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[UIColor clearColor];
    [(SectionHeaderCollectionReusableView *)v3 setBackgroundColor:v4];

    [(SectionHeaderCollectionReusableView *)v3 setAccessibilityIdentifier:@"SectionHeaderCollectionReusableView"];
    [(SectionHeaderCollectionReusableView *)v3 _mapsui_resetLayoutMargins];
    [(SectionHeaderCollectionReusableView *)v3 setEdgesPreservingSuperviewLayoutMargins:10];
    v5 = objc_alloc_init(SectionHeaderView);
    sectionHeaderView = v3->_sectionHeaderView;
    v3->_sectionHeaderView = v5;

    [(SectionHeaderView *)v3->_sectionHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SectionHeaderCollectionReusableView *)v3 addSubview:v3->_sectionHeaderView];
    v20 = [(SectionHeaderView *)v3->_sectionHeaderView leadingAnchor];
    objc_super v19 = [(SectionHeaderCollectionReusableView *)v3 leadingAnchor];
    double v18 = [v20 constraintEqualToAnchor:v19];
    v22[0] = v18;
    double v17 = [(SectionHeaderView *)v3->_sectionHeaderView trailingAnchor];
    v7 = [(SectionHeaderCollectionReusableView *)v3 trailingAnchor];
    uint64_t v8 = [v17 constraintEqualToAnchor:v7];
    v22[1] = v8;
    objc_super v9 = [(SectionHeaderView *)v3->_sectionHeaderView topAnchor];
    double v10 = [(SectionHeaderCollectionReusableView *)v3 topAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];
    v22[2] = v11;
    double v12 = [(SectionHeaderView *)v3->_sectionHeaderView bottomAnchor];
    double v13 = [(SectionHeaderCollectionReusableView *)v3 bottomAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v22[3] = v14;
    double v15 = +[NSArray arrayWithObjects:v22 count:4];
    +[NSLayoutConstraint activateConstraints:v15];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  [v5 setTitle:v4];
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  [v4 setShowsBottomHairline:v3];
}

- (void)setFirstNonEmptySection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  [v4 setFirstNonEmptySection:v3];
}

- (void)setActionTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  [v5 setActionTitle:v4];
}

- (void)setActionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  [v5 setActionHandler:v4];
}

- (void)setAccessibilityIdentifiersWithBaseString:(id)a3
{
  id v4 = a3;
  id v5 = [v4 stringByAppendingString:@"SectionHeaderView"];
  [(SectionHeaderCollectionReusableView *)self setAccessibilityIdentifier:v5];

  v6 = [v4 stringByAppendingString:@"Section"];
  v7 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  [v7 setAccessibilityIdentifier:v6];

  uint64_t v8 = [v4 stringByAppendingString:@"Action"];
  objc_super v9 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  double v10 = [v9 actionButton];
  [v10 setAccessibilityIdentifier:v8];

  id v13 = [v4 stringByAppendingString:@"Title"];

  double v11 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  double v12 = [v11 label];
  [v12 setAccessibilityIdentifier:v13];
}

- (SectionHeaderView)sectionHeaderView
{
  return self->_sectionHeaderView;
}

+ (double)estimatedHeight
{
  +[SectionHeaderView estimatedHeight];
  return result;
}

+ (NSString)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (double)heightWhenFirstNonEmptySection:(BOOL)a3 title:(id)a4 actionTitle:(id)a5 availableWidth:(double)a6 traitCollection:(id)a7
{
  +[SectionHeaderView heightWhenFirstNonEmptySection:a3 title:a4 actionTitle:a5 availableWidth:a7 traitCollection:a6];
  return result;
}

- (void)setFirstNonEmptySection:(BOOL)a3 topMargin:(double)a4
{
  BOOL v5 = a3;
  id v6 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  [v6 setFirstNonEmptySection:v5 topMargin:a4];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SectionHeaderCollectionReusableView;
  [(SectionHeaderCollectionReusableView *)&v4 prepareForReuse];
  BOOL v3 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  [v3 clearContents];
}

- (NSString)title
{
  v2 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  BOOL v3 = [v2 title];

  return (NSString *)v3;
}

- (NSString)actionTitle
{
  v2 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  BOOL v3 = [v2 actionTitle];

  return (NSString *)v3;
}

- (BOOL)firstNonEmptySection
{
  v2 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  unsigned __int8 v3 = [v2 firstNonEmptySection];

  return v3;
}

- (BOOL)showsBottomHairline
{
  v2 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  unsigned __int8 v3 = [v2 showsBottomHairline];

  return v3;
}

- (id)actionHandler
{
  v2 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  unsigned __int8 v3 = [v2 actionHandler];

  return v3;
}

- (SectionHeaderCollectionReusableView)initWithTitle:(id)a3 isFirstNonEmptySection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(SectionHeaderCollectionReusableView *)self init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(SectionHeaderCollectionReusableView *)v7 setTitle:v6];
    [(SectionHeaderCollectionReusableView *)v8 setFirstNonEmptySection:v4];
  }

  return v8;
}

- (void)setActionTitle:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  [v8 setActionTitle:v7];

  id v9 = [(SectionHeaderCollectionReusableView *)self sectionHeaderView];
  [v9 setActionHandler:v6];
}

- (void)setSectionHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end