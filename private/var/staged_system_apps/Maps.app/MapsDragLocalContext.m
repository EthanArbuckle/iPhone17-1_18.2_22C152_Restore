@interface MapsDragLocalContext
- (MapsDragLocalContext)initWithWindowScene:(id)a3;
- (UIWindowScene)windowScene;
@end

@implementation MapsDragLocalContext

- (MapsDragLocalContext)initWithWindowScene:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsDragLocalContext;
  v6 = [(MapsDragLocalContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_windowScene, a3);
  }

  return v7;
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void).cxx_destruct
{
}

@end