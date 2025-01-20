@interface MRNotification
- (MRNotification)initWithNotification:(id)a3 userInfo:(id)a4;
- (NSDictionary)userInfo;
- (NSString)notification;
- (OS_xpc_object)xpcMessage;
- (void)setXpcMessage:(id)a3;
- (xpc_object_t)_createNotificationMessage:(void *)a3 userInfo:;
@end

@implementation MRNotification

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (OS_xpc_object)xpcMessage
{
  return self->_xpcMessage;
}

- (NSString)notification
{
  return self->_notification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcMessage, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

- (MRNotification)initWithNotification:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRNotification;
  v9 = [(MRNotification *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notification, a3);
    objc_storeStrong((id *)&v10->_userInfo, a4);
    v11 = (OS_xpc_object *)-[MRNotification _createNotificationMessage:userInfo:]((uint64_t)v10, v7, v8);
    xpcMessage = v10->_xpcMessage;
    v10->_xpcMessage = v11;
  }
  return v10;
}

- (xpc_object_t)_createNotificationMessage:(void *)a3 userInfo:
{
  if (!a1) {
    return 0;
  }
  id v4 = a3;
  id v5 = a2;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "MRXPC_MESSAGE_ID_KEY", 0x700000000000001uLL);
  id v7 = v5;
  id v8 = (const char *)[v7 UTF8String];

  xpc_dictionary_set_string(v6, "MRXPC_NOTIFICATION_NAME_KEY", v8);
  v9 = MRCreateEncodedUserInfo(v4);

  MRAddPropertyListToXPCMessage(v6, (uint64_t)v9, "MRXPC_NOTIFICATION_USERINFO_DATA_KEY");
  return v6;
}

- (void)setXpcMessage:(id)a3
{
}

@end