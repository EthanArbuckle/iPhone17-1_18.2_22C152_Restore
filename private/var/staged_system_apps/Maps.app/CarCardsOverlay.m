@interface CarCardsOverlay
- (BOOL)_shouldInterruptUpdates:(id)a3 toRunUpdates:(id)a4;
- (BOOL)hasCard:(id)a3;
- (BOOL)isCardHidden:(id)a3;
- (BOOL)isHidden;
- (CarCardViewDelegate)cardDelegate;
- (CarCardsOverlay)initWithCarSceneType:(int64_t)a3;
- (ChromeOverlayHosting)host;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (NSMutableDictionary)configurationsByKey;
- (NSMutableOrderedSet)configurationKeys;
- (UIView)contentView;
- (id)_batchedUpdates;
- (id)_configurationForKey:(id)a3 createIfNeeded:(BOOL)a4;
- (void)_captureInsetContraintsFromConfigurations;
- (void)_performBatchUpdates:(id)a3 withAnimation:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_refreshPinningConstraints;
- (void)_runNextUpdate;
- (void)_setCardConfiguration:(id)a3 forKey:(id)a4;
- (void)_updateDidComplete:(id)a3;
- (void)_userDefaultsChanged:(id)a3;
- (void)_validatePendingUpdates;
- (void)cardsUpdate:(id)a3 applyConfigurations:(id)a4;
- (void)cardsUpdate:(id)a3 finalizeUpdate:(unint64_t)a4 withCardConfigurations:(id)a5;
- (void)cardsUpdate:(id)a3 prepareForUpdate:(unint64_t)a4 withCardConfigurations:(id)a5;
- (void)cardsUpdateWantsLayout:(id)a3;
- (void)configureCard:(id)a3 withBlock:(id)a4;
- (void)dealloc;
- (void)deleteCard:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dismissAllCardsAnimated:(BOOL)a3 completion:(id)a4;
- (void)hideCard:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)insertCard:(id)a3 animated:(BOOL)a4 configurationBlock:(id)a5 completion:(id)a6;
- (void)performBatchUpdates:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)performBatchUpdates:(id)a3 withAnimation:(id)a4 completion:(id)a5;
- (void)presentAllCardsAnimated:(BOOL)a3 completion:(id)a4;
- (void)reset;
- (void)setCardDelegate:(id)a3;
- (void)setConfigurationKeys:(id)a3;
- (void)setConfigurationsByKey:(id)a3;
- (void)setContentView:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHost:(id)a3;
- (void)showCard:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation CarCardsOverlay

- (void)dealloc
{
  v3 = [(CarCardsOverlay *)self configurationsByKey];
  [v3 removeAllObjects];

  [(CarCardsOverlay *)self setHost:0];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"CarDisplayDidChangeConnectedNotification" object:0];

  v5.receiver = self;
  v5.super_class = (Class)CarCardsOverlay;
  [(CarCardsOverlay *)&v5 dealloc];
}

- (CarCardsOverlay)initWithCarSceneType:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CarCardsOverlay;
  v4 = [(CarCardsOverlay *)&v13 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_carSceneType = a3;
    v6 = +[NSUserDefaults standardUserDefaults];
    v5->_showDebugVisualisation = [v6 BOOLForKey:@"__internal_CarVisualizeCardContainersDebug"];

    uint64_t v7 = +[NSMutableOrderedSet orderedSetWithCapacity:2];
    configurationKeys = v5->_configurationKeys;
    v5->_configurationKeys = (NSMutableOrderedSet *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    configurationsByKey = v5->_configurationsByKey;
    v5->_configurationsByKey = (NSMutableDictionary *)v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v5 selector:"_userDefaultsChanged:" name:NSUserDefaultsDidChangeNotification object:0];
  }
  return v5;
}

- (void)setCardDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_cardDelegate, v4);
    v6 = sub_100577A0C();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      v20 = [(CarCardsOverlay *)self configurationsByKey];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100B44D90;
      v21[3] = &unk_101318DC8;
      v21[4] = self;
      [v20 enumerateKeysAndObjectsUsingBlock:v21];

      goto LABEL_21;
    }
    uint64_t v7 = self;
    if (!v7)
    {
      v12 = @"<nil>";
LABEL_11:

      objc_super v13 = v12;
      id v14 = v4;
      if (!v14)
      {
        v19 = @"<nil>";
        goto LABEL_19;
      }
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      if (objc_opt_respondsToSelector())
      {
        v17 = [v14 performSelector:"accessibilityIdentifier"];
        v18 = v17;
        if (v17 && ![v17 isEqualToString:v16])
        {
          v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

          goto LABEL_17;
        }
      }
      v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_17:

LABEL_19:
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      __int16 v24 = 2112;
      v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Card delegate is now %@", buf, 0x16u);

      goto LABEL_20;
    }
    v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      v10 = [(CarCardsOverlay *)v7 performSelector:"accessibilityIdentifier"];
      v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

    goto LABEL_11;
  }
LABEL_21:
}

- (void)setHost:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_host, obj);
    v6 = [obj overlayContentView];
    [(CarCardsOverlay *)self setContentView:v6];
  }
}

- (BOOL)isHidden
{
  v2 = [(NSMutableDictionary *)self->_configurationsByKey allValues];
  BOOL v3 = [v2 indexOfObjectPassingTest:&stru_101318E08] == (id)0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    [(CarCardsOverlay *)self dismissAllCardsAnimated:a4 completion:0];
  }
  else {
    [(CarCardsOverlay *)self presentAllCardsAnimated:a4 completion:0];
  }
}

