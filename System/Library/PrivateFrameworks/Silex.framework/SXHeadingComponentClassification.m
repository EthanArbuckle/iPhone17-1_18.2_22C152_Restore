@interface SXHeadingComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (BOOL)accessibilitySkippedDuringReadAll;
- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4;
- (id)accessibilityContextualLabel;
- (id)accessibilityCustomRotorMembership;
- (id)defaultComponentStyleIdentifiers;
- (id)defaultTextStyleIdentifiers;
- (id)layoutRules;
- (id)textRules;
@end

@implementation SXHeadingComponentClassification

+ (id)typeString
{
  return @"text";
}

+ (int)role
{
  return 13;
}

+ (id)roleString
{
  return @"heading";
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Heading" value:&stru_26D5311C0 table:0];

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

- (id)textRules
{
  return +[SXComponentTextRules headingTextRules];
}

- (id)defaultTextStyleIdentifiers
{
  v2 = [MEMORY[0x263EFF980] arrayWithObject:@"default"];
  v3 = [(id)objc_opt_class() roleString];
  [v2 addObject:@"default-heading"];
  if (v3 && v3 != SXComponentClassificationUnknownRoleString)
  {
    v4 = SXDefaultTextStyleIdentifierForRole((uint64_t)v3);
    if (([v2 containsObject:v4] & 1) == 0) {
      [v2 addObject:v4];
    }
  }
  return v2;
}

- (id)defaultComponentStyleIdentifiers
{
  v2 = [MEMORY[0x263EFF980] arrayWithObject:@"default"];
  v3 = [(id)objc_opt_class() roleString];
  [v2 addObject:@"default-heading"];
  if (v3 && v3 != SXComponentClassificationUnknownRoleString)
  {
    v4 = SXDefaultComponentStyleIdentifierForRole((uint64_t)v3);
    if (([v2 containsObject:v4] & 1) == 0) {
      [v2 addObject:v4];
    }
  }
  return v2;
}

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SXHeadingComponentClassification;
    BOOL v7 = [(SXComponentClassification *)&v9 hasAffiliationWithClassification:v6 forDirection:a4];
  }

  return v7;
}

@end