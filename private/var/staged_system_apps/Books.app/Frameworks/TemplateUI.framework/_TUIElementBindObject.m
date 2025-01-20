@interface _TUIElementBindObject
- ($738B17BD11CC339B30296C0EA03CEC2B)select;
- (TUIDynamicInstantiateOptions)options;
- (void)setOptions:(id)a3;
- (void)setSelect:(id)a3;
@end

@implementation _TUIElementBindObject

- ($738B17BD11CC339B30296C0EA03CEC2B)select
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_select.index;
}

- (void)setSelect:(id)a3
{
  self->_select.index = a3.var0;
}

- (TUIDynamicInstantiateOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end