- (void)_userDefaultsChanged:(id)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"__internal_CarVisualizeCardContainersDebug"];

  if (self->_showDebugVisualisation != v5)
  {
    self->_showDebugVisualisation = v5;
    v6 = [(CarCardsOverlay *)self configurationsByKey];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100B45024;
    v7[3] = &unk_101318E28;
    char v8 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

- (void)setContentView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  if (WeakRetained == v4) {
    goto LABEL_41;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_contentView);
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = [(CarCardsOverlay *)self configurationsByKey];
    id v9 = [v8 count];

    if (v9)
    {
      v10 = sub_100577A0C();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
LABEL_22:

        __int16 v24 = [(CarCardsOverlay *)self configurationsByKey];
        [v24 enumerateKeysAndObjectsUsingBlock:&stru_101318E68];

        v25 = [(CarCardsOverlay *)self configurationsByKey];
        [v25 removeAllObjects];

        v26 = [(CarCardsOverlay *)self configurationKeys];
        [v26 removeAllObjects];

        [(CarCardsOverlay *)self _captureInsetContraintsFromConfigurations];
        goto LABEL_23;
      }
      v11 = self;
      if (!v11)
      {
        v16 = @"<nil>";
LABEL_13:

        v17 = v16;
        id v18 = [(CarCardsOverlay *)v11 contentView];
        if (!v18)
        {
          v23 = @"<nil>";
          goto LABEL_21;
        }
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        if (objc_opt_respondsToSelector())
        {
          v21 = [v18 performSelector:"accessibilityIdentifier"];
          v22 = v21;
          if (v21 && ![v21 isEqualToString:v20])
          {
            v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v20, v18, v22];

            goto LABEL_19;
          }
        }
        v23 = +[NSString stringWithFormat:@"%@<%p>", v20, v18];
LABEL_19:

LABEL_21:
        *(_DWORD *)buf = 138543618;
        v45 = v17;
        __int16 v46 = 2112;
        v47 = v23;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Will uninstall cards from view %@", buf, 0x16u);

        goto LABEL_22;
      }
      v12 = (objc_class *)objc_opt_class();
      objc_super v13 = NSStringFromClass(v12);
      if (objc_opt_respondsToSelector())
      {
        id v14 = [(CarCardsOverlay *)v11 performSelector:"accessibilityIdentifier"];
        v15 = v14;
        if (v14 && ![v14 isEqualToString:v13])
        {
          v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

          goto LABEL_11;
        }
      }
      v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_11:

      goto LABEL_13;
    }
  }
LABEL_23:
  id v27 = objc_storeWeak((id *)&self->_contentView, v4);
  if (v4)
  {
    v28 = [(CarCardsOverlay *)self configurationsByKey];
    id v29 = [v28 count];

    if (v29)
    {
      v30 = sub_100577A0C();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
LABEL_40:

        [(CarCardsOverlay *)self _refreshPinningConstraints];
        goto LABEL_41;
      }
      v31 = self;
      if (!v31)
      {
        v36 = @"<nil>";
LABEL_34:

        v37 = v36;
        id v38 = v4;
        v39 = (objc_class *)objc_opt_class();
        v40 = NSStringFromClass(v39);
        if (objc_opt_respondsToSelector())
        {
          v41 = [v38 performSelector:"accessibilityIdentifier"];
          v42 = v41;
          if (v41 && ![v41 isEqualToString:v40])
          {
            v43 = +[NSString stringWithFormat:@"%@<%p, %@>", v40, v38, v42];

            goto LABEL_39;
          }
        }
        v43 = +[NSString stringWithFormat:@"%@<%p>", v40, v38];
LABEL_39:

        *(_DWORD *)buf = 138543618;
        v45 = v37;
        __int16 v46 = 2112;
        v47 = v43;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}@] Will install cards in view %@", buf, 0x16u);

        goto LABEL_40;
      }
      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      if (objc_opt_respondsToSelector())
      {
        v34 = [(CarCardsOverlay *)v31 performSelector:"accessibilityIdentifier"];
        v35 = v34;
        if (v34 && ![v34 isEqualToString:v33])
        {
          v36 = +[NSString stringWithFormat:@"%@<%p, %@>", v33, v31, v35];

          goto LABEL_32;
        }
      }
      v36 = +[NSString stringWithFormat:@"%@<%p>", v33, v31];
LABEL_32:

      goto LABEL_34;
    }
  }
LABEL_41:
}

- (void)_refreshPinningConstraints
{
  BOOL v3 = [(CarCardsOverlay *)self host];
  id v4 = [(CarCardsOverlay *)self host];
  unsigned int v5 = [v4 layoutGuideForOverlay:self];

  id v6 = [(CarCardsOverlay *)self configurationsByKey];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B456D4;
  v10[3] = &unk_101318E90;
  id v11 = v3;
  id v12 = v5;
  id v7 = v5;
  id v8 = v3;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  [(CarCardsOverlay *)self _captureInsetContraintsFromConfigurations];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B456E4;
  v9[3] = &unk_1012E5D08;
  v9[4] = self;
  +[UIView performWithoutAnimation:v9];
}

- (BOOL)hasCard:(id)a3
{
  BOOL v3 = [(CarCardsOverlay *)self _configurationForKey:a3 createIfNeeded:0];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isCardHidden:(id)a3
{
  BOOL v3 = [(CarCardsOverlay *)self _configurationForKey:a3 createIfNeeded:0];
  BOOL v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 cardView];
    unsigned __int8 v6 = [v5 isHidden];
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (void)configureCard:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100577A0C();
  id v9 = v8;
  if (v7)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      v22 = [(CarCardsOverlay *)self _configurationForKey:v6 createIfNeeded:1];
      [(CarCardsOverlay *)self _setCardConfiguration:v22 forKey:v6];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100B45B34;
      v23[3] = &unk_1012E80F0;
      v23[4] = self;
      id v24 = v22;
      id v25 = v7;
      id v9 = v22;
      [(CarCardsOverlay *)self performBatchUpdates:v23 animated:0 completion:0];

      goto LABEL_23;
    }
    v10 = self;
    if (!v10)
    {
      v15 = @"<nil>";
      goto LABEL_19;
    }
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      objc_super v13 = [(CarCardsOverlay *)v10 performSelector:"accessibilityIdentifier"];
      id v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_9;
      }
    }
    v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_9:

