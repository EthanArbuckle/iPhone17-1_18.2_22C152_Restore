@interface FSVolumeConnectorBridge
+ (id)newWithConnection:(id)a3 errorHandler:(id)a4;
+ (id)newWithSyncConnection:(id)a3 errorHandler:(id)a4;
- (FSVolumeConnectorBridge)initWithConnection:(id)a3 errorHandler:(id)a4;
- (FSVolumeConnectorBridge)initWithSyncConnection:(id)a3 errorHandler:(id)a4;
- (FSVolumeXPC)proxy;
- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)getRootFileHandleWithError:(id)a3;
- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)lookupIn:(id)a3 name:(id)a4 usingFlags:(unsigned int)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)pathsAndAttributesForItemsByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)reclaim:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11;
- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11;
- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)setProxy:(id)a3;
- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 sharedBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
@end

@implementation FSVolumeConnectorBridge

- (FSVolumeConnectorBridge)initWithConnection:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FSVolumeConnectorBridge;
  v8 = [(FSVolumeConnectorBridge *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 remoteObjectProxyWithErrorHandler:v7];
    proxy = v8->_proxy;
    v8->_proxy = (FSVolumeXPC *)v9;
  }
  if (!v8->_proxy)
  {

    v8 = 0;
  }

  return v8;
}

- (FSVolumeConnectorBridge)initWithSyncConnection:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FSVolumeConnectorBridge;
  v8 = [(FSVolumeConnectorBridge *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v7];
    proxy = v8->_proxy;
    v8->_proxy = (FSVolumeXPC *)v9;
  }
  if (!v8->_proxy)
  {

    v8 = 0;
  }

  return v8;
}

+ (id)newWithConnection:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithConnection:v7 errorHandler:v6];

  return v8;
}

+ (id)newWithSyncConnection:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithSyncConnection:v7 errorHandler:v6];

  return v8;
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  proxy = self->_proxy;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011E7C;
  v11[3] = &unk_100058F40;
  id v12 = v8;
  id v10 = v8;
  [(FSVolumeXPC *)proxy abortSearch:a3 requestID:a4 replyHandler:v11];
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v15 = a8;
  proxy = self->_proxy;
  v17 = [a3 fsFileHandle];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100011F90;
  v19[3] = &unk_100058F68;
  id v20 = v15;
  id v18 = v15;
  -[FSVolumeXPC blockmapFile:range:startIO:flags:operationID:replyHandler:](proxy, "blockmapFile:range:startIO:flags:operationID:replyHandler:", v17, location, length, v10, v9, a7, v19);
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v10 = a6;
  proxy = self->_proxy;
  id v12 = [a3 fsFileHandle];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001207C;
  v14[3] = &unk_100058F40;
  id v15 = v10;
  id v13 = v10;
  [(FSVolumeXPC *)proxy checkAccessTo:v12 requestedAccess:a4 requestID:a5 replyHandler:v14];
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  proxy = self->_proxy;
  id v12 = [a3 fsFileHandle];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100012168;
  v14[3] = &unk_100058F40;
  id v15 = v10;
  id v13 = v10;
  [(FSVolumeXPC *)proxy close:v12 keepingMode:v7 requestID:a5 replyHandler:v14];
}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a7;
  proxy = self->_proxy;
  id v14 = a5;
  id v15 = a4;
  v16 = [a3 fsFileHandle];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100012274;
  v18[3] = &unk_100058F90;
  id v19 = v12;
  id v17 = v12;
  [(FSVolumeXPC *)proxy createIn:v16 named:v15 type:1 attributes:v14 requestID:a6 replyHandler:v18];
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v15 = a8;
  proxy = self->_proxy;
  id v17 = [a3 fsFileHandle];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100012458;
  v19[3] = &unk_100058F40;
  id v20 = v15;
  id v18 = v15;
  -[FSVolumeXPC endIO:range:status:flags:operationID:replyHandler:](proxy, "endIO:range:status:flags:operationID:replyHandler:", v17, location, length, v10, v9, a7, v19);
}

- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  proxy = self->_proxy;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012518;
  v11[3] = &unk_100058FB8;
  id v12 = v8;
  id v10 = v8;
  [(FSVolumeXPC *)proxy fetchVolumeMachPortLabeled:a3 requestID:a4 replyHandler:v11];
}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  proxy = self->_proxy;
  id v10 = [a3 fsFileHandle];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000125F8;
  v12[3] = &unk_100058FE0;
  id v13 = v8;
  id v11 = v8;
  [(FSVolumeXPC *)proxy fileAttributes:v10 requestedAttributes:81895 requestID:a4 replyHandler:v12];
}

- (void)getRootFileHandleWithError:(id)a3
{
  id v4 = a3;
  v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[FSVolumeConnectorBridge getRootFileHandleWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:start", buf, 0xCu);
  }

  proxy = self->_proxy;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100012730;
  v8[3] = &unk_100059008;
  id v9 = v4;
  id v7 = v4;
  [(FSVolumeXPC *)proxy getRootFileHandle:v8];
}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  proxy = self->_proxy;
  id v10 = [a3 fsFileHandle];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100012988;
  v12[3] = &unk_100059030;
  id v13 = v8;
  id v11 = v8;
  [(FSVolumeXPC *)proxy listXattrsOf:v10 requestID:a4 replyHandler:v12];
}

- (void)lookupIn:(id)a3 name:(id)a4 usingFlags:(unsigned int)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v12 = a7;
  proxy = self->_proxy;
  id v14 = a4;
  id v15 = [a3 fsFileHandle];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100012A84;
  v17[3] = &unk_100059058;
  id v18 = v12;
  id v16 = v12;
  [(FSVolumeXPC *)proxy lookupIn:v15 name:v14 flags:v8 requestID:a6 replyHandler:v17];
}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  id v16 = a9;
  proxy = self->_proxy;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = [a3 fsFileHandle];
  v22 = [v19 fsFileHandle];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100012D18;
  v24[3] = &unk_100058F90;
  id v25 = v16;
  id v23 = v16;
  [(FSVolumeXPC *)proxy makeCloneOf:v21 named:v20 inDirectory:v22 attributes:v18 usingFlags:v10 requestID:a8 replyHandler:v24];
}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a7;
  proxy = self->_proxy;
  id v14 = a5;
  id v15 = a4;
  id v16 = [a3 fsFileHandle];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100012EF4;
  v18[3] = &unk_100058F90;
  id v19 = v12;
  id v17 = v12;
  [(FSVolumeXPC *)proxy createIn:v16 named:v15 type:2 attributes:v14 requestID:a6 replyHandler:v18];
}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a7;
  proxy = self->_proxy;
  id v14 = a5;
  id v15 = a4;
  id v16 = [a3 fsFileHandle];
  id v17 = [v14 fsFileHandle];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100013190;
  v19[3] = &unk_100059080;
  id v20 = v12;
  id v18 = v12;
  [(FSVolumeXPC *)proxy makeLinkOf:v16 named:v15 inDirectory:v17 requestID:a6 replyHandler:v19];
}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14 = a8;
  proxy = self->_proxy;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = [a3 fsFileHandle];
  id v20 = [v17 dataUsingEncoding:4];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000132CC;
  v22[3] = &unk_100058F90;
  id v23 = v14;
  id v21 = v14;
  [(FSVolumeXPC *)proxy makeSymlinkIn:v19 named:v18 contents:v20 attributes:v16 requestID:a7 replyHandler:v22];
}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  proxy = self->_proxy;
  id v12 = [a3 fsFileHandle];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100013484;
  v14[3] = &unk_100058F40;
  id v15 = v10;
  id v13 = v10;
  [(FSVolumeXPC *)proxy open:v12 withMode:v7 requestID:a5 replyHandler:v14];
}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v10 = a6;
  proxy = self->_proxy;
  id v12 = a4;
  id v13 = [a3 fsFileHandle];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100013578;
  v15[3] = &unk_100058FE0;
  id v16 = v10;
  id v14 = v10;
  [(FSVolumeXPC *)proxy otherAttributeOf:v13 named:v12 requestID:a5 replyHandler:v15];
}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  proxy = self->_proxy;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100013638;
  v11[3] = &unk_1000590A8;
  id v12 = v8;
  id v10 = v8;
  [(FSVolumeXPC *)proxy parentsAndAttributesForItemsByID:a3 requestID:a4 replyHandler:v11];
}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3010000000;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  v36 = "";
  proxy = self->_proxy;
  id v11 = [v8 fsFileHandle];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100013A58;
  v32[3] = &unk_1000590D0;
  v32[4] = &v33;
  [(FSVolumeXPC *)proxy pathConfigurationOf:v11 propertyName:1 requestID:a4 replyHandler:v32];

  id v12 = self->_proxy;
  id v13 = [v8 fsFileHandle];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100013A70;
  v31[3] = &unk_1000590D0;
  v31[4] = &v33;
  [(FSVolumeXPC *)v12 pathConfigurationOf:v13 propertyName:4 requestID:a4 replyHandler:v31];

  id v14 = self->_proxy;
  id v15 = [v8 fsFileHandle];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100013A88;
  v30[3] = &unk_1000590D0;
  v30[4] = &v33;
  [(FSVolumeXPC *)v14 pathConfigurationOf:v15 propertyName:7 requestID:a4 replyHandler:v30];

  id v16 = self->_proxy;
  id v17 = [v8 fsFileHandle];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100013AA8;
  v29[3] = &unk_1000590D0;
  v29[4] = &v33;
  [(FSVolumeXPC *)v16 pathConfigurationOf:v17 propertyName:8 requestID:a4 replyHandler:v29];

  id v18 = self->_proxy;
  id v19 = [v8 fsFileHandle];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100013AD4;
  v28[3] = &unk_1000590D0;
  v28[4] = &v33;
  [(FSVolumeXPC *)v18 pathConfigurationOf:v19 propertyName:11 requestID:a4 replyHandler:v28];

  id v20 = self->_proxy;
  id v21 = [v8 fsFileHandle];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100013B00;
  v27[3] = &unk_1000590D0;
  v27[4] = &v33;
  [(FSVolumeXPC *)v20 pathConfigurationOf:v21 propertyName:12 requestID:a4 replyHandler:v27];

  v22 = self->_proxy;
  id v23 = [v8 fsFileHandle];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100013B2C;
  v26[3] = &unk_1000590D0;
  v26[4] = &v33;
  [(FSVolumeXPC *)v22 pathConfigurationOf:v23 propertyName:18 requestID:a4 replyHandler:v26];

  v24 = +[NSData dataWithBytes:v34 + 4 length:16];
  id v25 = (void (*)(void *, uint64_t, void *))v9[2];
  if (v24) {
    v25(v9, 0, v24);
  }
  else {
    v25(v9, 12, 0);
  }

  _Block_object_dispose(&v33, 8);
}

- (void)pathsAndAttributesForItemsByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14 = a8;
  id v15 = a3;
  id v16 = +[FSMutableFileDataBuffer dataWithLength:a4];
  proxy = self->_proxy;
  id v18 = [v15 fsFileHandle];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100013C88;
  v21[3] = &unk_1000590F8;
  id v22 = v16;
  id v23 = v14;
  id v19 = v16;
  id v20 = v14;
  [(FSVolumeXPC *)proxy readDirectory:v18 intoBuffer:v19 cookie:a5 verifier:a6 requestID:a7 replyHandler:v21];
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  id v16 = a3;
  id v17 = +[FSMutableFileDataBuffer dataWithLength:](FSMutableFileDataBuffer, "dataWithLength:", [v14 length]);
  proxy = self->_proxy;
  id v19 = [v16 fsFileHandle];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100013E48;
  v23[3] = &unk_100059120;
  id v24 = v14;
  id v25 = v17;
  id v26 = v15;
  id v20 = v15;
  id v21 = v17;
  id v22 = v14;
  [(FSVolumeXPC *)proxy readDirectory:v19 intoBuffer:v21 cookie:a5 verifier:a6 requestID:a7 replyHandler:v23];
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v16 = a9;
  id v17 = a3;
  id v18 = +[FSMutableFileDataBuffer dataWithLength:a4];
  proxy = self->_proxy;
  id v20 = [v17 fsFileHandle];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100014010;
  v23[3] = &unk_1000590F8;
  id v24 = v18;
  id v25 = v16;
  id v21 = v18;
  id v22 = v16;
  [(FSVolumeXPC *)proxy readDirectory:v20 requestedAttributes:a5 intoBuffer:v21 cookie:a6 verifier:a7 requestID:a8 replyHandler:v23];
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v14 = a4;
  id v15 = a9;
  id v16 = a3;
  id v17 = +[FSMutableFileDataBuffer dataWithLength:](FSMutableFileDataBuffer, "dataWithLength:", [v14 length]);
  proxy = self->_proxy;
  id v19 = [v16 fsFileHandle];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000141D8;
  v24[3] = &unk_100059120;
  id v25 = v14;
  id v26 = v17;
  id v27 = v15;
  id v20 = v15;
  id v21 = v17;
  id v22 = v14;
  [(FSVolumeXPC *)proxy readDirectory:v19 requestedAttributes:a5 intoBuffer:v21 cookie:a6 verifier:a7 requestID:a8 replyHandler:v24];
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  id v14 = a3;
  id v15 = +[FSMutableFileDataBuffer dataWithLength:](FSMutableFileDataBuffer, "dataWithLength:", [v12 length]);
  proxy = self->_proxy;
  id v17 = [v14 fsFileHandle];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000143AC;
  v21[3] = &unk_100059148;
  id v22 = v12;
  id v23 = v15;
  id v24 = v13;
  id v18 = v13;
  id v19 = v15;
  id v20 = v12;
  [(FSVolumeXPC *)proxy readFrom:v17 atOffset:a4 intoBuffer:v19 requestID:a6 replyHandler:v21];
}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v14 = +[FSMutableFileDataBuffer dataWithLength:a4];
  proxy = self->_proxy;
  id v16 = [v13 fsFileHandle];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100014548;
  v19[3] = &unk_100059170;
  id v20 = v14;
  id v21 = v12;
  id v17 = v14;
  id v18 = v12;
  [(FSVolumeXPC *)proxy readFrom:v16 atOffset:a5 intoBuffer:v17 requestID:a6 replyHandler:v19];
}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  proxy = self->_proxy;
  id v10 = [a3 fsFileHandle];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001465C;
  v12[3] = &unk_100058F68;
  id v13 = v8;
  id v11 = v8;
  [(FSVolumeXPC *)proxy readSymbolicLinkOf:v10 requestID:a4 replyHandler:v12];
}

