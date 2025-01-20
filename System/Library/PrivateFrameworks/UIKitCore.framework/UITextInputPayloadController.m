@interface UITextInputPayloadController
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (BOOL)_isMobileSMS;
- (BOOL)supportsStickerTapbackPayload;
- (NSArray)supportedPayloadIds;
- (UITextInputPayloadDelegate)payloadDelegate;
- (void)setPayloadDelegate:(id)a3;
- (void)setSupportedPayloadIds:(id)a3;
@end

@implementation UITextInputPayloadController

+ (id)sharedInstance
{
  v3 = (void *)__payloadController;
  if (!__payloadController)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)__payloadController;
    __payloadController = (uint64_t)v4;

    [(id)__payloadController setSupportedPayloadIds:&unk_1ED3F0AC0];
    v3 = (void *)__payloadController;
  }
  return v3;
}

+ (void)releaseSharedInstance
{
  v2 = (void *)__payloadController;
  if (__payloadController)
  {
    __payloadController = 0;
  }
}

- (void)setSupportedPayloadIds:(id)a3
{
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  supportedPayloadIds = self->_supportedPayloadIds;
  self->_supportedPayloadIds = v5;

  v7 = +[UIKeyboardImpl activeInstance];
  v8 = [v7 keyboardState];
  [v8 setSupportedPayloadIds:v4];

  if (+[UIKeyboard usesInputSystemUI])
  {
    id v10 = +[UIKeyboardImpl activeInstance];
    v9 = [v10 remoteTextInputPartner];
    [v9 documentTraitsChanged];
  }
}

- (void)setPayloadDelegate:(id)a3
{
}

- (BOOL)_isMobileSMS
{
  v2 = +[UIKeyboard keyboardBundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.MobileSMS"];

  return v3;
}

- (BOOL)supportsStickerTapbackPayload
{
  BOOL v3 = [(UITextInputPayloadController *)self _isMobileSMS];
  if (v3)
  {
    supportedPayloadIds = self->_supportedPayloadIds;
    LOBYTE(v3) = [(NSArray *)supportedPayloadIds containsObject:@"com.apple.messages.stickerTapback"];
  }
  return v3;
}

- (NSArray)supportedPayloadIds
{
  return self->_supportedPayloadIds;
}

- (UITextInputPayloadDelegate)payloadDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_payloadDelegate);
  return (UITextInputPayloadDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_payloadDelegate);
  objc_storeStrong((id *)&self->_supportedPayloadIds, 0);
}

@end