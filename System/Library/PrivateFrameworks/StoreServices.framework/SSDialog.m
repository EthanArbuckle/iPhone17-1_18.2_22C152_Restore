@interface SSDialog
- (NSArray)buttons;
- (NSDictionary)dialogDictionary;
- (NSString)dialogKind;
- (NSString)message;
- (NSString)title;
- (SSDialog)init;
- (SSDialog)initWithDialogDictionary:(id)a3;
- (SSDialogButton)defaultButton;
- (id)valueForProperty:(id)a3;
- (void)_setValue:(id)a3 forProperty:(id)a4;
- (void)dealloc;
- (void)setButtons:(id)a3;
- (void)setDefaultButton:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SSDialog

- (SSDialog)init
{
  v4.receiver = self;
  v4.super_class = (Class)SSDialog;
  v2 = [(SSDialog *)&v4 init];
  if (v2) {
    v2->_dialogDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (SSDialog)initWithDialogDictionary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SSDialog;
  objc_super v4 = [(SSDialog *)&v8 init];
  if (v4)
  {
    v5 = [[SSProtocolConditionalEvaluator alloc] initWithDictionary:a3];
    id v6 = [(SSProtocolConditionalEvaluator *)v5 dictionaryByEvaluatingConditions];

    v4->_dialogDictionary = (NSMutableDictionary *)[v6 mutableCopy];
    if (![(NSString *)[(SSDialog *)v4 title] length]
      && ![(NSString *)[(SSDialog *)v4 message] length]
      && ![(NSArray *)[(SSDialog *)v4 buttons] count])
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDialog;
  [(SSDialog *)&v3 dealloc];
}

- (NSArray)buttons
{
  buttons = self->_buttons;
  if (!buttons)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    AvailableKey = (void *)SSValueForFirstAvailableKey(self->_dialogDictionary, @"cancelButtonString", v5, v6, v7, v8, v9, v10, @"cancelButton");
    if ([AvailableKey length])
    {
      v18 = [[SSDialogButton alloc] initWithTitle:AvailableKey actionDictionary:SSValueForFirstAvailableKey(self->_dialogDictionary, @"cancelButtonAction", v12, v13, v14, v15, v16, v17, 0)];
      if (v18)
      {
        v19 = v18;
        [v4 addObject:v18];
      }
    }
    v20 = (void *)SSValueForFirstAvailableKey(self->_dialogDictionary, @"okButtonString", v12, v13, v14, v15, v16, v17, @"okButton");
    if ([v20 length])
    {
      v27 = [[SSDialogButton alloc] initWithTitle:v20 actionDictionary:SSValueForFirstAvailableKey(self->_dialogDictionary, @"okButtonAction", v21, v22, v23, v24, v25, v26, 0)];
      if (v27)
      {
        v28 = v27;
        [v4 addObject:v27];
      }
    }
    self->_buttons = (NSArray *)[v4 copy];

    buttons = self->_buttons;
  }
  v29 = buttons;
  return v29;
}

- (SSDialogButton)defaultButton
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  AvailableKey = (void *)SSValueForFirstAvailableKey(self->_dialogDictionary, @"defaultButton", v2, v3, v4, v5, v6, v7, 0);
  if (![AvailableKey length]) {
    return 0;
  }
  uint64_t v10 = [(SSDialog *)self buttons];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v11) {
    return 0;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v18;
LABEL_4:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v18 != v13) {
      objc_enumerationMutation(v10);
    }
    uint64_t v15 = *(SSDialogButton **)(*((void *)&v17 + 1) + 8 * v14);
    if ([(NSString *)[(SSDialogButton *)v15 buttonTitle] isEqualToString:AvailableKey])
    {
      return v15;
    }
    if (v12 == ++v14)
    {
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v15 = 0;
      if (v12) {
        goto LABEL_4;
      }
      return v15;
    }
  }
}

- (void)setDefaultButton:(id)a3
{
  uint64_t v4 = [a3 buttonTitle];
  [(SSDialog *)self _setValue:v4 forProperty:@"defaultButton"];
}

- (NSString)message
{
  return (NSString *)[(SSDialog *)self valueForProperty:@"explanation"];
}

- (NSString)title
{
  return (NSString *)[(SSDialog *)self valueForProperty:@"message"];
}

- (id)valueForProperty:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_dialogDictionary objectForKey:a3];
  return v3;
}

- (NSDictionary)dialogDictionary
{
  uint64_t v2 = (void *)[(NSMutableDictionary *)self->_dialogDictionary copy];
  return (NSDictionary *)v2;
}

- (NSString)dialogKind
{
  return (NSString *)[(SSDialog *)self valueForProperty:@"kind"];
}

- (void)setButtons:(id)a3
{
  if ([a3 count]) {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "buttonTitle");
  }
  else {
    uint64_t v5 = 0;
  }
  if ((unint64_t)[a3 count] < 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "buttonTitle");
  }
  [(SSDialog *)self _setValue:v5 forProperty:@"cancelButtonString"];
  [(SSDialog *)self _setValue:v6 forProperty:@"okButtonString"];
}

- (void)setMessage:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  dialogDictionary = self->_dialogDictionary;
  if (a3)
  {
    if (!dialogDictionary)
    {
      dialogDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_dialogDictionary = dialogDictionary;
    }
    [(NSMutableDictionary *)dialogDictionary setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)dialogDictionary removeObjectForKey:a4];
  }
}

@end