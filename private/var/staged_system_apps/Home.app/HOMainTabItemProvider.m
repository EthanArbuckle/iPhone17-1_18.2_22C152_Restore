@interface HOMainTabItemProvider
- (BOOL)_isRunningInDemoMode;
- (BOOL)_shouldShowTriggerAboutPageForHome:(id)a3;
- (BOOL)_shouldShowTriggerListForHome:(id)a3;
- (HMHome)home;
- (HOMainTabItemProvider)initWithHome:(id)a3;
- (HOMainTabItemProvider)initWithItems:(id)a3;
- (NSArray)orderedTabItems;
- (void)setHome:(id)a3;
- (void)setOrderedTabItems:(id)a3;
@end

@implementation HOMainTabItemProvider

- (HOMainTabItemProvider)initWithItems:(id)a3
{
  v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v5 = [v4 home];
  v6 = [(HOMainTabItemProvider *)self initWithHome:v5];

  return v6;
}

- (HOMainTabItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = +[NSMutableArray array];
  id v7 = [objc_alloc((Class)HFStaticItem) initWithResultsBlock:&stru_1000C21F0];
  [v6 addObject:v7];
  objc_initWeak(&location, self);
  id v8 = objc_alloc((Class)HFStaticItem);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000181F0;
  v23[3] = &unk_1000C2218;
  objc_copyWeak(&v25, &location);
  id v9 = v5;
  id v24 = v9;
  id v10 = [v8 initWithResultsBlock:v23];
  [v6 addObject:v10];
  v11 = +[HFStoreLocaleAvailability getAvailabilityDictionary];
  id v12 = objc_alloc((Class)HFStaticItem);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000185A0;
  v20[3] = &unk_1000C2240;
  id v13 = v11;
  id v21 = v13;
  id v14 = v9;
  id v22 = v14;
  id v15 = [v12 initWithResultsBlock:v20];
  [v6 addObject:v15];
  v16 = +[NSSet setWithArray:v6];
  v19.receiver = self;
  v19.super_class = (Class)HOMainTabItemProvider;
  v17 = [(HOMainTabItemProvider *)&v19 initWithItems:v16];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_home, a3);
    objc_storeStrong((id *)&v17->_orderedTabItems, v6);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v17;
}

- (BOOL)_shouldShowTriggerListForHome:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "hf_currentUserIsRestrictedGuest"))
  {
    char v4 = 0;
  }
  else if ((objc_msgSend(v3, "hf_hasAnyVisibleTriggers") & 1) != 0 {
         || (objc_msgSend(v3, "hf_userCanCreateTrigger") & 1) != 0)
  }
  {
    char v4 = 1;
  }
  else
  {
    char v4 = HFForceAllowAutomationCreation();
  }

  return v4;
}

- (BOOL)_shouldShowTriggerAboutPageForHome:(id)a3
{
  if (objc_msgSend(a3, "hf_userIsAllowedToCreateTrigger")) {
    return 1;
  }

  return [(HOMainTabItemProvider *)self _isRunningInDemoMode];
}

- (BOOL)_isRunningInDemoMode
{
  if (+[HFUtilities isRunningInStoreDemoMode]) {
    return 1;
  }

  return +[HFUtilities isPressDemoModeEnabled];
}

- (NSArray)orderedTabItems
{
  return self->_orderedTabItems;
}

- (void)setOrderedTabItems:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_orderedTabItems, 0);
}

@end