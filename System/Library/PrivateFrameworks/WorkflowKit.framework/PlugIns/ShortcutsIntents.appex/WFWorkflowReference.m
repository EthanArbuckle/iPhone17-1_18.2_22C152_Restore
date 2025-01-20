@interface WFWorkflowReference
- (INShortcutOverview)shortcutOverview;
- (id)wf_intentsIconForApplicationBundleIdentifier;
- (id)wf_intentsIconForData:(id)a3;
- (id)wf_intentsIconForWorkflow;
@end

@implementation WFWorkflowReference

- (id)wf_intentsIconForWorkflow
{
  id v3 = objc_alloc((Class)WFWorkflowIconDrawer);
  v4 = [(WFWorkflowReference *)self icon];
  id v5 = [v3 initWithIcon:v4];

  [v5 setCornerRadius:8.0];
  v6 = objc_msgSend(v5, "imageWithSize:", 60.0, 60.0);
  v7 = [v6 PNGRepresentation];
  v8 = [(WFWorkflowReference *)self wf_intentsIconForData:v7];

  return v8;
}

- (id)wf_intentsIconForApplicationBundleIdentifier
{
  id v3 = [(WFWorkflowReference *)self associatedAppBundleIdentifier];
  v4 = +[WFImage applicationIconImageForBundleIdentifier:v3 format:2];

  if (v4)
  {
    id v5 = [v4 PNGRepresentation];
    v6 = [(WFWorkflowReference *)self wf_intentsIconForData:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)wf_intentsIconForData:(id)a3
{
  id v3 = +[INImage imageWithImageData:a3];
  objc_msgSend(v3, "_setImageSize:", 60.0, 60.0);
  return v3;
}

- (INShortcutOverview)shortcutOverview
{
  id v3 = objc_alloc((Class)INSpeakableString);
  v4 = [(WFWorkflowReference *)self identifier];
  id v5 = [(WFWorkflowReference *)self name];
  id v6 = [v3 initWithVocabularyIdentifier:v4 spokenPhrase:v5 pronunciationHint:0];

  id v7 = objc_alloc((Class)INSpeakableString);
  v8 = [(WFWorkflowReference *)self name];
  id v9 = [v7 initWithSpokenPhrase:v8];

  v10 = [(WFWorkflowReference *)self associatedAppBundleIdentifier];
  id v11 = [v10 length];

  if (!v11
    || ([(WFWorkflowReference *)self wf_intentsIconForApplicationBundleIdentifier], (v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v12 = [(WFWorkflowReference *)self wf_intentsIconForWorkflow];
  }
  id v13 = [objc_alloc((Class)INShortcutOverview) initWithName:v6 voiceCommand:v9 icon:v12 descriptiveText:0 steps:0];

  return (INShortcutOverview *)v13;
}

@end