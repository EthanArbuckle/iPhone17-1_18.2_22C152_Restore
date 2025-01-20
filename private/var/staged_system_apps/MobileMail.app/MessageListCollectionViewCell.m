@interface MessageListCollectionViewCell
+ (NSString)reusableIdentifier;
+ (OS_os_log)log;
- (BOOL)needsFlushSeparator;
- (EFCancelable)messageListItemFetchTimeoutCancelable;
- (EFFuture)messageListItemFuture;
- (EMCollectionItemID)itemID;
- (EMMessageListItem)messageListItem;
- (MessageListCellDisclosureDelegate)disclosureDelegate;
- (MessageListCellHelper)cellHelper;
- (MessageListCollectionViewCell)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)separatorFlushLeadingConstraint;
- (id)configurationState;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (int64_t)backgroundViewConfigurationGrouping;
- (void)_didTapDisclosureButton:(id)a3;
- (void)applyIndicatorPreviewChangeAction:(id)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundViewConfigurationGrouping:(int64_t)a3;
- (void)setCellHelper:(id)a3;
- (void)setDisclosureDelegate:(id)a3;
- (void)setDisclosureEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setItemID:(id)a3;
- (void)setMessageListItemFetchTimeoutCancelable:(id)a3;
- (void)setMessageListItemFuture:(id)a3;
- (void)setNeedsFlushSeparator:(BOOL)a3;
- (void)setSeparatorFlushLeadingConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation MessageListCollectionViewCell

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6 = [(MessageListCollectionViewCell *)self cellHelper];
  v7 = [v6 cellView];
  [v7 setEditing:v4];

  [(MessageListCollectionViewCell *)self setNeedsUpdateConfiguration];
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(MessageListCollectionViewCell *)self cellHelper];
  v5 = [(MessageListCollectionViewCell *)self defaultBackgroundConfiguration];
  v6 = [v4 cellView];
  v7 = [v6 layoutValuesHelper];
  [v7 setDefaultBackgroundConfiguration:v5];

  v8 = [v4 contentConfigurationForState:v10];
  v9 = [v4 backgroundConfigurationForState:v10];
  if ([self _backgroundViewConfigurationGrouping] == 4) [v9 setBackgroundInsets:0.0, 0.0, 0.0, 0.0]; {
  [v4 updateViewConfigurationForState:v10];
  }
  [v4 updateViewContentConfiguration:v8];
  [v4 updateViewBackgroundConfiguration:v9];
  [(MessageListCollectionViewCell *)self setBackgroundConfiguration:v9];
  sub_10004735C(self);
}

- (void)layoutMarginsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)MessageListCollectionViewCell;
  [(MessageListCollectionViewCell *)&v5 layoutMarginsDidChange];
  v3 = [(MessageListCollectionViewCell *)self cellHelper];
  BOOL v4 = [v3 cellView];
  [v4 setNeedsLayout];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v5 = a3;
  v6 = [(MessageListCollectionViewCell *)self cellHelper];
  v7 = [v6 cellView];
  v8 = [v7 layoutValuesHelper];

  if (!v8)
  {
    v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MessageListCollectionCell.m", 148, @"Invalid parameter not satisfying: %@", @"layoutValuesHelper != nil" object file lineNumber description];
  }
  id v9 = [v6 style];
  if (v9 == (id)3) {
    [v8 topHitsLayoutValues];
  }
  else {
  id v10 = [v8 defaultLayoutValues];
  }
  [v10 defaultRowHeight];
  double v12 = v11;

  if ([v6 isCompact])
  {
    if (v9 == (id)3) {
      [v8 topHitsLayoutValues];
    }
    else {
    v13 = [v8 defaultLayoutValues];
    }
    [v13 compactRowHeight];
  }
  else
  {
    if (![v6 isExpanded]) {
      goto LABEL_17;
    }
    if (v9 == (id)3) {
      [v8 topHitsLayoutValues];
    }
    else {
    v13 = [v8 expandedLayoutValues];
    }
    [v13 defaultRowHeight];
  }
  double v12 = v14;

