@interface ASKLoadMonogramResourceOperation
+ (id)keyPathsForValuesAffectingIsExecuting;
+ (id)keyPathsForValuesAffectingIsFinished;
- (ASKLoadMonogramResourceOperation)initWithMonogramResourceURL:(id)a3 size:(CGSize)a4;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isRTL;
- (BOOL)isRendering;
- (MTMonogramConfig)monogramConfig;
- (void)setIsRendering:(BOOL)a3;
- (void)setMonogramConfig:(id)a3;
- (void)start;
@end

@implementation ASKLoadMonogramResourceOperation

- (ASKLoadMonogramResourceOperation)initWithMonogramResourceURL:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASKLoadMonogramResourceOperation;
  v8 = [(ASKLoadMonogramResourceOperation *)&v12 init];
  if (v8)
  {
    v9 = +[MTMonogramConfig monogramWithURL:v7];
    [(ASKLoadMonogramResourceOperation *)v8 setMonogramConfig:v9];

    v10 = [(ASKLoadMonogramResourceOperation *)v8 monogramConfig];
    [v10 setSize:width, height];
  }
  return v8;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  unsigned int v3 = [(ASKLoadMonogramResourceOperation *)self isRendering];
  if (v3) {
    LOBYTE(v3) = [(ASKLoadMonogramResourceOperation *)self isCancelled] ^ 1;
  }
  return v3;
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return +[NSSet setWithObjects:@"isCancelled", @"isExecuting", 0];
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return +[NSSet setWithObjects:@"isCancelled", @"isRendering", 0];
}

- (BOOL)isFinished
{
  if (![(ASKLoadMonogramResourceOperation *)self isRendering]) {
    return 1;
  }

  return [(ASKLoadMonogramResourceOperation *)self isCancelled];
}

- (BOOL)isRTL
{
  v2 = +[NSLocale preferredLanguages];
  unsigned int v3 = [v2 firstObject];

  if (v3) {
    BOOL v4 = (char *)+[NSLocale characterDirectionForLanguage:v3] == (char *)&dword_0 + 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)start
{
  unsigned int v3 = [(ASKLoadMonogramResourceOperation *)self monogramConfig];
  if (v3 && ![(ASKLoadMonogramResourceOperation *)self isCancelled])
  {
    BOOL v4 = [(ASKLoadMonogramResourceOperation *)self monogramConfig];
    v5 = [v4 formattedValue];

    if (v5)
    {
      [(ASKLoadMonogramResourceOperation *)self setIsRendering:1];
      id v6 = objc_alloc((Class)CNAvatarImageRenderer);
      id v7 = +[CNAvatarImageRendererSettings defaultSettings];
      id v8 = [v6 initWithSettings:v7];

      v9 = [(ASKLoadMonogramResourceOperation *)self monogramConfig];
      [v9 size];
      objc_super v12 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", [(ASKLoadMonogramResourceOperation *)self isRTL], 0, v10, v11, 1.0);

      objc_initWeak(&location, self);
      v13 = [(ASKLoadMonogramResourceOperation *)self monogramConfig];
      v14 = [v13 formattedValue];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __41__ASKLoadMonogramResourceOperation_start__block_invoke;
      v16[3] = &unk_471238;
      objc_copyWeak(&v17, &location);
      id v15 = [v8 renderMonogramForString:v14 scope:v12 imageHandler:v16];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);

      return;
    }
  }
  else
  {
  }

  [(ASKLoadMonogramResourceOperation *)self setIsRendering:0];
}

void __41__ASKLoadMonogramResourceOperation_start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __41__ASKLoadMonogramResourceOperation_start__block_invoke_2;
  v5[3] = &unk_471210;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void __41__ASKLoadMonogramResourceOperation_start__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didCompleteWithResource:*(void *)(a1 + 32) error:0];

  id v4 = objc_loadWeakRetained(v2);
  [v4 setIsRendering:0];
}

- (MTMonogramConfig)monogramConfig
{
  return self->_monogramConfig;
}

- (void)setMonogramConfig:(id)a3
{
}

- (BOOL)isRendering
{
  return self->_isRendering;
}

- (void)setIsRendering:(BOOL)a3
{
  self->_isRendering = a3;
}

- (void).cxx_destruct
{
}

@end