@interface _UILongDefinitionViewController
- (_UILongDefinitionViewController)initWithDefinitionValue:(id)a3;
- (void)viewDidLoad;
@end

@implementation _UILongDefinitionViewController

- (_UILongDefinitionViewController)initWithDefinitionValue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UILongDefinitionViewController;
  v6 = [(UIViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_definitionValue, a3);
    v8 = [(_UIDefinitionValue *)v7->_definitionValue term];
    [(UIViewController *)v7 setTitle:v8];
  }
  return v7;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)_UILongDefinitionViewController;
  [(UIViewController *)&v24 viewDidLoad];
  v3 = [(UIViewController *)self view];
  [v3 setAutoresizingMask:18];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  v4 = (void *)_MergedGlobals_5_5;
  uint64_t v33 = _MergedGlobals_5_5;
  if (!_MergedGlobals_5_5)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __get_WKUserStyleSheetClass_block_invoke;
    v28 = &unk_1E52D9900;
    v29 = &v30;
    __get_WKUserStyleSheetClass_block_invoke((uint64_t)&v25);
    v4 = (void *)v31[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v30, 8);
  v6 = objc_msgSend([v5 alloc], "initWithSource:forMainFrameOnly:", @":root{color-scheme:light dark;} a{pointer-events:none !important;}",
                 0);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  v7 = (void *)qword_1EB25C8C0;
  uint64_t v33 = qword_1EB25C8C0;
  if (!qword_1EB25C8C0)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __getWKUserContentControllerClass_block_invoke;
    v28 = &unk_1E52D9900;
    v29 = &v30;
    __getWKUserContentControllerClass_block_invoke((uint64_t)&v25);
    v7 = (void *)v31[3];
  }
  v8 = v7;
  _Block_object_dispose(&v30, 8);
  id v9 = objc_alloc_init(v8);
  [v9 _addUserStyleSheet:v6];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  objc_super v10 = (void *)qword_1EB25C8C8;
  uint64_t v33 = qword_1EB25C8C8;
  if (!qword_1EB25C8C8)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __getWKWebViewConfigurationClass_block_invoke;
    v28 = &unk_1E52D9900;
    v29 = &v30;
    __getWKWebViewConfigurationClass_block_invoke((uint64_t)&v25);
    objc_super v10 = (void *)v31[3];
  }
  v11 = v10;
  _Block_object_dispose(&v30, 8);
  id v12 = objc_alloc_init(v11);
  [v12 setUserContentController:v9];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  v13 = (void *)qword_1EB25C8D0;
  uint64_t v33 = qword_1EB25C8D0;
  if (!qword_1EB25C8D0)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __getWKWebViewClass_block_invoke;
    v28 = &unk_1E52D9900;
    v29 = &v30;
    __getWKWebViewClass_block_invoke((uint64_t)&v25);
    v13 = (void *)v31[3];
  }
  v14 = v13;
  _Block_object_dispose(&v30, 8);
  id v15 = [v14 alloc];
  [v3 bounds];
  v16 = objc_msgSend(v15, "initWithFrame:configuration:", v12);
  [v16 setOpaque:0];
  v17 = +[UIColor systemBackgroundColor];
  [v16 setBackgroundColor:v17];

  [v16 setAllowsLinkPreview:0];
  [v16 setAutoresizingMask:18];
  v18 = (void *)MEMORY[0x1E4F28E78];
  v19 = [(_UIDefinitionValue *)self->_definitionValue longDefinition];
  v20 = [v18 stringWithString:v19];

  uint64_t v21 = [v20 rangeOfString:@"</head>"];
  if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v20, "replaceCharactersInRange:withString:", v21, v22, @"<meta name='viewport' content='width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0'></head>");
  }
  id v23 = (id)[v16 loadHTMLString:v20 baseURL:0];
  [v3 addSubview:v16];
}

- (void).cxx_destruct
{
}

@end