LABEL_17:
  if ([v6 disclosureEnabled]) {
    double v12 = v12 + 0.0;
  }
  [v5 size];
  [v5 setSize:];
  v15 = +[MessageListCollectionViewCell log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(MessageListCollectionViewCell *)self itemID];
    *(_DWORD *)buf = 138544386;
    v20 = v16;
    __int16 v21 = 1024;
    BOOL v22 = v9 == (id)3;
    __int16 v23 = 1024;
    unsigned int v24 = [v6 isCompact];
    __int16 v25 = 1024;
    unsigned int v26 = [v6 isExpanded];
    __int16 v27 = 2048;
    double v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "preferredLayoutAttributesFittingAttributes - (itemID=%{public}@), isTopHit: %{BOOL}d, isCompact: %{BOOL}d, isExpanded: %{BOOL}d, height: %f", buf, 0x28u);
  }

  return v5;
}

- (id)configurationState
{
  v7.receiver = self;
  v7.super_class = (Class)MessageListCollectionViewCell;
  v3 = [(MessageListCollectionViewCell *)&v7 configurationState];
  BOOL v4 = [(MessageListCollectionViewCell *)self cellHelper];
  id v5 = [v4 configurationStateForCellConfigurationState:v3];

  return v5;
}

- (MessageListCellHelper)cellHelper
{
  return self->_cellHelper;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009374;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006998C8 != -1) {
    dispatch_once(&qword_1006998C8, block);
  }
  v2 = (void *)qword_1006998C0;

  return (OS_os_log *)v2;
}

- (MessageListCollectionViewCell)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MessageListCollectionViewCell;
  v3 = -[MessageListCollectionViewCell initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    BOOL v4 = [MessageListCellView alloc];
    id v5 = [(MessageListCollectionViewCell *)v3 contentView];
    [v5 bounds];
    v6 = -[MessageListCellView initWithFrame:](v4, "initWithFrame:");

    id v7 = objc_alloc((Class)MessageListCellHelper);
    v8 = [(MessageListCollectionViewCell *)v3 contentView];
    id v9 = +[MessageListCellHelperMobileMailProxy sharedApplicationProxy];
    id v10 = (MessageListCellHelper *)[v7 initWithParentView:v3 contentView:v8 cellView:v6 applicationProxy:v9];
    cellHelper = v3->_cellHelper;
    v3->_cellHelper = v10;

    double v12 = [(MessageListCellHelper *)v3->_cellHelper cellView];
    v13 = [v12 disclosureButton];
    [v13 addTarget:v3 action:"_didTapDisclosureButton:" forControlEvents:64];

    [(MessageListCollectionViewCell *)v3 _setFocusStyle:0];
    sub_10004735C(v3);
  }
  return v3;
}

