@interface CarCardTestModeController
- (BOOL)showsMapView;
- (CarCardTestModeController)init;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (id)_stackedCardWithConfig:(id)a3 stackID:(id)a4;
- (id)desiredCards;
- (int64_t)autohideBehavior;
- (void)_addCardNotification:(id)a3;
- (void)_addCardWithConfig:(id)a3;
- (void)_deleteCardUUID:(id)a3;
- (void)_handleCardButtonTag:(unint64_t)a3 forStackID:(id)a4 card:(id)a5;
- (void)_push;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
@end

@implementation CarCardTestModeController

- (CarCardTestModeController)init
{
  v9.receiver = self;
  v9.super_class = (Class)CarCardTestModeController;
  v2 = [(CarCardTestModeController *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    cards = v2->_cards;
    v2->_cards = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    cardToConfigMap = v2->_cardToConfigMap;
    v2->_cardToConfigMap = (NSMutableDictionary *)v5;

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_addCardNotification:" name:@"__internal_CarCardTestDebug" object:0];
  }
  return v2;
}

- (BOOL)showsMapView
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_pushButton)
  {
    v8 = +[CarFocusableButton button];
    pushButton = self->_pushButton;
    self->_pushButton = v8;

    [(CarFocusableButton *)self->_pushButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(CarFocusableButton *)self->_pushButton layer];
    [v10 setCornerRadius:4.0];

    v11 = +[UIColor _carSystemFocusColor];
    [(CarFocusableButton *)self->_pushButton setTintColor:v11];

    [(CarFocusableButton *)self->_pushButton setTitle:@"Push" forState:0];
    -[CarFocusableButton setContentEdgeInsets:](self->_pushButton, "setContentEdgeInsets:", 0.0, 4.0, 0.0, 4.0);
    [(CarFocusableButton *)self->_pushButton addTarget:self action:"_push" forControlEvents:64];
  }
  v12 = [v6 viewport];
  [v12 addSubview:self->_pushButton];

  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100A48908;
  v19 = &unk_1012E5D58;
  v20 = self;
  id v21 = v6;
  id v13 = v6;
  [v7 addAnimations:&v16 completion:0];
  v14 = [(CarCardTestModeController *)self chromeViewController];
  v15 = [v14 mapView];
  [v15 setUserTrackingMode:1];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
}

- (id)desiredCards
{
  return [(NSMutableDictionary *)self->_cards allKeys];
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CarCardTestModeController *)self desiredCards];
  if ([v8 containsObject:v7])
  {
    objc_super v9 = [(NSMutableDictionary *)self->_cardToConfigMap objectForKeyedSubscript:v7];
    v10 = [(NSMutableDictionary *)self->_cards objectForKeyedSubscript:v7];
    [v6 setContent:v10];

    [v6 setAccessory:0];
    if (v9)
    {
      [v9 layout];
      v12 = (void *)*((void *)&v33 + 1);
      v11 = (void *)v33;
    }
    else
    {
      v12 = 0;
      v11 = 0;
      uint64_t v37 = 0;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      memset(v32, 0, sizeof(v32));
      long long v30 = 0u;
      long long v31 = 0u;
    }
    v22[0] = v30;
    v22[1] = v31;
    v23[0] = v32[0];
    *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v32 + 12);
    id v19 = v11;
    id v24 = v19;
    id v20 = v12;
    id v25 = v20;
    long long v26 = v34;
    long long v27 = v35;
    long long v28 = v36;
    char v29 = v37;
    if (v6)
    {
      [v6 setLayout:v22];
    }
    else
    {
      id v21 = v20;
    }
    [v6 setStaysOnTop:[v9 staysOnTop]];
    goto LABEL_21;
  }
  if (qword_101610590 != -1) {
    dispatch_once(&qword_101610590, &stru_101315168);
  }
  objc_super v9 = (id)qword_101610588;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v13 = self;
    if (!v13)
    {
      v18 = @"<nil>";
      goto LABEL_20;
    }
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      v16 = [(CarCardTestModeController *)v13 performSelector:"accessibilityIdentifier"];
      uint64_t v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_13;
      }
    }
    v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_13:

LABEL_20:
    *(_DWORD *)buf = 138543362;
    v39 = v18;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}@] CarCardTestModeController: tried to configure card key that is not in desired cards.", buf, 0xCu);
  }
LABEL_21:
}

- (void)_addCardNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CarCardTestModeController *)self chromeViewController];
  id v6 = [v5 topContext];

  if (v6 == self)
  {
    id v7 = [v4 userInfo];
    v8 = [v7 objectForKeyedSubscript:@"RemoveAll"];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      v10 = [(NSMutableDictionary *)self->_cards allKeys];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v11 = [(CarCardTestConfig *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            [(CarCardTestModeController *)self _deleteCardUUID:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          }
          id v12 = [(CarCardTestConfig *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v12);
      }
    }
    else
    {
      v10 = [[CarCardTestConfig alloc] initWithNotification:v4];
      [(CarCardTestModeController *)self _addCardWithConfig:v10];
    }
  }
}

