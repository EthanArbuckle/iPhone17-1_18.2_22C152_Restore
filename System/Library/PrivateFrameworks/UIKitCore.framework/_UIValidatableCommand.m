@interface _UIValidatableCommand
- (SEL)action;
- (_UIValidatableCommand)init;
- (id)alternates;
- (id)propertyList;
- (void)useCommand:(id)a3 alternate:(id)a4;
@end

@implementation _UIValidatableCommand

- (SEL)action
{
  SEL result = (SEL)self->_alternate;
  if (result) {
    return (SEL)[(id)result action];
  }
  SEL result = (SEL)self->_command;
  if (result) {
    return (SEL)[(id)result action];
  }
  return result;
}

- (id)propertyList
{
  return [(UICommand *)self->_command propertyList];
}

- (id)alternates
{
  return [(UICommand *)self->_command alternates];
}

- (_UIValidatableCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIValidatableCommand;
  return [(UICommand *)&v3 initWithTitle:&stru_1ED0E84C0 image:0 imageName:0 action:sel__nop_ propertyList:0 alternates:MEMORY[0x1E4F1CBF0] discoverabilityTitle:0 attributes:0 state:0];
}

- (void)useCommand:(id)a3 alternate:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_command, a3);
  objc_storeStrong((id *)&self->_alternate, a4);
  if (v7) {
    v8 = v7;
  }
  else {
    v8 = v13;
  }
  v9 = [v8 title];
  [(UICommand *)self setTitle:v9];

  v10 = [v13 image];
  [(UICommand *)self setImage:v10];

  v11 = [v13 selectedImage];
  [(UICommand *)self setSelectedImage:v11];

  v12 = [v13 discoverabilityTitle];
  [(UICommand *)self setDiscoverabilityTitle:v12];

  -[UICommand setAttributes:](self, "setAttributes:", [v13 attributes]);
  -[UICommand setState:](self, "setState:", [v13 state]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternate, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

@end