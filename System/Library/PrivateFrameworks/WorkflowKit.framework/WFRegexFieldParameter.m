@interface WFRegexFieldParameter
- (Class)singleStateClass;
- (NSString)localizedIncompleteHintString;
- (WFRegexFieldParameter)initWithDefinition:(id)a3;
- (id)hintForState:(id)a3;
@end

@implementation WFRegexFieldParameter

- (NSString)localizedIncompleteHintString
{
  return 0;
}

- (id)hintForState:(id)a3
{
  id v3 = a3;
  v4 = [v3 variableString];
  v5 = [v4 stringByRemovingVariables];

  v6 = [v3 variableString];

  v7 = [v6 variables];
  if ([v7 count])
  {

LABEL_3:
    v8 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = [v5 length];

  if (!v9) {
    goto LABEL_3;
  }
  uint64_t v12 = 0;
  v10 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v5 options:0 error:&v12];
  v8 = 0;
  if (!v10)
  {
    v8 = WFLocalizedString(@"Invalid pattern");
  }

LABEL_8:
  return v8;
}

- (WFRegexFieldParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFRegexFieldParameter;
  id v3 = [(WFTextInputParameter *)&v7 initWithDefinition:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end