@interface EligibilityAsset
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (id)_policiesForRawArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4;
- (unint64_t)hash;
- (void)_initEnabledKeyWithDictionary:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation EligibilityAsset

- (void).cxx_destruct
{
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v2 = [(EligibilityAsset *)self name];
  v3 = +[NSString stringWithFormat:@"[Eligibility Asset name:%@]", v2];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EligibilityAsset *)a3;
  v11.receiver = self;
  v11.super_class = (Class)EligibilityAsset;
  if (![(EligibilityAsset *)&v11 isEqual:v4]) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v8 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = [(EligibilityAsset *)self name];
    v7 = [(EligibilityAsset *)v5 name];
    char v8 = sub_100019BF8(v6, v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_10000D0EC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[EligibilityAsset isEqual:]";
        __int16 v14 = 2080;
        v15 = "name";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }
    }
  }
  else
  {
LABEL_9:
    char v8 = 0;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  v2 = [(EligibilityAsset *)self name];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = [(EligibilityAsset *)self name];
  id v7 = [v6 copyWithZone:a3];
  [v5 setName:v7];

  return v5;
}

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  id v7 = (__CFString *)a3;
  id v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)EligibilityAsset;
  v9 = [(EligibilityAsset *)&v41 init];
  if (!v9)
  {
LABEL_52:
    v16 = v9;
    goto LABEL_53;
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:v7];
  if (v10)
  {
    objc_super v11 = (void *)v10;
    objc_storeStrong((id *)&v9->_name, a3);
    [(EligibilityAsset *)v9 _initEnabledKeyWithDictionary:v11];
    if ([(EligibilityAsset *)v9 conformsToProtocol:&OBJC_PROTOCOL___LocatedCountryAssetProtocol_private])
    {
      v12 = [v11 objectForKey:@"Country Codes"];
      objc_opt_class();
      id v13 = v12;
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }

      if (v14 && (objc_opt_class(), sub_100019C7C(v14)))
      {
        v17 = v9;
        v18 = +[NSSet setWithArray:v14];
        [(EligibilityAsset *)v17 setCountryCodes:v18];
      }
      else
      {
        v18 = sub_10000D0EC();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          __int16 v44 = 2112;
          CFStringRef v45 = @"Country Codes";
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: Mobile Asset is missing key \"%@\" of NSArray type", buf, 0x16u);
        }
      }
    }
    if ([(EligibilityAsset *)v9 conformsToProtocol:&OBJC_PROTOCOL___GracePeriodAssetProtocol_private])
    {
      v19 = [v11 objectForKey:@"Grace Period"];
      objc_opt_class();
      id v20 = v19;
      if (objc_opt_isKindOfClass()) {
        id v21 = v20;
      }
      else {
        id v21 = 0;
      }

      v22 = v9;
      if (v21)
      {
        id v23 = [v21 unsignedIntegerValue];
      }
      else
      {
        v24 = sub_10000D0EC();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          __int16 v44 = 2112;
          CFStringRef v45 = @"Grace Period";
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Mobile Asset is missing key \"%@\" of NSNumber type", buf, 0x16u);
        }

        id v23 = 0;
      }
      [(EligibilityAsset *)v22 setGracePeriodInSeconds:v23];
    }
    if ([(EligibilityAsset *)v9 conformsToProtocol:&OBJC_PROTOCOL___BillingCountryAssetProtocol_private])
    {
      v25 = [v11 objectForKey:@"Billing Countries"];
      objc_opt_class();
      id v26 = v25;
      if (objc_opt_isKindOfClass()) {
        id v27 = v26;
      }
      else {
        id v27 = 0;
      }

      if (v27 && (objc_opt_class(), sub_100019C7C(v27)))
      {
        v28 = v9;
        v29 = +[NSSet setWithArray:v27];
        [(EligibilityAsset *)v28 setBillingCountryCodes:v29];
      }
      else
      {
        v29 = sub_10000D0EC();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          __int16 v44 = 2112;
          CFStringRef v45 = @"Billing Countries";
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s: Mobile Asset is missing key \"%@\" of NSArray type", buf, 0x16u);
        }
      }
    }
    if ([(EligibilityAsset *)v9 conformsToProtocol:&OBJC_PROTOCOL___RegionSKUAssetProtocol_private])
    {
      v30 = [v11 objectForKey:@"Region SKUs"];
      objc_opt_class();
      id v31 = v30;
      if (objc_opt_isKindOfClass()) {
        id v32 = v31;
      }
      else {
        id v32 = 0;
      }

      if (v32 && (objc_opt_class(), sub_100019C7C(v32)))
      {
        v33 = v9;
        v34 = +[NSSet setWithArray:v32];
        [(EligibilityAsset *)v33 setRegionSKUs:v34];
      }
      else
      {
        v34 = sub_10000D0EC();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          __int16 v44 = 2112;
          CFStringRef v45 = @"Region SKUs";
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s: Mobile Asset is missing key \"%@\" of NSArray type", buf, 0x16u);
        }
      }
    }
    if ([(EligibilityAsset *)v9 conformsToProtocol:&OBJC_PROTOCOL___PolicyAssetProtocol_private])
    {
      v35 = [v11 objectForKey:@"Policies"];
      objc_opt_class();
      id v36 = v35;
      if (objc_opt_isKindOfClass()) {
        id v37 = v36;
      }
      else {
        id v37 = 0;
      }

      v38 = v9;
      v39 = [(EligibilityAsset *)v38 _policiesForRawArray:v37];
      [(EligibilityAsset *)v38 setPolicies:v39];
    }
    goto LABEL_52;
  }
  v15 = sub_10000D0EC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
    __int16 v44 = 2112;
    CFStringRef v45 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Mobile Asset does not contain the %@ domain", buf, 0x16u);
  }

  v16 = 0;
LABEL_53:

  return v16;
}

- (void)_initEnabledKeyWithDictionary:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"Enabled"];
  if (v4)
  {
    v6 = (void *)v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v5 = [v6 BOOLValue];
    }
    else {
      unsigned __int8 v5 = 1;
    }
  }
  else
  {
    unsigned __int8 v5 = 1;
  }
  self->_isEnabled = v5;

  _objc_release_x1();
}

- (id)_policiesForRawArray:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  if (v3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v3;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_super v11 = v10;
            v12 = objc_opt_new();
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_10001AA04;
            v18[3] = &unk_100038E30;
            id v13 = v12;
            id v19 = v13;
            [v11 enumerateKeysAndObjectsUsingBlock:v18];
            if ([v13 count])
            {
              id v14 = [v13 copy];
              [v4 addObject:v14];
            }
          }
          else
          {
            objc_super v11 = sub_10000D0EC();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v25 = "-[EligibilityAsset _policiesForRawArray:]";
              __int16 v26 = 2112;
              CFStringRef v27 = @"Policies";
              _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s: Mobile Asset has a policy in \"%@\" that is not of NSDictionary type", buf, 0x16u);
            }
          }

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v7);
    }

    id v15 = [v4 copy];
    id v3 = v17;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

@end