@interface MNNavigationServiceCallback_WillStartNavigation
+ (BOOL)supportsSecureCoding;
- (BOOL)isResumingMultiStopRoute;
- (MNActiveRouteInfo)routeInfo;
- (MNNavigationServiceCallback_WillStartNavigation)initWithCoder:(id)a3;
- (NSString)voiceLanguage;
- (int64_t)navigationType;
- (int64_t)simulationType;
- (unint64_t)initialRouteSource;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setInitialRouteSource:(unint64_t)a3;
- (void)setIsResumingMultiStopRoute:(BOOL)a3;
- (void)setNavigationType:(int64_t)a3;
- (void)setRouteInfo:(id)a3;
- (void)setSimulationType:(int64_t)a3;
- (void)setVoiceLanguage:(id)a3;
@end

@implementation MNNavigationServiceCallback_WillStartNavigation

- (unint64_t)type
{
  return 15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t navigationType = self->_navigationType;
  id v5 = a3;
  [v5 encodeInteger:navigationType forKey:@"_navigationType"];
  [v5 encodeInteger:self->_simulationType forKey:@"_simulationType"];
  [v5 encodeObject:self->_routeInfo forKey:@"_routeInfo"];
  [v5 encodeInteger:self->_initialRouteSource forKey:@"_initialRouteSource"];
  [v5 encodeObject:self->_voiceLanguage forKey:@"_voiceLanguage"];
  [v5 encodeBool:self->_isResumingMultiStopRoute forKey:@"_isResumingMultiStopRoute"];
}

- (MNNavigationServiceCallback_WillStartNavigation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNNavigationServiceCallback_WillStartNavigation;
  id v5 = [(MNNavigationServiceCallbackParameters *)&v12 initWithCoder:v4];
  if (v5)
  {
    v5->_int64_t navigationType = [v4 decodeIntegerForKey:@"_navigationType"];
    v5->_simulationType = [v4 decodeIntegerForKey:@"_simulationType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeInfo"];
    routeInfo = v5->_routeInfo;
    v5->_routeInfo = (MNActiveRouteInfo *)v6;

    v5->_initialRouteSource = [v4 decodeIntegerForKey:@"_initialRouteSource"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_voiceLanguage"];
    voiceLanguage = v5->_voiceLanguage;
    v5->_voiceLanguage = (NSString *)v8;

    v5->_isResumingMultiStopRoute = [v4 decodeBoolForKey:@"_isResumingMultiStopRoute"];
    v10 = v5;
  }

  return v5;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (void)setNavigationType:(int64_t)a3
{
  self->_int64_t navigationType = a3;
}

- (int64_t)simulationType
{
  return self->_simulationType;
}

- (void)setSimulationType:(int64_t)a3
{
  self->_simulationType = a3;
}

- (MNActiveRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (void)setRouteInfo:(id)a3
{
}

- (unint64_t)initialRouteSource
{
  return self->_initialRouteSource;
}

- (void)setInitialRouteSource:(unint64_t)a3
{
  self->_initialRouteSource = a3;
}

- (NSString)voiceLanguage
{
  return self->_voiceLanguage;
}

- (void)setVoiceLanguage:(id)a3
{
}

- (BOOL)isResumingMultiStopRoute
{
  return self->_isResumingMultiStopRoute;
}

- (void)setIsResumingMultiStopRoute:(BOOL)a3
{
  self->_isResumingMultiStopRoute = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceLanguage, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
}

@end