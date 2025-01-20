@interface WFActionAuxiliaryButton
+ (WFActionAuxiliaryButton)buttonWithTitle:(id)a3 symbolName:(id)a4 handler:(id)a5;
- (NSString)symbolName;
- (NSString)title;
- (WFActionAuxiliaryButton)initWithTitle:(id)a3 symbolName:(id)a4 handler:(id)a5;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setSymbolName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFActionAuxiliaryButton

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setSymbolName:(id)a3
{
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (WFActionAuxiliaryButton)initWithTitle:(id)a3 symbolName:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFActionAuxiliaryButton;
  v12 = [(WFActionAuxiliaryButton *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_symbolName, a4);
    v14 = _Block_copy(v11);
    id handler = v13->_handler;
    v13->_id handler = v14;

    v16 = v13;
  }

  return v13;
}

+ (WFActionAuxiliaryButton)buttonWithTitle:(id)a3 symbolName:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithTitle:v10 symbolName:v9 handler:v8];

  return (WFActionAuxiliaryButton *)v11;
}

@end