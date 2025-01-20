@interface SFUZipFreeSpaceEntry
- (int64_t)compareByOffset:(id)a3;
@end

@implementation SFUZipFreeSpaceEntry

- (int64_t)compareByOffset:(id)a3
{
  unint64_t offset = self->offset;
  unint64_t v4 = *((void *)a3 + 1);
  BOOL v5 = offset >= v4;
  int64_t v6 = offset > v4;
  if (v5) {
    return v6;
  }
  else {
    return -1;
  }
}

@end