- (void)_addCardWithConfig:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if ((unint64_t)[v4 stackCount] > 1)
  {
    v10 = objc_opt_new();
    id v8 = [v10 UUIDString];

    id v7 = (CarTestCardViewController *)objc_opt_new();
    for (unint64_t i = 0; i < (unint64_t)[v4 stackCount]; ++i)
    {
      id v12 = [(CarCardTestModeController *)self _stackedCardWithConfig:v4 stackID:v8];
      [(CarTestCardViewController *)v7 addObject:v12];
    }
    if (v4)
    {
      [v4 layout];
      uint64_t v13 = 3;
      switch((uint64_t)v17)
      {
        case 0:
          if ((unint64_t)(*((void *)&v17 + 1) - 1) > 7) {
            uint64_t v13 = 3;
          }
          else {
            uint64_t v13 = qword_100F73050[*((void *)&v17 + 1) - 1];
          }
          break;
        case 1:
        case 4:
          uint64_t v13 = v17;
          break;
        case 2:
          uint64_t v13 = 1;
          break;
        case 8:
          uint64_t v13 = 4;
          break;
        default:
          break;
      }
    }
    else
    {
      uint64_t v25 = 0;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v13 = 3;
      long long v17 = 0u;
      long long v18 = 0u;
    }
    id v14 = (id)v18;

    if (([v4 stackUseCardLayout] & 1) == 0)
    {
      id v14 = [v4 stackAxis];
      uint64_t v13 = (uint64_t)[v4 stackAlignment];
    }
    v16[0] = v14;
    v16[1] = 0;
    v16[2] = v13;
    unsigned int v9 = [[CarCardStackViewController alloc] initWithCarCardContentControllers:v7 layout:v16];
  }
  else
  {
    uint64_t v5 = [[CarTestCardViewController alloc] initWithConfig:v4];
    id v6 = [(CarTestCardViewController *)v5 cardID];
    id v7 = v5;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100A49294;
    v26[3] = &unk_101315120;
    objc_copyWeak(&v28, &location);
    id v8 = v6;
    id v27 = v8;
    [(CarTestCardViewController *)v7 setDismissHandler:v26];

    objc_destroyWeak(&v28);
    unsigned int v9 = (CarCardStackViewController *)v7;
  }

  [(NSMutableDictionary *)self->_cards setObject:v9 forKeyedSubscript:v8];
  [(NSMutableDictionary *)self->_cardToConfigMap setObject:v4 forKeyedSubscript:v8];
  long long v15 = [(CarCardTestModeController *)self chromeViewController];
  [v15 updateCardsForContext:self animated:1];

  objc_destroyWeak(&location);
}

- (id)_stackedCardWithConfig:(id)a3 stackID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[CarTestCardViewController alloc] initWithConfig:v6];
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100A4947C;
  v14[3] = &unk_101315120;
  objc_copyWeak(&v16, &location);
  id v9 = v7;
  id v15 = v9;
  [(CarTestCardViewController *)v8 setDismissHandler:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100A494CC;
  v12[3] = &unk_101315148;
  v12[4] = self;
  id v10 = v9;
  id v13 = v10;
  [(CarTestCardViewController *)v8 setButtonTagHandler:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v8;
}

- (void)_push
{
  id v4 = objc_alloc_init(CarCardTestModeController);
  uint64_t v3 = [(CarCardTestModeController *)self chromeViewController];
  [v3 pushContext:v4 animated:1 completion:0];
}

- (void)_deleteCardUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_cards objectForKeyedSubscript:v4];
  if (v5)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100A4967C;
    v8[3] = &unk_1012E5D30;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    id v6 = objc_retainBlock(v8);
    id v7 = [(CarCardTestModeController *)self chromeViewController];
    [v7 updateCardsForContext:self animated:1 completion:v6];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_handleCardButtonTag:(unint64_t)a3 forStackID:(id)a4 card:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  id v9 = [(NSMutableDictionary *)self->_cards objectForKeyedSubscript:v16];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      id v11 = v10;
      switch(a3)
      {
        case 1uLL:
          [v10 removeCardContentController:v8];
          break;
        case 2uLL:
          id v12 = [(NSMutableDictionary *)self->_cardToConfigMap objectForKeyedSubscript:v16];
          id v13 = [(CarCardTestModeController *)self _stackedCardWithConfig:v12 stackID:v16];
          [v11 addCardContentController:v13];
          goto LABEL_9;
        case 3uLL:
          id v14 = [v10 cardContentControllers];
          id v15 = (char *)[v14 indexOfObject:v8];
          goto LABEL_8;
        case 4uLL:
          id v14 = [v10 cardContentControllers];
          id v15 = (char *)[v14 indexOfObject:v8] + 1;
LABEL_8:

          id v12 = [(NSMutableDictionary *)self->_cardToConfigMap objectForKeyedSubscript:v16];
          id v13 = [(CarCardTestModeController *)self _stackedCardWithConfig:v12 stackID:v16];
          [v11 insertCardContentController:v13 atIndex:v15];
LABEL_9:

          break;
        default:
          break;
      }
    }
  }
}

- (NSArray)carFocusOrderSequences
{
  v2 = [(CarCardTestModeController *)self chromeViewController];
  uint64_t v3 = [v2 itemRepresentingOverlays];
  id v8 = v3;
  id v4 = +[NSArray arrayWithObjects:&v8 count:1];
  uint64_t v5 = +[CarFocusOrderSequence sequenceWithItems:v4 options:5];
  id v9 = v5;
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];

  return (NSArray *)v6;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_pushButton, 0);
  objc_storeStrong((id *)&self->_cardToConfigMap, 0);

  objc_storeStrong((id *)&self->_cards, 0);
}

@end