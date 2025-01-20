@interface NFFieldNotification
+ (BOOL)supportsSecureCoding;
+ (NFFieldNotification)notificationWithDictionary:(id)a3;
+ (id)fieldNotificationFromXPCObject:(id)a3;
- (BOOL)cachedBeforeRFReset;
- (BOOL)isCHAutoNegotiationField;
- (BOOL)isCHInitiatorDetected;
- (BOOL)isCHReceiverDetected;
- (BOOL)isCHTerminal;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualTerminalInfo:(id)a3;
- (BOOL)isEqualWithoutRFTech:(id)a3;
- (NFFieldNotification)initWithCoder:(id)a3;
- (NFFieldNotification)initWithDictionary:(id)a3;
- (NFFieldNotification)initWithNotificationType:(unint64_t)a3 rfTechnology:(unsigned int)a4 typeFSystemCode:(unsigned __int16)a5 creationDate:(id)a6 cachedBeforeRFReset:(BOOL)a7;
- (NSDate)creationDate;
- (id)_creationDateString;
- (id)asXPCObject;
- (id)chRandomData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)category;
- (unint64_t)chFieldType;
- (unint64_t)notificationType;
- (unsigned)rfTechnology;
- (unsigned)typeFSystemCode;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedBeforeRFReset:(BOOL)a3;
- (void)setCategory:(int64_t)a3;
- (void)setCreationDate:(id)a3;
- (void)setNotificationType:(unint64_t)a3;
@end

@implementation NFFieldNotification

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t rfTechnology = self->_rfTechnology;
  id v5 = a3;
  [v5 encodeInteger:rfTechnology forKey:@"rfTechnology"];
  [v5 encodeInteger:self->_typeFSystemCode forKey:@"typeFSystemCode"];
  [v5 encodeInteger:self->_notificationType forKey:@"notificationType"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeBool:self->_cachedBeforeRFReset forKey:@"cachedBeforeRFReset"];
  [v5 encodeInteger:self->_category forKey:@"category"];
}

- (NFFieldNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFFieldNotification;
  id v5 = [(NFFieldNotification *)&v9 init];
  if (v5)
  {
    v5->_uint64_t rfTechnology = [v4 decodeIntegerForKey:@"rfTechnology"];
    v5->_typeFSystemCode = (unsigned __int16)[v4 decodeIntegerForKey:@"typeFSystemCode"];
    v5->_notificationType = (unint64_t)[v4 decodeIntegerForKey:@"notificationType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    v5->_cachedBeforeRFReset = [v4 decodeBoolForKey:@"cachedBeforeRFReset"];
    v5->_category = (int64_t)[v4 decodeIntegerForKey:@"category"];
  }

  return v5;
}

+ (NFFieldNotification)notificationWithDictionary:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"NFFieldNotification.m" lineNumber:63 description:@"Empty dictionary"];

    v13 = 0;
    goto LABEL_34;
  }
  uint64_t v6 = [v5 objectForKey:@"ECPData"];
  if ((unint64_t)[v6 length] < 3) {
    goto LABEL_31;
  }
  id v7 = v6;
  v8 = [v7 bytes];
  if (*v8 != 106)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v15 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v19 = 45;
      if (isMetaClass) {
        uint64_t v19 = 43;
      }
      v15(4, "%c[%{public}s %{public}s]:%i Unexpected ECP command; initialized to non ECP",
        v19,
        ClassName,
        Name,
        88);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    v21 = object_getClass(a1);
    if (class_isMetaClass(v21)) {
      int v22 = 43;
    }
    else {
      int v22 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v37 = v22;
    __int16 v38 = 2082;
    v39 = object_getClassName(a1);
    __int16 v40 = 2082;
    v41 = sel_getName(a2);
    __int16 v42 = 1024;
    int v43 = 88;
    v23 = "%c[%{public}s %{public}s]:%i Unexpected ECP command; initialized to non ECP";
LABEL_29:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v23, buf, 0x22u);
LABEL_30:

