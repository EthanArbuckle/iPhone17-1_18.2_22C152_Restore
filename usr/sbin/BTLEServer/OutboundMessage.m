@interface OutboundMessage
- (NSData)data;
- (OutboundMessage)initWithData:(id)a3;
- (unint64_t)offset;
- (void)setData:(id)a3;
- (void)setOffset:(unint64_t)a3;
@end

@implementation OutboundMessage

- (OutboundMessage)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OutboundMessage;
  v6 = [(OutboundMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
}

@end