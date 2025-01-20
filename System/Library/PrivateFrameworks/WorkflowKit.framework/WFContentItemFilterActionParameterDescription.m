@interface WFContentItemFilterActionParameterDescription
- (Class)contentItemClass;
- (WFContentItemFilterActionParameterDescription)initWithContentItemClass:(Class)a3 field:(unint64_t)a4;
- (id)localizedStringWithContext:(id)a3;
- (unint64_t)field;
@end

@implementation WFContentItemFilterActionParameterDescription

- (void).cxx_destruct
{
}

- (unint64_t)field
{
  return self->_field;
}

- (Class)contentItemClass
{
  return self->_contentItemClass;
}

- (id)localizedStringWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(objc_class *)[(WFContentItemFilterActionParameterDescription *)self contentItemClass] localizedPluralFilterDescriptionWithContext:v4];
  if ([(objc_class *)[(WFContentItemFilterActionParameterDescription *)self contentItemClass] canLowercaseTypeDescription])
  {
    uint64_t v6 = [v5 localizedLowercaseString];

    v5 = (void *)v6;
  }
  switch([(WFContentItemFilterActionParameterDescription *)self field])
  {
    case 0uLL:
      if ([(objc_class *)[(WFContentItemFilterActionParameterDescription *)self contentItemClass] hasLibrary])v7 = @"Whether or not to limit the number of %@ retrieved."; {
      else
      }
        v7 = @"Whether or not to limit the number of %@ that are passed as output.";
      v8 = WFLocalizedStringResourceWithKey(v7, v7);
      v9 = [v4 localize:v8];

      objc_msgSend(NSString, "localizedStringWithFormat:", v9, v5);
      self = (WFContentItemFilterActionParameterDescription *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1uLL:
      v10 = NSString;
      v11 = @"The maximum number of %@.";
      goto LABEL_11;
    case 2uLL:
      v10 = NSString;
      v11 = @"Optionally, what to sort the %@ by.";
      goto LABEL_11;
    case 3uLL:
      v10 = NSString;
      v11 = @"The order to sort the %@ in.";
LABEL_11:
      v9 = WFLocalizedStringResourceWithKey(v11, v11);
      v12 = [v4 localize:v9];
      objc_msgSend(v10, "localizedStringWithFormat:", v12, v5);
      self = (WFContentItemFilterActionParameterDescription *)objc_claimAutoreleasedReturnValue();

LABEL_12:
      break;
    case 4uLL:
      self = v5;
      break;
    default:
      break;
  }

  return self;
}

- (WFContentItemFilterActionParameterDescription)initWithContentItemClass:(Class)a3 field:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WFContentItemFilterActionParameterDescription;
  uint64_t v6 = [(WFContentItemFilterActionParameterDescription *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentItemClass, a3);
    v7->_field = a4;
    v8 = v7;
  }

  return v7;
}

@end