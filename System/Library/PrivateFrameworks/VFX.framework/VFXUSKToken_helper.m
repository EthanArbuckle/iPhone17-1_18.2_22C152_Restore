@interface VFXUSKToken_helper
+ (id)tokenWithString:(id)a3;
@end

@implementation VFXUSKToken_helper

+ (id)tokenWithString:(id)a3
{
  id v4 = objc_alloc((Class)qword_1E9DDBAF8);
  v7 = objc_msgSend_initWithString_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

@end