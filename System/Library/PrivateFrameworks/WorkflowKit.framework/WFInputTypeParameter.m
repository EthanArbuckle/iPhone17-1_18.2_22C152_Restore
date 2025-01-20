@interface WFInputTypeParameter
- (BOOL)allowsMultipleValues;
- (BOOL)parameterStateIsValid:(id)a3;
- (BOOL)preferParameterValuePicker;
- (Class)singleStateClass;
- (WFInputTypeParameter)initWithDefinition:(id)a3;
- (id)accessoryIconForPossibleState:(id)a3;
- (id)defaultSupportedVariableTypes;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)localizedLabelForMultipleCompleteState:(id)a3;
- (id)possibleStatesForEnumeration:(id)a3;
- (id)selectionType;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
@end

@implementation WFInputTypeParameter

- (id)possibleStatesForEnumeration:(id)a3
{
  v3 = WFCategorizedInputTypes();
  v4 = [v3 allItems];

  return v4;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  WFCategorizedInputTypes();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a5 + 2))(v6, v7, 0);
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  v9 = [v8 value];

  if (v9
    && (Class v10 = NSClassFromString(v9),
        [(objc_class *)v10 conformsToProtocol:&unk_1F2322580]))
  {
    v11 = [(objc_class *)v10 localizedPluralTypeDescription];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [v3 value];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)selectionType
{
  v4.receiver = self;
  v4.super_class = (Class)WFInputTypeParameter;
  v2 = [(WFEnumerationParameter *)&v4 selectionType];
  return v2;
}

- (id)defaultSupportedVariableTypes
{
  return 0;
}

- (BOOL)allowsMultipleValues
{
  return 1;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (id)localizedLabelForMultipleCompleteState:(id)a3
{
  return WFLocalizedString(@"Any");
}

- (id)accessoryIconForPossibleState:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v4 = v3;
    }
    else {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 value];

  if (!v6)
  {
    v9 = 0;
    goto LABEL_46;
  }
  id v7 = [MEMORY[0x1E4FB4760] clearBackground];
  if ([v6 isEqualToString:@"WFImageContentItem"])
  {
    id v8 = @"photo";
  }
  else if ([v6 isEqualToString:@"WFAVAssetContentItem"])
  {
    id v8 = @"music.on.film";
  }
  else if ([v6 isEqualToString:@"WFiTunesProductContentItem"])
  {
    id v8 = @"star.square";
  }
  else if ([v6 isEqualToString:@"WFGenericFileContentItem"])
  {
    id v8 = @"doc";
  }
  else if ([v6 isEqualToString:@"WFFolderContentItem"])
  {
    id v8 = @"folder";
  }
  else if ([v6 isEqualToString:@"WFPDFContentItem"])
  {
    id v8 = @"doc.text";
  }
  else if ([v6 isEqualToString:@"WFStringContentItem"])
  {
    id v8 = @"text.alignleft";
  }
  else if ([v6 isEqualToString:@"WFRichTextContentItem"])
  {
    id v8 = @"doc.richtext";
  }
  else if ([v6 isEqualToString:@"WFSafariWebPageContentItem"])
  {
    id v8 = @"safari";
  }
  else if ([v6 isEqualToString:@"WFURLContentItem"])
  {
    id v8 = @"link";
  }
  else if ([v6 isEqualToString:@"WFArticleContentItem"])
  {
    id v8 = @"doc.plaintext";
  }
  else if ([v6 isEqualToString:@"WFDCMapsLinkContentItem"])
  {
    id v8 = @"map";
  }
  else if ([v6 isEqualToString:@"WFLocationContentItem"])
  {
    id v8 = @"mappin.and.ellipse";
  }
  else if ([v6 isEqualToString:@"WFContactContentItem"])
  {
    id v8 = @"person.crop.circle";
  }
  else if ([v6 isEqualToString:@"WFEmailAddressContentItem"])
  {
    id v8 = @"envelope";
  }
  else if ([v6 isEqualToString:@"WFPhoneNumberContentItem"])
  {
    id v8 = @"phone.fill";
  }
  else if ([v6 isEqualToString:@"WFDateContentItem"])
  {
    id v8 = @"calendar";
  }
  else
  {
    if (![v6 isEqualToString:@"WFAppStoreAppContentItem"])
    {
      v9 = 0;
      goto LABEL_45;
    }
    id v8 = @"appstore";
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4FB49C8]) initWithSymbolName:v8 background:v7];
LABEL_45:

LABEL_46:
  return v9;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFInputTypeParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFInputTypeParameter;
  id v3 = [(WFEnumerationParameter *)&v7 initWithDefinition:a3];
  objc_super v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    id v5 = v4;
  }

  return v4;
}

@end