@interface _UIWeakHelper
- (_UIWeakHelper)initWithDeallocationBlock:(id)a3;
- (id)deallocationBlock;
- (void)dealloc;
- (void)invalidate;
- (void)setDeallocationBlock:(id)a3;
@end

@implementation _UIWeakHelper

- (void).cxx_destruct
{
}

- (void)dealloc
{
  if (self->_deallocationBlock)
  {
    int v3 = pthread_main_np();
    deallocationBlock = (void (**)(void))self->_deallocationBlock;
    if (v3 == 1) {
      ((void (**)(id))deallocationBlock)[2](self->_deallocationBlock);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], deallocationBlock);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIWeakHelper;
  [(_UIWeakHelper *)&v5 dealloc];
}

- (_UIWeakHelper)initWithDeallocationBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWeakHelper;
  objc_super v5 = [(_UIWeakHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_UIWeakHelper *)v5 setDeallocationBlock:v4];
  }

  return v6;
}

- (void)setDeallocationBlock:(id)a3
{
}

- (void)invalidate
{
  id deallocationBlock = self->_deallocationBlock;
  self->_id deallocationBlock = 0;
}

- (id)deallocationBlock
{
  return self->_deallocationBlock;
}

@end