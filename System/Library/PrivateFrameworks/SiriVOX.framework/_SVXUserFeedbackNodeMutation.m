@interface _SVXUserFeedbackNodeMutation
- (_SVXUserFeedbackNodeMutation)init;
- (_SVXUserFeedbackNodeMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setDependentNodes:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFeedback:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation _SVXUserFeedbackNodeMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentNodes, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = [[SVXUserFeedbackNode alloc] initWithIdentifier:self->_identifier duration:self->_feedback feedback:self->_dependentNodes dependentNodes:self->_duration];
    goto LABEL_5;
  }
  if (*(unsigned char *)&self->_mutationFlags)
  {
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      v6 = self->_identifier;
    }
    else
    {
      v6 = [(SVXUserFeedbackNode *)baseModel identifier];
    }
    v7 = v6;
    if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
    {
      double duration = self->_duration;
      if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
        goto LABEL_11;
      }
    }
    else
    {
      [(SVXUserFeedbackNode *)self->_baseModel duration];
      double duration = v8;
      if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
      {
LABEL_11:
        v10 = self->_feedback;
LABEL_14:
        v11 = v10;
        if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
        {
          v12 = self->_dependentNodes;
        }
        else
        {
          v12 = [(SVXUserFeedbackNode *)self->_baseModel dependentNodes];
        }
        v13 = v12;
        v5 = [[SVXUserFeedbackNode alloc] initWithIdentifier:v7 duration:v11 feedback:v12 dependentNodes:duration];

        goto LABEL_18;
      }
    }
    v10 = [(SVXUserFeedbackNode *)self->_baseModel feedback];
    goto LABEL_14;
  }
  v4 = (SVXUserFeedbackNode *)[(SVXUserFeedbackNode *)baseModel copy];
LABEL_5:
  v5 = v4;
LABEL_18:

  return v5;
}

- (void)setDependentNodes:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (void)setFeedback:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXUserFeedbackNodeMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXUserFeedbackNodeMutation;
  v6 = [(_SVXUserFeedbackNodeMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXUserFeedbackNodeMutation)init
{
  return [(_SVXUserFeedbackNodeMutation *)self initWithBaseModel:0];
}

@end