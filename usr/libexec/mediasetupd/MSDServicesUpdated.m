@interface MSDServicesUpdated
+ (id)servicesUpdated:(id)a3 cachedData:(id)a4;
- (MSDServicesUpdated)initWithUpdatedData:(id)a3 cachedData:(id)a4;
- (NSArray)cachedData;
- (NSArray)updatedData;
- (void)_handleDefaultServiceChanged:(id)a3;
- (void)_handleServiceAdded:(id)a3 cachedDataIDS:(id)a4;
- (void)_handleServiceRemoved:(id)a3 cachedDataIDS:(id)a4;
- (void)processChangesInServices;
- (void)setCachedData:(id)a3;
- (void)setUpdatedData:(id)a3;
@end

@implementation MSDServicesUpdated

- (MSDServicesUpdated)initWithUpdatedData:(id)a3 cachedData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSDServicesUpdated;
  v9 = [(MSDServicesUpdated *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cachedData, a4);
    objc_storeStrong((id *)&v10->_updatedData, a3);
  }

  return v10;
}

+ (id)servicesUpdated:(id)a3 cachedData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithUpdatedData:v7 cachedData:v6];

  return v8;
}

- (void)processChangesInServices
{
  v3 = [(NSArray *)self->_cachedData na_map:&stru_10004CA50];
  id v4 = [v3 mutableCopy];

  v5 = [(NSArray *)self->_updatedData na_map:&stru_10004CA70];
  id v6 = [v5 mutableCopy];

  id v7 = [v6 count];
  if (v7 != [v4 count])
  {
    id v8 = [v6 count];
    id v9 = [v4 count];
    v10 = sub_100031A80();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v8 <= v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "A service was deleted on device", buf, 2u);
      }

      id v12 = [v6 copy];
      id v13 = [v4 copy];
      [(MSDServicesUpdated *)self _handleServiceRemoved:v12 cachedDataIDS:v13];
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "A service was added on device", buf, 2u);
      }

      id v12 = [v6 copy];
      id v13 = [v4 copy];
      [(MSDServicesUpdated *)self _handleServiceAdded:v12 cachedDataIDS:v13];
    }
  }
  v27 = v6;
  v28 = v4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v14 = self->_updatedData;
  id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    uint64_t v18 = MSDefaultServiceRecordType;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v21 = [v20 recordType];
        unsigned int v22 = [v21 isEqualToString:v18];

        if (v22)
        {
          [(MSDServicesUpdated *)self _handleDefaultServiceChanged:v20];
        }
        else
        {
          cachedData = self->_cachedData;
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_100005E64;
          v30[3] = &unk_10004CA98;
          v30[4] = v20;
          v24 = [(NSArray *)cachedData na_firstObjectPassingTest:v30];
          if (v24)
          {
            v25 = sub_100031A80();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "A service was updated on device", buf, 2u);
            }

            dispatch_time_t v26 = dispatch_time(0, 500000000);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100005F78;
            block[3] = &unk_10004CAC0;
            block[4] = v20;
            dispatch_after(v26, (dispatch_queue_t)&_dispatch_main_q, block);
          }
        }
      }
      id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v16);
  }
}

- (void)_handleServiceAdded:(id)a3 cachedDataIDS:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mutableCopy];
  [v7 removeObjectsInArray:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006158;
  v8[3] = &unk_10004CAE8;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
}

- (void)_handleServiceRemoved:(id)a3 cachedDataIDS:(id)a4
{
  id v6 = a3;
  id v7 = [a4 mutableCopy];
  [v7 removeObjectsInArray:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006504;
  v8[3] = &unk_10004CAE8;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
}

- (void)_handleDefaultServiceChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 service];
  id v6 = [v5 serviceID];

  id v7 = [v4 homeUserID];

  cachedData = self->_cachedData;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100006A64;
  v24[3] = &unk_10004CA98;
  id v9 = v7;
  id v25 = v9;
  v10 = [(NSArray *)cachedData na_firstObjectPassingTest:v24];
  BOOL v11 = [v10 service];
  id v12 = [v11 serviceID];
  unsigned __int8 v13 = [v12 isEqual:v6];

  if ((v13 & 1) == 0)
  {
    updatedData = self->_updatedData;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100006AE8;
    v21[3] = &unk_10004CB10;
    id v22 = v9;
    id v23 = v6;
    id v15 = [(NSArray *)updatedData na_firstObjectPassingTest:v21];
    if (v15)
    {
      id v16 = sub_100031A80();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "DefaultService was updated on device", buf, 2u);
      }

      dispatch_time_t v17 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006BAC;
      block[3] = &unk_10004CAC0;
      id v19 = v15;
      dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (NSArray)updatedData
{
  return self->_updatedData;
}

- (void)setUpdatedData:(id)a3
{
}

- (NSArray)cachedData
{
  return self->_cachedData;
}

- (void)setCachedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedData, 0);

  objc_storeStrong((id *)&self->_updatedData, 0);
}

@end