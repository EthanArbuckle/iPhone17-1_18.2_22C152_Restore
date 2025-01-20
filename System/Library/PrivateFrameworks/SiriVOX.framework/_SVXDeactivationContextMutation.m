@interface _SVXDeactivationContextMutation
- (_SVXDeactivationContextMutation)init;
- (_SVXDeactivationContextMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setButtonEvent:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _SVXDeactivationContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_buttonEvent, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = [[SVXDeactivationContext alloc] initWithSource:self->_source timestamp:self->_timestamp buttonEvent:self->_buttonEvent clientInfo:self->_clientInfo userInfo:self->_userInfo options:self->_options];
    goto LABEL_5;
  }
  char mutationFlags = (char)self->_mutationFlags;
  if (mutationFlags)
  {
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      int64_t source = self->_source;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
LABEL_8:
        unint64_t timestamp = self->_timestamp;
        if ((mutationFlags & 8) != 0)
        {
LABEL_9:
          v9 = self->_buttonEvent;
LABEL_13:
          v10 = v9;
          if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
          {
            v11 = self->_clientInfo;
          }
          else
          {
            v11 = [(SVXDeactivationContext *)self->_baseModel clientInfo];
          }
          v12 = v11;
          if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
          {
            v13 = self->_userInfo;
          }
          else
          {
            v13 = [(SVXDeactivationContext *)self->_baseModel userInfo];
          }
          v14 = v13;
          if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0)
          {
            v15 = self->_options;
          }
          else
          {
            v15 = [(SVXDeactivationContext *)self->_baseModel options];
          }
          v16 = v15;
          v6 = [[SVXDeactivationContext alloc] initWithSource:source timestamp:timestamp buttonEvent:v10 clientInfo:v12 userInfo:v14 options:v15];

          goto LABEL_23;
        }
LABEL_12:
        v9 = [(SVXDeactivationContext *)self->_baseModel buttonEvent];
        goto LABEL_13;
      }
    }
    else
    {
      int64_t source = [(SVXDeactivationContext *)baseModel source];
      char mutationFlags = (char)self->_mutationFlags;
      if ((mutationFlags & 4) != 0) {
        goto LABEL_8;
      }
    }
    unint64_t timestamp = [(SVXDeactivationContext *)self->_baseModel timestamp];
    if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  v5 = (SVXDeactivationContext *)[(SVXDeactivationContext *)baseModel copy];
LABEL_5:
  v6 = v5;
LABEL_23:

  return v6;
}

- (void)setOptions:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x41u;
}

- (void)setUserInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (void)setClientInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (void)setButtonEvent:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_unint64_t timestamp = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setSource:(int64_t)a3
{
  self->_int64_t source = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXDeactivationContextMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeactivationContextMutation;
  v6 = [(_SVXDeactivationContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXDeactivationContextMutation)init
{
  return [(_SVXDeactivationContextMutation *)self initWithBaseModel:0];
}

@end