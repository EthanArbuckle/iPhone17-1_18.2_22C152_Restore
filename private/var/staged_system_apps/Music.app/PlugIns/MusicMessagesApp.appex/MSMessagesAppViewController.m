@interface MSMessagesAppViewController
- (void)mma_shareRichLinkMetadata:(id)a3;
@end

@implementation MSMessagesAppViewController

- (void)mma_shareRichLinkMetadata:(id)a3
{
  id v4 = a3;
  [(MSMessagesAppViewController *)self requestPresentationStyle:0];
  v5 = objc_opt_new();
  [v5 set_linkMetadata:v4];
  v6 = [(MSMessagesAppViewController *)self activeConversation];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005C00;
  v8[3] = &unk_10054E320;
  id v9 = v4;
  id v7 = v4;
  [v6 insertRichLink:v5 completionHandler:v8];
}

@end