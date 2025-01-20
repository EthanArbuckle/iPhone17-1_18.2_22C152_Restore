@interface _UIConstantConstraintSet
- (NSArray)constraints;
- (_UIConstantConstraintSet)initWithConstraints:(id)a3;
@end

@implementation _UIConstantConstraintSet

- (_UIConstantConstraintSet)initWithConstraints:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIConstantConstraintSet;
  v6 = [(_UIConstantConstraintSet *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_constraints, a3);
  }

  return v7;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void).cxx_destruct
{
}

@end