@interface WFSwitchParameter
+ (NSString)defaultLocalizedOffDisplayName;
+ (NSString)defaultLocalizedOnDisplayName;
- (Class)singleStateClass;
- (NSString)localizedOffDisplayName;
- (NSString)localizedOnDisplayName;
- (WFSwitchParameter)initWithDefinition:(id)a3;
@end

@implementation WFSwitchParameter

- (WFSwitchParameter)initWithDefinition:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)WFSwitchParameter;
  v3 = [(WFParameter *)&v17 initWithDefinition:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(WFParameter *)v3 definition];
    v6 = [v5 objectForKey:@"OnDisplayName"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      localizedOnDisplayName = v4->_localizedOnDisplayName;
      v4->_localizedOnDisplayName = v7;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 localize];
      }
      else {
      uint64_t v9 = +[WFSwitchParameter defaultLocalizedOnDisplayName];
      }
      localizedOnDisplayName = v4->_localizedOnDisplayName;
      v4->_localizedOnDisplayName = (NSString *)v9;
    }

    v10 = [(WFParameter *)v4 definition];
    v11 = [v10 objectForKey:@"OffDisplayName"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = v11;
      localizedOffDisplayName = v4->_localizedOffDisplayName;
      v4->_localizedOffDisplayName = v12;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v11 localize];
      }
      else {
      uint64_t v14 = +[WFSwitchParameter defaultLocalizedOffDisplayName];
      }
      localizedOffDisplayName = v4->_localizedOffDisplayName;
      v4->_localizedOffDisplayName = (NSString *)v14;
    }

    v15 = v4;
  }

  return v4;
}

+ (NSString)defaultLocalizedOnDisplayName
{
  return (NSString *)WFLocalizedStringWithKey(@"On (Switch display name)", @"On");
}

+ (NSString)defaultLocalizedOffDisplayName
{
  return (NSString *)WFLocalizedStringWithKey(@"Off (Switch display name)", @"Off");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedOffDisplayName, 0);
  objc_storeStrong((id *)&self->_localizedOnDisplayName, 0);
}

- (NSString)localizedOffDisplayName
{
  return self->_localizedOffDisplayName;
}

- (NSString)localizedOnDisplayName
{
  return self->_localizedOnDisplayName;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end