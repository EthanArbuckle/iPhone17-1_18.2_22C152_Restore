@interface RMGenericAuthenticationCredential
- (BOOL)_prepareSchemeMAIDTask:(id)a3 error:(id *)a4;
- (BOOL)_prepareSchemeMAIDURLRequest:(id)a3 error:(id *)a4;
- (BOOL)prepareTask:(id)a3 error:(id *)a4;
- (BOOL)prepareURLRequest:(id)a3 error:(id *)a4;
- (id)_appleIDContext;
- (id)_createAuthenticationParameters;
- (id)_updateBearerPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4;
- (id)_updateMAIDPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4;
- (id)_updateTestPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4;
- (id)updatePropertiesForAccountIdentifier:(id)a3 afterFailure:(BOOL)a4;
@end

@implementation RMGenericAuthenticationCredential

- (BOOL)prepareURLRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(RMGenericAuthenticationCredential *)self _createAuthenticationParameters];
  v8 = [(RMGenericAuthenticationCredential *)self authenticationScheme];
  v9 = +[NSString stringWithFormat:@"%@ %@", v8, v7];
  [v6 setValue:v9 forHTTPHeaderField:@"Authorization"];

  v10 = [(RMGenericAuthenticationCredential *)self authenticationScheme];
  LODWORD(v8) = [v10 isEqualToString:RMAuthenticationSchemeMAID];

  if (v8) {
    BOOL v11 = [(RMGenericAuthenticationCredential *)self _prepareSchemeMAIDURLRequest:v6 error:a4];
  }
  else {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)_prepareSchemeMAIDURLRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_msgSend(v5, "ak_addDeviceUDIDHeader");
  objc_msgSend(v5, "ak_addClientInfoHeader");
  objc_msgSend(v5, "ak_addDeviceSerialNumberHeader");
  id v6 = [(RMGenericAuthenticationCredential *)self properties];
  v7 = [v6 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldAltDSID];
  v8 = [v6 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldShortLivedToken];
  v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    id v11 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v11 stringValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = +[RMDateFormat stringUTCWithDate:v11];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 base64EncodedStringWithOptions:0];
          }
          else {
          id v12 = [v11 description];
          }
        }
      }
    }
    v13 = v12;

    id v14 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = [v14 stringValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = +[RMDateFormat stringUTCWithDate:v14];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v14 base64EncodedStringWithOptions:0];
          }
          else {
          id v15 = [v14 description];
          }
        }
      }
    }
    v16 = v15;

    objc_msgSend(v5, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", v13, v16);
  }
  v17 = [v6 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldDSID];
  uint64_t v18 = [v6 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldLongLivedToken];
  v19 = (void *)v18;
  if (v17) {
    BOOL v20 = v18 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (!v20)
  {
    id v21 = v17;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = v21;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = [v21 stringValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = +[RMDateFormat stringUTCWithDate:v21];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v21 base64EncodedStringWithOptions:0];
          }
          else {
          id v22 = [v21 description];
          }
        }
      }
    }
    v23 = v22;

    id v24 = v19;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v24;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = [v24 stringValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v25 = +[RMDateFormat stringUTCWithDate:v24];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v24 base64EncodedStringWithOptions:0];
          }
          else {
          id v25 = [v24 description];
          }
        }
      }
    }
    v26 = v25;

    v27 = +[NSString stringWithFormat:@"%@:%@", v23, v26];

    v28 = [v27 dataUsingEncoding:4];
    v29 = [v28 base64EncodedStringWithOptions:0];
    [v5 setValue:v29 forHTTPHeaderField:@"X-Apple-RM-MDM-Token"];
  }
  return 1;
}

- (BOOL)prepareTask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(RMGenericAuthenticationCredential *)self authenticationScheme];
  unsigned int v8 = [v7 isEqualToString:RMAuthenticationSchemeMAID];

  if (v8) {
    BOOL v9 = [(RMGenericAuthenticationCredential *)self _prepareSchemeMAIDTask:v6 error:a4];
  }
  else {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_prepareSchemeMAIDTask:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(RMGenericAuthenticationCredential *)self _appleIDContext];
    [v5 _setAppleIDContext:v6];
  }
  return 1;
}

