@interface CLKeychainItemWrapper
- (CLKeychainItemWrapper)initWithIdentifier:(id)a3;
- (CLKeychainItemWrapper)initWithIdentifier:(id)a3 keyType:(__CFString *)a4;
- (NSMutableDictionary)genericPasswordQuery;
- (NSMutableDictionary)keychainItemData;
- (id)dictionaryToSecItemFormat:(id)a3;
- (id)objectForKey:(id)a3;
- (id)secItemFormatToDictionary:(id)a3;
- (void)dealloc;
- (void)initializeKeychainItemWithIdentifier:(id)a3 keyType:(__CFString *)a4;
- (void)resetKeychainItem;
- (void)setGenericPasswordQuery:(id)a3;
- (void)setKeychainItemData:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)writeToKeychain;
@end

@implementation CLKeychainItemWrapper

- (CLKeychainItemWrapper)initWithIdentifier:(id)a3 keyType:(__CFString *)a4
{
  v19.receiver = self;
  v19.super_class = (Class)CLKeychainItemWrapper;
  v6 = [(CLKeychainItemWrapper *)&v19 init];
  if (v6)
  {
    if (a3)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022B7DB0);
      }
      v7 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        id v8 = [a3 UTF8String];
        *(_DWORD *)buf = 68289539;
        int v21 = 0;
        __int16 v22 = 2082;
        v23 = "";
        __int16 v24 = 2081;
        id v25 = v8;
        __int16 v26 = 2113;
        v27 = a4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Initializing CLKeychainItemWrapper with identifier and key.\", \"identifier\":%{private, location:escape_only}s, \"key\":%{private, location:escape_only}@}", buf, 0x26u);
      }
      v9 = (NSMutableDictionary *)objc_opt_new();
      v6->_genericPasswordQuery = v9;
      [(NSMutableDictionary *)v9 setObject:kSecClassGenericPassword forKey:kSecClass];
      [(NSMutableDictionary *)v6->_genericPasswordQuery setObject:a3 forKey:a4];
      [(NSMutableDictionary *)v6->_genericPasswordQuery setObject:kSecMatchLimitOne forKey:kSecMatchLimit];
      [(NSMutableDictionary *)v6->_genericPasswordQuery setObject:kCFBooleanTrue forKey:kSecReturnAttributes];
      CFTypeRef result = 0;
      OSStatus v10 = SecItemCopyMatching((CFDictionaryRef)v6->_genericPasswordQuery, &result);
      if (v10 == -25300) {
        goto LABEL_20;
      }
      OSStatus v11 = v10;
      if (!v10)
      {
        v12 = (NSMutableDictionary *)[(CLKeychainItemWrapper *)v6 secItemFormatToDictionary:result];
        if (v12)
        {
          v6->_keychainItemData = v12;
LABEL_21:

          return v6;
        }
LABEL_20:
        [(CLKeychainItemWrapper *)v6 initializeKeychainItemWithIdentifier:a3 keyType:a4];
        goto LABEL_21;
      }
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022B7DB0);
      }
      v15 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v21 = 0;
        __int16 v22 = 2082;
        v23 = "";
        __int16 v24 = 1026;
        LODWORD(v25) = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Initial query to CLKeychainItemWrapper failed\", \"error\":%{public}d}", buf, 0x18u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022B7DB0);
        }
      }
      v16 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68289282;
        int v21 = 0;
        __int16 v22 = 2082;
        v23 = "";
        __int16 v24 = 1026;
        LODWORD(v25) = v11;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Initial query to CLKeychainItemWrapper failed", "{\"msg%{public}.0s\":\"Initial query to CLKeychainItemWrapper failed\", \"error\":%{public}d}", buf, 0x18u);
      }
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022B7DB0);
      }
      v13 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "nil identifier given to CLKeychainItemWrapper", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022B7DB0);
        }
        LOWORD(result) = 0;
        v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLKeychainItemWrapper initWithIdentifier:keyType:]", "%s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
    }

    return 0;
  }
  return v6;
}

- (CLKeychainItemWrapper)initWithIdentifier:(id)a3
{
  return [(CLKeychainItemWrapper *)self initWithIdentifier:a3 keyType:kSecAttrGeneric];
}

