@interface PDSharingManagementBulkRevokeShareResponse
+ (BOOL)jsonDataOptional;
- (NSDictionary)statuses;
- (PDSharingManagementBulkRevokeShareResponse)initWithData:(id)a3;
@end

@implementation PDSharingManagementBulkRevokeShareResponse

- (PDSharingManagementBulkRevokeShareResponse)initWithData:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)PDSharingManagementBulkRevokeShareResponse;
  v4 = -[PDSharingManagementBulkRevokeShareResponse initWithData:](&v29, "initWithData:");
  v5 = v4;
  if (a3 && v4)
  {
    v6 = [(PDSharingManagementBulkRevokeShareResponse *)v4 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 PKArrayContaining:objc_opt_class() forKey:@"statuses"];
      if (!v7)
      {
        id v8 = objc_alloc_init((Class)NSMutableDictionary);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v15 = [0 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v26;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(0);
              }
              v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              v20 = [v19 PKStringForKey:@"shareIdentifier"];
              uint64_t v21 = [v19 PKNumberForKey:@"status"];
              v22 = (void *)v21;
              if (v20) {
                BOOL v23 = v21 == 0;
              }
              else {
                BOOL v23 = 1;
              }
              if (!v23) {
                [v8 setObject:v21 forKeyedSubscript:v20];
              }
            }
            id v16 = [0 countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v16);
        }
        v24 = (NSDictionary *)[v8 copy];
        p_super = &v5->_statuses->super;
        v5->_statuses = v24;
        goto LABEL_10;
      }
      id v8 = (id)v7;
      p_super = v5;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        v12 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v32 = v11;
        __int16 v33 = 2112;
        v34 = v12;
        id v13 = v12;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      id v8 = v5;
    }
    v5 = 0;
LABEL_10:
  }
  return v5;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

- (NSDictionary)statuses
{
  return self->_statuses;
}

- (void).cxx_destruct
{
}

@end