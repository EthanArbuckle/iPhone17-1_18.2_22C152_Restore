@interface WBSUserTypedFormString
- (NSString)completion;
- (NSString)userTypedString;
- (WBSUserTypedFormString)initWithUserTypedString:(id)a3;
@end

@implementation WBSUserTypedFormString

- (WBSUserTypedFormString)initWithUserTypedString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSUserTypedFormString;
  v5 = [(WBSUserTypedFormString *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    userTypedString = v5->_userTypedString;
    v5->_userTypedString = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)completion
{
  return self->_userTypedString;
}

- (NSString)userTypedString
{
  return self->_userTypedString;
}

- (void).cxx_destruct
{
}

@end