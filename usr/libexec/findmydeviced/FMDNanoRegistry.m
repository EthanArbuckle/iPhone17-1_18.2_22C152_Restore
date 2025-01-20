@interface FMDNanoRegistry
- (FMDCompanionRegistryDelegate)delegate;
- (FMDNanoRegistry)init;
- (id)accessoriesWithProperty:(id)a3;
- (id)activePairedDevice;
- (id)allAccessories;
- (id)migratableAccessories;
- (id)migratableAccessoriesByIdentifier;
- (id)pairedAccessories;
- (void)addObservers;
- (void)dealloc;
- (void)deviceDidPair:(id)a3;
- (void)deviceDidUnpair:(id)a3;
- (void)getAccessoriesWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FMDNanoRegistry

- (FMDNanoRegistry)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDNanoRegistry;
  v2 = [(FMDNanoRegistry *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FMDNanoRegistry *)v2 addObservers];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FMDNanoRegistry;
  [(FMDNanoRegistry *)&v4 dealloc];
}

- (void)addObservers
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"deviceDidPair:" name:@"nano.devicedidpair" object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"deviceDidUnpair:" name:@"nano.devicedidunpair" object:0];
}

- (void)getAccessoriesWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(FMDNanoRegistry *)self allAccessories];
    (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
  }
}

- (id)activePairedDevice
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = [v2 getActivePairedDevice];

  id v4 = [[FMDNanoRegistryAccessory alloc] initWithNRDevice:v3];

  return v4;
}

- (id)allAccessories
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDNanoRegistry allAccessories", v6, 2u);
  }

  id v4 = [(FMDNanoRegistry *)self accessoriesWithProperty:0];

  return v4;
}

- (id)pairedAccessories
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDNanoRegistry pairedAccessories", v6, 2u);
  }

  id v4 = [(FMDNanoRegistry *)self accessoriesWithProperty:NRDevicePropertyIsPaired];

  return v4;
}

- (id)migratableAccessories
{
  v2 = [(FMDNanoRegistry *)self migratableAccessoriesByIdentifier];
  v3 = [v2 allValues];

  return v3;
}

- (id)migratableAccessoriesByIdentifier
{
  v2 = sub_100004238();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDNanoRegistry migratedAccessories", buf, 2u);
  }

  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NRMigrator sharedMigrator];
  uint64_t v5 = [v4 migratableDevices];
  id v6 = (void *)v5;
  v7 = &__NSArray0__struct;
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  v9 = +[NRMigrator sharedMigrator];
  v10 = [v9 migratableDevicesRequiringConsent];

  if (v10)
  {
    uint64_t v11 = [v8 arrayByAddingObjectsFromArray:v10];

    id v8 = (id)v11;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002EDF8;
  v14[3] = &unk_1002DA378;
  id v12 = v3;
  id v15 = v12;
  [v8 enumerateObjectsUsingBlock:v14];

  return v12;
}

- (id)accessoriesWithProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMDNanoRegistry *)self migratableAccessoriesByIdentifier];
  id v6 = +[NRPairedDeviceRegistry sharedInstance];
  v7 = [v6 getAllDevices];

  +[NSMutableArray array];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002EFC4;
  v14[3] = &unk_1002DA3A0;
  id v15 = v4;
  id v16 = v5;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v8;
  id v9 = v5;
  id v10 = v4;
  [v7 enumerateObjectsUsingBlock:v14];
  uint64_t v11 = v17;
  id v12 = v8;

  return v12;
}

- (void)deviceDidPair:(id)a3
{
  id v4 = [(FMDNanoRegistry *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 companionRegistryDidUpdateAccessories:self];
  }
}

- (void)deviceDidUnpair:(id)a3
{
  id v4 = [(FMDNanoRegistry *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 companionRegistryDidUpdateAccessories:self];
  }
}

- (FMDCompanionRegistryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMDCompanionRegistryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end