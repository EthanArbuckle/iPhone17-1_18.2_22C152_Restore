@interface RBDrawableItem
- ($3CC19D079FD0B010EE84973AA846B91B)sourceRect;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)clearColor;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)destinationOffset;
- (RBDisplayListContents)displayList;
- (id).cxx_construct;
- (int)initialState;
- (void)setClearColor:(id)a3;
- (void)setDestinationOffset:(id *)a3;
- (void)setDisplayList:(id)a3;
- (void)setInitialState:(int)a3;
- (void)setSourceRect:(id *)a3;
@end

@implementation RBDrawableItem

- (void)setDisplayList:(id)a3
{
  p = self->_list._p;
  if (p != a3)
  {

    self->_list._p = (RBDisplayList *)a3;
  }
}

- (RBDisplayListContents)displayList
{
  return (RBDisplayListContents *)self->_list._p;
}

- ($3CC19D079FD0B010EE84973AA846B91B)sourceRect
{
  long long v3 = *(_OWORD *)&self[2].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)setSourceRect:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_sourceRect.x = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_sourceRect.width = v3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)destinationOffset
{
  *($B15351F604C5A8240EC3E8415888573B *)retstr = *($B15351F604C5A8240EC3E8415888573B *)((char *)self + 40);
  return self;
}

- (void)setDestinationOffset:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_destinationOffset.z = a3->var2;
  *(_OWORD *)&self->_destinationOffset.x = v3;
}

- (int)initialState
{
  return self->_initialState;
}

- (void)setInitialState:(int)a3
{
  self->_initialState = a3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)clearColor
{
  float red = self->_clearColor.red;
  float green = self->_clearColor.green;
  float blue = self->_clearColor.blue;
  float alpha = self->_clearColor.alpha;
  result.var3 = alpha;
  result.var2 = blue;
  result.var1 = green;
  result.var0 = red;
  return result;
}

- (void)setClearColor:(id)a3
{
  self->_clearColor = ($F6F15AA9EF86AD1416F06DA9210B6734)a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end