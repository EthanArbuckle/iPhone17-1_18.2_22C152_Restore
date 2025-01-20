@interface MBHSFileEncodingTask
+ (id)connection;
+ (id)encodingTaskWithEncodingMethod:(char)a3;
- (BOOL)sourceIsLive;
- (MBHSFileEncodingTask)initWithType:(char)a3 encodingMethod:(char)a4;
- (NSData)destinationDigest;
- (NSData)sourceDigest;
- (NSError)error;
- (NSNumber)spaceSavingsThreshold;
- (NSString)destinationPath;
- (NSString)sourcePath;
- (OS_dispatch_group)group;
- (char)compressionMethod;
- (char)encodingMethod;
- (char)type;
- (unint64_t)destinationSize;
- (unsigned)protectionClass;
- (void)_finishWithError:(id)a3;
- (void)setCompressionMethod:(char)a3;
- (void)setDestinationDigest:(id)a3;
- (void)setDestinationPath:(id)a3;
- (void)setDestinationSize:(unint64_t)a3;
- (void)setEncodingMethod:(char)a3;
- (void)setError:(id)a3;
- (void)setGroup:(id)a3;
- (void)setProtectionClass:(unsigned __int8)a3;
- (void)setSourceDigest:(id)a3;
- (void)setSourceIsLive:(BOOL)a3;
- (void)setSourcePath:(id)a3;
- (void)setSpaceSavingsThreshold:(id)a3;
- (void)setType:(char)a3;
- (void)start;
@end

@implementation MBHSFileEncodingTask

+ (id)encodingTaskWithEncodingMethod:(char)a3
{
  v3 = [[MBHSFileEncodingTask alloc] initWithType:1 encodingMethod:a3];
  return v3;
}

- (MBHSFileEncodingTask)initWithType:(char)a3 encodingMethod:(char)a4
{
  if (a3 != 1) {
    __assert_rtn("-[MBHSFileEncodingTask initWithType:encodingMethod:]", "MBHSFileEncodingTask.m", 32, "type == MBFileEncodingTypeEncode");
  }
  uint64_t v4 = a4;
  if (!a4) {
    __assert_rtn("-[MBHSFileEncodingTask initWithType:encodingMethod:]", "MBHSFileEncodingTask.m", 33, "encodingMethod != MBFileEncodingMethodUnspecified");
  }
  v8.receiver = self;
  v8.super_class = (Class)MBHSFileEncodingTask;
  v5 = [(MBHSFileEncodingTask *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MBHSFileEncodingTask *)v5 setType:1];
    [(MBHSFileEncodingTask *)v6 setEncodingMethod:v4];
    [(MBHSFileEncodingTask *)v6 setCompressionMethod:0xFFFFFFFFLL];
  }
  return v6;
}

+ (id)connection
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (qword_100482478)
  {
    id v3 = (id)qword_100482478;
  }
  else
  {
    if (qword_100482488 != -1) {
      dispatch_once(&qword_100482488, &stru_100413748);
    }
    id v4 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.MobileBackup.MBHelperService"];
    [v4 setRemoteObjectInterface:qword_100482480];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10010AD1C;
    v6[3] = &unk_100411038;
    v6[4] = v2;
    [v4 setInvalidationHandler:v6];
    objc_storeStrong((id *)&qword_100482478, v4);
    [v4 resume];
    id v3 = (id)qword_100482478;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)start
{
  if ([(MBHSFileEncodingTask *)self type] != 1) {
    __assert_rtn("-[MBHSFileEncodingTask start]", "MBHSFileEncodingTask.m", 68, "self.type == MBFileEncodingTypeEncode");
  }
  id v3 = [(MBHSFileEncodingTask *)self group];
  if (!v3) {
    __assert_rtn("-[MBHSFileEncodingTask start]", "MBHSFileEncodingTask.m", 69, "self.group");
  }

  id v4 = [(MBHSFileEncodingTask *)self group];
  dispatch_group_enter(v4);

  v5 = +[MBFileEncodingTask encodingTaskWithEncodingMethod:[(MBHSFileEncodingTask *)self encodingMethod]];
  v6 = [(MBHSFileEncodingTask *)self sourcePath];
  [v5 setSourcePath:v6];

  objc_msgSend(v5, "setSourceIsLive:", -[MBHSFileEncodingTask sourceIsLive](self, "sourceIsLive"));
  objc_msgSend(v5, "setCompressionMethod:", -[MBHSFileEncodingTask compressionMethod](self, "compressionMethod"));
  objc_msgSend(v5, "setProtectionClass:", -[MBHSFileEncodingTask protectionClass](self, "protectionClass"));
  v7 = [(MBHSFileEncodingTask *)self spaceSavingsThreshold];
  [v5 setSpaceSavingsThreshold:v7];

  objc_super v8 = [(MBHSFileEncodingTask *)self destinationPath];
  [v5 setDestinationPath:v8];

  v9 = [(id)objc_opt_class() connection];
  if (!v9) {
    __assert_rtn("-[MBHSFileEncodingTask start]", "MBHSFileEncodingTask.m", 82, "connection");
  }
  v10 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10010AFF0;
  v14[3] = &unk_100411060;
  v14[4] = self;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v14];
  if (!v11) {
    __assert_rtn("-[MBHSFileEncodingTask start]", "MBHSFileEncodingTask.m", 87, "proxy");
  }
  v12 = v11;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10010AFFC;
  v13[3] = &unk_100411060;
  v13[4] = self;
  [v11 runEncodingTask:v5 reply:v13];
}

- (void)_finishWithError:(id)a3
{
  if (a3)
  {
    -[MBHSFileEncodingTask setError:](self, "setError:");
    [(MBHSFileEncodingTask *)self setDestinationSize:0];
    [(MBHSFileEncodingTask *)self setCompressionMethod:0];
  }
  id v4 = [(MBHSFileEncodingTask *)self group];
  dispatch_group_leave(v4);

  [(MBHSFileEncodingTask *)self setGroup:0];
}

- (char)type
{
  return self->_type;
}

- (void)setType:(char)a3
{
  self->_type = a3;
}

- (char)encodingMethod
{
  return self->_encodingMethod;
}

- (void)setEncodingMethod:(char)a3
{
  self->_encodingMethod = a3;
}

- (char)compressionMethod
{
  return self->_compressionMethod;
}

- (void)setCompressionMethod:(char)a3
{
  self->_compressionMethod = a3;
}

- (unsigned)protectionClass
{
  return self->_protectionClass;
}

- (void)setProtectionClass:(unsigned __int8)a3
{
  self->_protectionClass = a3;
}

- (NSNumber)spaceSavingsThreshold
{
  return self->_spaceSavingsThreshold;
}

- (void)setSpaceSavingsThreshold:(id)a3
{
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (NSString)sourcePath
{
  return self->_sourcePath;
}

- (void)setSourcePath:(id)a3
{
}

- (BOOL)sourceIsLive
{
  return self->_sourceIsLive;
}

- (void)setSourceIsLive:(BOOL)a3
{
  self->_sourceIsLive = a3;
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (unint64_t)destinationSize
{
  return self->_destinationSize;
}

- (void)setDestinationSize:(unint64_t)a3
{
  self->_destinationSize = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSData)sourceDigest
{
  return self->_sourceDigest;
}

- (void)setSourceDigest:(id)a3
{
}

- (NSData)destinationDigest
{
  return self->_destinationDigest;
}

- (void)setDestinationDigest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationDigest, 0);
  objc_storeStrong((id *)&self->_sourceDigest, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_sourcePath, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_spaceSavingsThreshold, 0);
}

@end