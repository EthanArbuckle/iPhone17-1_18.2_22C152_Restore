@interface MFAttachmentShowcaseInformation
+ (id)showcaseInformation;
- (BOOL)fromManagedAccount;
- (BOOL)shouldAnimate;
- (CGRect)originRect;
- (EMMailboxObjectID)mailboxObjectID;
- (EMMessage)message;
- (UIView)originView;
- (void)setFromManagedAccount:(BOOL)a3;
- (void)setMailboxObjectID:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOriginRect:(CGRect)a3;
- (void)setOriginView:(id)a3;
- (void)setShouldAnimate:(BOOL)a3;
@end

@implementation MFAttachmentShowcaseInformation

+ (id)showcaseInformation
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (EMMailboxObjectID)mailboxObjectID
{
  return self->_mailboxObjectID;
}

- (void)setMailboxObjectID:(id)a3
{
}

- (BOOL)fromManagedAccount
{
  return self->_fromManagedAccount;
}

- (void)setFromManagedAccount:(BOOL)a3
{
  self->_fromManagedAccount = a3;
}

- (CGRect)originRect
{
  double x = self->_originRect.origin.x;
  double y = self->_originRect.origin.y;
  double width = self->_originRect.size.width;
  double height = self->_originRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginRect:(CGRect)a3
{
  self->_originRect = a3;
}

- (UIView)originView
{
  return self->_originView;
}

- (void)setOriginView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originView, 0);
  objc_storeStrong((id *)&self->_mailboxObjectID, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end