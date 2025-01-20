@interface RBSCPUMinimumUsageGrant
+ (id)grantForRole:(unsigned __int8)a3 withPercentage:(unint64_t)a4 duration:(double)a5;
- (BOOL)isEqual:(id)a3;
- (RBSCPUMinimumUsageGrant)initWithRBSXPCCoder:(id)a3;
- (double)duration;
- (id)_initWithRole:(unint64_t)a3 percentage:(double)a4 duration:;
- (id)description;
- (unint64_t)hash;
- (unint64_t)percentage;
- (unsigned)role;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSCPUMinimumUsageGrant

+ (id)grantForRole:(unsigned __int8)a3 withPercentage:(unint64_t)a4 duration:(double)a5
{
  id v5 = -[RBSCPUMinimumUsageGrant _initWithRole:percentage:duration:]([RBSCPUMinimumUsageGrant alloc], a3, a4, a5);
  return v5;
}

- (id)_initWithRole:(unint64_t)a3 percentage:(double)a4 duration:
{
  if (result)
  {
    v7 = result;
    if ((a2 & 0xFC) != 4)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__initWithRole_percentage_duration_ object:v7 file:@"RBSCPUMinimumUsageGrant.m" lineNumber:92 description:@"initialized with invalid role"];
    }
    if (a4 <= 0.0)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__initWithRole_percentage_duration_ object:v7 file:@"RBSCPUMinimumUsageGrant.m" lineNumber:93 description:@"initialized with invalid duration"];
    }
    if (a3 >= 0x65)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__initWithRole_percentage_duration_ object:v7 file:@"RBSCPUMinimumUsageGrant.m" lineNumber:94 description:@"initialized with invalid percentage"];
    }
    v11.receiver = v7;
    v11.super_class = (Class)RBSCPUMinimumUsageGrant;
    result = objc_msgSendSuper2(&v11, sel__init);
    if (result)
    {
      *((unsigned char *)result + 8) = a2;
      *((void *)result + 2) = a3;
      *((double *)result + 3) = a4;
    }
  }
  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSCPUMinimumUsageGrant;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, @"role", v5.receiver, v5.super_class);
  [v4 encodeUInt64:self->_percentage forKey:@"percentage"];
  [v4 encodeDouble:@"duration" forKey:self->_duration];
}

- (RBSCPUMinimumUsageGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSCPUMinimumUsageGrant;
  objc_super v5 = [(RBSAttribute *)&v8 initWithRBSXPCCoder:v4];
  if (v5)
  {
    v5->_role = [v4 decodeInt64ForKey:@"role"];
    v5->_percentage = [v4 decodeUInt64ForKey:@"percentage"];
    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v6;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSCPUMinimumUsageGrant;
  BOOL v5 = [(RBSAttribute *)&v7 isEqual:v4]
    && self->_role == *((unsigned __int8 *)v4 + 8)
    && self->_percentage == *((void *)v4 + 2)
    && self->_duration == v4[3];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_percentage ^ self->_role;
  v3 = [NSNumber numberWithDouble:self->_duration];
  unint64_t v4 = v2 ^ [v3 hash];

  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  unint64_t v4 = [(id)objc_opt_class() description];
  BOOL v5 = NSStringFromRBSRole(self->_role);
  double v6 = (void *)[v3 initWithFormat:@"<%@| role:%@ percentage:%lu duration:%.2f>", v4, v5, self->_percentage, *(void *)&self->_duration];

  return v6;
}

- (unint64_t)percentage
{
  return self->_percentage;
}

- (double)duration
{
  return self->_duration;
}

- (unsigned)role
{
  return self->_role;
}

@end