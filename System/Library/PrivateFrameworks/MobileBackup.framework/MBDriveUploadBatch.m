@interface MBDriveUploadBatch
- (BOOL)last;
- (MBDriveUploadBatch)initWithPaths:(id)a3 size:(unint64_t)a4 last:(BOOL)a5;
- (NSArray)items;
- (NSDictionary)paths;
- (unint64_t)maxUploadedFileSize;
- (unint64_t)minUploadedFileSize;
- (unint64_t)postUploadDuration;
- (unint64_t)preUploadDuration;
- (unint64_t)size;
- (unint64_t)uploadStartTime;
- (unint64_t)uploadedByteCount;
- (unint64_t)uploadedFileCount;
- (unsigned)index;
- (void)dealloc;
- (void)setIndex:(unsigned int)a3;
- (void)setItems:(id)a3;
- (void)setLast:(BOOL)a3;
- (void)setMaxUploadedFileSize:(unint64_t)a3;
- (void)setMinUploadedFileSize:(unint64_t)a3;
- (void)setPaths:(id)a3;
- (void)setPostUploadDuration:(unint64_t)a3;
- (void)setPreUploadDuration:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
- (void)setUploadStartTime:(unint64_t)a3;
- (void)setUploadedByteCount:(unint64_t)a3;
- (void)setUploadedFileCount:(unint64_t)a3;
@end

@implementation MBDriveUploadBatch

- (MBDriveUploadBatch)initWithPaths:(id)a3 size:(unint64_t)a4 last:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MBDriveUploadBatch;
  v8 = [(MBDriveUploadBatch *)&v11 init];
  v9 = v8;
  if (v8)
  {
    atomic_fetch_add_explicit(dword_1004827C8, 1u, memory_order_relaxed);
    -[MBDriveUploadBatch setIndex:](v8, "setIndex:");
    [(MBDriveUploadBatch *)v9 setPaths:a3];
    [(MBDriveUploadBatch *)v9 setSize:a4];
    [(MBDriveUploadBatch *)v9 setLast:v5];
    [(MBDriveUploadBatch *)v9 setMinUploadedFileSize:-1];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDriveUploadBatch;
  [(MBDriveUploadBatch *)&v3 dealloc];
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
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

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (BOOL)last
{
  return self->_last;
}

- (void)setLast:(BOOL)a3
{
  self->_last = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (unint64_t)uploadStartTime
{
  return self->_uploadStartTime;
}

- (void)setUploadStartTime:(unint64_t)a3
{
  self->_uploadStartTime = a3;
}

- (unint64_t)uploadedFileCount
{
  return self->_uploadedFileCount;
}

- (void)setUploadedFileCount:(unint64_t)a3
{
  self->_uploadedFileCount = a3;
}

- (unint64_t)uploadedByteCount
{
  return self->_uploadedByteCount;
}

- (void)setUploadedByteCount:(unint64_t)a3
{
  self->_uploadedByteCount = a3;
}

- (unint64_t)minUploadedFileSize
{
  return self->_minUploadedFileSize;
}

- (void)setMinUploadedFileSize:(unint64_t)a3
{
  self->_minUploadedFileSize = a3;
}

- (unint64_t)maxUploadedFileSize
{
  return self->_maxUploadedFileSize;
}

- (void)setMaxUploadedFileSize:(unint64_t)a3
{
  self->_maxUploadedFileSize = a3;
}

- (unint64_t)preUploadDuration
{
  return self->_preUploadDuration;
}

- (void)setPreUploadDuration:(unint64_t)a3
{
  self->_preUploadDuration = a3;
}

- (unint64_t)postUploadDuration
{
  return self->_postUploadDuration;
}

- (void)setPostUploadDuration:(unint64_t)a3
{
  self->_postUploadDuration = a3;
}

@end