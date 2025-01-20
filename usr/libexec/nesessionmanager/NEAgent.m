@interface NEAgent
- (BOOL)isLocal;
- (BOOL)isPerUser;
- (NEAgent)initWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 userID:(id)a7;
- (id)description;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation NEAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginInfo, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_processIdentities, 0);
  objc_storeStrong((id *)&self->_pluginUUIDs, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_description, 0);
}

- (BOOL)isLocal
{
  return 0;
}

- (BOOL)isPerUser
{
  return 1;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (self) {
    Property = objc_getProperty(self, v4, 24, 1);
  }
  else {
    Property = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100084800;
  v8[3] = &unk_1000C6DB0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(Property, v8);
}

- (id)description
{
  return self->_description;
}

- (NEAgent)initWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 userID:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)NEAgent;
  v16 = [(NEAgent *)&v26 init];
  if (v16)
  {
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("NEAgent queue", v17);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v16->_uid, a7);
    objc_storeStrong((id *)&v16->_pluginType, a3);
    v16->_pluginClass = a5;
    v20 = (NSDictionary *)[v14 copy];
    pluginInfo = v16->_pluginInfo;
    v16->_pluginInfo = v20;

    uint64_t v22 = +[NSString stringWithFormat:@"%@[inactive]", v13];
    description = v16->_description;
    v16->_description = (NSString *)v22;

    v16->_pid = 0;
    v16->_pluginVersion = a4;
    v24 = v16;
  }

  return v16;
}

@end