@interface CKMessagesController
- (id)ppt_chatController;
@end

@implementation CKMessagesController

- (id)ppt_chatController
{
  v3 = [(CKMessagesController *)self composeChatController];

  if (v3) {
    [(CKMessagesController *)self composeChatController];
  }
  else {
  v4 = [(CKMessagesController *)self chatController];
  }

  return v4;
}

@end