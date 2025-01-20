@interface WLKAppSettings
+ (BOOL)isExternalID:(id)a3 equalToExternalID:(id)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAppSettings:(id)a3;
- (BOOL)obsolete;
- (NSString)channelID;
- (NSString)displayName;
- (NSString)externalID;
- (WLKAppSettings)initWithChannelID:(id)a3 accessStatus:(unint64_t)a4 displayName:(id)a5 externalID:(id)a6;
- (WLKAppSettings)initWithCoder:(id)a3;
- (id)JSONDictionary;
- (id)_statusStrings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)accessStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessStatus:(unint64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setObsolete:(BOOL)a3;
@end

@implementation WLKAppSettings

- (WLKAppSettings)initWithChannelID:(id)a3 accessStatus:(unint64_t)a4 displayName:(id)a5 externalID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WLKAppSettings;
  v13 = [(WLKAppSettings *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    channelID = v13->_channelID;
    v13->_channelID = (NSString *)v14;

    v13->_accessStatus = a4;
    uint64_t v16 = [v11 copy];
    displayName = v13->_displayName;
    v13->_displayName = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    externalID = v13->_externalID;
    v13->_externalID = (NSString *)v18;
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WLKAppSettings *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(WLKAppSettings *)self isEqualToAppSettings:v4];
  }

  return v5;
}

- (BOOL)isEqualToAppSettings:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    unint64_t accessStatus = self->_accessStatus;
    if (accessStatus == [v4 accessStatus])
    {
      channelID = self->_channelID;
      v8 = [v5 channelID];
      if (![(NSString *)channelID isEqualToString:v8])
      {
        char v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      externalID = self->_externalID;
      uint64_t v10 = [v5 externalID];
      id v11 = (void *)v10;
      if (externalID && v10)
      {
        if (([(NSString *)externalID isEqual:v10] & 1) == 0)
        {
LABEL_7:
          char v12 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      else if ((unint64_t)externalID | v10)
      {
        goto LABEL_7;
      }
      displayName = self->_displayName;
      uint64_t v14 = [v5 displayName];
      v15 = (void *)v14;
      if (displayName && v14) {
        char v12 = [(NSString *)displayName isEqual:v14];
      }
      else {
        char v12 = ((unint64_t)displayName | v14) == 0;
      }

      goto LABEL_16;
    }
  }
  char v12 = 0;
LABEL_18:

  return v12;
}

+ (BOOL)isExternalID:(id)a3 equalToExternalID:(id)a4
{
  if (a3 && a4) {
    return [a3 isEqual:a4];
  }
  else {
    return ((unint64_t)a3 | (unint64_t)a4) == 0;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_channelID hash];
  NSUInteger v4 = [(NSString *)self->_externalID hash] ^ v3;
  return v4 ^ [(NSString *)self->_displayName hash] ^ self->_accessStatus;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)WLKAppSettings;
  NSUInteger v4 = [(WLKAppSettings *)&v11 description];
  long long v10 = *(_OWORD *)&self->_channelID;
  externalID = self->_externalID;
  v6 = [(WLKAppSettings *)self _statusStrings];
  v7 = [v6 objectAtIndex:self->_accessStatus];
  objc_msgSend(v3, "stringWithFormat:", @"%@ channelID:%@; displayName:%@; externalID:%@; accessStatus:%@",
    v4,
    v10,
    externalID,
  v8 = v7);

  return v8;
}

- (id)JSONDictionary
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_channelID forKeyedSubscript:@"channelID"];
  NSUInteger v4 = [NSNumber numberWithInteger:self->_accessStatus];
  [v3 setObject:v4 forKeyedSubscript:@"accessStatus"];

  BOOL v5 = [(WLKAppSettings *)self _statusStrings];
  v6 = [v5 objectAtIndex:self->_accessStatus];
  [v3 setObject:v6 forKeyedSubscript:@"accessStatusString"];

  if ([(NSString *)self->_externalID length]) {
    [v3 setObject:self->_externalID forKeyedSubscript:@"externalID"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (id)_statusStrings
{
  if (_statusStrings_onceToken != -1) {
    dispatch_once(&_statusStrings_onceToken, &__block_literal_global_49);
  }
  v2 = (void *)_statusStrings___statusStrings;

  return v2;
}

void __32__WLKAppSettings__statusStrings__block_invoke()
{
  v0 = (void *)_statusStrings___statusStrings;
  _statusStrings___statusStrings = (uint64_t)&unk_1F13D9B58;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLKAppSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    BOOL v5 = [(WLKAppSettings *)self init];
    if (v5)
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKAppSettings.channelID"];
      channelID = v5->_channelID;
      v5->_channelID = (NSString *)v6;

      v5->_unint64_t accessStatus = [v4 decodeIntegerForKey:@"WLKAppSettings.accessStatus"];
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKAppSettings.displayName"];
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v8;

      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKAppSettings.externalID"];
      externalID = v5->_externalID;
      v5->_externalID = (NSString *)v10;

      v5->_obsolete = [v4 decodeBoolForKey:@"WLKAppSettings.obsolete"];
    }
    self = v5;
    char v12 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
    char v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeObject:self->_channelID forKey:@"WLKAppSettings.channelID"];
  [v4 encodeInteger:self->_accessStatus forKey:@"WLKAppSettings.accessStatus"];
  [v4 encodeObject:self->_displayName forKey:@"WLKAppSettings.displayName"];
  [v4 encodeObject:self->_externalID forKey:@"WLKAppSettings.externalID"];
  [v4 encodeBool:self->_obsolete forKey:@"WLKAppSettings.obsolete"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_channelID copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSString *)self->_displayName copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_externalID copy];
  uint64_t v10 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v9;

  *(void *)(v4 + 32) = self->_accessStatus;
  *(unsigned char *)(v4 + 8) = self->_obsolete;
  return (id)v4;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (unint64_t)accessStatus
{
  return self->_accessStatus;
}

- (void)setAccessStatus:(unint64_t)a3
{
  self->_unint64_t accessStatus = a3;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (BOOL)obsolete
{
  return self->_obsolete;
}

- (void)setObsolete:(BOOL)a3
{
  self->_obsolete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_channelID, 0);
}

@end