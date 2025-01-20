@interface RPFileTransferItem
- (BOOL)completed;
- (NSData)fileData;
- (NSData)sha256HashData;
- (NSDictionary)metadata;
- (NSError)error;
- (NSString)filename;
- (NSURL)itemURL;
- (RPFileTransferItem)init;
- (id)completionHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int64_t)fileSize;
- (unint64_t)estimatedSize;
- (unint64_t)fileID;
- (unint64_t)metadataSize;
- (void)setCompleted:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setError:(id)a3;
- (void)setEstimatedSize:(unint64_t)a3;
- (void)setFileData:(id)a3;
- (void)setFileID:(unint64_t)a3;
- (void)setFileSize:(int64_t)a3;
- (void)setFilename:(id)a3;
- (void)setItemURL:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataSize:(unint64_t)a3;
- (void)setSha256HashData:(id)a3;
@end

@implementation RPFileTransferItem

- (RPFileTransferItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPFileTransferItem;
  v2 = [(RPFileTransferItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_fileSize = -1;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  return [(RPFileTransferItem *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  [(NSDictionary *)self->_metadata count];
  NSAppendPrintF();
  id v3 = 0;
  return v3;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSData)sha256HashData
{
  return self->_sha256HashData;
}

- (void)setSha256HashData:(id)a3
{
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)estimatedSize
{
  return self->_estimatedSize;
}

- (void)setEstimatedSize:(unint64_t)a3
{
  self->_estimatedSize = a3;
}

- (NSData)fileData
{
  return self->_fileData;
}

- (void)setFileData:(id)a3
{
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (void)setFileID:(unint64_t)a3
{
  self->_fileID = a3;
}

- (unint64_t)metadataSize
{
  return self->_metadataSize;
}

- (void)setMetadataSize:(unint64_t)a3
{
  self->_metadataSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sha256HashData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end