LABEL_19:
    *(_DWORD *)buf = 138543618;
    id v27 = v15;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] Will configure card %@", buf, 0x16u);

    goto LABEL_20;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v16 = self;
    if (!v16)
    {
      v21 = @"<nil>";
      goto LABEL_22;
    }
    v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      v19 = [(CarCardsOverlay *)v16 performSelector:"accessibilityIdentifier"];
      v20 = v19;
      if (v19 && ![v19 isEqualToString:v18])
      {
        v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

        goto LABEL_17;
      }
    }
    v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_17:

LABEL_22:
    *(_DWORD *)buf = 138543618;
    id v27 = v21;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Tried to configure card %@ without a configuration block, aborting.", buf, 0x16u);
  }
LABEL_23:
}

- (void)insertCard:(id)a3 animated:(BOOL)a4 configurationBlock:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_super v13 = sub_100577A0C();
  id v14 = v13;
  if (v11)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
LABEL_22:

      id v29 = [(CarCardsOverlay *)self _configurationForKey:v10 createIfNeeded:1];
      [(CarCardsOverlay *)self _setCardConfiguration:v29 forKey:v10];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100B45F40;
      v30[3] = &unk_1012E80F0;
      v30[4] = self;
      id v31 = v29;
      id v32 = v11;
      id v14 = v29;
      [(CarCardsOverlay *)self performBatchUpdates:v30 animated:v8 completion:v12];

      goto LABEL_25;
    }
    v15 = self;
    if (!v15)
    {
      v20 = @"<nil>";
      goto LABEL_19;
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      id v18 = [(CarCardsOverlay *)v15 performSelector:"accessibilityIdentifier"];
      v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_9;
      }
    }
    v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_9:

LABEL_19:
    id v27 = @"NO";
    if (v8) {
      id v27 = @"YES";
    }
    __int16 v28 = v27;
    *(_DWORD *)buf = 138543874;
    v34 = v20;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v28;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}@] Will present card %@ (animated:%@)", buf, 0x20u);

    goto LABEL_22;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v21 = self;
    if (!v21)
    {
      v26 = @"<nil>";
      goto LABEL_24;
    }
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    if (objc_opt_respondsToSelector())
    {
      id v24 = [(CarCardsOverlay *)v21 performSelector:"accessibilityIdentifier"];
      id v25 = v24;
      if (v24 && ![v24 isEqualToString:v23])
      {
        v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

        goto LABEL_17;
      }
    }
    v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_17:

LABEL_24:
    *(_DWORD *)buf = 138543618;
    v34 = v26;
    __int16 v35 = 2112;
    id v36 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Tried to insert card %@ without a configuration block, aborting.", buf, 0x16u);
  }
LABEL_25:
}

- (void)presentAllCardsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CarCardsOverlay *)self configurationsByKey];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = sub_100577A0C();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      v21 = [(CarCardsOverlay *)self configurationKeys];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100B462A8;
      v27[3] = &unk_101318EB8;
      v27[4] = self;
      v22 = sub_100099700(v21, v27);

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100B46314;
      v24[3] = &unk_1012E5D58;
      id v25 = v22;
      v26 = self;
      id v23 = v22;
      [(CarCardsOverlay *)self performBatchUpdates:v24 animated:v4 completion:v6];

      goto LABEL_15;
    }
    id v10 = self;
    if (!v10)
    {
      v15 = @"<nil>";
      goto LABEL_11;
    }
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      objc_super v13 = [(CarCardsOverlay *)v10 performSelector:"accessibilityIdentifier"];
      id v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_9;
      }
    }
    v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_9:

LABEL_11:
    v16 = v15;
    v17 = [(CarCardsOverlay *)v10 configurationsByKey];
    id v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 count]);

    v19 = @"NO";
    if (v4) {
      v19 = @"YES";
    }
    v20 = v19;
    *(_DWORD *)buf = 138543874;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v18;
    __int16 v32 = 2112;
    v33 = v20;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] Will present %@ cards (animated:%@)", buf, 0x20u);

    goto LABEL_14;
  }
LABEL_15:
}

- (void)deleteCard:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(CarCardsOverlay *)self _configurationForKey:v8 createIfNeeded:0];
  if (v10)
  {
    id v11 = sub_100577A0C();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      [(CarCardsOverlay *)self _setCardConfiguration:0 forKey:v8];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100B466A8;
      v20[3] = &unk_1012E5D58;
      v20[4] = self;
      id v21 = v10;
      [(CarCardsOverlay *)self performBatchUpdates:v20 animated:v6 completion:v9];

      goto LABEL_15;
    }
    id v12 = self;
    if (!v12)
    {
      v17 = @"<nil>";
      goto LABEL_11;
    }
    objc_super v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      v15 = [(CarCardsOverlay *)v12 performSelector:"accessibilityIdentifier"];
      v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_9;
      }
    }
    v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_9:

LABEL_11:
    id v18 = @"NO";
    if (v6) {
      id v18 = @"YES";
    }
    v19 = v18;
    *(_DWORD *)buf = 138543874;
    id v23 = v17;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] Will dismiss card %@ (animated:%@)", buf, 0x20u);

    goto LABEL_14;
  }
LABEL_15:
}

