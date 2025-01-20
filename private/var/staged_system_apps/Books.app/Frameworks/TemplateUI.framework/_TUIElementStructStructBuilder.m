@interface _TUIElementStructStructBuilder
- ($7E080378D8F67055EE0984892F39872B)name;
- (_TUIElementStructStructBuilder)initWithName:(id)a3 closure:(id)a4 basedOn:(id)a5 context:(id)a6;
@end

@implementation _TUIElementStructStructBuilder

- (_TUIElementStructStructBuilder)initWithName:(id)a3 closure:(id)a4 basedOn:(id)a5 context:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)_TUIElementStructStructBuilder;
  result = [(TUIStructBuilder *)&v8 initWithClosure:a4.var0 basedOn:a5 context:a6];
  if (result) {
    result->_name.index = a3.var0;
  }
  return result;
}

- ($7E080378D8F67055EE0984892F39872B)name
{
  return ($7E080378D8F67055EE0984892F39872B)self->_name.index;
}

@end