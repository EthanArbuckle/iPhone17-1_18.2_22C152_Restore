@interface SKRemoteAPFSFormatTask
- (BOOL)caseSensitive;
- (BOOL)waitWithError:(id *)a3;
- (NSNumber)terminationStatus;
- (NSString)name;
- (NSString)password;
- (NSXPCConnection)connectionToService;
- (SKDisk)disk;
- (SKProgress)progress;
- (SKRemoteAPFSFormatTask)initWithName:(id)a3 disk:(id)a4 caseSensitive:(BOOL)a5 password:(id)a6;
- (SKTaskDataParser)stderrParser;
- (SKTaskDataParser)stdoutParser;
- (void)sendStderr:(id)a3;
- (void)sendStdout:(id)a3;
- (void)setProgress:(id)a3;
- (void)setStderrParser:(id)a3;
- (void)setStdoutParser:(id)a3;
- (void)setTerminationStatus:(id)a3;
@end

@implementation SKRemoteAPFSFormatTask

- (SKRemoteAPFSFormatTask)initWithName:(id)a3 disk:(id)a4 caseSensitive:(BOOL)a5 password:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SKRemoteAPFSFormatTask;
  v14 = [(SKRemoteAPFSFormatTask *)&v22 init];
  if (v14)
  {
    uint64_t v15 = +[SKProgress progressWithTotalUnitCount:100];
    progress = v14->_progress;
    v14->_progress = (SKProgress *)v15;

    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v14->_disk, a4);
    v14->_caseSensitive = a5;
    objc_storeStrong((id *)&v14->_password, a6);
    v17 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.storagekitfsrunner" options:4096];
    connectionToService = v14->_connectionToService;
    v14->_connectionToService = v17;

    v19 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKRemoteTaskRunnerProtocol];
    [(NSXPCConnection *)v14->_connectionToService setRemoteObjectInterface:v19];

    v20 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKRemoteTaskDataProtocol];
    [(NSXPCConnection *)v14->_connectionToService setExportedInterface:v20];

    [(NSXPCConnection *)v14->_connectionToService setExportedObject:v14];
    [(NSXPCConnection *)v14->_connectionToService setInterruptionHandler:&stru_100049668];
    [(NSXPCConnection *)v14->_connectionToService setInvalidationHandler:&stru_100049688];
    [(NSXPCConnection *)v14->_connectionToService resume];
  }

  return v14;
}

- (BOOL)waitWithError:(id *)a3
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1000269F0;
  v27 = sub_100026A00;
  id v28 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1000269F0;
  v21 = sub_100026A00;
  id v22 = 0;
  v5 = [(SKRemoteAPFSFormatTask *)self connectionToService];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100026A08;
  v16[3] = &unk_1000496B0;
  v16[4] = &v17;
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v16];

  v7 = [(SKRemoteAPFSFormatTask *)self name];
  v8 = [(SKRemoteAPFSFormatTask *)self disk];
  v9 = [v8 diskIdentifier];
  BOOL v10 = [(SKRemoteAPFSFormatTask *)self caseSensitive];
  id v11 = [(SKRemoteAPFSFormatTask *)self password];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100026A18;
  v15[3] = &unk_1000496D8;
  v15[4] = &v23;
  v15[5] = &v17;
  [v6 formatAPFSWithName:v7 diskIdentifier:v9 caseSensitive:v10 password:v11 withReply:v15];

  id v12 = (void *)v18[5];
  if (v12)
  {
    unsigned __int8 v13 = 0;
    if (a3) {
      *a3 = v12;
    }
  }
  else
  {
    [(NSXPCConnection *)self->_connectionToService invalidate];
    if ([(id)v24[5] integerValue]) {
      unsigned __int8 v13 = +[SKError failWithPOSIXCode:error:](SKError, "failWithPOSIXCode:error:", [(id)v24[5] integerValue], a3);
    }
    else {
      unsigned __int8 v13 = 1;
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

- (void)sendStdout:(id)a3
{
  id v6 = a3;
  v4 = [(SKRemoteAPFSFormatTask *)self stdoutParser];

  if (v4)
  {
    v5 = [(SKRemoteAPFSFormatTask *)self stdoutParser];
    [v5 parseData:v6];
  }
}

- (void)sendStderr:(id)a3
{
  id v6 = a3;
  v4 = [(SKRemoteAPFSFormatTask *)self stderrParser];

  if (v4)
  {
    v5 = [(SKRemoteAPFSFormatTask *)self stderrParser];
    [v5 parseData:v6];
  }
}

- (SKTaskDataParser)stdoutParser
{
  return self->_stdoutParser;
}

- (void)setStdoutParser:(id)a3
{
}

- (SKTaskDataParser)stderrParser
{
  return self->_stderrParser;
}

- (void)setStderrParser:(id)a3
{
}

- (NSXPCConnection)connectionToService
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (SKDisk)disk
{
  return (SKDisk *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)caseSensitive
{
  return self->_caseSensitive;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProgress:(id)a3
{
}

- (NSNumber)terminationStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTerminationStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminationStatus, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_disk, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
  objc_storeStrong((id *)&self->_stderrParser, 0);

  objc_storeStrong((id *)&self->_stdoutParser, 0);
}

@end