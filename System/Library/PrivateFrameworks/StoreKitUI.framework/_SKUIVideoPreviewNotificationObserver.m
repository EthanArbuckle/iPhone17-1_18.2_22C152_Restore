@interface _SKUIVideoPreviewNotificationObserver
- (_SKUIVideoPreviewNotificationObserver)initWithObservers:(id)a3;
- (void)dealloc;
@end

@implementation _SKUIVideoPreviewNotificationObserver

- (_SKUIVideoPreviewNotificationObserver)initWithObservers:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[_SKUIVideoPreviewNotificationObserver initWithObservers:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)_SKUIVideoPreviewNotificationObserver;
  v13 = [(_SKUIVideoPreviewNotificationObserver *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v4 copy];
    observers = v13->_observers;
    v13->_observers = (NSArray *)v14;
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
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
  v9.super_class = (Class)_SKUIVideoPreviewNotificationObserver;
  [(_SKUIVideoPreviewNotificationObserver *)&v9 dealloc];
}

- (void).cxx_destruct
{
}

- (void)initWithObservers:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end