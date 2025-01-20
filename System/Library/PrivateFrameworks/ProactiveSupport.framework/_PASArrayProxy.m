@interface _PASArrayProxy
- (_PASArrayProxy)initWithCoder:(id)a3;
- (_PASArrayProxy)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)_pas_unproxy;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation _PASArrayProxy

- (void).cxx_destruct
{
  objc_storeStrong(&self->_countBlock, 0);

  objc_storeStrong(&self->_objectAtIndexBlock, 0);
}

- (unint64_t)count
{
  v3 = (void *)MEMORY[0x1A62450A0](self, a2);
  unint64_t v4 = (*((uint64_t (**)(void))self->_countBlock + 2))();
  return v4;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t v4 = (void *)MEMORY[0x1A62450A0](self, a2);
  v5 = (*((void (**)(void))self->_objectAtIndexBlock + 2))();

  return v5;
}

- (id)_pas_unproxy
{
  v4.receiver = self;
  v4.super_class = (Class)_PASArrayProxy;
  id v2 = [(_PASArrayProxy *)&v4 copyWithZone:0];

  return v2;
}

- (_PASArrayProxy)initWithCoder:(id)a3
{
  result = (_PASArrayProxy *)a3;
  __break(1u);
  return result;
}

- (_PASArrayProxy)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v5 = (_PASArrayProxy *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:a3 count:a4];

  return v5;
}

@end