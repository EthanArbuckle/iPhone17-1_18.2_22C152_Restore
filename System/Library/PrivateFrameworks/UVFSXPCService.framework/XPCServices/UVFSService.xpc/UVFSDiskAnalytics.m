@interface UVFSDiskAnalytics
- (NSString)diskType;
- (NSString)partitionTableType;
- (unint64_t)diskBlockSize;
- (unint64_t)diskSize;
- (void)setDiskBlockSize:(unint64_t)a3;
- (void)setDiskSize:(unint64_t)a3;
- (void)setDiskType:(id)a3;
- (void)setPartitionTableType:(id)a3;
@end

@implementation UVFSDiskAnalytics

- (NSString)diskType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDiskType:(id)a3
{
}

- (unint64_t)diskSize
{
  return self->_diskSize;
}

- (void)setDiskSize:(unint64_t)a3
{
  self->_diskSize = a3;
}

- (unint64_t)diskBlockSize
{
  return self->_diskBlockSize;
}

- (void)setDiskBlockSize:(unint64_t)a3
{
  self->_diskBlockSize = a3;
}

- (NSString)partitionTableType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPartitionTableType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partitionTableType, 0);

  objc_storeStrong((id *)&self->_diskType, 0);
}

@end