@interface WBSCrowdsourcedFeedbackDomainNormalizer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (WBSCrowdsourcedFeedbackDomainNormalizer)init;
- (id)transformedValue:(id)a3;
@end

@implementation WBSCrowdsourcedFeedbackDomainNormalizer

- (WBSCrowdsourcedFeedbackDomainNormalizer)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSCrowdsourcedFeedbackDomainNormalizer;
  v2 = [(WBSCrowdsourcedFeedbackDomainNormalizer *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"."];
    dotCharacterSet = v2->_dotCharacterSet;
    v2->_dotCharacterSet = (NSCharacterSet *)v3;

    v5 = v2;
  }

  return v2;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 host];
LABEL_5:
    v6 = v5;
    objc_super v7 = [v5 stringByTrimmingCharactersInSet:self->_dotCharacterSet];

    v8 = objc_msgSend(v7, "safari_stringByRemovingWwwDotPrefix");

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (void).cxx_destruct
{
}

@end