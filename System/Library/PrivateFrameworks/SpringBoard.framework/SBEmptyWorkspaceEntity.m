@interface SBEmptyWorkspaceEntity
- (BOOL)isAnalogousToEntity:(id)a3;
- (BOOL)isEmptyWorkspaceEntity;
@end

@implementation SBEmptyWorkspaceEntity

- (BOOL)isEmptyWorkspaceEntity
{
  return 1;
}

- (BOOL)isAnalogousToEntity:(id)a3
{
  return [a3 isEmptyWorkspaceEntity];
}

@end