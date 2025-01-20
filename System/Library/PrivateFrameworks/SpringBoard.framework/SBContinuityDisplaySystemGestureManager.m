@interface SBContinuityDisplaySystemGestureManager
- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3;
- (SBContinuityDisplaySystemGestureManager)initWithDisplayIdentity:(id)a3;
@end

@implementation SBContinuityDisplaySystemGestureManager

- (SBContinuityDisplaySystemGestureManager)initWithDisplayIdentity:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBContinuityDisplaySystemGestureManager.m", 22, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBContinuityDisplaySystemGestureManager;
  v6 = [(SBSystemGestureManager *)&v11 _initWithDisplayIdentity:v5];
  if (v6)
  {
    v7 = objc_alloc_init(SBFailingSystemGestureRecognizer);
    minimumViableGestureRecognizer = v6->_minimumViableGestureRecognizer;
    v6->_minimumViableGestureRecognizer = &v7->super;

    [(UIGestureRecognizer *)v6->_minimumViableGestureRecognizer setName:@"continuity.minimum-viable"];
    [(SBSystemGestureManager *)v6 addGestureRecognizer:v6->_minimumViableGestureRecognizer withType:138];
  }

  return v6;
}

- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3
{
  char v3 = a3 - 96;
  if (a3 - 96 > 0x2A) {
    return 0;
  }
  if (((1 << v3) & 0x40000000039) != 0) {
    return 1;
  }
  if (((1 << v3) & 0x3000000000) != 0) {
    return SBUIIsSystemApertureEnabled();
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end