- (void)layoutSubviews
{
  [(MessageListCollectionViewCell *)self frame];
  if (v3 >= 1.0)
  {
    v15.receiver = self;
    v15.super_class = (Class)MessageListCollectionViewCell;
    [(MessageListCollectionViewCell *)&v15 layoutSubviews];
    BOOL v4 = [(MessageListCollectionViewCell *)self contentView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(MessageListCollectionViewCell *)self cellHelper];
    double v14 = [v13 cellView];
    [v14 setFrame:v6, v8, v10, v12];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MessageListCollectionViewCell;
  [(MessageListCollectionViewCell *)&v5 traitCollectionDidChange:v4];
  sub_10004735C(self);
}

- (EMMessageListItem)messageListItem
{
  v2 = [(MessageListCollectionViewCell *)self cellHelper];
  double v3 = [v2 messageListItem];

  return (EMMessageListItem *)v3;
}

- (EFFuture)messageListItemFuture
{
  return self->_messageListItemFuture;
}

- (void)setNeedsFlushSeparator:(BOOL)a3
{
  if (self->_needsFlushSeparator != a3)
  {
    BOOL v3 = a3;
    self->_needsFlushSeparator = a3;
    id v4 = [(MessageListCollectionViewCell *)self separatorFlushLeadingConstraint];
    [v4 setActive:v3];
  }
}

- (void)setMessageListItemFuture:(id)a3
{
}

- (void)setItemID:(id)a3
{
}

- (void)setBackgroundViewConfigurationGrouping:(int64_t)a3
{
  self->_backgroundViewConfigurationGrouping = a3;
  if ((unint64_t)(a3 - 1) >= 4) {
    a3 = 0;
  }
  [(MessageListCollectionViewCell *)self _setBackgroundViewConfigurationGrouping:a3];
}

- (void)setDisclosureDelegate:(id)a3
{
}

+ (NSString)reusableIdentifier
{
  return (NSString *)@"MessageListCollectionViewListCell";
}

- (void)_didTapDisclosureButton:(id)a3
{
  id v4 = [(MessageListCollectionViewCell *)self cellHelper];
  id v5 = [v4 disclosureEnabled];

  double v6 = [(MessageListCollectionViewCell *)self disclosureDelegate];
  double v7 = [(MessageListCollectionViewCell *)self cellHelper];
  double v8 = [v7 messageListItem];
  [v6 didSelectDisclosureButtonForMessageListItem:v8 disclosureEnabled:v5];

  [(MessageListCollectionViewCell *)self setNeedsUpdateConfiguration];
}

- (NSLayoutConstraint)separatorFlushLeadingConstraint
{
  separatorFlushLeadingConstraint = self->_separatorFlushLeadingConstraint;
  if (!separatorFlushLeadingConstraint)
  {
    id v4 = [(MessageListCollectionViewCell *)self separatorLayoutGuide];
    id v5 = [v4 leadingAnchor];
    double v6 = [(MessageListCollectionViewCell *)self leadingAnchor];
    double v7 = [v5 constraintEqualToAnchor:v6];
    double v8 = self->_separatorFlushLeadingConstraint;
    self->_separatorFlushLeadingConstraint = v7;

    separatorFlushLeadingConstraint = self->_separatorFlushLeadingConstraint;
  }

  return separatorFlushLeadingConstraint;
}

- (void)prepareForReuse
{
  [(MessageListCollectionViewCell *)self setHighlighted:0];
  [(MessageListCollectionViewCell *)self setSelected:0];
  [(MessageListCollectionViewCell *)self setDisclosureDelegate:0];
  [(MessageListCollectionViewCell *)self setNeedsFlushSeparator:0];
  BOOL v3 = [(MessageListCollectionViewCell *)self messageListItemFetchTimeoutCancelable];
  if (v3)
  {
    id v4 = +[MessageListCollectionViewCell log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(MessageListCollectionViewCell *)self itemID];
      *(_DWORD *)buf = 138543362;
      double v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "prepareForReuse - cancel message list item fetch timeout (itemID=%{public}@)", buf, 0xCu);
    }
    [v3 cancel];
    [(MessageListCollectionViewCell *)self setMessageListItemFetchTimeoutCancelable:0];
  }
  double v6 = [(MessageListCollectionViewCell *)self messageListItemFuture];
  if (v6)
  {
    double v7 = +[MessageListCollectionViewCell log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [(MessageListCollectionViewCell *)self itemID];
      *(_DWORD *)buf = 138543362;
      double v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "prepareForReuse - cancel message list item fetch (itemID=%{public}@)", buf, 0xCu);
    }
    [v6 cancel];
    [(MessageListCollectionViewCell *)self setMessageListItemFuture:0];
  }
  [(MessageListCollectionViewCell *)self setItemID:0];
  double v9 = [(MessageListCollectionViewCell *)self cellHelper];
  double v10 = [v9 cellView];
  [v10 setChevronType:1];

  double v11 = [(MessageListCollectionViewCell *)self cellHelper];
  [v11 prepareForReuse];

  v12.receiver = self;
  v12.super_class = (Class)MessageListCollectionViewCell;
  [(MessageListCollectionViewCell *)&v12 prepareForReuse];
}

- (void)setDisclosureEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(MessageListCollectionViewCell *)self cellHelper];
  [v6 setDisclosureEnabled:v5 animated:v4];
}

- (void)applyIndicatorPreviewChangeAction:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(MessageListCollectionViewCell *)self cellHelper];
  BOOL v5 = [v4 cellView];
  [v5 applyIndicatorPreviewChangeAction:v6];
}

- (int64_t)backgroundViewConfigurationGrouping
{
  return self->_backgroundViewConfigurationGrouping;
}

- (MessageListCellDisclosureDelegate)disclosureDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disclosureDelegate);

  return (MessageListCellDisclosureDelegate *)WeakRetained;
}

- (BOOL)needsFlushSeparator
{
  return self->_needsFlushSeparator;
}

- (EFCancelable)messageListItemFetchTimeoutCancelable
{
  return self->_messageListItemFetchTimeoutCancelable;
}

- (void)setMessageListItemFetchTimeoutCancelable:(id)a3
{
}

- (void)setCellHelper:(id)a3
{
}

- (void)setSeparatorFlushLeadingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorFlushLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_cellHelper, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_messageListItemFetchTimeoutCancelable, 0);
  objc_storeStrong((id *)&self->_messageListItemFuture, 0);

  objc_destroyWeak((id *)&self->_disclosureDelegate);
}

@end