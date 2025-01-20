@interface DismissalHandle
- (id)dismissalBlock;
- (void)dealloc;
- (void)setDismissalBlock:(id)a3;
@end

@implementation DismissalHandle

- (void)dealloc
{
  id dismissalBlock = self->_dismissalBlock;
  self->_id dismissalBlock = 0;

  v4.receiver = self;
  v4.super_class = (Class)DismissalHandle;
  [(DismissalHandle *)&v4 dealloc];
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end