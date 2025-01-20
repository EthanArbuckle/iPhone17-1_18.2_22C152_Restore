@interface QuerySuggestionCollectionViewCell
+ (double)estimatedCellHeight;
+ (id)identifier;
- (QuerySuggestionCollectionViewCell)initWithFrame:(CGRect)a3;
- (QuerySuggestionView)querySuggestionView;
- (void)prepareForReuse;
- (void)setQuerySuggestionView:(id)a3;
- (void)setTitle:(id)a3 highlightTitleRanges:(id)a4 detailText:(id)a5 style:(unint64_t)a6;
@end

@implementation QuerySuggestionCollectionViewCell

- (QuerySuggestionCollectionViewCell)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)QuerySuggestionCollectionViewCell;
  v3 = -[QuerySuggestionCollectionViewCell initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(QuerySuggestionCollectionViewCell *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc_init((Class)UIView);
    [(QuerySuggestionCollectionViewCell *)v3 setBackgroundView:v5];

    v6 = objc_alloc_init(QuerySuggestionView);
    querySuggestionView = v3->_querySuggestionView;
    v3->_querySuggestionView = v6;

    [(QuerySuggestionView *)v3->_querySuggestionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(QuerySuggestionCollectionViewCell *)v3 contentView];
    [v8 addSubview:v3->_querySuggestionView];

    v25 = [(QuerySuggestionView *)v3->_querySuggestionView leadingAnchor];
    v26 = [(QuerySuggestionCollectionViewCell *)v3 contentView];
    v24 = [v26 leadingAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v28[0] = v23;
    v21 = [(QuerySuggestionView *)v3->_querySuggestionView trailingAnchor];
    v22 = [(QuerySuggestionCollectionViewCell *)v3 contentView];
    v20 = [v22 trailingAnchor];
    v19 = [v21 constraintEqualToAnchor:v20];
    v28[1] = v19;
    v9 = [(QuerySuggestionView *)v3->_querySuggestionView topAnchor];
    v10 = [(QuerySuggestionCollectionViewCell *)v3 contentView];
    v11 = [v10 topAnchor];
    v12 = [v9 constraintEqualToAnchor:v11];
    v28[2] = v12;
    v13 = [(QuerySuggestionView *)v3->_querySuggestionView bottomAnchor];
    v14 = [(QuerySuggestionCollectionViewCell *)v3 contentView];
    v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v28[3] = v16;
    v17 = +[NSArray arrayWithObjects:v28 count:4];
    +[NSLayoutConstraint activateConstraints:v17];
  }
  return v3;
}

+ (double)estimatedCellHeight
{
  return 41.0;
}

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)setTitle:(id)a3 highlightTitleRanges:(id)a4 detailText:(id)a5 style:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(QuerySuggestionCollectionViewCell *)self querySuggestionView];
  [v13 setTitle:v12 highlightTitleRanges:v11 detailText:v10 style:a6];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)QuerySuggestionCollectionViewCell;
  [(QuerySuggestionCollectionViewCell *)&v4 prepareForReuse];
  v3 = [(QuerySuggestionCollectionViewCell *)self querySuggestionView];
  [v3 clearContents];
}

- (QuerySuggestionView)querySuggestionView
{
  return self->_querySuggestionView;
}

- (void)setQuerySuggestionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end