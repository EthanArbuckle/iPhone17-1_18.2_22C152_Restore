@interface SXIllustratorComponentClassification
+ (id)accessibilityContextualLabel;
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4;
- (id)textRules;
@end

@implementation SXIllustratorComponentClassification

+ (id)typeString
{
  return @"text";
}

+ (int)role
{
  return 20;
}

+ (id)roleString
{
  return @"illustrator";
}

- (id)textRules
{
  return +[SXComponentTextRules smallTextRules];
}

+ (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Illustrator" value:&stru_26D5311C0 table:0];

  return v3;
}

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  id v6 = a3;
  if (!a4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
LABEL_13:
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SXIllustratorComponentClassification;
    BOOL v7 = [(SXComponentClassification *)&v9 hasAffiliationWithClassification:v6 forDirection:a4];
  }

  return v7;
}

@end