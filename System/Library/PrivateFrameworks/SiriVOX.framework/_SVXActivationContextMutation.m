@interface _SVXActivationContextMutation
- (_SVXActivationContextMutation)init;
- (_SVXActivationContextMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setButtonEvent:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setRequestInfo:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setSystemEvent:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _SVXActivationContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_systemEvent, 0);
  objc_storeStrong((id *)&self->_buttonEvent, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = [[SVXActivationContext alloc] initWithSource:self->_source timestamp:self->_timestamp buttonEvent:self->_buttonEvent systemEvent:self->_systemEvent clientInfo:self->_clientInfo requestInfo:self->_requestInfo userInfo:self->_userInfo];
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
            v11 = self->_systemEvent;
          }
          else
          {
            v11 = [(SVXActivationContext *)self->_baseModel systemEvent];
          }
          v12 = v11;
          if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
          {
            v13 = self->_clientInfo;
          }
          else
          {
            v13 = [(SVXActivationContext *)self->_baseModel clientInfo];
          }
          v14 = v13;
          if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0)
          {
            v15 = self->_requestInfo;
          }
          else
          {
            v15 = [(SVXActivationContext *)self->_baseModel requestInfo];
          }
          v16 = v15;
          if ((*(unsigned char *)&self->_mutationFlags & 0x80000000) != 0)
          {
            v17 = self->_userInfo;
          }
          else
          {
            v17 = [(SVXActivationContext *)self->_baseModel userInfo];
          }
          v18 = v17;
          v6 = [[SVXActivationContext alloc] initWithSource:source timestamp:timestamp buttonEvent:v10 systemEvent:v12 clientInfo:v14 requestInfo:v16 userInfo:v17];

          goto LABEL_26;
        }
LABEL_12:
        v9 = [(SVXActivationContext *)self->_baseModel buttonEvent];
        goto LABEL_13;
      }
    }
    else
    {
      int64_t source = [(SVXActivationContext *)baseModel source];
      char mutationFlags = (char)self->_mutationFlags;
      if ((mutationFlags & 4) != 0) {
        goto LABEL_8;
      }
    }
    unint64_t timestamp = [(SVXActivationContext *)self->_baseModel timestamp];
    if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  v5 = (SVXActivationContext *)[(SVXActivationContext *)baseModel copy];
LABEL_5:
  v6 = v5;
LABEL_26:

  return v6;
}

- (void)setUserInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x81u;
}

- (void)setRequestInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x41u;
}

- (void)setClientInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (void)setSystemEvent:(id)a3
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

- (_SVXActivationContextMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXActivationContextMutation;
  v6 = [(_SVXActivationContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXActivationContextMutation)init
{
  return [(_SVXActivationContextMutation *)self initWithBaseModel:0];
}

@end