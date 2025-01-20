@interface RSNodeConnection
+ (id)new;
- (BOOL)attachWithError:(id *)a3;
- (BOOL)detachWithError:(id *)a3;
- (BOOL)isAttached;
- (RSNodeConnection)init;
- (RSNodeConnection)initWithOutput:(id)a3 input:(id)a4;
- (RSNodeInput)input;
- (RSNodeOutput)output;
@end

@implementation RSNodeConnection

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_input);

  objc_destroyWeak((id *)&self->_output);
}

- (BOOL)isAttached
{
  return self->_attached;
}

- (RSNodeInput)input
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_input);

  return (RSNodeInput *)WeakRetained;
}

- (RSNodeOutput)output
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_output);

  return (RSNodeOutput *)WeakRetained;
}

- (BOOL)detachWithError:(id *)a3
{
  return 0;
}

- (BOOL)attachWithError:(id *)a3
{
  return 0;
}

- (RSNodeConnection)initWithOutput:(id)a3 input:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RSNodeConnection;
  v8 = [(RSNodeConnection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_output, v6);
    objc_storeWeak((id *)&v9->_input, v7);
  }

  return v9;
}

- (RSNodeConnection)init
{
  result = (RSNodeConnection *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

@end