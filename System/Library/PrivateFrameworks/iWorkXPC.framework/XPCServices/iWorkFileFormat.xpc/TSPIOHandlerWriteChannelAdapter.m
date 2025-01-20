@interface TSPIOHandlerWriteChannelAdapter
- (TSPIOHandlerWriteChannelAdapter)initWithHandler:(id)a3;
- (void)close;
- (void)setError:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation TSPIOHandlerWriteChannelAdapter

- (TSPIOHandlerWriteChannelAdapter)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSPIOHandlerWriteChannelAdapter;
  v5 = [(TSPIOHandlerWriteChannelAdapter *)&v9 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id handler = v5->_handler;
    v5->_id handler = v6;
  }
  return v5;
}

- (void)writeData:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (void)close
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end