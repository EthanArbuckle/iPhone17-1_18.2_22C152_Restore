@interface _SUUIVideoPreviewNotificationObserver
- (_SUUIVideoPreviewNotificationObserver)initWithObservers:(id)a3;
- (void)dealloc;
@end

@implementation _SUUIVideoPreviewNotificationObserver

- (_SUUIVideoPreviewNotificationObserver)initWithObservers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SUUIVideoPreviewNotificationObserver;
  v5 = [(_SUUIVideoPreviewNotificationObserver *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    observers = v5->_observers;
    v5->_observers = (NSArray *)v6;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_observers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)_SUUIVideoPreviewNotificationObserver;
  [(_SUUIVideoPreviewNotificationObserver *)&v9 dealloc];
}

- (void).cxx_destruct
{
}

@end