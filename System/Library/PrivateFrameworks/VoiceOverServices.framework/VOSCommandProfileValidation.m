@interface VOSCommandProfileValidation
+ (id)gestureAssignedToOtherCommandValidation:(id)a3;
+ (id)gestureIsRequiredValidation;
+ (id)keyboardShortcutAssignedToOtherCommandValidation:(id)a3;
+ (id)successfulValidation;
- (BOOL)isGestureAlreadyAssignedToCommand;
- (BOOL)isGestureAssignedToOtherCommand;
- (BOOL)isKeyboardShortcutAlreadyAssignedToCommand;
- (BOOL)isKeyboardShortcutAssignedToOtherCommand;
- (BOOL)isSuccessful;
- (NSString)localizedErrorMessage;
- (NSString)localizedErrorTitle;
- (VOSCommand)previouslyBoundCommand;
- (VOSCommandProfileValidation)init;
- (VOSCommandProfileValidation)initWithType:(int64_t)a3;
- (void)setPreviouslyBoundCommand:(id)a3;
@end

@implementation VOSCommandProfileValidation

- (VOSCommandProfileValidation)init
{
  return [(VOSCommandProfileValidation *)self initWithType:0];
}

- (VOSCommandProfileValidation)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VOSCommandProfileValidation;
  result = [(VOSCommandProfileValidation *)&v5 init];
  if (result) {
    result->_validationType = a3;
  }
  return result;
}

+ (id)successfulValidation
{
  v2 = [[VOSCommandProfileValidation alloc] initWithType:0];

  return v2;
}

+ (id)gestureAssignedToOtherCommandValidation:(id)a3
{
  id v3 = a3;
  v4 = [[VOSCommandProfileValidation alloc] initWithType:2];
  [(VOSCommandProfileValidation *)v4 setPreviouslyBoundCommand:v3];

  return v4;
}

+ (id)keyboardShortcutAssignedToOtherCommandValidation:(id)a3
{
  id v3 = a3;
  v4 = [[VOSCommandProfileValidation alloc] initWithType:4];
  [(VOSCommandProfileValidation *)v4 setPreviouslyBoundCommand:v3];

  return v4;
}

+ (id)gestureIsRequiredValidation
{
  v2 = [[VOSCommandProfileValidation alloc] initWithType:5];

  return v2;
}

- (BOOL)isSuccessful
{
  return self->_validationType == 0;
}

- (BOOL)isGestureAlreadyAssignedToCommand
{
  return self->_validationType == 1;
}

- (BOOL)isGestureAssignedToOtherCommand
{
  return self->_validationType == 2;
}

- (BOOL)isKeyboardShortcutAlreadyAssignedToCommand
{
  return self->_validationType == 3;
}

- (BOOL)isKeyboardShortcutAssignedToOtherCommand
{
  return self->_validationType == 4;
}

- (NSString)localizedErrorTitle
{
  unint64_t v2 = self->_validationType - 1;
  if (v2 > 4)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = VOSLocString(off_2643FD8F8[v2]);
  }

  return (NSString *)v3;
}

- (NSString)localizedErrorMessage
{
  switch(self->_validationType)
  {
    case 1:
      id v3 = @"gesture.already.assigned.message";
      goto LABEL_9;
    case 2:
      objc_super v5 = NSString;
      v6 = @"gesture.in.use.message";
      goto LABEL_7;
    case 3:
      id v3 = @"keyboard.shortcut.already.assigned.message";
      goto LABEL_9;
    case 4:
      objc_super v5 = NSString;
      v6 = @"keyboard.shortcut.in.use.message";
LABEL_7:
      v7 = VOSLocString(v6);
      v8 = [(VOSCommandProfileValidation *)self previouslyBoundCommand];
      v9 = [v8 localizedName];
      v4 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v9);

      break;
    case 5:
      id v3 = @"gesture.required.message";
LABEL_9:
      v4 = VOSLocString(v3);
      break;
    default:
      v4 = 0;
      break;
  }

  return (NSString *)v4;
}

- (VOSCommand)previouslyBoundCommand
{
  return self->_previouslyBoundCommand;
}

- (void)setPreviouslyBoundCommand:(id)a3
{
}

- (void).cxx_destruct
{
}

@end