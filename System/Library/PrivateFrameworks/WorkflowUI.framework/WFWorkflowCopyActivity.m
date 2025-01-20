@interface WFWorkflowCopyActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSURL)URL;
- (NSURL)excludedURL;
- (WFWorkflowCopyActivity)initWithExcludedURL:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation WFWorkflowCopyActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_excludedURL, 0);
}

- (void)setURL:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSURL)excludedURL
{
  return self->_excludedURL;
}

- (void)performActivity
{
  v3 = [(WFWorkflowCopyActivity *)self URL];

  if (v3)
  {
    v4 = [MEMORY[0x263F82A18] generalPasteboard];
    v5 = [(WFWorkflowCopyActivity *)self URL];
    [v4 setURL:v5];
  }
  [(UIActivity *)self activityDidFinish:1];
}

- (void)prepareWithActivityItems:(id)a3
{
  v4 = (void *)MEMORY[0x263F08A98];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__WFWorkflowCopyActivity_prepareWithActivityItems___block_invoke;
  v9[3] = &unk_2649CAED0;
  v9[4] = self;
  id v5 = a3;
  v6 = [v4 predicateWithBlock:v9];
  v7 = [v5 filteredArrayUsingPredicate:v6];

  v8 = [v7 firstObject];
  [(WFWorkflowCopyActivity *)self setURL:v8];
}

uint64_t __51__WFWorkflowCopyActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (!v7)
  {
    v10 = 0;
    v9 = 0;
    uint64_t v8 = 0;
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    uint64_t v8 = 0;
    v10 = v7;
    goto LABEL_8;
  }
  if (([v7 isFileURL] & 1) == 0)
  {
    v10 = [*(id *)(a1 + 32) excludedURL];
    uint64_t v8 = [v7 isEqual:v10] ^ 1;
    v9 = v7;
    goto LABEL_8;
  }
  uint64_t v8 = 0;
  v9 = v7;
LABEL_9:

  return v8;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v3 = objc_msgSend(a3, "if_firstObjectPassingTest:", &__block_literal_global_5516);
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __54__WFWorkflowCopyActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = v2;
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v3 = [v4 isFileURL] ^ 1;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (id)_systemImageName
{
  return @"link.icloud";
}

- (id)activityTitle
{
  return WFLocalizedString(@"Copy iCloud Link");
}

- (id)activityType
{
  return @"is.workflow.my.linkcopier";
}

- (WFWorkflowCopyActivity)initWithExcludedURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowCopyActivity;
  id v6 = [(UIActivity *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_excludedURL, a3);
    uint64_t v8 = v7;
  }

  return v7;
}

@end