- (id)_appleIDContext
{
  if (qword_1000DAFD8 != -1) {
    dispatch_once(&qword_1000DAFD8, &stru_1000C4EB0);
  }
  id v3 = (id)qword_1000DAFD0;
  objc_sync_enter(v3);
  v4 = objc_getAssociatedObject(self, @"AssociatedKeyAppleIDContext");
  if (!v4)
  {
    v4 = objc_opt_new();
    objc_setAssociatedObject(self, @"AssociatedKeyAppleIDContext", v4, (void *)0x301);
  }
  objc_sync_exit(v3);

  return v4;
}

- (id)updatePropertiesForAccountIdentifier:(id)a3 afterFailure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(RMGenericAuthenticationCredential *)self authenticationScheme];
  unsigned int v8 = [v7 isEqualToString:RMAuthenticationSchemeTest];

  if (v8)
  {
    uint64_t v9 = [(RMGenericAuthenticationCredential *)self _updateTestPropertiesAccountIdentifier:v6 afterFailure:v4];
LABEL_7:
    id v14 = (void *)v9;
    goto LABEL_8;
  }
  BOOL v10 = [(RMGenericAuthenticationCredential *)self authenticationScheme];
  unsigned int v11 = [v10 isEqualToString:RMAuthenticationSchemeBearer];

  if (v11)
  {
    uint64_t v9 = [(RMGenericAuthenticationCredential *)self _updateBearerPropertiesAccountIdentifier:v6 afterFailure:v4];
    goto LABEL_7;
  }
  id v12 = [(RMGenericAuthenticationCredential *)self authenticationScheme];
  unsigned int v13 = [v12 isEqualToString:RMAuthenticationSchemeMAID];

  if (v13)
  {
    uint64_t v9 = [(RMGenericAuthenticationCredential *)self _updateMAIDPropertiesAccountIdentifier:v6 afterFailure:v4];
    goto LABEL_7;
  }
  id v14 = 0;
LABEL_8:

  return v14;
}

- (id)_updateTestPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(RMGenericAuthenticationCredential *)self properties];
  id v7 = [v6 mutableCopy];

  if (v4)
  {
    unsigned int v8 = +[RMLog genericAuthenticationCredential];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10000E6DC(self, v8);
    }

    uint64_t v9 = objc_opt_new();
    BOOL v10 = [v9 UUIDString];
    [v7 setObject:v10 forKeyedSubscript:RMAuthenticationSchemeTestFieldToken];

    id v11 = objc_alloc((Class)RMGenericAuthenticationCredential);
    id v12 = [(RMGenericAuthenticationCredential *)self authenticationScheme];
    id v13 = [v11 initWithAuthenticationScheme:v12 properties:v7];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_updateBearerPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(RMGenericAuthenticationCredential *)self properties];
  id v7 = [v6 mutableCopy];

  unsigned int v8 = [(RMGenericAuthenticationCredential *)self properties];
  uint64_t v9 = RMAuthenticationSchemeBearerFieldAccessToken;
  BOOL v10 = [v8 objectForKeyedSubscript:RMAuthenticationSchemeBearerFieldAccessToken];

  id v11 = +[ACAccountStore rm_defaultStore];
  id v12 = objc_msgSend(v11, "rm_remoteManagementAccountForIdentifier:", v5);
  id v13 = objc_msgSend(v12, "rm_bearerToken");
  id v14 = v13;
  if (v13 && ([v13 isEqualToString:v10] & 1) == 0)
  {
    v16 = +[RMLog genericAuthenticationCredential];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10000E794();
    }

    [v7 setObject:v14 forKeyedSubscript:v9];
    id v17 = objc_alloc((Class)RMGenericAuthenticationCredential);
    uint64_t v18 = [(RMGenericAuthenticationCredential *)self authenticationScheme];
    id v15 = [v17 initWithAuthenticationScheme:v18 properties:v7];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_updateMAIDPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4
{
  id v5 = [(RMGenericAuthenticationCredential *)self properties];
  id v35 = [v5 mutableCopy];

  id v6 = [(RMGenericAuthenticationCredential *)self properties];
  id v7 = [v6 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldAltDSID];

  unsigned int v8 = [(RMGenericAuthenticationCredential *)self properties];
  uint64_t v9 = RMAuthenticationSchemeMAIDFieldShortLivedToken;
  BOOL v10 = [v8 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldShortLivedToken];

  id v11 = [(RMGenericAuthenticationCredential *)self properties];
  uint64_t v34 = RMAuthenticationSchemeMAIDFieldLongLivedToken;
  v36 = objc_msgSend(v11, "objectForKeyedSubscript:");

  id v12 = +[ACAccountStore rm_defaultStore];
  id v13 = objc_msgSend(v12, "aida_accountForAltDSID:", v7);
  if (!v13)
  {
    id v14 = +[RMLog genericAuthenticationCredential];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000EA04();
    }
  }
  id v15 = objc_msgSend(v13, "aida_tokenForService:", @"com.apple.gs.mdm.auth");
  if (!v15)
  {
    uint64_t v18 = +[RMLog genericAuthenticationCredential];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000E934();
    }

    goto LABEL_13;
  }
  if ([v10 isEqualToString:v15])
  {
LABEL_13:
    int v17 = 0;
    goto LABEL_14;
  }
  v16 = +[RMLog genericAuthenticationCredential];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10000E99C();
  }

  [v35 setObject:v15 forKeyedSubscript:v9];
  int v17 = 1;
