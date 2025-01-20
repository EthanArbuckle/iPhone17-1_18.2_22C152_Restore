@interface NSSortDescriptor(Conversion)
- (id)FCCKPQuerySort;
@end

@implementation NSSortDescriptor(Conversion)

- (id)FCCKPQuerySort
{
  uint64_t v2 = objc_opt_new();
  int v3 = [a1 ascending];
  if (v2)
  {
    if (v3) {
      int v4 = 1;
    }
    else {
      int v4 = 2;
    }
    *(unsigned char *)(v2 + 20) |= 1u;
    *(_DWORD *)(v2 + 16) = v4;
  }
  v5 = [a1 key];
  v6 = FCCKPRecordFieldIdentifierForUserFieldName(v5);
  -[FCCKPQuerySort setFieldName:](v2, v6);

  return (id)v2;
}

@end