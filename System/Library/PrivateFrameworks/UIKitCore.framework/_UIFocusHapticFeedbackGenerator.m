@interface _UIFocusHapticFeedbackGenerator
- (CARInputDeviceTouchpad)currentTouchpad;
- (CARSession)carSession;
- (_UIFocusHapticFeedbackGenerator)initWithScreen:(id)a3;
- (unint64_t)currentSenderID;
- (void)performHapticFeedbackForFocusUpdateInContext:(id)a3;
- (void)setCarSession:(id)a3;
- (void)setCurrentSenderID:(unint64_t)a3;
- (void)setCurrentTouchpad:(id)a3;
@end

@implementation _UIFocusHapticFeedbackGenerator

- (_UIFocusHapticFeedbackGenerator)initWithScreen:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusHapticFeedbackGenerator;
  v5 = [(_UIFocusHapticFeedbackGenerator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 _carSession];
    carSession = v5->_carSession;
    v5->_carSession = (CARSession *)v6;
  }
  return v5;
}

- (void)performHapticFeedbackForFocusUpdateInContext:(id)a3
{
  id v14 = a3;
  id v4 = [v14 _request];
  v5 = [v4 inputDeviceInfo];

  uint64_t v6 = v14;
  if (v5)
  {
    v7 = [v14 _request];
    v8 = [v7 inputDeviceInfo];
    unint64_t v9 = [v8 senderID];

    uint64_t v6 = v14;
    if (v9)
    {
      if ([(_UIFocusHapticFeedbackGenerator *)self currentSenderID] != v9)
      {
        v10 = [(CARSession *)self->_carSession inputDeviceManager];
        v11 = [v10 touchpadWithSenderID:v9];

        if ([v11 feedbackSupported])
        {
          v12 = v11;
        }
        else
        {
          v12 = 0;
          unint64_t v9 = 0;
        }
        currentTouchpad = self->_currentTouchpad;
        self->_currentTouchpad = v12;

        self->_currentSenderID = v9;
      }
      [(CARInputDeviceTouchpad *)self->_currentTouchpad performFeedbackOfType:1];
      uint64_t v6 = v14;
    }
  }
}

- (CARSession)carSession
{
  return self->_carSession;
}

- (void)setCarSession:(id)a3
{
}

- (CARInputDeviceTouchpad)currentTouchpad
{
  return self->_currentTouchpad;
}

- (void)setCurrentTouchpad:(id)a3
{
}

- (unint64_t)currentSenderID
{
  return self->_currentSenderID;
}

- (void)setCurrentSenderID:(unint64_t)a3
{
  self->_currentSenderID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouchpad, 0);
  objc_storeStrong((id *)&self->_carSession, 0);
}

@end