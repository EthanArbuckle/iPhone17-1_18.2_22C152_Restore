@interface WFParameterPrompt
- (LNDialog)linkDialog;
- (NSString)prompt;
- (WFParameterPrompt)initWithPrompt:(id)a3 linkDialog:(id)a4;
- (void)setLinkDialog:(id)a3;
- (void)setPrompt:(id)a3;
@end

@implementation WFParameterPrompt

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkDialog, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
}

- (void)setLinkDialog:(id)a3
{
}

- (LNDialog)linkDialog
{
  return self->_linkDialog;
}

- (void)setPrompt:(id)a3
{
}

- (NSString)prompt
{
  return self->_prompt;
}

- (WFParameterPrompt)initWithPrompt:(id)a3 linkDialog:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFParameterPrompt;
  v9 = [(WFParameterPrompt *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prompt, a3);
    objc_storeStrong((id *)&v10->_linkDialog, a4);
    v11 = v10;
  }

  return v10;
}

@end