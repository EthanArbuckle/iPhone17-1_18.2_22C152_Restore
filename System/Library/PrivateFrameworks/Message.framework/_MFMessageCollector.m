@interface _MFMessageCollector
- (BOOL)shouldCancel;
- (_MFMessageCollector)init;
- (id)copyMessages;
- (id)messages;
- (id)transmogrifier;
- (void)newMessagesAvailable:(id)a3;
- (void)setTransmogrifier:(id)a3;
@end

@implementation _MFMessageCollector

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transmogrifier, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

- (BOOL)shouldCancel
{
  monitor = self->_monitor;
  if (!monitor)
  {
    v4 = +[MFActivityMonitor currentMonitor];
    v5 = self->_monitor;
    self->_monitor = v4;

    monitor = self->_monitor;
  }
  return [(MFActivityMonitor *)monitor shouldCancel];
}

- (id)messages
{
  return self->_messages;
}

- (_MFMessageCollector)init
{
  v7.receiver = self;
  v7.super_class = (Class)_MFMessageCollector;
  v2 = [(_MFMessageCollector *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    messages = v2->_messages;
    v2->_messages = v3;

    v5 = v2;
  }

  return v2;
}

- (id)copyMessages
{
  return self->_messages;
}

- (void)newMessagesAvailable:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (self->_transmogrifier)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = (*((void (**)(id))self->_transmogrifier + 2))(self->_transmogrifier);
          if (v10) {
            -[NSMutableArray addObject:](self->_messages, "addObject:", v10, (void)v11);
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [(NSMutableArray *)self->_messages addObjectsFromArray:v4];
  }
}

- (id)transmogrifier
{
  return self->_transmogrifier;
}

- (void)setTransmogrifier:(id)a3
{
}

@end