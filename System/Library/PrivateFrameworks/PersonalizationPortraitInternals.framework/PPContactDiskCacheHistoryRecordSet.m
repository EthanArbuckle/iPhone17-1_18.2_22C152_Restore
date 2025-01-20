@interface PPContactDiskCacheHistoryRecordSet
- (NSMutableArray)adds;
- (NSMutableArray)deletes;
- (NSMutableArray)updates;
- (NSString)filename;
- (unint64_t)hash;
@end

@implementation PPContactDiskCacheHistoryRecordSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_adds, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

- (NSMutableArray)deletes
{
  return self->_deletes;
}

- (NSMutableArray)updates
{
  return self->_updates;
}

- (NSMutableArray)adds
{
  return self->_adds;
}

- (NSString)filename
{
  return self->_filename;
}

- (unint64_t)hash
{
  return [(NSString *)self->_filename hash];
}

@end