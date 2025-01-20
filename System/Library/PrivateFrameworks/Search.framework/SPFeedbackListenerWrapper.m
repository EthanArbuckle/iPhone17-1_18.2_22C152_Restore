@interface SPFeedbackListenerWrapper
+ (id)wrapperWithFeedbackListener:(id)a3;
+ (void)initialize;
- (BOOL)supportsFeedbackType:(int64_t)a3;
- (SFFeedbackListener)feedbackListener;
- (SPFeedbackListenerWrapper)initWithFeedbackListener:(id)a3;
- (unint64_t)supportedTypes;
- (void)setFeedbackListener:(id)a3;
- (void)setSupportedTypes:(unint64_t)a3;
@end

@implementation SPFeedbackListenerWrapper

+ (void)initialize
{
  if (qword_1000A90F8 != -1) {
    dispatch_once(&qword_1000A90F8, &stru_100093BA8);
  }
}

- (BOOL)supportsFeedbackType:(int64_t)a3
{
  return (self->_supportedTypes & (1 << a3)) != 0;
}

+ (id)wrapperWithFeedbackListener:(id)a3
{
  id v3 = a3;
  v4 = [[SPFeedbackListenerWrapper alloc] initWithFeedbackListener:v3];

  return v4;
}

- (SPFeedbackListenerWrapper)initWithFeedbackListener:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SPFeedbackListenerWrapper;
  v6 = [(SPFeedbackListenerWrapper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedbackListener, a3);
    for (uint64_t i = 1; i != 27; ++i)
    {
      if (qword_1000A9100[i] && (objc_opt_respondsToSelector() & 1) != 0) {
        v7->_supportedTypes |= (1 << i);
      }
    }
  }

  return v7;
}

- (SFFeedbackListener)feedbackListener
{
  return self->_feedbackListener;
}

- (void)setFeedbackListener:(id)a3
{
}

- (unint64_t)supportedTypes
{
  return self->_supportedTypes;
}

- (void)setSupportedTypes:(unint64_t)a3
{
  self->_supportedTypes = a3;
}

- (void).cxx_destruct
{
}

@end