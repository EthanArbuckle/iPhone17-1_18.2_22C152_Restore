@interface _SVXClientInfoMutation
- (_SVXClientInfoMutation)init;
- (_SVXClientInfoMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setProcessIdentifier:(int)a3;
- (void)setProcessName:(id)a3;
@end

@implementation _SVXClientInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = [[SVXClientInfo alloc] initWithProcessIdentifier:self->_processIdentifier processName:self->_processName];
    goto LABEL_5;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXClientInfo *)[(SVXClientInfo *)baseModel copy];
LABEL_5:
    v5 = v4;
    goto LABEL_12;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    uint64_t processIdentifier = self->_processIdentifier;
    if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    v7 = [(SVXClientInfo *)self->_baseModel processName];
    goto LABEL_11;
  }
  uint64_t processIdentifier = [(SVXClientInfo *)baseModel processIdentifier];
  if ((*(unsigned char *)&self->_mutationFlags & 4) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  v7 = self->_processName;
LABEL_11:
  v8 = v7;
  v5 = [[SVXClientInfo alloc] initWithProcessIdentifier:processIdentifier processName:v7];

LABEL_12:

  return v5;
}

- (void)setProcessName:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_uint64_t processIdentifier = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXClientInfoMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXClientInfoMutation;
  v6 = [(_SVXClientInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXClientInfoMutation)init
{
  return [(_SVXClientInfoMutation *)self initWithBaseModel:0];
}

@end