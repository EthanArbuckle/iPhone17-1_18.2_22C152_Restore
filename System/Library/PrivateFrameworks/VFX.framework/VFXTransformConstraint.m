@interface VFXTransformConstraint
+ (BOOL)supportsSecureCoding;
+ (id)orientationConstraintInWorldSpace:(BOOL)a3 withBlock:(id)a4;
+ (id)positionConstraintInWorldSpace:(BOOL)a3 withBlock:(id)a4;
+ (id)transformConstraintInWorldSpace:(BOOL)a3 withBlock:(id)a4;
- (VFXTransformConstraint)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initOrientationInWorldSpace:(BOOL)a3 withBlock:(id)a4;
- (id)initPositionInWorld:(BOOL)a3 withBlock:(id)a4;
- (id)initTransformInWorld:(BOOL)a3 withBlock:(id)a4;
@end

@implementation VFXTransformConstraint

- (id)initTransformInWorld:(BOOL)a3 withBlock:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VFXTransformConstraint;
  v6 = [(VFXConstraint *)&v10 init];
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6616390;
    v8[3] = &unk_1E61458E8;
    BOOL v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__CFXConstraint *)sub_1B6608448(v8, @"transform");
  }
  return v6;
}

- (id)initPositionInWorld:(BOOL)a3 withBlock:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VFXTransformConstraint;
  v6 = [(VFXConstraint *)&v10 init];
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B66169C0;
    v8[3] = &unk_1E61458E8;
    BOOL v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__CFXConstraint *)sub_1B6608448(v8, @"translation");
  }
  return v6;
}

- (id)initOrientationInWorldSpace:(BOOL)a3 withBlock:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VFXTransformConstraint;
  v6 = [(VFXConstraint *)&v10 init];
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6616BB0;
    v8[3] = &unk_1E61458E8;
    BOOL v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__CFXConstraint *)sub_1B6608448(v8, @"quaternion");
  }
  return v6;
}

+ (id)transformConstraintInWorldSpace:(BOOL)a3 withBlock:(id)a4
{
  BOOL v5 = a3;
  v6 = [VFXTransformConstraint alloc];
  inited = objc_msgSend_initTransformInWorld_withBlock_(v6, v7, v5, (uint64_t)a4);

  return inited;
}

+ (id)positionConstraintInWorldSpace:(BOOL)a3 withBlock:(id)a4
{
  BOOL v5 = a3;
  v6 = [VFXTransformConstraint alloc];
  inited = objc_msgSend_initPositionInWorld_withBlock_(v6, v7, v5, (uint64_t)a4);

  return inited;
}

+ (id)orientationConstraintInWorldSpace:(BOOL)a3 withBlock:(id)a4
{
  BOOL v5 = a3;
  v6 = [VFXTransformConstraint alloc];
  inited = objc_msgSend_initOrientationInWorldSpace_withBlock_(v6, v7, v5, (uint64_t)a4);

  return inited;
}

- (VFXTransformConstraint)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VFXTransformConstraint;
  v4 = [(VFXConstraint *)&v8 init];
  if (v4)
  {
    v4->super._constraintRef = (__CFXConstraint *)sub_1B6608448(&unk_1F0FB6048, @"transform");
    objc_msgSend_finalizeDecodeConstraint_(v4, v5, (uint64_t)a3, v6);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  BOOL v5 = sub_1B660854C((uint64_t)self->super._constraintRef);
  objc_msgSend_setConstraintRef_(v4, v6, (uint64_t)v5, v7);
  CFRelease(v5);
  objc_msgSend_copyTo_(self, v8, (uint64_t)v4, v9);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end