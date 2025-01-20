@interface CKTranscriptExtensionViewController
+ (void)initialize;
- (CKDetailsNavigationController)detailsNavigationController;
- (NSExtension)weakExtension;
- (NSUUID)requestUUID;
- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3;
- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3;
- (void)doneButtonPressedForChatController:(id)a3;
- (void)presentConversationWithMessageGUID:(id)a3 attachmentGUID:(id)a4;
- (void)setDetailsNavigationController:(id)a3;
- (void)setRequestUUID:(id)a3;
- (void)setWeakExtension:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKTranscriptExtensionViewController

+ (void)initialize
{
  if (CKIsRunningInMessagesTranscriptExtension())
  {
    if (qword_100008E38 != -1) {
      dispatch_once(&qword_100008E38, &stru_100004240);
    }
    v2 = dispatch_get_global_queue(2, 0);
    dispatch_async(v2, &stru_100004260);

    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100004280);
  }
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptExtensionViewController;
  [(CKTranscriptExtensionViewController *)&v12 viewDidLoad];
  v3 = [(CKTranscriptExtensionViewController *)self extensionContext];
  v4 = [v3 inputItems];
  v5 = [v4 firstObject];

  if (v5)
  {
    v6 = [v5 userInfo];
    v7 = [v6 valueForKey:@"messageGUID"];

    v8 = [v5 userInfo];
    v9 = [v8 valueForKey:@"attachmentGUID"];

    if (![v7 length])
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "chatGUID or messageGUID key not provided in extension context", v11, 2u);
        }
      }
      exit(0);
    }
    [(CKTranscriptExtensionViewController *)self presentConversationWithMessageGUID:v7 attachmentGUID:v9];
  }
}

- (void)presentConversationWithMessageGUID:(id)a3 attachmentGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[CKSocialLayerChatController chatIdentifierForMessageWithGUID:v6];
  v9 = +[IMChatRegistry sharedRegistry];
  v10 = [v9 existingChatWithChatIdentifier:v8];

  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "The messageGUID %@ doesn't correspond to a chat. Nothing to present.", (uint8_t *)&v15, 0xCu);
      }
    }
    exit(0);
  }
  id v11 = [objc_alloc((Class)CKConversation) initWithChat:v10];
  [v11 setLoadedMessageCount:50];
  id v12 = [objc_alloc((Class)CKSocialLayerChatController) initWithConversation:v11];
  [v12 setMessageGUID:v6];
  [v12 setAttachmentGUID:v7];
  [v12 setDelegate:self];
  id v17 = v12;
  v13 = +[NSArray arrayWithObjects:&v17 count:1];
  [(CKTranscriptExtensionViewController *)self setViewControllers:v13];
}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)doneButtonPressedForChatController:(id)a3
{
  v3 = [(CKTranscriptExtensionViewController *)self extensionContext];
  v4 = [v3 _auxiliaryConnection];
  id v5 = [v4 remoteObjectProxy];

  [v5 requestDismissal];
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (NSExtension)weakExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakExtension);

  return (NSExtension *)WeakRetained;
}

- (void)setWeakExtension:(id)a3
{
}

- (CKDetailsNavigationController)detailsNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsNavigationController);

  return (CKDetailsNavigationController *)WeakRetained;
}

- (void)setDetailsNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_detailsNavigationController);
  objc_destroyWeak((id *)&self->_weakExtension);

  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end