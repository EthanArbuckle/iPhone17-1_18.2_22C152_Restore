@interface SUUIITunesPassConfiguration
- (NSString)learnMoreAddPassButtonTitle;
- (NSString)learnMoreDoneButtonTitle;
- (NSString)learnMoreExplanation;
- (NSString)learnMoreTitle;
- (NSString)learnMoreViewPassButtonTitle;
- (NSString)lockupDescription;
- (NSString)lockupLearnMoreLinkTitle;
- (NSString)lockupTitle;
- (SUUIITunesPassConfiguration)initWithITunesPassDictionary:(id)a3 clientContext:(id)a4;
- (id)learnMoreAlertView;
@end

@implementation SUUIITunesPassConfiguration

- (SUUIITunesPassConfiguration)initWithITunesPassDictionary:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v73.receiver = self;
  v73.super_class = (Class)SUUIITunesPassConfiguration;
  v8 = [(SUUIITunesPassConfiguration *)&v73 init];
  if (v8)
  {
    v9 = [v6 objectForKey:@"learnMoreAlert"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [v9 objectForKey:@"cancelButton"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v10 copy];
        dialogNotNowButton = v8->_dialogNotNowButton;
        v8->_dialogNotNowButton = (NSString *)v11;
      }
      v13 = [v9 objectForKey:@"explanation"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [v13 copy];
        dialogMessage = v8->_dialogMessage;
        v8->_dialogMessage = (NSString *)v14;
      }
      v16 = [v9 objectForKey:@"message"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = [v16 copy];
        dialogTitle = v8->_dialogTitle;
        v8->_dialogTitle = (NSString *)v17;
      }
      v19 = [v9 objectForKey:@"okButton"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [v19 copy];
        dialogLearnMoreButton = v8->_dialogLearnMoreButton;
        v8->_dialogLearnMoreButton = (NSString *)v20;
      }
    }
    v22 = [v6 objectForKey:@"learnMore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [v22 objectForKey:@"addPassButton"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = [v23 copy];
        learnMoreAddPassButtonTitle = v8->_learnMoreAddPassButtonTitle;
        v8->_learnMoreAddPassButtonTitle = (NSString *)v24;
      }
      v26 = [v22 objectForKey:@"doneButton"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v27 = [v26 copy];
        learnMoreDoneButtonTitle = v8->_learnMoreDoneButtonTitle;
        v8->_learnMoreDoneButtonTitle = (NSString *)v27;
      }
      v29 = [v22 objectForKey:@"explanation"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v30 = [v29 copy];
        learnMoreExplanation = v8->_learnMoreExplanation;
        v8->_learnMoreExplanation = (NSString *)v30;
      }
      v32 = [v22 objectForKey:@"title"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v33 = [v32 copy];
        learnMoreTitle = v8->_learnMoreTitle;
        v8->_learnMoreTitle = (NSString *)v33;
      }
      v35 = [v22 objectForKey:@"viewPassButton"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v36 = [v35 copy];
        learnMoreViewPassButtonTitle = v8->_learnMoreViewPassButtonTitle;
        v8->_learnMoreViewPassButtonTitle = (NSString *)v36;
      }
    }
    v38 = [v6 objectForKey:@"lockup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [v38 objectForKey:@"description"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v40 = [v39 copy];
        lockupDescription = v8->_lockupDescription;
        v8->_lockupDescription = (NSString *)v40;
      }
      v42 = [v38 objectForKey:@"learnMore"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v43 = [v42 copy];
        lockupLearnMoreLinkTitle = v8->_lockupLearnMoreLinkTitle;
        v8->_lockupLearnMoreLinkTitle = (NSString *)v43;
      }
      v45 = [v38 objectForKey:@"title"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v46 = [v45 copy];
        lockupTitle = v8->_lockupTitle;
        v8->_lockupTitle = (NSString *)v46;
      }
    }
    if (!v8->_dialogLearnMoreButton)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_DIALOG_BUTTON_LEARN_MORE" inTable:@"Redeem"];
      }
      else {
      uint64_t v48 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_DIALOG_BUTTON_LEARN_MORE" inBundles:0 inTable:@"Redeem"];
      }
      v49 = v8->_dialogLearnMoreButton;
      v8->_dialogLearnMoreButton = (NSString *)v48;
    }
    if (!v8->_dialogMessage)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_DIALOG_MESSAGE" inTable:@"Redeem"];
      }
      else {
      uint64_t v50 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_DIALOG_MESSAGE" inBundles:0 inTable:@"Redeem"];
      }
      v51 = v8->_dialogMessage;
      v8->_dialogMessage = (NSString *)v50;
    }
    if (!v8->_dialogNotNowButton)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_DIALOG_BUTTON_NOT_NOW" inTable:@"Redeem"];
      }
      else {
      uint64_t v52 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_DIALOG_BUTTON_NOT_NOW" inBundles:0 inTable:@"Redeem"];
      }
      v53 = v8->_dialogNotNowButton;
      v8->_dialogNotNowButton = (NSString *)v52;
    }
    if (!v8->_dialogTitle)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_DIALOG_TITLE" inTable:@"Redeem"];
      }
      else {
      uint64_t v54 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_DIALOG_TITLE" inBundles:0 inTable:@"Redeem"];
      }
      v55 = v8->_dialogTitle;
      v8->_dialogTitle = (NSString *)v54;
    }
    if (!v8->_learnMoreAddPassButtonTitle)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_ADD_PASS_BUTTON" inTable:@"Redeem"];
      }
      else {
      uint64_t v56 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_ADD_PASS_BUTTON" inBundles:0 inTable:@"Redeem"];
      }
      v57 = v8->_learnMoreAddPassButtonTitle;
      v8->_learnMoreAddPassButtonTitle = (NSString *)v56;
    }
    if (!v8->_learnMoreDoneButtonTitle)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_DONE_BUTTON" inTable:@"Redeem"];
      }
      else {
      uint64_t v58 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_DONE_BUTTON" inBundles:0 inTable:@"Redeem"];
      }
      v59 = v8->_learnMoreDoneButtonTitle;
      v8->_learnMoreDoneButtonTitle = (NSString *)v58;
    }
    if (!v8->_learnMoreExplanation)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_EXPLANATION" inTable:@"Redeem"];
      }
      else {
      uint64_t v60 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_EXPLANATION" inBundles:0 inTable:@"Redeem"];
      }
      v61 = v8->_learnMoreExplanation;
      v8->_learnMoreExplanation = (NSString *)v60;
    }
    if (!v8->_learnMoreTitle)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_TITLE" inTable:@"Redeem"];
      }
      else {
      uint64_t v62 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_TITLE" inBundles:0 inTable:@"Redeem"];
      }
      v63 = v8->_learnMoreTitle;
      v8->_learnMoreTitle = (NSString *)v62;
    }
    if (!v8->_learnMoreViewPassButtonTitle)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_VIEW_PASS_BUTTON" inTable:@"Redeem"];
      }
      else {
      uint64_t v64 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_VIEW_PASS_BUTTON" inBundles:0 inTable:@"Redeem"];
      }
      v65 = v8->_learnMoreViewPassButtonTitle;
      v8->_learnMoreViewPassButtonTitle = (NSString *)v64;
    }
    if (!v8->_lockupDescription)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_EXPLANATION" inTable:@"Redeem"];
      }
      else {
      uint64_t v66 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_EXPLANATION" inBundles:0 inTable:@"Redeem"];
      }
      v67 = v8->_lockupDescription;
      v8->_lockupDescription = (NSString *)v66;
    }
    if (!v8->_lockupLearnMoreLinkTitle)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_LINK" inTable:@"Redeem"];
      }
      else {
      uint64_t v68 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_LINK" inBundles:0 inTable:@"Redeem"];
      }
      v69 = v8->_lockupLearnMoreLinkTitle;
      v8->_lockupLearnMoreLinkTitle = (NSString *)v68;
    }
    if (!v8->_lockupTitle)
    {
      if (v7) {
        [v7 localizedStringForKey:@"ITUNES_PASS_TITLE" inTable:@"Redeem"];
      }
      else {
      uint64_t v70 = +[SUUIClientContext localizedStringForKey:@"ITUNES_PASS_TITLE" inBundles:0 inTable:@"Redeem"];
      }
      v71 = v8->_lockupTitle;
      v8->_lockupTitle = (NSString *)v70;
    }
  }

  return v8;
}

