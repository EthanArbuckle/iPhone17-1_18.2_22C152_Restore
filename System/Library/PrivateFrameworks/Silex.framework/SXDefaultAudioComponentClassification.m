@interface SXDefaultAudioComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4;
- (Class)componentModelClass;
- (id)layoutRules;
@end

@implementation SXDefaultAudioComponentClassification

+ (id)typeString
{
  return @"audio";
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

- (id)layoutRules
{
  return +[SXComponentLayoutRules twoColumnLayoutRules];
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SXDefaultAudioComponentClassification;
    BOOL v7 = [(SXComponentClassification *)&v9 hasAffiliationWithClassification:v6 forDirection:a4];
  }

  return v7;
}

@end