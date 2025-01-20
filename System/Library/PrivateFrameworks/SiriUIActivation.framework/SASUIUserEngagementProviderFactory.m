@interface SASUIUserEngagementProviderFactory
+ (id)_attentionAwarenessConfigurationWithIdentifier:(id)a3 eventMask:(unint64_t)a4 samplingInterval:(double)a5 attentionLossTimeout:(double)a6;
- (SASUIUserEngagementProviderFactory)initWithSamplingInterval:(double)a3 attentionLostTimeout:(double)a4;
- (id)buttonPressAwarenessClient;
- (id)touchAttentionAwarenessClient;
- (unint64_t)_buttonPressAwarenessClientEventMask;
- (unint64_t)_touchAttentionAwarenessEventMask;
- (unint64_t)supportedEvents;
@end

@implementation SASUIUserEngagementProviderFactory

- (SASUIUserEngagementProviderFactory)initWithSamplingInterval:(double)a3 attentionLostTimeout:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SASUIUserEngagementProviderFactory;
  v6 = [(SASUIUserEngagementProviderFactory *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_samplingInterval = a3;
    v6->_attentionLossTimeout = a4;
    v6->_supportedAttentionAwarenessEvents = [(SASUIUserEngagementProviderFactory *)v6 supportedEvents];
  }
  return v7;
}

- (id)touchAttentionAwarenessClient
{
  id v3 = objc_alloc_init(MEMORY[0x263F28868]);
  v4 = objc_msgSend((id)objc_opt_class(), "_attentionAwarenessConfigurationWithIdentifier:eventMask:samplingInterval:attentionLossTimeout:", @"com.apple.siri.AttentionAwareness.Touch", -[SASUIUserEngagementProviderFactory _touchAttentionAwarenessEventMask](self, "_touchAttentionAwarenessEventMask"), 0.1, 0.1);
  [v3 setConfiguration:v4 shouldReset:1];

  return v3;
}

- (id)buttonPressAwarenessClient
{
  id v3 = objc_alloc_init(MEMORY[0x263F28868]);
  v4 = objc_msgSend((id)objc_opt_class(), "_attentionAwarenessConfigurationWithIdentifier:eventMask:samplingInterval:attentionLossTimeout:", @"com.apple.siri.AttentionAwareness.ButtonPress", -[SASUIUserEngagementProviderFactory _buttonPressAwarenessClientEventMask](self, "_buttonPressAwarenessClientEventMask"), 0.1, 0.1);
  [v3 setConfiguration:v4 shouldReset:1];

  return v3;
}

- (unint64_t)_touchAttentionAwarenessEventMask
{
  return self->_supportedAttentionAwarenessEvents & 0x209;
}

- (unint64_t)_buttonPressAwarenessClientEventMask
{
  return self->_supportedAttentionAwarenessEvents & 3;
}

- (unint64_t)supportedEvents
{
  return [MEMORY[0x263F28870] supportedEvents];
}

+ (id)_attentionAwarenessConfigurationWithIdentifier:(id)a3 eventMask:(unint64_t)a4 samplingInterval:(double)a5 attentionLossTimeout:(double)a6
{
  objc_super v9 = (objc_class *)MEMORY[0x263F28870];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  [v11 setIdentifier:v10];

  [v11 setEventMask:a4];
  [v11 setSamplingInterval:a5];
  [v11 setAttentionLostTimeout:a6];
  return v11;
}

@end