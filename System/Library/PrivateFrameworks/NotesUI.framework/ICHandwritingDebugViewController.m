@interface ICHandwritingDebugViewController
- (BOOL)_canShowWhileLocked;
- (ICHandwritingDebugDelegate)delegate;
- (ICHandwritingDebugViewController)initWithDelegate:(id)a3;
- (NSArray)drawings;
- (OS_dispatch_queue)recognitionQueue;
- (UIActivityIndicatorView)activityIndicator;
- (UITextView)textView;
- (void)close;
- (void)refresh;
- (void)setActivityIndicator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawings:(id)a3;
- (void)setRecognitionQueue:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICHandwritingDebugViewController

- (ICHandwritingDebugViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICHandwritingDebugViewController;
  v5 = [(ICHandwritingDebugViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)ICHandwritingDebugViewController;
  [(ICHandwritingDebugViewController *)&v22 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  id v4 = [(ICHandwritingDebugViewController *)self view];
  [v4 bounds];
  v5 = objc_msgSend(v3, "initWithFrame:");
  [(ICHandwritingDebugViewController *)self setTextView:v5];

  v6 = [(ICHandwritingDebugViewController *)self textView];
  [v6 setEditable:0];

  v7 = [(ICHandwritingDebugViewController *)self textView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v8 = [(ICHandwritingDebugViewController *)self view];
  v9 = [(ICHandwritingDebugViewController *)self textView];
  [v8 addSubview:v9];

  v10 = [(ICHandwritingDebugViewController *)self textView];
  objc_msgSend(v10, "ic_addAnchorsToFillSuperview");

  v11 = [(ICHandwritingDebugViewController *)self textView];
  objc_msgSend(v11, "setTextContainerInset:", 0.0, 12.0, 0.0, 12.0);

  v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [(ICHandwritingDebugViewController *)self setActivityIndicator:v12];

  v13 = [(ICHandwritingDebugViewController *)self activityIndicator];
  [v13 setHidesWhenStopped:1];

  id v14 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v15 = [(ICHandwritingDebugViewController *)self activityIndicator];
  v16 = (void *)[v14 initWithCustomView:v15];

  [v16 setEnabled:0];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:13 target:self action:sel_refresh];
  v23[0] = v17;
  v23[1] = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v19 = [(ICHandwritingDebugViewController *)self navigationItem];
  [v19 setRightBarButtonItems:v18];

  v20 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_close];
  v21 = [(ICHandwritingDebugViewController *)self navigationItem];
  [v21 setLeftBarButtonItem:v20];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ICHandwritingDebugViewController;
  -[ICHandwritingDebugViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  v5 = [(ICHandwritingDebugViewController *)self navigationController];
  [v5 setNavigationBarHidden:0 animated:v3];

  [(ICHandwritingDebugViewController *)self refresh];
}

- (OS_dispatch_queue)recognitionQueue
{
  recognitionQueue = self->_recognitionQueue;
  if (!recognitionQueue)
  {
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notes.debug-recognition-queue", v4);
    objc_super v6 = self->_recognitionQueue;
    self->_recognitionQueue = v5;

    recognitionQueue = self->_recognitionQueue;
  }
  return recognitionQueue;
}

- (void)refresh
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(ICHandwritingDebugViewController *)self delegate];
  id v4 = [v3 drawingsForHandwritingDebug];
  [(ICHandwritingDebugViewController *)self setDrawings:v4];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = [(ICHandwritingDebugViewController *)self drawings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v11 = [v10 visualizationManager];
        char v12 = [v11 recognitionStatusReportingEnabled];

        if ((v12 & 1) == 0)
        {
          v13 = [v10 visualizationManager];
          [v13 setRecognitionStatusReportingEnabled:1];

          id v14 = [v10 visualizationManager];
          [v14 setDelegate:self];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v7);
  }

  v15 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(ICHandwritingDebugViewController *)self drawings];
    uint64_t v17 = [v16 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = v17;
    _os_log_impl(&dword_1B08EB000, v15, OS_LOG_TYPE_DEFAULT, "Refreshing handwriting debug view with %ld drawings", buf, 0xCu);
  }
  v18 = [(ICHandwritingDebugViewController *)self drawings];
  v19 = (void *)[v18 copy];

  v20 = [(ICHandwritingDebugViewController *)self recognitionQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __43__ICHandwritingDebugViewController_refresh__block_invoke;
  v22[3] = &unk_1E5FD91D0;
  v22[4] = self;
  id v23 = v19;
  id v21 = v19;
  dispatch_async(v20, v22);
}

