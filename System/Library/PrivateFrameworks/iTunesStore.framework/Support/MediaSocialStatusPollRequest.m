@interface MediaSocialStatusPollRequest
- (BOOL)isEqual:(id)a3;
- (NSNumber)accountIdentifier;
- (NSString)activityIdentifier;
- (NSString)sourceApplicationIdentifier;
- (double)pollingDuration;
- (double)pollingInterval;
- (double)postCreateTime;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)postIdentifier;
- (unint64_t)hash;
- (void)setAccountIdentifier:(id)a3;
- (void)setActivityIdentifier:(id)a3;
- (void)setPollingDuration:(double)a3;
- (void)setPollingInterval:(double)a3;
- (void)setPostCreateTime:(double)a3;
- (void)setPostIdentifier:(int64_t)a3;
- (void)setSourceApplicationIdentifier:(id)a3;
@end

@implementation MediaSocialStatusPollRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setAccountIdentifier:self->_accountIdentifier];
  [v4 setActivityIdentifier:self->_activityIdentifier];
  [v4 setPollingDuration:self->_pollingDuration];
  [v4 setPollingInterval:self->_pollingInterval];
  [v4 setPostIdentifier:self->_postIdentifier];
  [v4 setSourceApplicationIdentifier:self->_sourceApplicationIdentifier];
  [v4 setPostCreateTime:self->_postCreateTime];
  return v4;
}

- (unint64_t)hash
{
  return [(NSString *)self->_activityIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = [(MediaSocialStatusPollRequest *)self activityIdentifier];
    v8 = [v4 activityIdentifier];
    unsigned __int8 v6 = [v7 isEqualToString:v8];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (double)pollingDuration
{
  return self->_pollingDuration;
}

- (void)setPollingDuration:(double)a3
{
  self->_pollingDuration = a3;
}

- (double)pollingInterval
{
  return self->_pollingInterval;
}

- (void)setPollingInterval:(double)a3
{
  self->_pollingInterval = a3;
}

- (int64_t)postIdentifier
{
  return self->_postIdentifier;
}

- (void)setPostIdentifier:(int64_t)a3
{
  self->_postIdentifier = a3;
}

- (NSString)sourceApplicationIdentifier
{
  return self->_sourceApplicationIdentifier;
}

- (void)setSourceApplicationIdentifier:(id)a3
{
}

- (double)postCreateTime
{
  return self->_postCreateTime;
}

- (void)setPostCreateTime:(double)a3
{
  self->_postCreateTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end