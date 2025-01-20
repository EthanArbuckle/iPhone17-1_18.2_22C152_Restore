@interface TUICursorAccessoryAssertion
- (NSString)description;
- (TUICursorAccessory)accessory;
- (TUICursorAccessoryAssertion)initWithAccessoryType:(unint64_t)a3 accessory:(id)a4 controller:(id)a5;
- (TUICursorAccessoryAssertionController)controller;
- (unint64_t)accessoryType;
- (void)dealloc;
- (void)invalidate;
- (void)setAccessory:(id)a3;
- (void)setAccessoryType:(unint64_t)a3;
- (void)setController:(id)a3;
@end

@implementation TUICursorAccessoryAssertion

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (void)setController:(id)a3
{
}

- (TUICursorAccessoryAssertionController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (TUICursorAccessoryAssertionController *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (TUICursorAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessoryType:(unint64_t)a3
{
  self->_accessoryType = a3;
}

- (unint64_t)accessoryType
{
  return self->_accessoryType;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(TUICursorAccessoryAssertion *)self accessoryType];
  v7 = [(TUICursorAccessoryAssertion *)self accessory];
  v8 = [v3 stringWithFormat:@"<%@:%p %lux %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = TUIAssertionLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    unint64_t v6 = "-[TUICursorAccessoryAssertion invalidate]";
    _os_log_debug_impl(&dword_18D47E000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(TUICursorAccessoryAssertion *)self controller];
  [v4 endTrackingAssertion:self];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = TUIAssertionLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v6 = "-[TUICursorAccessoryAssertion dealloc]";
    _os_log_debug_impl(&dword_18D47E000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  [(TUICursorAccessoryAssertion *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)TUICursorAccessoryAssertion;
  [(TUICursorAccessoryAssertion *)&v4 dealloc];
}

- (TUICursorAccessoryAssertion)initWithAccessoryType:(unint64_t)a3 accessory:(id)a4 controller:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TUICursorAccessoryAssertion;
  v10 = [(TUICursorAccessoryAssertion *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(TUICursorAccessoryAssertion *)v10 setAccessoryType:a3];
    [(TUICursorAccessoryAssertion *)v11 setAccessory:v8];
    [(TUICursorAccessoryAssertion *)v11 setController:v9];
  }

  return v11;
}

@end