- (void)hideCard:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(CarCardsOverlay *)self _configurationForKey:a3 createIfNeeded:0];
  id v10 = v9;
  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100B467C8;
    v11[3] = &unk_1012E5D08;
    id v12 = v9;
    [(CarCardsOverlay *)self performBatchUpdates:v11 animated:v5 completion:v8];
  }
}

- (void)showCard:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(CarCardsOverlay *)self _configurationForKey:a3 createIfNeeded:0];
  id v10 = v9;
  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100B468DC;
    v11[3] = &unk_1012E5D08;
    id v12 = v9;
    [(CarCardsOverlay *)self performBatchUpdates:v11 animated:v5 completion:v8];
  }
}

- (void)dismissAllCardsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CarCardsOverlay *)self configurationsByKey];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = sub_100577A0C();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      id v21 = [(CarCardsOverlay *)self configurationsByKey];
      v22 = [v21 allValues];

      id v23 = [(CarCardsOverlay *)self configurationsByKey];
      [v23 removeAllObjects];

      __int16 v24 = [(CarCardsOverlay *)self configurationKeys];
      [v24 removeAllObjects];

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100B46C1C;
      v26[3] = &unk_1012E5D58;
      id v27 = v22;
      __int16 v28 = self;
      id v25 = v22;
      [(CarCardsOverlay *)self performBatchUpdates:v26 animated:v4 completion:v6];

      goto LABEL_15;
    }
    id v10 = self;
    if (!v10)
    {
      v15 = @"<nil>";
      goto LABEL_11;
    }
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      objc_super v13 = [(CarCardsOverlay *)v10 performSelector:"accessibilityIdentifier"];
      id v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_9;
      }
    }
    v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_9:

LABEL_11:
    v16 = v15;
    v17 = [(CarCardsOverlay *)v10 configurationsByKey];
    id v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 count]);

    v19 = @"NO";
    if (v4) {
      v19 = @"YES";
    }
    v20 = v19;
    *(_DWORD *)buf = 138543874;
    __int16 v30 = v15;
    __int16 v31 = 2112;
    __int16 v32 = v18;
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] Will dismiss %@ cards (animated:%@)", buf, 0x20u);

    goto LABEL_14;
  }
LABEL_15:
}

- (void)performBatchUpdates:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)performBatchUpdates:(id)a3 withAnimation:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[CarCardsOverlay _performBatchUpdates:withAnimation:animated:completion:](self, "_performBatchUpdates:withAnimation:animated:completion:", v10, v9, [v9 isAnimated], v8);
}

- (void)_performBatchUpdates:(id)a3 withAnimation:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = (void (**)(void))a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    pendingUpdates = self->_pendingUpdates;
    if (pendingUpdates) {
      goto LABEL_13;
    }
    id v14 = objc_alloc_init(CarCardsUpdate);
    v15 = self->_pendingUpdates;
    self->_pendingUpdates = v14;

    [(CarCardsUpdate *)self->_pendingUpdates setDelegate:self];
    v16 = sub_100577A0C();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      pendingUpdates = self->_pendingUpdates;
LABEL_13:
      unint64_t v28 = [(CarCardsUpdate *)pendingUpdates incrementNestCounter];
      id v29 = sub_100577A0C();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      unint64_t v52 = v28;
      __int16 v30 = self;
      __int16 v31 = (objc_class *)objc_opt_class();
      __int16 v32 = NSStringFromClass(v31);
      if (objc_opt_respondsToSelector())
      {
        __int16 v33 = [(CarCardsOverlay *)v30 performSelector:"accessibilityIdentifier"];
        v34 = v33;
        if (v33 && ![v33 isEqualToString:v32])
        {
          id v35 = v12;
          id v36 = v11;
          BOOL v37 = v7;
          id v38 = +[NSString stringWithFormat:@"%@<%p, %@>", v32, v30, v34];

          goto LABEL_19;
        }
      }
      id v35 = v12;
      id v36 = v11;
      BOOL v37 = v7;
      id v38 = +[NSString stringWithFormat:@"%@<%p>", v32, v30];
LABEL_19:

      v39 = self->_pendingUpdates;
      *(_DWORD *)buf = 138543874;
      v56 = v38;
      __int16 v57 = 2048;
      v58 = v39;
      __int16 v59 = 2048;
      v60 = (__CFString *)v52;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}@] Incrementing batch update %p nest counter to %lu", buf, 0x20u);

      BOOL v7 = v37;
      id v11 = v36;
      id v12 = v35;
LABEL_20:

      v10[2](v10);
      if (v12)
      {
        v40 = self->_pendingUpdates;
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100B47320;
        v53[3] = &unk_101318EE0;
        id v54 = v12;
        [(CarCardsUpdate *)v40 addCompletionBlock:v53];
      }
      unint64_t v41 = [(CarCardsUpdate *)self->_pendingUpdates decrementNestCounter];
      if (!v41)
      {
        [(CarCardsUpdate *)self->_pendingUpdates setAnimated:v7];
        [(CarCardsUpdate *)self->_pendingUpdates setParentAnimation:v11];
        [(CarCardsOverlay *)self _runNextUpdate];
        goto LABEL_32;
      }
      unint64_t v42 = v41;
      v43 = sub_100577A0C();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      v44 = self;
      v45 = (objc_class *)objc_opt_class();
      __int16 v46 = NSStringFromClass(v45);
      if (objc_opt_respondsToSelector())
      {
        v47 = [(CarCardsOverlay *)v44 performSelector:"accessibilityIdentifier"];
        v48 = v47;
        if (v47 && ![v47 isEqualToString:v46])
        {
          v49 = +[NSString stringWithFormat:@"%@<%p, %@>", v46, v44, v48];

          goto LABEL_29;
        }
      }
      v49 = +[NSString stringWithFormat:@"%@<%p>", v46, v44];
