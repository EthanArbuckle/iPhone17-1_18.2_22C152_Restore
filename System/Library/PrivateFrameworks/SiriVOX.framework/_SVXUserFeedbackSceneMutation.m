@interface _SVXUserFeedbackSceneMutation
- (_SVXUserFeedbackSceneMutation)init;
- (_SVXUserFeedbackSceneMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setDuration:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setNodes:(id)a3;
@end

@implementation _SVXUserFeedbackSceneMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = [[SVXUserFeedbackScene alloc] initWithIdentifier:self->_identifier duration:self->_nodes nodes:self->_duration];
    goto LABEL_5;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXUserFeedbackScene *)[(SVXUserFeedbackScene *)baseModel copy];
LABEL_5:
    v5 = v4;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_identifier;
  }
  else
  {
    v6 = [(SVXUserFeedbackScene *)baseModel identifier];
  }
  v7 = v6;
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    double duration = self->_duration;
    if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    v10 = [(SVXUserFeedbackScene *)self->_baseModel nodes];
    goto LABEL_14;
  }
  [(SVXUserFeedbackScene *)self->_baseModel duration];
  double duration = v8;
  if ((*(unsigned char *)&self->_mutationFlags & 8) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  v10 = self->_nodes;
LABEL_14:
  v11 = v10;
  v5 = [[SVXUserFeedbackScene alloc] initWithIdentifier:v7 duration:v10 nodes:duration];

LABEL_15:

  return v5;
}

- (void)setNodes:(id)a3
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

- (_SVXUserFeedbackSceneMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXUserFeedbackSceneMutation;
  v6 = [(_SVXUserFeedbackSceneMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXUserFeedbackSceneMutation)init
{
  return [(_SVXUserFeedbackSceneMutation *)self initWithBaseModel:0];
}

@end