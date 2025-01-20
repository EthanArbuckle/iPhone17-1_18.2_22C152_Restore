@interface SLSoftLinks
+ (BOOL)canSendText;
+ (id)newComposeViewControllerDelegateInstance:(id)a3;
+ (id)newComposeViewControllerInstance;
+ (id)newComposeViewControllerInstanceWithDelegate:(id)a3 itemProvider:(id)a4 collaborationOptions:(id)a5 collaborationMetadata:(id)a6;
@end

@implementation SLSoftLinks

+ (id)newComposeViewControllerInstance
{
  id v2 = objc_alloc((Class)getMFMessageComposeViewControllerClass());
  return (id)[v2 init];
}

+ (id)newComposeViewControllerDelegateInstance:(id)a3
{
  id v3 = a3;
  v4 = [[SLComposeViewControllerDelegate alloc] initWithCallback:v3];

  return v4;
}

+ (id)newComposeViewControllerInstanceWithDelegate:(id)a3 itemProvider:(id)a4 collaborationOptions:(id)a5 collaborationMetadata:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)getMFMessageComposeViewControllerClass()) init];
  [v13 setMessageComposeDelegate:v12];

  [v13 insertCollaborationItemProvider:v11 collaborationShareOptions:v10 collaborationMetadata:v9 isCollaboration:1];
  return v13;
}

+ (BOOL)canSendText
{
  id MFMessageComposeViewControllerClass = getMFMessageComposeViewControllerClass();
  return [MFMessageComposeViewControllerClass canSendText];
}

@end