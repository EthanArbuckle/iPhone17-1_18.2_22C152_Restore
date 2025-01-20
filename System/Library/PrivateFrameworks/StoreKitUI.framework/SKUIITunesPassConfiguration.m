@interface SKUIITunesPassConfiguration
- (NSString)learnMoreAddPassButtonTitle;
- (NSString)learnMoreDoneButtonTitle;
- (NSString)learnMoreExplanation;
- (NSString)learnMoreTitle;
- (NSString)learnMoreViewPassButtonTitle;
- (NSString)lockupDescription;
- (NSString)lockupLearnMoreLinkTitle;
- (NSString)lockupTitle;
- (SKUIITunesPassConfiguration)initWithITunesPassDictionary:(id)a3 clientContext:(id)a4;
- (id)learnMoreAlertView;
@end

@implementation SKUIITunesPassConfiguration

- (SKUIITunesPassConfiguration)initWithITunesPassDictionary:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[SKUIITunesPassConfiguration initWithITunesPassDictionary:clientContext:]();
    }
  }
  v100.receiver = self;
  v100.super_class = (Class)SKUIITunesPassConfiguration;
  v10 = [(SKUIITunesPassConfiguration *)&v100 init];

  if (v10)
  {
    v11 = [v6 objectForKey:@"learnMoreAlert"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v11 objectForKey:@"cancelButton"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 copy];
        dialogNotNowButton = v10->_dialogNotNowButton;
        v10->_dialogNotNowButton = (NSString *)v13;
      }
      v15 = [v11 objectForKey:@"explanation"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = [v15 copy];
        dialogMessage = v10->_dialogMessage;
        v10->_dialogMessage = (NSString *)v16;
      }
      v18 = [v11 objectForKey:@"message"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = [v18 copy];
        dialogTitle = v10->_dialogTitle;
        v10->_dialogTitle = (NSString *)v19;
      }
      v21 = [v11 objectForKey:@"okButton"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v22 = [v21 copy];
        dialogLearnMoreButton = v10->_dialogLearnMoreButton;
        v10->_dialogLearnMoreButton = (NSString *)v22;
      }
    }
    v24 = [v6 objectForKey:@"learnMore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [v24 objectForKey:@"addPassButton"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v26 = [v25 copy];
        learnMoreAddPassButtonTitle = v10->_learnMoreAddPassButtonTitle;
        v10->_learnMoreAddPassButtonTitle = (NSString *)v26;
      }
      v28 = [v24 objectForKey:@"doneButton"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v29 = [v28 copy];
        learnMoreDoneButtonTitle = v10->_learnMoreDoneButtonTitle;
        v10->_learnMoreDoneButtonTitle = (NSString *)v29;
      }
      v31 = [v24 objectForKey:@"explanation"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v32 = [v31 copy];
        learnMoreExplanation = v10->_learnMoreExplanation;
        v10->_learnMoreExplanation = (NSString *)v32;
      }
      v34 = [v24 objectForKey:@"title"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v35 = [v34 copy];
        learnMoreTitle = v10->_learnMoreTitle;
        v10->_learnMoreTitle = (NSString *)v35;
      }
      v37 = [v24 objectForKey:@"viewPassButton"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v38 = [v37 copy];
        learnMoreViewPassButtonTitle = v10->_learnMoreViewPassButtonTitle;
        v10->_learnMoreViewPassButtonTitle = (NSString *)v38;
      }
    }
    v40 = [v6 objectForKey:@"lockup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = [v40 objectForKey:@"description"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v42 = [v41 copy];
        lockupDescription = v10->_lockupDescription;
        v10->_lockupDescription = (NSString *)v42;
      }
      v44 = [v40 objectForKey:@"learnMore"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v45 = [v44 copy];
        lockupLearnMoreLinkTitle = v10->_lockupLearnMoreLinkTitle;
        v10->_lockupLearnMoreLinkTitle = (NSString *)v45;
      }
      v47 = [v40 objectForKey:@"title"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v48 = [v47 copy];
        lockupTitle = v10->_lockupTitle;
        v10->_lockupTitle = (NSString *)v48;
      }
    }
    if (!v10->_dialogLearnMoreButton)
    {
      id v50 = v7;
      v51 = @"Redeem";
      if (v50) {
        [v50 localizedStringForKey:@"ITUNES_PASS_DIALOG_BUTTON_LEARN_MORE" inTable:v51];
      }
      else {
      uint64_t v52 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_DIALOG_BUTTON_LEARN_MORE" inBundles:0 inTable:v51];
      }

      v53 = v10->_dialogLearnMoreButton;
      v10->_dialogLearnMoreButton = (NSString *)v52;
    }
    if (!v10->_dialogMessage)
    {
      id v54 = v7;
      v55 = @"Redeem";
      if (v54) {
        [v54 localizedStringForKey:@"ITUNES_PASS_DIALOG_MESSAGE" inTable:v55];
      }
      else {
      uint64_t v56 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_DIALOG_MESSAGE" inBundles:0 inTable:v55];
      }

      v57 = v10->_dialogMessage;
      v10->_dialogMessage = (NSString *)v56;
    }
    if (!v10->_dialogNotNowButton)
    {
      id v58 = v7;
      v59 = @"Redeem";
      if (v58) {
        [v58 localizedStringForKey:@"ITUNES_PASS_DIALOG_BUTTON_NOT_NOW" inTable:v59];
      }
      else {
      uint64_t v60 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_DIALOG_BUTTON_NOT_NOW" inBundles:0 inTable:v59];
      }

      v61 = v10->_dialogNotNowButton;
      v10->_dialogNotNowButton = (NSString *)v60;
    }
    if (!v10->_dialogTitle)
    {
      id v62 = v7;
      v63 = @"Redeem";
      if (v62) {
        [v62 localizedStringForKey:@"ITUNES_PASS_DIALOG_TITLE" inTable:v63];
      }
      else {
      uint64_t v64 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_DIALOG_TITLE" inBundles:0 inTable:v63];
      }

      v65 = v10->_dialogTitle;
      v10->_dialogTitle = (NSString *)v64;
    }
    if (!v10->_learnMoreAddPassButtonTitle)
    {
      id v66 = v7;
      v67 = @"Redeem";
      if (v66) {
        [v66 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_ADD_PASS_BUTTON" inTable:v67];
      }
      else {
      uint64_t v68 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_ADD_PASS_BUTTON" inBundles:0 inTable:v67];
      }

      v69 = v10->_learnMoreAddPassButtonTitle;
      v10->_learnMoreAddPassButtonTitle = (NSString *)v68;
    }
    if (!v10->_learnMoreDoneButtonTitle)
    {
      id v70 = v7;
      v71 = @"Redeem";
      if (v70) {
        [v70 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_DONE_BUTTON" inTable:v71];
      }
      else {
      uint64_t v72 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_DONE_BUTTON" inBundles:0 inTable:v71];
      }

      v73 = v10->_learnMoreDoneButtonTitle;
      v10->_learnMoreDoneButtonTitle = (NSString *)v72;
    }
    if (!v10->_learnMoreExplanation)
    {
      id v74 = v7;
      v75 = @"Redeem";
      if (v74) {
        [v74 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_EXPLANATION" inTable:v75];
      }
      else {
      uint64_t v76 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_EXPLANATION" inBundles:0 inTable:v75];
      }

      v77 = v10->_learnMoreExplanation;
      v10->_learnMoreExplanation = (NSString *)v76;
    }
    if (!v10->_learnMoreTitle)
    {
      id v78 = v7;
      v79 = @"Redeem";
      if (v78) {
        [v78 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_TITLE" inTable:v79];
      }
      else {
      uint64_t v80 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_TITLE" inBundles:0 inTable:v79];
      }

      v81 = v10->_learnMoreTitle;
      v10->_learnMoreTitle = (NSString *)v80;
    }
    if (!v10->_learnMoreViewPassButtonTitle)
    {
      id v82 = v7;
      v83 = @"Redeem";
      if (v82) {
        [v82 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_VIEW_PASS_BUTTON" inTable:v83];
      }
      else {
      uint64_t v84 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_PAGE_VIEW_PASS_BUTTON" inBundles:0 inTable:v83];
      }

      v85 = v10->_learnMoreViewPassButtonTitle;
      v10->_learnMoreViewPassButtonTitle = (NSString *)v84;
    }
    if (!v10->_lockupDescription)
    {
      id v86 = v7;
      v87 = @"Redeem";
      if (v86) {
        [v86 localizedStringForKey:@"ITUNES_PASS_EXPLANATION" inTable:v87];
      }
      else {
      uint64_t v88 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_EXPLANATION" inBundles:0 inTable:v87];
      }

      v89 = v10->_lockupDescription;
      v10->_lockupDescription = (NSString *)v88;
    }
    if (!v10->_lockupLearnMoreLinkTitle)
    {
      id v90 = v7;
      v91 = @"Redeem";
      if (v90) {
        [v90 localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_LINK" inTable:v91];
      }
      else {
      uint64_t v92 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_LEARN_MORE_LINK" inBundles:0 inTable:v91];
      }

      v93 = v10->_lockupLearnMoreLinkTitle;
      v10->_lockupLearnMoreLinkTitle = (NSString *)v92;
    }
    if (!v10->_lockupTitle)
    {
      id v94 = v7;
      v95 = @"Redeem";
      if (v94) {
        [v94 localizedStringForKey:@"ITUNES_PASS_TITLE" inTable:v95];
      }
      else {
      uint64_t v96 = +[SKUIClientContext localizedStringForKey:@"ITUNES_PASS_TITLE" inBundles:0 inTable:v95];
      }

      v97 = v10->_lockupTitle;
      v10->_lockupTitle = (NSString *)v96;
    }
  }
  v98 = v10;

  return v98;
}

- (id)learnMoreAlertView
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1420]), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", self->_dialogTitle, self->_dialogMessage, 0, self->_dialogNotNowButton, self->_dialogLearnMoreButton, 0);

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

- (void)initWithITunesPassDictionary:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIITunesPassConfiguration initWithITunesPassDictionary:clientContext:]";
}

@end