@interface NTKDComplicationCollectionClient
- (NTKDComplicationCollectionClient)initWithConnection:(id)a3;
- (id)invalidationHandler;
- (void)_handleInvalidation;
- (void)_onQueue:(id)a3;
- (void)_performOrEnqueueAction:(id)a3;
- (void)complicationStore:(id)a3 didRemoveComplicationSampleTemplatesForClientIdentifier:(id)a4 descriptor:(id)a5 seqId:(id)a6;
- (void)complicationStore:(id)a3 didUpdateComplicationDescriptors:(id)a4 forClientIdentifier:(id)a5 seqId:(id)a6;
- (void)complicationStore:(id)a3 didUpdateSampleTemplateReference:(id)a4 forClientIdentifier:(id)a5 descriptor:(id)a6 family:(int64_t)a7 seqId:(id)a8;
- (void)complicationStore:(id)a3 loadFullCollectionWithLocalizableSampleTemplates:(id)a4 complicationDescriptors:(id)a5 seqId:(id)a6;
- (void)registerForCollectionIdentifier:(id)a3 deviceUUID:(id)a4 withSeqId:(id)a5;
- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4;
- (void)setInvalidationHandler:(id)a3;
- (void)updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4;
- (void)updateLocalizableSampleDataTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6;
@end

@implementation NTKDComplicationCollectionClient

- (NTKDComplicationCollectionClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NTKDComplicationCollectionClient;
  v6 = [(NTKDComplicationCollectionClient *)&v23 init];
  if (v6)
  {
    id v7 = +[NSString stringWithFormat:@"com.apple.ntkd.complicationcollectionclient.%p", v6];
    v8 = (const char *)[v7 UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v6->_connection, a3);
    connection = v6->_connection;
    v13 = NTKComplicationStoreClientInterface();
    [(NSXPCConnection *)connection setRemoteObjectInterface:v13];

    v14 = v6->_connection;
    v15 = NTKComplicationStoreServerInterface();
    [(NSXPCConnection *)v14 setExportedInterface:v15];

    [(NSXPCConnection *)v6->_connection setExportedObject:v6];
    objc_initWeak(&location, v6);
    v16 = v6->_connection;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000356A0;
    v20[3] = &unk_100060A68;
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)v16 setInvalidationHandler:v20];
    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    actionsEnqueuedWhileWaitingForStore = v6->_actionsEnqueuedWhileWaitingForStore;
    v6->_actionsEnqueuedWhileWaitingForStore = v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)_handleInvalidation
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035754;
  block[3] = &unk_100060A90;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_performOrEnqueueAction:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.complicationcollectionclient.busy");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100035928;
  v11[3] = &unk_100060B30;
  id v12 = v4;
  id v5 = v4;
  v6 = objc_retainBlock(v11);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035964;
  block[3] = &unk_100060AE0;
  block[4] = self;
  id v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);
}

- (void)_onQueue:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.complicationcollectionclient.busy");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035A98;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)registerForCollectionIdentifier:(id)a3 deviceUUID:(id)a4 withSeqId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sub_10000B610(@"com.apple.ntkd.complicaitoncollectionclient.register");
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100035BD0;
  v15[3] = &unk_1000610F0;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)updateLocalizableSampleDataTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100035F68;
  v12[3] = &unk_100061F68;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  int64_t v17 = a6;
  id v9 = v16;
  id v10 = v15;
  id v11 = v14;
  [(NTKDComplicationCollectionClient *)v13 _performOrEnqueueAction:v12];
}

- (void)updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036040;
  v7[3] = &unk_100060C58;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NTKDComplicationCollectionClient *)v8 _performOrEnqueueAction:v7];
}

- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036114;
  v7[3] = &unk_100060C58;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NTKDComplicationCollectionClient *)v8 _performOrEnqueueAction:v7];
}

- (void)complicationStore:(id)a3 loadFullCollectionWithLocalizableSampleTemplates:(id)a4 complicationDescriptors:(id)a5 seqId:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100036208;
  v11[3] = &unk_1000610F0;
  id v12 = self;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v8 = v15;
  id v9 = v14;
  id v10 = v13;
  [(NTKDComplicationCollectionClient *)v12 _onQueue:v11];
}

- (void)complicationStore:(id)a3 didUpdateSampleTemplateReference:(id)a4 forClientIdentifier:(id)a5 descriptor:(id)a6 family:(int64_t)a7 seqId:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (!v16)
  {
    v18 = NSStringFromSelector(a2);
    +[NSException raise:NSInvalidArgumentException, @"%@: descriptor must be non-nil!", v18 format];
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000363D0;
  v23[3] = &unk_100061C48;
  v23[4] = self;
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  id v27 = v17;
  int64_t v28 = a7;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  [(NTKDComplicationCollectionClient *)self _onQueue:v23];
}

- (void)complicationStore:(id)a3 didUpdateComplicationDescriptors:(id)a4 forClientIdentifier:(id)a5 seqId:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100036510;
  v11[3] = &unk_1000610F0;
  id v12 = self;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v8 = v15;
  id v9 = v14;
  id v10 = v13;
  [(NTKDComplicationCollectionClient *)v12 _onQueue:v11];
}

- (void)complicationStore:(id)a3 didRemoveComplicationSampleTemplatesForClientIdentifier:(id)a4 descriptor:(id)a5 seqId:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003664C;
  v11[3] = &unk_1000610F0;
  id v12 = self;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v8 = v15;
  id v9 = v14;
  id v10 = v13;
  [(NTKDComplicationCollectionClient *)v12 _onQueue:v11];
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_actionsEnqueuedWhileWaitingForStore, 0);
  objc_storeStrong((id *)&self->_complicationStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end