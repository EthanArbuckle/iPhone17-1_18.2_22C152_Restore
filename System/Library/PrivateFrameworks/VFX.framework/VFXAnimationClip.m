@interface VFXAnimationClip
+ (BOOL)supportsSecureCoding;
+ (id)clipWithAnimation:(id)a3 name:(id)a4;
- (NSString)identifier;
- (NSString)name;
- (VFXAnimation)animation;
- (VFXAnimationClip)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
@end

@implementation VFXAnimationClip

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)clipWithAnimation:(id)a3 name:(id)a4
{
  v6 = objc_alloc_init(VFXAnimationClip);
  objc_msgSend_setName_(v6, v7, (uint64_t)a4, v8);
  v12 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v9, v10, v11);
  v6->_identifier = (NSString *)(id)objc_msgSend_UUIDString(v12, v13, v14, v15);
  v6->_animation = (VFXAnimation *)a3;

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXAnimationClip;
  [(VFXAnimationClip *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (id)objc_msgSend_copy(self->_animation, a2, (uint64_t)a3, v3);
  id v9 = (id)objc_msgSend_copy(self->_name, v6, v7, v8);
  uint64_t v11 = objc_msgSend_clipWithAnimation_name_(VFXAnimationClip, v10, (uint64_t)v5, (uint64_t)v9);

  return v11;
}

- (VFXAnimationClip)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VFXAnimationClip;
  v4 = [(VFXAnimationClip *)&v12 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"name");
    uint64_t v7 = objc_opt_class();
    v4->_identifier = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"identifier");
    uint64_t v9 = objc_opt_class();
    v4->_animation = (VFXAnimation *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, @"animation");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  if (name) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)name, @"name");
  }
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_identifier, @"name");
  animation = self->_animation;

  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)animation, @"animation");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VFXAnimation)animation
{
  return self->_animation;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

@end