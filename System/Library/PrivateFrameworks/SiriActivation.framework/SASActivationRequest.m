@interface SASActivationRequest
+ (int64_t)requestSourceForButtonIdentifier:(int64_t)a3;
- (BOOL)isBluetoothRequest;
- (BOOL)isButtonRequest;
- (BOOL)isContinuityRequest;
- (BOOL)isContinuousConversationRequest;
- (BOOL)isDeviceButtonRequest;
- (BOOL)isDirectActionRequest;
- (BOOL)isEyesFreeRequestSource;
- (BOOL)isHoldToTalkSource;
- (BOOL)isQuickTypeGestureEnabled;
- (BOOL)isRemoteDisplayVoiceRequest;
- (BOOL)isRemotePresentationBringUpRequest;
- (BOOL)isSpotlightRequest;
- (BOOL)isTestingRequest;
- (BOOL)isUIFreeRequestSource;
- (BOOL)isVocalShortcutRequest;
- (BOOL)isVoiceRequest;
- (SASActivationRequest)init;
- (SASActivationRequest)initWithBluetoothKeyboardShortcutActivation:(int64_t)a3;
- (SASActivationRequest)initWithBreadcrumbRequest;
- (SASActivationRequest)initWithButtonIdentifier:(int64_t)a3 context:(id)a4;
- (SASActivationRequest)initWithContinuityContext:(id)a3;
- (SASActivationRequest)initWithContinuousConversationContext:(id)a3;
- (SASActivationRequest)initWithContinuousConversationHearstContext:(id)a3;
- (SASActivationRequest)initWithContinuousConversationJarvisContext:(id)a3;
- (SASActivationRequest)initWithDirectActionContext:(id)a3;
- (SASActivationRequest)initWithRemotePresentationBringUpContext:(id)a3;
- (SASActivationRequest)initWithSimpleActivation:(int64_t)a3;
- (SASActivationRequest)initWithSpotlightContext:(id)a3;
- (SASActivationRequest)initWithTestingContext:(id)a3;
- (SASActivationRequest)initWithTostadaContext:(id)a3;
- (SASActivationRequest)initWithVocalShortcutContext:(id)a3;
- (SASActivationRequest)initWithVoiceTriggerContext:(id)a3;
- (SASActivationRequest)initWithVoiceTriggerRequest;
- (SiriContext)context;
- (double)activationTime;
- (double)buttonDownTime;
- (double)buttonDownTimestamp;
- (double)computedActivationTime;
- (id)description;
- (id)eventSource;
- (int64_t)activationEvent;
- (int64_t)activationType;
- (int64_t)longPressBehavior;
- (int64_t)requestSource;
- (void)computedActivationTime;
- (void)setActivationEvent:(int64_t)a3;
- (void)setActivationTime:(double)a3;
- (void)setActivationType:(int64_t)a3;
- (void)setButtonDownTime:(double)a3;
- (void)setContext:(id)a3;
- (void)setRequestSource:(int64_t)a3;
@end

@implementation SASActivationRequest

- (void).cxx_destruct
{
}

- (SASActivationRequest)initWithDirectActionContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SASActivationRequest;
  v5 = [(SASActivationRequest *)&v11 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    [(SASActivationRequest *)v5 setActivationType:2];
    [(SASActivationRequest *)v5 setActivationEvent:2];
    v7 = [v4 bulletin];
    if (v7)
    {

      uint64_t v8 = 13;
    }
    else
    {
      v9 = [v4 notification];

      if (v9) {
        uint64_t v8 = 13;
      }
      else {
        uint64_t v8 = 14;
      }
    }
    [(SASActivationRequest *)v5 setRequestSource:v8];
    [(SASActivationRequest *)v5 setContext:v4];
  }

  return v5;
}

- (void)setRequestSource:(int64_t)a3
{
  self->_requestSource = a3;
}

- (void)setContext:(id)a3
{
}

- (void)setActivationType:(int64_t)a3
{
  self->_activationType = a3;
}

- (void)setActivationTime:(double)a3
{
  self->_activationTime = a3;
}

- (void)setActivationEvent:(int64_t)a3
{
  self->_activationEvent = a3;
}

- (int64_t)requestSource
{
  return self->_requestSource;
}

- (SASActivationRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)SASActivationRequest;
  v2 = [(SASActivationRequest *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    [v3 systemUptime];
    -[SASActivationRequest setActivationTime:](v2, "setActivationTime:");
  }
  return v2;
}

