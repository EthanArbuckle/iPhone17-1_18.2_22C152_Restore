@interface MBSRestoreBatch
+ (MBSRestoreBatch)batchWithCache:(id)a3;
- (BOOL)addFile:(id)a3 itemID:(unint64_t)a4 restorePath:(id)a5;
- (BOOL)full;
- (MBChunkStoreBatch)chunkStoreBatch;
- (MBSRestoreBatch)initWithMaxFiles:(unint64_t)a3 maxBytes:(unint64_t)a4;
- (NSError)error;
- (NSError)firstItemError;
- (NSMutableArray)files;
- (NSMutableArray)serviceFileIDs;
- (double)startTime;
- (unint64_t)count;
- (void)dealloc;
- (void)setError:(id)a3;
- (void)setFirstItemError:(id)a3;
- (void)setStartTime:(double)a3;
@end

@implementation MBSRestoreBatch

+ (MBSRestoreBatch)batchWithCache:(id)a3
{
  v3 = -[MBSRestoreBatch initWithMaxFiles:maxBytes:]([MBSRestoreBatch alloc], "initWithMaxFiles:maxBytes:", objc_msgSend(objc_msgSend(a3, "configuration"), "getFilesCount"), objc_msgSend(objc_msgSend(a3, "configuration"), "getFilesSize"));
  return v3;
}

- (MBSRestoreBatch)initWithMaxFiles:(unint64_t)a3 maxBytes:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MBSRestoreBatch;
  v6 = [(MBSRestoreBatch *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_maxFiles = a3;
    v6->_maxBytes = a4;
    v6->_files = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7->_bytes = 0;
    v7->_serviceFileIDs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7->_chunkStoreBatch = objc_alloc_init(MBChunkStoreBatch);
    v7->_full = 0;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBSRestoreBatch;
  [(MBSRestoreBatch *)&v3 dealloc];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_files count];
}

- (BOOL)addFile:(id)a3 itemID:(unint64_t)a4 restorePath:(id)a5
{
  if (!a4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceRestoreEngine.m" lineNumber:2065 description:@"Zero item ID"];
  }
  if ((unint64_t)[(NSMutableArray *)self->_files count] >= self->_maxFiles
    || [(NSMutableArray *)self->_files count]
    && (unint64_t bytes = self->_bytes, (unint64_t)[a3 size] + bytes > self->_maxBytes))
  {
    BOOL result = 0;
    self->_full = 1;
  }
  else
  {
    [(NSMutableArray *)self->_files addObject:a3];
    -[NSMutableArray addObject:](self->_serviceFileIDs, "addObject:", +[MBSFileID fileIDWithMBFileID:](MBSFileID, "fileIDWithMBFileID:", [a3 fileID]));
    v11 = +[MBChunkStoreItem chunkStoreItemWithFileID:domain:path:](MBChunkStoreItem, "chunkStoreItemWithFileID:domain:path:", [a3 fileID], objc_msgSend(a3, "domain"), a5);
    [(MBChunkStoreItem *)v11 setItemID:a4];
    -[MBChunkStoreItem setSignature:](v11, "setSignature:", [a3 digest]);
    -[MBChunkStoreItem setSize:](v11, "setSize:", [a3 size]);
    [(MBChunkStoreBatch *)self->_chunkStoreBatch addItem:v11];
    self->_bytes += (unint64_t)[a3 size];
    return 1;
  }
  return result;
}

- (NSMutableArray)files
{
  return self->_files;
}

- (NSMutableArray)serviceFileIDs
{
  return self->_serviceFileIDs;
}

- (MBChunkStoreBatch)chunkStoreBatch
{
  return self->_chunkStoreBatch;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSError)firstItemError
{
  return self->_firstItemError;
}

- (void)setFirstItemError:(id)a3
{
}

- (BOOL)full
{
  return self->_full;
}

@end