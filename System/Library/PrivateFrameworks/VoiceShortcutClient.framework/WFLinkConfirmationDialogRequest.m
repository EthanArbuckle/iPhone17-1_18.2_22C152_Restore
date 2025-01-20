@interface WFLinkConfirmationDialogRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isContinueInAppRequest;
- (LNConfirmationSystemStyle)systemStyle;
- (NSString)title;
- (WFDialogButton)noButton;
- (WFDialogButton)yesButton;
- (WFLinkConfirmationDialogRequest)initWithActionMetadata:(id)a3 showPrompt:(BOOL)a4 dialogString:(id)a5 viewSnippet:(id)a6 yesText:(id)a7 noText:(id)a8 attribution:(id)a9 parameterInfo:(id)a10 isContinueInAppRequest:(BOOL)a11 systemStyle:(id)a12;
- (WFLinkConfirmationDialogRequest)initWithActionParameterMetadata:(id)a3 dialogString:(id)a4 viewSnippet:(id)a5 attribution:(id)a6 parameterInfo:(id)a7;
- (WFLinkConfirmationDialogRequest)initWithCoder:(id)a3;
- (WFLinkConfirmationDialogRequest)initWithTitle:(id)a3 viewSnippet:(id)a4 yesText:(id)a5 noText:(id)a6 attribution:(id)a7 parameterInfo:(id)a8 isContinueInAppRequest:(BOOL)a9 systemStyle:(id)a10 showPrompt:(BOOL)a11;
- (WFParameterKeyValuePair)parameterInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setIsContinueInAppRequest:(BOOL)a3;
@end

