@interface VSVoiceSubscription
+ (BOOL)supportsSecureCoding;
- (NSString)accessoryID;
- (NSString)clientID;
- (VSVoiceAsset)voice;
- (VSVoiceSubscription)initWithClient:(id)a3 accessory:(id)a4 voice:(id)a5;
- (VSVoiceSubscription)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setClientID:(id)a3;
- (void)setVoice:(id)a3;
@end

@implementation VSVoiceSubscription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

- (void)setVoice:(id)a3
{
}

- (VSVoiceAsset)voice
{
  return self->_voice;
}

- (void)setAccessoryID:(id)a3
{
}

- (NSString)accessoryID
{
  return self->_accessoryID;
}

- (void)setClientID:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (VSVoiceSubscription)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSVoiceSubscription;
  v5 = [(VSVoiceSubscription *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accessoryID"];
    accessoryID = v5->_accessoryID;
    v5->_accessoryID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_voice"];
    voice = v5->_voice;
    v5->_voice = (VSVoiceAsset *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  clientID = self->_clientID;
  id v5 = a3;
  [v5 encodeObject:clientID forKey:@"_clientID"];
  [v5 encodeObject:self->_accessoryID forKey:@"_accessoryID"];
  [v5 encodeObject:self->_voice forKey:@"_voice"];
}

- (VSVoiceSubscription)initWithClient:(id)a3 accessory:(id)a4 voice:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VSVoiceSubscription;
  v12 = [(VSVoiceSubscription *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientID, a3);
    objc_storeStrong((id *)&v13->_accessoryID, a4);
    objc_storeStrong((id *)&v13->_voice, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end