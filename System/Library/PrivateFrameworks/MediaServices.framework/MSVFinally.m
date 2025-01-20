@interface MSVFinally
- (MSVFinally)initWithBlock:(id)a3;
- (void)dealloc;
@end

@implementation MSVFinally

- (MSVFinally)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSVFinally;
  v5 = [(MSVFinally *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  (*((void (**)(void))self->_block + 2))();
  v3.receiver = self;
  v3.super_class = (Class)MSVFinally;
  [(MSVFinally *)&v3 dealloc];
}

@end