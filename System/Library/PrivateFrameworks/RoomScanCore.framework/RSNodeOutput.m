@interface RSNodeOutput
+ (id)keyPathsForValuesAffectingConnection;
- (RSNodeConnection)connection;
- (RSNodeOutputConsumer)consumer;
- (void)setConsumer:(id)a3;
@end

@implementation RSNodeOutput

- (RSNodeConnection)connection
{
  v3 = objc_msgSend_consumer(self, a2, v2);
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (RSNodeConnection *)v4;
}

+ (id)keyPathsForValuesAffectingConnection
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263EFFA08], sel_setWithObject_, @"consumer");
}

- (void).cxx_destruct
{
}

- (void)setConsumer:(id)a3
{
}

- (RSNodeOutputConsumer)consumer
{
  return self->_consumer;
}

@end