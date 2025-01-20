@interface FudEvent
- (AUDAccessory)accessory;
- (BOOL)isConnectionEvent;
- (BOOL)isInternalEvent;
- (BOOL)sendResponse;
- (BOOL)synthesizedEvent;
- (FudEvent)initWithEventType:(int)a3 filter:(id)a4 client:(id)a5 data:(id)a6;
- (NSDictionary)clientOptions;
- (NSString)clientName;
- (NSString)filterName;
- (OS_xpc_object)data;
- (id)description;
- (int)type;
- (void)dealloc;
- (void)setAccessory:(id)a3;
- (void)setClientName:(id)a3;
- (void)setClientOptions:(id)a3;
- (void)setFilterName:(id)a3;
- (void)setIsConnectionEvent:(BOOL)a3;
- (void)setSendResponse:(BOOL)a3;
- (void)setSynthesizedEvent:(BOOL)a3;
@end

@implementation FudEvent

- (FudEvent)initWithEventType:(int)a3 filter:(id)a4 client:(id)a5 data:(id)a6
{
  v20.receiver = self;
  v20.super_class = (Class)FudEvent;
  v10 = [(FudEvent *)&v20 init];
  v10->type = a3;
  *(_OWORD *)&v10->filterName = 0u;
  *(_OWORD *)&v10->clientOptions = 0u;
  *(_WORD *)&v10->isConnectionEvent = 0;
  v10->sendResponse = 1;
  if (a4) {
    v10->filterName = (NSString *)a4;
  }
  if (a6)
  {
    v10->data = (OS_xpc_object *)a6;
    xpc_retain(a6);
    v11 = +[NSMutableDictionary dictionaryWithCapacity:0];
    uint64_t uint64 = xpc_dictionary_get_uint64(a6, "IOMatchLaunchServiceID");
    if (uint64) {
      [(NSMutableDictionary *)v11 setObject:+[NSNumber numberWithUnsignedLongLong:uint64] forKey:@"IOMatchLaunchServiceID"];
    }
    uint64_t v13 = objectFromXpcDictionary();
    if (v13)
    {
      uint64_t v14 = v13;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(NSMutableDictionary *)v11 addEntriesFromDictionary:v14];
      }
    }
    xpc_object_t value = xpc_dictionary_get_value(a6, "EAMatchingSerialNumber");
    if (value)
    {
      v16 = value;
      if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_string) {
        [(NSMutableDictionary *)v11 setObject:+[NSString stringWithUTF8String:xpc_string_get_string_ptr(v16)] forKey:@"SerialNumber"];
      }
    }
    if (xpc_dictionary_get_BOOL(a6, "DeviceIdleLaunch")) {
      [(NSMutableDictionary *)v11 setObject:&__kCFBooleanTrue forKey:@"DeviceIdleLaunch"];
    }
    if (xpc_dictionary_get_BOOL(a6, "MayRebootLaunch")) {
      [(NSMutableDictionary *)v11 setObject:&__kCFBooleanTrue forKey:@"MayRebootLaunch"];
    }
    if (xpc_dictionary_get_BOOL(a6, "UseDropboxLocation")) {
      [(NSMutableDictionary *)v11 setObject:&__kCFBooleanTrue forKey:@"UseDropboxLocation"];
    }
    clientOptions = v11;
    v10->clientOptions = &clientOptions->super;
  }
  else
  {
    clientOptions = (NSMutableDictionary *)v10->clientOptions;
  }
  v19 = clientOptions;
  FudLog();
  -[FudEvent setClientName:](v10, "setClientName:", a5, v19);
  return v10;
}

- (BOOL)isInternalEvent
{
  data = self->data;
  if (data) {
    LOBYTE(data) = xpc_dictionary_get_BOOL(data, "InternalClient");
  }
  return (char)data;
}

- (id)description
{
  data = self->data;
  if (data) {
    v4 = xpc_copy_description(data);
  }
  else {
    v4 = strdup("none");
  }
  v5 = v4;
  v6 = +[NSString stringWithFormat:@"FudEvent - Client:%@ Type:%d Filter:%@ Data:%s Options:%@", self->clientName, self->type, self->filterName, v4, self->clientOptions];
  if (v5) {
    free(v5);
  }
  return v6;
}

- (void)dealloc
{
  filterName = self->filterName;
  if (filterName) {

  }
  clientName = self->clientName;
  if (clientName) {

  }
  clientOptions = self->clientOptions;
  if (clientOptions) {

  }
  data = self->data;
  if (data) {
    xpc_release(data);
  }
  v7.receiver = self;
  v7.super_class = (Class)FudEvent;
  [(FudEvent *)&v7 dealloc];
}

- (int)type
{
  return self->type;
}

- (NSString)filterName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFilterName:(id)a3
{
}

- (OS_xpc_object)data
{
  return self->data;
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientName:(id)a3
{
}

- (NSDictionary)clientOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientOptions:(id)a3
{
}

- (BOOL)isConnectionEvent
{
  return self->isConnectionEvent;
}

- (void)setIsConnectionEvent:(BOOL)a3
{
  self->isConnectionEvent = a3;
}

- (BOOL)synthesizedEvent
{
  return self->synthesizedEvent;
}

- (void)setSynthesizedEvent:(BOOL)a3
{
  self->synthesizedEvent = a3;
}

- (BOOL)sendResponse
{
  return self->sendResponse;
}

- (void)setSendResponse:(BOOL)a3
{
  self->sendResponse = a3;
}

- (AUDAccessory)accessory
{
  return (AUDAccessory *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAccessory:(id)a3
{
}

@end