@interface TSTTableDataCustomFormat
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initObjectWithCustomFormat:(void *)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSTTableDataCustomFormat

- (id)initObjectWithCustomFormat:(void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSTTableDataCustomFormat;
  if ([(TSTTableDataCustomFormat *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (unint64_t)hash
{
  return MEMORY[0x270F79A38](self->mCustomFormat, a2);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  mCustomFormat = (TSUCustomFormat *)self->mCustomFormat;
  v6 = (TSUCustomFormat *)*((void *)a3 + 2);

  return TSUCustomFormat::customFormatIsEqual(mCustomFormat, v6);
}

- (id)description
{
  v2 = NSString;
  uint64_t mRefCount = self->super.mRefCount;
  mCustomFormat = (TSUCustomFormat *)self->mCustomFormat;
  if (mCustomFormat) {
    v5 = (__CFString *)TSUCustomFormat::formatName(mCustomFormat);
  }
  else {
    v5 = @"NULL";
  }
  return (id)[v2 stringWithFormat:@"refCount: %d   mCustomFormat: %@", mRefCount, v5];
}

- (void)dealloc
{
  mCustomFormat = self->mCustomFormat;
  if (mCustomFormat)
  {
    uint64_t v4 = MEMORY[0x223CB8C70](mCustomFormat, a2);
    MEMORY[0x223CB8F20](v4, 0x10A0C40ADE6F494);
  }
  self->mCustomFormat = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSTTableDataCustomFormat;
  [(TSTTableDataCustomFormat *)&v5 dealloc];
}

@end