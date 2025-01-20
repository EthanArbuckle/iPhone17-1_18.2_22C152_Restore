@interface WLKFederatedPunchout
+ (BOOL)supportsSecureCoding;
- (BOOL)isConsented;
- (NSDate)punchoutTime;
- (NSString)appAdamID;
- (NSString)bundleID;
- (NSString)canonicalID;
- (NSString)channelID;
- (NSString)externalContentID;
- (NSURL)url;
- (WLKFederatedPunchout)initWithCoder:(id)a3;
- (unint64_t)resumeTimeSeconds;
- (void)encodeWithCoder:(id)a3;
- (void)setAppAdamID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCanonicalID:(id)a3;
- (void)setChannelID:(id)a3;
- (void)setConsented:(BOOL)a3;
- (void)setExternalContentID:(id)a3;
- (void)setPunchoutTime:(id)a3;
- (void)setResumeTimeSeconds:(unint64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation WLKFederatedPunchout

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  v5 = [(WLKFederatedPunchout *)self channelID];
  [v4 encodeObject:v5 forKey:@"WLKFederatedPunchout.channelID"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[WLKFederatedPunchout isConsented](self, "isConsented"));
  [v4 encodeObject:v6 forKey:@"WLKFederatedPunchout.consented"];

  v7 = [(WLKFederatedPunchout *)self bundleID];
  [v4 encodeObject:v7 forKey:@"WLKFederatedPunchout.bundleID"];

  v8 = [(WLKFederatedPunchout *)self appAdamID];
  [v4 encodeObject:v8 forKey:@"WLKFederatedPunchout.appAdamID"];

  v9 = [(WLKFederatedPunchout *)self url];
  [v4 encodeObject:v9 forKey:@"WLKFederatedPunchout.url"];

  v10 = [(WLKFederatedPunchout *)self externalContentID];
  [v4 encodeObject:v10 forKey:@"WLKFederatedPunchout.externalContentID"];

  v11 = [(WLKFederatedPunchout *)self canonicalID];
  [v4 encodeObject:v11 forKey:@"WLKFederatedPunchout.canonicalID"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WLKFederatedPunchout resumeTimeSeconds](self, "resumeTimeSeconds"));
  [v4 encodeObject:v12 forKey:@"WLKFederatedPunchout.resumeTimeSeconds"];

  id v13 = [(WLKFederatedPunchout *)self punchoutTime];
  [v4 encodeObject:v13 forKey:@"WLKFederatedPunchout.punchoutTime"];
}

- (WLKFederatedPunchout)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  v23.receiver = self;
  v23.super_class = (Class)WLKFederatedPunchout;
  v5 = [(WLKFederatedPunchout *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKFederatedPunchout.channelID"];
    channelID = v5->_channelID;
    v5->_channelID = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKFederatedPunchout.consented"];
    v5->_consented = [v8 BOOLValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKFederatedPunchout.bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKFederatedPunchout.appAdamID"];
    appAdamID = v5->_appAdamID;
    v5->_appAdamID = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKFederatedPunchout.url"];
    url = v5->_url;
    v5->_url = (NSURL *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKFederatedPunchout.externalContentID"];
    externalContentID = v5->_externalContentID;
    v5->_externalContentID = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKFederatedPunchout.canonicalID"];
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKFederatedPunchout.resumeTimeSeconds"];
    v5->_resumeTimeSeconds = [v19 unsignedIntegerValue];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKFederatedPunchout.punchoutTime"];
    punchoutTime = v5->_punchoutTime;
    v5->_punchoutTime = (NSDate *)v20;
  }
  return v5;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
}

- (BOOL)isConsented
{
  return self->_consented;
}

- (void)setConsented:(BOOL)a3
{
  self->_consented = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)appAdamID
{
  return self->_appAdamID;
}

- (void)setAppAdamID:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)externalContentID
{
  return self->_externalContentID;
}

- (void)setExternalContentID:(id)a3
{
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
}

- (unint64_t)resumeTimeSeconds
{
  return self->_resumeTimeSeconds;
}

- (void)setResumeTimeSeconds:(unint64_t)a3
{
  self->_resumeTimeSeconds = a3;
}

- (NSDate)punchoutTime
{
  return self->_punchoutTime;
}

- (void)setPunchoutTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchoutTime, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_externalContentID, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_channelID, 0);
}

@end