- (SASActivationRequest)initWithButtonIdentifier:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(SASButtonActvationRequest);

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 buttonDownTimestamp];
      -[SASActivationRequest setButtonDownTime:](v7, "setButtonDownTime:");
    }
    uint64_t v8 = [MEMORY[0x1E4F28F80] processInfo];
    [v8 systemUptime];
    -[SASActivationRequest setActivationTime:](v7, "setActivationTime:");

    [(SASActivationRequest *)v7 setActivationType:0];
    [(SASButtonActvationRequest *)v7 setButtonIdentifier:a3];
    [(SASActivationRequest *)v7 setRequestSource:+[SASActivationRequest requestSourceForButtonIdentifier:a3]];
    [(SASActivationRequest *)v7 setContext:v6];
  }

  return &v7->super;
}

- (SASActivationRequest)initWithContinuityContext:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SASActivationRequest;
  objc_super v5 = [(SASActivationRequest *)&v22 init];
  id v6 = v5;
  if (v5)
  {
    [(SASActivationRequest *)v5 setActivationType:3];
    [(SASActivationRequest *)v6 setContext:v4];
    v7 = [v4 requestInfo];
    uint64_t v8 = [v7 speechRequestOptions];
    uint64_t v9 = [v8 activationEvent];

    v10 = [v4 requestInfo];
    objc_super v11 = [v10 speechRequestOptions];
    v12 = v11;
    if (v9 == 17)
    {
      [v11 activationEventTime];
      -[SASActivationRequest setActivationTime:](v6, "setActivationTime:");

      [(SASActivationRequest *)v6 setRequestSource:26];
      [(SASActivationRequest *)v6 setActivationEvent:3];
    }
    else
    {
      uint64_t v13 = [v11 activationEvent];

      v14 = [v4 requestInfo];
      v15 = [v14 speechRequestOptions];
      v16 = v15;
      if (v13 == 16)
      {
        [v15 activationEventTime];
        -[SASActivationRequest setActivationTime:](v6, "setActivationTime:");

        v17 = v6;
        uint64_t v18 = 44;
      }
      else
      {
        uint64_t v19 = [v15 activationEvent];

        v20 = [MEMORY[0x1E4F28F80] processInfo];
        [v20 systemUptime];
        -[SASActivationRequest setActivationTime:](v6, "setActivationTime:");

        v17 = v6;
        if (v19 == 5) {
          uint64_t v18 = 9;
        }
        else {
          uint64_t v18 = 18;
        }
      }
      [(SASActivationRequest *)v17 setRequestSource:v18];
    }
  }

  return v6;
}

- (SASActivationRequest)initWithVoiceTriggerContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  objc_super v5 = [(SASActivationRequest *)&v8 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    [(SASActivationRequest *)v5 setActivationType:1];
    [(SASActivationRequest *)v5 setRequestSource:8];
    [(SASActivationRequest *)v5 setContext:v4];
  }

  return v5;
}

- (SASActivationRequest)initWithContinuousConversationContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  objc_super v5 = [(SASActivationRequest *)&v8 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    [(SASActivationRequest *)v5 setActivationType:9];
    [(SASActivationRequest *)v5 setRequestSource:38];
    [(SASActivationRequest *)v5 setContext:v4];
  }

  return v5;
}

- (SASActivationRequest)initWithContinuousConversationHearstContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  objc_super v5 = [(SASActivationRequest *)&v8 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    [(SASActivationRequest *)v5 setActivationType:9];
    [(SASActivationRequest *)v5 setRequestSource:45];
    [(SASActivationRequest *)v5 setContext:v4];
  }

  return v5;
}

- (SASActivationRequest)initWithContinuousConversationJarvisContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  objc_super v5 = [(SASActivationRequest *)&v8 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    [(SASActivationRequest *)v5 setActivationType:9];
    [(SASActivationRequest *)v5 setRequestSource:46];
    [(SASActivationRequest *)v5 setContext:v4];
  }

  return v5;
}

- (SASActivationRequest)initWithRemotePresentationBringUpContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  objc_super v5 = [(SASActivationRequest *)&v8 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    [(SASActivationRequest *)v5 setActivationType:10];
    [(SASActivationRequest *)v5 setRequestSource:39];
    [(SASActivationRequest *)v5 setContext:v4];
  }

  return v5;
}

