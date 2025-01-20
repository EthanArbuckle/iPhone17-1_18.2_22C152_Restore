@interface STGenericIntentRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)_launchToForeground;
- (BOOL)_makeAppFrontmost;
- (BOOL)isForegroundLaunch;
- (STGenericIntentRequest)initWithAppIdentifier:(id)a3 intentString:(id)a4 utterance:(id)a5 info:(id)a6;
- (STGenericIntentRequest)initWithCoder:(id)a3;
- (id)_af_analyticsContextDescription;
- (id)appIdentifier;
- (id)info;
- (id)intentString;
- (id)responseWithCode:(int64_t)a3;
- (id)utterance;
- (void)_setLaunchToForeground:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STGenericIntentRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_intentString, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

- (void)_setLaunchToForeground:(BOOL)a3
{
  self->__launchToForeground = a3;
}

- (BOOL)_launchToForeground
{
  return self->__launchToForeground;
}

- (STGenericIntentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STGenericIntentRequest;
  v5 = [(AFSiriRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_intentString"];
    intentString = v5->_intentString;
    v5->_intentString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_utterance"];
    utterance = v5->_utterance;
    v5->_utterance = (NSString *)v8;

    uint64_t v10 = [v4 decodePropertyListForKey:@"_info"];
    info = v5->_info;
    v5->_info = (NSDictionary *)v10;

    v5->__launchToForeground = [v4 decodeBoolForKey:@"__launchToForeground"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STGenericIntentRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentString, @"_intentString", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_utterance forKey:@"_utterance"];
  [v4 encodeObject:self->_info forKey:@"_info"];
  [v4 encodeBool:self->__launchToForeground forKey:@"__launchToForeground"];
}

- (BOOL)_makeAppFrontmost
{
  return self->__launchToForeground;
}

- (BOOL)isForegroundLaunch
{
  return self->__launchToForeground;
}

- (id)responseWithCode:(int64_t)a3
{
  if (a3)
  {
    id v4 = [(AFSiriResponse *)[STGenericIntentResponse alloc] _initWithRequest:self];
    [v4 setResponseCode:a3];
  }
  else
  {
    id v4 = (id)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  }
  return v4;
}

- (id)info
{
  return self->_info;
}

- (id)utterance
{
  return self->_utterance;
}

- (id)intentString
{
  return self->_intentString;
}

- (id)appIdentifier
{
  return self->_appIdentifier;
}

- (STGenericIntentRequest)initWithAppIdentifier:(id)a3 intentString:(id)a4 utterance:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)STGenericIntentRequest;
  v14 = [(AFSiriRequest *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    appIdentifier = v14->_appIdentifier;
    v14->_appIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    intentString = v14->_intentString;
    v14->_intentString = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    utterance = v14->_utterance;
    v14->_utterance = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    info = v14->_info;
    v14->_info = (NSDictionary *)v21;

    v14->__launchToForeground = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_af_analyticsContextDescription
{
  v10.receiver = self;
  v10.super_class = (Class)STGenericIntentRequest;
  v3 = [(AFSiriRequest *)&v10 _af_analyticsContextDescription];
  id v4 = [(STGenericIntentRequest *)self appIdentifier];
  if (v4) {
    [v3 setObject:v4 forKey:*MEMORY[0x263F28270]];
  }
  BOOL v5 = [(STGenericIntentRequest *)self _launchToForeground];
  uint64_t v6 = [NSNumber numberWithBool:!v5];
  [v3 setObject:v6 forKey:@"backgroundLaunch"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[STGenericIntentRequest _launchToForeground](self, "_launchToForeground"));
  [v3 setObject:v7 forKey:@"presentsResults"];

  uint64_t v8 = [(STGenericIntentRequest *)self intentString];
  if (v8) {
    [v3 setObject:v8 forKey:@"intentString"];
  }

  return v3;
}

@end