void __43__ICHandwritingDebugViewController_refresh__block_invoke(uint64_t a1)
{
  v70[3] = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ICHandwritingDebugViewController_refresh__block_invoke_2;
  block[3] = &unk_1E5FD8DF0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(MEMORY[0x1E4F14428], block);
  unint64_t v45 = [*(id *)(a1 + 40) count];
  v69[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v2 = v69[0];
  BOOL v3 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:16.0];
  id v4 = objc_msgSend(v3, "ic_fontWithSingleLineA");
  uint64_t v5 = *MEMORY[0x1E4FB0808];
  v70[0] = v4;
  v70[1] = &unk_1F09A4388;
  uint64_t v6 = *MEMORY[0x1E4FB0700];
  v69[1] = v5;
  v69[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4FB1618] labelColor];
  v70[2] = v7;
  v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:3];

  v67[0] = v2;
  uint64_t v8 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:14.0];
  v9 = objc_msgSend(v8, "ic_fontWithSingleLineA");
  v67[1] = v6;
  v68[0] = v9;
  v10 = [MEMORY[0x1E4FB1618] labelColor];
  v68[1] = v10;
  v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];

  v65[0] = v2;
  v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  char v12 = objc_msgSend(v11, "ic_fontWithSingleLineA");
  v65[1] = v6;
  v66[0] = v12;
  v13 = [MEMORY[0x1E4FB1618] labelColor];
  v66[1] = v13;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];

  v63[0] = v2;
  id v14 = [MEMORY[0x1E4FB08E0] italicSystemFontOfSize:14.0];
  v15 = objc_msgSend(v14, "ic_fontWithSingleLineA");
  v63[1] = v6;
  v64[0] = v15;
  v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v64[1] = v16;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];

  id v17 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v40 = a1;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v46 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v46)
  {
    uint64_t v44 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v57 != v44) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        if (([v19 recognitionEnabled] & 1) == 0) {
          [v19 setRecognitionEnabled:1];
        }
        if (v45 >= 2)
        {
          v20 = NSString;
          id v21 = [v19 uuid];
          objc_super v22 = [v20 localizedStringWithFormat:@"%@:\n\n", v21];

          id v23 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v22 attributes:v41];
          [v17 appendAttributedString:v23];
        }
        long long v24 = [v19 visualizationManager];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v25 = [MEMORY[0x1E4F38E70] availableRecognitionStatusKeys];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (!v26)
        {

LABEL_27:
          v36 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"No results" attributes:v43];
          [v17 appendAttributedString:v36];

          goto LABEL_28;
        }
        uint64_t v27 = v26;
        uint64_t v47 = i;
        char v28 = 0;
        uint64_t v29 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v53 != v29) {
              objc_enumerationMutation(v25);
            }
            uint64_t v31 = *(void *)(*((void *)&v52 + 1) + 8 * j);
            v32 = [MEMORY[0x1E4F38E70] localizedNameForRecognitionStatusKey:v31];
            if (v32) {
              v33 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v32 attributes:v49];
            }
            else {
              v33 = 0;
            }
            v34 = [v24 valueForRecognitionStatusKey:v31];
            if (v34)
            {
              v35 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v34 attributes:v48];
              if (v33)
              {
                [v17 appendAttributedString:v33];
                objc_msgSend(v17, "ic_appendString:", @"\n");
              }
              [v17 appendAttributedString:v35];
              objc_msgSend(v17, "ic_appendString:", @"\n\n");

              char v28 = 1;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v52 objects:v61 count:16];
        }
        while (v27);

        uint64_t i = v47;
        if ((v28 & 1) == 0) {
          goto LABEL_27;
        }
LABEL_28:
        objc_msgSend(v17, "ic_appendString:", @"\n\n");
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v46);
  }

  if (![*(id *)(v40 + 40) count] || !objc_msgSend(v17, "length"))
  {
    v37 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"No inline drawings" attributes:v43];
    [v17 appendAttributedString:v37];
  }
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __43__ICHandwritingDebugViewController_refresh__block_invoke_45;
  v50[3] = &unk_1E5FD91D0;
  v50[4] = *(void *)(v40 + 32);
  id v51 = v17;
  id v38 = v17;
  v39 = (void *)MEMORY[0x1E4F14428];
  dispatch_sync(MEMORY[0x1E4F14428], v50);
}

void __43__ICHandwritingDebugViewController_refresh__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activityIndicator];
  [v1 startAnimating];
}

void __43__ICHandwritingDebugViewController_refresh__block_invoke_45(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) textView];
  [v3 setAttributedText:v2];

  id v4 = [*(id *)(a1 + 32) activityIndicator];
  [v4 stopAnimating];
}

- (void)close
{
  id v2 = [(ICHandwritingDebugViewController *)self delegate];
  [v2 handwritingDebugShouldClose];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICHandwritingDebugDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICHandwritingDebugDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)drawings
{
  return self->_drawings;
}

- (void)setDrawings:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void)setRecognitionQueue:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_drawings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end