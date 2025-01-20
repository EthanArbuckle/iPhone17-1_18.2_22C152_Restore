@interface SectionHeaderTableViewHeaderFooterView
+ (NSString)reuseIdentifier;
+ (double)estimatedHeight;
+ (double)heightWhenFirstNonEmptySection:(BOOL)a3 title:(id)a4 actionTitle:(id)a5 availableWidth:(double)a6 traitCollection:(id)a7;
- (BOOL)firstNonEmptySection;
- (BOOL)showsBottomHairline;
- (NSString)actionTitle;
- (NSString)title;
- (SectionHeaderTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3;
- (SectionHeaderTableViewHeaderFooterView)initWithTitle:(id)a3 isFirstNonEmptySection:(BOOL)a4;
- (SectionHeaderView)sectionHeaderView;
- (id)actionHandler;
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
@end

@implementation SectionHeaderTableViewHeaderFooterView

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

+ (double)estimatedHeight
{
  +[SectionHeaderView estimatedHeight];
  return result;
}

- (SectionHeaderTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SectionHeaderTableViewHeaderFooterView;
  v3 = [(SectionHeaderTableViewHeaderFooterView *)&v28 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(SectionHeaderTableViewHeaderFooterView *)v3 setBackgroundView:v4];

    [(SectionHeaderTableViewHeaderFooterView *)v3 setAccessibilityIdentifier:@"SectionHeaderTableViewHeaderFooterView"];
    v5 = [(SectionHeaderTableViewHeaderFooterView *)v3 contentView];
    [v5 setAccessibilityIdentifier:@"SectionHeaderTableViewHeaderFooterContent"];

    [(SectionHeaderTableViewHeaderFooterView *)v3 _mapsui_resetLayoutMarginsWithPreservesSuperview:1];
    v6 = [(SectionHeaderTableViewHeaderFooterView *)v3 contentView];
    [v6 _mapsui_resetLayoutMarginsWithPreservesSuperview:1];

    v7 = objc_alloc_init(SectionHeaderView);
    sectionHeaderView = v3->_sectionHeaderView;
    v3->_sectionHeaderView = v7;

    [(SectionHeaderView *)v3->_sectionHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(SectionHeaderTableViewHeaderFooterView *)v3 contentView];
    [v9 addSubview:v3->_sectionHeaderView];

    v26 = [(SectionHeaderView *)v3->_sectionHeaderView leadingAnchor];
    v27 = [(SectionHeaderTableViewHeaderFooterView *)v3 contentView];
    v25 = [v27 leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v29[0] = v24;
    v22 = [(SectionHeaderView *)v3->_sectionHeaderView trailingAnchor];
    v23 = [(SectionHeaderTableViewHeaderFooterView *)v3 contentView];
    v21 = [v23 trailingAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v29[1] = v20;
    v10 = [(SectionHeaderView *)v3->_sectionHeaderView topAnchor];
    v11 = [(SectionHeaderTableViewHeaderFooterView *)v3 contentView];
    v12 = [v11 topAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    v29[2] = v13;
    v14 = [(SectionHeaderView *)v3->_sectionHeaderView bottomAnchor];
    v15 = [(SectionHeaderTableViewHeaderFooterView *)v3 contentView];
    v16 = [v15 bottomAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    v29[3] = v17;
    v18 = +[NSArray arrayWithObjects:v29 count:4];
    +[NSLayoutConstraint activateConstraints:v18];
  }
  return v3;
}

- (void)setAccessibilityIdentifiersWithBaseString:(id)a3
{
  id v4 = a3;
  v5 = [v4 stringByAppendingString:@"SectionHeaderView"];
  [(SectionHeaderTableViewHeaderFooterView *)self setAccessibilityIdentifier:v5];

  v6 = [v4 stringByAppendingString:@"SectionHeaderViewContent"];
  v7 = [(SectionHeaderTableViewHeaderFooterView *)self contentView];
  [v7 setAccessibilityIdentifier:v6];

  v8 = [v4 stringByAppendingString:@"Section"];
  v9 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  [v9 setAccessibilityIdentifier:v8];

  v10 = [v4 stringByAppendingString:@"Action"];
  v11 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  v12 = [v11 actionButton];
  [v12 setAccessibilityIdentifier:v10];

  id v15 = [v4 stringByAppendingString:@"Title"];

  v13 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  v14 = [v13 label];
  [v14 setAccessibilityIdentifier:v15];
}

- (void)setFirstNonEmptySection:(BOOL)a3 topMargin:(double)a4
{
  BOOL v5 = a3;
  id v6 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  [v6 setFirstNonEmptySection:v5 topMargin:a4];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SectionHeaderTableViewHeaderFooterView;
  [(SectionHeaderTableViewHeaderFooterView *)&v4 prepareForReuse];
  v3 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  [v3 clearContents];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  [v5 setTitle:v4];
}

- (NSString)title
{
  v2 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setActionTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  [v5 setActionTitle:v4];
}

- (NSString)actionTitle
{
  v2 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  v3 = [v2 actionTitle];

  return (NSString *)v3;
}

- (void)setFirstNonEmptySection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  [v4 setFirstNonEmptySection:v3];
}

- (BOOL)firstNonEmptySection
{
  v2 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  unsigned __int8 v3 = [v2 firstNonEmptySection];

  return v3;
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  [v4 setShowsBottomHairline:v3];
}

- (BOOL)showsBottomHairline
{
  v2 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  unsigned __int8 v3 = [v2 showsBottomHairline];

  return v3;
}

- (void)setActionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  [v5 setActionHandler:v4];
}

- (id)actionHandler
{
  v2 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  unsigned __int8 v3 = [v2 actionHandler];

  return v3;
}

- (SectionHeaderTableViewHeaderFooterView)initWithTitle:(id)a3 isFirstNonEmptySection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(SectionHeaderTableViewHeaderFooterView *)self initWithReuseIdentifier:0];
  v8 = v7;
  if (v7)
  {
    [(SectionHeaderTableViewHeaderFooterView *)v7 setTitle:v6];
    [(SectionHeaderTableViewHeaderFooterView *)v8 setFirstNonEmptySection:v4];
  }

  return v8;
}

- (void)setActionTitle:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  [v8 setActionTitle:v7];

  id v9 = [(SectionHeaderTableViewHeaderFooterView *)self sectionHeaderView];
  [v9 setActionHandler:v6];
}

- (SectionHeaderView)sectionHeaderView
{
  return self->_sectionHeaderView;
}

- (void)setSectionHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end