LABEL_31:
    v11 = NFFieldNotification;
    goto LABEL_32;
  }
  objc_super v9 = v8;
  int v10 = v8[1];
  if (v10 != 2)
  {
    if (v10 == 1)
    {
      v11 = NFFieldNotificationECP1_0;
      goto LABEL_32;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v24 = NFLogGetLogger();
    if (v24)
    {
      v25 = (void (*)(uint64_t, const char *, ...))v24;
      v26 = object_getClass(a1);
      BOOL v27 = class_isMetaClass(v26);
      v28 = object_getClassName(a1);
      v35 = sel_getName(a2);
      uint64_t v29 = 45;
      if (v27) {
        uint64_t v29 = 43;
      }
      v25(4, "%c[%{public}s %{public}s]:%i Unexpected ECP version; initialized to non ECP", v29, v28, v35, 85);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    v30 = object_getClass(a1);
    if (class_isMetaClass(v30)) {
      int v31 = 43;
    }
    else {
      int v31 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v37 = v31;
    __int16 v38 = 2082;
    v39 = object_getClassName(a1);
    __int16 v40 = 2082;
    v41 = sel_getName(a2);
    __int16 v42 = 1024;
    int v43 = 85;
    v23 = "%c[%{public}s %{public}s]:%i Unexpected ECP version; initialized to non ECP";
    goto LABEL_29;
  }
  if ([v7 length] == (id)8 && *v9 == 0x820202C3026ALL)
  {
    v32 = [[NFFieldNotificationECP1_0 alloc] initWithDictionaryForDavenport:v5];
    goto LABEL_33;
  }
  v11 = NFFieldNotificationECP2_0;
LABEL_32:
  v32 = (NFFieldNotificationECP1_0 *)[[v11 alloc] initWithDictionary:v5];
LABEL_33:
  v13 = v32;

LABEL_34:

  return (NFFieldNotification *)v13;
}

+ (id)fieldNotificationFromXPCObject:(id)a3
{
  id v5 = a3;
  if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_data)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Unexpected parameter: %@", v10, ClassName, Name, 98, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    v12 = object_getClass(a1);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v47 = v13;
    __int16 v48 = 2082;
    v49 = object_getClassName(a1);
    __int16 v50 = 2082;
    v51 = sel_getName(a2);
    __int16 v52 = 1024;
    int v53 = 98;
    __int16 v54 = 2112;
    id v55 = v5;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected parameter: %@", buf, 0x2Cu);
LABEL_12:
    id v14 = 0;
    goto LABEL_36;
  }
  uint64_t v15 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v15)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v32 = NFLogGetLogger();
    if (v32)
    {
      v33 = (void (*)(uint64_t, const char *, ...))v32;
      v34 = object_getClass(a1);
      BOOL v35 = class_isMetaClass(v34);
      v41 = object_getClassName(a1);
      v44 = sel_getName(a2);
      uint64_t v36 = 45;
      if (v35) {
        uint64_t v36 = 43;
      }
      v33(3, "%c[%{public}s %{public}s]:%i Unexpected parameter: %@", v36, v41, v44, 104, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v37 = object_getClass(a1);
    if (class_isMetaClass(v37)) {
      int v38 = 43;
    }
    else {
      int v38 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v47 = v38;
    __int16 v48 = 2082;
    v49 = object_getClassName(a1);
    __int16 v50 = 2082;
    v51 = sel_getName(a2);
    __int16 v52 = 1024;
    int v53 = 104;
    __int16 v54 = 2112;
    id v55 = v5;
    goto LABEL_11;
  }
  v11 = v15;
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  id v45 = 0;
  uint64_t v19 = +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClasses:v18 fromData:v11 error:&v45];
  id v20 = v45;
  if (v20)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v21 = NFLogGetLogger();
    if (v21)
    {
      int v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(a1);
      BOOL v24 = class_isMetaClass(v23);
      v25 = object_getClassName(a1);
      int v43 = sel_getName(a2);
      uint64_t v26 = 45;
      if (v24) {
        uint64_t v26 = 43;
      }
      v22(3, "%c[%{public}s %{public}s]:%i Fail to decode: %@", v26, v25, v43, 119, v20);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(a1);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      v30 = object_getClassName(a1);
      int v31 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v47 = v29;
      __int16 v48 = 2082;
      v49 = v30;
      __int16 v50 = 2082;
      v51 = v31;
      __int16 v52 = 1024;
      int v53 = 119;
      __int16 v54 = 2112;
      id v55 = v20;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Fail to decode: %@", buf, 0x2Cu);
    }

    id v14 = 0;
  }
  else
  {
    id v14 = v19;
  }

