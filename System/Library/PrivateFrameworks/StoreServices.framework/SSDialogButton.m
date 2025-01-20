@interface SSDialogButton
+ (SSDialogButton)buttonWithTitle:(id)a3;
- (NSString)URLTarget;
- (NSString)buttonAction;
- (NSString)buttonTitle;
- (SSDialogButton)init;
- (SSDialogButton)initWithTitle:(id)a3 actionDictionary:(id)a4;
- (id)actionParameter;
- (id)valueForActionProperty:(id)a3;
- (void)dealloc;
@end

@implementation SSDialogButton

- (SSDialogButton)init
{
  return [(SSDialogButton *)self initWithTitle:0 actionDictionary:0];
}

- (SSDialogButton)initWithTitle:(id)a3 actionDictionary:(id)a4
{
  if (![a3 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Button must have a title"];
  }
  v9.receiver = self;
  v9.super_class = (Class)SSDialogButton;
  v7 = [(SSDialogButton *)&v9 init];
  if (v7)
  {
    v7->_actionDictionary = (NSDictionary *)[a4 copy];
    v7->_title = (NSString *)[a3 copy];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDialogButton;
  [(SSDialogButton *)&v3 dealloc];
}

- (NSString)buttonTitle
{
  v2 = self->_title;
  return v2;
}

+ (SSDialogButton)buttonWithTitle:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithTitle:a3 actionDictionary:0];
  return (SSDialogButton *)v3;
}

- (id)actionParameter
{
  id v8 = (id)SSValueForFirstAvailableKey(self->_actionDictionary, @"buyParams", v2, v3, v4, v5, v6, v7, @"buy-params");
  return v8;
}

- (NSString)buttonAction
{
  uint64_t v2 = [(SSDialogButton *)self valueForActionProperty:@"kind"];
  if ([(NSString *)v2 caseInsensitiveCompare:@"goback"]) {
    return v2;
  }
  else {
    return (NSString *)@"goback";
  }
}

- (NSString)URLTarget
{
  return (NSString *)[(SSDialogButton *)self valueForActionProperty:@"subtarget"];
}

- (id)valueForActionProperty:(id)a3
{
  id v3 = [(NSDictionary *)self->_actionDictionary objectForKey:a3];
  return v3;
}

@end