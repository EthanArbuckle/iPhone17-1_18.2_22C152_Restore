@interface TSPObjectContextObserver
- (SEL)action;
- (TSPObjectContextObserver)init;
- (TSPObjectContextObserver)initWithTarget:(id)a3 action:(SEL)a4;
- (id)target;
@end

@implementation TSPObjectContextObserver

- (TSPObjectContextObserver)init
{
  v2 = [MEMORY[0x263F7C7F0] currentHandler];
  v3 = [NSString stringWithUTF8String:"-[TSPObjectContextObserver init]"];
  v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:2746 description:@"Do not call method"];

  v5 = (void *)MEMORY[0x263EFF940];
  v6 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[TSPObjectContextObserver init]"];
  id v7 = [v5 exceptionWithName:*MEMORY[0x263EFF498] reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPObjectContextObserver)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TSPObjectContextObserver;
  id v7 = [(TSPObjectContextObserver *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_action = v9;
  }

  return v8;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end