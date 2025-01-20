@interface SASPresentationState
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)presentationIdentifier;
- (SASPresentationState)initWithBuilder:(id)a3;
- (SASPresentationState)initWithCoder:(id)a3;
- (SASPresentationState)initWithPresentationIdentifier:(id)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SASPresentationState

- (SASPresentationState)initWithBuilder:(id)a3
{
  v4 = +[SASPresentationState newWithBuilder:a3];

  return v4;
}

- (SASPresentationState)initWithPresentationIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASPresentationState;
  v5 = [(SASPresentationState *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    presentationIdentifier = v5->_presentationIdentifier;
    v5->_presentationIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString alloc];
  v12.receiver = self;
  v12.super_class = (Class)SASPresentationState;
  id v4 = [(SASPresentationState *)&v12 description];
  id v5 = [NSString alloc];
  uint64_t v6 = [(NSString *)self->_presentationIdentifier description];
  v7 = (void *)[v5 initWithFormat:@"presentationIdentifier = %@", v6];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  objc_super v9 = [v8 componentsJoinedByString:@", "];
  v10 = (void *)[v3 initWithFormat:@"%@ {%@}", v4, v9];

  return v10;
}

- (unint64_t)hash
{
  return [(NSString *)self->_presentationIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SASPresentationState *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(SASPresentationState *)v4 presentationIdentifier];
      presentationIdentifier = self->_presentationIdentifier;
      BOOL v7 = presentationIdentifier == v5 || [(NSString *)presentationIdentifier isEqual:v5];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASPresentationState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASPresentationState::presentationIdentifier"];

  uint64_t v6 = [(SASPresentationState *)self initWithPresentationIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (void).cxx_destruct
{
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = (void (**)(id, _SASPresentationStateMutation *))a3;
  id v4 = objc_alloc_init(_SASPresentationStateMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  id v5 = [(_SASPresentationStateMutation *)v4 generate];

  return v5;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SASPresentationStateMutation *))a3;
  if (v4)
  {
    id v5 = [[_SASPresentationStateMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    uint64_t v6 = [(_SASPresentationStateMutation *)v5 generate];
  }
  else
  {
    uint64_t v6 = (void *)[(SASPresentationState *)self copy];
  }

  return v6;
}

@end