- (SASActivationRequest)initWithBreadcrumbRequest
{
  v5.receiver = self;
  v5.super_class = (Class)SASActivationRequest;
  v2 = [(SASActivationRequest *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    [v3 systemUptime];
    -[SASActivationRequest setActivationTime:](v2, "setActivationTime:");

    [(SASActivationRequest *)v2 setActivationType:4];
    [(SASActivationRequest *)v2 setRequestSource:20];
  }
  return v2;
}

- (SASActivationRequest)initWithSimpleActivation:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SASActivationRequest;
  id v4 = [(SASActivationRequest *)&v7 init];
  if (v4)
  {
    objc_super v5 = [MEMORY[0x1E4F28F80] processInfo];
    [v5 systemUptime];
    -[SASActivationRequest setActivationTime:](v4, "setActivationTime:");

    [(SASActivationRequest *)v4 setActivationType:5];
    [(SASActivationRequest *)v4 setRequestSource:a3];
  }
  return v4;
}

- (SASActivationRequest)initWithBluetoothKeyboardShortcutActivation:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SASActivationRequest;
  id v4 = [(SASActivationRequest *)&v7 init];
  if (v4)
  {
    objc_super v5 = [MEMORY[0x1E4F28F80] processInfo];
    [v5 systemUptime];
    -[SASActivationRequest setActivationTime:](v4, "setActivationTime:");

    [(SASActivationRequest *)v4 setActivationType:8];
    [(SASActivationRequest *)v4 setRequestSource:a3];
  }
  return v4;
}

- (SASActivationRequest)initWithSpotlightContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SASActivationRequest;
  objc_super v5 = [(SASActivationRequest *)&v10 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    [(SASActivationRequest *)v5 setActivationType:6];
    uint64_t v7 = [v4 source];
    if (v7)
    {
      if (v7 != 1)
      {
LABEL_7:
        [(SASActivationRequest *)v5 setContext:v4];
        goto LABEL_8;
      }
      uint64_t v8 = 25;
    }
    else
    {
      uint64_t v8 = 24;
    }
    [(SASActivationRequest *)v5 setRequestSource:v8];
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (SASActivationRequest)initWithVocalShortcutContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  objc_super v5 = [(SASActivationRequest *)&v8 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    [(SASActivationRequest *)v5 setActivationType:11];
    [(SASActivationRequest *)v5 setRequestSource:51];
    [(SASActivationRequest *)v5 setContext:v4];
  }

  return v5;
}

- (SASActivationRequest)initWithVoiceTriggerRequest
{
  v5.receiver = self;
  v5.super_class = (Class)SASActivationRequest;
  v2 = [(SASActivationRequest *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    [v3 systemUptime];
    -[SASActivationRequest setActivationTime:](v2, "setActivationTime:");

    [(SASActivationRequest *)v2 setActivationType:1];
    [(SASActivationRequest *)v2 setRequestSource:8];
  }
  return v2;
}

- (SASActivationRequest)initWithTestingContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  objc_super v5 = [(SASActivationRequest *)&v8 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    [(SASActivationRequest *)v5 setActivationType:7];
    [(SASActivationRequest *)v5 setRequestSource:15];
    [(SASActivationRequest *)v5 setContext:v4];
  }

  return v5;
}

- (SASActivationRequest)initWithTostadaContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  objc_super v5 = [(SASActivationRequest *)&v8 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    [(SASActivationRequest *)v5 setActivationType:12];
    [(SASActivationRequest *)v5 setRequestSource:53];
    [(SASActivationRequest *)v5 setContext:v4];
  }

  return v5;
}

- (id)eventSource
{
  SASRequestSourceGetName([(SASActivationRequest *)self requestSource]);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2) {
    v2 = &stru_1F336E7E8;
  }
  id v4 = v2;

  return v4;
}

- (id)description
{
  v3 = NSString;
  [(SASActivationRequest *)self activationEvent];
  id v4 = AFActivationEventGetDescription();
  objc_super v5 = [(SASActivationRequest *)self eventSource];
  id v6 = [(SASActivationRequest *)self context];
  uint64_t v7 = [v3 stringWithFormat:@"event = AFActivationEvent%@ source = %@; context: %@", v4, v5, v6];;

  return v7;
}

