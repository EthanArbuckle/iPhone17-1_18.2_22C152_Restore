@interface STStorageSizeOperation
- (int64_t)size;
- (void)main;
- (void)setSize:(int64_t)a3;
@end

@implementation STStorageSizeOperation

- (void)setSize:(int64_t)a3
{
  id v4 = [NSNumber numberWithLongLong:a3];
  [(STStorageOperation *)self setOutput:v4];
}

- (int64_t)size
{
  v2 = [(STStorageOperation *)self output];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (void)main
{
}

@end