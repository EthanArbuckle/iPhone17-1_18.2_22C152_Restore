@interface THWControlLayout
- (BOOL)invalidControlFlag;
- (THWControlLayout)init;
- (THWControlLayout)initWithInfo:(id)a3;
- (THWControlLayout)initWithTag:(unint64_t)a3;
- (THWControlLayout)initWithTag:(unint64_t)a3 index:(unint64_t)a4;
- (id)computeLayoutGeometry;
- (unint64_t)index;
- (unint64_t)tag;
- (void)dealloc;
- (void)invalidateControl;
- (void)setIndex:(unint64_t)a3;
- (void)setTag:(unint64_t)a3;
- (void)validate;
@end

@implementation THWControlLayout

- (THWControlLayout)init
{
  return [(THWControlLayout *)self initWithTag:0x7FFFFFFFFFFFFFFFLL index:0x7FFFFFFFFFFFFFFFLL];
}

- (THWControlLayout)initWithInfo:(id)a3
{
  return [(THWControlLayout *)self initWithTag:0x7FFFFFFFFFFFFFFFLL index:0x7FFFFFFFFFFFFFFFLL];
}

- (THWControlLayout)initWithTag:(unint64_t)a3
{
  return [(THWControlLayout *)self initWithTag:a3 index:0x7FFFFFFFFFFFFFFFLL];
}

- (THWControlLayout)initWithTag:(unint64_t)a3 index:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THWControlLayout;
  result = [(THWControlLayout *)&v7 initWithInfo:0];
  if (result)
  {
    result->_invalidControlFlag = 1;
    result->_tag = a3;
    result->_index = a4;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)THWControlLayout;
  [(THWControlLayout *)&v2 dealloc];
}

- (void)validate
{
  [(THWControlLayout *)self invalidateFrame];
  v3.receiver = self;
  v3.super_class = (Class)THWControlLayout;
  [(THWControlLayout *)&v3 validate];
  self->_invalidControlFlag = 0;
}

- (id)computeLayoutGeometry
{
  id v3 = [(THWControlLayout *)self i_layoutGeometryProvider];

  return [v3 layoutGeometryForLayout:self];
}

- (void)invalidateControl
{
  if (!self->_invalidControlFlag)
  {
    self->_invalidControlFlag = 1;
    [(THWControlLayout *)self invalidate];
  }
}

- (unint64_t)tag
{
  return self->_tag;
}

- (void)setTag:(unint64_t)a3
{
  self->_tag = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (BOOL)invalidControlFlag
{
  return self->_invalidControlFlag;
}

@end