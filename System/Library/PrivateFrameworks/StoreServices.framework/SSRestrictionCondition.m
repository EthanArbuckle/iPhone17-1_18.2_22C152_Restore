@interface SSRestrictionCondition
- (BOOL)evaluateWithContext:(id)a3;
- (SSRestrictionCondition)initWithDictionary:(id)a3;
- (void)dealloc;
@end

@implementation SSRestrictionCondition

- (SSRestrictionCondition)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSRestrictionCondition;
  v4 = -[SSProtocolCondition initWithDictionary:](&v7, sel_initWithDictionary_);
  if (v4)
  {
    v5 = (void *)[a3 objectForKey:@"restriction-name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_restrictionName = (NSString *)v5;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSRestrictionCondition;
  [(SSProtocolCondition *)&v3 dealloc];
}

- (BOOL)evaluateWithContext:(id)a3
{
  if (self->_restrictionName) {
    int v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", a3), "effectiveRestrictedBoolValueForSetting:", self->_restrictionName);
  }
  else {
    int v4 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    char v5 = [self->super._value BOOLValue];
  }
  else {
    char v5 = 0;
  }
  return (v4 == 2) ^ v5 ^ (self->super._operator == 1);
}

@end