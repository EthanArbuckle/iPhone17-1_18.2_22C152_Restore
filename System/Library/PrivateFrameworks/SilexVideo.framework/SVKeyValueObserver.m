@interface SVKeyValueObserver
- (NSObject)object;
- (NSString)keyPath;
- (SVKeyValueObserver)initWithKeyPath:(id)a3 ofObject:(id)a4 withOptions:(unint64_t)a5 change:(id)a6;
- (id)change;
- (unint64_t)options;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation SVKeyValueObserver

- (SVKeyValueObserver)initWithKeyPath:(id)a3 ofObject:(id)a4 withOptions:(unint64_t)a5 change:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SVKeyValueObserver;
  v13 = [(SVKeyValueObserver *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    keyPath = v13->_keyPath;
    v13->_keyPath = (NSString *)v14;

    objc_storeWeak((id *)&v13->_object, v11);
    v13->_options = a5;
    uint64_t v16 = [v12 copy];
    id change = v13->_change;
    v13->_id change = (id)v16;

    [v11 addObserver:v13 forKeyPath:v10 options:a5 context:SVKeyValueObserverContext];
  }

  return v13;
}

- (void)dealloc
{
  v3 = [(SVKeyValueObserver *)self object];
  v4 = [(SVKeyValueObserver *)self keyPath];
  [v3 removeObserver:self forKeyPath:v4];

  v5.receiver = self;
  v5.super_class = (Class)SVKeyValueObserver;
  [(SVKeyValueObserver *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  if ((void *)SVKeyValueObserverContext == a6)
  {
    id v11 = v8;
    v9 = [(SVKeyValueObserver *)self change];

    id v8 = v11;
    if (v9)
    {
      id v10 = [(SVKeyValueObserver *)self change];
      ((void (**)(void, SVKeyValueObserver *, id))v10)[2](v10, self, v11);

      id v8 = v11;
    }
  }
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  return WeakRetained;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)change
{
  return self->_change;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_change, 0);
  objc_destroyWeak((id *)&self->_object);

  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end