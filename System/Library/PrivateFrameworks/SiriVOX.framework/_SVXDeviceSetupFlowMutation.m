@interface _SVXDeviceSetupFlowMutation
- (_SVXDeviceSetupFlowMutation)init;
- (_SVXDeviceSetupFlowMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setIdentifier:(id)a3;
- (void)setScenes:(id)a3;
@end

@implementation _SVXDeviceSetupFlowMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
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
        v6 = self->_identifier;
      }
      else
      {
        v6 = [(SVXDeviceSetupFlow *)baseModel identifier];
      }
      v7 = v6;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
        v8 = self->_scenes;
      }
      else
      {
        v8 = [(SVXDeviceSetupFlow *)self->_baseModel scenes];
      }
      v9 = v8;
      v5 = [[SVXDeviceSetupFlow alloc] initWithIdentifier:v7 scenes:v8];

      goto LABEL_13;
    }
    v4 = (SVXDeviceSetupFlow *)[(SVXDeviceSetupFlow *)baseModel copy];
  }
  else
  {
    v4 = [[SVXDeviceSetupFlow alloc] initWithIdentifier:self->_identifier scenes:self->_scenes];
  }
  v5 = v4;
LABEL_13:

  return v5;
}

- (void)setScenes:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXDeviceSetupFlowMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceSetupFlowMutation;
  v6 = [(_SVXDeviceSetupFlowMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXDeviceSetupFlowMutation)init
{
  return [(_SVXDeviceSetupFlowMutation *)self initWithBaseModel:0];
}

@end