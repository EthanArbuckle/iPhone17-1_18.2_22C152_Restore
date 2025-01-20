@interface OBButtonTrayLinkURLAction
- (NSURL)url;
- (OBButtonTrayLinkURLAction)initWithURL:(id)a3;
- (void)performButtonTrayLinkAction;
- (void)setUrl:(id)a3;
@end

@implementation OBButtonTrayLinkURLAction

- (OBButtonTrayLinkURLAction)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OBButtonTrayLinkURLAction;
  v6 = [(OBButtonTrayLinkURLAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (void)performButtonTrayLinkAction
{
  id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  v3 = [(OBButtonTrayLinkURLAction *)self url];
  [v4 openURL:v3 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end