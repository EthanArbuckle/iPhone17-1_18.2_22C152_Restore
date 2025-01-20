@interface NRDevicePreferencesManager
- (id)description;
- (void)dealloc;
@end

@implementation NRDevicePreferencesManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyTrafficClasses, 0);
  objc_storeStrong((id *)&self->_policyTrafficClassifiersDict, 0);
  objc_storeStrong((id *)&self->_devicePreferencesTypeLink, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_nrUUID, 0);
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self)
  {
    v4 = self->_devicePreferencesTypeLink;
    policyTrafficClassifiersDict = self->_policyTrafficClassifiersDict;
  }
  else
  {
    v4 = 0;
    policyTrafficClassifiersDict = 0;
  }
  id v6 = [v3 initWithFormat:@"Active Link Preferences: %@, Policy Traffic Classifiers: %@", v4, policyTrafficClassifiersDict];

  return v6;
}

- (void)dealloc
{
  id v3 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    if (self) {
      nrUUID = self->_nrUUID;
    }
    else {
      nrUUID = 0;
    }
    id v6 = nrUUID;
    v7 = (void *)_NRCopyLogObjectForNRUUID();
    uint64_t v10 = 64;
    v11 = self;
    v8 = "";
    v9 = "-[NRDevicePreferencesManager dealloc]";
    _NRLogWithArgs();
  }
  v12.receiver = self;
  v12.super_class = (Class)NRDevicePreferencesManager;
  [(NRDevicePreferencesManager *)&v12 dealloc];
}

@end