@interface MBSBackupBatch
+ (id)batch;
- (MBChunkStoreBatch)chunkStoreBatch;
- (MBSBackupBatch)init;
- (NSMutableArray)serviceFiles;
- (unint64_t)count;
- (void)addChunkStoreItem:(id)a3;
- (void)addServiceFile:(id)a3;
- (void)clear;
- (void)dealloc;
@end

@implementation MBSBackupBatch

+ (id)batch
{
  v2 = objc_alloc_init(MBSBackupBatch);
  return v2;
}

- (MBSBackupBatch)init
{
  v4.receiver = self;
  v4.super_class = (Class)MBSBackupBatch;
  v2 = [(MBSBackupBatch *)&v4 init];
  if (v2)
  {
    v2->_serviceFiles = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_chunkStoreBatch = objc_alloc_init(MBChunkStoreBatch);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBSBackupBatch;
  [(MBSBackupBatch *)&v3 dealloc];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_serviceFiles count];
}

- (void)addServiceFile:(id)a3
{
  uint64_t v9 = 0;
  if (([a3 verifyWithError:&v9] & 1) == 0)
  {
    v6 = +[NSAssertionHandler currentHandler];
    id v7 = [a3 domain];
    id v8 = [a3 relativePath];
    [(NSAssertionHandler *)v6 handleFailureInMethod:a2, self, @"MBServiceBackupEngine.m", 2113, @"Invalid file: %@-%@: %@", v7, v8, +[MBError descriptionForError:v9] object file lineNumber description];
  }
  [(NSMutableArray *)self->_serviceFiles addObject:a3];
}

- (void)addChunkStoreItem:(id)a3
{
}

- (void)clear
{
  [(NSMutableArray *)self->_serviceFiles removeAllObjects];
  chunkStoreBatch = self->_chunkStoreBatch;
  [(MBChunkStoreBatch *)chunkStoreBatch removeAllItems];
}

- (NSMutableArray)serviceFiles
{
  return self->_serviceFiles;
}

- (MBChunkStoreBatch)chunkStoreBatch
{
  return self->_chunkStoreBatch;
}

@end