@interface MessageMarkupDocumentActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (ContentRepresentationHandlingDelegate)delegate;
- (MessageMarkupDocumentActivity)initWithAttachmentHandlingDelegate:(id)a3 context:(int64_t)a4;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (int64_t)context;
- (void)performActivity;
- (void)setContext:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MessageMarkupDocumentActivity

- (MessageMarkupDocumentActivity)initWithAttachmentHandlingDelegate:(id)a3 context:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MessageMarkupDocumentActivity;
  v7 = [(UIActivity *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MessageMarkupDocumentActivity *)v7 setDelegate:v6];
    [(MessageMarkupDocumentActivity *)v8 setContext:a4];
  }

  return v8;
}

- (id)activityType
{
  return @"com.apple.mobilemail.markupDocument";
}

- (id)activityTitle
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"MARKUP_DOCUMENT" value:&stru_1F39E2A88 table:@"Main"];

  return v3;
}

- (id)activityImage
{
  return (id)[MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35050]];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
}

- (ContentRepresentationHandlingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ContentRepresentationHandlingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
}

@end