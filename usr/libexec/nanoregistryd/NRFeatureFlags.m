@interface NRFeatureFlags
+ (id)sharedInstance;
- (BOOL)albertReportPairingMode;
- (BOOL)networkRelayPairing;
- (NRFeatureFlags)init;
- (id)_dictionaryRepresentation;
- (id)description;
@end

@implementation NRFeatureFlags

+ (id)sharedInstance
{
  if (qword_1001A1150 != -1) {
    dispatch_once(&qword_1001A1150, &stru_100167850);
  }
  v2 = (void *)qword_1001A1148;

  return v2;
}

- (NRFeatureFlags)init
{
  v4.receiver = self;
  v4.super_class = (Class)NRFeatureFlags;
  v2 = [(NRFeatureFlags *)&v4 init];
  if (v2)
  {
    v2->_networkRelayPairing = _os_feature_enabled_impl();
    v2->_albertReportPairingMode = _os_feature_enabled_impl();
  }
  return v2;
}

- (id)description
{
  v2 = [(NRFeatureFlags *)self _dictionaryRepresentation];
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100052944;
  v11 = &unk_100167878;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v12;
  [v2 enumerateKeysAndObjectsUsingBlock:&v8];
  id v4 = objc_alloc((Class)NSString);
  v5 = [v3 componentsJoinedByString:@", "];
  id v6 = [v4 initWithFormat:@"NRFeatureFlags:- %@", v5, v8, v9, v10, v11];

  return v6;
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int outCount = 0;
  id v4 = (objc_class *)objc_opt_class();
  v5 = class_copyPropertyList(v4, &outCount);
  id v6 = v5;
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      id v8 = [objc_alloc((Class)NSString) initWithCString:property_getName(v6[i]) encoding:4];
      uint64_t v9 = [(NRFeatureFlags *)self valueForKey:v8];
      v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 BOOLValue]);
      [v3 setObject:v10 forKeyedSubscript:v8];
    }
  }
  else if (!v5)
  {
    goto LABEL_7;
  }
  free(v6);
LABEL_7:

  return v3;
}

- (BOOL)networkRelayPairing
{
  return self->_networkRelayPairing;
}

- (BOOL)albertReportPairingMode
{
  return self->_albertReportPairingMode;
}

@end