@interface SXConditionalHints
- (int64_t)ternaryValueForJSONValue:(id)a3 type:(int)a4;
@end

@implementation SXConditionalHints

- (int64_t)ternaryValueForJSONValue:(id)a3 type:(int)a4
{
  if (a4 == 2) {
    return objc_msgSend(a3, "BOOLValue", v4, v5);
  }
  else {
    return -1;
  }
}

@end