@interface _UITableViewIgnoreDragsTokenImpl
- (_UITableViewIgnoreDragsTokenImpl)initWithDidEndHandler:(id)a3;
- (void)dealloc;
- (void)endIgnoringDrags;
@end

@implementation _UITableViewIgnoreDragsTokenImpl

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(_UITableViewIgnoreDragsTokenImpl *)self endIgnoringDrags];
  v3.receiver = self;
  v3.super_class = (Class)_UITableViewIgnoreDragsTokenImpl;
  [(_UITableViewIgnoreDragsTokenImpl *)&v3 dealloc];
}

- (void)endIgnoringDrags
{
  v4 = (void (**)(void))_Block_copy(self->_didEndHandler);
  if (v4)
  {
    id didEndHandler = self->_didEndHandler;
    self->_id didEndHandler = 0;

    v4[2]();
  }
}

- (_UITableViewIgnoreDragsTokenImpl)initWithDidEndHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITableViewIgnoreDragsTokenImpl;
  v5 = [(_UITableViewIgnoreDragsTokenImpl *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id didEndHandler = v5->_didEndHandler;
    v5->_id didEndHandler = (id)v6;
  }
  return v5;
}

@end