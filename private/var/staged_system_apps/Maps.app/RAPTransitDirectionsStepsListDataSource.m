@interface RAPTransitDirectionsStepsListDataSource
- (RAPTransitDirectionsStepsListDelegate)rapDelegate;
- (id)_rapDisclosureViewForCell:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)_displayModeForItem:(id)a3;
- (void)_attachDisclosureViewToCell:(id)a3;
- (void)setRapDelegate:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation RAPTransitDirectionsStepsListDataSource

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RAPTransitDirectionsStepsListDataSource;
  v5 = [(TransitDirectionsStepsListDataSource *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  [v5 setAccessoryType:0];
  v6 = +[UIColor secondarySystemGroupedBackgroundColor];
  [v5 setBackgroundColor:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v5 stepView];
    v8 = [v7 detailButton];
    [v8 setHidden:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setUserInteractionEnabled:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setUserInteractionEnabled:0];
  }
  [(RAPTransitDirectionsStepsListDataSource *)self _attachDisclosureViewToCell:v5];

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RAPTransitDirectionsStepsListDataSource;
  [(TransitDirectionsStepsListDataSource *)&v14 tableView:v8 willDisplayCell:v9 forRowAtIndexPath:v10];
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    [v13 set_mapkit_forceSeparatorFrameToCGRectZero:[self tableView:numberOfRowsInSection:v8] == 2 == [v10 row]];
    [v13 setUseLeadingInstructionMarginAsLeadingSeparatorInset:1];
  }
}

- (void)_attachDisclosureViewToCell:(id)a3
{
  id v4 = a3;
  v5 = [(RAPTransitDirectionsStepsListDataSource *)self _rapDisclosureViewForCell:v4];
  if (v5)
  {
    id v6 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addSubview:v5];
    v7 = [v5 leadingAnchor];
    id v8 = [v6 leadingAnchor];
    id v9 = [v7 constraintEqualToAnchor:v8];
    v23[0] = v9;
    id v10 = [v5 trailingAnchor];
    id v11 = [v6 trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v23[1] = v12;
    id v13 = +[NSArray arrayWithObjects:v23 count:2];
    +[NSLayoutConstraint activateConstraints:v13];
  }
  else
  {
    id v6 = 0;
  }
  [v4 setTrailingView:v6];
  objc_super v14 = [v4 trailingView];

  if (v14)
  {
    v15 = [v4 trailingView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [v4 stepView];
      v17 = [v16 iconImageView];
      v18 = [v17 imageSource];
      if (v18) {
        [v16 iconImageView];
      }
      else {
      uint64_t v19 = [v16 trailingView];
      }

      v15 = (void *)v19;
    }
    v20 = [v5 centerYAnchor];
    v21 = [v15 centerYAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    [v22 setActive:1];
  }
}

- (id)_rapDisclosureViewForCell:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v5 = 0;
  }
  else
  {
    v5 = -[RAPInstructionIncorrectView initWithFrame:]([RAPInstructionIncorrectView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(RAPInstructionIncorrectView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v6) = 1148846080;
    [(RAPInstructionIncorrectView *)v5 setContentCompressionResistancePriority:0 forAxis:v6];
    v7 = [(RAPTransitDirectionsStepsListDataSource *)self rapDelegate];
    id v8 = [v4 transitListItem];
    id v9 = [v8 matchingRouteStep];
    id v10 = [v4 transitListItem];
    uint64_t v11 = [v7 RAPTransitDirectionsStepsList:self shouldShowFlagForStep:v9 listItem:v10] ^ 1;
    v12 = [(RAPInstructionIncorrectView *)v5 flagView];
    [v12 setHidden:v11];

    id v13 = [v4 transitListItem];
    [(RAPInstructionIncorrectView *)v5 setDisplayMode:[(RAPTransitDirectionsStepsListDataSource *)self _displayModeForItem:v13]];

    if ([(RAPInstructionIncorrectView *)v5 displayMode] == 1
      || [(RAPInstructionIncorrectView *)v5 displayMode] == 2)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100573C8C;
      v15[3] = &unk_1012E5D58;
      id v16 = v4;
      v17 = self;
      [(RAPInstructionIncorrectView *)v5 setTapblock:v15];
    }
  }

  return v5;
}

- (int)_displayModeForItem:(id)a3
{
  id v3 = a3;
  if (![v3 conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem]) {
    goto LABEL_9;
  }
  id v4 = v3;
  if (([v4 shouldDisplayExpandButton] & 1) == 0 && objc_msgSend(v4, "type") != (id)3)
  {

LABEL_9:
    if (((unint64_t)[v3 type] & 0xFFFFFFFFFFFFFFFELL) == 6) {
      int v5 = 3;
    }
    else {
      int v5 = 0;
    }
    goto LABEL_12;
  }
  if ([v4 expanded]) {
    int v5 = 2;
  }
  else {
    int v5 = 1;
  }

LABEL_12:
  return v5;
}

- (RAPTransitDirectionsStepsListDelegate)rapDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rapDelegate);

  return (RAPTransitDirectionsStepsListDelegate *)WeakRetained;
}

- (void)setRapDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end