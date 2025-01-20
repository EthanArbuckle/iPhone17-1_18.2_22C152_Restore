@interface ICStoreDialogResponseButtonAction
- (ICStoreDialogResponseButtonAction)initWithResponseButtonActionDictionary:(id)a3;
- (NSDictionary)actionDictionary;
- (NSString)URLString;
- (NSString)buyParams;
- (NSString)itemName;
- (NSString)kind;
- (NSString)subtarget;
- (int64_t)type;
@end

@implementation ICStoreDialogResponseButtonAction

- (void).cxx_destruct
{
}

- (NSDictionary)actionDictionary
{
  return self->_actionDictionary;
}

- (NSString)kind
{
  v2 = [(NSDictionary *)self->_actionDictionary objectForKey:@"kind"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)URLString
{
  v2 = [(NSDictionary *)self->_actionDictionary objectForKey:@"url"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSString)subtarget
{
  v2 = [(NSDictionary *)self->_actionDictionary objectForKey:@"subtarget"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSString)itemName
{
  v2 = [(NSDictionary *)self->_actionDictionary objectForKey:@"itemName"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSString)buyParams
{
  v2 = [(NSDictionary *)self->_actionDictionary objectForKey:@"buyParams"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (int64_t)type
{
  v2 = [(NSDictionary *)self->_actionDictionary objectForKey:@"kind"];
  if (_NSIsNSString())
  {
    if ([v2 isEqualToString:@"Buy"])
    {
      int64_t v3 = 1;
    }
    else if ([v2 isEqualToString:@"Goto"])
    {
      int64_t v3 = 2;
    }
    else if ([v2 isEqualToString:@"GotoFinance"])
    {
      int64_t v3 = 3;
    }
    else if ([v2 isEqualToString:@"OpenURL"])
    {
      int64_t v3 = 4;
    }
    else if ([v2 caseInsensitiveCompare:@"GoBack"])
    {
      int64_t v3 = 5;
    }
    else if ([v2 isEqualToString:@"QRCode"])
    {
      int64_t v3 = 6;
    }
    else if ([v2 isEqualToString:@"redeem-code"])
    {
      int64_t v3 = 7;
    }
    else if ([v2 isEqualToString:@"Review"])
    {
      int64_t v3 = 8;
    }
    else if ([v2 isEqualToString:@"RetryRestoreAll"])
    {
      int64_t v3 = 9;
    }
    else if ([v2 isEqualToString:@"ServiceAction"])
    {
      int64_t v3 = 10;
    }
    else if ([v2 isEqualToString:@"FamilyPermissionAction"])
    {
      int64_t v3 = 11;
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

- (ICStoreDialogResponseButtonAction)initWithResponseButtonActionDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStoreDialogResponseButtonAction;
  v5 = [(ICStoreDialogResponseButtonAction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    actionDictionary = v5->_actionDictionary;
    v5->_actionDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end