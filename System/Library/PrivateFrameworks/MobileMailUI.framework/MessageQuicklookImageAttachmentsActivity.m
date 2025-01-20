@interface MessageQuicklookImageAttachmentsActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (ContentRepresentationHandlingDelegate)delegate;
- (MessageQuicklookImageAttachmentsActivity)initWithAttachmentHandlingDelegate:(id)a3 context:(int64_t)a4 url:(id)a5;
- (NSURL)url;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)_cleanup;
- (void)performActivity;
- (void)setDelegate:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation MessageQuicklookImageAttachmentsActivity

- (MessageQuicklookImageAttachmentsActivity)initWithAttachmentHandlingDelegate:(id)a3 context:(int64_t)a4 url:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MessageQuicklookImageAttachmentsActivity;
  v9 = [(UIActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(MessageQuicklookImageAttachmentsActivity *)v9 setDelegate:v7];
    [(MessageQuicklookImageAttachmentsActivity *)v10 setUrl:v8];
  }

  return v10;
}

- (id)activityType
{
  return @"com.apple.mobilemail.activity.Quicklook";
}

- (id)activityTitle
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"QUICK_LOOK" value:&stru_1F39E2A88 table:@"Main"];

  return v3;
}

- (id)activityImage
{
  return (id)[MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35078]];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
}

- (void)_cleanup
{
  v5.receiver = self;
  v5.super_class = (Class)MessageQuicklookImageAttachmentsActivity;
  [(UIActivity *)&v5 _cleanup];
  v3 = [(MessageQuicklookImageAttachmentsActivity *)self delegate];
  v4 = [(MessageQuicklookImageAttachmentsActivity *)self url];
  [v3 previewURL:v4];
}

- (ContentRepresentationHandlingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ContentRepresentationHandlingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end