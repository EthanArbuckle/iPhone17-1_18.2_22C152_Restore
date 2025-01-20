@interface SUSSoftwareUpdateReleaseNotesDetail
- (NSString)releaseNotes;
- (SUSSoftwareUpdateReleaseNotesDetail)init;
- (WKWebView)webView;
- (id)specifiers;
- (void)setReleaseNotes:(id)a3;
- (void)setWebView:(id)a3;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
@end

@implementation SUSSoftwareUpdateReleaseNotesDetail

- (SUSSoftwareUpdateReleaseNotesDetail)init
{
  SEL v9 = a2;
  v10 = 0;
  v8.receiver = self;
  v8.super_class = (Class)SUSSoftwareUpdateReleaseNotesDetail;
  v10 = [(SUSSoftwareUpdateReleaseNotesDetail *)&v8 init];
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v4 = v10;
    id v7 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"ABOUT_THIS_UPDATE"];
    id v5 = (id)objc_msgSend(v7, "localizedStringForKey:value:table:");
    -[SUSSoftwareUpdateReleaseNotesDetail setTitle:](v4, "setTitle:");
  }
  v3 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v3;
}

- (void)viewDidLoad
{
  v44 = self;
  v43[1] = (id)a2;
  id v6 = NSString;
  id v8 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = (id)[v8 localizedStringForKey:@"RELEASE_NOTES_HTML_FONT" value:&stru_26EF052F8 table:@"Software Update"];
  v43[0] = (id)[v6 stringWithFormat:@"<span style=\"%@\">%@</span>", v7, v44->_releaseNotes];

  id v2 = objc_alloc(MEMORY[0x263F1FA58]);
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  webView = v44->_webView;
  v44->_webView = (WKWebView *)v3;

  SEL v9 = [(SUSSoftwareUpdateReleaseNotesDetail *)v44 webView];
  [(WKWebView *)v9 setNavigationDelegate:v44];

  v10 = [(SUSSoftwareUpdateReleaseNotesDetail *)v44 webView];
  id v5 = -[WKWebView loadHTMLString:baseURL:](v10, "loadHTMLString:baseURL:", v43[0]);

  v11 = [(SUSSoftwareUpdateReleaseNotesDetail *)v44 webView];
  [(WKWebView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(SUSSoftwareUpdateReleaseNotesDetail *)v44 webView];
  [(WKWebView *)v12 setOpaque:0];

  v14 = [(SUSSoftwareUpdateReleaseNotesDetail *)v44 webView];
  id v13 = (id)[MEMORY[0x263F825C8] clearColor];
  -[WKWebView setBackgroundColor:](v14, "setBackgroundColor:");

  v15 = [(SUSSoftwareUpdateReleaseNotesDetail *)v44 webView];
  [(WKWebView *)v15 setAccessibilityIdentifier:@"SUSSoftwareUpdateReleaseNotesDetailReleaseNotes"];

  id v17 = (id)[(SUSSoftwareUpdateReleaseNotesDetail *)v44 view];
  v16 = [(SUSSoftwareUpdateReleaseNotesDetail *)v44 webView];
  objc_msgSend(v17, "addSubview:");

  v23 = [(SUSSoftwareUpdateReleaseNotesDetail *)v44 webView];
  id v22 = (id)[(WKWebView *)v23 topAnchor];
  id v21 = (id)[(SUSSoftwareUpdateReleaseNotesDetail *)v44 view];
  id v20 = (id)[v21 safeAreaLayoutGuide];
  id v19 = (id)[v20 topAnchor];
  id v18 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
  [v18 setActive:1];

  v29 = [(SUSSoftwareUpdateReleaseNotesDetail *)v44 webView];
  id v28 = (id)[(WKWebView *)v29 leadingAnchor];
  id v27 = (id)[(SUSSoftwareUpdateReleaseNotesDetail *)v44 view];
  id v26 = (id)[v27 safeAreaLayoutGuide];
  id v25 = (id)[v26 leadingAnchor];
  id v24 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
  [v24 setActive:1];

  v35 = [(SUSSoftwareUpdateReleaseNotesDetail *)v44 webView];
  id v34 = (id)[(WKWebView *)v35 trailingAnchor];
  id v33 = (id)[(SUSSoftwareUpdateReleaseNotesDetail *)v44 view];
  id v32 = (id)[v33 safeAreaLayoutGuide];
  id v31 = (id)[v32 trailingAnchor];
  id v30 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
  [v30 setActive:1];

  v41 = [(SUSSoftwareUpdateReleaseNotesDetail *)v44 webView];
  id v40 = (id)[(WKWebView *)v41 bottomAnchor];
  id v39 = (id)[(SUSSoftwareUpdateReleaseNotesDetail *)v44 view];
  id v38 = (id)[v39 safeAreaLayoutGuide];
  id v37 = (id)[v38 bottomAnchor];
  id v36 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
  [v36 setActive:1];

  v42.receiver = v44;
  v42.super_class = (Class)SUSSoftwareUpdateReleaseNotesDetail;
  [(SUSSoftwareUpdateReleaseNotesDetail *)&v42 viewDidLoad];
  objc_storeStrong(v43, 0);
}

- (id)specifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "array", a2, self);
}

- (void)setReleaseNotes:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] != v8->_releaseNotes)
  {
    objc_storeStrong((id *)&v8->_releaseNotes, location[0]);
    v4 = +[SUSReleaseNotesProcessor sharedInstance];
    id v6 = [(SUSReleaseNotesProcessor *)v4 normalizeHtmlReleaseNotes:v8->_releaseNotes];

    id v5 = [(SUSSoftwareUpdateReleaseNotesDetail *)v8 webView];
    id v3 = -[WKWebView loadHTMLString:baseURL:](v5, "loadHTMLString:baseURL:", v6);

    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  if ([v11 navigationType])
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
  else
  {
    id v7 = (id)[MEMORY[0x263F82438] sharedApplication];
    id v6 = (id)[v11 request];
    id v5 = (id)[v6 URL];
    objc_msgSend(v7, "openURL:options:completionHandler:");

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (NSString)releaseNotes
{
  return self->_releaseNotes;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end