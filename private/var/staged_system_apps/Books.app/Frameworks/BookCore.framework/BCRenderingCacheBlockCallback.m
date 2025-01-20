@interface BCRenderingCacheBlockCallback
- (BCRenderingCacheBlockCallback)initWithCompletion:(id)a3;
- (id)completion;
- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4;
- (void)setCompletion:(id)a3;
@end

@implementation BCRenderingCacheBlockCallback

- (BCRenderingCacheBlockCallback)initWithCompletion:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BCRenderingCacheBlockCallback;
  v5 = [(BCRenderingCacheBlockCallback *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BCRenderingCacheBlockCallback *)v5 setCompletion:v4];
  }

  return v6;
}

- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4
{
  id v7 = a3;
  uint64_t v5 = [(BCRenderingCacheBlockCallback *)self completion];
  v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }

  [(BCRenderingCacheBlockCallback *)self setCompletion:0];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end