- (id)learnMoreAlertView
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263F82420]), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", self->_dialogTitle, self->_dialogMessage, 0, self->_dialogNotNowButton, self->_dialogLearnMoreButton, 0);
  return v2;
}

- (NSString)learnMoreAddPassButtonTitle
{
  return self->_learnMoreAddPassButtonTitle;
}

- (NSString)learnMoreDoneButtonTitle
{
  return self->_learnMoreDoneButtonTitle;
}

- (NSString)learnMoreExplanation
{
  return self->_learnMoreExplanation;
}

- (NSString)learnMoreTitle
{
  return self->_learnMoreTitle;
}

- (NSString)learnMoreViewPassButtonTitle
{
  return self->_learnMoreViewPassButtonTitle;
}

- (NSString)lockupDescription
{
  return self->_lockupDescription;
}

- (NSString)lockupLearnMoreLinkTitle
{
  return self->_lockupLearnMoreLinkTitle;
}

- (NSString)lockupTitle
{
  return self->_lockupTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupTitle, 0);
  objc_storeStrong((id *)&self->_lockupLearnMoreLinkTitle, 0);
  objc_storeStrong((id *)&self->_lockupDescription, 0);
  objc_storeStrong((id *)&self->_learnMoreViewPassButtonTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreExplanation, 0);
  objc_storeStrong((id *)&self->_learnMoreDoneButtonTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreAddPassButtonTitle, 0);
  objc_storeStrong((id *)&self->_dialogTitle, 0);
  objc_storeStrong((id *)&self->_dialogNotNowButton, 0);
  objc_storeStrong((id *)&self->_dialogMessage, 0);
  objc_storeStrong((id *)&self->_dialogLearnMoreButton, 0);
}

@end