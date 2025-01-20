@interface MRDRouteRecommendationOutputContextLogic
- (BOOL)localOutputContextHasDeviceOfType:(unsigned int)a3;
- (NSDictionary)localOutputContextDeviceTypesCount;
- (id)_localOutputContextDeviceTypesCount;
- (void)reloadOutputContextData;
- (void)setLocalOutputContextDeviceTypesCount:(id)a3;
@end

@implementation MRDRouteRecommendationOutputContextLogic

- (BOOL)localOutputContextHasDeviceOfType:(unsigned int)a3
{
  v4 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  v5 = [v4 outputDevices];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100118034;
  v8[3] = &unk_10041D610;
  unsigned int v9 = a3;
  v6 = objc_msgSend(v5, "msv_firstWhere:", v8);
  LOBYTE(a3) = v6 != 0;

  return a3;
}

- (void)reloadOutputContextData
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  v4 = [v3 outputDevices];

  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    LODWORD(v7) = 0;
    LODWORD(v8) = 0;
    LODWORD(v9) = 0;
    LODWORD(v10) = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v4);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v13 deviceType] == 2) {
          uint64_t v10 = (v10 + 1);
        }
        else {
          uint64_t v10 = v10;
        }
        if ([v13 deviceType] == 5) {
          uint64_t v7 = (v7 + 1);
        }
        else {
          uint64_t v7 = v7;
        }
        if ([v13 deviceType] == 3) {
          uint64_t v8 = (v8 + 1);
        }
        else {
          uint64_t v8 = v8;
        }
        if ([v13 deviceType] == 1) {
          uint64_t v9 = (v9 + 1);
        }
        else {
          uint64_t v9 = v9;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }

  v24[0] = &off_1004381C0;
  v14 = +[NSNumber numberWithInt:v10];
  v25[0] = v14;
  v24[1] = &off_1004381D8;
  v15 = +[NSNumber numberWithInt:v7];
  v25[1] = v15;
  v24[2] = &off_1004381F0;
  v16 = +[NSNumber numberWithInt:v8];
  v25[2] = v16;
  v24[3] = &off_100438208;
  v17 = +[NSNumber numberWithInt:v9];
  v25[3] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  localOutputContextDeviceTypesCount = self->_localOutputContextDeviceTypesCount;
  self->_localOutputContextDeviceTypesCount = v18;
}

- (id)_localOutputContextDeviceTypesCount
{
  localOutputContextDeviceTypesCount = self->_localOutputContextDeviceTypesCount;
  if (!localOutputContextDeviceTypesCount)
  {
    [(MRDRouteRecommendationOutputContextLogic *)self reloadOutputContextData];
    localOutputContextDeviceTypesCount = self->_localOutputContextDeviceTypesCount;
  }

  return localOutputContextDeviceTypesCount;
}

- (NSDictionary)localOutputContextDeviceTypesCount
{
  return self->_localOutputContextDeviceTypesCount;
}

- (void)setLocalOutputContextDeviceTypesCount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end