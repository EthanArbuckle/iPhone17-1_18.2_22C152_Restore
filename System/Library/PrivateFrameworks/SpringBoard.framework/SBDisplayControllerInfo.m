@interface SBDisplayControllerInfo
- (SBDisplayControllerInfo)initWithController:(id)a3 windowingMode:(int64_t)a4 priorityLevel:(unint64_t)a5 deactivationReasons:(unint64_t)a6;
- (SBDisplayControlling)displayController;
- (id)description;
- (int64_t)windowingMode;
- (unint64_t)deactivationReasons;
- (unint64_t)priorityLevel;
@end

@implementation SBDisplayControllerInfo

- (SBDisplayControllerInfo)initWithController:(id)a3 windowingMode:(int64_t)a4 priorityLevel:(unint64_t)a5 deactivationReasons:(unint64_t)a6
{
  id v12 = a3;
  if (!v12)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBDisplayControlling.m", 113, @"Invalid parameter not satisfying: %@", @"displayController" object file lineNumber description];
  }
  if (!SBDisplayAssertionLevelIsValid(a5))
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBDisplayControlling.m", 114, @"Invalid parameter not satisfying: %@", @"SBDisplayAssertionLevelIsValid(priorityLevel)" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SBDisplayControllerInfo;
  v13 = [(SBDisplayControllerInfo *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_displayController, a3);
    v14->_windowingMode = a4;
    v14->_priorityLevel = a5;
    v14->_deactivationReasons = a6;
  }

  return v14;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_displayController withName:@"displayController"];
  v5 = SBDisplayWindowingModeDescription(self->_windowingMode);
  [v3 appendString:v5 withName:@"windowingMode"];

  v6 = SBDisplayAssertionLevelDescription(self->_priorityLevel);
  [v3 appendString:v6 withName:@"priorityLevel"];

  v7 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
  v8 = [v7 description];
  [v3 appendString:v8 withName:@"deactivationReasons"];

  v9 = [v3 build];

  return v9;
}

- (SBDisplayControlling)displayController
{
  return self->_displayController;
}

- (int64_t)windowingMode
{
  return self->_windowingMode;
}

- (unint64_t)priorityLevel
{
  return self->_priorityLevel;
}

- (unint64_t)deactivationReasons
{
  return self->_deactivationReasons;
}

- (void).cxx_destruct
{
}

@end