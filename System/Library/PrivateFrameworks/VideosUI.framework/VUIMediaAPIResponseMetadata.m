@interface VUIMediaAPIResponseMetadata
- (NSNumber)total;
- (NSString)offset;
- (void)setOffset:(id)a3;
- (void)setTotal:(id)a3;
@end

@implementation VUIMediaAPIResponseMetadata

- (NSNumber)total
{
  return self->_total;
}

- (void)setTotal:(id)a3
{
}

- (NSString)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_total, 0);
}

@end