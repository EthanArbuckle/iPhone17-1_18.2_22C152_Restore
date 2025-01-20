@interface VFXUSKObjectPath_helper
+ (id)objectPathWithString:(id)a3;
@end

@implementation VFXUSKObjectPath_helper

+ (id)objectPathWithString:(id)a3
{
  id v4 = objc_alloc((Class)qword_1E9DDBB00);
  v7 = objc_msgSend_initWithString_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

@end