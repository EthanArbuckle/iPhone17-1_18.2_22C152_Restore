@interface _TUIElementStructBuilder
- ($201E9A47BE70A2B12CCA2F48B75AA2F7)name;
- (_TUIElementStructBuilder)initWithName:(id)a3 closure:(id)a4 basedOn:(id)a5 context:(id)a6;
@end

@implementation _TUIElementStructBuilder

- (_TUIElementStructBuilder)initWithName:(id)a3 closure:(id)a4 basedOn:(id)a5 context:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)_TUIElementStructBuilder;
  result = [(TUIStructBuilder *)&v8 initWithClosure:a4.var0 basedOn:a5 context:a6];
  if (result) {
    result->_name = ($8F956C3B7BF5D682F604C81DDB625920)a3;
  }
  return result;
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)name
{
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)self->_name;
}

@end