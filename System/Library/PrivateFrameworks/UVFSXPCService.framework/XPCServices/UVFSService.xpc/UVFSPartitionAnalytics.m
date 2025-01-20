@interface UVFSPartitionAnalytics
- (NSString)partitionType;
- (id)getLogPartition;
- (unint64_t)partitionSize;
- (void)setPartitionSize:(unint64_t)a3;
- (void)setPartitionType:(id)a3;
@end

@implementation UVFSPartitionAnalytics

- (id)getLogPartition
{
  v3 = [(UVFSPartitionAnalytics *)self partitionType];
  v4 = +[NSString stringWithFormat:@"      Partition type %@, size %lu", v3, [(UVFSPartitionAnalytics *)self partitionSize]];

  return v4;
}

- (NSString)partitionType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPartitionType:(id)a3
{
}

- (unint64_t)partitionSize
{
  return self->_partitionSize;
}

- (void)setPartitionSize:(unint64_t)a3
{
  self->_partitionSize = a3;
}

- (void).cxx_destruct
{
}

@end