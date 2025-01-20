@interface _UIMenuLeafValidation
- (_UIMenuLeafValidation)init;
- (id)validatedActionForTarget:(id)a3 action:(id)a4;
- (id)validatedCommandForTarget:(id)a3 command:(id)a4 alternate:(id)a5 sender:(id)a6;
@end

@implementation _UIMenuLeafValidation

- (_UIMenuLeafValidation)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIMenuLeafValidation;
  v2 = [(_UIMenuLeafValidation *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_UIValidatableCommand);
    validatedCommand = v2->_validatedCommand;
    v2->_validatedCommand = v3;
  }
  return v2;
}

- (id)validatedActionForTarget:(id)a3 action:(id)a4
{
  id v4 = a4;
  return v4;
}

- (id)validatedCommandForTarget:(id)a3 command:(id)a4 alternate:(id)a5 sender:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    if (objc_opt_respondsToSelector())
    {
      [(_UIValidatableCommand *)self->_validatedCommand useCommand:v11 alternate:v12];
      validatedCommand = self->_validatedCommand;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76___UIMenuLeafValidation_validatedCommandForTarget_command_alternate_sender___block_invoke;
      v17[3] = &unk_1E52D9F98;
      id v18 = v10;
      v19 = self;
      [(UICommand *)validatedCommand _performWithSender:v13 handler:v17];
      v15 = self->_validatedCommand;
    }
    else
    {
      v15 = (_UIValidatableCommand *)v11;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
}

@end