@interface QuerySuggestionTableViewCell
+ (double)estimatedCellHeight;
+ (id)identifier;
- (AutocompleteCellAccessoryDelegate)accessoryViewDelegate;
- (QuerySuggestionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (QuerySuggestionView)querySuggestionView;
- (id)accessoryViewObject;
- (int64_t)accessoryViewType;
- (void)didTapAccessoryViewButton:(id)a3;
- (void)prepareForReuse;
- (void)setAccessoryViewDelegate:(id)a3;
- (void)setAccessoryViewObject:(id)a3;
- (void)setAccessoryViewType:(int64_t)a3;
- (void)setQuerySuggestionView:(id)a3;
- (void)setTitle:(id)a3 highlightTitleRanges:(id)a4 detailText:(id)a5 style:(unint64_t)a6;
@end

@implementation QuerySuggestionTableViewCell

+ (double)estimatedCellHeight
{
  return 41.0;
}

- (QuerySuggestionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v27.receiver = self;
  v27.super_class = (Class)QuerySuggestionTableViewCell;
  v4 = [(QuerySuggestionTableViewCell *)&v27 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    [(QuerySuggestionTableViewCell *)v4 setBackgroundColor:v5];

    v6 = objc_alloc_init(QuerySuggestionView);
    querySuggestionView = v4->_querySuggestionView;
    v4->_querySuggestionView = v6;

    [(QuerySuggestionView *)v4->_querySuggestionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(QuerySuggestionTableViewCell *)v4 contentView];
    [v8 addSubview:v4->_querySuggestionView];

    v25 = [(QuerySuggestionView *)v4->_querySuggestionView leadingAnchor];
    v26 = [(QuerySuggestionTableViewCell *)v4 contentView];
    v24 = [v26 leadingAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v28[0] = v23;
    v21 = [(QuerySuggestionView *)v4->_querySuggestionView trailingAnchor];
    v22 = [(QuerySuggestionTableViewCell *)v4 contentView];
    v20 = [v22 trailingAnchor];
    v19 = [v21 constraintEqualToAnchor:v20];
    v28[1] = v19;
    v9 = [(QuerySuggestionView *)v4->_querySuggestionView topAnchor];
    v10 = [(QuerySuggestionTableViewCell *)v4 contentView];
    v11 = [v10 topAnchor];
    v12 = [v9 constraintEqualToAnchor:v11];
    v28[2] = v12;
    v13 = [(QuerySuggestionView *)v4->_querySuggestionView bottomAnchor];
    v14 = [(QuerySuggestionTableViewCell *)v4 contentView];
    v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v28[3] = v16;
    v17 = +[NSArray arrayWithObjects:v28 count:4];
    +[NSLayoutConstraint activateConstraints:v17];
  }
  return v4;
}

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)QuerySuggestionTableViewCell;
  [(QuerySuggestionTableViewCell *)&v4 prepareForReuse];
  v3 = [(QuerySuggestionTableViewCell *)self querySuggestionView];
  [v3 clearContents];

  [(QuerySuggestionTableViewCell *)self setAccessoryViewType:0];
  [(QuerySuggestionTableViewCell *)self setAccessoryViewObject:0];
  [(QuerySuggestionTableViewCell *)self setAccessoryViewDelegate:0];
}

- (void)setTitle:(id)a3 highlightTitleRanges:(id)a4 detailText:(id)a5 style:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(QuerySuggestionTableViewCell *)self querySuggestionView];
  [v13 setTitle:v12 highlightTitleRanges:v11 detailText:v10 style:a6];
}

- (void)setAccessoryViewType:(int64_t)a3
{
  self->_accessoryViewType = a3;
  switch(a3)
  {
    case 1:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      objc_super v4 = +[UIDevice currentDevice];
      id v5 = [v4 userInterfaceIdiom];
      v6 = @"plus";
      if (v5 == (id)5) {
        v6 = @"plus.circle";
      }
      v7 = v6;

      v8 = +[UIImage systemImageNamed:v7];

      [v27 setImage:v8 forState:0];
      v9 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v9 forImageInState:0];

      id v10 = [v27 theme];
      id v11 = [v10 keyColor];
      [v27 setTintColor:v11];

      CFStringRef v12 = @"AccessoryAddButton";
      goto LABEL_10;
    case 2:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      id v13 = +[UIImage systemImageNamed:@"arrow.up.backward.circle"];
      [v27 setImage:v13 forState:0];

      v14 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v14 forImageInState:0];

      v15 = +[UIColor secondaryLabelColor];
      [v27 setTintColor:v15];

      CFStringRef v12 = @"AccessoryQueryAcceleratorButton";
      goto LABEL_10;
    case 3:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      v16 = +[UIImage systemImageNamed:@"checkmark"];
      [v27 setImage:v16 forState:0];

      v17 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v17 forImageInState:0];

      v18 = +[UIColor secondaryLabelColor];
      [v27 setTintColor:v18];

      CFStringRef v12 = @"AccessoryCheckmarkButton";
      goto LABEL_10;
    case 4:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      v19 = +[UIDevice currentDevice];
      id v20 = [v19 userInterfaceIdiom];
      v21 = @"pin";
      if (v20 == (id)5) {
        v21 = @"pin.circle";
      }
      v22 = v21;

      v23 = +[UIImage systemImageNamed:v22];

      [v27 setImage:v23 forState:0];
      v24 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v24 forImageInState:0];

      v25 = [v27 theme];
      v26 = [v25 keyColor];
      [v27 setTintColor:v26];

      CFStringRef v12 = @"AccessoryPinButton";
LABEL_10:
      [v27 setAccessibilityIdentifier:v12];
      if (!v27) {
        goto LABEL_12;
      }
      [v27 addTarget:self action:"didTapAccessoryViewButton:" forControlEvents:64];
      break;
    default:
LABEL_12:
      id v27 = 0;
      break;
  }
  [(QuerySuggestionTableViewCell *)self setAccessoryView:v27];
}

- (void)didTapAccessoryViewButton:(id)a3
{
  id v6 = [(QuerySuggestionTableViewCell *)self accessoryViewDelegate];
  int64_t v4 = [(QuerySuggestionTableViewCell *)self accessoryViewType];
  id v5 = [(QuerySuggestionTableViewCell *)self accessoryViewObject];
  [v6 didTapOnAccessoryView:self withType:v4 object:v5];
}

- (AutocompleteCellAccessoryDelegate)accessoryViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryViewDelegate);

  return (AutocompleteCellAccessoryDelegate *)WeakRetained;
}

- (void)setAccessoryViewDelegate:(id)a3
{
}

- (id)accessoryViewObject
{
  return self->_accessoryViewObject;
}

- (void)setAccessoryViewObject:(id)a3
{
}

- (int64_t)accessoryViewType
{
  return self->_accessoryViewType;
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
  objc_storeStrong((id *)&self->_querySuggestionView, 0);
  objc_storeStrong(&self->_accessoryViewObject, 0);

  objc_destroyWeak((id *)&self->_accessoryViewDelegate);
}

@end