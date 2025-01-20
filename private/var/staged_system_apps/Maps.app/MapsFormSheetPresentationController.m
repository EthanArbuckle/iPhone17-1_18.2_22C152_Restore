@interface MapsFormSheetPresentationController
- (MapsFormSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (int64_t)adaptivePresentationStyleForTraitCollection:(id)a3;
@end

@implementation MapsFormSheetPresentationController

- (MapsFormSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MapsFormSheetPresentationController;
  v8 = [(MapsFormSheetPresentationController *)&v19 initWithPresentedViewController:v6 presentingViewController:v7];
  v9 = v8;
  if (v8)
  {
    [(MapsFormSheetPresentationController *)v8 setDelegate:v8];
    objc_initWeak(&location, v9);
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_100A234D0;
    v16 = &unk_101314708;
    objc_copyWeak(&v17, &location);
    v10 = +[_UISheetDetent _detentWithContainerViewBlock:&v13];
    v20 = v10;
    v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1, v13, v14, v15, v16);
    [(MapsFormSheetPresentationController *)v9 _setDetents:v11];

    [(MapsFormSheetPresentationController *)v9 _setShouldDismissWhenTappedOutside:0];
    [(MapsFormSheetPresentationController *)v9 _setWidthFollowsPreferredContentSizeWhenBottomAttached:1];
    [(MapsFormSheetPresentationController *)v9 _setWantsBottomAttachedInCompactHeight:1];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (int64_t)adaptivePresentationStyleForTraitCollection:(id)a3
{
  if ([a3 userInterfaceIdiom]) {
    return 2;
  }
  else {
    return 4;
  }
}

@end