@implementation WFLinkConfirmationDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemStyle, 0);
  objc_storeStrong((id *)&self->_parameterInfo, 0);
  objc_storeStrong((id *)&self->_noButton, 0);
  objc_storeStrong((id *)&self->_yesButton, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (LNConfirmationSystemStyle)systemStyle
{
  return self->_systemStyle;
}

- (void)setIsContinueInAppRequest:(BOOL)a3
{
  self->_isContinueInAppRequest = a3;
}

- (BOOL)isContinueInAppRequest
{
  return self->_isContinueInAppRequest;
}

- (WFParameterKeyValuePair)parameterInfo
{
  return self->_parameterInfo;
}

- (WFDialogButton)noButton
{
  return self->_noButton;
}

- (WFDialogButton)yesButton
{
  return self->_yesButton;
}

- (NSString)title
{
  return self->_title;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFLinkConfirmationDialogRequest;
  id v4 = a3;
  [(WFLinkSnippetDialogRequest *)&v10 encodeWithCoder:v4];
  v5 = [(WFLinkConfirmationDialogRequest *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(WFLinkConfirmationDialogRequest *)self yesButton];
  [v4 encodeObject:v6 forKey:@"yesButton"];

  v7 = [(WFLinkConfirmationDialogRequest *)self noButton];
  [v4 encodeObject:v7 forKey:@"noButton"];

  v8 = [(WFLinkConfirmationDialogRequest *)self parameterInfo];
  [v4 encodeObject:v8 forKey:@"parameterInfo"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFLinkConfirmationDialogRequest isContinueInAppRequest](self, "isContinueInAppRequest"), @"isContinueInAppRequest");
  v9 = [(WFLinkConfirmationDialogRequest *)self systemStyle];
  [v4 encodeObject:v9 forKey:@"systemStyle"];
}

- (WFLinkConfirmationDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFLinkConfirmationDialogRequest;
  v5 = [(WFLinkSnippetDialogRequest *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"yesButton"];
    yesButton = v5->_yesButton;
    v5->_yesButton = (WFDialogButton *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"noButton"];
    noButton = v5->_noButton;
    v5->_noButton = (WFDialogButton *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterInfo"];
    parameterInfo = v5->_parameterInfo;
    v5->_parameterInfo = (WFParameterKeyValuePair *)v12;

    v5->_isContinueInAppRequest = [v4 decodeBoolForKey:@"isContinueInAppRequest"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemStyle"];
    systemStyle = v5->_systemStyle;
    v5->_systemStyle = (LNConfirmationSystemStyle *)v14;

    v16 = v5;
  }

  return v5;
}

- (WFLinkConfirmationDialogRequest)initWithTitle:(id)a3 viewSnippet:(id)a4 yesText:(id)a5 noText:(id)a6 attribution:(id)a7 parameterInfo:(id)a8 isContinueInAppRequest:(BOOL)a9 systemStyle:(id)a10 showPrompt:(BOOL)a11
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v34 = a10;
  v35.receiver = self;
  v35.super_class = (Class)WFLinkConfirmationDialogRequest;
  v21 = [(WFLinkSnippetDialogRequest *)&v35 initWithViewSnippet:a4 attribution:a7 showPrompt:a11];
  if (v21)
  {
    uint64_t v22 = [v17 copy];
    title = v21->_title;
    v21->_title = (NSString *)v22;

    if (v18)
    {
      id v24 = v18;
    }
    else
    {
      WFLocalizedString(@"Yes");
      id v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;
    if (v19)
    {
      id v26 = v19;
    }
    else
    {
      WFLocalizedString(@"No");
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v26;
    v28 = [[WFDialogButton alloc] initWithTitle:v25 style:0];
    yesButton = v21->_yesButton;
    v21->_yesButton = v28;

    v30 = [[WFDialogButton alloc] initWithTitle:v27 style:1];
    noButton = v21->_noButton;
    v21->_noButton = v30;

    objc_storeStrong((id *)&v21->_parameterInfo, a8);
    v21->_isContinueInAppRequest = a9;
    objc_storeStrong((id *)&v21->_systemStyle, a10);
    v32 = v21;
  }
  return v21;
}

- (WFLinkConfirmationDialogRequest)initWithActionParameterMetadata:(id)a3 dialogString:(id)a4 viewSnippet:(id)a5 attribution:(id)a6 parameterInfo:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a4)
  {
    LOBYTE(v22) = 1;
    LOBYTE(v21) = 0;
    v16 = [(WFLinkConfirmationDialogRequest *)self initWithTitle:a4 viewSnippet:v13 yesText:0 noText:0 attribution:v14 parameterInfo:v15 isContinueInAppRequest:v21 systemStyle:0 showPrompt:v22];
  }
  else
  {
    id v17 = [v12 title];
    id v18 = [v17 localizedStringWithPluralizationNumber:&unk_1F0CB1AF0 forLocaleIdentifier:0];
    if (v18)
    {
      LOBYTE(v22) = 1;
      LOBYTE(v21) = 0;
      v16 = [(WFLinkConfirmationDialogRequest *)self initWithTitle:v18 viewSnippet:v13 yesText:0 noText:0 attribution:v14 parameterInfo:v15 isContinueInAppRequest:v21 systemStyle:0 showPrompt:v22];
    }
    else
    {
      id v19 = [v12 name];
      LOBYTE(v22) = 1;
      LOBYTE(v21) = 0;
      v16 = [(WFLinkConfirmationDialogRequest *)self initWithTitle:v19 viewSnippet:v13 yesText:0 noText:0 attribution:v14 parameterInfo:v15 isContinueInAppRequest:v21 systemStyle:0 showPrompt:v22];
    }
  }

  return v16;
}

- (WFLinkConfirmationDialogRequest)initWithActionMetadata:(id)a3 showPrompt:(BOOL)a4 dialogString:(id)a5 viewSnippet:(id)a6 yesText:(id)a7 noText:(id)a8 attribution:(id)a9 parameterInfo:(id)a10 isContinueInAppRequest:(BOOL)a11 systemStyle:(id)a12
{
  BOOL v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a12;
  if (!v15)
  {
    v23 = 0;
    goto LABEL_5;
  }
  v23 = v16;
  if (v16)
  {
LABEL_5:
    id v24 = v23;
    goto LABEL_6;
  }
  WFLocalizedString(@"Ready to do it?");
  id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v25 = v24;
  LOBYTE(v29) = v15;
  LOBYTE(v28) = a11;
  id v26 = [(WFLinkConfirmationDialogRequest *)self initWithTitle:v24 viewSnippet:v17 yesText:v18 noText:v19 attribution:v20 parameterInfo:v21 isContinueInAppRequest:v28 systemStyle:v22 showPrompt:v29];

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end