@interface SOSVoiceUtteranceVariants
+ (id)utteranceVariantsWithLocalUtterances:(id)a3 remoteUtterances:(id)a4;
- (BOOL)hasUtterances;
- (NSArray)localUtterances;
- (NSArray)remoteUtterances;
- (id)description;
- (void)setLocalUtterances:(id)a3;
- (void)setRemoteUtterances:(id)a3;
@end

@implementation SOSVoiceUtteranceVariants

- (BOOL)hasUtterances
{
  v3 = [(SOSVoiceUtteranceVariants *)self localUtterances];
  uint64_t v4 = [v3 count];
  v5 = [(SOSVoiceUtteranceVariants *)self remoteUtterances];
  LOBYTE(v4) = v4 + [v5 count] != 0;

  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(SOSVoiceUtteranceVariants *)self localUtterances];
  v6 = [(SOSVoiceUtteranceVariants *)self remoteUtterances];
  v7 = [v3 stringWithFormat:@"<%@ %p localUtterances=%@ remoteUtterances=%@", v4, self, v5, v6];

  return v7;
}

+ (id)utteranceVariantsWithLocalUtterances:(id)a3 remoteUtterances:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setLocalUtterances:v6];

  [v7 setRemoteUtterances:v5];

  return v7;
}

- (NSArray)localUtterances
{
  return self->_localUtterances;
}

- (void)setLocalUtterances:(id)a3
{
}

- (NSArray)remoteUtterances
{
  return self->_remoteUtterances;
}

- (void)setRemoteUtterances:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUtterances, 0);

  objc_storeStrong((id *)&self->_localUtterances, 0);
}

@end