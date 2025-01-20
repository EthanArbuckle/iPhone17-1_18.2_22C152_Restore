@interface VFXEffectController
+ (BOOL)supportsSecureCoding;
- (NSString)tag;
- (VFXEffectController)initWithCoder:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation VFXEffectController

- (VFXEffectController)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VFXEffectController;
  v4 = [(VFXEffectController *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"rootIdentifier");
    objc_msgSend_setTag_(v4, v8, v7, v9);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)tag
{
  return self->tag;
}

- (void)setTag:(id)a3
{
}

@end