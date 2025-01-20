@interface RBSConstraintsAttribute
+ (id)attributeWithConstraints:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (RBSConstraintsAttribute)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)constraints;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSConstraintsAttribute

+ (id)attributeWithConstraints:(unint64_t)a3
{
  v4 = [RBSConstraintsAttribute alloc];
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)RBSConstraintsAttribute;
    v4 = (RBSConstraintsAttribute *)objc_msgSendSuper2(&v6, sel__init);
    if (v4) {
      v4->_constraints = a3;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSConstraintsAttribute;
  BOOL v6 = 0;
  if ([(RBSAttribute *)&v8 isEqual:v4])
  {
    unint64_t v5 = [(RBSConstraintsAttribute *)self constraints];
    if (v5 == [v4 constraints]) {
      BOOL v6 = 1;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_constraints;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  unint64_t v5 = (void *)[v3 initWithFormat:@"<%@| constraints:%x>", v4, self->_constraints];

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSConstraintsAttribute;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_constraints, @"_constraints", v5.receiver, v5.super_class);
}

- (RBSConstraintsAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSConstraintsAttribute;
  objc_super v5 = [(RBSAttribute *)&v7 initWithRBSXPCCoder:v4];
  if (v5) {
    v5->_constraints = [v4 decodeUInt64ForKey:@"_constraints"];
  }

  return v5;
}

- (unint64_t)constraints
{
  return self->_constraints;
}

@end