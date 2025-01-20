@interface NTKDCollectionClient
+ (id)_sharedCollectionStoreQueue;
- (NTKDCollectionClient)initWithConnection:(id)a3;
- (id)invalidationHandler;
- (void)_handleInvalidation;
- (void)_onQueue:(id)a3;
- (void)_performOrEnqueueAction:(id)a3;
- (void)addFaceInstanceDescriptor:(id)a3 forUUID:(id)a4;
- (void)collectionStore:(id)a3 didAddFace:(id)a4 forUUID:(id)a5 seqId:(id)a6;
- (void)collectionStore:(id)a3 didRemoveFaceOfStyle:(int64_t)a4 forUUID:(id)a5 seqId:(id)a6 acknowledge:(id)a7;
- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withConfiguration:(id)a5 seqId:(id)a6;
- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withResourceDirectory:(id)a5 seqId:(id)a6 acknowledge:(id)a7;
- (void)collectionStore:(id)a3 didUpdateOrderedUUIDs:(id)a4 seqId:(id)a5;
- (void)collectionStore:(id)a3 didUpdateSelectedUUID:(id)a4 seqId:(id)a5;
- (void)collectionStore:(id)a3 didUpgradeFace:(id)a4 forUUID:(id)a5 seqId:(id)a6;
- (void)collectionStore:(id)a3 loadOrderedUUIDs:(id)a4 selectedUUID:(id)a5 facesByUUID:(id)a6 seqId:(id)a7 acknowledge:(id)a8;
- (void)flushUpdatesWithIdentifier:(id)a3;
- (void)registerForCollectionIdentifier:(id)a3 deviceUUID:(id)a4 withSeqId:(id)a5;
- (void)removeFaceForUUID:(id)a3;
- (void)resetCollection;
- (void)resetCollectionStore:(id)a3 acknowledge:(id)a4;
- (void)setInvalidationHandler:(id)a3;
- (void)setOrderedFaceUUIDs:(id)a3;
- (void)setSelectedFaceUUID:(id)a3 suppressingCallback:(BOOL)a4;
- (void)updateFaceForUUID:(id)a3 withConfigurationJSONRepresentation:(id)a4;
- (void)updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4;
- (void)upgradeFaceInstanceDescriptor:(id)a3 forUUID:(id)a4;
@end

@implementation NTKDCollectionClient

+ (id)_sharedCollectionStoreQueue
{
  if (qword_100072370 != -1) {
    dispatch_once(&qword_100072370, &stru_1000610A0);
  }
  v2 = (void *)qword_100072368;

  return v2;
}

- (NTKDCollectionClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKDCollectionClient;
  v6 = [(NTKDCollectionClient *)&v20 init];
  if (v6)
  {
    uint64_t v7 = +[NTKDCollectionClient _sharedCollectionStoreQueue];
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_connection, a3);
    connection = v6->_connection;
    v10 = NTKCollectionClientInterface();
    [(NSXPCConnection *)connection setRemoteObjectInterface:v10];

    v11 = v6->_connection;
    v12 = NTKCollectionServerInterface();
    [(NSXPCConnection *)v11 setExportedInterface:v12];

    [(NSXPCConnection *)v6->_connection setExportedObject:v6];
    objc_initWeak(&location, v6);
    v13 = v6->_connection;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000E140;
    v17[3] = &unk_100060A68;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v13 setInvalidationHandler:v17];
    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    actionsEnqueuedWhileWaitingForStore = v6->_actionsEnqueuedWhileWaitingForStore;
    v6->_actionsEnqueuedWhileWaitingForStore = v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)_handleInvalidation
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E1F4;
  block[3] = &unk_100060A90;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)registerForCollectionIdentifier:(id)a3 deviceUUID:(id)a4 withSeqId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sub_10000B610(@"com.apple.ntkd.collectionclient.register");
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E3B0;
  v15[3] = &unk_1000610F0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_performOrEnqueueAction:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.collectionclient.busy");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000E81C;
  v11[3] = &unk_100060B30;
  id v12 = v4;
  id v5 = v4;
  v6 = objc_retainBlock(v11);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E858;
  block[3] = &unk_100060AE0;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_onQueue:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.collectionclient.busy");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E98C;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)setSelectedFaceUUID:(id)a3 suppressingCallback:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EA64;
  v6[3] = &unk_100061118;
  uint64_t v7 = self;
  id v8 = a3;
  BOOL v9 = a4;
  id v5 = v8;
  [(NTKDCollectionClient *)v7 _performOrEnqueueAction:v6];
}

