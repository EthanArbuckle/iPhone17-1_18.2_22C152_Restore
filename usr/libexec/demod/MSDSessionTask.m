@interface MSDSessionTask
- (BOOL)redirected;
- (MSDPartialDownload)contentRange;
- (MSDSessionTaskInfo)info;
- (NSError)error;
- (NSFileHandle)fileHandle;
- (NSMutableData)outData;
- (NSURLSessionTask)task;
- (id)initFromTaskInfo:(id)a3;
- (id)prepareToWrite:(id)a3;
- (int)state;
- (int64_t)currentRetry;
- (void)resetData;
- (void)resetFileHandle;
- (void)setContentRange:(id)a3;
- (void)setCurrentRetry:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setInfo:(id)a3;
- (void)setOutData:(id)a3;
- (void)setRedirected:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setTask:(id)a3;
@end

@implementation MSDSessionTask

- (id)initFromTaskInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDSessionTask;
  v5 = [(MSDSessionTask *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(MSDSessionTask *)v5 setInfo:v4];
    [(MSDSessionTask *)v6 resetFileHandle];
    [(MSDSessionTask *)v6 resetData];
    v7 = v6;
  }

  return v6;
}

- (void)resetFileHandle
{
  v3 = [(MSDSessionTask *)self info];
  id v4 = [v3 savePath];

  if (v4)
  {
    v5 = [MSDPartialDownload alloc];
    v6 = [(MSDSessionTask *)self info];
    v7 = [v6 savePath];
    v8 = [(MSDPartialDownload *)v5 initWithFilePath:v7];
    [(MSDSessionTask *)self setContentRange:v8];

    v11 = [(MSDSessionTask *)self info];
    objc_super v9 = [(MSDPartialDownload *)v11 savePath];
    v10 = [(MSDSessionTask *)self prepareToWrite:v9];
    [(MSDSessionTask *)self setFileHandle:v10];
  }
  else
  {
    v11 = objc_alloc_init(MSDPartialDownload);
    -[MSDSessionTask setContentRange:](self, "setContentRange:");
  }
}

- (void)resetData
{
  id v3 = +[NSMutableData dataWithCapacity:0];
  [(MSDSessionTask *)self setOutData:v3];
}

- (id)prepareToWrite:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    v7 = [v3 stringByDeletingLastPathComponent];
    v8 = +[NSFileManager defaultManager];
    id v16 = 0;
    unsigned __int8 v9 = [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v6 = v16;

    if (v9)
    {
      v10 = +[NSFileManager defaultManager];
      unsigned __int8 v11 = [v10 createFileAtPath:v3 contents:0 attributes:0];

      if (v11)
      {

        goto LABEL_6;
      }
      v15 = sub_100068600();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000CE0EC();
      }
    }
    else
    {
      v15 = sub_100068600();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000CE1A4((uint64_t)v7, v6);
      }
    }

    goto LABEL_18;
  }
  id v6 = 0;
LABEL_6:
  v12 = +[NSFileHandle fileHandleForWritingAtPath:v3];
  if (v12)
  {
    v13 = v12;
    [v12 seekToEndOfFile];
    fcntl((int)[v13 fileDescriptor], 48, 1);
    goto LABEL_8;
  }
  v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000CE084();
  }
LABEL_18:

  v13 = 0;
LABEL_8:

  return v13;
}

- (NSURLSessionTask)task
{
  return (NSURLSessionTask *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTask:(id)a3
{
}

- (MSDSessionTaskInfo)info
{
  return (MSDSessionTaskInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInfo:(id)a3
{
}

- (MSDPartialDownload)contentRange
{
  return (MSDPartialDownload *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContentRange:(id)a3
{
}

- (int64_t)currentRetry
{
  return self->_currentRetry;
}

- (void)setCurrentRetry:(int64_t)a3
{
  self->_currentRetry = a3;
}

- (NSMutableData)outData
{
  return (NSMutableData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutData:(id)a3
{
}

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFileHandle:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)redirected
{
  return self->_redirected;
}

- (void)setRedirected:(BOOL)a3
{
  self->_redirected = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_outData, 0);
  objc_storeStrong((id *)&self->_contentRange, 0);
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

@end