@interface MBChunkStoreItem
+ (id)chunkStoreItemWithFileID:(id)a3 domain:(id)a4 path:(id)a5;
- (MBChunkStoreItem)initWithFileID:(id)a3 domain:(id)a4 path:(id)a5;
- (MBDomain)domain;
- (MBFileID)fileID;
- (NSData)encryptedKey;
- (NSData)signature;
- (NSError)error;
- (NSString)authToken;
- (NSString)path;
- (NSString)receipt;
- (NSString)temporaryPath;
- (double)progress;
- (int)fd;
- (unint64_t)itemID;
- (unint64_t)size;
- (void)close;
- (void)dealloc;
- (void)setAuthToken:(id)a3;
- (void)setDomain:(id)a3;
- (void)setEncryptedKey:(id)a3;
- (void)setError:(id)a3;
- (void)setFd:(int)a3;
- (void)setFileID:(id)a3;
- (void)setItemID:(unint64_t)a3;
- (void)setPath:(id)a3;
- (void)setProgress:(double)a3;
- (void)setReceipt:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setTemporaryPath:(id)a3;
@end

@implementation MBChunkStoreItem

+ (id)chunkStoreItemWithFileID:(id)a3 domain:(id)a4 path:(id)a5
{
  v5 = [[MBChunkStoreItem alloc] initWithFileID:a3 domain:a4 path:a5];
  return v5;
}

- (MBChunkStoreItem)initWithFileID:(id)a3 domain:(id)a4 path:(id)a5
{
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBChunkStoreItem.m" lineNumber:22 description:@"Null file ID"];
    if (a5) {
      goto LABEL_3;
    }
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBChunkStoreItem.m" lineNumber:23 description:@"Null path"];
LABEL_3:
  v12.receiver = self;
  v12.super_class = (Class)MBChunkStoreItem;
  v10 = [(MBChunkStoreItem *)&v12 init];
  if (v10)
  {
    v10->_fileID = (MBFileID *)a3;
    v10->_domain = (MBDomain *)a4;
    v10->_path = (NSString *)a5;
    v10->_fd = -1;
    v10->_error = (NSError *)+[MBError errorWithCode:400 format:@"No finished callback for item"];
  }
  return v10;
}

- (void)dealloc
{
  [(MBChunkStoreItem *)self close];

  v3.receiver = self;
  v3.super_class = (Class)MBChunkStoreItem;
  [(MBChunkStoreItem *)&v3 dealloc];
}

- (void)close
{
  self->_temporaryPath = 0;
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(unint64_t)a3
{
  self->_itemID = a3;
}

- (MBFileID)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

- (MBDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)temporaryPath
{
  return self->_temporaryPath;
}

- (void)setTemporaryPath:(id)a3
{
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (NSString)receipt
{
  return self->_receipt;
}

- (void)setReceipt:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

@end