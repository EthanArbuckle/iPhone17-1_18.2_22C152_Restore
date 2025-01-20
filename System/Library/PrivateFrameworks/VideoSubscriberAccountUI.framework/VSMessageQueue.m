@interface VSMessageQueue
- (NSMutableArray)messages;
- (VSMessageQueue)init;
- (VSMessageQueueDelegate)delegate;
- (id)removeAllMessages;
- (void)addMessage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMessages:(id)a3;
@end

@implementation VSMessageQueue

- (VSMessageQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSMessageQueue;
  v2 = [(VSMessageQueue *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    messages = v2->_messages;
    v2->_messages = v3;
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  objc_super v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Will notify new delegate of messages.", v7, 2u);
  }

  [v5 didAddMessagesToMessageQueue:self];
}

- (void)addMessage:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Will add message %@ to queue %@", (uint8_t *)&v8, 0x16u);
  }

  objc_super v6 = [(VSMessageQueue *)self messages];
  [v6 addObject:v4];

  v7 = [(VSMessageQueue *)self delegate];
  [v7 didAddMessagesToMessageQueue:self];
}

- (id)removeAllMessages
{
  v2 = [(VSMessageQueue *)self messages];
  v3 = (void *)[v2 copy];
  [v2 removeAllObjects];

  return v3;
}

- (VSMessageQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSMessageQueueDelegate *)WeakRetained;
}

- (NSMutableArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end