- (void)dealloc
{
  self->_keychainItemData = 0;
  self->_genericPasswordQuery = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLKeychainItemWrapper;
  [(CLKeychainItemWrapper *)&v3 dealloc];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a3
    && (objc_msgSend(-[CLKeychainItemWrapper objectForKey:](self, "objectForKey:", a4), "isEqual:", a3) & 1) == 0)
  {
    [(NSMutableDictionary *)[(CLKeychainItemWrapper *)self keychainItemData] setObject:a3 forKey:a4];
    [(CLKeychainItemWrapper *)self writeToKeychain];
  }
}

- (id)objectForKey:(id)a3
{
  v4 = [(CLKeychainItemWrapper *)self keychainItemData];

  return [(NSMutableDictionary *)v4 objectForKey:a3];
}

- (void)initializeKeychainItemWithIdentifier:(id)a3 keyType:(__CFString *)a4
{
  [(CLKeychainItemWrapper *)self resetKeychainItem];
  keychainItemData = self->_keychainItemData;

  [(NSMutableDictionary *)keychainItemData setObject:a3 forKey:a4];
}

- (void)resetKeychainItem
{
  if ([(CLKeychainItemWrapper *)self keychainItemData])
  {
    SecItemDelete((CFDictionaryRef)[(CLKeychainItemWrapper *)self dictionaryToSecItemFormat:[(CLKeychainItemWrapper *)self keychainItemData]]);
    [(NSMutableDictionary *)[(CLKeychainItemWrapper *)self keychainItemData] removeAllObjects];
  }
  else
  {
    [(CLKeychainItemWrapper *)self setKeychainItemData:(id)objc_opt_new()];
  }
  [(NSMutableDictionary *)[(CLKeychainItemWrapper *)self keychainItemData] setObject:@"com.apple.locationd" forKey:kSecAttrService];
  objc_super v3 = [(CLKeychainItemWrapper *)self keychainItemData];

  [(NSMutableDictionary *)v3 setObject:&stru_10234F018 forKey:kSecValueData];
}

- (id)dictionaryToSecItemFormat:(id)a3
{
  if (!a3)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022B7DB0);
    }
    v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "nil dictionary passed for converstion", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419530 == -1) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  v4 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
  [(NSMutableDictionary *)v4 setObject:kSecClassGenericPassword forKey:kSecClass];
  id v5 = [a3 objectForKey:kSecValueData];
  if (!v5)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022B7DB0);
    }
    v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Conversion of dictionary without kSecValueData key requested.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419530 == -1)
    {
LABEL_19:
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLKeychainItemWrapper dictionaryToSecItemFormat:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
      return 0;
    }
LABEL_21:
    dispatch_once(&qword_102419530, &stru_1022B7DB0);
    goto LABEL_19;
  }
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", [v5 dataUsingEncoding:4], kSecValueData);
  return v4;
}

- (id)secItemFormatToDictionary:(id)a3
{
  if (!a3)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022B7DB0);
    }
    id v8 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "nil dictionary passed for retrieving keychain item", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022B7DB0);
    }
    LOWORD(result) = 0;
    v9 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLKeychainItemWrapper secItemFormatToDictionary:]", "%s\n");
LABEL_21:
    if (v9 != buf) {
      free(v9);
    }
    return 0;
  }
  objc_super v3 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
  [(NSMutableDictionary *)v3 setObject:kCFBooleanTrue forKey:kSecReturnData];
  [(NSMutableDictionary *)v3 setObject:kSecClassGenericPassword forKey:kSecClass];
  CFTypeRef result = 0;
  OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
  if (v4 == -25300)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022B7DB0);
    }
    OSStatus v10 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Expected keychain item not found.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022B7DB0);
    }
    v9 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLKeychainItemWrapper secItemFormatToDictionary:]", "%s\n");
    goto LABEL_21;
  }
  OSStatus v5 = v4;
  if (v4)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022B7DB0);
    }
    OSStatus v11 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      v18 = "";
      __int16 v19 = 1026;
      OSStatus v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to retrieve keychain item\", \"error\":%{public}d}", buf, 0x18u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022B7DB0);
      }
    }
    v12 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)buf = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      v18 = "";
      __int16 v19 = 1026;
      OSStatus v20 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unable to retrieve keychain item", "{\"msg%{public}.0s\":\"Unable to retrieve keychain item\", \"error\":%{public}d}", buf, 0x18u);
    }
    return 0;
  }
  [(NSMutableDictionary *)v3 removeObjectForKey:kSecReturnData];
  id v6 = objc_alloc((Class)NSString);
  id v7 = [v6 initWithData:result encoding:4];
  [(NSMutableDictionary *)v3 setObject:v7 forKey:kSecValueData];

  return v3;
}

