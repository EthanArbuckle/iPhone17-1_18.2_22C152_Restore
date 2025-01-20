@interface Pipe
- (CBScalablePipe)pipe;
- (NSMutableArray)txMessageQueue;
- (NSMutableData)incomingBuffer;
- (NSMutableData)receivedMessage;
- (NSSet)supportedCommands;
- (Pipe)initWithDelegate:(id)a3 pipe:(id)a4;
- (PipeDelegate)delegate;
- (void)dealloc;
- (void)receiveMessage:(char *)a3 length:(int64_t)a4;
- (void)sendMessage:(id)a3;
- (void)sendNextQueuedMessage;
- (void)setDelegate:(id)a3;
- (void)setIncomingBuffer:(id)a3;
- (void)setReceivedMessage:(id)a3;
- (void)setSupportedCommands:(id)a3;
- (void)setTxMessageQueue:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation Pipe

- (Pipe)initWithDelegate:(id)a3 pipe:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)Pipe;
  v8 = [(Pipe *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_pipe, a4);
    uint64_t v10 = objc_opt_new();
    txMessageQueue = v9->_txMessageQueue;
    v9->_txMessageQueue = (NSMutableArray *)v10;

    v12 = [(CBScalablePipe *)v9->_pipe input];
    [v12 setDelegate:v9];

    v13 = [(CBScalablePipe *)v9->_pipe output];
    [v13 setDelegate:v9];

    v14 = [(CBScalablePipe *)v9->_pipe input];
    v15 = +[NSRunLoop currentRunLoop];
    [v14 scheduleInRunLoop:v15 forMode:NSDefaultRunLoopMode];

    v16 = [(CBScalablePipe *)v9->_pipe output];
    v17 = +[NSRunLoop currentRunLoop];
    [v16 scheduleInRunLoop:v17 forMode:NSDefaultRunLoopMode];

    v18 = [(CBScalablePipe *)v9->_pipe input];
    [v18 open];

    v19 = [(CBScalablePipe *)v9->_pipe output];
    [v19 open];
  }
  return v9;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = [(CBScalablePipe *)self->_pipe input];
  v4 = +[NSRunLoop currentRunLoop];
  [v3 removeFromRunLoop:v4 forMode:NSDefaultRunLoopMode];

  v5 = [(CBScalablePipe *)self->_pipe output];
  id v6 = +[NSRunLoop currentRunLoop];
  [v5 removeFromRunLoop:v6 forMode:NSDefaultRunLoopMode];

  id v7 = [(CBScalablePipe *)self->_pipe input];
  [v7 setDelegate:0];

  v8 = [(CBScalablePipe *)self->_pipe output];
  [v8 setDelegate:0];

  v9 = [(CBScalablePipe *)self->_pipe input];
  [v9 close];

  uint64_t v10 = [(CBScalablePipe *)self->_pipe output];
  [v10 close];

  v11.receiver = self;
  v11.super_class = (Class)Pipe;
  [(Pipe *)&v11 dealloc];
}

- (void)sendMessage:(id)a3
{
  v4 = +[NSJSONSerialization dataWithJSONObject:a3 options:0 error:0];
  char v10 = 0;
  v5 = +[NSMutableData dataWithData:v4];
  [v5 appendBytes:&v10 length:1];
  id v6 = [(Pipe *)self txMessageQueue];
  id v7 = [[OutboundMessage alloc] initWithData:v5];
  [v6 addObject:v7];

  v8 = [(Pipe *)self txMessageQueue];
  id v9 = [v8 count];

  if (v9 == (id)1) {
    [(Pipe *)self sendNextQueuedMessage];
  }
}

- (void)sendNextQueuedMessage
{
  v3 = [(Pipe *)self txMessageQueue];
  v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = [v4 data];
    id v6 = [v5 bytes];
    id v7 = (char *)[v4 offset] + (void)v6;

    v8 = [v4 data];
    id v9 = [v8 length];
    int64_t v10 = v9 - (unsigned char *)[v4 offset];

    objc_super v11 = [(Pipe *)self pipe];
    v12 = [v11 output];
    uint64_t v13 = (uint64_t)[v12 write:v7 maxLength:v10];

    if (v13 < 1)
    {
      if (v13 < 0)
      {
        v18 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_100070DAC(v18, self);
        }
      }
    }
    else
    {
      [v4 setOffset:[v4 offset] + v13];
      id v14 = [v4 offset];
      v15 = [v4 data];
      id v16 = [v15 length];

      if (v14 >= v16)
      {
        v17 = [(Pipe *)self txMessageQueue];
        [v17 removeObject:v4];
      }
    }
  }
}

- (void)receiveMessage:(char *)a3 length:(int64_t)a4
{
  id v7 = [(Pipe *)self receivedMessage];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[NSMutableData data];
  }
  int64_t v10 = v9;

  if (a4 < 1)
  {
    int64_t v12 = 0;
    int64_t v17 = 0;
  }
  else
  {
    int64_t v11 = 0;
    int64_t v12 = 0;
    v18 = &v21;
    do
    {
      if (a3[v11])
      {
        ++v11;
      }
      else
      {
        [v10 appendBytes:&a3[v12] length:v11 - v12];
        id v19 = 0;
        uint64_t v13 = +[NSJSONSerialization JSONObjectWithData:v10 options:0 error:&v19];
        id v14 = v19;
        if (v13)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained pipe:self didReceiveMessage:v13];
        }
        else
        {
          id v16 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_100070E94(v20, v16, v14, v18);
          }
        }
        -[Pipe setReceivedMessage:](self, "setReceivedMessage:", 0, v18);
        ++v11;
        [v10 setLength:0];

        int64_t v12 = v11;
      }
    }
    while (v11 != a4);
    int64_t v17 = a4;
  }
  if (v12 < a4)
  {
    [v10 appendBytes:&a3[v12] length:v17 - v12];
    [(Pipe *)self setReceivedMessage:v10];
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 0x10uLL:
      id v9 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "End of stream found", (uint8_t *)v11, 2u);
      }
      break;
    case 4uLL:
      [(Pipe *)self sendNextQueuedMessage];
      break;
    case 2uLL:
      memset(v11, 0, sizeof(v11));
      id v8 = [v6 read:v11 maxLength:256];
      if (v8)
      {
        [(Pipe *)self receiveMessage:v11 length:v8];
      }
      else
      {
        int64_t v10 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_100070F18(v10, self);
        }
      }
      break;
  }
}

- (PipeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PipeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CBScalablePipe)pipe
{
  return self->_pipe;
}

- (NSSet)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
}

- (NSMutableArray)txMessageQueue
{
  return self->_txMessageQueue;
}

- (void)setTxMessageQueue:(id)a3
{
}

- (NSMutableData)receivedMessage
{
  return self->_receivedMessage;
}

- (void)setReceivedMessage:(id)a3
{
}

- (NSMutableData)incomingBuffer
{
  return self->_incomingBuffer;
}

- (void)setIncomingBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingBuffer, 0);
  objc_storeStrong((id *)&self->_receivedMessage, 0);
  objc_storeStrong((id *)&self->_txMessageQueue, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_pipe, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end