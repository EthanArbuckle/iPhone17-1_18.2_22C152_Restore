@interface TRAArbitrationAmbientPresentationInputs
- (BOOL)isAmbientPresented;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAmbientPresentationInputs:(id)a3;
- (TRAArbitrationAmbientPresentationInputs)initWithAmbientPresented:(BOOL)a3 ambientDisplayStyle:(int64_t)a4;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)ambientDisplayStyle;
@end

@implementation TRAArbitrationAmbientPresentationInputs

- (TRAArbitrationAmbientPresentationInputs)initWithAmbientPresented:(BOOL)a3 ambientDisplayStyle:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TRAArbitrationAmbientPresentationInputs;
  result = [(TRAArbitrationAmbientPresentationInputs *)&v7 init];
  if (result)
  {
    result->_ambientPresented = a3;
    result->_ambientDisplayStyle = a4;
  }
  return result;
}

- (BOOL)isEqualToAmbientPresentationInputs:(id)a3
{
  v5 = (TRAArbitrationAmbientPresentationInputs *)a3;
  if (!v5) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRAArbitration.m", 662, @"Invalid parameter not satisfying: %@", @"inputs == nil || [inputs isKindOfClass:[TRAArbitrationAmbientPresentationInputs class]]" object file lineNumber description];
  }
  if (self == v5)
  {
    BOOL v8 = 1;
    goto LABEL_9;
  }
  BOOL ambientPresented = self->_ambientPresented;
  if (ambientPresented == [(TRAArbitrationAmbientPresentationInputs *)v5 isAmbientPresented])
  {
    int64_t ambientDisplayStyle = self->_ambientDisplayStyle;
    BOOL v8 = ambientDisplayStyle == [(TRAArbitrationAmbientPresentationInputs *)v5 ambientDisplayStyle];
  }
  else
  {
LABEL_7:
    BOOL v8 = 0;
  }
LABEL_9:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRAArbitrationAmbientPresentationInputs *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TRAArbitrationAmbientPresentationInputs *)self isEqualToAmbientPresentationInputs:v4];
  }

  return v5;
}

- (id)succinctDescription
{
  v2 = [(TRAArbitrationAmbientPresentationInputs *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_ambientPresented withName:@"isAmbientPresented"];
  id v5 = (id)[v3 appendInteger:self->_ambientDisplayStyle withName:@"ambientDisplayStyle"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAArbitrationAmbientPresentationInputs *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (BOOL)isAmbientPresented
{
  return self->_ambientPresented;
}

- (int64_t)ambientDisplayStyle
{
  return self->_ambientDisplayStyle;
}

@end