LABEL_36:

  return v14;
}

- (NFFieldNotification)initWithNotificationType:(unint64_t)a3 rfTechnology:(unsigned int)a4 typeFSystemCode:(unsigned __int16)a5 creationDate:(id)a6 cachedBeforeRFReset:(BOOL)a7
{
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NFFieldNotification;
  id v14 = [(NFFieldNotification *)&v18 init];
  uint64_t v15 = v14;
  if (v14)
  {
    v14->_notificationType = a3;
    v14->_uint64_t rfTechnology = a4;
    v14->_typeFSystemCode = a5;
    objc_storeStrong((id *)&v14->_creationDate, a6);
    v15->_cachedBeforeRFReset = a7;
    uint64_t v16 = v15;
  }

  return v15;
}

- (NFFieldNotification)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFFieldNotification;
  id v5 = [(NFFieldNotification *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"FieldTechnology"];
    v5->_uint64_t rfTechnology = [v6 integerValue];

    id v7 = [v4 objectForKey:@"SystemCode"];
    v5->_typeFSystemCode = (unsigned __int16)[v7 integerValue];

    v5->_notificationType = 1;
    uint64_t v8 = +[NSDate now];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;
  }
  return v5;
}

- (void)setNotificationType:(unint64_t)a3
{
  self->_notificationType = a3;
}

