@interface FMDAccessoryRegistryDelegateAdaptor
- (FMDAccessoryRegistry)registry;
- (FMDAccessoryRegistryDelegateAdaptor)initWithAccessoryRegistry:(id)a3;
- (void)beaconsChanged;
- (void)bluetoothManagerDidConnectDevice:(id)a3;
- (void)bluetoothManagerDidDisconnectDevice:(id)a3;
- (void)bluetoothManagerDidUnpairDevice:(id)a3;
- (void)bluetoothManagerDidUpdateDevice:(id)a3;
- (void)companionRegistryDidUpdateAccessories:(id)a3;
- (void)setRegistry:(id)a3;
@end

@implementation FMDAccessoryRegistryDelegateAdaptor

- (FMDAccessoryRegistryDelegateAdaptor)initWithAccessoryRegistry:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDAccessoryRegistryDelegateAdaptor;
  v5 = [(FMDAccessoryRegistryDelegateAdaptor *)&v8 init];
  v6 = v5;
  if (v5) {
    [(FMDAccessoryRegistryDelegateAdaptor *)v5 setRegistry:v4];
  }

  return v6;
}

- (void)companionRegistryDidUpdateAccessories:(id)a3
{
  id v3 = [(FMDAccessoryRegistryDelegateAdaptor *)self registry];
  [v3 reloadData];
}

- (void)bluetoothManagerDidConnectDevice:(id)a3
{
  id v4 = a3;
  if ([v4 isTemporaryPaired])
  {
    sub_100004238();
    v5 = (FMDBluetoothAccessory *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_DEFAULT, "BluetoothManager.DidConnectDevice Ignoring shared device %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v5 = [[FMDBluetoothAccessory alloc] initWithBluetoothManagerDevice:v4];
    v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(FMDBluetoothAccessory *)v5 accessoryIdentifier];
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry bluetoothManagerDidConnectDevice %@", (uint8_t *)&v9, 0xCu);
    }
    objc_super v8 = [(FMDAccessoryRegistryDelegateAdaptor *)self registry];
    [v8 updateAccessory:v5];
  }
}

- (void)bluetoothManagerDidDisconnectDevice:(id)a3
{
  id v4 = a3;
  if ([v4 isTemporaryPaired])
  {
    sub_100004238();
    v5 = (FMDBluetoothAccessory *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_DEFAULT, "BluetoothManager.DidDisconnectDevice Ignoring shared device %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v5 = [[FMDBluetoothAccessory alloc] initWithBluetoothManagerDevice:v4];
    v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(FMDBluetoothAccessory *)v5 accessoryIdentifier];
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry bluetoothManagerDidDisconnectDevice %@", (uint8_t *)&v9, 0xCu);
    }
    objc_super v8 = [(FMDAccessoryRegistryDelegateAdaptor *)self registry];
    [v8 updateAccessory:v5];
  }
}

- (void)bluetoothManagerDidUnpairDevice:(id)a3
{
  id v4 = a3;
  if ([v4 isTemporaryPaired])
  {
    sub_100004238();
    v5 = (FMDBluetoothAccessory *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_DEFAULT, "BluetoothManager.DidUnpairDevice Ignoring shared device %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v5 = [[FMDBluetoothAccessory alloc] initWithBluetoothManagerDevice:v4];
    v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(FMDBluetoothAccessory *)v5 accessoryIdentifier];
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry bluetoothManagerDidUnpairDevice %@", (uint8_t *)&v9, 0xCu);
    }
    objc_super v8 = [(FMDAccessoryRegistryDelegateAdaptor *)self registry];
    [v8 removeAccessory:v5];
  }
}

- (void)bluetoothManagerDidUpdateDevice:(id)a3
{
  id v4 = a3;
  if ([v4 isTemporaryPaired])
  {
    sub_100004238();
    v5 = (FMDBluetoothAccessory *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_DEFAULT, "BluetoothManager.DidUpdateDevice Ignoring shared device %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v5 = [[FMDBluetoothAccessory alloc] initWithBluetoothManagerDevice:v4];
    v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self;
      objc_super v8 = self;
      int v9 = [(FMDBluetoothAccessory *)v5 accessoryIdentifier];
      int v11 = 134218498;
      id v12 = v7;
      __int16 v13 = 2048;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry FMDBluetoothManagerDevice(0x%lX) bluetoothManagerDidUpdateDevice FMDInternalAccessory(0x%lX) %@", (uint8_t *)&v11, 0x20u);
    }
    id v10 = [(FMDAccessoryRegistryDelegateAdaptor *)self registry];
    [v10 updateAccessory:v5];
  }
}

- (void)beaconsChanged
{
  id v2 = [(FMDAccessoryRegistryDelegateAdaptor *)self registry];
  [v2 reloadData];
}

- (FMDAccessoryRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end