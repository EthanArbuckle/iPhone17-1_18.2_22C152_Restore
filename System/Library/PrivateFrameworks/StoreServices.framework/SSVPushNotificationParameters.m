@interface SSVPushNotificationParameters
- (NSArray)mediaKinds;
- (NSDictionary)putParameters;
- (NSNumber)accountIdentifier;
- (NSString)environmentName;
- (NSString)notificationType;
- (SSVPushNotificationParameters)init;
- (SSVPushNotificationParameters)initWithXPCEncoding:(id)a3;
- (id)_copyParametersDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)valueForParameter:(id)a3;
- (int64_t)requestType;
- (void)setAccountIdentifier:(id)a3;
- (void)setEnvironmentName:(id)a3;
- (void)setMediaKinds:(id)a3;
- (void)setNotificationType:(id)a3;
- (void)setPutParameters:(id)a3;
- (void)setRequestType:(int64_t)a3;
- (void)setValue:(id)a3 forParameter:(id)a4;
@end

@implementation SSVPushNotificationParameters

- (SSVPushNotificationParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSVPushNotificationParameters;
  v2 = [(SSVPushNotificationParameters *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    parameterDictionary = v2->_parameterDictionary;
    v2->_parameterDictionary = v3;
  }
  return v2;
}

- (NSArray)mediaKinds
{
  v2 = [(NSMutableDictionary *)self->_parameterDictionary objectForKey:@"parameters"];
  v3 = [v2 objectForKey:@"media-kinds"];

  return (NSArray *)v3;
}

- (NSString)notificationType
{
  return (NSString *)[(NSMutableDictionary *)self->_parameterDictionary objectForKey:@"notification-type"];
}

- (NSDictionary)putParameters
{
  return (NSDictionary *)[(NSMutableDictionary *)self->_parameterDictionary objectForKey:@"put-parameters"];
}

- (void)setMediaKinds:(id)a3
{
  id v7 = a3;
  v4 = [(NSMutableDictionary *)self->_parameterDictionary objectForKey:@"parameters"];
  id v5 = v7;
  id v6 = v4;
  if (v7)
  {
    if (!v4)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)self->_parameterDictionary setObject:v6 forKey:@"parameters"];
      id v5 = v7;
    }
    [v6 setObject:v5 forKey:@"media-kinds"];
  }
  else
  {
    [v4 removeObjectForKey:@"media-kinds"];
  }
}

- (void)setNotificationType:(id)a3
{
}

- (void)setPutParameters:(id)a3
{
}

- (void)setValue:(id)a3 forParameter:(id)a4
{
  parameterDictionary = self->_parameterDictionary;
  if (a3) {
    [(NSMutableDictionary *)parameterDictionary setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)parameterDictionary removeObjectForKey:a4];
  }
}

- (id)valueForParameter:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_parameterDictionary objectForKey:a3];
}

- (id)_copyParametersDictionary
{
  return (id)[(NSMutableDictionary *)self->_parameterDictionary mutableCopy];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5 setAccountIdentifier:self->_accountIdentifier];
  [v5 setEnvironmentName:self->_environmentName];
  uint64_t v6 = [(NSMutableDictionary *)self->_parameterDictionary mutableCopyWithZone:a3];
  id v7 = (void *)v5[3];
  v5[3] = v6;

  [v5 setRequestType:self->_requestType];
  return v5;
}

- (SSVPushNotificationParameters)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v15.receiver = self;
    v15.super_class = (Class)SSVPushNotificationParameters;
    uint64_t v6 = [(SSVPushNotificationParameters *)&v15 init];
    if (v6)
    {
      objc_opt_class();
      CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = (NSNumber *)v8;

      objc_opt_class();
      CFArrayRef v10 = SSXPCDictionaryCopyCFObjectWithClass(v5, "1");
      environmentName = v6->_environmentName;
      v6->_environmentName = (NSString *)v10;

      v6->_requestType = xpc_dictionary_get_int64(v5, "3");
      objc_opt_class();
      CFArrayRef v12 = SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
      uint64_t v13 = [(__CFArray *)v12 copy];
      parameterDictionary = v6->_parameterDictionary;
      v6->_parameterDictionary = (NSMutableDictionary *)v13;
    }
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_accountIdentifier);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_environmentName);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_parameterDictionary);
  xpc_dictionary_set_int64(v3, "3", self->_requestType);
  return v3;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (void)setEnvironmentName:(id)a3
{
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterDictionary, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end