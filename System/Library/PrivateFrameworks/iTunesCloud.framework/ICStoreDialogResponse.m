@interface ICStoreDialogResponse
- (BOOL)isBiometricAuthenticationAllowed;
- (BOOL)isInitialCheckboxValue;
- (ICStoreDialogResponse)initWithResponseDictionary:(id)a3;
- (NSArray)buttons;
- (NSDictionary)responseDictionary;
- (NSString)explanation;
- (NSString)message;
- (id)_buttonActionKeyForType:(int64_t)a3;
- (id)_buttonTitleKeyForType:(int64_t)a3;
- (id)_buttonWithType:(int64_t)a3;
- (id)debugDescription;
- (int64_t)defaultButtonType;
- (int64_t)type;
@end

@implementation ICStoreDialogResponse

- (void).cxx_destruct
{
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (id)_buttonActionKeyForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E5ACB440[a3 - 1];
  }
}

- (id)_buttonTitleKeyForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E5ACB428[a3 - 1];
  }
}

- (id)_buttonWithType:(int64_t)a3
{
  v5 = -[ICStoreDialogResponse _buttonTitleKeyForType:](self, "_buttonTitleKeyForType:");
  if (v5)
  {
    v6 = [(NSDictionary *)self->_responseDictionary objectForKey:v5];
  }
  else
  {
    v6 = 0;
  }
  if (_NSIsNSString())
  {
    v7 = [(ICStoreDialogResponse *)self _buttonActionKeyForType:a3];
    if (v7)
    {
      v8 = [(NSDictionary *)self->_responseDictionary objectForKey:v7];
    }
    else
    {
      v8 = 0;
    }
    if (_NSIsNSDictionary()) {
      v10 = [[ICStoreDialogResponseButtonAction alloc] initWithResponseButtonActionDictionary:v8];
    }
    else {
      v10 = 0;
    }
    v9 = [[ICStoreDialogResponseButton alloc] initWithType:a3 isDefaultButton:[(ICStoreDialogResponse *)self defaultButtonType] == a3 title:v6 action:v10];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)defaultButtonType
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"defaultButton"];
  if (_NSIsNSString())
  {
    if ([v2 isEqualToString:@"ok"])
    {
      int64_t v3 = 1;
    }
    else if ([v2 isEqualToString:@"cancel"])
    {
      int64_t v3 = 2;
    }
    else if ([v2 isEqualToString:@"other"])
    {
      int64_t v3 = 3;
    }
    else
    {
      int64_t v3 = 0;
    }
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (NSArray)buttons
{
  int64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(ICStoreDialogResponse *)self _buttonWithType:1];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = [(ICStoreDialogResponse *)self _buttonWithType:2];
  if (v5) {
    [v3 addObject:v5];
  }
  v6 = [(ICStoreDialogResponse *)self _buttonWithType:3];
  if (v6) {
    [v3 addObject:v6];
  }

  return (NSArray *)v3;
}

- (NSString)message
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"message"];
  if (_NSIsNSString()) {
    int64_t v3 = v2;
  }
  else {
    int64_t v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (BOOL)isBiometricAuthenticationAllowed
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"m-allowed"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)isInitialCheckboxValue
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"initialCheckboxValue"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (NSString)explanation
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"explanation"];
  if (_NSIsNSString()) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (int64_t)type
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"kind"];
  if (_NSIsNSString()) {
    int64_t v3 = [v2 isEqualToString:@"authorization"];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)debugDescription
{
  int64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p responseDictionary: %@>", v5, self, self->_responseDictionary];

  return v6;
}

- (ICStoreDialogResponse)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStoreDialogResponse;
  v5 = [(ICStoreDialogResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end