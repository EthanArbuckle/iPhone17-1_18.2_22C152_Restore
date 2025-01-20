@interface LiveFSVolumeCore_FSFileNameBridge
+ (id)newWithConnection:(id)a3 errorHandler:(id)a4;
+ (id)newWithProxy:(id)a3;
+ (id)newWithSyncConnection:(id)a3 errorHandler:(id)a4;
- (LiveFSVolumeCore)proxy;
- (LiveFSVolumeCore_FSFileNameBridge)initWithConnection:(id)a3 errorHandler:(id)a4;
- (LiveFSVolumeCore_FSFileNameBridge)initWithProxy:(id)a3;
- (LiveFSVolumeCore_FSFileNameBridge)initWithSyncConnection:(id)a3 errorHandler:(id)a4;
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

@implementation LiveFSVolumeCore_FSFileNameBridge

- (LiveFSVolumeCore_FSFileNameBridge)initWithConnection:(id)a3 errorHandler:(id)a4
{
  v5 = [a3 remoteObjectProxyWithErrorHandler:a4];
  v6 = [(LiveFSVolumeCore_FSFileNameBridge *)self initWithProxy:v5];

  return v6;
}

- (LiveFSVolumeCore_FSFileNameBridge)initWithSyncConnection:(id)a3 errorHandler:(id)a4
{
  v5 = [a3 synchronousRemoteObjectProxyWithErrorHandler:a4];
  v6 = [(LiveFSVolumeCore_FSFileNameBridge *)self initWithProxy:v5];

  return v6;
}

- (LiveFSVolumeCore_FSFileNameBridge)initWithProxy:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LiveFSVolumeCore_FSFileNameBridge;
  v6 = [(LiveFSVolumeCore_FSFileNameBridge *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proxy, a3);
  }
  if (!v7->_proxy)
  {

    v7 = 0;
  }

  return v7;
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

+ (id)newWithProxy:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithProxy:v4];

  return v5;
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  proxy = self->_proxy;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = [a4 string];
  [(LiveFSVolumeCore *)proxy createIn:v14 named:v15 attributes:v13 requestID:a6 reply:v12];
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
}

- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)getRootFileHandleWithError:(id)a3
{
}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)lookupIn:(id)a3 name:(id)a4 usingFlags:(unsigned int)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  proxy = self->_proxy;
  id v12 = a7;
  id v13 = a3;
  id v14 = [a4 string];
  [(LiveFSVolumeCore *)proxy lookupIn:v13 name:v14 usingFlags:v8 requestID:a6 reply:v12];
}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  proxy = self->_proxy;
  id v16 = a9;
  id v17 = a6;
  id v18 = a5;
  id v19 = a3;
  id v20 = [a4 string];
  [(LiveFSVolumeCore *)proxy makeCloneOf:v19 named:v20 inDirectory:v18 attributes:v17 usingFlags:v10 requestID:a8 reply:v16];
}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  proxy = self->_proxy;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = [a4 string];
  [(LiveFSVolumeCore *)proxy makeDirectoryIn:v14 named:v15 attributes:v13 requestID:a6 reply:v12];
}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  proxy = self->_proxy;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = [a4 string];
  [(LiveFSVolumeCore *)proxy makeLinkOf:v14 named:v15 inDirectory:v13 requestID:a6 reply:v12];
}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  proxy = self->_proxy;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  id v18 = [a4 string];
  [(LiveFSVolumeCore *)proxy makeSymLinkIn:v17 named:v18 contents:v16 attributes:v15 requestID:a7 reply:v14];
}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  proxy = self->_proxy;
  id v10 = a6;
  id v11 = a3;
  id v12 = [a4 string];
  [(LiveFSVolumeCore *)proxy otherAttributeOf:v11 named:v12 requestID:a5 reply:v10];
}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)pathsAndAttributesForItemsByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  proxy = self->_proxy;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100015E9C;
  v11[3] = &unk_100059260;
  id v12 = v8;
  id v10 = v8;
  [(LiveFSVolumeCore *)proxy readLinkOf:a3 requestID:a4 reply:v11];
}

- (void)reclaim:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  proxy = self->_proxy;
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  id v17 = [a5 string];
  [(LiveFSVolumeCore *)proxy removeDirectory:v16 from:v15 named:v17 usingFlags:v9 requestID:a7 reply:v14];
}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  proxy = self->_proxy;
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  id v17 = [a5 string];
  [(LiveFSVolumeCore *)proxy removeItem:v16 from:v15 named:v17 usingFlags:v9 requestID:a7 reply:v14];
}

- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  proxy = self->_proxy;
  id v18 = a11;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  id v26 = [a4 string];
  v24 = [v20 string];

  LODWORD(v25) = a9;
  [(LiveFSVolumeCore *)proxy renameItemIn:v23 named:v26 item:v22 toDirectory:v21 newName:v24 toItem:v19 usingFlags:v25 requestID:a10 reply:v18];
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  proxy = self->_proxy;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = [a4 string];
  [(LiveFSVolumeCore *)proxy setOtherAttributeOf:v14 named:v15 value:v13 requestID:a6 reply:v12];
}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  proxy = self->_proxy;
  id v14 = a8;
  id v15 = a5;
  id v16 = a3;
  id v17 = [a4 string];
  [(LiveFSVolumeCore *)proxy setXattrOf:v16 named:v17 value:v15 how:v9 requestID:a7 reply:v14];
}

- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 sharedBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  proxy = self->_proxy;
  id v10 = a6;
  id v11 = a3;
  id v12 = [a4 string];
  [(LiveFSVolumeCore *)proxy xattrOf:v11 named:v12 requestID:a5 reply:v10];
}

- (LiveFSVolumeCore)proxy
{
  return (LiveFSVolumeCore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end