- (double)computedActivationTime
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (![(SASActivationRequest *)self isDeviceButtonRequest]
    || !AFDeviceSupportsZLL())
  {
LABEL_15:
    [(SASActivationRequest *)self activationTime];
    return v13;
  }
  self->_waketimeMIBSize = 48;
  p_waketimeMIBSize = &self->_waketimeMIBSize;
  int v4 = sysctlnametomib("kern.waketime", self->_waketimeMIB, &self->_waketimeMIBSize);
  objc_super v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  if (v4)
  {
    int v6 = v4;
    uint64_t v7 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      [(SASActivationRequest *)v7 computedActivationTime];
    }
    unint64_t *p_waketimeMIBSize = 0;
  }
  objc_super v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[SASActivationRequest computedActivationTime]";
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s Device wants Home Button ZLL, checking wake time", buf, 0xCu);
  }
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  size_t v31 = 16;
  if (*p_waketimeMIBSize) {
    int v9 = sysctl(self->_waketimeMIB, *p_waketimeMIBSize, &v32, &v31, 0, 0);
  }
  else {
    int v9 = sysctlbyname("kern.waketime", &v32, &v31, 0, 0);
  }
  int v10 = v9;
  [(SASActivationRequest *)self buttonDownTimestamp];
  if (v10)
  {
    os_log_t v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      [(SASActivationRequest *)v12 computedActivationTime];
    }
    goto LABEL_15;
  }
  double v14 = v11;
  double v16 = (double)v32 + (double)((int)v33 / 0xF4240uLL);
  v17 = [MEMORY[0x1E4F1C9C8] date];
  [v17 timeIntervalSince1970];
  double v19 = v18 - v16;

  v20 = [MEMORY[0x1E4F28F80] processInfo];
  [v20 systemUptime];
  double v22 = v21;

  v23 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[SASActivationRequest computedActivationTime]";
    __int16 v36 = 2048;
    double v37 = v19;
    _os_log_impl(&dword_1D9588000, v23, OS_LOG_TYPE_DEFAULT, "%s Wake time was %lf seconds ago", buf, 0x16u);
  }
  double v24 = v22 - v14;
  v25 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[SASActivationRequest computedActivationTime]";
    __int16 v36 = 2048;
    double v37 = v24;
    _os_log_impl(&dword_1D9588000, v25, OS_LOG_TYPE_DEFAULT, "%s Button down time was %lf seconds ago", buf, 0x16u);
  }
  double v26 = v19 - v24;
  v27 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[SASActivationRequest computedActivationTime]";
    __int16 v36 = 2048;
    double v37 = v26;
    _os_log_impl(&dword_1D9588000, v27, OS_LOG_TYPE_DEFAULT, "%s Wake -> Button down delta is %lf", buf, 0x16u);
  }
  v28 = *v5;
  BOOL v29 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
  if (v26 > 0.0 && v26 < 0.75)
  {
    if (v29)
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[SASActivationRequest computedActivationTime]";
      _os_log_impl(&dword_1D9588000, v28, OS_LOG_TYPE_DEFAULT, "%s Using Wake Time", buf, 0xCu);
    }
    return v14 - v26;
  }
  else if (v29)
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[SASActivationRequest computedActivationTime]";
    _os_log_impl(&dword_1D9588000, v28, OS_LOG_TYPE_DEFAULT, "%s Using Button Down Time", buf, 0xCu);
  }
  return v14;
}

- (double)buttonDownTimestamp
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(SASActivationRequest *)self context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v5 = 0.0;
  if (isKindOfClass)
  {
    int v6 = [(SASActivationRequest *)self context];
    [v6 buttonDownTimestamp];
    double v8 = v7;

    double v5 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(v8);
    if (v5 < 0.0)
    {
      int v9 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        double v14 = "-[SASActivationRequest buttonDownTimestamp]";
        _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s button down timestamp sent in format where absolute time conversion is invalid", (uint8_t *)&v13, 0xCu);
      }
      int v10 = [(SASActivationRequest *)self context];
      [v10 buttonDownTimestamp];
      double v5 = v11;
    }
  }
  return v5;
}

- (int64_t)longPressBehavior
{
  v3 = [(SASActivationRequest *)self context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return -1;
  }
  double v5 = [(SASActivationRequest *)self context];
  int64_t v6 = [v5 longPressBehavior];

  return v6;
}

