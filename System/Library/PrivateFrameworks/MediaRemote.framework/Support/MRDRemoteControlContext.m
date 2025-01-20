@interface MRDRemoteControlContext
- (MRDRemoteControlContext)initWithContextID:(id)a3 originatingAppDisplayID:(id)a4;
- (NSArray)routedCommands;
- (NSString)contextID;
- (NSString)originatingAppDisplayID;
- (void)addRoutedCommand:(id)a3;
- (void)clearRoutedCommands;
@end

@implementation MRDRemoteControlContext

- (MRDRemoteControlContext)initWithContextID:(id)a3 originatingAppDisplayID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MRDRemoteControlContext;
  v8 = [(MRDRemoteControlContext *)&v19 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    contextID = v8->_contextID;
    v8->_contextID = v9;

    v11 = (NSString *)[v7 copy];
    originatingAppDisplayID = v8->_originatingAppDisplayID;
    v8->_originatingAppDisplayID = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    routedCommands = v8->_routedCommands;
    v8->_routedCommands = v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.mediaremote.remotecontrol.routedcommands", v15);
    commandQueue = v8->_commandQueue;
    v8->_commandQueue = (OS_dispatch_queue *)v16;
  }
  return v8;
}

- (NSArray)routedCommands
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1000372B0;
  v10 = sub_1000372C0;
  id v11 = 0;
  commandQueue = self->_commandQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000372C8;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)commandQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)addRoutedCommand:(id)a3
{
  id v4 = a3;
  commandQueue = self->_commandQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000373AC;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)commandQueue, v7);
}

- (void)clearRoutedCommands
{
  commandQueue = self->_commandQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000375A0;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)commandQueue, block);
}

- (NSString)contextID
{
  return self->_contextID;
}

- (NSString)originatingAppDisplayID
{
  return self->_originatingAppDisplayID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingAppDisplayID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_routedCommands, 0);
}

@end