@interface SSRemoteNotification
- (BOOL)explicitContent;
- (NSArray)buttons;
- (NSDate)expirationDate;
- (NSDictionary)metrics;
- (NSDictionary)notificationUserInfo;
- (NSString)alertBodyString;
- (NSString)alertCancelString;
- (NSString)alertOKString;
- (NSString)alertTitleString;
- (NSString)artworkUrl;
- (NSString)category;
- (NSString)soundFileName;
- (NSString)tapUrl;
- (SSRemoteNotification)initWithNotificationUserInfo:(id)a3;
- (SSRemoteNotification)initWithXPCEncoding:(id)a3;
- (id)_valueForAPSKey:(id)a3;
- (id)_valueForAlertKey:(id)a3;
- (id)badgeValue;
- (id)copyXPCEncoding;
- (id)valueForKey:(id)a3;
- (int64_t)actionType;
- (int64_t)version;
- (void)dealloc;
@end

@implementation SSRemoteNotification

- (SSRemoteNotification)initWithNotificationUserInfo:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SSRemoteNotification;
  v4 = [(SSRemoteNotification *)&v15 init];
  if (v4)
  {
    v4->_userInfo = (NSDictionary *)[a3 copy];
    v5 = (void *)[a3 objectForKey:@"10"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v5 isEqualToString:@"application/gzip"])
      {
        uint64_t v6 = [a3 objectForKey:@"aps"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
          v8 = (void *)v7;
          if (v7)
          {
            v9 = (void *)softLinkISCopyDecompressedGZipDataForData(v7);
            uint64_t v14 = 0;
            if (v9)
            {
              uint64_t v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:&v14];
              if (v14)
              {
LABEL_13:

                return v4;
              }
              uint64_t v11 = v10;
            }
            else
            {
              uint64_t v11 = 0;
            }
          }
          else
          {
            uint64_t v11 = 0;
            v9 = 0;
            uint64_t v14 = 0;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = (NSDictionary *)[(NSDictionary *)v4->_userInfo mutableCopy];
            [(NSDictionary *)v12 setObject:v11 forKeyedSubscript:@"aps"];
            v4->_userInfo = v12;
          }
          goto LABEL_13;
        }
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSRemoteNotification;
  [(SSRemoteNotification *)&v3 dealloc];
}

- (int64_t)actionType
{
  id v3 = [(SSRemoteNotification *)self valueForKey:@"1"];
  if (objc_opt_respondsToSelector()) {
    return (int)[v3 intValue];
  }
  else {
    return [(SSRemoteNotification *)self valueForKey:@"3"] != 0;
  }
}

- (NSString)alertBodyString
{
  id v2 = [(NSDictionary *)self->_userInfo objectForKey:@"aps"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (void *)[v2 objectForKey:@"alert"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_6:
        id v3 = (void *)[v2 objectForKey:@"text"];
        goto LABEL_8;
      }
      id v3 = (void *)[v3 objectForKey:@"body"];
    }
    if (v3) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  id v3 = 0;
LABEL_8:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return (NSString *)v3;
  }
  else {
    return 0;
  }
}

- (NSString)alertCancelString
{
  id v2 = [(SSRemoteNotification *)self _valueForAlertKey:@"cancel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSString)alertOKString
{
  id v2 = [(SSRemoteNotification *)self _valueForAlertKey:@"ok"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSString)alertTitleString
{
  id v3 = [(SSRemoteNotification *)self _valueForAlertKey:@"title"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    id v3 = [(SSRemoteNotification *)self _valueForAPSKey:@"title"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)explicitContent
{
  id v2 = [(SSRemoteNotification *)self _valueForAPSKey:@"isExplicit"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (NSString)artworkUrl
{
  id v2 = [(SSRemoteNotification *)self _valueForAPSKey:@"artworkUrl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)badgeValue
{
  id v2 = [(NSDictionary *)self->_userInfo objectForKey:@"aps"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return (id)[v2 objectForKey:@"badge"];
}

- (NSArray)buttons
{
  id v2 = [(SSRemoteNotification *)self _valueForAPSKey:@"buttons"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSString)category
{
  id v2 = [(SSRemoteNotification *)self _valueForAPSKey:@"category"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSDate)expirationDate
{
  id v2 = [(SSRemoteNotification *)self _valueForAPSKey:@"schedule"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (void *)[v2 objectForKey:@"notAfter"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  double v5 = (double)[v3 integerValue];
  return (NSDate *)[v4 dateWithTimeIntervalSince1970:v5];
}

- (NSDictionary)metrics
{
  id v2 = [(SSRemoteNotification *)self _valueForAPSKey:@"metrics"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSString)soundFileName
{
  id v2 = [(NSDictionary *)self->_userInfo objectForKey:@"aps"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (NSString *)[v2 objectForKey:@"sound"];
  }
  else {
    id v3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (NSString)tapUrl
{
  id v3 = [(NSDictionary *)self->_userInfo objectForKey:@"3"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    id v3 = [(SSRemoteNotification *)self _valueForAPSKey:@"tapUrl"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (int64_t)version
{
  id v2 = [(NSDictionary *)self->_userInfo objectForKey:@"aps"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (void *)[v2 objectForKey:@"version"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v3 integerValue];
}

- (id)valueForKey:(id)a3
{
  return [(NSDictionary *)self->_userInfo objectForKey:a3];
}

- (NSDictionary)notificationUserInfo
{
  id v2 = self->_userInfo;
  return v2;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_userInfo);
  return v3;
}

- (SSRemoteNotification)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSRemoteNotification;
    double v5 = [(SSRemoteNotification *)&v7 init];
    if (v5)
    {
      objc_opt_class();
      v5->_userInfo = (NSDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)_valueForAlertKey:(id)a3
{
  id v4 = [(NSDictionary *)self->_userInfo objectForKey:@"aps"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  double v5 = (void *)[v4 objectForKey:@"alert"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return (id)[v5 objectForKey:a3];
}

- (id)_valueForAPSKey:(id)a3
{
  id v4 = [(NSDictionary *)self->_userInfo objectForKey:@"aps"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return (id)[v4 objectForKey:a3];
}

@end