LABEL_29:

      v50 = self->_pendingUpdates;
      *(_DWORD *)buf = 138543874;
      v56 = v49;
      __int16 v57 = 2048;
      v58 = v50;
      __int16 v59 = 2048;
      v60 = (__CFString *)v42;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[%{public}@] Will not attempt run update, our updates %p are nested (%lu levels)", buf, 0x20u);

LABEL_30:
      goto LABEL_32;
    }
    v17 = self;
    id v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    if (objc_opt_respondsToSelector())
    {
      id v51 = v12;
      id v20 = v11;
      BOOL v21 = v7;
      v22 = [(CarCardsOverlay *)v17 performSelector:"accessibilityIdentifier"];
      id v23 = v22;
      if (v22 && ![v22 isEqualToString:v19])
      {
        __int16 v24 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v23];

        BOOL v7 = v21;
        id v11 = v20;
        id v12 = v51;
        goto LABEL_9;
      }

      BOOL v7 = v21;
      id v11 = v20;
      id v12 = v51;
    }
    __int16 v24 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_9:

    id v25 = self->_pendingUpdates;
    __int16 v26 = @"NO";
    if (v7) {
      __int16 v26 = @"YES";
    }
    id v27 = v26;
    *(_DWORD *)buf = 138543874;
    v56 = v24;
    __int16 v57 = 2048;
    v58 = v25;
    __int16 v59 = 2112;
    v60 = v27;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Creating batch updates %p (animated:%@)", buf, 0x20u);

    goto LABEL_12;
  }
LABEL_32:
}

- (id)_batchedUpdates
{
  return self->_pendingUpdates;
}

- (void)_runNextUpdate
{
  if (!self->_pendingUpdates)
  {
    BOOL v5 = sub_100577A0C();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    v15 = self;
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      id v18 = [(CarCardsOverlay *)v15 performSelector:"accessibilityIdentifier"];
      v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        id v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_18;
      }
    }
    id v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_18:

    *(_DWORD *)buf = 138543362;
    v45 = v20;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] No batched updates to run", buf, 0xCu);

    goto LABEL_11;
  }
  unsigned int v3 = -[CarCardsOverlay _shouldInterruptUpdates:toRunUpdates:](self, "_shouldInterruptUpdates:toRunUpdates:", self->_runningUpdates);
  runningUpdates = self->_runningUpdates;
  BOOL v5 = sub_100577A0C();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (runningUpdates && (v3 & 1) == 0)
  {
    if (!v6)
    {
LABEL_11:

      return;
    }
    BOOL v7 = self;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(CarCardsOverlay *)v7 performSelector:"accessibilityIdentifier"];
      id v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        id v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_10;
      }
    }
    id v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_10:

    pendingUpdates = self->_pendingUpdates;
    id v14 = self->_runningUpdates;
    *(_DWORD *)buf = 138543874;
    v45 = v12;
    __int16 v46 = 2048;
    v47 = pendingUpdates;
    __int16 v48 = 2048;
    v49 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Will not run next update %p, We're still running the previous one %p and cannot interrupt", buf, 0x20u);

    goto LABEL_11;
  }
  if (!v3)
  {
    if (!v6)
    {
LABEL_36:

      goto LABEL_37;
    }
    id v29 = self;
    __int16 v30 = (objc_class *)objc_opt_class();
    __int16 v31 = NSStringFromClass(v30);
    if (objc_opt_respondsToSelector())
    {
      __int16 v32 = [(CarCardsOverlay *)v29 performSelector:"accessibilityIdentifier"];
      __int16 v33 = v32;
      if (v32 && ![v32 isEqualToString:v31])
      {
        v34 = +[NSString stringWithFormat:@"%@<%p, %@>", v31, v29, v33];

        goto LABEL_35;
      }
    }
    v34 = +[NSString stringWithFormat:@"%@<%p>", v31, v29];
LABEL_35:

    id v35 = self->_pendingUpdates;
    *(_DWORD *)buf = 138543618;
    v45 = v34;
    __int16 v46 = 2048;
    v47 = v35;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Running next batch updates %p", buf, 0x16u);

    goto LABEL_36;
  }
  if (v6)
  {
    BOOL v21 = self;
    v22 = (objc_class *)objc_opt_class();
    id v23 = NSStringFromClass(v22);
    if (objc_opt_respondsToSelector())
    {
      __int16 v24 = [(CarCardsOverlay *)v21 performSelector:"accessibilityIdentifier"];
      id v25 = v24;
      if (v24 && ![v24 isEqualToString:v23])
      {
        __int16 v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

        goto LABEL_27;
      }
    }
    __int16 v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_27:

    unint64_t v28 = self->_pendingUpdates;
    id v27 = self->_runningUpdates;
    *(_DWORD *)buf = 138543874;
    v45 = v26;
    __int16 v46 = 2048;
    v47 = v27;
    __int16 v48 = 2048;
    v49 = v28;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Interrupting current updates %p with pending updates %p", buf, 0x20u);
  }
  [(CarCardsOverlay *)self _validatePendingUpdates];
LABEL_37:
  id v36 = self->_pendingUpdates;
  id v37 = objc_initWeak((id *)buf, v36);
  id v38 = self->_runningUpdates;
  self->_runningUpdates = v36;

  v39 = self->_pendingUpdates;
  self->_pendingUpdates = 0;

  id WeakRetained = objc_loadWeakRetained((id *)buf);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100B478F8;
  v42[3] = &unk_101318F08;
  v42[4] = self;
  objc_copyWeak(&v43, (id *)buf);
  [WeakRetained addCompletionBlock:v42];

  id v41 = objc_loadWeakRetained((id *)buf);
  [v41 run];

  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)buf);
}

