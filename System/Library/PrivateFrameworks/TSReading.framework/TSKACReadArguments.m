@interface TSKACReadArguments
- (SEL)selector;
- (TSKACReadArguments)initWithSelector:(SEL)a3 target:(id)a4 argument:(void *)a5;
- (TSKACReadArguments)initWithSelector:(SEL)a3 target:(id)a4 argument:(void *)a5 argument2:(id)a6;
- (id)argument2;
- (id)target;
- (void)argument;
- (void)dealloc;
@end

@implementation TSKACReadArguments

- (TSKACReadArguments)initWithSelector:(SEL)a3 target:(id)a4 argument:(void *)a5
{
  return [(TSKACReadArguments *)self initWithSelector:a3 target:a4 argument:a5 argument2:0];
}

- (TSKACReadArguments)initWithSelector:(SEL)a3 target:(id)a4 argument:(void *)a5 argument2:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)TSKACReadArguments;
  v10 = [(TSKACReadArguments *)&v14 init];
  v11 = v10;
  if (v10)
  {
    if (a3) {
      SEL v12 = a3;
    }
    else {
      SEL v12 = 0;
    }
    v10->_selector = v12;
    v10->_target = a4;
    v10->_argument = a5;
    v10->_argument2 = a6;
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKACReadArguments;
  [(TSKACReadArguments *)&v3 dealloc];
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

- (id)target
{
  return self->_target;
}

- (void)argument
{
  return self->_argument;
}

- (id)argument2
{
  return self->_argument2;
}

@end