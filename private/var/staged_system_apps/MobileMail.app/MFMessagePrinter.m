@interface MFMessagePrinter
- (CGRect)_printingRectForImageableRect:(CGRect)a3;
- (EMMessage)message;
- (MFMailMessage)legacyMessage;
- (MFMessagePrinter)initWithContentRequest:(id)a3;
- (MFMessagePrinterDelegate)delegate;
- (id)printInteractionControllerParentViewController:(id)a3;
- (int64_t)numberOfPages;
- (void)_setupPrintableContent;
- (void)dealloc;
- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)loadWithCompletion:(id)a3;
- (void)messageViewController:(id)a3 didFinishRenderingWithHeight:(double)a4;
- (void)presentPrintPopoverFromBarButtonItem:(id)a3;
- (void)presentPrintSheet;
- (void)setDelegate:(id)a3;
- (void)setLegacyMessage:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation MFMessagePrinter

- (void)dealloc
{
  v3 = +[UIPrintInteractionController sharedPrintController];
  v4 = [v3 printPageRenderer];

  if (v4 == self) {
    [v3 setPrintPageRenderer:0];
  }

  v5.receiver = self;
  v5.super_class = (Class)MFMessagePrinter;
  [(MFMessagePrinter *)&v5 dealloc];
}

- (MFMessagePrinter)initWithContentRequest:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MFMessagePrinter;
  objc_super v5 = [(MFMessagePrinter *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 message];
    message = v5->_message;
    v5->_message = (EMMessage *)v6;

    v8 = (EFPromise *)objc_alloc_init((Class)EFPromise);
    webLoadPromise = v5->_webLoadPromise;
    v5->_webLoadPromise = v8;

    v10 = [MFMessageViewController alloc];
    v11 = +[UIApplication sharedApplication];
    v12 = [v11 accountsController];
    v13 = [(MFMessageViewController *)v10 initWithScene:0 accountsController:v12];
    messageViewController = v5->_messageViewController;
    v5->_messageViewController = v13;

    [(MFMessageViewController *)v5->_messageViewController setDelegate:v5];
    [(MFMessageViewController *)v5->_messageViewController setContentRequest:v4];
    v15 = +[UIPrintInfo printInfo];
    v16 = [(EMMessage *)v5->_message subject];
    id v17 = [v16 length];
    if (v17)
    {
      v18 = [v16 subjectString];
      v19 = v18;
    }
    else
    {
      v19 = +[NSBundle mainBundle];
      v18 = [v19 localizedStringForKey:@"NO_SUBJECT" value:&stru_100619928 table:@"Main"];
    }
    [v15 setJobName:v18];
    if (!v17) {

    }
    v20 = +[UIPrintInteractionController sharedPrintController];
    [v20 setPrintPageRenderer:v5];
    [v20 setPrintInfo:v15];
    [v20 setDelegate:v5];
    id v21 = objc_alloc((Class)UIWindow);
    v22 = +[UIScreen mainScreen];
    [v22 bounds];
    v23 = [v21 initWithFrame:];
    window = v5->_window;
    v5->_window = v23;

    [(UIWindow *)v5->_window setAlpha:0.01];
    [(UIWindow *)v5->_window setHidden:0];
    v25 = v5->_window;
    v26 = [(MFMessageViewController *)v5->_messageViewController view];
    [(UIWindow *)v25 addSubview:v26];
  }
  return v5;
}

- (void)presentPrintPopoverFromBarButtonItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(EFPromise *)self->_webLoadPromise future];
  uint64_t v6 = +[EFScheduler mainThreadScheduler];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001BBCE4;
  v8[3] = &unk_100606E18;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [v5 onScheduler:v6 addSuccessBlock:v8];
}

- (void)presentPrintSheet
{
  v3 = [(EFPromise *)self->_webLoadPromise future];
  id v4 = +[EFScheduler mainThreadScheduler];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001BBDC8;
  v5[3] = &unk_10060C4F8;
  v5[4] = self;
  [v3 onScheduler:v4 addSuccessBlock:v5];
}

- (void)loadWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(EFPromise *)self->_webLoadPromise future];
  uint64_t v6 = +[EFScheduler mainThreadScheduler];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001BBEDC;
  v8[3] = &unk_10060C520;
  id v7 = v4;
  id v9 = v7;
  [v5 onScheduler:v6 addSuccessBlock:v8];
}

- (id)printInteractionControllerParentViewController:(id)a3
{
  id v4 = [(MFMessagePrinter *)self delegate];
  objc_super v5 = [v4 parentViewControllerForMessagePrinter:self];

  return v5;
}

- (int64_t)numberOfPages
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001BC018;
  v6[3] = &unk_1006047A0;
  v6[4] = self;
  v3 = +[EFScheduler mainThreadScheduler];
  [v3 performSyncBlock:v6];

  v5.receiver = self;
  v5.super_class = (Class)MFMessagePrinter;
  return [(MFMessagePrinter *)&v5 numberOfPages];
}

