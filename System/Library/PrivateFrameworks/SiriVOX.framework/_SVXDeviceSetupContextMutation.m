@interface _SVXDeviceSetupContextMutation
- (_SVXDeviceSetupContextMutation)init;
- (_SVXDeviceSetupContextMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setBeginDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setFlowScene:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation _SVXDeviceSetupContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_flowScene, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = [[SVXDeviceSetupContext alloc] initWithTimestamp:self->_timestamp options:self->_options flowScene:self->_flowScene beginDate:self->_beginDate endDate:self->_endDate];
    goto LABEL_5;
  }
  if (*(unsigned char *)&self->_mutationFlags)
  {
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      unint64_t timestamp = self->_timestamp;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
        goto LABEL_8;
      }
    }
    else
    {
      unint64_t timestamp = [(SVXDeviceSetupContext *)baseModel timestamp];
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
LABEL_8:
        v7 = self->_options;
LABEL_11:
        v8 = v7;
        if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
        {
          v9 = self->_flowScene;
        }
        else
        {
          v9 = [(SVXDeviceSetupContext *)self->_baseModel flowScene];
        }
        v10 = v9;
        if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
        {
          v11 = self->_beginDate;
        }
        else
        {
          v11 = [(SVXDeviceSetupContext *)self->_baseModel beginDate];
        }
        v12 = v11;
        if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
        {
          v13 = self->_endDate;
        }
        else
        {
          v13 = [(SVXDeviceSetupContext *)self->_baseModel endDate];
        }
        v14 = v13;
        v5 = [[SVXDeviceSetupContext alloc] initWithTimestamp:timestamp options:v8 flowScene:v10 beginDate:v12 endDate:v13];

        goto LABEL_21;
      }
    }
    v7 = [(SVXDeviceSetupContext *)self->_baseModel options];
    goto LABEL_11;
  }
  v4 = (SVXDeviceSetupContext *)[(SVXDeviceSetupContext *)baseModel copy];
LABEL_5:
  v5 = v4;
LABEL_21:

  return v5;
}

- (void)setEndDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (void)setBeginDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (void)setFlowScene:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setOptions:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_unint64_t timestamp = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXDeviceSetupContextMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceSetupContextMutation;
  v6 = [(_SVXDeviceSetupContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXDeviceSetupContextMutation)init
{
  return [(_SVXDeviceSetupContextMutation *)self initWithBaseModel:0];
}

@end