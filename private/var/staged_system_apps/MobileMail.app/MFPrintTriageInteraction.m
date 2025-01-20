@interface MFPrintTriageInteraction
+ (id)interactionWithContentRequest:(id)a3 scene:(id)a4 delegate:(id)a5;
- (MFMessagePrinterDelegate)printerDelegate;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)title;
- (void)_performInteraction_Internal;
- (void)setPrinterDelegate:(id)a3;
@end

@implementation MFPrintTriageInteraction

+ (id)interactionWithContentRequest:(id)a3 scene:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___MFPrintTriageInteraction;
  v9 = [super interactionWithContentRequest:a3 scene:a4];
  [v9 setPrinterDelegate:v8];

  return v9;
}

- (void)_performInteraction_Internal
{
  v3 = [(MFMessageCompositionTriageInteraction *)self contentRequest];

  if (v3)
  {
    v4 = [MFMessagePrinter alloc];
    v5 = [(MFMessageCompositionTriageInteraction *)self contentRequest];
    v10 = [(MFMessagePrinter *)v4 initWithContentRequest:v5];
  }
  else
  {
    v10 = 0;
  }
  v6 = [(MFPrintTriageInteraction *)self printerDelegate];
  [(MFMessagePrinter *)v10 setDelegate:v6];

  v7 = [(MFTriageInteraction *)self presentationSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = [(MFTriageInteraction *)self presentationSource];
    [(MFMessagePrinter *)v10 presentPrintPopoverFromBarButtonItem:v9];
  }
  else
  {
    [(MFMessagePrinter *)v10 presentPrintSheet];
  }
}

- (id)title
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"PRINT" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerPrint;
}

- (id)_iconImageName
{
  return MFImageGlyphPrint;
}

- (id)_previewImageName
{
  return MFImageGlyphPrint;
}

- (MFMessagePrinterDelegate)printerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printerDelegate);

  return (MFMessagePrinterDelegate *)WeakRetained;
}

- (void)setPrinterDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end