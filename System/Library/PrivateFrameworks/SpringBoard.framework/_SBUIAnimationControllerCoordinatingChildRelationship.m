@interface _SBUIAnimationControllerCoordinatingChildRelationship
- (SBUIAnimationControllerCoordinating)coordinatingChildTransaction;
- (_SBUIAnimationControllerCoordinatingChildRelationship)initWithCoordinatingChildTransaction:(id)a3 schedulingPolicy:(unint64_t)a4;
- (unint64_t)schedulingPolicy;
@end

@implementation _SBUIAnimationControllerCoordinatingChildRelationship

- (void).cxx_destruct
{
}

- (_SBUIAnimationControllerCoordinatingChildRelationship)initWithCoordinatingChildTransaction:(id)a3 schedulingPolicy:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBUIAnimationController.m", 78, @"Invalid parameter not satisfying: %@", @"coordinatingChildTransaction" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_SBUIAnimationControllerCoordinatingChildRelationship;
  v9 = [(_SBUIAnimationControllerCoordinatingChildRelationship *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coordinatingChildTransaction, a3);
    v10->_schedulingPolicy = a4;
  }

  return v10;
}

- (unint64_t)schedulingPolicy
{
  return self->_schedulingPolicy;
}

- (SBUIAnimationControllerCoordinating)coordinatingChildTransaction
{
  return self->_coordinatingChildTransaction;
}

@end