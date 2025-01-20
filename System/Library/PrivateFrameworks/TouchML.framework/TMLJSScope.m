@interface TMLJSScope
- (NSMutableSet)vars;
- (int)type;
- (void)addVar:(id)a3;
- (void)setType:(int)a3;
- (void)setVars:(id)a3;
@end

@implementation TMLJSScope

- (void)addVar:(id)a3
{
  v4 = (const char *)a3;
  vars = self->_vars;
  v9 = (char *)v4;
  if (!vars)
  {
    objc_msgSend_setWithCapacity_(MEMORY[0x263EFF9C0], v4, v5, 4);
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_vars;
    self->_vars = v7;

    v4 = v9;
    vars = self->_vars;
  }
  objc_msgSend_addObject_(vars, v4, v5, v4);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSMutableSet)vars
{
  return self->_vars;
}

- (void)setVars:(id)a3
{
}

- (void).cxx_destruct
{
}

@end