- (void)writeToKeychain
{
  CFTypeRef result = 0;
  OSStatus v3 = SecItemCopyMatching((CFDictionaryRef)[(CLKeychainItemWrapper *)self genericPasswordQuery], &result);
  if (v3 == -25300)
  {
    OSStatus v13 = SecItemAdd((CFDictionaryRef)[(CLKeychainItemWrapper *)self dictionaryToSecItemFormat:[(CLKeychainItemWrapper *)self keychainItemData]], 0);
    if (v13)
    {
      OSStatus v14 = v13;
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022B7DB0);
      }
      v15 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        int v21 = "";
        __int16 v22 = 1026;
        OSStatus v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Couldn't add the Keychain Item\", \"error\":%{public}d}", buf, 0x18u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022B7DB0);
        }
      }
      OSStatus v10 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        int v21 = "";
        __int16 v22 = 1026;
        OSStatus v23 = v14;
        OSStatus v11 = "Couldn't add the Keychain Item";
        v12 = "{\"msg%{public}.0s\":\"Couldn't add the Keychain Item\", \"error\":%{public}d}";
        goto LABEL_26;
      }
    }
  }
  else
  {
    OSStatus v4 = v3;
    if (v3)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022B7DB0);
      }
      int v16 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        int v21 = "";
        __int16 v22 = 1026;
        OSStatus v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Couldn't query for the Keychain Item to add\", \"error\":%{public}d}", buf, 0x18u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022B7DB0);
        }
      }
      OSStatus v10 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        int v21 = "";
        __int16 v22 = 1026;
        OSStatus v23 = v4;
        OSStatus v11 = "Couldn't query for the Keychain Item to add";
        v12 = "{\"msg%{public}.0s\":\"Couldn't query for the Keychain Item to add\", \"error\":%{public}d}";
        goto LABEL_26;
      }
    }
    else
    {
      OSStatus v5 = +[NSMutableDictionary dictionaryWithDictionary:result];
      [(NSMutableDictionary *)v5 setObject:[(NSMutableDictionary *)[(CLKeychainItemWrapper *)self genericPasswordQuery] objectForKey:kSecClass] forKey:kSecClass];
      id v6 = [(CLKeychainItemWrapper *)self dictionaryToSecItemFormat:[(CLKeychainItemWrapper *)self keychainItemData]];
      [v6 removeObjectForKey:kSecClass];
      OSStatus v7 = SecItemUpdate((CFDictionaryRef)v5, (CFDictionaryRef)v6);
      if (v7)
      {
        OSStatus v8 = v7;
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022B7DB0);
        }
        v9 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289282;
          int v19 = 0;
          __int16 v20 = 2082;
          int v21 = "";
          __int16 v22 = 1026;
          OSStatus v23 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Couldn't update the Keychain Item\", \"error\":%{public}d}", buf, 0x18u);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022B7DB0);
          }
        }
        OSStatus v10 = qword_102419538;
        if (os_signpost_enabled((os_log_t)qword_102419538))
        {
          *(_DWORD *)buf = 68289282;
          int v19 = 0;
          __int16 v20 = 2082;
          int v21 = "";
          __int16 v22 = 1026;
          OSStatus v23 = v8;
          OSStatus v11 = "Couldn't update the Keychain Item";
          v12 = "{\"msg%{public}.0s\":\"Couldn't update the Keychain Item\", \"error\":%{public}d}";
LABEL_26:
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, buf, 0x18u);
        }
      }
    }
  }
}

- (NSMutableDictionary)keychainItemData
{
  return self->_keychainItemData;
}

- (void)setKeychainItemData:(id)a3
{
}

- (NSMutableDictionary)genericPasswordQuery
{
  return self->_genericPasswordQuery;
}

- (void)setGenericPasswordQuery:(id)a3
{
}

@end