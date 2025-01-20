@interface PKWebServiceSharingActivationConfiguration
- (NSArray)allowedSharingChannels;
- (NSArray)blockedSharingChannels;
- (NSString)channelBundleIdentifier;
- (NSString)manufacturerIdentifier;
- (PKOSVersionRequirementRange)versionRange;
- (PKWebServiceSharingActivationConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)accessPassType;
- (int64_t)channelRiskLevel;
- (int64_t)codeLength;
- (int64_t)trustLevel;
- (unint64_t)defaultState;
@end

@implementation PKWebServiceSharingActivationConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedSharingChannels, 0);
  objc_storeStrong((id *)&self->_blockedSharingChannels, 0);
  objc_storeStrong((id *)&self->_manufacturerIdentifier, 0);
  objc_storeStrong((id *)&self->_versionRange, 0);
  objc_storeStrong((id *)&self->_channelBundleIdentifier, 0);
}

- (PKWebServiceSharingActivationConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v44.receiver = self;
    v44.super_class = (Class)PKWebServiceSharingActivationConfiguration;
    v5 = [(PKWebServiceSharingActivationConfiguration *)&v44 init];
    if (!v5)
    {
LABEL_25:
      self = v5;
      v22 = self;
      goto LABEL_26;
    }
    uint64_t v6 = [v4 PKStringForKey:@"channelBundleIdentifier"];
    channelBundleIdentifier = v5->_channelBundleIdentifier;
    v5->_channelBundleIdentifier = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"channelRiskLevel"];
    v9 = v8;
    if (v8 == @"high") {
      goto LABEL_6;
    }
    if (!v8) {
      goto LABEL_8;
    }
    char v10 = [(__CFString *)v8 isEqualToString:@"high"];

    if (v10)
    {
LABEL_6:
      uint64_t v11 = 1;
    }
    else
    {
      v32 = v9;
      if (v32 == @"medium"
        || (v33 = v32,
            char v34 = [(__CFString *)v32 isEqualToString:@"medium"],
            v33,
            (v34 & 1) != 0))
      {
        uint64_t v11 = 2;
      }
      else
      {
        v38 = v33;
        if (v38 != @"low")
        {
          v39 = v38;
          int v40 = [(__CFString *)v38 isEqualToString:@"low"];

          if (!v40)
          {
LABEL_8:
            uint64_t v12 = [v4 PKStringForKey:@"manufacturerIdentifier"];
            manufacturerIdentifier = v5->_manufacturerIdentifier;
            v5->_manufacturerIdentifier = (NSString *)v12;

            v14 = [v4 PKStringForKey:@"accessPassType"];
            v15 = v14;
            if (v14) {
              v5->_accessPassType = PKSecureElementAccessPassTypeFromString(v14);
            }
            v16 = [v4 PKDictionaryForKey:@"versionRange"];
            if (v16)
            {
              v17 = [[PKOSVersionRequirementRange alloc] initWithDictionary:v16];
              versionRange = v5->_versionRange;
              v5->_versionRange = v17;
            }
            v19 = [v4 objectForKeyedSubscript:@"defaultState"];

            if (v19)
            {
              int v20 = [v4 PKBoolForKey:@"defaultState"];
              uint64_t v21 = 1;
              if (!v20) {
                uint64_t v21 = 2;
              }
              v5->_defaultState = v21;
            }
            if ([v4 PKBoolForKey:@"isTrustedChannel"])
            {
              v5->_trustLevel = 1;
LABEL_24:
              v5->_codeLength = [v4 PKIntegerForKey:@"codeLength"];
              uint64_t v27 = [v4 PKArrayContaining:objc_opt_class() forKey:@"blockedSharingChannels"];
              blockedSharingChannels = v5->_blockedSharingChannels;
              v5->_blockedSharingChannels = (NSArray *)v27;

              uint64_t v29 = [v4 PKArrayContaining:objc_opt_class() forKey:@"allowedSharingChannels"];
              allowedSharingChannels = v5->_allowedSharingChannels;
              v5->_allowedSharingChannels = (NSArray *)v29;

              goto LABEL_25;
            }
            v23 = [v4 PKStringForKey:@"trustLevel"];
            v24 = v23;
            if (v23 != @"trusted")
            {
              if (v23)
              {
                char v25 = [(__CFString *)v23 isEqualToString:@"trusted"];

                if ((v25 & 1) == 0)
                {
                  v35 = v24;
                  if (v35 == @"blocked"
                    || (v36 = v35,
                        char v37 = [(__CFString *)v35 isEqualToString:@"blocked"],
                        v36,
                        (v37 & 1) != 0))
                  {
                    uint64_t v26 = 3;
                    goto LABEL_23;
                  }
                  v41 = v36;
                  if (v41 == @"untrusted"
                    || (v42 = v41,
                        char v43 = [(__CFString *)v41 isEqualToString:@"untrusted"],
                        v42,
                        (v43 & 1) != 0))
                  {
                    uint64_t v26 = 2;
                    goto LABEL_23;
                  }
                }
              }
            }
            uint64_t v26 = 1;
LABEL_23:
            v5->_trustLevel = v26;

            goto LABEL_24;
          }
        }
        uint64_t v11 = 3;
      }
    }
    v5->_channelRiskLevel = v11;
    goto LABEL_8;
  }
  v22 = 0;
LABEL_26:

  return v22;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"channelBundleIdentifier: '%@'; ", self->_channelBundleIdentifier];
  objc_msgSend(v6, "appendFormat:", @"channelRiskLevel: '%lu'; ", self->_channelRiskLevel);
  [v6 appendFormat:@"manufacturerIdentifier: '%@'; ", self->_manufacturerIdentifier];
  objc_msgSend(v6, "appendFormat:", @"accessPassType: '%lu'; ", self->_accessPassType);
  objc_msgSend(v6, "appendFormat:", @"defaultState: '%lu'; ", self->_defaultState);
  objc_msgSend(v6, "appendFormat:", @"trustLevel: '%lu'; ", self->_trustLevel);
  objc_msgSend(v6, "appendFormat:", @"codeLength: '%lu'; ", self->_codeLength);
  [v6 appendFormat:@"blockedSharingChannels: '%@'; ", self->_blockedSharingChannels];
  [v6 appendFormat:@"allowedSharingChannels: '%@'; ", self->_allowedSharingChannels];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (NSString)channelBundleIdentifier
{
  return self->_channelBundleIdentifier;
}

- (int64_t)channelRiskLevel
{
  return self->_channelRiskLevel;
}

- (int64_t)accessPassType
{
  return self->_accessPassType;
}

- (PKOSVersionRequirementRange)versionRange
{
  return self->_versionRange;
}

- (NSString)manufacturerIdentifier
{
  return self->_manufacturerIdentifier;
}

- (int64_t)codeLength
{
  return self->_codeLength;
}

- (unint64_t)defaultState
{
  return self->_defaultState;
}

- (int64_t)trustLevel
{
  return self->_trustLevel;
}

- (NSArray)blockedSharingChannels
{
  return self->_blockedSharingChannels;
}

- (NSArray)allowedSharingChannels
{
  return self->_allowedSharingChannels;
}

@end