@interface ParkedCarHeaderButtonsSectionController
- (ParkedCarHeaderButtonsDelegate)actionDelegate;
- (ParkedCarHeaderButtonsSectionController)initWithParkedCar:(id)a3;
- (id)sectionView;
- (void)_commonInit;
- (void)actionsRowView:(id)a3 didSelectViewModel:(id)a4 presentationOptions:(id)a5;
- (void)setActionDelegate:(id)a3;
@end

@implementation ParkedCarHeaderButtonsSectionController

- (ParkedCarHeaderButtonsSectionController)initWithParkedCar:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ParkedCarHeaderButtonsSectionController;
  v3 = [(ParkedCarSectionController *)&v6 initWithParkedCar:a3];
  v4 = v3;
  if (v3) {
    [(ParkedCarHeaderButtonsSectionController *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = +[MUGroupedActionsRowViewConfiguration defaultConfiguration];
  [v3 setUseVibrancy:0];
  v4 = (MUGroupedActionsRowView *)[objc_alloc((Class)MUGroupedActionsRowView) initWithConfiguration:v3];
  headerButtonsView = self->_headerButtonsView;
  self->_headerButtonsView = v4;

  [(MUGroupedActionsRowView *)self->_headerButtonsView setPreservesSuperviewLayoutMargins:0];
  -[MUGroupedActionsRowView setLayoutMargins:](self->_headerButtonsView, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  [(MUGroupedActionsRowView *)self->_headerButtonsView setDelegate:self];
  objc_initWeak(&location, self);
  objc_super v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"Move [Marked Location in Place Card]" value:@"localized string not found" table:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100C25EC4;
  v12[3] = &unk_1012F4058;
  objc_copyWeak(&v13, &location);
  v8 = +[_MKPlaceActionButtonController actionButtonControllerWithTitle:v7 subTitle:0 selectedBlock:v12 disabled:0 symbolName:@"mappin.and.ellipse"];

  id v9 = [objc_alloc((Class)MUDirectionsActionRowItemViewModel) initWithETAProvider:0];
  id v10 = [objc_alloc((Class)MUPlaceActionControlledItemViewModel) initWithPlaceActionController:v8];
  v15[0] = v9;
  v15[1] = v10;
  v11 = +[NSArray arrayWithObjects:v15 count:2];
  [(MUGroupedActionsRowView *)self->_headerButtonsView setViewModels:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)sectionView
{
  sectionView = self->_sectionView;
  if (sectionView)
  {
    v3 = sectionView;
  }
  else
  {
    v5 = (UIView *)[objc_alloc((Class)MUPlaceSectionView) initWithStyle:1 sectionHeaderViewModel:0];
    [(UIView *)v5 attachViewToContentView:self->_headerButtonsView];
    objc_super v6 = self->_sectionView;
    self->_sectionView = v5;
    v7 = v5;

    v3 = self->_sectionView;
  }

  return v3;
}

- (void)actionsRowView:(id)a3 didSelectViewModel:(id)a4 presentationOptions:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(ParkedCarHeaderButtonsSectionController *)self actionDelegate];
    [v8 parkedCarHeaderButtonsSectionControllerRequestsDirections:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 performWithPresentationOptions:v7];
    }
  }
}

- (ParkedCarHeaderButtonsDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (ParkedCarHeaderButtonsDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);

  objc_storeStrong((id *)&self->_headerButtonsView, 0);
}

@end