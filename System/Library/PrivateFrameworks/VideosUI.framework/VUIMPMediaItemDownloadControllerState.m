@interface VUIMPMediaItemDownloadControllerState
- (BOOL)downloadSucceeded;
- (BOOL)isDownloadInProgress;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (VUIMPMediaItemDownloadControllerState)init;
- (double)downloadProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)bytesDownloaded;
- (unint64_t)bytesToDownload;
- (unint64_t)hash;
- (unint64_t)status;
- (void)setBytesDownloaded:(unint64_t)a3;
- (void)setBytesToDownload:(unint64_t)a3;
- (void)setDownloadInProgress:(BOOL)a3;
- (void)setDownloadProgress:(double)a3;
- (void)setDownloadSucceeded:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation VUIMPMediaItemDownloadControllerState

- (VUIMPMediaItemDownloadControllerState)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIMPMediaItemDownloadControllerState;
  result = [(VUIMPMediaItemDownloadControllerState *)&v3 init];
  if (result)
  {
    result->_status = 3;
    result->_downloadProgress = -1.0;
  }
  return result;
}

- (BOOL)isDownloadInProgress
{
  return [(VUIMPMediaItemDownloadControllerState *)self status] < 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VUIMPMediaItemDownloadControllerState);
  v4->_status = self->_status;
  v4->_downloadProgress = self->_downloadProgress;
  v4->_bytesDownloaded = self->_bytesDownloaded;
  v4->_bytesToDownload = self->_bytesToDownload;
  v4->_downloadSucceeded = self->_downloadSucceeded;
  objc_storeStrong((id *)&v4->_error, self->_error);
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VUIMPMediaItemDownloadControllerState *)self status];
  [(VUIMPMediaItemDownloadControllerState *)self downloadProgress];
  unint64_t v5 = (unint64_t)(v4 * 100.0);
  unint64_t v6 = [(VUIMPMediaItemDownloadControllerState *)self bytesToDownload];
  unint64_t v7 = [(VUIMPMediaItemDownloadControllerState *)self bytesDownloaded];
  if ([(VUIMPMediaItemDownloadControllerState *)self downloadSucceeded]) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = [(VUIMPMediaItemDownloadControllerState *)self error];
  unint64_t v10 = v3 ^ (4 * v6) ^ (2 * v5) ^ (8 * v7) ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (VUIMPMediaItemDownloadControllerState *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = v5;
    unint64_t v7 = [(VUIMPMediaItemDownloadControllerState *)self status];
    if (v7 == [(VUIMPMediaItemDownloadControllerState *)v6 status]
      && ([(VUIMPMediaItemDownloadControllerState *)self downloadProgress],
          double v9 = v8,
          [(VUIMPMediaItemDownloadControllerState *)v6 downloadProgress],
          v9 == v10)
      && (unint64_t v11 = [(VUIMPMediaItemDownloadControllerState *)self bytesToDownload],
          v11 == [(VUIMPMediaItemDownloadControllerState *)v6 bytesToDownload])
      && (unint64_t v12 = [(VUIMPMediaItemDownloadControllerState *)self bytesDownloaded],
          v12 == [(VUIMPMediaItemDownloadControllerState *)v6 bytesDownloaded])
      && (BOOL v13 = [(VUIMPMediaItemDownloadControllerState *)self downloadSucceeded],
          v13 == [(VUIMPMediaItemDownloadControllerState *)v6 downloadSucceeded]))
    {
      v16 = [(VUIMPMediaItemDownloadControllerState *)self error];
      v17 = [(VUIMPMediaItemDownloadControllerState *)v6 error];
      BOOL v14 = v16 == v17;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v32.receiver = self;
  v32.super_class = (Class)VUIMPMediaItemDownloadControllerState;
  double v4 = [(VUIMPMediaItemDownloadControllerState *)&v32 description];
  [v3 addObject:v4];

  unint64_t v5 = NSString;
  unint64_t v6 = [(VUIMPMediaItemDownloadControllerState *)self status];
  if (v6 > 3) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = off_1E6DFC7D8[v6];
  }
  double v8 = [v5 stringWithFormat:@"%@=%@", @"status", v7];
  [v3 addObject:v8];

  double v9 = NSString;
  double v10 = (void *)MEMORY[0x1E4F28ED0];
  [(VUIMPMediaItemDownloadControllerState *)self downloadProgress];
  unint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  unint64_t v12 = [v9 stringWithFormat:@"%@=%@", @"downloadProgress", v11];
  [v3 addObject:v12];

  BOOL v13 = NSString;
  BOOL v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIMPMediaItemDownloadControllerState bytesToDownload](self, "bytesToDownload"));
  v15 = [v13 stringWithFormat:@"%@=%@", @"bytesToDownload", v14];
  [v3 addObject:v15];

  v16 = NSString;
  v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIMPMediaItemDownloadControllerState bytesDownloaded](self, "bytesDownloaded"));
  v18 = [v16 stringWithFormat:@"%@=%@", @"bytesDownloaded", v17];
  [v3 addObject:v18];

  v19 = NSString;
  [(VUIMPMediaItemDownloadControllerState *)self isDownloadInProgress];
  v20 = VUIBoolLogString();
  v21 = [v19 stringWithFormat:@"%@=%@", @"isDownloadInProgress", v20];
  [v3 addObject:v21];

  v22 = NSString;
  [(VUIMPMediaItemDownloadControllerState *)self downloadSucceeded];
  v23 = VUIBoolLogString();
  v24 = [v22 stringWithFormat:@"%@=%@", @"downloadSucceeded", v23];
  [v3 addObject:v24];

  v25 = NSString;
  v26 = [(VUIMPMediaItemDownloadControllerState *)self error];
  v27 = [v25 stringWithFormat:@"%@=%@", @"error", v26];
  [v3 addObject:v27];

  v28 = NSString;
  v29 = [v3 componentsJoinedByString:@", "];
  v30 = [v28 stringWithFormat:@"<%@>", v29];

  return v30;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(double)a3
{
  self->_downloadProgress = a3;
}

- (unint64_t)bytesToDownload
{
  return self->_bytesToDownload;
}

- (void)setBytesToDownload:(unint64_t)a3
{
  self->_bytesToDownload = a3;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(unint64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (void)setDownloadInProgress:(BOOL)a3
{
  self->_downloadInProgress = a3;
}

- (BOOL)downloadSucceeded
{
  return self->_downloadSucceeded;
}

- (void)setDownloadSucceeded:(BOOL)a3
{
  self->_downloadSucceeded = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end