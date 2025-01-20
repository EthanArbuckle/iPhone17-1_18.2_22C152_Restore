@interface _SVXButtonEventMutation
- (_SVXButtonEventMutation)init;
- (_SVXButtonEventMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _SVXButtonEventMutation

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
      v4 = (SVXButtonEvent *)[(SVXButtonEvent *)baseModel copy];
      goto LABEL_12;
    }
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      int64_t type = self->_type;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
        goto LABEL_7;
      }
    }
    else
    {
      int64_t type = [(SVXButtonEvent *)baseModel type];
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
LABEL_7:
        unint64_t timestamp = self->_timestamp;
LABEL_10:
        v5 = [SVXButtonEvent alloc];
        int64_t v6 = type;
        unint64_t v7 = timestamp;
        goto LABEL_11;
      }
    }
    unint64_t timestamp = [(SVXButtonEvent *)self->_baseModel timestamp];
    goto LABEL_10;
  }
  v5 = [SVXButtonEvent alloc];
  int64_t v6 = self->_type;
  unint64_t v7 = self->_timestamp;
LABEL_11:
  v4 = [(SVXButtonEvent *)v5 initWithType:v6 timestamp:v7];
LABEL_12:

  return v4;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_unint64_t timestamp = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXButtonEventMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXButtonEventMutation;
  int64_t v6 = [(_SVXButtonEventMutation *)&v9 init];
  unint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXButtonEventMutation)init
{
  return [(_SVXButtonEventMutation *)self initWithBaseModel:0];
}

@end