- (id)description
{
  v3 = objc_opt_new();
  id v4 = v3;
  unsigned int rfTechnology = self->_rfTechnology;
  if (rfTechnology)
  {
    [v3 appendString:@"A,"];
    unsigned int rfTechnology = self->_rfTechnology;
    if ((rfTechnology & 2) == 0)
    {
LABEL_3:
      if ((rfTechnology & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((rfTechnology & 2) == 0)
  {
    goto LABEL_3;
  }
  [v4 appendString:@"B,"];
  unsigned int rfTechnology = self->_rfTechnology;
  if ((rfTechnology & 4) == 0)
  {
LABEL_4:
    if ((rfTechnology & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v4 appendString:@"F,"];
  unsigned int rfTechnology = self->_rfTechnology;
  if ((rfTechnology & 0x10) == 0)
  {
LABEL_5:
    if ((rfTechnology & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  [v4 appendString:@"V,"];
  if ((self->_rfTechnology & 8) != 0) {
LABEL_6:
  }
    [v4 appendString:@"ECP,"];
LABEL_7:
  if (![v4 length]) {
    [v4 appendString:@"None"];
  }
  id v6 = objc_alloc((Class)NSString);
  ClassName = object_getClassName(self);
  uint64_t v8 = bswap32(self->_typeFSystemCode) >> 16;
  objc_super v9 = [(NFFieldNotification *)self _creationDateString];
  id v10 = [v6 initWithFormat:@"<%s: tech=%@ sc=0x%X date=%@ cached=%d>", ClassName, v4, v8, v9, self->_cachedBeforeRFReset];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NFFieldNotification *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unsigned int v6 = [(NFFieldNotification *)v5 rfTechnology];
      if (v6 == [(NFFieldNotification *)self rfTechnology]
        && (unsigned int v7 = [(NFFieldNotification *)v5 typeFSystemCode],
            v7 == [(NFFieldNotification *)self typeFSystemCode]))
      {
        id v8 = [(NFFieldNotification *)v5 notificationType];
        BOOL v9 = v8 == (id)[(NFFieldNotification *)self notificationType];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)isEqualWithoutRFTech:(id)a3
{
  id v4 = (NFFieldNotification *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(NFFieldNotification *)v4 notificationType];
      BOOL v6 = v5 == (id)[(NFFieldNotification *)self notificationType];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isEqualTerminalInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(NFFieldNotification *)self notificationType];
  if (v5 != [v4 notificationType]) {
    goto LABEL_8;
  }
  if ((id)[(NFFieldNotification *)self notificationType] != (id)2)
  {
    if ((id)[(NFFieldNotification *)self notificationType] == (id)3)
    {
      id v8 = [(NFFieldNotification *)self terminalType];
      if (v8 == [v4 terminalType])
      {
        unsigned int v6 = [(NFFieldNotification *)self terminalSubType];
        unsigned int v7 = [v4 terminalSubType];
        goto LABEL_7;
      }
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  unsigned int v6 = [(NFFieldNotification *)self terminalType];
  unsigned int v7 = [v4 terminalType];
LABEL_7:
  BOOL v9 = v6 == v7;
LABEL_9:

  return v9;
}

- (id)asXPCObject
{
  id v20 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v20];
  id v5 = v20;
  if (v5)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unsigned int v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Failed to encode: %@", v10, ClassName, Name, 233, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    objc_super v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      id v14 = object_getClassName(self);
      uint64_t v15 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v22 = v13;
      __int16 v23 = 2082;
      BOOL v24 = v14;
      __int16 v25 = 2082;
      uint64_t v26 = v15;
      __int16 v27 = 1024;
      int v28 = 233;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to encode: %@", buf, 0x2Cu);
    }

    id v16 = 0;
  }
  else
  {
    id v16 = v4;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NFFieldNotification alloc];
  uint64_t rfTechnology = self->_rfTechnology;
  uint64_t typeFSystemCode = self->_typeFSystemCode;
  unint64_t notificationType = self->_notificationType;
  creationDate = self->_creationDate;
  BOOL cachedBeforeRFReset = self->_cachedBeforeRFReset;

  return [(NFFieldNotification *)v4 initWithNotificationType:notificationType rfTechnology:rfTechnology typeFSystemCode:typeFSystemCode creationDate:creationDate cachedBeforeRFReset:cachedBeforeRFReset];
}

- (id)_creationDateString
{
  v3 = objc_opt_new();
  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSS"];
  id v4 = [v3 stringFromDate:self->_creationDate];

  return v4;
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (unsigned)rfTechnology
{
  return self->_rfTechnology;
}

- (unsigned)typeFSystemCode
{
  return self->_typeFSystemCode;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (BOOL)cachedBeforeRFReset
{
  return self->_cachedBeforeRFReset;
}

- (void)setCachedBeforeRFReset:(BOOL)a3
{
  self->_BOOL cachedBeforeRFReset = a3;
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (BOOL)isCHTerminal
{
  if ((id)[(NFFieldNotification *)self notificationType] != (id)3) {
    return 0;
  }
  v3 = self;
  BOOL v4 = [(NFFieldNotification *)v3 terminalType] == (id)5
    && [(NFFieldNotification *)v3 terminalSubType] == 0;

  return v4;
}

- (BOOL)isCHInitiatorDetected
{
  return (id)[(NFFieldNotification *)self chFieldType] == (id)2;
}

- (BOOL)isCHReceiverDetected
{
  return (id)[(NFFieldNotification *)self chFieldType] == (id)3;
}

- (BOOL)isCHAutoNegotiationField
{
  if ([(NFFieldNotification *)self isCHTerminal])
  {
    v3 = self;
    BOOL v4 = [(NFFieldNotification *)v3 userInfo];

    if (v4)
    {
      id v5 = [(NFFieldNotification *)v3 userInfo];
      unsigned int v6 = [v5 objectForKeyedSubscript:@"CHCfgBytes"];

      BOOL v4 = (void *)((unint64_t)[v6 unsignedShortValue] & 1);
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (unint64_t)chFieldType
{
  if ([(NFFieldNotification *)self isCHTerminal])
  {
    BOOL v4 = self;
    id v5 = [(NFFieldNotification *)v4 userInfo];

    if (!v5)
    {
      unint64_t v22 = 4;
LABEL_33:

      return v22;
    }
    unsigned int v6 = [(NFFieldNotification *)v4 userInfo];
    unsigned int v7 = [v6 objectForKeyedSubscript:@"CHCfgBytes"];

    if ([v7 unsignedShortValue])
    {
      if ([v7 unsignedShortValue])
      {
        __int16 v23 = [(NFFieldNotification *)v4 userInfo];
        BOOL v24 = [v23 objectForKey:@"CHRemoteRandom"];

        if (!v24)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            int v28 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(v4);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(v4);
            Name = sel_getName(a2);
            uint64_t v32 = 45;
            if (isMetaClass) {
              uint64_t v32 = 43;
            }
            v28(4, "%c[%{public}s %{public}s]:%i Unexpected state; missing randome value",
              v32,
              ClassName,
              Name,
              1015);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v16 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v33 = object_getClass(v4);
            if (class_isMetaClass(v33)) {
              int v34 = 43;
            }
            else {
              int v34 = 45;
            }
            *(_DWORD *)buf = 67109890;
            int v40 = v34;
            __int16 v41 = 2082;
            __int16 v42 = object_getClassName(v4);
            __int16 v43 = 2082;
            v44 = sel_getName(a2);
            __int16 v45 = 1024;
            int v46 = 1015;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; missing randome value",
              buf,
              0x22u);
          }
          goto LABEL_31;
        }
        __int16 v25 = [(NFFieldNotification *)v4 userInfo];
        uint64_t v26 = [v25 objectForKey:@"CHInitiatorDetected"];

        if (v26)
        {
          unint64_t v22 = 2;
          goto LABEL_32;
        }
        uint64_t v36 = [(NFFieldNotification *)v4 userInfo];
        int v37 = [v36 objectForKey:@"CHReceiverDetected"];

        if (v37)
        {
          unint64_t v22 = 3;
          goto LABEL_32;
        }
      }
      if (([v7 unsignedShortValue] & 2) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v8 = NFLogGetLogger();
        if (v8)
        {
          BOOL v9 = (void (*)(uint64_t, const char *, ...))v8;
          uint64_t v10 = object_getClass(v4);
          BOOL v11 = class_isMetaClass(v10);
          v12 = object_getClassName(v4);
          int v13 = sel_getName(a2);
          id v14 = [(NFFieldNotification *)v4 debugDescription];
          uint64_t v15 = 45;
          if (v11) {
            uint64_t v15 = 43;
          }
          v9(4, "%c[%{public}s %{public}s]:%i Unexpected state; %{public}@", v15, v12, v13, 1032, v14);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v16 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = object_getClass(v4);
          if (class_isMetaClass(v17)) {
            int v18 = 43;
          }
          else {
            int v18 = 45;
          }
          uint64_t v19 = object_getClassName(v4);
          id v20 = sel_getName(a2);
          uint64_t v21 = [(NFFieldNotification *)v4 debugDescription];
          *(_DWORD *)buf = 67110146;
          int v40 = v18;
          __int16 v41 = 2082;
          __int16 v42 = v19;
          __int16 v43 = 2082;
          v44 = v20;
          __int16 v45 = 1024;
          int v46 = 1032;
          __int16 v47 = 2114;
          __int16 v48 = v21;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; %{public}@",
            buf,
            0x2Cu);
        }
LABEL_31:

        unint64_t v22 = 1;
        goto LABEL_32;
      }
      unint64_t v22 = 5;
    }
    else
    {
      unint64_t v22 = 4;
    }
LABEL_32:

    goto LABEL_33;
  }
  return 1;
}

- (id)chRandomData
{
  if ([(NFFieldNotification *)self isCHTerminal])
  {
    v3 = self;
    BOOL v4 = [(NFFieldNotification *)v3 userInfo];

    if (v4)
    {
      id v5 = [(NFFieldNotification *)v3 userInfo];
      BOOL v4 = [v5 objectForKeyedSubscript:@"CHRemoteRandom"];
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end