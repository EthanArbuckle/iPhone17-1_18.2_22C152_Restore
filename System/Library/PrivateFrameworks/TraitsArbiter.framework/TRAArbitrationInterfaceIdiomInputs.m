@interface TRAArbitrationInterfaceIdiomInputs
- (BOOL)isPad;
- (TRAArbitrationInterfaceIdiomInputs)initWithIsPad:(BOOL)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation TRAArbitrationInterfaceIdiomInputs

- (TRAArbitrationInterfaceIdiomInputs)initWithIsPad:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TRAArbitrationInterfaceIdiomInputs;
  result = [(TRAArbitrationInterfaceIdiomInputs *)&v5 init];
  if (result) {
    result->_isPad = a3;
  }
  return result;
}

- (id)succinctDescription
{
  v2 = [(TRAArbitrationInterfaceIdiomInputs *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_isPad withName:@"isPad"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAArbitrationInterfaceIdiomInputs *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (BOOL)isPad
{
  return self->_isPad;
}

@end