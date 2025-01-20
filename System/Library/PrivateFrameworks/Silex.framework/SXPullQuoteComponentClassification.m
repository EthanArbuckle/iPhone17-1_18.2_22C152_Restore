@interface SXPullQuoteComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4;
- (id)accessibilityContextualLabel;
- (id)accessibilityCustomRotorMembership;
- (id)layoutRules;
- (id)textRules;
@end

@implementation SXPullQuoteComponentClassification

+ (id)typeString
{
  return @"text";
}

+ (int)role
{
  return 28;
}

+ (id)roleString
{
  return @"pullquote";
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Pull Quote" value:&stru_26D5311C0 table:0];

  return v3;
}

- (id)accessibilityCustomRotorMembership
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[SXAXCustomRotorDefinition audioVideoRotor]();
  v4 = +[SXAXCustomRotor rotorWithName:v3];
  v5 = [v2 setWithObject:v4];

  return v5;
}

- (id)textRules
{
  v2 = +[SXComponentTextRules defaultTextRules];
  v3 = (void *)[v2 copy];

  [v3 setIsSelectable:1];
  return v3;
}

- (id)layoutRules
{
  return +[SXComponentLayoutRules twoColumnLayoutRules];
}

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SXPullQuoteComponentClassification;
    BOOL v7 = [(SXComponentClassification *)&v9 hasAffiliationWithClassification:v6 forDirection:a4];
  }

  return v7;
}

@end