@interface DraftGestureHelper
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (ComposeCapable)scene;
- (ConversationViewController)conversationViewController;
- (DraftGestureHelper)initWithConversationViewController:(id)a3 scene:(id)a4;
- (UITapGestureRecognizer)draftTapGesture;
- (void)_tapRecognized:(id)a3;
- (void)enableGesture:(BOOL)a3;
- (void)setConversationViewController:(id)a3;
- (void)setDraftTapGesture:(id)a3;
- (void)setScene:(id)a3;
@end

@implementation DraftGestureHelper

- (DraftGestureHelper)initWithConversationViewController:(id)a3 scene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DraftGestureHelper;
  v8 = [(DraftGestureHelper *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_conversationViewController, v6);
    v10 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v9 action:"_tapRecognized:"];
    draftTapGesture = v9->_draftTapGesture;
    v9->_draftTapGesture = v10;

    [(UITapGestureRecognizer *)v9->_draftTapGesture setDelegate:v9];
    objc_storeWeak((id *)&v9->_scene, v7);
  }

  return v9;
}

- (void)enableGesture:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(DraftGestureHelper *)self conversationViewController];
  id v7 = [v5 view];

  id v6 = [(DraftGestureHelper *)self draftTapGesture];
  if (v3) {
    [v7 addGestureRecognizer:v6];
  }
  else {
    [v7 removeGestureRecognizer:v6];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_tapRecognized:(id)a3
{
  id v21 = [(DraftGestureHelper *)self conversationViewController];
  id v4 = [v21 collectionView];
  unsigned __int8 v5 = [v4 isDecelerating];

  if ((v5 & 1) == 0)
  {
    id v6 = [v21 referenceMessageListItem];
    id v7 = [v6 displayMessage];
    v8 = [v7 result];

    v9 = +[UIApplication sharedApplication];
    v10 = [v9 mailboxProvider];
    v11 = [v8 mailboxObjectIDs];
    v12 = [v11 firstObject];
    objc_super v13 = [v10 legacyMailboxForObjectID:v12];
    v14 = +[MFComposeMailMessage legacyMessageWithMessage:v8 mailboxUid:v13];

    v15 = [v8 mailboxes];
    v16 = [v15 firstObject];
    id v17 = [v16 type];

    if (v17 == (id)5) {
      id v18 = [objc_alloc((Class)_MFMailCompositionContext) initDraftRestoreOfMessage:v8 legacyMessage:v14];
    }
    else {
      id v18 = [objc_alloc((Class)_MFMailCompositionContext) initOutboxRestoreOfMessage:v8 legacyMessage:v14];
    }
    v19 = v18;
    v20 = [(DraftGestureHelper *)self scene];
    [v20 showComposeWithContext:v19 animated:1 initialTitle:0 presentationSource:0 completionBlock:0];
  }
}

- (UITapGestureRecognizer)draftTapGesture
{
  return self->_draftTapGesture;
}

- (void)setDraftTapGesture:(id)a3
{
}

- (ConversationViewController)conversationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_conversationViewController);

  return (ConversationViewController *)WeakRetained;
}

- (void)setConversationViewController:(id)a3
{
}

- (ComposeCapable)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (ComposeCapable *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_destroyWeak((id *)&self->_conversationViewController);

  objc_storeStrong((id *)&self->_draftTapGesture, 0);
}

@end