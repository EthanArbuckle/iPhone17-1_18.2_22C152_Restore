@interface SFUZipOutputEntry
- (id)description;
- (int64_t)compareByOffset:(id)a3;
- (void)dealloc;
@end

@implementation SFUZipOutputEntry

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUZipOutputEntry;
  [(SFUZipOutputEntry *)&v3 dealloc];
}

- (id)description
{
  if (self->isCompressed) {
    v2 = @"yes";
  }
  else {
    v2 = @"no";
  }
  return (id)[NSString stringWithFormat:@"<SFUZipOutputEntry %p: name=%@, isCompressed=%@, compressedSize=%qu, uncompressedSize=%qu, offset=%qu>", self, self->name, v2, self->compressedSize, self->uncompressedSize, self->offset];
}

- (int64_t)compareByOffset:(id)a3
{
  unint64_t offset = self->offset;
  unint64_t v4 = *((void *)a3 + 6);
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