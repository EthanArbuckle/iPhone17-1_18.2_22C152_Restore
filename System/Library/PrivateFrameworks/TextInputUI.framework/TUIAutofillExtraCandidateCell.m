@interface TUIAutofillExtraCandidateCell
+ (id)reuseIdentifier;
- (id)bodyText;
- (id)headerText;
- (id)image;
@end

@implementation TUIAutofillExtraCandidateCell

+ (id)reuseIdentifier
{
  return @"TUIAutofillExtraCandidateCell";
}

- (id)image
{
  v3 = [(TUICandidateBaseCell *)self style];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  v4 = [(TUICandidateBaseCell *)self style];
  v5 = [v4 autofillExtraCandidateImage];

  if (!v5)
  {
LABEL_5:
    v8 = [(TUICandidateBaseCell *)self style];
    v9 = [v8 textColor];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4FB1618] clearColor];
    }
    v6 = v11;

    v12 = [MEMORY[0x1E4FB1818] kitImageNamed:@"kb-autofill-key"];
    v7 = [v12 _flatImageWithColor:v6];

    goto LABEL_9;
  }
  v6 = [(TUICandidateBaseCell *)self style];
  v7 = [v6 autofillExtraCandidateImage];
LABEL_9:

  return v7;
}

- (id)bodyText
{
  [(TUIAutofillExtraCandidateCell *)self bounds];
  if (CGRectGetWidth(v6) <= 50.0)
  {
    v3 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v3 = [v2 localizedStringInDeviceLanguageForKey:@"Passwords"];
  }
  return v3;
}

- (id)headerText
{
  return 0;
}

@end