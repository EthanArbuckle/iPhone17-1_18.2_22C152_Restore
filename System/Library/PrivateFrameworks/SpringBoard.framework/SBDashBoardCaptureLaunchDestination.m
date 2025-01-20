@interface SBDashBoardCaptureLaunchDestination
+ (id)launchDestinationWithPlacement:(id)a3 entity:(id)a4;
+ (id)new;
- (CSHostableEntity)entity;
- (NSString)placement;
- (SBDashBoardCaptureLaunchDestination)init;
- (SBDashBoardCaptureLaunchDestination)initWithPlacement:(id)a3 entity:(id)a4;
@end

@implementation SBDashBoardCaptureLaunchDestination

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_launchDestinationWithPlacement_entity_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SBDashBoardCaptureLaunchPolicy.m", 27, @"%s is unavailable; use %@ instead",
    "+[SBDashBoardCaptureLaunchDestination new]",
    v5);

  return 0;
}

- (SBDashBoardCaptureLaunchDestination)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithPlacement_entity_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBDashBoardCaptureLaunchPolicy.m", 31, @"%s is unavailable; use %@ instead",
    "-[SBDashBoardCaptureLaunchDestination init]",
    v5);

  return 0;
}

+ (id)launchDestinationWithPlacement:(id)a3 entity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithPlacement:v7 entity:v6];

  return v8;
}

- (SBDashBoardCaptureLaunchDestination)initWithPlacement:(id)a3 entity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardCaptureLaunchDestination;
  v9 = [(SBDashBoardCaptureLaunchDestination *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placement, a3);
    objc_storeStrong((id *)&v10->_entity, a4);
  }

  return v10;
}

- (NSString)placement
{
  return self->_placement;
}

- (CSHostableEntity)entity
{
  return self->_entity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_placement, 0);
}

@end