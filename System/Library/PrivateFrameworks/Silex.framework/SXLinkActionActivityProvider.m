@interface SXLinkActionActivityProvider
- (SXHost)host;
- (SXLinkActionActivityProvider)initWithURLHandler:(id)a3 URLPreviewing:(id)a4 host:(id)a5 URLQualifier:(id)a6;
- (SXLinkActionURLQualifier)URLQualifier;
- (SXURLHandling)URLHandler;
- (SXURLPreviewing)URLPreviewing;
- (id)activityGroupForAction:(id)a3;
- (id)previewActivityForAction:(id)a3;
- (void)open:(id)a3;
- (void)openInNewWindow:(id)a3;
- (void)openInSafari:(id)a3;
@end

@implementation SXLinkActionActivityProvider

- (SXLinkActionActivityProvider)initWithURLHandler:(id)a3 URLPreviewing:(id)a4 host:(id)a5 URLQualifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SXLinkActionActivityProvider;
  v15 = [(SXLinkActionActivityProvider *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_URLHandler, a3);
    objc_storeStrong((id *)&v16->_URLPreviewing, a4);
    objc_storeStrong((id *)&v16->_host, a5);
    objc_storeStrong((id *)&v16->_URLQualifier, a6);
  }

  return v16;
}

- (id)activityGroupForAction:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F08BA0];
  v6 = [v4 URL];
  v7 = [v5 componentsWithURL:v6 resolvingAgainstBaseURL:0];

  [v7 setQuery:0];
  [v7 setFragment:0];
  v8 = [v7 URL];
  v9 = [v8 absoluteString];

  v10 = [[SXActionActivityGroup alloc] initWithTitle:v9];
  id v11 = [SXBlockActionActivity alloc];
  id v12 = SXBundle();
  id v13 = [v12 localizedStringForKey:@"SXLinkActionOpen" value:&stru_26D5311C0 table:0];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke;
  v43[3] = &unk_264651B28;
  v43[4] = self;
  id v14 = [(SXBlockActionActivity *)v11 initWithLabel:v13 type:0 block:v43];
  [(SXActionActivityGroup *)v10 addActivity:v14];

  v15 = [(SXLinkActionActivityProvider *)self URLQualifier];
  if (objc_opt_respondsToSelector())
  {
    v16 = [(SXLinkActionActivityProvider *)self URLQualifier];
    v17 = [v4 URL];
    int v18 = [v16 allowOpenInNewWindowForURL:v17];

    if (v18)
    {
      v19 = [SXBlockActionActivity alloc];
      v20 = SXBundle();
      v21 = [v20 localizedStringForKey:@"Open In New Window" value:&stru_26D5311C0 table:0];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke_2;
      v42[3] = &unk_264651B28;
      v42[4] = self;
      v22 = [(SXBlockActionActivity *)v19 initWithLabel:v21 type:0 block:v42];
      [(SXActionActivityGroup *)v10 addActivity:v22];
    }
  }
  else
  {
  }
  v23 = [(SXLinkActionActivityProvider *)self URLQualifier];
  v24 = [v4 URL];
  int v25 = [v23 allowOpenInSafariForURL:v24];

  if (v25)
  {
    v26 = [SXBlockActionActivity alloc];
    v27 = SXBundle();
    v28 = [v27 localizedStringForKey:@"Open in Safari" value:&stru_26D5311C0 table:0];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke_3;
    v41[3] = &unk_264651B28;
    v41[4] = self;
    v29 = [(SXBlockActionActivity *)v26 initWithLabel:v28 type:1 block:v41];
    [(SXActionActivityGroup *)v10 addActivity:v29];
  }
  v30 = [(SXLinkActionActivityProvider *)self URLQualifier];
  v31 = [v4 URL];
  int v32 = [v30 allowCopyingOfURL:v31];

  if (v32)
  {
    v33 = [SXPasteboardActionActivity alloc];
    v34 = SXBundle();
    v35 = [v34 localizedStringForKey:@"Copy Link" value:&stru_26D5311C0 table:0];
    v36 = [MEMORY[0x263F1C840] generalPasteboard];
    v37 = [v4 URL];
    v38 = [v37 absoluteString];
    v39 = [(SXPasteboardActionActivity *)v33 initWithLabel:v35 type:1 pasteboard:v36 string:v38];
    [(SXActionActivityGroup *)v10 addActivity:v39];
  }
  return v10;
}

void __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 URL];
  [v2 open:v3];
}

void __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 URL];
  [v2 openInNewWindow:v3];
}

void __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 URL];
  [v2 openInSafari:v3];
}

- (id)previewActivityForAction:(id)a3
{
  id v4 = a3;
  v5 = [SXURLPreviewActivity alloc];
  v6 = [(SXLinkActionActivityProvider *)self URLPreviewing];
  v7 = [v4 URL];

  v8 = [(SXURLPreviewActivity *)v5 initWithURLPreviewing:v6 URL:v7];
  return v8;
}

- (void)open:(id)a3
{
  id v4 = a3;
  id v5 = [(SXLinkActionActivityProvider *)self URLHandler];
  [v5 openURL:v4];
}

- (void)openInNewWindow:(id)a3
{
  id v7 = a3;
  id v4 = [(SXLinkActionActivityProvider *)self URLHandler];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SXLinkActionActivityProvider *)self URLHandler];
    [v6 openNewWindowWithURL:v7];
  }
}

- (void)openInSafari:(id)a3
{
  id v4 = a3;
  id v5 = [(SXLinkActionActivityProvider *)self host];
  [v5 openURL:v4 completion:0];
}

- (SXURLHandling)URLHandler
{
  return self->_URLHandler;
}

- (SXURLPreviewing)URLPreviewing
{
  return self->_URLPreviewing;
}

- (SXHost)host
{
  return self->_host;
}

- (SXLinkActionURLQualifier)URLQualifier
{
  return self->_URLQualifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLQualifier, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_URLPreviewing, 0);
  objc_storeStrong((id *)&self->_URLHandler, 0);
}

@end