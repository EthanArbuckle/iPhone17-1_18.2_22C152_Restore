@interface _UICollectionLayoutFramesQueryResultElementIndexKey
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation _UICollectionLayoutFramesQueryResultElementIndexKey

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  int64_t index = self->_index;
  return [(NSString *)self->_element hash] ^ index;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (a3 && self->_index == *((void *)a3 + 2)) {
    return [(NSString *)self->_element isEqualToString:*((void *)a3 + 1)];
  }
  return 0;
}

@end