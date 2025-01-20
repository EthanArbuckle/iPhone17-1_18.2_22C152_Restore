@interface SXBodyComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (BOOL)accessibilitySkippedDuringReadAll;
- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4;
- (id)layoutRules;
- (id)textRules;
@end

@implementation SXBodyComponentClassification

+ (id)typeString
{
  return @"text";
}

+ (id)roleString
{
  return @"body";
}

+ (int)role
{
  return 3;
}

- (BOOL)accessibilitySkippedDuringReadAll
{
  return 0;
}

- (id)layoutRules
{
  return +[SXComponentLayoutRules bodyComponentLayoutRules];
}

- (id)textRules
{
  return +[SXComponentTextRules bodyTextRules];
}

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  id v6 = a3;
  if (!a4
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SXBodyComponentClassification;
    BOOL v7 = [(SXComponentClassification *)&v9 hasAffiliationWithClassification:v6 forDirection:a4];
  }

  return v7;
}

@end