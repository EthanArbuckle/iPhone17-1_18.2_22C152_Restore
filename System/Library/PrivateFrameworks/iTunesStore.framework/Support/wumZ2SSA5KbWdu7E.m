@interface wumZ2SSA5KbWdu7E
- (NSData)challengeResponse;
- (NSData)hostChallenge;
- (NSSet)identities;
- (NSString)FPANSuffix;
- (NSString)callerID;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)seid;
- (NSString)serverEndpointIdentifier;
- (unint64_t)eventFrequency;
- (unint64_t)passwordSetting;
- (void)setCallerID:(id)a3;
- (void)setChallengeResponse:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setEventFrequency:(unint64_t)a3;
- (void)setFPANSuffix:(id)a3;
- (void)setHostChallenge:(id)a3;
- (void)setIdentities:(id)a3;
- (void)setPasswordSetting:(unint64_t)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setSeid:(id)a3;
- (void)setServerEndpointIdentifier:(id)a3;
- (wumZ2SSA5KbWdu7E)initWithServerEndpointIdentifier:(id)a3;
@end

@implementation wumZ2SSA5KbWdu7E

- (wumZ2SSA5KbWdu7E)initWithServerEndpointIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)wumZ2SSA5KbWdu7E;
  v6 = [(wumZ2SSA5KbWdu7E *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serverEndpointIdentifier, a3);
  }

  return v7;
}

- (NSString)serverEndpointIdentifier
{
  return self->_serverEndpointIdentifier;
}

- (void)setServerEndpointIdentifier:(id)a3
{
}

- (NSData)hostChallenge
{
  return self->_hostChallenge;
}

- (void)setHostChallenge:(id)a3
{
}

- (NSData)challengeResponse
{
  return self->_challengeResponse;
}

- (void)setChallengeResponse:(id)a3
{
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
}

- (NSSet)identities
{
  return self->_identities;
}

- (void)setIdentities:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)FPANSuffix
{
  return self->_FPANSuffix;
}

- (void)setFPANSuffix:(id)a3
{
}

- (NSString)callerID
{
  return self->_callerID;
}

- (void)setCallerID:(id)a3
{
}

- (unint64_t)passwordSetting
{
  return self->_passwordSetting;
}

- (void)setPasswordSetting:(unint64_t)a3
{
  self->_passwordSetting = a3;
}

- (unint64_t)eventFrequency
{
  return self->_eventFrequency;
}

- (void)setEventFrequency:(unint64_t)a3
{
  self->_eventFrequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerID, 0);
  objc_storeStrong((id *)&self->_FPANSuffix, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_challengeResponse, 0);
  objc_storeStrong((id *)&self->_hostChallenge, 0);

  objc_storeStrong((id *)&self->_serverEndpointIdentifier, 0);
}

@end