LABEL_14:
  v19 = objc_msgSend(v12, "rm_iCloudAccountForRemoteManagingAccountWithAltDSID:", v7);
  if (!v19)
  {
    BOOL v20 = +[RMLog genericAuthenticationCredential];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000E8CC();
    }
  }
  id v21 = v19;
  id v22 = +[RMFeatureOverrides maidLongLivedToken];
  v23 = v22;
  if (!v22)
  {
    objc_msgSend(v21, "aa_mdmServerToken");
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if ([v22 length])
  {
    id v24 = v23;
LABEL_22:
    id v25 = v24;
    goto LABEL_24;
  }
  id v25 = 0;
LABEL_24:

  if (v25)
  {
    if ([v36 isEqualToString:v25]) {
      goto LABEL_26;
    }
LABEL_31:
    v29 = +[RMLog genericAuthenticationCredential];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10000E7FC();
    }

    [v35 setObject:v25 forKeyedSubscript:v34];
    goto LABEL_34;
  }
  v28 = +[RMLog genericAuthenticationCredential];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_10000E864();
  }

  if (v36) {
    goto LABEL_31;
  }
LABEL_26:
  if (!v17)
  {
    id v26 = 0;
    v27 = v35;
    goto LABEL_35;
  }
LABEL_34:
  id v30 = objc_alloc((Class)RMGenericAuthenticationCredential);
  v31 = [(RMGenericAuthenticationCredential *)self authenticationScheme];
  v32 = v30;
  v27 = v35;
  id v26 = [v32 initWithAuthenticationScheme:v31 properties:v35];

LABEL_35:

  return v26;
}

- (id)_createAuthenticationParameters
{
  id v3 = [(RMGenericAuthenticationCredential *)self authenticationScheme];
  unsigned int v4 = [v3 isEqualToString:RMAuthenticationSchemeBearer];

  id v5 = [(RMGenericAuthenticationCredential *)self properties];
  id v6 = v5;
  if (v4)
  {
    id v7 = [v5 objectForKeyedSubscript:RMAuthenticationSchemeBearerFieldAccessToken];
  }
  else
  {
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000E548;
    v11[3] = &unk_1000C4ED8;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v12;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
    uint64_t v9 = [v8 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    id v7 = [v9 componentsJoinedByString:@", "];
  }

  return v7;
}

@end