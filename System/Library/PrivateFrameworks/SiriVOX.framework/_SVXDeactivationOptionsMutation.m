@interface _SVXDeactivationOptionsMutation
- (_SVXDeactivationOptionsMutation)init;
- (_SVXDeactivationOptionsMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setAudioSessionDeactivationDelay:(double)a3;
@end

@implementation _SVXDeactivationOptionsMutation

- (void).cxx_destruct
{
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (baseModel)
  {
    if ((*(unsigned char *)&self->_mutationFlags & 1) == 0)
    {
      v4 = (SVXDeactivationOptions *)[(SVXDeactivationOptions *)baseModel copy];
      goto LABEL_10;
    }
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      double audioSessionDeactivationDelay = self->_audioSessionDeactivationDelay;
    }
    else
    {
      [(SVXDeactivationOptions *)baseModel audioSessionDeactivationDelay];
      double audioSessionDeactivationDelay = v7;
    }
    v5 = [SVXDeactivationOptions alloc];
    double v6 = audioSessionDeactivationDelay;
  }
  else
  {
    v5 = [SVXDeactivationOptions alloc];
    double v6 = self->_audioSessionDeactivationDelay;
  }
  v4 = [(SVXDeactivationOptions *)v5 initWithAudioSessionDeactivationDelay:v6];
LABEL_10:

  return v4;
}

- (void)setAudioSessionDeactivationDelay:(double)a3
{
  self->_double audioSessionDeactivationDelay = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXDeactivationOptionsMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeactivationOptionsMutation;
  double v6 = [(_SVXDeactivationOptionsMutation *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXDeactivationOptionsMutation)init
{
  return [(_SVXDeactivationOptionsMutation *)self initWithBaseModel:0];
}

@end