@interface RSNodeInput
+ (id)keyPathsForValuesAffectingConnection;
- (RSNodeConnection)connection;
- (RSNodeInputProducer)producer;
- (void)setProducer:(id)a3;
@end

@implementation RSNodeInput

- (RSNodeConnection)connection
{
  v3 = objc_msgSend_producer(self, a2, v2);
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
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263EFFA08], sel_setWithObject_, @"producer");
}

- (void).cxx_destruct
{
}

- (void)setProducer:(id)a3
{
}

- (RSNodeInputProducer)producer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_producer);

  return (RSNodeInputProducer *)WeakRetained;
}

@end