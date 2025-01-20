@interface TUIAnimationGroupRenderModelCollection
- (NSDictionary)groupPhases;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setGroupPhases:(id)a3;
@end

@implementation TUIAnimationGroupRenderModelCollection

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TUIAnimationGroupRenderModelCollection allocWithZone:a3] init];
  if (v4)
  {
    v5 = (NSDictionary *)[(NSDictionary *)self->_groupPhases copy];
    groupPhases = v4->_groupPhases;
    v4->_groupPhases = v5;
  }
  return v4;
}

- (NSDictionary)groupPhases
{
  return self->_groupPhases;
}

- (void)setGroupPhases:(id)a3
{
}

- (void).cxx_destruct
{
}

@end