- (void)_updateDidComplete:(id)a3
{
  BOOL v4 = (CarCardsUpdate *)a3;
  if (self->_runningUpdates == v4)
  {
    BOOL v5 = sub_100577A0C();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      [(CarCardsOverlay *)self _validatePendingUpdates];
      runningUpdates = self->_runningUpdates;
      self->_runningUpdates = 0;

      [(CarCardsOverlay *)self _runNextUpdate];
      goto LABEL_10;
    }
    BOOL v6 = self;
    BOOL v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(CarCardsOverlay *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    *(_DWORD *)buf = 138543618;
    id v14 = v11;
    __int16 v15 = 2048;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Running updates %p completed, will check for more updates", buf, 0x16u);

    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)_shouldInterruptUpdates:(id)a3 toRunUpdates:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 isAnimated]) {
    unsigned int v7 = [v6 isAnimated] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_validatePendingUpdates
{
  if (self->_pendingUpdates && self->_runningUpdates)
  {
    unsigned int v3 = sub_100577A0C();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
LABEL_10:

      pendingUpdates = self->_pendingUpdates;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100B47D48;
      v13[3] = &unk_101318F30;
      v13[4] = self;
      [(CarCardsUpdate *)pendingUpdates validateUpdatesUsingBlock:v13];
      return;
    }
    BOOL v4 = self;
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v7 = [(CarCardsOverlay *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_9;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_9:

    id v10 = self->_pendingUpdates;
    runningUpdates = self->_runningUpdates;
    *(_DWORD *)buf = 138543874;
    __int16 v15 = v9;
    __int16 v16 = 2048;
    v17 = v10;
    __int16 v18 = 2048;
    v19 = runningUpdates;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Validating updates %p given in-flight/completed updates %p", buf, 0x20u);

    goto LABEL_10;
  }
}

- (id)_configurationForKey:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [(CarCardsOverlay *)self configurationsByKey];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8 && v4)
  {
    id v8 = [(CarCardsUpdate *)self->_pendingUpdates pendingDeletedConfigurationForKey:v6];
    if (!v8)
    {
      id v8 = [[CarCardConfiguration alloc] initWithKey:v6 carSceneType:self->_carSceneType];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_cardDelegate);
      id v10 = [(CarCardConfiguration *)v8 cardView];
      [v10 setDelegate:WeakRetained];

      [(CarCardConfiguration *)v8 _setShowContainerVisualisation:self->_showDebugVisualisation];
    }
  }

  return v8;
}

- (void)_setCardConfiguration:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    unsigned int v7 = [(CarCardsOverlay *)self configurationKeys];
    if (v9)
    {
      [v7 addObject:v6];

      id v8 = [(CarCardsOverlay *)self configurationsByKey];
      [v8 setObject:v9 forKeyedSubscript:v6];
    }
    else
    {
      [v7 removeObject:v6];

      id v8 = [(CarCardsOverlay *)self configurationsByKey];
      [v8 removeObjectForKey:v6];
    }
  }
}

- (void)_captureInsetContraintsFromConfigurations
{
  unsigned int v3 = [(CarCardsOverlay *)self configurationsByKey];
  id v4 = [v3 count];

  id v5 = sub_100577A0C();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (!v4)
  {
    if (!v6)
    {
LABEL_23:

      __int16 v33 = [(CarCardsOverlay *)self host];
      [v33 setViewportConstraints:0 forOverlay:self];

      v34 = [(CarCardsOverlay *)self host];
      [v34 setMapInsetsConstraints:0 forOverlay:self];

      id v26 = [(CarCardsOverlay *)self host];
      [v26 setCollisionConstraints:0 forOverlay:self];
      goto LABEL_24;
    }
    objc_super v13 = self;
    if (!v13)
    {
      __int16 v18 = @"<nil>";
      goto LABEL_22;
    }
    id v14 = (objc_class *)objc_opt_class();
    __int16 v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      __int16 v16 = [(CarCardsOverlay *)v13 performSelector:"accessibilityIdentifier"];
      v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        __int16 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_17;
      }
    }
    __int16 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_17:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v40 = v18;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] No cards from which to capture inset constraints", buf, 0xCu);

    goto LABEL_23;
  }
  if (v6)
  {
    unsigned int v7 = self;
    if (!v7)
    {
      id v12 = @"<nil>";
      goto LABEL_19;
    }
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(CarCardsOverlay *)v7 performSelector:"accessibilityIdentifier"];
      id v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        id v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    id v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

LABEL_19:
    v19 = [(CarCardsOverlay *)v7 configurationsByKey];
    *(_DWORD *)buf = 138543618;
    v40 = v12;
    __int16 v41 = 2048;
    id v42 = [v19 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Capturing inset constraints from %lu cards", buf, 0x16u);
  }
  id v20 = +[NSMutableArray array];
  BOOL v21 = +[NSMutableArray array];
  v22 = +[NSMutableArray array];
  id v23 = [(CarCardsOverlay *)self configurationsByKey];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100B48644;
  v35[3] = &unk_101318F58;
  id v36 = v20;
  id v37 = v21;
  id v38 = v22;
  id v24 = v22;
  id v25 = v21;
  id v26 = v20;
  [v23 enumerateKeysAndObjectsUsingBlock:v35];

  id v27 = [(CarCardsOverlay *)self host];
  id v28 = [v26 copy];
  [v27 setViewportConstraints:v28 forOverlay:self];

  id v29 = [(CarCardsOverlay *)self host];
  id v30 = [v25 copy];
  [v29 setMapInsetsConstraints:v30 forOverlay:self];

  __int16 v31 = [(CarCardsOverlay *)self host];
  id v32 = [v24 copy];
  [v31 setCollisionConstraints:v32 forOverlay:self];

LABEL_24:
}

