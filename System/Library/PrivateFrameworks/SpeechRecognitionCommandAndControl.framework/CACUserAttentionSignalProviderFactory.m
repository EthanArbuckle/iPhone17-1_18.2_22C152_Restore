@interface CACUserAttentionSignalProviderFactory
+ (id)_attentionAwarenessConfigurationWithIdentifier:(id)a3 eventMask:(unint64_t)a4 samplingInterval:(double)a5 attentionLossTimeout:(double)a6;
- (CACUserAttentionSignalProviderFactory)initWithSamplingInterval:(double)a3 attentionLossTimeout:(double)a4 supportedAttentionAwarenessEvents:(unint64_t)a5;
- (id)faceAttentionAwarenessClient;
- (id)touchAttentionAwarenessClient;
- (id)wakeGestureManager;
- (unint64_t)_faceAttentionAwarenessEventMask;
- (unint64_t)_touchAttentionAwarenessEventMask;
@end

@implementation CACUserAttentionSignalProviderFactory

- (CACUserAttentionSignalProviderFactory)initWithSamplingInterval:(double)a3 attentionLossTimeout:(double)a4 supportedAttentionAwarenessEvents:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CACUserAttentionSignalProviderFactory;
  result = [(CACUserAttentionSignalProviderFactory *)&v9 init];
  if (result)
  {
    result->_samplingInterval = a3;
    result->_attentionLossTimeout = a4;
    result->_supportedAttentionAwarenessEvents = a5;
  }
  return result;
}

- (id)faceAttentionAwarenessClient
{
  id v3 = objc_alloc_init(MEMORY[0x263F28868]);
  v4 = objc_msgSend((id)objc_opt_class(), "_attentionAwarenessConfigurationWithIdentifier:eventMask:samplingInterval:attentionLossTimeout:", @"com.apple.SpeechRecognitionCore.AttentionAwareness.Face", -[CACUserAttentionSignalProviderFactory _faceAttentionAwarenessEventMask](self, "_faceAttentionAwarenessEventMask"), self->_samplingInterval, self->_attentionLossTimeout);
  [v3 setConfiguration:v4 shouldReset:1];

  return v3;
}

- (id)touchAttentionAwarenessClient
{
  id v3 = objc_alloc_init(MEMORY[0x263F28868]);
  v4 = objc_msgSend((id)objc_opt_class(), "_attentionAwarenessConfigurationWithIdentifier:eventMask:samplingInterval:attentionLossTimeout:", @"com.apple.SpeechRecognitionCore.AttentionAwareness.Touch", -[CACUserAttentionSignalProviderFactory _touchAttentionAwarenessEventMask](self, "_touchAttentionAwarenessEventMask"), 0.1, 0.1);
  [v3 setConfiguration:v4 shouldReset:1];

  return v3;
}

- (id)wakeGestureManager
{
  return (id)[MEMORY[0x263F017D0] sharedManager];
}

- (unint64_t)_faceAttentionAwarenessEventMask
{
  return self->_supportedAttentionAwarenessEvents & 0x81;
}

- (unint64_t)_touchAttentionAwarenessEventMask
{
  if ((self->_supportedAttentionAwarenessEvents & 0x200) != 0) {
    return self->_supportedAttentionAwarenessEvents & 1 | 8;
  }
  else {
    return self->_supportedAttentionAwarenessEvents & 9;
  }
}

+ (id)_attentionAwarenessConfigurationWithIdentifier:(id)a3 eventMask:(unint64_t)a4 samplingInterval:(double)a5 attentionLossTimeout:(double)a6
{
  objc_super v9 = (objc_class *)MEMORY[0x263F28870];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  [v11 setIdentifier:v10];

  [v11 setEventMask:a4];
  [v11 setSamplingInterval:a5];
  [v11 setSampleWhileAbsent:1];
  [v11 setAttentionLostTimeout:a6];
  [v11 setNotificationMask:3];
  return v11;
}

@end