@interface WFContentItemFilterEnumerationParameter
- (Class)contentItemClass;
- (id)localizedLabelForPossibleState:(id)a3;
- (void)setContentItemClass:(Class)a3;
@end

@implementation WFContentItemFilterEnumerationParameter

- (void).cxx_destruct
{
}

- (void)setContentItemClass:(Class)a3
{
}

- (Class)contentItemClass
{
  return self->_contentItemClass;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v4 = a3;
  v5 = [v4 value];
  int v6 = [v5 isEqualToString:@"Library"];

  if (v6)
  {
    v7 = NSString;
    v8 = WFLocalizedString(@"All %@");
    v9 = [(objc_class *)[(WFContentItemFilterEnumerationParameter *)self contentItemClass] localizedPluralFilterDescription];
    v10 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v9);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFContentItemFilterEnumerationParameter;
    v10 = [(WFEnumerationParameter *)&v12 localizedLabelForPossibleState:v4];
  }

  return v10;
}

@end