@interface TPSAnalyticsEventDaemonActive
+ (BOOL)supportsSecureCoding;
+ (id)eventWithReason:(id)a3 alreadyRunning:(BOOL)a4;
- (NSString)reason;
- (TPSAnalyticsEventDaemonActive)initWithCoder:(id)a3;
- (id)_initWithReason:(id)a3 alreadyRunning:(BOOL)a4;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation TPSAnalyticsEventDaemonActive

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_reason forKeyedSubscript:@"reason"];
  v4 = [NSNumber numberWithBool:self->_alreadyRunning];
  [v3 setObject:v4 forKeyedSubscript:@"already_running"];

  return v3;
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"daemon_active"];
}

- (void).cxx_destruct
{
}

+ (id)eventWithReason:(id)a3 alreadyRunning:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithReason:v6 alreadyRunning:v4];

  return v7;
}

- (id)_initWithReason:(id)a3 alreadyRunning:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSAnalyticsEventDaemonActive;
  v8 = [(TPSAnalyticsEvent *)&v11 initWithDate:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_reason, a3);
    v9->_alreadyRunning = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventDaemonActive)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAnalyticsEventDaemonActive;
  v5 = [(TPSAnalyticsEvent *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    v5->_alreadyRunning = [v4 decodeBoolForKey:@"already_running"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventDaemonActive;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_reason, @"reason", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_alreadyRunning forKey:@"already_running"];
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

@end