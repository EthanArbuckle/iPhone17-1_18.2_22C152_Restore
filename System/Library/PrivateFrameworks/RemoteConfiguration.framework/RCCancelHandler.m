@interface RCCancelHandler
+ (id)cancelHandlerWithBlock:(id)a3;
+ (id)cancelHandlerWithStrongTarget:(id)a3 selector:(SEL)a4;
+ (id)cancelHandlerWithWeakTarget:(id)a3 selector:(SEL)a4;
- (RCCancelHandler)initWithBlock:(id)a3;
- (RCCancelHandler)initWithStrongTarget:(id)a3 selector:(SEL)a4;
- (RCCancelHandler)initWithWeakTarget:(id)a3 selector:(SEL)a4;
- (SEL)selector;
- (id)cancelBlock;
- (id)strongTarget;
- (id)weakTarget;
- (void)cancel;
- (void)setCancelBlock:(id)a3;
- (void)setSelector:(SEL)a3;
- (void)setStrongTarget:(id)a3;
- (void)setWeakTarget:(id)a3;
@end

@implementation RCCancelHandler

+ (id)cancelHandlerWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithBlock:v4];

  return v5;
}

+ (id)cancelHandlerWithWeakTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithWeakTarget:v6 selector:a4];

  return v7;
}

+ (id)cancelHandlerWithStrongTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithStrongTarget:v6 selector:a4];

  return v7;
}

- (RCCancelHandler)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCCancelHandler;
  v5 = [(RCCancelHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id cancelBlock = v5->_cancelBlock;
    v5->_id cancelBlock = (id)v6;
  }
  return v5;
}

- (RCCancelHandler)initWithWeakTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RCCancelHandler;
  v7 = [(RCCancelHandler *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_weakTarget, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_selector = v9;
  }

  return v8;
}

- (RCCancelHandler)initWithStrongTarget:(id)a3 selector:(SEL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RCCancelHandler;
  v8 = [(RCCancelHandler *)&v12 init];
  SEL v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_strongTarget, a3);
    if (a4) {
      SEL v10 = a4;
    }
    else {
      SEL v10 = 0;
    }
    v9->_selector = v10;
  }

  return v9;
}

- (void)cancel
{
  v3 = [(RCCancelHandler *)self cancelBlock];

  if (v3)
  {
    id v4 = [(RCCancelHandler *)self cancelBlock];

    if (!v4) {
      goto LABEL_11;
    }
    v5 = [(RCCancelHandler *)self cancelBlock];
    v5[2]();
  }
  else
  {
    if (![(RCCancelHandler *)self selector]) {
      goto LABEL_11;
    }
    id v6 = [(RCCancelHandler *)self strongTarget];
    if (v6) {
      [(RCCancelHandler *)self strongTarget];
    }
    else {
    v5 = [(RCCancelHandler *)self weakTarget];
    }

    if (v5) {
      ((void (*)(void (**)(void), SEL))objc_msgSend(v5, "methodForSelector:", -[RCCancelHandler selector](self, "selector")))(v5, -[RCCancelHandler selector](self, "selector"));
    }
  }

LABEL_11:
  [(RCCancelHandler *)self setCancelBlock:0];
  [(RCCancelHandler *)self setWeakTarget:0];

  [(RCCancelHandler *)self setStrongTarget:0];
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (id)weakTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakTarget);

  return WeakRetained;
}

- (void)setWeakTarget:(id)a3
{
}

- (id)strongTarget
{
  return self->_strongTarget;
}

- (void)setStrongTarget:(id)a3
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strongTarget, 0);
  objc_destroyWeak(&self->_weakTarget);

  objc_storeStrong(&self->_cancelBlock, 0);
}

@end