- (void)reclaim:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  proxy = self->_proxy;
  id v10 = [a3 fsFileHandle];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100014734;
  v12[3] = &unk_100058FE0;
  id v13 = v8;
  id v11 = v8;
  [(FSVolumeXPC *)proxy reclaim:v10 requestID:a4 replyHandler:v12];
}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  id v14 = a8;
  proxy = self->_proxy;
  id v16 = a5;
  id v17 = a4;
  id v18 = [a3 fsFileHandle];
  id v19 = [v17 fsFileHandle];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100014860;
  v21[3] = &unk_100058F68;
  id v22 = v14;
  id v20 = v14;
  [(FSVolumeXPC *)proxy removeDirectory:v18 from:v19 named:v16 usingFlags:v9 requestID:a7 replyHandler:v21];
}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  id v14 = a8;
  proxy = self->_proxy;
  id v16 = a5;
  id v17 = a4;
  id v18 = [a3 fsFileHandle];
  id v19 = [v17 fsFileHandle];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001498C;
  v21[3] = &unk_100059080;
  id v22 = v14;
  id v20 = v14;
  [(FSVolumeXPC *)proxy removeItem:v18 from:v19 named:v16 usingFlags:v9 requestID:a7 replyHandler:v21];
}

- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  id v17 = a3;
  id v29 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a11;
  if (a8)
  {
    a8 = [a8 fsFileHandle];
  }
  proxy = self->_proxy;
  id v23 = [v17 fsFileHandle];
  [v18 fsFileHandle];
  id v24 = v28 = v17;
  id v25 = [v19 fsFileHandle];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100014B44;
  v30[3] = &unk_100059198;
  id v31 = v21;
  id v26 = v21;
  LODWORD(v27) = a9;
  [(FSVolumeXPC *)proxy renameItemIn:v23 named:v29 item:v24 toDirectory:v25 newName:v20 toItem:a8 usingFlags:v27 requestID:a10 replyHandler:v30];
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  proxy = self->_proxy;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100014C20;
  v13[3] = &unk_100058F40;
  id v14 = v10;
  id v12 = v10;
  [(FSVolumeXPC *)proxy replenishSearchCreditsFor:a3 credits:v7 requestID:a5 replyHandler:v13];
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  uint64_t v11 = *(void *)&a9;
  uint64_t v13 = *(void *)&a7;
  id v19 = a11;
  proxy = self->_proxy;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = [a3 fsFileHandle];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100014D68;
  v26[3] = &unk_100058F40;
  id v27 = v19;
  id v25 = v19;
  [(FSVolumeXPC *)proxy search:v24 token:v23 criteria:v22 resumeAt:v21 maxData:v13 maxDelay:v11 initialCredits:a8 requestID:a10 replyHandler:v26];
}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v10 = a6;
  proxy = self->_proxy;
  id v12 = a4;
  uint64_t v13 = [a3 fsFileHandle];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100014E5C;
  v15[3] = &unk_1000591C0;
  id v16 = v10;
  id v14 = v10;
  [(FSVolumeXPC *)proxy setFileAttributesOf:v13 to:v12 requestID:a5 replyHandler:v15];
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a7;
  proxy = self->_proxy;
  id v14 = a5;
  id v15 = a4;
  id v16 = [a3 fsFileHandle];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100014F68;
  v18[3] = &unk_100058F68;
  id v19 = v12;
  id v17 = v12;
  [(FSVolumeXPC *)proxy setOtherAttributeOf:v16 named:v15 value:v14 requestID:a6 replyHandler:v18];
}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  proxy = self->_proxy;
  id v12 = [a3 fsFileHandle];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100015050;
  v14[3] = &unk_1000591E8;
  id v15 = v10;
  id v13 = v10;
  [(FSVolumeXPC *)proxy setUpdateInterest:v12 interest:v7 requestID:a5 replyHandler:v14];
}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14 = a8;
  proxy = self->_proxy;
  id v16 = a5;
  id v17 = a4;
  id v18 = [a3 fsFileHandle];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001516C;
  v20[3] = &unk_100058F40;
  id v21 = v14;
  id v19 = v14;
  [(FSVolumeXPC *)proxy setXattrOf:v18 named:v17 value:v16 how:a6 requestID:a7 replyHandler:v20];
}

- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  proxy = self->_proxy;
  id v10 = [a3 fsFileHandle];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001525C;
  v12[3] = &unk_100059210;
  id v13 = v8;
  id v11 = v8;
  [(FSVolumeXPC *)proxy volumeStatistics:v10 requestID:a4 replyHandler:v12];
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a7;
  proxy = self->_proxy;
  id v14 = a5;
  id v15 = [a3 fsFileHandle];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100015408;
  v17[3] = &unk_100059238;
  id v18 = v12;
  id v16 = v12;
  [(FSVolumeXPC *)proxy writeTo:v15 atOffset:a4 fromBuffer:v14 requestID:a6 replyHandler:v17];
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 sharedBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a7;
  proxy = self->_proxy;
  id v14 = a5;
  id v15 = [a3 fsFileHandle];
  id v16 = [v14 mutableBytes];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100015518;
  v18[3] = &unk_100059238;
  id v19 = v12;
  id v17 = v12;
  [(FSVolumeXPC *)proxy writeTo:v15 atOffset:a4 fromBuffer:v16 requestID:a6 replyHandler:v18];
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v10 = a6;
  proxy = self->_proxy;
  id v12 = a4;
  id v13 = [a3 fsFileHandle];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100015610;
  v15[3] = &unk_100058FE0;
  id v16 = v10;
  id v14 = v10;
  [(FSVolumeXPC *)proxy xattrOf:v13 named:v12 requestID:a5 replyHandler:v15];
}

- (FSVolumeXPC)proxy
{
  return (FSVolumeXPC *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end