- (void)setOrderedFaceUUIDs:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  NTKValidateArray();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EC44;
  v6[3] = &unk_100060AB8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NTKDCollectionClient *)self _performOrEnqueueAction:v6];
}

- (void)updateFaceForUUID:(id)a3 withConfigurationJSONRepresentation:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EE10;
  v7[3] = &unk_100060C58;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NTKDCollectionClient *)v8 _performOrEnqueueAction:v7];
}

- (void)updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F0BC;
  v7[3] = &unk_100060C58;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NTKDCollectionClient *)v8 _performOrEnqueueAction:v7];
}

- (void)upgradeFaceInstanceDescriptor:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F298;
  v9[3] = &unk_100060C58;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(NTKDCollectionClient *)self _performOrEnqueueAction:v9];
}

- (void)addFaceInstanceDescriptor:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F490;
  v9[3] = &unk_100060C58;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(NTKDCollectionClient *)self _performOrEnqueueAction:v9];
}

- (void)removeFaceForUUID:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F658;
  v4[3] = &unk_100060AB8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NTKDCollectionClient *)v5 _performOrEnqueueAction:v4];
}

- (void)resetCollection
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000F7D0;
  v2[3] = &unk_100060A90;
  v2[4] = self;
  [(NTKDCollectionClient *)self _performOrEnqueueAction:v2];
}

- (void)flushUpdatesWithIdentifier:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F97C;
  v4[3] = &unk_100060AB8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NTKDCollectionClient *)v5 _performOrEnqueueAction:v4];
}

- (void)collectionStore:(id)a3 loadOrderedUUIDs:(id)a4 selectedUUID:(id)a5 facesByUUID:(id)a6 seqId:(id)a7 acknowledge:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000FD38;
  v23[3] = &unk_100061168;
  id v24 = v14;
  id v25 = a6;
  id v26 = a7;
  v27 = self;
  id v29 = v16;
  id v30 = a8;
  id v28 = v15;
  id v17 = v16;
  id v18 = v15;
  id v19 = v30;
  id v20 = v26;
  id v21 = v25;
  id v22 = v14;
  [(NTKDCollectionClient *)self _onQueue:v23];
}

- (void)collectionStore:(id)a3 didUpdateSelectedUUID:(id)a4 seqId:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001017C;
  v11[3] = &unk_1000610F0;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = self;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(NTKDCollectionClient *)self _onQueue:v11];
}

- (void)collectionStore:(id)a3 didUpdateOrderedUUIDs:(id)a4 seqId:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001037C;
  v11[3] = &unk_1000610F0;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = self;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(NTKDCollectionClient *)self _onQueue:v11];
}

- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withConfiguration:(id)a5 seqId:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000105A8;
  v14[3] = &unk_100061190;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = self;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  [(NTKDCollectionClient *)self _onQueue:v14];
}

- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withResourceDirectory:(id)a5 seqId:(id)a6 acknowledge:(id)a7
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100010878;
  v17[3] = &unk_1000611B8;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = self;
  id v23 = a7;
  id v12 = v23;
  id v13 = v21;
  id v14 = v20;
  id v15 = v19;
  id v16 = v18;
  [(NTKDCollectionClient *)self _onQueue:v17];
}

- (void)collectionStore:(id)a3 didUpgradeFace:(id)a4 forUUID:(id)a5 seqId:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010BA8;
  v14[3] = &unk_100061190;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = self;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  [(NTKDCollectionClient *)self _onQueue:v14];
}

- (void)collectionStore:(id)a3 didAddFace:(id)a4 forUUID:(id)a5 seqId:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010DFC;
  v14[3] = &unk_100061190;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = self;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  [(NTKDCollectionClient *)self _onQueue:v14];
}

- (void)collectionStore:(id)a3 didRemoveFaceOfStyle:(int64_t)a4 forUUID:(id)a5 seqId:(id)a6 acknowledge:(id)a7
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100011054;
  v16[3] = &unk_1000611E0;
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = self;
  id v21 = a7;
  int64_t v22 = a4;
  id v12 = v21;
  id v13 = v19;
  id v14 = v18;
  id v15 = v17;
  [(NTKDCollectionClient *)self _onQueue:v16];
}

- (void)resetCollectionStore:(id)a3 acknowledge:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011340;
  v8[3] = &unk_100061208;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(NTKDCollectionClient *)self _onQueue:v8];
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
  objc_storeStrong((id *)&self->_collectionStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end