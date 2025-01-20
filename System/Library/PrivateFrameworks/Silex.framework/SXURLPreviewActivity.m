@interface SXURLPreviewActivity
- (NSURL)URL;
- (SXURLPreviewActivity)initWithURLPreviewing:(id)a3 URL:(id)a4;
- (SXURLPreviewing)URLPreviewing;
- (id)previewViewControllerForAction:(id)a3;
- (void)commitViewController:(id)a3 action:(id)a4;
@end

@implementation SXURLPreviewActivity

- (SXURLPreviewActivity)initWithURLPreviewing:(id)a3 URL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXURLPreviewActivity;
  v9 = [(SXURLPreviewActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URLPreviewing, a3);
    objc_storeStrong((id *)&v10->_URL, a4);
  }

  return v10;
}

- (id)previewViewControllerForAction:(id)a3
{
  v4 = [(SXURLPreviewActivity *)self URLPreviewing];
  v5 = [(SXURLPreviewActivity *)self URL];
  v6 = [v4 viewControllerForURL:v5];

  return v6;
}

- (void)commitViewController:(id)a3 action:(id)a4
{
  id v5 = a3;
  id v7 = [(SXURLPreviewActivity *)self URLPreviewing];
  v6 = [(SXURLPreviewActivity *)self URL];
  [v7 commitViewController:v5 URL:v6];
}

- (SXURLPreviewing)URLPreviewing
{
  return self->_URLPreviewing;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_URLPreviewing, 0);
}

@end