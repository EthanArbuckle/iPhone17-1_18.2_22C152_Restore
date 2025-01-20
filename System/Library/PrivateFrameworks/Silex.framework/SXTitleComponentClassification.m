@interface SXTitleComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (BOOL)accessibilitySkippedDuringReadAll;
- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4;
- (id)accessibilityContextualLabel;
- (id)accessibilityCustomRotorMembership;
- (id)layoutRules;
- (id)textRules;
@end

@implementation SXTitleComponentClassification

+ (id)typeString
{
  return @"text";
}

+ (int)role
{
  return 32;
}

+ (id)roleString
{
  return @"title";
}

- (id)textRules
{
  return +[SXComponentTextRules titleTextRules];
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Title" value:&stru_26D5311C0 table:0];

  return v3;
}

- (id)accessibilityCustomRotorMembership
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[SXAXCustomRotorDefinition headingsRotor]();
  v4 = +[SXAXCustomRotor rotorWithName:v3];
  v5 = [v2 setWithObject:v4];

  return v5;
}

- (BOOL)accessibilitySkippedDuringReadAll
{
  return 0;
}

- (id)layoutRules
{
  return +[SXComponentLayoutRules twoColumnLayoutRules];
}

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SXTitleComponentClassification;
    BOOL v7 = [(SXComponentClassification *)&v9 hasAffiliationWithClassification:v6 forDirection:a4];
  }

  return v7;
}

@end