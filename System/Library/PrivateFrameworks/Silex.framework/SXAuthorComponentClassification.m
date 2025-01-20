@interface SXAuthorComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4;
- (id)accessibilityContextualLabel;
- (id)textRules;
@end

@implementation SXAuthorComponentClassification

+ (id)typeString
{
  return @"text";
}

+ (int)role
{
  return 2;
}

+ (id)roleString
{
  return @"author";
}

- (id)textRules
{
  return +[SXComponentTextRules smallTextRules];
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Author" value:&stru_26D5311C0 table:0];

  return v3;
}

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SXAuthorComponentClassification;
    BOOL v7 = [(SXComponentClassification *)&v9 hasAffiliationWithClassification:v6 forDirection:a4];
  }

  return v7;
}

@end