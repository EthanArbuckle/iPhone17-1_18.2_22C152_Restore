@interface TRAPreferencesTreeNodeSpecification
- (BOOL)isEqual:(id)a3;
- (TRAParticipant)parentParticipant;
- (TRAParticipant)participant;
- (TRAPreferencesTreeNodeSpecification)initWithParticipant:(id)a3 parentParticipant:(id)a4;
- (double)order;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setOrder:(double)a3;
- (void)setParentParticipant:(id)a3;
- (void)setParticipant:(id)a3;
@end

@implementation TRAPreferencesTreeNodeSpecification

- (void)setOrder:(double)a3
{
  self->_order = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentParticipant, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

- (TRAPreferencesTreeNodeSpecification)initWithParticipant:(id)a3 parentParticipant:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (v8 == v9)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRAPreferencesTree.m", 347, @"Invalid parameter not satisfying: %@", @"participant != parentParticipant" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)TRAPreferencesTreeNodeSpecification;
  v10 = [(TRAPreferencesTreeNodeSpecification *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_participant, a3);
    objc_storeStrong((id *)&v11->_parentParticipant, a4);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRAPreferencesTreeNodeSpecification *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if (v4 == self)
  {
    BOOL v12 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    v7 = [(TRAPreferencesTreeNodeSpecification *)v6 participant];
    id v8 = [(TRAPreferencesTreeNodeSpecification *)self participant];

    id v9 = [(TRAPreferencesTreeNodeSpecification *)v6 parentParticipant];

    v10 = [(TRAPreferencesTreeNodeSpecification *)self parentParticipant];

    BOOL v12 = v7 == v8 && v9 == v10;
  }
  else
  {
LABEL_10:
    BOOL v12 = 0;
  }
LABEL_12:

  return v12;
}

- (TRAParticipant)parentParticipant
{
  return self->_parentParticipant;
}

- (TRAParticipant)participant
{
  return self->_participant;
}

- (double)order
{
  return self->_order;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_participant);
    objc_storeStrong(v5 + 2, self->_parentParticipant);
    v5[3] = *(id *)&self->_order;
  }
  return v5;
}

- (id)succinctDescription
{
  v2 = [(TRAPreferencesTreeNodeSpecification *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = NSString;
  v5 = [(TRAParticipant *)self->_participant uniqueIdentifier];
  parentParticipant = self->_parentParticipant;
  if (parentParticipant)
  {
    v7 = [(TRAParticipant *)parentParticipant uniqueIdentifier];
  }
  else
  {
    v7 = @"root";
  }
  id v8 = [v4 stringWithFormat:@"%@ → %@", v5, v7];
  [v3 appendString:v8 withName:0];

  if (parentParticipant) {
  return v3;
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAPreferencesTreeNodeSpecification *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (void)setParticipant:(id)a3
{
}

- (void)setParentParticipant:(id)a3
{
}

@end