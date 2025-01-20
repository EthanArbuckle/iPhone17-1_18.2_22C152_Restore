@interface SXFloatDataFormat
- (int64_t)decimalsWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXFloatDataFormat

- (int64_t)decimalsWithValue:(id)a3 withType:(int)a4
{
  if (!a3 || a4 != 2) {
    return 2;
  }
  uint64_t v6 = objc_msgSend(a3, "integerValue", v4, v5);
  return v6 & ~(v6 >> 63);
}

@end