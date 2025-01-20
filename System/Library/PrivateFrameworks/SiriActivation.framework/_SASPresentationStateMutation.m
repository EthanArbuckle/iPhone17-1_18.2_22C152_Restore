@interface _SASPresentationStateMutation
- (_SASPresentationStateMutation)init;
- (_SASPresentationStateMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setPresentationIdentifier:(id)a3;
@end

@implementation _SASPresentationStateMutation

- (_SASPresentationStateMutation)init
{
  return [(_SASPresentationStateMutation *)self initWithBaseModel:0];
}

- (_SASPresentationStateMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SASPresentationStateMutation;
  v6 = [(_SASPresentationStateMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (void)setPresentationIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (baseModel)
  {
    if (*(unsigned char *)&self->_mutationFlags)
    {
      if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
      {
        v6 = self->_presentationIdentifier;
      }
      else
      {
        v6 = [(SASPresentationState *)baseModel presentationIdentifier];
      }
      v7 = v6;
      id v5 = [[SASPresentationState alloc] initWithPresentationIdentifier:v6];

      goto LABEL_10;
    }
    v4 = (SASPresentationState *)[(SASPresentationState *)baseModel copy];
  }
  else
  {
    v4 = [[SASPresentationState alloc] initWithPresentationIdentifier:self->_presentationIdentifier];
  }
  id v5 = v4;
LABEL_10:
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationIdentifier, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end