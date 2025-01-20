@interface SBPreviousWorkspaceEntity
+ (id)entityWithPreviousLayoutRole:(int64_t)a3;
- (BOOL)isPreviousWorkspaceEntity;
- (SBPreviousWorkspaceEntity)initWithIdentifier:(id)a3 displayChangeSettings:(id)a4;
- (SBPreviousWorkspaceEntity)initWithPreviousLayoutRole:(int64_t)a3;
- (id)succinctDescriptionBuilder;
- (int64_t)previousLayoutRole;
@end

@implementation SBPreviousWorkspaceEntity

+ (id)entityWithPreviousLayoutRole:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithPreviousLayoutRole:a3];
  return v3;
}

- (SBPreviousWorkspaceEntity)initWithPreviousLayoutRole:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBPreviousWorkspaceEntity;
  result = [(SBWorkspaceEntity *)&v5 initWithIdentifier:0 displayChangeSettings:0];
  if (result) {
    result->_previousLayoutRole = a3;
  }
  return result;
}

- (SBPreviousWorkspaceEntity)initWithIdentifier:(id)a3 displayChangeSettings:(id)a4
{
  return -[SBPreviousWorkspaceEntity initWithPreviousLayoutRole:](self, "initWithPreviousLayoutRole:", 0, a4);
}

- (BOOL)isPreviousWorkspaceEntity
{
  return 1;
}

- (id)succinctDescriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)SBPreviousWorkspaceEntity;
  v3 = [(SBWorkspaceEntity *)&v7 succinctDescriptionBuilder];
  v4 = SBLayoutRoleDescription(self->_previousLayoutRole);
  id v5 = (id)[v3 appendObject:v4 withName:@"previousLayoutRole"];

  return v3;
}

- (int64_t)previousLayoutRole
{
  return self->_previousLayoutRole;
}

@end