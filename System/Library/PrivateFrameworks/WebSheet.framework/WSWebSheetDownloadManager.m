@interface WSWebSheetDownloadManager
- (BOOL)removeFromDisk;
- (NSString)fileDownloadPath;
- (_WSWebSheetDownloadDelegate)delegate;
- (void)_download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5;
- (void)_download:(id)a3 didFailWithError:(id)a4;
- (void)_download:(id)a3 didReceiveData:(unint64_t)a4;
- (void)_download:(id)a3 didReceiveResponse:(id)a4;
- (void)_downloadDidFinish:(id)a3;
- (void)_downloadDidStart:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WSWebSheetDownloadManager

- (BOOL)removeFromDisk
{
  if (!self->_fileDownloadPath) {
    return 1;
  }
  v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = objc_msgSend(v3, "_web_removeFileOnlyAtPath:", self->_fileDownloadPath);

  fileDownloadPath = self->_fileDownloadPath;
  self->_fileDownloadPath = 0;

  return v4;
}

- (void)_downloadDidStart:(id)a3
{
}

- (void)_download:(id)a3 didReceiveResponse:(id)a4
{
}

- (void)_download:(id)a3 didReceiveData:(unint64_t)a4
{
}

- (void)_download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  v7 = (void (**)(id, void, NSString *))a5;
  v8 = [MEMORY[0x263F08850] defaultManager];
  v9 = NSTemporaryDirectory();
  v10 = [v9 stringByAppendingPathComponent:@"ConfigurationProfile"];

  if (!v10
    || (objc_msgSend(v8, "_web_pathWithUniqueFilenameForPath:", v10),
        v11 = (NSString *)objc_claimAutoreleasedReturnValue(),
        fileDownloadPath = self->_fileDownloadPath,
        self->_fileDownloadPath = v11,
        fileDownloadPath,
        !self->_fileDownloadPath))
  {
    [v13 cancel];
  }
  v7[2](v7, 0, self->_fileDownloadPath);
}

- (void)_downloadDidFinish:(id)a3
{
}

- (void)_download:(id)a3 didFailWithError:(id)a4
{
}

- (NSString)fileDownloadPath
{
  return self->_fileDownloadPath;
}

- (_WSWebSheetDownloadDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_WSWebSheetDownloadDelegate *)a3;
}

- (void).cxx_destruct
{
}

@end