- (CGRect)_printingRectForImageableRect:(CGRect)a3
{
  CGFloat rect_24 = a3.origin.y;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  UIEdgeInsetsMakeWithEdges();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(MFMessagePrinter *)self paperRect];
  double v16 = v10 + v15;
  double v36 = v8 + v17;
  CGFloat v19 = v18 - (v10 + v14);
  double v21 = v20 - (v8 + v12);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v41);
  double rect_8 = v19;
  v42.origin.CGFloat x = v16;
  v42.origin.CGFloat y = v36;
  v42.size.CGFloat width = v19;
  v42.size.CGFloat height = v21;
  double v23 = fmax(MinY - CGRectGetMinY(v42), 0.0);
  v43.origin.CGFloat x = v16;
  v43.origin.CGFloat y = v36;
  v43.size.CGFloat width = v19;
  v43.size.CGFloat height = v21;
  double MaxY = CGRectGetMaxY(v43);
  v44.origin.CGFloat x = x;
  CGFloat rect = x;
  v44.origin.CGFloat y = rect_24;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  double v25 = MaxY - CGRectGetMaxY(v44);
  if (v23 >= v25) {
    double v26 = v23;
  }
  else {
    double v26 = v25;
  }
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = rect_24;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v45);
  v46.origin.CGFloat x = v16;
  v46.origin.CGFloat y = v36;
  v46.size.CGFloat width = rect_8;
  v46.size.CGFloat height = v21;
  double v28 = fmax(MinX - CGRectGetMinX(v46), 0.0);
  v47.origin.CGFloat x = v16;
  v47.origin.CGFloat y = v36;
  v47.size.CGFloat width = rect_8;
  v47.size.CGFloat height = v21;
  double MaxX = CGRectGetMaxX(v47);
  v48.origin.CGFloat x = rect;
  v48.origin.CGFloat y = rect_24;
  v48.size.CGFloat height = height;
  v48.size.CGFloat width = width;
  double v30 = MaxX - CGRectGetMaxX(v48);
  if (v28 >= v30) {
    double v31 = v28;
  }
  else {
    double v31 = v30;
  }
  double v32 = v16 + v31;
  double v33 = v36 + v26;
  double v34 = rect_8 - (v31 + v31);
  double v35 = v21 - (v26 + v26);
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (void)_setupPrintableContent
{
  if (!self->_isPrintableContentInitialized)
  {
    self->_isPrintableContentInitialized = 1;
    [(MFMessagePrinter *)self printableRect];
    -[MFMessagePrinter _printingRectForImageableRect:](self, "_printingRectForImageableRect:");
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v38 = [(MFMessageViewController *)self->_messageViewController messageContentView];
    [v38 setFrame:0.0, 0.0, v8, v10];
    double v11 = +[UIApplication sharedApplication];
    double v12 = [v11 mailboxProvider];
    [v38 setMailboxProvider:v12];

    [v38 layoutSubviews];
    [(MFMessagePrinter *)self printableRect];
    [(MFMessagePrinter *)self setHeaderHeight:v6 - v13];
    [(MFMessagePrinter *)self printableRect];
    [(MFMessagePrinter *)self setFooterHeight:v14 + v15 - (v6 + v10)];
    [(MFMessagePrinter *)self printableRect];
    double v17 = v16;
    [(MFMessagePrinter *)self printableRect];
    double v19 = v18;
    double v21 = v20;
    headerFormatter = self->_headerFormatter;
    if (!headerFormatter)
    {
      double v23 = [v38 headerView];
      [v23 removeAllHeaderBlocksAnimated:0];

      v24 = -[MFPrintMessageHeaderViewBlock initWithFrame:]([MFPrintMessageHeaderViewBlock alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      double v25 = [v38 headerView];
      [v25 addHeaderBlock:v24 animated:1];

      double v26 = [v38 headerView];
      v27 = [v26 viewPrintFormatter];
      double v28 = self->_headerFormatter;
      self->_headerFormatter = v27;

      [(MFMessagePrinter *)self addPrintFormatter:self->_headerFormatter startingAtPageAtIndex:0];
      headerFormatter = self->_headerFormatter;
    }
    double v29 = v4 - v17;
    double v30 = v19 + v21 - (v4 + v8);
    -[UIViewPrintFormatter setPerPageContentInsets:](headerFormatter, "setPerPageContentInsets:", 0.0, v29, 0.0, v30);
    uint64_t v31 = (uint64_t)[(UIViewPrintFormatter *)self->_headerFormatter pageCount];
    if (v31 <= 1) {
      uint64_t v32 = 1;
    }
    else {
      uint64_t v32 = v31;
    }
    uint64_t v33 = v32 - 1;
    [(UIViewPrintFormatter *)self->_headerFormatter rectForPageAtIndex:v32 - 1];
    self->_double headerLastPageHeight = headerLastPageHeight;
    bodyFormatter = self->_bodyFormatter;
    if (!bodyFormatter)
    {
      double v36 = [v38 viewPrintFormatter];
      v37 = self->_bodyFormatter;
      self->_bodyFormatter = v36;

      [(MFMessagePrinter *)self addPrintFormatter:self->_bodyFormatter startingAtPageAtIndex:v33];
      double headerLastPageHeight = self->_headerLastPageHeight;
      bodyFormatter = self->_bodyFormatter;
    }
    -[UIViewPrintFormatter setContentInsets:](bodyFormatter, "setContentInsets:", headerLastPageHeight, v29, 0.0, v30);
  }
}

- (void)messageViewController:(id)a3 didFinishRenderingWithHeight:(double)a4
{
  webLoadPromise = self->_webLoadPromise;
  id v5 = +[NSNull null];
  -[EFPromise finishWithResult:](webLoadPromise, "finishWithResult:");
}

- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  -[MFMessagePrinter _printingRectForImageableRect:](self, "_printingRectForImageableRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, v7, v9);
  if (!a3 && self->_contactPhoto)
  {
    double v13 = UIGraphicsGetCurrentContext();
    CGContextSaveGState(v13);
    double v14 = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(v14, v11 + -27.0, 0.0);
    -[UIImage drawInRect:](self->_contactPhoto, "drawInRect:", 0.0, 0.0, 27.0, 27.0);
    v20.origin.CGFloat x = 0.0;
    v20.origin.CGFloat y = 0.0;
    v20.size.CGFloat width = 27.0;
    v20.size.CGFloat height = 27.0;
    CGRect v21 = CGRectInset(v20, -0.125, -0.125);
    double v15 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, 1.0);
    [v15 setLineWidth:0.75];
    double v16 = +[UIColor whiteColor];
    [v16 set];

    [v15 stroke];
    v22.origin.CGFloat x = 0.0;
    v22.origin.CGFloat y = 0.0;
    v22.size.CGFloat width = 27.0;
    v22.size.CGFloat height = 27.0;
    CGRect v23 = CGRectInset(v22, 0.125, 0.125);
    double v17 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height, 1.0);
    [v17 setLineWidth:0.25];
    double v18 = +[UIColor colorWithWhite:0.75 alpha:1.0];
    [v18 set];

    [v17 stroke];
    CGContextRestoreGState(v13);
  }

  CGContextRestoreGState(CurrentContext);
}

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v10.CGFloat width = NAN;
  v10.CGFloat height = NAN;
  slice.origin = (CGPoint)v10;
  slice.size = v10;
  remainder.origin = (CGPoint)v10;
  remainder.size = v10;
  v24.origin = (CGPoint)v10;
  v24.size = v10;
  [(MFMessagePrinter *)self headerHeight];
  CGFloat v12 = v11;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGRectDivide(v28, &slice, &remainder, v12, CGRectMinYEdge);
  [(MFMessagePrinter *)self footerHeight];
  CGRectDivide(remainder, &v24, &remainder, v13, CGRectMaxYEdge);
  if (!CGRectIsEmpty(slice)) {
    -[MFMessagePrinter drawHeaderForPageAtIndex:inRect:](self, "drawHeaderForPageAtIndex:inRect:", a3, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v14 = [(MFMessagePrinter *)self printFormatters];
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v14);
        }
        double v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((uint64_t)[v18 startPage] <= a3)
        {
          id v19 = [v18 startPage];
          if ((uint64_t)v19 + (uint64_t)[v18 pageCount] > a3) {
            [(MFMessagePrinter *)self drawPrintFormatter:v18 forPageAtIndex:a3];
          }
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v15);
  }

  if (!CGRectIsEmpty(remainder)) {
    -[MFMessagePrinter drawContentForPageAtIndex:inRect:](self, "drawContentForPageAtIndex:inRect:", a3, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  }
  if (!CGRectIsEmpty(v24)) {
    -[MFMessagePrinter drawFooterForPageAtIndex:inRect:](self, "drawFooterForPageAtIndex:inRect:", a3, v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  }
}

- (MFMessagePrinterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFMessagePrinterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (MFMailMessage)legacyMessage
{
  return self->_legacyMessage;
}

- (void)setLegacyMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactPhoto, 0);
  objc_storeStrong((id *)&self->_bodyFormatter, 0);
  objc_storeStrong((id *)&self->_headerFormatter, 0);
  objc_storeStrong((id *)&self->_webLoadPromise, 0);
  objc_storeStrong((id *)&self->_messageViewController, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end