@interface FeatureDiscoveryModel
+ (id)_testModelWithImage;
+ (id)_testModelWithoutImage;
+ (id)ratingsAndPhotosDiscoveryModelWithActionHandler:(id)a3 cancelHandler:(id)a4;
- (BOOL)hasActionExecuted;
- (BOOL)isDismissed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTipMode;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (BOOL)shouldDisableAffordanceAfterAction;
- (FeatureDiscoveryModel)initWithImage:(id)a3 title:(id)a4 subtitle:(id)a5 actionTitle:(id)a6 actionHandler:(id)a7 bodyTapHandler:(id)a8 displayedHandler:(id)a9 dismissHandler:(id)a10 disableAffordanceAfterAction:(BOOL)a11;
- (FeatureDiscoveryModelUpdates)updatesDelegate;
- (NSString)_maps_diffableDataSourceIdentifier;
- (NSString)actionTitle;
- (NSString)subtitle;
- (NSString)title;
- (UICollectionViewCellRegistration)cellRegistration;
- (UIImage)image;
- (id)actionHandler;
- (id)bodyTapHandler;
- (id)dismissHandler;
- (id)displayedHandler;
- (void)markActionExecuted:(BOOL)a3;
- (void)markAsDisplayed;
- (void)setDismissed:(BOOL)a3;
- (void)setHasActionExecuted:(BOOL)a3;
- (void)setIsTipMode:(BOOL)a3;
- (void)setUpdatesDelegate:(id)a3;
@end

@implementation FeatureDiscoveryModel

- (FeatureDiscoveryModel)initWithImage:(id)a3 title:(id)a4 subtitle:(id)a5 actionTitle:(id)a6 actionHandler:(id)a7 bodyTapHandler:(id)a8 displayedHandler:(id)a9 dismissHandler:(id)a10 disableAffordanceAfterAction:(BOOL)a11
{
  id v42 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v43.receiver = self;
  v43.super_class = (Class)FeatureDiscoveryModel;
  v25 = [(FeatureDiscoveryModel *)&v43 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_image, a3);
    v27 = (NSString *)[v18 copy];
    title = v26->_title;
    v26->_title = v27;

    v29 = (NSString *)[v19 copy];
    subtitle = v26->_subtitle;
    v26->_subtitle = v29;

    v31 = (NSString *)[v20 copy];
    actionTitle = v26->_actionTitle;
    v26->_actionTitle = v31;

    id v33 = [v21 copy];
    id actionHandler = v26->_actionHandler;
    v26->_id actionHandler = v33;

    id v35 = [v22 copy];
    id bodyTapHandler = v26->_bodyTapHandler;
    v26->_id bodyTapHandler = v35;

    id v37 = [v23 copy];
    id displayedHandler = v26->_displayedHandler;
    v26->_id displayedHandler = v37;

    id v39 = [v24 copy];
    id dismissHandler = v26->_dismissHandler;
    v26->_id dismissHandler = v39;

    v26->_shouldDisableAffordanceAfterAction = a11;
  }

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(FeatureDiscoveryModel *)self actionHandler];
    if (v6 && ([v5 actionHandler], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (void *)v7;
      LODWORD(v9) = 0;
    }
    else
    {
      v26 = [(FeatureDiscoveryModel *)self actionHandler];
      if (v26)
      {
        LOBYTE(v25) = 0;
        v8 = 0;
LABEL_29:

        goto LABEL_30;
      }
      v27 = [v5 actionHandler];
      if (v27)
      {

        LOBYTE(v25) = 0;
        if (v6)
        {
          v8 = 0;
LABEL_31:
        }
LABEL_32:

        goto LABEL_33;
      }
      v8 = 0;
      LODWORD(v9) = 1;
    }
    v10 = [(FeatureDiscoveryModel *)self title];
    v11 = [v5 title];
    unint64_t v12 = v10;
    unint64_t v13 = v11;
    if (v12 | v13
      && (unsigned int v14 = [(id)v12 isEqual:v13], (id)v13, (id)v12, !v14))
    {

      LOBYTE(v25) = 0;
      if (v9)
      {
LABEL_28:
        v26 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      v34 = (void *)v12;
      v15 = [(FeatureDiscoveryModel *)self subtitle];
      v16 = [v5 subtitle];
      unint64_t v17 = v15;
      unint64_t v18 = v16;
      if (v17 | v18
        && (unsigned int v19 = [(id)v17 isEqual:v18],
            (id)v18,
            (id)v17,
            !v19))
      {
        LOBYTE(v25) = 0;
      }
      else
      {
        char v33 = v9;
        v32 = v8;
        id v20 = [(FeatureDiscoveryModel *)self actionTitle];
        id v21 = [v5 actionTitle];
        unint64_t v9 = v20;
        unint64_t v22 = v21;
        if ((!(v9 | v22)
           || (unsigned int v23 = [(id)v9 isEqual:v22],
               (id)v22,
               (id)v9,
               v23))
          && (unsigned int v24 = -[FeatureDiscoveryModel shouldDisableAffordanceAfterAction](self, "shouldDisableAffordanceAfterAction"), v24 == [v5 shouldDisableAffordanceAfterAction]))
        {
          unsigned int v28 = [(FeatureDiscoveryModel *)self hasActionExecuted];
          BOOL v29 = v28 == [v5 hasActionExecuted];
          v8 = v32;
          if (v29)
          {
            unsigned int v30 = [(FeatureDiscoveryModel *)self isDismissed];
            unsigned int v25 = v30 ^ [v5 isDismissed] ^ 1;
          }
          else
          {
            LOBYTE(v25) = 0;
          }
        }
        else
        {
          LOBYTE(v25) = 0;
          v8 = v32;
        }

        LOBYTE(v9) = v33;
      }

      if (v9) {
        goto LABEL_28;
      }
    }
LABEL_30:
    if (v6) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  LOBYTE(v25) = 0;
LABEL_33:

  return v25;
}

- (void)markAsDisplayed
{
  if (!self->_displayed)
  {
    self->_displayed = 1;
    v3 = [(FeatureDiscoveryModel *)self displayedHandler];

    if (v3)
    {
      id v4 = [(FeatureDiscoveryModel *)self displayedHandler];
      v4[2]();
    }
  }
}

- (void)markActionExecuted:(BOOL)a3
{
  if (self->_hasActionExecuted != a3)
  {
    self->_hasActionExecuted = a3;
    id v4 = [(FeatureDiscoveryModel *)self updatesDelegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(FeatureDiscoveryModel *)self updatesDelegate];
      [v6 featureDiscoveryModelDidUpdate:self];
    }
  }
}