- (void)reset
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(CarCardsOverlay *)self configurationsByKey];
  id v5 = [v4 allValues];
  [v3 addObjectsFromArray:v5];

  BOOL v6 = [(CarCardsUpdate *)self->_pendingUpdates pendingDeletedConfigurations];
  [v3 addObjectsFromArray:v6];

  unsigned int v7 = [(CarCardsUpdate *)self->_runningUpdates pendingDeletedConfigurations];
  [v3 addObjectsFromArray:v7];

  id v8 = [v3 count];
  id v9 = sub_100577A0C();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (!v8)
  {
    if (!v10) {
      goto LABEL_17;
    }
    v19 = self;
    id v20 = (objc_class *)objc_opt_class();
    BOOL v21 = NSStringFromClass(v20);
    if (objc_opt_respondsToSelector())
    {
      v22 = [(CarCardsOverlay *)v19 performSelector:"accessibilityIdentifier"];
      id v23 = v22;
      if (v22 && ![v22 isEqualToString:v21])
      {
        id v24 = +[NSString stringWithFormat:@"%@<%p, %@>", v21, v19, v23];

        goto LABEL_16;
      }
    }
    id v24 = +[NSString stringWithFormat:@"%@<%p>", v21, v19];
LABEL_16:

    *(_DWORD *)buf = 138543362;
    id v26 = v24;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] No cards to reset", buf, 0xCu);

    goto LABEL_17;
  }
  if (v10)
  {
    id v11 = self;
    id v12 = (objc_class *)objc_opt_class();
    objc_super v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      id v14 = [(CarCardsOverlay *)v11 performSelector:"accessibilityIdentifier"];
      __int16 v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        __int16 v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_8;
      }
    }
    __int16 v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_8:

    *(_DWORD *)buf = 138543874;
    id v26 = v16;
    __int16 v27 = 2048;
    id v28 = [v3 count];
    __int16 v29 = 2112;
    id v30 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] Will reset %lu cards: %@", buf, 0x20u);
  }
  [v3 enumerateObjectsUsingBlock:&stru_101318F98];
  runningUpdates = self->_runningUpdates;
  self->_runningUpdates = 0;

  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = 0;

  id v9 = [(CarCardsOverlay *)self configurationsByKey];
  [v9 removeAllObjects];
LABEL_17:
}

- (void)cardsUpdate:(id)a3 prepareForUpdate:(unint64_t)a4 withCardConfigurations:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = sub_100577A0C();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    goto LABEL_14;
  }
  id v11 = self;
  if (!v11)
  {
    __int16 v16 = @"<nil>";
    goto LABEL_10;
  }
  id v12 = (objc_class *)objc_opt_class();
  objc_super v13 = NSStringFromClass(v12);
  if (objc_opt_respondsToSelector())
  {
    id v14 = [(CarCardsOverlay *)v11 performSelector:"accessibilityIdentifier"];
    __int16 v15 = v14;
    if (v14 && ![v14 isEqualToString:v13])
    {
      __int16 v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

      goto LABEL_8;
    }
  }
  __int16 v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_8:

LABEL_10:
  if (a4 > 2) {
    CFStringRef v17 = @"unknown";
  }
  else {
    CFStringRef v17 = off_101319118[a4];
  }
  *(_DWORD *)buf = 138544130;
  id v38 = v16;
  __int16 v39 = 2048;
  id v40 = v8;
  __int16 v41 = 2112;
  CFStringRef v42 = v17;
  __int16 v43 = 2048;
  id v44 = [v9 count];
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] %p | Will prepare %@ update for %lu card configurations", buf, 0x2Au);

LABEL_14:
  __int16 v31 = v8;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v18 = v9;
  id v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v33;
    UIAccessibilityNotifications v22 = UIAccessibilityScreenChangedNotification;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        id v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v24 _startIgnoringContainerBoundsChanges];
        if (a4 == 2)
        {
          id v26 = [(CarCardsOverlay *)self host];
          __int16 v27 = [v26 containingViewController];

          id v28 = [v24 content];
          [v27 addChildViewController:v28];

          __int16 v29 = [v24 content];
          id v30 = [v29 view];
          UIAccessibilityPostNotification(v22, v30);
        }
        else if (!a4)
        {
          id v25 = [v24 content];
          [v25 willMoveToParentViewController:0];

          UIAccessibilityPostNotification(v22, 0);
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v20);
  }
}

- (void)cardsUpdate:(id)a3 applyConfigurations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100577A0C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = self;
    if (!v9)
    {
      id v14 = @"<nil>";
      goto LABEL_10;
    }
    BOOL v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      id v12 = [(CarCardsOverlay *)v9 performSelector:"accessibilityIdentifier"];
      objc_super v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        id v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_8;
      }
    }
    id v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543874;
    __int16 v57 = v14;
    __int16 v58 = 2048;
    id v59 = v6;
    __int16 v60 = 2048;
    id v61 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] %p | Will apply %lu card configurations", buf, 0x20u);
  }
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100B49324;
  v53[3] = &unk_101318FC0;
  void v53[4] = self;
  __int16 v15 = sub_1000AC254(v7, v53);

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100B494D4;
  v52[3] = &unk_101318FE8;
  v52[4] = self;
  __int16 v16 = [v15 sortedArrayUsingComparator:v52];

  CFStringRef v17 = sub_100577A0C();
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
    goto LABEL_21;
  }
  id v18 = self;
  if (!v18)
  {
    id v23 = @"<nil>";
    goto LABEL_20;
  }
  id v19 = (objc_class *)objc_opt_class();
  id v20 = NSStringFromClass(v19);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v21 = [(CarCardsOverlay *)v18 performSelector:"accessibilityIdentifier"];
    UIAccessibilityNotifications v22 = v21;
    if (v21 && ![v21 isEqualToString:v20])
    {
      id v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v20, v18, v22];

      goto LABEL_18;
    }
  }
  id v23 = +[NSString stringWithFormat:@"%@<%p>", v20, v18];
