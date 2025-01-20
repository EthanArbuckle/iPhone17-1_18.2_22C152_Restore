@interface WeakLoader
- (SFResourceLoader)strongloader;
- (WeakLoader)initWithLoader:(id)a3;
@end

@implementation WeakLoader

- (void).cxx_destruct
{
}

- (SFResourceLoader)strongloader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakLoader);
  return (SFResourceLoader *)WeakRetained;
}

- (WeakLoader)initWithLoader:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WeakLoader;
  v5 = [(WeakLoader *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_weakLoader, v4);
  }

  return v6;
}

@end