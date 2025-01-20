@interface SXJSONDocumentLayout
- (int64_t)gutterWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXJSONDocumentLayout

- (int64_t)gutterWithValue:(id)a3 withType:(int)a4
{
  if (a4 != 2) {
    return 0;
  }
  uint64_t v6 = objc_msgSend(a3, "integerValue", v4, v5);
  uint64_t v7 = v6 & 1;
  if (v6 < 0) {
    uint64_t v7 = -v7;
  }
  return v7 + v6;
}

@end