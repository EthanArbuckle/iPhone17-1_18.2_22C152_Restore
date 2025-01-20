@interface CLPersistentDictionary
+ (id)persistentDictionaryWithFilename:(id)a3 withDataProtectionClass:(int)a4;
- (BOOL)isModified;
- (CLPersistentDictionary)initWithFilename:(id)a3 withDataProtectionClass:(int)a4;
- (NSMutableDictionary)underlyingDictionary;
- (NSString)filename;
- (id)dictionary;
- (int)dataProtection;
- (void)clear;
- (void)dealloc;
- (void)markModifiedClean;
- (void)markModifiedDirty;
- (void)persist;
- (void)refresh;
- (void)setDictionary:(id)a3;
- (void)setUnderlyingDictionary:(id)a3;
@end

@implementation CLPersistentDictionary

- (void)persist
{
  if ([(CLPersistentDictionary *)self isModified])
  {
    v3 = [(CLPersistentDictionary *)self underlyingDictionary];
    v4 = [(CLPersistentDictionary *)self filename];
    unsigned int v5 = [(CLPersistentDictionary *)self dataProtection];
    if (byte_10247F9E0 == 1)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022DAA38);
      }
      v6 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        v21 = "";
        __int16 v22 = 2114;
        v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary saving to file which didn't exist on boot\", \"file\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
    }
    sub_1000E1294((uint64_t *)v17, (uint64_t)"CLPersistentDictionary saving to file", 0);
    uint64_t v16 = 0;
    v8 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:&v16];
    if (v16)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022DAA38);
      }
      v9 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        int v19 = 0;
        __int16 v20 = 2082;
        v21 = "";
        __int16 v22 = 2114;
        v23 = v4;
        __int16 v24 = 2114;
        uint64_t v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary Errors serializing the plist indicate non-plist types being stored therein\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022DAA38);
        }
      }
      v10 = qword_102419538;
      if (!os_signpost_enabled((os_log_t)qword_102419538)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 68289538;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v22 = 2114;
      v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v16;
      v11 = "#PersistentDictionary Errors serializing the plist indicate non-plist types being stored therein";
      v12 = "{\"msg%{public}.0s\":\"#PersistentDictionary Errors serializing the plist indicate non-plist types being sto"
            "red therein\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}";
    }
    else
    {
      uint64_t v13 = 536870913;
      if (v5) {
        uint64_t v13 = 1;
      }
      if (v5 == 1) {
        uint64_t v14 = 1073741825;
      }
      else {
        uint64_t v14 = v13;
      }
      [(NSData *)v8 writeToFile:v4 options:v14 error:&v16];
      if (!v16) {
        goto LABEL_29;
      }
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022DAA38);
      }
      v15 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        int v19 = 0;
        __int16 v20 = 2082;
        v21 = "";
        __int16 v22 = 2114;
        v23 = v4;
        __int16 v24 = 2114;
        uint64_t v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary Writing plist to file should never result in an error\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022DAA38);
        }
      }
      v10 = qword_102419538;
      if (!os_signpost_enabled((os_log_t)qword_102419538)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 68289538;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v22 = 2114;
      v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v16;
      v11 = "#PersistentDictionary Writing plist to file should never result in an error";
      v12 = "{\"msg%{public}.0s\":\"#PersistentDictionary Writing plist to file should never result in an error\", \"file"
            "\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}";
    }
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, buf, 0x26u);
LABEL_29:
    sub_1000E1098(v17);
    [(CLPersistentDictionary *)self markModifiedClean];
  }
}

- (void)markModifiedDirty
{
  self->_modified = 1;
}

- (NSMutableDictionary)underlyingDictionary
{
  return self->_underlyingDictionary;
}

- (void)markModifiedClean
{
  self->_modified = 0;
}

- (BOOL)isModified
{
  return self->_modified;
}

- (NSString)filename
{
  return self->_filename;
}

- (int)dataProtection
{
  return self->_dataProtection;
}

+ (id)persistentDictionaryWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  id v4 = [objc_alloc((Class)a1) initWithFilename:a3 withDataProtectionClass:*(void *)&a4];

  return v4;
}

