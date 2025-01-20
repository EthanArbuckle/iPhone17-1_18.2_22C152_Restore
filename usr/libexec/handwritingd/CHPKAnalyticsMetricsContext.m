@interface CHPKAnalyticsMetricsContext
+ (BOOL)supportsSecureCoding;
- (BOOL)fingerDrawingEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)liveTextSupportedByPrimaryLanguage;
- (BOOL)liveTextToggleEnabled;
- (BOOL)scribbleEnabled;
- (CHPKAnalyticsMetricsContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFingerDrawingEnabled:(BOOL)a3;
- (void)setLiveTextSupportedByPrimaryLanguage:(BOOL)a3;
- (void)setLiveTextToggleEnabled:(BOOL)a3;
- (void)setScribbleEnabled:(BOOL)a3;
@end

@implementation CHPKAnalyticsMetricsContext

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHPKAnalyticsMetricsContext;
  id v4 = a3;
  [(CHPKAnalyticsMetricsContext *)&v5 encodeWithCoder:v4];
  [v4 encodeBool:-[CHPKAnalyticsMetricsContext fingerDrawingEnabled](self, "fingerDrawingEnabled", v5.receiver, v5.super_class) forKey:@"UIPencilOnlyDrawWithPencilKey"];
  [v4 encodeBool:-[CHPKAnalyticsMetricsContext scribbleEnabled](self, "scribbleEnabled") forKey:@"ApplePencilTextInputEnabled"];
  [v4 encodeBool:-[CHPKAnalyticsMetricsContext liveTextToggleEnabled](self, "liveTextToggleEnabled") forKey:@"LiveTextEnabledKey"];
  [v4 encodeBool:-[CHPKAnalyticsMetricsContext liveTextSupportedByPrimaryLanguage](self, "liveTextSupportedByPrimaryLanguage") forKey:@"LiveTextSupportedByPrimaryLanguageKey"];
}

- (CHPKAnalyticsMetricsContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CHPKAnalyticsMetricsContext;
  objc_super v5 = [(CHPKAnalyticsMetricsContext *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_fingerDrawingEnabled = [v4 decodeBoolForKey:@"UIPencilOnlyDrawWithPencilKey"];
    v5->_scribbleEnabled = [v4 decodeBoolForKey:@"ApplePencilTextInputEnabled"];
    v5->_liveTextToggleEnabled = [v4 decodeBoolForKey:@"LiveTextEnabledKey"];
    v5->_liveTextSupportedByPrimaryLanguage = [v4 decodeBoolForKey:@"LiveTextSupportedByPrimaryLanguageKey"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  objc_super v5 = [(CHPKAnalyticsMetricsContext *)self inputLanguage];
  v6 = [(CHPKAnalyticsMetricsContext *)self inputRegion];
  objc_super v7 = [v4 initWithInputLanguage:v5 inputRegion:v6];

  v7[8] = self->_fingerDrawingEnabled;
  v7[9] = self->_scribbleEnabled;
  v7[10] = self->_liveTextToggleEnabled;
  v7[11] = self->_liveTextSupportedByPrimaryLanguage;
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CHPKAnalyticsMetricsContext *)a3;
  objc_super v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (v13.receiver = self,
             v13.super_class = (Class)CHPKAnalyticsMetricsContext,
             [(CHPKAnalyticsMetricsContext *)&v13 isEqual:v5]))
  {
    v6 = v5;
    unsigned int v7 = [(CHPKAnalyticsMetricsContext *)v6 fingerDrawingEnabled];
    if (v7 == [(CHPKAnalyticsMetricsContext *)self fingerDrawingEnabled]
      && (unsigned int v8 = [(CHPKAnalyticsMetricsContext *)v6 scribbleEnabled],
          v8 == [(CHPKAnalyticsMetricsContext *)self scribbleEnabled])
      && (unsigned int v9 = [(CHPKAnalyticsMetricsContext *)v6 liveTextToggleEnabled],
          v9 == [(CHPKAnalyticsMetricsContext *)self liveTextToggleEnabled]))
    {
      unsigned int v12 = [(CHPKAnalyticsMetricsContext *)v6 liveTextSupportedByPrimaryLanguage];
      unsigned int v10 = v12 ^ [(CHPKAnalyticsMetricsContext *)self liveTextSupportedByPrimaryLanguage] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)fingerDrawingEnabled
{
  return self->_fingerDrawingEnabled;
}

- (void)setFingerDrawingEnabled:(BOOL)a3
{
  self->_fingerDrawingEnabled = a3;
}

- (BOOL)scribbleEnabled
{
  return self->_scribbleEnabled;
}

- (void)setScribbleEnabled:(BOOL)a3
{
  self->_scribbleEnabled = a3;
}

- (BOOL)liveTextToggleEnabled
{
  return self->_liveTextToggleEnabled;
}

- (void)setLiveTextToggleEnabled:(BOOL)a3
{
  self->_liveTextToggleEnabled = a3;
}

- (BOOL)liveTextSupportedByPrimaryLanguage
{
  return self->_liveTextSupportedByPrimaryLanguage;
}

- (void)setLiveTextSupportedByPrimaryLanguage:(BOOL)a3
{
  self->_liveTextSupportedByPrimaryLanguage = a3;
}

@end