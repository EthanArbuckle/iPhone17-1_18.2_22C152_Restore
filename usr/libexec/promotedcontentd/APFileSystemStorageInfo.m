@interface APFileSystemStorageInfo
- (unint64_t)allocatedSize;
- (unint64_t)filesCount;
- (unint64_t)totalSize;
- (void)setAllocatedSize:(unint64_t)a3;
- (void)setFilesCount:(unint64_t)a3;
- (void)setTotalSize:(unint64_t)a3;
@end

@implementation APFileSystemStorageInfo

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (void)setTotalSize:(unint64_t)a3
{
  self->_totalSize = a3;
}

- (unint64_t)allocatedSize
{
  return self->_allocatedSize;
}

- (void)setAllocatedSize:(unint64_t)a3
{
  self->_allocatedSize = a3;
}

- (unint64_t)filesCount
{
  return self->_filesCount;
}

- (void)setFilesCount:(unint64_t)a3
{
  self->_filesCount = a3;
}

@end