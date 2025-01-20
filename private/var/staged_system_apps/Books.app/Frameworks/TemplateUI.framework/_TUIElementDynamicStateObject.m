@interface _TUIElementDynamicStateObject
- ($201E9A47BE70A2B12CCA2F48B75AA2F7)binding;
- (NSString)kind;
- (id)instance;
- (id)parameters;
- (void)setBinding:(id)a3;
- (void)setInstance:(id)a3;
- (void)setKind:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation _TUIElementDynamicStateObject

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)binding
{
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)self->_binding;
}

- (void)setBinding:(id)a3
{
  self->_binding = ($8F956C3B7BF5D682F604C81DDB625920)a3;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (id)instance
{
  return self->_instance;
}

- (void)setInstance:(id)a3
{
}

- (id)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_parameters, 0);
  objc_storeStrong(&self->_instance, 0);

  objc_storeStrong((id *)&self->_kind, 0);
}

@end