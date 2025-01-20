@interface PTTestRecipe
- (BOOL)_wantsEvent:(int64_t)a3;
- (NSString)title;
- (PTTestRecipeInfo)info;
- (id)_initWithTitle:(id)a3 prepareBlock:(id)a4 cleanupBlock:(id)a5;
- (id)cleanupBlock;
- (id)invalidationHandler;
- (id)prepareBlock;
- (void)_activate;
- (void)_deactivate;
- (void)_handleEvent:(int64_t)a3;
- (void)invalidate;
- (void)setCleanupBlock:(id)a3;
- (void)setInfo:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPrepareBlock:(id)a3;
@end

@implementation PTTestRecipe

- (id)_initWithTitle:(id)a3 prepareBlock:(id)a4 cleanupBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PTTestRecipe;
  v11 = [(PTTestRecipe *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    id prepareBlock = v11->_prepareBlock;
    v11->_id prepareBlock = (id)v14;

    uint64_t v16 = [v10 copy];
    id cleanupBlock = v11->_cleanupBlock;
    v11->_id cleanupBlock = (id)v16;
  }
  return v11;
}

- (void)_activate
{
  id prepareBlock = (void (**)(void))self->_prepareBlock;
  if (prepareBlock) {
    prepareBlock[2]();
  }
}

- (void)_deactivate
{
  id cleanupBlock = (void (**)(void))self->_cleanupBlock;
  if (cleanupBlock) {
    cleanupBlock[2]();
  }
}

- (void)invalidate
{
  id prepareBlock = self->_prepareBlock;
  self->_id prepareBlock = 0;

  id cleanupBlock = self->_cleanupBlock;
  self->_id cleanupBlock = 0;

  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
  }
  self->_invalidationHandler = 0;
}

- (NSString)title
{
  return self->_title;
}

- (id)prepareBlock
{
  return self->_prepareBlock;
}

- (void)setPrepareBlock:(id)a3
{
}

- (id)cleanupBlock
{
  return self->_cleanupBlock;
}

- (void)setCleanupBlock:(id)a3
{
}

- (PTTestRecipeInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong(&self->_cleanupBlock, 0);
  objc_storeStrong(&self->_prepareBlock, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (BOOL)_wantsEvent:(int64_t)a3
{
  return 0;
}

- (void)_handleEvent:(int64_t)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end