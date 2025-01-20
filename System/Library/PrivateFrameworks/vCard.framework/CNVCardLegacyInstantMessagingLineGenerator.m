@interface CNVCardLegacyInstantMessagingLineGenerator
- (id)makeLineWithName:(id)a3 value:(id)a4;
@end

@implementation CNVCardLegacyInstantMessagingLineGenerator

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v8 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  v11 = [v10 objectForKey:@"username"];
  v14.receiver = self;
  v14.super_class = (Class)CNVCardLegacyInstantMessagingLineGenerator;
  v12 = [(CNVCardLineGenerator *)&v14 makeLineWithName:v7 value:v11];

  return v12;
}

@end