- (CLPersistentDictionary)initWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  if (!a3) {
    sub_101A7BE88();
  }
  v9.receiver = self;
  v9.super_class = (Class)CLPersistentDictionary;
  v6 = [(CLPersistentDictionary *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CLPersistentDictionary *)v6 setUnderlyingDictionary:0];
    v7->_filename = (NSString *)a3;
    v7->_dataProtection = a4;
    [(CLPersistentDictionary *)v7 refresh];
  }
  return v7;
}

- (void)dealloc
{
  [(CLPersistentDictionary *)self setUnderlyingDictionary:0];
  v3.receiver = self;
  v3.super_class = (Class)CLPersistentDictionary;
  [(CLPersistentDictionary *)&v3 dealloc];
}

- (id)dictionary
{
  id v2 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] cl_deepMutableCopy];

  return v2;
}

- (void)setDictionary:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToDictionary:", -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary")) & 1) == 0)
  {
    [(CLPersistentDictionary *)self setUnderlyingDictionary:+[NSMutableDictionary dictionaryWithDictionary:a3]];
    [(CLPersistentDictionary *)self markModifiedDirty];
  }
}

- (void)refresh
{
  [(CLPersistentDictionary *)self markModifiedClean];
  objc_super v3 = [(CLPersistentDictionary *)self filename];
  v15 = 0;
  id v4 = +[NSData dataWithContentsOfFile:v3 options:0 error:&v15];
  if (!v4)
  {
    if (qword_10247F9E8 != -1) {
      dispatch_once(&qword_10247F9E8, &stru_1022DAA58);
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022DAA38);
    }
    v11 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      __int16 v20 = 2114;
      v21 = v3;
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary #warning Couldn't load plist from file. Defaulting to empty dictionary.\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    goto LABEL_17;
  }
  id v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:1 format:0 error:&v15];
  if (v15) {
    goto LABEL_3;
  }
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_18;
  }
  if (v15)
  {
LABEL_3:
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022DAA38);
    }
    v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      __int16 v20 = 2114;
      v21 = v3;
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary Deserializing data loaded from file failed. Defaulting to empty dictionary.\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022DAA38);
      }
    }
    uint64_t v7 = qword_102419538;
    if (!os_signpost_enabled((os_log_t)qword_102419538)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 68289538;
    int v17 = 0;
    __int16 v18 = 2082;
    int v19 = "";
    __int16 v20 = 2114;
    v21 = v3;
    __int16 v22 = 2114;
    id v23 = v15;
    v8 = "#PersistentDictionary Deserializing data loaded from file failed. Defaulting to empty dictionary.";
    objc_super v9 = "{\"msg%{public}.0s\":\"#PersistentDictionary Deserializing data loaded from file failed. Defaulting to empty di"
         "ctionary.\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}";
    v10 = v7;
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022DAA38);
    }
    uint64_t v13 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v17 = 0;
      __int16 v18 = 2082;
      int v19 = "";
      __int16 v20 = 2114;
      v21 = v3;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#PersistentDictionary Data loaded from file isn't a dictionary. Defaulting to empty dictionary.\", \"file\":%{public, location:escape_only}@, \"data\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022DAA38);
      }
    }
    uint64_t v14 = qword_102419538;
    if (!os_signpost_enabled((os_log_t)qword_102419538)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 68289538;
    int v17 = 0;
    __int16 v18 = 2082;
    int v19 = "";
    __int16 v20 = 2114;
    v21 = v3;
    __int16 v22 = 2114;
    id v23 = v12;
    v8 = "#PersistentDictionary Data loaded from file isn't a dictionary. Defaulting to empty dictionary.";
    objc_super v9 = "{\"msg%{public}.0s\":\"#PersistentDictionary Data loaded from file isn't a dictionary. Defaulting to empty dict"
         "ionary.\", \"file\":%{public, location:escape_only}@, \"data\":%{public, location:escape_only}@}";
    v10 = v14;
  }
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v8, v9, buf, 0x26u);
LABEL_17:
  id v12 = +[NSMutableDictionary dictionary];
LABEL_18:
  [(CLPersistentDictionary *)self setUnderlyingDictionary:v12];
}

- (void)clear
{
  [+[NSFileManager defaultManager] removeItemAtPath:[(CLPersistentDictionary *)self filename] error:0];

  [(CLPersistentDictionary *)self refresh];
}

- (void)setUnderlyingDictionary:(id)a3
{
}

@end