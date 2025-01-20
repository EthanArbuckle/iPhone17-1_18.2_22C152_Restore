@interface ParkedCarFooterActionsSectionController
- (ParkedCarFooterActionsSectionController)initWithParkedCar:(id)a3;
- (ParkedCarFooterActionsSectionControllerDelegate)actionDelegate;
- (id)sectionView;
- (void)_commonInit;
- (void)setActionDelegate:(id)a3;
@end

@implementation ParkedCarFooterActionsSectionController

- (ParkedCarFooterActionsSectionController)initWithParkedCar:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ParkedCarFooterActionsSectionController;
  v3 = [(ParkedCarSectionController *)&v6 initWithParkedCar:a3];
  v4 = v3;
  if (v3) {
    [(ParkedCarFooterActionsSectionController *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  id v3 = [objc_alloc((Class)MUActionGroupSectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  objc_initWeak(&location, self);
  v4 = objc_alloc_init(FooterContaineeAction);
  removeAction = self->_removeAction;
  self->_removeAction = v4;

  objc_super v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"Remove Car [FindMyCar Place Card]" value:@"localized string not found" table:0];
  [(SimpleContaineeAction *)self->_removeAction setTitle:v7];

  [(SimpleContaineeAction *)self->_removeAction setGlyph:@"trash.fill"];
  [(SimpleContaineeAction *)self->_removeAction setStyle:1];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_10079B754;
  v14 = &unk_1012F4058;
  objc_copyWeak(&v15, &location);
  [(FooterContaineeAction *)self->_removeAction setActionBlock:&v11];
  v17 = self->_removeAction;
  v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1, v11, v12, v13, v14);
  [v3 setViewModels:v8];

  v9 = +[MUPlaceSectionView cardShadowSectionViewForContentView:v3 sectionHeaderViewModel:0];
  sectionView = self->_sectionView;
  self->_sectionView = v9;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)sectionView
{
  return self->_sectionView;
}

- (ParkedCarFooterActionsSectionControllerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (ParkedCarFooterActionsSectionControllerDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);

  objc_storeStrong((id *)&self->_removeAction, 0);
}

@end