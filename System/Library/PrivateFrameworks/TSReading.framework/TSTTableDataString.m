@interface TSTTableDataString
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initObjectWithString:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSTTableDataString

- (id)initObjectWithString:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSTTableDataString;
  v4 = [(TSTTableDataString *)&v8 init];
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSTTableDataString initObjectWithString:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableDataList.mm"), 155, @"created a string table entry with a nil string");
    }
    v4->mString = (NSString *)[a3 copy];
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return [(NSString *)self->mString hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = (void *)*((void *)a3 + 2);
  mString = self->mString;

  return [v5 isEqual:mString];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"refCount: %d   mString: %@", self->super.mRefCount, self->mString];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataString;
  [(TSTTableDataString *)&v3 dealloc];
}

@end