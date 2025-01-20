@interface TranscriptWaitingViewTextAttachmentViewProvider
- (_TtC7Journal47TranscriptWaitingViewTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6;
- (void)loadView;
@end

@implementation TranscriptWaitingViewTextAttachmentViewProvider

- (void)loadView
{
  type metadata accessor for TranscriptWaitingHostingView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  id v5 = [v3 init];
  [(TranscriptWaitingViewTextAttachmentViewProvider *)v4 setView:v5];
}

- (_TtC7Journal47TranscriptWaitingViewTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TranscriptWaitingViewTextAttachmentViewProvider();
  return [(TranscriptWaitingViewTextAttachmentViewProvider *)&v11 initWithTextAttachment:a3 parentView:a4 textLayoutManager:a5 location:a6];
}

@end