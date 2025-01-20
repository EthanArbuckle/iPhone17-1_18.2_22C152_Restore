@interface MFFilterTriageInteraction
+ (id)interactionWithMessageListItem:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 messageList:(id)a6 delegate:(id)a7;
- (EMMessageList)messageList;
- (id)_previewImageName;
- (id)title;
- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4;
- (void)setMessageList:(id)a3;
@end

@implementation MFFilterTriageInteraction

+ (id)interactionWithMessageListItem:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 messageList:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v19 = v12;
  v15 = +[NSArray arrayWithObjects:&v19 count:1];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___MFFilterTriageInteraction;
  v16 = [super interactionWithMessageListItems:v15 undoManager:0 origin:a4 actor:a5];

  [v16 setMessageList:v13];
  [v16 setDelegate:v14];

  return v16;
}

- (id)title
{
  return (id)_EFLocalizedString();
}

- (id)_previewImageName
{
  return MFImageGlyphFilterSender;
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, MFFilterTriageInteraction *, uint64_t))a4;
  v5 = [(MFTriageInteraction *)self delegate];
  [v5 filterUIWithFilterInteraction:self];

  if (v6) {
    v6[2](v6, self, 1);
  }
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setMessageList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end