@interface RUIScriptingStaticFunction
- (const)identifier;
- (id)description;
- (int)JSPropertyAttributes;
- (void)function;
- (void)setFunction:(void *)a3;
- (void)setIdentifier:(const char *)a3;
- (void)setJSPropertyAttributes:(int)a3;
@end

@implementation RUIScriptingStaticFunction

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p '%s'>", objc_opt_class(), self, -[RUIScriptingStaticFunction identifier](self, "identifier")];
}

- (const)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(const char *)a3
{
  self->_identifier = a3;
}

- (void)function
{
  return self->_function;
}

- (void)setFunction:(void *)a3
{
  self->_function = a3;
}

- (int)JSPropertyAttributes
{
  return self->_JSPropertyAttributes;
}

- (void)setJSPropertyAttributes:(int)a3
{
  self->_JSPropertyAttributes = a3;
}

@end