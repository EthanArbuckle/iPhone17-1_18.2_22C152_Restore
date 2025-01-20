@interface SiriTVLongPressButtonContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isListening;
- (BOOL)isPTTEligible;
- (BOOL)isSourcePTTEligible;
- (NSString)activeDeviceBluetoothIdentifier;
- (SiriTVLongPressButtonContext)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)remoteType;
- (void)encodeWithCoder:(id)a3;
- (void)isPTTEligible;
- (void)setActiveDeviceBluetoothIdentifier:(id)a3;
- (void)setIsListening:(BOOL)a3;
- (void)setIsSourcePTTEligible:(BOOL)a3;
- (void)setRemoteType:(unint64_t)a3;
- (void)setSourcePTTEligibility:(BOOL)a3;
@end

@implementation SiriTVLongPressButtonContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriTVLongPressButtonContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriTVLongPressButtonContext;
  v5 = [(SiriLongPressButtonContext *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buttonDownTimestamp"];
    [v6 doubleValue];
    -[SiriLongPressButtonContext setButtonDownTimestamp:](v5, "setButtonDownTimestamp:");

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeDeviceBluetoothIdentifier"];
    uint64_t v8 = [(__CFString *)v7 length];
    v9 = &stru_1F336E7E8;
    if (v8) {
      v9 = v7;
    }
    v10 = v9;

    [(SiriTVLongPressButtonContext *)v5 setActiveDeviceBluetoothIdentifier:v10];
    -[SiriTVLongPressButtonContext setRemoteType:](v5, "setRemoteType:", [v4 decodeIntegerForKey:@"remoteType"]);
    -[SiriTVLongPressButtonContext setIsListening:](v5, "setIsListening:", [v4 decodeBoolForKey:@"isListening"]);
    -[SiriTVLongPressButtonContext setIsSourcePTTEligible:](v5, "setIsSourcePTTEligible:", [v4 decodeBoolForKey:@"isSourcePTTEligible"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SiriTVLongPressButtonContext;
  id v4 = a3;
  [(SiriLongPressButtonContext *)&v8 encodeWithCoder:v4];
  v5 = (void *)MEMORY[0x1E4F28ED0];
  [(SiriLongPressButtonContext *)self buttonDownTimestamp];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 encodeObject:v6 forKey:@"buttonDownTimestamp"];

  v7 = [(SiriTVLongPressButtonContext *)self activeDeviceBluetoothIdentifier];
  [v4 encodeObject:v7 forKey:@"activeDeviceBluetoothIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SiriTVLongPressButtonContext remoteType](self, "remoteType"), @"remoteType");
  objc_msgSend(v4, "encodeBool:forKey:", -[SiriTVLongPressButtonContext isListening](self, "isListening"), @"isListening");
  objc_msgSend(v4, "encodeBool:forKey:", -[SiriTVLongPressButtonContext isSourcePTTEligible](self, "isSourcePTTEligible"), @"isSourcePTTEligible");
}

- (void)setSourcePTTEligibility:(BOOL)a3
{
  self->_isSourcePTTEligible = a3;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SiriContext *)self contextOverride];
  v5 = (void *)MEMORY[0x1E4F28ED0];
  [(SiriLongPressButtonContext *)self buttonDownTimestamp];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = [(SiriTVLongPressButtonContext *)self activeDeviceBluetoothIdentifier];
  unint64_t v8 = [(SiriTVLongPressButtonContext *)self remoteType] - 1;
  if (v8 > 5) {
    v9 = @"SiriTVRemoteTypeUnknown";
  }
  else {
    v9 = off_1E6B68588[v8];
  }
  v10 = [v3 stringWithFormat:@"<SiriTVLongPressButtonContext contextOverride:%@ buttonDownTimestamp:%@,activeDeviceBluetoothIdentifier:%@,remoteType:%@,isListening:%d,isSourcePTTEligible:%d>", v4, v6, v7, v9, -[SiriTVLongPressButtonContext isListening](self, "isListening"), -[SiriTVLongPressButtonContext isSourcePTTEligible](self, "isSourcePTTEligible")];

  return v10;
}

- (BOOL)isPTTEligible
{
  int v3 = [MEMORY[0x1E4F4E488] isTVPushToTalkEnabled];
  if (v3)
  {
    int v3 = _os_feature_enabled_impl();
    if (v3)
    {
      if (MGGetBoolAnswer()
        && (id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.siri.internal"], v5 = objc_msgSend(v4, "BOOLForKey:", @"ForcePTTEligibility"), v4, v5))
      {
        v6 = *MEMORY[0x1E4F4E360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEBUG)) {
          [(SiriTVLongPressButtonContext *)(uint64_t)self isPTTEligible];
        }
        LOBYTE(v3) = 1;
      }
      else
      {
        v7 = (void *)*MEMORY[0x1E4F4E360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEBUG)) {
          [(SiriTVLongPressButtonContext *)v7 isPTTEligible];
        }
        unint64_t v8 = [(SiriTVLongPressButtonContext *)self remoteType];
        LOBYTE(v3) = self->_isSourcePTTEligible || v8 == 6;
      }
    }
  }
  return v3;
}

- (NSString)activeDeviceBluetoothIdentifier
{
  return self->_activeDeviceBluetoothIdentifier;
}

- (void)setActiveDeviceBluetoothIdentifier:(id)a3
{
}

- (unint64_t)remoteType
{
  return self->_remoteType;
}

- (void)setRemoteType:(unint64_t)a3
{
  self->_remoteType = a3;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (BOOL)isSourcePTTEligible
{
  return self->_isSourcePTTEligible;
}

- (void)setIsSourcePTTEligible:(BOOL)a3
{
  self->_isSourcePTTEligible = a3;
}

- (void).cxx_destruct
{
}

- (void)isPTTEligible
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  uint64_t v4 = [a2 remoteType];
  if ((unint64_t)(v4 - 1) > 5) {
    int v5 = @"SiriTVRemoteTypeUnknown";
  }
  else {
    int v5 = off_1E6B68588[v4 - 1];
  }
  int v6 = 136315394;
  v7 = "-[SiriTVLongPressButtonContext isPTTEligible]";
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEBUG, "%s #ptt Remote Type is %@", (uint8_t *)&v6, 0x16u);
}

@end