LABEL_18:

LABEL_20:
  id v24 = [v16 count];
  *(_DWORD *)buf = 138543874;
  __int16 v57 = v23;
  __int16 v58 = 2048;
  id v59 = v6;
  __int16 v60 = 2048;
  id v61 = v24;
  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] %p | Will apply %lu valid card configurations", buf, 0x20u);

LABEL_21:
  __int16 v43 = v6;

  id v25 = [(CarCardsOverlay *)self host];
  id v26 = [(CarCardsOverlay *)self host];
  __int16 v27 = [v26 layoutGuideForOverlay:self];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v28 = v16;
  id v29 = [v28 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v49;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(v28);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * i) layoutInHost:v25 withLayoutGuide:v27];
      }
      id v30 = [v28 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v30);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v33 = v28;
  id v34 = [v33 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v45;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
        if ([v38 staysOnTop])
        {
          __int16 v39 = [v38 cardView];
          id v40 = [v39 superview];
          __int16 v41 = [v38 cardView];
          [v40 bringSubviewToFront:v41];
        }
      }
      id v35 = [v33 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v35);
  }

  [(CarCardsOverlay *)self _captureInsetContraintsFromConfigurations];
  CFStringRef v42 = [(CarCardsOverlay *)self contentView];
  [v42 setNeedsFocusUpdate];
}

- (void)cardsUpdateWantsLayout:(id)a3
{
  id v4 = a3;
  id v5 = sub_100577A0C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      id v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(CarCardsOverlay *)v6 performSelector:"accessibilityIdentifier"];
      BOOL v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    __int16 v15 = v11;
    __int16 v16 = 2048;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] %p | Wants layout", buf, 0x16u);
  }
  id v12 = [(CarCardsOverlay *)self contentView];
  [v12 layoutIfNeeded];

  objc_super v13 = [(CarCardsOverlay *)self configurationsByKey];
  [v13 enumerateKeysAndObjectsUsingBlock:&stru_101319008];
}

- (void)cardsUpdate:(id)a3 finalizeUpdate:(unint64_t)a4 withCardConfigurations:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = sub_100577A0C();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    goto LABEL_14;
  }
  id v11 = self;
  if (!v11)
  {
    __int16 v16 = @"<nil>";
    goto LABEL_10;
  }
  id v12 = (objc_class *)objc_opt_class();
  objc_super v13 = NSStringFromClass(v12);
  if (objc_opt_respondsToSelector())
  {
    id v14 = [(CarCardsOverlay *)v11 performSelector:"accessibilityIdentifier"];
    __int16 v15 = v14;
    if (v14 && ![v14 isEqualToString:v13])
    {
      __int16 v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

      goto LABEL_8;
    }
  }
  __int16 v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_8:

LABEL_10:
  if (a4 > 2) {
    CFStringRef v17 = @"unknown";
  }
  else {
    CFStringRef v17 = off_101319118[a4];
  }
  *(_DWORD *)buf = 138544130;
  id v34 = v16;
  __int16 v35 = 2048;
  id v36 = v8;
  __int16 v37 = 2112;
  CFStringRef v38 = v17;
  __int16 v39 = 2048;
  id v40 = [v9 count];
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] %p | Will finalize %@ update for %lu card configurations", buf, 0x2Au);

LABEL_14:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v9;
  id v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (a4 == 2)
        {
          id v25 = [(CarCardsOverlay *)self host];
          id v26 = [v25 containingViewController];

          __int16 v27 = [v23 content];
          [v27 didMoveToParentViewController:v26];
        }
        else if (!a4)
        {
          id v24 = [*(id *)(*((void *)&v28 + 1) + 8 * i) previousContent];
          [v24 removeFromParentViewController];

          [v23 setPreviousContent:0];
        }
        [v23 _stopIgnoringContainerBoundsChanges];
      }
      id v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v20);
  }
}

- (NSArray)preferredFocusEnvironments
{
  id v3 = [(CarCardsOverlay *)self contentView];

  if (v3)
  {
    id v4 = [(CarCardsOverlay *)self contentView];
    id v7 = v4;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    id v5 = &__NSArray0__struct;
  }

  return (NSArray *)v5;
}

- (NSArray)focusOrderSubItems
{
  id v3 = [(CarCardsOverlay *)self configurationsByKey];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = +[NSMutableArray array];
    id v6 = [(CarCardsOverlay *)self configurationsByKey];
    id v7 = [v6 allValues];
    id v8 = [v7 sortedArrayUsingComparator:&stru_101319048];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) cardView:v18];
          __int16 v15 = [v14 focusOrderSubItems];
          [v5 addObjectsFromArray:v15];
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v16 = [v5 copy];
  }
  else
  {
    id v16 = &__NSArray0__struct;
  }

  return (NSArray *)v16;
}

- (ChromeOverlayHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (ChromeOverlayHosting *)WeakRetained;
}

- (CarCardViewDelegate)cardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardDelegate);

  return (CarCardViewDelegate *)WeakRetained;
}

- (UIView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  return (UIView *)WeakRetained;
}

- (NSMutableOrderedSet)configurationKeys
{
  return self->_configurationKeys;
}

- (void)setConfigurationKeys:(id)a3
{
}

- (NSMutableDictionary)configurationsByKey
{
  return self->_configurationsByKey;
}

- (void)setConfigurationsByKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationsByKey, 0);
  objc_storeStrong((id *)&self->_configurationKeys, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_cardDelegate);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_runningUpdates, 0);

  objc_storeStrong((id *)&self->_pendingUpdates, 0);
}

@end