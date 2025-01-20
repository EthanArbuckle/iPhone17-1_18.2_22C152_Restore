@interface PSConfirmationSpecifier
+ (id)preferenceSpecifierNamed:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9;
+ (id)specifierWithSpecifier:(id)a3;
- (BOOL)isAlternateDestructive;
- (BOOL)isDestructive;
- (BOOL)isEqualToSpecifier:(id)a3;
- (NSString)alternateButton;
- (NSString)cancelButton;
- (NSString)okButton;
- (NSString)prompt;
- (NSString)title;
- (void)setAlternateButton:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setOkButton:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setTitle:(id)a3;
- (void)setupWithDictionary:(id)a3;
@end

@implementation PSConfirmationSpecifier

+ (id)preferenceSpecifierNamed:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9
{
  id v14 = a4;
  id v15 = a3;
  v16 = objc_alloc_init(PSConfirmationSpecifier);
  [(PSSpecifier *)v16 setName:v15];

  objc_storeWeak(&v16->super.target, v14);
  v16->super.getter = a6;
  v16->super.setter = a5;
  v16->super.detailControllerClass = a7;
  v16->super.cellType = a8;
  v16->super.editPaneClass = a9;
  return v16;
}

+ (id)specifierWithSpecifier:(id)a3
{
  id v4 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___PSConfirmationSpecifier;
  v5 = objc_msgSendSuper2(&v13, sel_specifierWithSpecifier_, v4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    v7 = [v6 title];
    [v5 setTitle:v7];

    v8 = [v6 prompt];
    [v5 setPrompt:v8];

    v9 = [v6 okButton];
    [v5 setOkButton:v9];

    v10 = [v6 alternateButton];
    [v5 setAlternateButton:v10];

    v11 = [v6 cancelButton];

    [v5 setCancelButton:v11];
  }

  return v5;
}

- (void)setupWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"title"];
  [(PSConfirmationSpecifier *)self setTitle:v5];

  id v6 = [v4 objectForKey:@"prompt"];
  [(PSConfirmationSpecifier *)self setPrompt:v6];

  v7 = [v4 objectForKey:@"okTitle"];
  [(PSConfirmationSpecifier *)self setOkButton:v7];

  v8 = [v4 objectForKey:@"altTitle"];
  [(PSConfirmationSpecifier *)self setAlternateButton:v8];

  id v9 = [v4 objectForKey:@"cancelTitle"];

  [(PSConfirmationSpecifier *)self setCancelButton:v9];
}

- (BOOL)isDestructive
{
  v2 = [(PSSpecifier *)self propertyForKey:@"isDestructive"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isAlternateDestructive
{
  v2 = [(PSSpecifier *)self propertyForKey:@"isAlternateDestructive"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isEqualToSpecifier:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PSConfirmationSpecifier;
  if ([(PSSpecifier *)&v19 isEqualToSpecifier:v4])
  {
    id v5 = v4;
    id v6 = v5;
    if (self->_title) {
      title = (__CFString *)self->_title;
    }
    else {
      title = &stru_1EFB51FD0;
    }
    v8 = [v5 title];
    if ([(__CFString *)title isEqualToString:v8])
    {
      if (self->_prompt) {
        prompt = (__CFString *)self->_prompt;
      }
      else {
        prompt = &stru_1EFB51FD0;
      }
      v10 = [v6 prompt];
      if ([(__CFString *)prompt isEqualToString:v10])
      {
        if (self->_okButton) {
          okButton = (__CFString *)self->_okButton;
        }
        else {
          okButton = &stru_1EFB51FD0;
        }
        v12 = [v6 okButton];
        if ([(__CFString *)okButton isEqualToString:v12])
        {
          if (self->_alternateButton) {
            alternateButton = (__CFString *)self->_alternateButton;
          }
          else {
            alternateButton = &stru_1EFB51FD0;
          }
          id v14 = [v6 alternateButton];
          if ([(__CFString *)alternateButton isEqualToString:v14])
          {
            if (self->_cancelButton) {
              cancelButton = (__CFString *)self->_cancelButton;
            }
            else {
              cancelButton = &stru_1EFB51FD0;
            }
            v16 = [v6 cancelButton];
            char v17 = [(__CFString *)cancelButton isEqualToString:v16];
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
}

- (NSString)okButton
{
  return self->_okButton;
}

- (void)setOkButton:(id)a3
{
}

- (NSString)alternateButton
{
  return self->_alternateButton;
}

- (void)setAlternateButton:(id)a3
{
}

- (NSString)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end