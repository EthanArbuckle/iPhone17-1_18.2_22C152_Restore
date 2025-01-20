@interface SBSceneSnapshotRequest
- (NSString)description;
- (SBSceneSnapshotRequest)initWithSize:(unint64_t)a3 orientation:(unint64_t)a4 userInterfaceStyle:(unint64_t)a5;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)orientation;
- (unint64_t)size;
- (unint64_t)userInterfaceStyle;
@end

@implementation SBSceneSnapshotRequest

- (SBSceneSnapshotRequest)initWithSize:(unint64_t)a3 orientation:(unint64_t)a4 userInterfaceStyle:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SBSceneSnapshotRequest;
  result = [(SBSceneSnapshotRequest *)&v9 init];
  if (result)
  {
    result->_size = a3;
    result->_orientation = a4;
    result->_userInterfaceStyle = a5;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[(SBSceneSnapshotRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSceneSnapshotRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = v3;
  unint64_t v5 = self->_size - 1;
  if (v5 > 5) {
    v6 = @"current";
  }
  else {
    v6 = off_1E6B00460[v5];
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"size"];
  unint64_t v8 = self->_orientation - 1;
  objc_super v9 = @"current";
  if (v8 <= 3) {
    objc_super v9 = off_1E6B00490[v8];
  }
  id v10 = (id)[v4 appendObject:v9 withName:@"orientation"];
  if (self->_userInterfaceStyle) {
    v11 = @"both";
  }
  else {
    v11 = @"current";
  }
  id v12 = (id)[v4 appendObject:v11 withName:@"userInterfaceStyle"];
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSceneSnapshotRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

@end