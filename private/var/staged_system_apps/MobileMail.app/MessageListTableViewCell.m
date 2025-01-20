@interface MessageListTableViewCell
+ (NSString)reusableIdentifier;
- (MessageListCellHelper)cellHelper;
- (MessageListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)configurationState;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation MessageListTableViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)@"MessageListCollectionViewCell";
}

- (MessageListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MessageListTableViewCell;
  v7 = [(MessageListTableViewCell *)&v17 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = [MessageListCellView alloc];
    v9 = [(MessageListTableViewCell *)v7 contentView];
    [v9 bounds];
    v10 = -[MessageListCellView initWithFrame:](v8, "initWithFrame:");

    id v11 = objc_alloc((Class)MessageListCellHelper);
    v12 = [(MessageListTableViewCell *)v7 contentView];
    v13 = +[MessageListCellHelperMobileMailProxy sharedApplicationProxy];
    v14 = (MessageListCellHelper *)[v11 initWithParentView:v7 contentView:v12 cellView:v10 applicationProxy:v13];
    cellHelper = v7->_cellHelper;
    v7->_cellHelper = v14;

    [(MessageListTableViewCell *)v7 setAccessoryType:0];
  }

  return v7;
}

- (id)configurationState
{
  v7.receiver = self;
  v7.super_class = (Class)MessageListTableViewCell;
  v3 = [(MessageListTableViewCell *)&v7 configurationState];
  v4 = [(MessageListTableViewCell *)self cellHelper];
  v5 = [v4 configurationStateForCellConfigurationState:v3];

  return v5;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_super v7 = [(MessageListTableViewCell *)self cellHelper];
  [v7 setHighlighted:v5];

  v8.receiver = self;
  v8.super_class = (Class)MessageListTableViewCell;
  [(MessageListTableViewCell *)&v8 setHighlighted:v5 animated:v4];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_super v7 = [(MessageListTableViewCell *)self cellHelper];
  [v7 setSelected:v5];

  v8.receiver = self;
  v8.super_class = (Class)MessageListTableViewCell;
  [(MessageListTableViewCell *)&v8 setSelected:v5 animated:v4];
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(MessageListTableViewCell *)self cellHelper];
  BOOL v5 = [v4 contentConfigurationForState:v7];
  id v6 = [v4 backgroundConfigurationForState:v7];
  [v4 updateViewConfigurationForState:v7];
  [v4 updateViewContentConfiguration:v5];
  [v4 updateViewBackgroundConfiguration:v6];
  [(MessageListTableViewCell *)self setBackgroundConfiguration:v6];
}

- (void)layoutSubviews
{
  [(MessageListTableViewCell *)self frame];
  if (v3 >= 1.0)
  {
    v15.receiver = self;
    v15.super_class = (Class)MessageListTableViewCell;
    [(MessageListTableViewCell *)&v15 layoutSubviews];
    BOOL v4 = [(MessageListTableViewCell *)self contentView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(MessageListTableViewCell *)self cellHelper];
    v14 = [v13 cellView];
    [v14 setFrame:v6, v8, v10, v12];
  }
}

- (MessageListCellHelper)cellHelper
{
  return self->_cellHelper;
}

- (void).cxx_destruct
{
}

@end