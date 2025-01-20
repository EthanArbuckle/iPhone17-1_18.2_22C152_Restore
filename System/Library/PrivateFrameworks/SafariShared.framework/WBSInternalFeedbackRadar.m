@interface WBSInternalFeedbackRadar
- (NSArray)attachmentPaths;
- (NSArray)keywords;
- (NSString)classification;
- (NSString)descriptionTemplate;
- (NSString)reproducibility;
- (NSString)title;
- (NSURL)continueInTapToRadarURL;
- (WBSInternalFeedbackRadar)initWithComponent:(id)a3 title:(id)a4 descriptionTemplate:(id)a5;
- (WBSInternalFeedbackRadarComponent)component;
- (void)setAttachmentPaths:(id)a3;
- (void)setClassification:(id)a3;
- (void)setComponent:(id)a3;
- (void)setDescriptionTemplate:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setReproducibility:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WBSInternalFeedbackRadar

- (WBSInternalFeedbackRadar)initWithComponent:(id)a3 title:(id)a4 descriptionTemplate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  result = (WBSInternalFeedbackRadar *)[MEMORY[0x1E4F97EA0] isInternalInstall];
  if (result)
  {
    v20.receiver = self;
    v20.super_class = (Class)WBSInternalFeedbackRadar;
    v12 = [(WBSInternalFeedbackRadar *)&v20 init];
    if (v12)
    {
      uint64_t v13 = [v8 copy];
      component = v12->_component;
      v12->_component = (WBSInternalFeedbackRadarComponent *)v13;

      uint64_t v15 = [v9 copy];
      title = v12->_title;
      v12->_title = (NSString *)v15;

      uint64_t v17 = [v10 copy];
      descriptionTemplate = v12->_descriptionTemplate;
      v12->_descriptionTemplate = (NSString *)v17;

      v19 = v12;
    }

    return v12;
  }
  else
  {
    __break(0xC471u);
  }
  return result;
}

- (NSURL)continueInTapToRadarURL
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v3 setScheme:@"tap-to-radar"];
  [v3 setHost:@"new"];
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [(WBSInternalFeedbackRadarComponent *)self->_component identifier];
  appendToQueryItems(v4, @"ComponentID", (uint64_t)v5);

  v6 = [(WBSInternalFeedbackRadarComponent *)self->_component name];
  appendToQueryItems(v4, @"ComponentName", (uint64_t)v6);

  v7 = [(WBSInternalFeedbackRadarComponent *)self->_component version];
  appendToQueryItems(v4, @"ComponentVersion", (uint64_t)v7);

  appendToQueryItems(v4, @"Title", (uint64_t)self->_title);
  appendToQueryItems(v4, @"Description", (uint64_t)self->_descriptionTemplate);
  appendToQueryItems(v4, @"Classification", (uint64_t)self->_classification);
  appendToQueryItems(v4, @"Reproducibility", (uint64_t)self->_reproducibility);
  id v8 = [(NSArray *)self->_keywords componentsJoinedByString:@","];
  appendToQueryItems(v4, @"Keywords", (uint64_t)v8);

  id v9 = [(NSArray *)self->_attachmentPaths componentsJoinedByString:@","];
  appendToQueryItems(v4, @"Attachments", (uint64_t)v9);

  [v3 setQueryItems:v4];
  id v10 = [v3 URL];

  return (NSURL *)v10;
}

- (WBSInternalFeedbackRadarComponent)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)descriptionTemplate
{
  return self->_descriptionTemplate;
}

- (void)setDescriptionTemplate:(id)a3
{
}

- (NSString)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
}

- (NSString)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(id)a3
{
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
}

- (NSArray)attachmentPaths
{
  return self->_attachmentPaths;
}

- (void)setAttachmentPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentPaths, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_reproducibility, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_descriptionTemplate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end