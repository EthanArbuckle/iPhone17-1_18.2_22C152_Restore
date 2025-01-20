@interface ISKVOProxy
- (ISKVOProxy)initWithTarget:(id)a3 keyPaths:(id)a4 identifier:(id)a5 delegate:(id)a6;
- (ISKVOProxyDelegate)delegate;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)startObservingTarget;
- (void)stopObservingTarget;
@end

@implementation ISKVOProxy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);

  objc_storeStrong(&self->_target, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ISKVOProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ISKVOProxyDelegate *)WeakRetained;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_keyPaths;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [self->_target removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)ISKVOProxy;
  [(ISKVOProxy *)&v8 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(ISKVOProxy *)self delegate];
  [v10 observeChangeforKVOProxyIdentifier:self->_identifier keyPath:v9 change:v8];
}

- (void)stopObservingTarget
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_keyPaths;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(self->_target, "removeObserver:forKeyPath:", self, *(void *)(*((void *)&v10 + 1) + 8 * v7++), (void)v10);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  keyPaths = self->_keyPaths;
  self->_keyPaths = 0;

  id target = self->_target;
  self->_id target = 0;
}

- (void)startObservingTarget
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_keyPaths;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(self->_target, "addObserver:forKeyPath:options:context:", self, *(void *)(*((void *)&v8 + 1) + 8 * v7++), 5, 0, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (ISKVOProxy)initWithTarget:(id)a3 keyPaths:(id)a4 identifier:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ISKVOProxy;
  uint64_t v15 = [(ISKVOProxy *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    objc_storeStrong(&v16->_target, a3);
    uint64_t v17 = [v12 copy];
    keyPaths = v16->_keyPaths;
    v16->_keyPaths = (NSArray *)v17;

    uint64_t v19 = [v13 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v19;
  }
  return v16;
}

@end