- (BOOL)isVoiceRequest
{
  v3 = [(SASActivationRequest *)self context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(SASActivationRequest *)self context];
    int64_t v6 = [v5 requestInfo];
    double v7 = [v6 speechRequestOptions];

    if ([v7 isVoiceTrigger]) {
      BOOL v8 = [v7 activationEvent] == 8 || objc_msgSend(v7, "activationEvent") == 16;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  return [(SASActivationRequest *)self activationType] == 1 || v8;
}

- (BOOL)isRemoteDisplayVoiceRequest
{
  v2 = [(SASActivationRequest *)self context];
  v3 = [v2 speechRequestOptions];

  if (v3) {
    BOOL v4 = [v3 activationEvent] == 31;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isHoldToTalkSource
{
  return 0;
}

- (BOOL)isButtonRequest
{
  return 0;
}

- (BOOL)isDeviceButtonRequest
{
  return 0;
}

- (BOOL)isTestingRequest
{
  return [(SASActivationRequest *)self requestSource] == 15;
}

- (BOOL)isEyesFreeRequestSource
{
  v3 = [(SASActivationRequest *)self context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  double v5 = [(SASActivationRequest *)self context];
  char v6 = [v5 isEyesFree];

  return v6;
}

- (BOOL)isUIFreeRequestSource
{
  if ([(SASActivationRequest *)self activationType] != 3) {
    return 0;
  }
  BOOL v4 = [(SASActivationRequest *)self context];
  double v5 = [v4 requestInfo];
  unint64_t v6 = [v5 activationEvent];

  if (v6 <= 0xA && ((1 << v6) & 0x640) != 0)
  {
    BOOL v7 = 1;
  }
  else
  {
    double v5 = [v4 requestInfo];
    v2 = [v5 speechRequestOptions];
    BOOL v7 = [v2 activationEvent] == 17;
  }
  if (v6 > 0xA || ((1 << v6) & 0x640) == 0)
  {
  }
  return v7;
}

- (BOOL)isDirectActionRequest
{
  return [(SASActivationRequest *)self activationType] == 2;
}

- (BOOL)isContinuityRequest
{
  return [(SASActivationRequest *)self activationType] == 3;
}

- (BOOL)isContinuousConversationRequest
{
  return [(SASActivationRequest *)self activationType] == 9;
}

- (BOOL)isBluetoothRequest
{
  v2 = [(SASActivationRequest *)self context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isSpotlightRequest
{
  return [(SASActivationRequest *)self activationType] == 6;
}

- (BOOL)isRemotePresentationBringUpRequest
{
  return [(SASActivationRequest *)self activationType] == 10;
}

- (BOOL)isVocalShortcutRequest
{
  return [(SASActivationRequest *)self activationType] == 11;
}

- (BOOL)isQuickTypeGestureEnabled
{
  v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  char v3 = [v2 quickTypeGestureEnabled];

  return v3;
}

+ (int64_t)requestSourceForButtonIdentifier:(int64_t)a3
{
  int64_t result = a3;
  if (a3 > 99)
  {
    int64_t v4 = 15;
    uint64_t v5 = 22;
    if (a3 != 201) {
      uint64_t v5 = 0;
    }
    if (a3 != 200) {
      int64_t v4 = v5;
    }
    int64_t v6 = 1;
    uint64_t v7 = 10;
    if (a3 != 101) {
      uint64_t v7 = 0;
    }
    if (a3 != 100) {
      int64_t v6 = v7;
    }
    if (a3 <= 199) {
      return v6;
    }
    else {
      return v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
      case 2:
      case 4:
        return result;
      case 3:
        int64_t result = 5;
        break;
      case 5:
        int64_t result = 10;
        break;
      case 6:
        int64_t result = 43;
        break;
      case 7:
        int64_t result = 16;
        break;
      case 8:
        int64_t result = 36;
        break;
      case 9:
        int64_t result = 28;
        break;
      default:
        int64_t result = 0;
        break;
    }
  }
  return result;
}

- (int64_t)activationType
{
  return self->_activationType;
}

- (int64_t)activationEvent
{
  return self->_activationEvent;
}

- (SiriContext)context
{
  return self->_context;
}

- (double)activationTime
{
  return self->_activationTime;
}

- (double)buttonDownTime
{
  return self->_buttonDownTime;
}

- (void)setButtonDownTime:(double)a3
{
  self->_buttonDownTime = a3;
}

- (void)computedActivationTime
{
  id v3 = a1;
  strerror(a2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D9588000, v4, v5, "%s Failed getting waketime mib %{public}s", v6, v7, v8, v9, 2u);
}

@end