@interface FCObserver
- (BOOL)isEqual:(id)a3;
- (FCObserver)init;
- (FCObserver)initWithToken:(unint64_t)a3;
- (id)keepAliveObject;
- (id)observerBlock;
- (unint64_t)token;
- (void)dispose;
- (void)disposeOn:(id)a3;
- (void)setKeepAliveObject:(id)a3;
- (void)setObserverBlock:(id)a3;
- (void)setToken:(unint64_t)a3;
@end

@implementation FCObserver

- (void)setObserverBlock:(id)a3
{
}

- (void)setKeepAliveObject:(id)a3
{
}

- (FCObserver)initWithToken:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCObserver;
  result = [(FCObserver *)&v5 init];
  if (result) {
    result->_token = a3;
  }
  return result;
}

- (FCObserver)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCObserver init]";
    __int16 v9 = 2080;
    v10 = "FCObservable.m";
    __int16 v11 = 1024;
    int v12 = 25;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  objc_super v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCObserver init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v5 = v4;
    }
    else {
      objc_super v5 = 0;
    }
  }
  else
  {
    objc_super v5 = 0;
  }
  id v7 = v5;

  if (v7)
  {
    unint64_t v8 = [(FCObserver *)self token];
    BOOL v6 = v8 == [v7 token];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)disposeOn:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  [(FCObserver *)self setKeepAliveObject:v5];
}

- (void)dispose
{
  [MEMORY[0x1E4F29060] isMainThread];
  [(FCObserver *)self setKeepAliveObject:0];
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (id)keepAliveObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_keepAliveObject);
  return WeakRetained;
}

- (id)observerBlock
{
  return self->_observerBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerBlock, 0);
  objc_destroyWeak(&self->_keepAliveObject);
}

@end