@interface MessagePrintQuicklookableAttachmentActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (MessagePrintQuicklookableAttachmentActivity)initWithPrintPageRenderer:(id)a3;
- (UIPrintPageRenderer)pageRenderer;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
- (void)setPageRenderer:(id)a3;
@end

@implementation MessagePrintQuicklookableAttachmentActivity

- (MessagePrintQuicklookableAttachmentActivity)initWithPrintPageRenderer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MessagePrintQuicklookableAttachmentActivity;
  v6 = [(UIActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pageRenderer, a3);
  }

  return v7;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F9F3C0];
}

- (id)activityTitle
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"PRINT" value:&stru_1F39E2A88 table:@"Main"];

  return v3;
}

- (id)activityImage
{
  return (id)[MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35070]];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  id v4 = [MEMORY[0x1E4F934B0] sharedPrintController];
  v3 = [(MessagePrintQuicklookableAttachmentActivity *)self pageRenderer];
  [v4 setPrintPageRenderer:v3];

  [v4 presentAnimated:1 completionHandler:0];
  [(UIActivity *)self activityDidFinish:1];
}

- (UIPrintPageRenderer)pageRenderer
{
  return self->_pageRenderer;
}

- (void)setPageRenderer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end