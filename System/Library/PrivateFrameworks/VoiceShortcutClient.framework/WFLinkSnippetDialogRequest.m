@interface WFLinkSnippetDialogRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)showPrompt;
- (LNViewSnippet)viewSnippet;
- (WFLinkSnippetDialogRequest)initWithCoder:(id)a3;
- (WFLinkSnippetDialogRequest)initWithViewSnippet:(id)a3 attribution:(id)a4 showPrompt:(BOOL)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFLinkSnippetDialogRequest

- (void).cxx_destruct
{
}

- (BOOL)showPrompt
{
  return self->_showPrompt;
}

- (LNViewSnippet)viewSnippet
{
  return self->_viewSnippet;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFLinkSnippetDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v6 encodeWithCoder:v4];
  v5 = [(WFLinkSnippetDialogRequest *)self viewSnippet];
  [v4 encodeObject:v5 forKey:@"viewSnippet"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFLinkSnippetDialogRequest showPrompt](self, "showPrompt"), @"showPrompt");
}

- (WFLinkSnippetDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSnippetDialogRequest;
  v5 = [(WFDialogRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"viewSnippet"];
    viewSnippet = v5->_viewSnippet;
    v5->_viewSnippet = (LNViewSnippet *)v6;

    v5->_showPrompt = [v4 decodeBoolForKey:@"showPrompt"];
    v8 = v5;
  }

  return v5;
}

- (WFLinkSnippetDialogRequest)initWithViewSnippet:(id)a3 attribution:(id)a4 showPrompt:(BOOL)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFLinkSnippetDialogRequest;
  v9 = [(WFDialogRequest *)&v14 initWithAttribution:a4 prompt:0];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    viewSnippet = v9->_viewSnippet;
    v9->_viewSnippet = (LNViewSnippet *)v10;

    v9->_showPrompt = a5;
    v12 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end