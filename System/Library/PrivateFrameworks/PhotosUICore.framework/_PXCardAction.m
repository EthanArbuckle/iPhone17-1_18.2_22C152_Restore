@interface _PXCardAction
- (NSString)title;
- (_PXCardAction)init;
- (_PXCardAction)initWithTitle:(id)a3 action:(id)a4;
- (id)action;
@end

@implementation _PXCardAction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)action
{
  return self->_action;
}

- (NSString)title
{
  return self->_title;
}

- (_PXCardAction)initWithTitle:(id)a3 action:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXRetailExperienceCardView.m", 29, @"Invalid parameter not satisfying: %@", @"title != nil" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)_PXCardAction;
  v9 = [(_PXCardAction *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    title = v9->_title;
    v9->_title = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    id action = v9->_action;
    v9->_id action = (id)v12;
  }
  return v9;
}

- (_PXCardAction)init
{
  return [(_PXCardAction *)self initWithTitle:&stru_1F00B0030 action:0];
}

@end