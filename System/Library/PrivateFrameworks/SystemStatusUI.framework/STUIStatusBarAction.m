@interface STUIStatusBarAction
+ (id)actionWithBlock:(id)a3;
- (BOOL)isEnabled;
- (id)block;
- (void)performWithStatusBar:(id)a3 completionHandler:(id)a4;
- (void)setBlock:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation STUIStatusBarAction

- (void).cxx_destruct
{
}

+ (id)actionWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setBlock:v4];

  [v5 setEnabled:1];
  return v5;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setBlock:(id)a3
{
}

- (void)performWithStatusBar:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  if (![(STUIStatusBarAction *)self isEnabled])
  {
    uint64_t v7 = 0;
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v7 = (*((uint64_t (**)(void))self->_block + 2))();
  if (v6) {
LABEL_5:
  }
    v6[2](v6, v7);
LABEL_6:
}

- (id)block
{
  return self->_block;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

@end