+ (id)_testModelWithImage
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[UIImage imageNamed:@"closed-big"];
  LOBYTE(v6) = 0;
  id v4 = [v2 initWithImage:v3, @"Drive!", @"Go out and drive somewhere", @"OK, I will", &stru_1012EE498, 0, &stru_1012EE4B8, &stru_1012EE4D8, v6 title subtitle actionTitle actionHandler bodyTapHandler displayedHandler dismissHandler disableAffordanceAfterAction];

  return v4;
}

+ (id)_testModelWithoutImage
{
  LOBYTE(v4) = 0;
  id v2 = [objc_alloc((Class)a1) initWithImage:0 title:@"Don't drive!" subtitle:@"Stay home" actionTitle:@"Sure" actionHandler:&stru_1012EE4F8 bodyTapHandler:0 displayedHandler:&stru_1012EE518 dismissHandler:&stru_1012EE538 disableAffordanceAfterAction:v4];

  return v2;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return [NSString stringByAppendingFormat:self->_title, self->_subtitle];
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (id)displayedHandler
{
  return self->_displayedHandler;
}

- (id)bodyTapHandler
{
  return self->_bodyTapHandler;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (BOOL)isDismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (BOOL)hasActionExecuted
{
  return self->_hasActionExecuted;
}

- (void)setHasActionExecuted:(BOOL)a3
{
  self->_hasActionExecuted = a3;
}

- (BOOL)shouldDisableAffordanceAfterAction
{
  return self->_shouldDisableAffordanceAfterAction;
}

- (FeatureDiscoveryModelUpdates)updatesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updatesDelegate);

  return (FeatureDiscoveryModelUpdates *)WeakRetained;
}

- (void)setUpdatesDelegate:(id)a3
{
}

- (BOOL)isTipMode
{
  return self->_isTipMode;
}

- (void)setIsTipMode:(BOOL)a3
{
  self->_isTipMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updatesDelegate);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong(&self->_bodyTapHandler, 0);
  objc_storeStrong(&self->_displayedHandler, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

+ (id)ratingsAndPhotosDiscoveryModelWithActionHandler:(id)a3 cancelHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Ratings and Photos title" value:@"localized string not found" table:0];

  unint64_t v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Ratings and Photos description" value:@"localized string not found" table:0];

  v11 = +[NSBundle mainBundle];
  unint64_t v12 = [v11 localizedStringForKey:@"Get Started [UGC]" value:@"localized string not found" table:0];

  unint64_t v13 = [FeatureDiscoveryModel alloc];
  id v20 = v6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100536C04;
  v21[3] = &unk_1012E6EA8;
  id v22 = v5;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100536C6C;
  v19[3] = &unk_1012E6EA8;
  id v14 = v6;
  id v15 = v5;
  LOBYTE(v18) = 0;
  v16 = [(FeatureDiscoveryModel *)v13 initWithImage:0 title:v8 subtitle:v10 actionTitle:v12 actionHandler:v21 bodyTapHandler:0 displayedHandler:&stru_1012EE558 dismissHandler:v19 disableAffordanceAfterAction:v18];

  return v16;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[FeatureDiscoveryOutlineCellRegistration sharedRegistration];
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return ![(FeatureDiscoveryModel *)self isEqual:a3];
}

@end