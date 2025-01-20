@interface RBSDurationAttribute
+ (id)attributeWithDuration:(double)a3 warningDuration:(double)a4 startPolicy:(unint64_t)a5 endPolicy:(unint64_t)a6;
+ (id)invalidateAfterInterval:(double)a3;
+ (id)terminateAfterInterval:(double)a3;
- (BOOL)isEqual:(id)a3;
- (RBSDurationAttribute)initWithRBSXPCCoder:(id)a3;
- (double)invalidationDuration;
- (double)warningDuration;
- (id)_initWithInvalidationDuration:(unint64_t)a3 warningDuration:(double)a4 startPolicy:(double)a5 endPolicy:;
- (id)description;
- (unint64_t)endPolicy;
- (unint64_t)hash;
- (unint64_t)startPolicy;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setEndPolicy:(unint64_t)a3;
- (void)setInvalidationDuration:(double)a3;
- (void)setStartPolicy:(unint64_t)a3;
- (void)setWarningDuration:(double)a3;
@end

@implementation RBSDurationAttribute

- (unint64_t)startPolicy
{
  return self->_startPolicy;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_endPolicy ^ self->_startPolicy;
  v4 = [NSNumber numberWithDouble:self->_invalidationDuration];
  uint64_t v5 = v3 ^ [v4 hash];
  v6 = [NSNumber numberWithDouble:self->_warningDuration];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSDurationAttribute;
  BOOL v5 = [(RBSAttribute *)&v7 isEqual:v4]
    && self->_startPolicy == *((void *)v4 + 3)
    && self->_endPolicy == *((void *)v4 + 4)
    && vabdd_f64(self->_invalidationDuration, *((double *)v4 + 1)) < 0.00000011920929
    && vabdd_f64(self->_warningDuration, *((double *)v4 + 2)) < 0.00000011920929;

  return v5;
}

- (double)warningDuration
{
  return self->_warningDuration;
}

- (double)invalidationDuration
{
  return self->_invalidationDuration;
}

- (unint64_t)endPolicy
{
  return self->_endPolicy;
}

+ (id)terminateAfterInterval:(double)a3
{
  return (id)[a1 attributeWithDuration:1 warningDuration:2 startPolicy:a3 endPolicy:0.0];
}

+ (id)invalidateAfterInterval:(double)a3
{
  return (id)[a1 attributeWithDuration:1 warningDuration:1 startPolicy:a3 endPolicy:0.0];
}

+ (id)attributeWithDuration:(double)a3 warningDuration:(double)a4 startPolicy:(unint64_t)a5 endPolicy:(unint64_t)a6
{
  id v6 = -[RBSDurationAttribute _initWithInvalidationDuration:warningDuration:startPolicy:endPolicy:]([RBSDurationAttribute alloc], a5, a6, a3, a4);
  return v6;
}

- (id)_initWithInvalidationDuration:(unint64_t)a3 warningDuration:(double)a4 startPolicy:(double)a5 endPolicy:
{
  if (result)
  {
    v9 = result;
    if (a4 < 0.0)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_ object:v9 file:@"RBSDurationAttribute.m" lineNumber:121 description:@"Initialized with invalid invalidationDuration"];
    }
    if (a5 < 0.0 || a5 >= a4)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_ object:v9 file:@"RBSDurationAttribute.m" lineNumber:122 description:@"Initialized with invalid warningDuration"];
    }
    if ((unint64_t)(a2 - 104) <= 0xFFFFFFFFFFFFFF98)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_ object:v9 file:@"RBSDurationAttribute.m" lineNumber:123 description:@"Initialized with invalid startPolicy"];
    }
    if (a3 >= 3)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel__initWithInvalidationDuration_warningDuration_startPolicy_endPolicy_ object:v9 file:@"RBSDurationAttribute.m" lineNumber:124 description:@"Initialized with invalid endPolicy"];
    }
    v15.receiver = v9;
    v15.super_class = (Class)RBSDurationAttribute;
    result = objc_msgSendSuper2(&v15, sel__init);
    if (result)
    {
      *((double *)result + 1) = a4;
      *((double *)result + 2) = a5;
      *((void *)result + 3) = a2;
      *((void *)result + 4) = a3;
    }
  }
  return result;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  double invalidationDuration = self->_invalidationDuration;
  double warningDuration = self->_warningDuration;
  objc_super v7 = NSStringFromRBSDurationStartPolicy(self->_startPolicy);
  v8 = NSStringFromRBSDurationEndPolicy(self->_endPolicy);
  v9 = (void *)[v3 initWithFormat:@"<%@| invalidationDuration:%.2f warningDuration:%.2f startPolicy:%@ endPolicy:%@>", v4, *(void *)&invalidationDuration, *(void *)&warningDuration, v7, v8];

  return v9;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSDurationAttribute;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  [(RBSDurationAttribute *)self invalidationDuration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"invalidationDuration");
  [(RBSDurationAttribute *)self warningDuration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"warningDuration");
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSDurationAttribute startPolicy](self, "startPolicy"), @"startPolicy");
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSDurationAttribute endPolicy](self, "endPolicy"), @"endPolicy");
}

- (RBSDurationAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSDurationAttribute;
  objc_super v5 = [(RBSAttribute *)&v7 initWithRBSXPCCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"invalidationDuration"];
    -[RBSDurationAttribute setInvalidationDuration:](v5, "setInvalidationDuration:");
    [v4 decodeDoubleForKey:@"warningDuration"];
    -[RBSDurationAttribute setWarningDuration:](v5, "setWarningDuration:");
    -[RBSDurationAttribute setStartPolicy:](v5, "setStartPolicy:", [v4 decodeInt64ForKey:@"startPolicy"]);
    -[RBSDurationAttribute setEndPolicy:](v5, "setEndPolicy:", [v4 decodeInt64ForKey:@"endPolicy"]);
  }

  return v5;
}

- (void)setInvalidationDuration:(double)a3
{
  self->_double invalidationDuration = a3;
}

- (void)setWarningDuration:(double)a3
{
  self->_double warningDuration = a3;
}

- (void)setStartPolicy:(unint64_t)a3
{
  self->_startPolicy = a3;
}

- (void)setEndPolicy:(unint64_t)a3
{
  self->_endPolicy = a3;
}

@end