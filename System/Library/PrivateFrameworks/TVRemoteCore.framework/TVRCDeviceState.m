@interface TVRCDeviceState
+ (BOOL)supportsSecureCoding;
+ (id)arrayOfStatesFromDevices:(id)a3;
+ (id)deviceStateFromDevice:(id)a3;
+ (id)setOfStatesFromDevices:(id)a3;
- (BOOL)isPaired;
- (BOOL)supportsDirectCaptionQueries;
- (BOOL)supportsFindMyRemote;
- (BOOL)supportsTouchEvents;
- (NSDictionary)alternateIdentifiers;
- (NSError)disconnectError;
- (NSSet)supportedButtons;
- (NSString)identifier;
- (NSString)idsIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)sourceVersion;
- (TVRCDeviceState)initWithCoder:(id)a3;
- (TVRCDeviceState)initWithDevice:(id)a3;
- (TVRCKeyboardState)keyboardState;
- (TVRCNowPlayingInfo)nowPlayingInfo;
- (TVRCSiriRemoteInfo)pairedRemoteInfo;
- (id)description;
- (id)detailedDescription;
- (int64_t)attentionState;
- (int64_t)classification;
- (int64_t)connectionState;
- (int64_t)connectionType;
- (int64_t)disconnectReason;
- (int64_t)linkType;
- (int64_t)siriRemoteFindingState;
- (unint64_t)pairingCapability;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateIdentifiers:(id)a3;
- (void)setAttentionState:(int64_t)a3;
- (void)setClassification:(int64_t)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setConnectionType:(int64_t)a3;
- (void)setDisconnectError:(id)a3;
- (void)setDisconnectReason:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setLinkType:(int64_t)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setPaired:(BOOL)a3;
- (void)setPairedRemoteInfo:(id)a3;
- (void)setPairingCapability:(unint64_t)a3;
- (void)setSiriRemoteFindingState:(int64_t)a3;
- (void)setSourceVersion:(id)a3;
- (void)setSupportedButtons:(id)a3;
- (void)setSupportsDirectCaptionQueries:(BOOL)a3;
- (void)setSupportsFindMyRemote:(BOOL)a3;
- (void)setSupportsTouchEvents:(BOOL)a3;
@end

@implementation TVRCDeviceState

+ (id)deviceStateFromDevice:(id)a3
{
  id v3 = a3;
  v4 = [[TVRCDeviceState alloc] initWithDevice:v3];

  return v4;
}

+ (id)setOfStatesFromDevices:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];

  return v11;
}

+ (id)arrayOfStatesFromDevices:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[TVRCDeviceState deviceStateFromDevice:](TVRCDeviceState, "deviceStateFromDevice:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];

  return v11;
}

- (TVRCDeviceState)initWithDevice:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)TVRCDeviceState;
  id v5 = [(TVRCDeviceState *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    uint64_t v7 = [v6 copy];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v9 = [v4 identifier];
    uint64_t v10 = [v9 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    v12 = [v4 idsIdentifier];
    uint64_t v13 = [v12 copy];
    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v13;

    long long v15 = [v4 alternateIdentifiers];
    uint64_t v16 = [v15 copy];
    alternateIdentifiers = v5->_alternateIdentifiers;
    v5->_alternateIdentifiers = (NSDictionary *)v16;

    uint64_t v18 = [v4 model];
    uint64_t v19 = [v18 copy];
    model = v5->_model;
    v5->_model = (NSString *)v19;

    v21 = [v4 supportedButtons];
    uint64_t v22 = [v21 copy];
    supportedButtons = v5->_supportedButtons;
    v5->_supportedButtons = (NSSet *)v22;

    v5->_connectionState = [v4 connectionState];
    uint64_t v24 = +[TVRCKeyboardState keyboardStateFromDevice:v4];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TVRCKeyboardState *)v24;

    v5->_pairingCapability = [v4 pairingCapability];
    v5->_supportsDirectCaptionQueries = [v4 supportsDirectCaptionQueries];
    v5->_supportsFindMyRemote = [v4 supportsFindMyRemote];
    v5->_supportsTouchEvents = [v4 supportsTouchEvents];
    v5->_paired = [v4 paired];
    disconnectError = v5->_disconnectError;
    v5->_disconnectReason = 5;
    v5->_disconnectError = 0;

    v5->_connectionType = [v4 connectionType];
    v27 = [v4 pairedRemoteInfo];
    uint64_t v28 = [v27 copy];
    pairedRemoteInfo = v5->_pairedRemoteInfo;
    v5->_pairedRemoteInfo = (TVRCSiriRemoteInfo *)v28;

    v30 = [v4 nowPlayingInfo];
    uint64_t v31 = [v30 copy];
    nowPlayingInfo = v5->_nowPlayingInfo;
    v5->_nowPlayingInfo = (TVRCNowPlayingInfo *)v31;

    v5->_classification = [v4 classification];
    v5->_siriRemoteFindingState = [v4 siriRemoteFindingState];
    v5->_attentionState = [v4 attentionState];
    v5->_linkType = [v4 linkType];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCDeviceState)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)TVRCDeviceState;
  id v5 = [(TVRCDeviceState *)&v37 init];
  if (v5)
  {
    v5->_connectionState = [v4 decodeIntegerForKey:@"connectionState"];
    v5->_connectionType = [v4 decodeIntegerForKey:@"connectionType"];
    v5->_pairingCapability = [v4 decodeIntegerForKey:@"pairingCapability"];
    v5->_paired = [v4 decodeBoolForKey:@"paired"];
    v5->_supportsTouchEvents = [v4 decodeBoolForKey:@"supportsTouchEvents"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsIdentifier"];
    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    long long v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"alternateIdentifiers"];
    alternateIdentifiers = v5->_alternateIdentifiers;
    v5->_alternateIdentifiers = (NSDictionary *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    model = v5->_model;
    v5->_model = (NSString *)v17;

    uint64_t v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"supportedButtons"];
    supportedButtons = v5->_supportedButtons;
    v5->_supportedButtons = (NSSet *)v22;

    uint64_t v24 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TVRCKeyboardState *)v28;

    v5->_disconnectReason = [v4 decodeIntegerForKey:@"disconnectReason"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disconnectError"];
    disconnectError = v5->_disconnectError;
    v5->_disconnectError = (NSError *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairedRemoteInfo"];
    pairedRemoteInfo = v5->_pairedRemoteInfo;
    v5->_pairedRemoteInfo = (TVRCSiriRemoteInfo *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nowPlayingInfo"];
    nowPlayingInfo = v5->_nowPlayingInfo;
    v5->_nowPlayingInfo = (TVRCNowPlayingInfo *)v34;

    v5->_classification = [v4 decodeIntegerForKey:@"classification"];
    v5->_siriRemoteFindingState = [v4 decodeIntegerForKey:@"siriRemoteFindingState"];
    v5->_supportsFindMyRemote = [v4 decodeBoolForKey:@"supportsFindMyRemote"];
    v5->_attentionState = [v4 decodeIntegerForKey:@"attentionState"];
    v5->_supportsDirectCaptionQueries = [v4 decodeBoolForKey:@"supportsDirectCaptionQueries"];
    v5->_linkType = [v4 decodeIntegerForKey:@"linkType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t connectionState = self->_connectionState;
  id v5 = a3;
  [v5 encodeInteger:connectionState forKey:@"connectionState"];
  [v5 encodeInteger:self->_connectionType forKey:@"connectionType"];
  [v5 encodeInteger:self->_pairingCapability forKey:@"pairingCapability"];
  [v5 encodeBool:self->_paired forKey:@"paired"];
  [v5 encodeBool:self->_supportsTouchEvents forKey:@"supportsTouchEvents"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_idsIdentifier forKey:@"idsIdentifier"];
  [v5 encodeObject:self->_alternateIdentifiers forKey:@"alternateIdentifiers"];
  [v5 encodeObject:self->_model forKey:@"model"];
  [v5 encodeObject:self->_supportedButtons forKey:@"supportedButtons"];
  [v5 encodeObject:self->_keyboardState forKey:@"keyboardState"];
  [v5 encodeInteger:self->_disconnectReason forKey:@"disconnectReason"];
  [v5 encodeObject:self->_disconnectError forKey:@"disconnectError"];
  [v5 encodeObject:self->_pairedRemoteInfo forKey:@"pairedRemoteInfo"];
  [v5 encodeObject:self->_nowPlayingInfo forKey:@"nowPlayingInfo"];
  [v5 encodeInteger:self->_classification forKey:@"classification"];
  [v5 encodeInteger:self->_siriRemoteFindingState forKey:@"siriRemoteFindingState"];
  [v5 encodeBool:self->_supportsFindMyRemote forKey:@"supportsFindMyRemote"];
  [v5 encodeInteger:self->_attentionState forKey:@"attentionState"];
  [v5 encodeBool:self->_supportsDirectCaptionQueries forKey:@"supportsDirectCaptionQueries"];
  [v5 encodeInteger:self->_linkType forKey:@"linkType"];
}

- (id)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_name withName:@"name"];
  [v3 appendString:self->_identifier withName:@"identifier"];
  [v3 appendString:self->_idsIdentifier withName:@"idsIdentifier"];
  [v3 appendDictionarySection:self->_alternateIdentifiers withName:@"alternateIdentifiers" skipIfEmpty:0];
  id v4 = (id)[v3 appendInteger:self->_pairingCapability withName:@"pairingCapability"];
  id v5 = (id)[v3 appendBool:self->_paired withName:@"paired"];
  id v6 = (id)[v3 appendBool:self->_supportsTouchEvents withName:@"supportsTouchEvents"];
  id v7 = (id)[v3 appendInteger:self->_connectionState withName:@"connectionState"];
  uint64_t v8 = TVRCDeviceConnectionTypeDescription(self->_connectionType);
  [v3 appendString:v8 withName:@"connectionType"];

  id v9 = (id)[v3 appendObject:self->_keyboardState withName:@"keyboardState"];
  id v10 = (id)[v3 appendInteger:self->_disconnectReason withName:@"disconnectReason"];
  id v11 = (id)[v3 appendObject:self->_disconnectError withName:@"disconnectError" skipIfNil:1];
  id v12 = (id)[v3 appendObject:self->_pairedRemoteInfo withName:@"pairedRemoteInfo" skipIfNil:1];
  uint64_t v13 = TVRCDeviceClassificationDescription(self->_classification);
  [v3 appendString:v13 withName:@"classification"];

  id v14 = (id)[v3 appendInteger:self->_siriRemoteFindingState withName:@"siriRemoteFindingState"];
  id v15 = (id)[v3 appendBool:self->_supportsFindMyRemote withName:@"supportsFindMyRemote"];
  unint64_t v16 = self->_attentionState - 1;
  if (v16 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", self->_attentionState);
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v17 = off_2647AF968[v16];
  }
  [v3 appendString:v17 withName:@"attentionState"];

  id v18 = (id)[v3 appendBool:self->_supportsDirectCaptionQueries withName:@"supportsDirectCaptionQueries"];
  uint64_t v19 = TVRCDeviceLinkTypeDescription(self->_linkType);
  [v3 appendString:v19 withName:@"linkType"];

  uint64_t v20 = [v3 build];

  return v20;
}

- (id)detailedDescription
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_name withName:@"name"];
  [v3 appendString:self->_identifier withName:@"identifier"];
  [v3 appendString:self->_idsIdentifier withName:@"idsIdentifier"];
  [v3 appendDictionarySection:self->_alternateIdentifiers withName:@"alternateIdentifiers" skipIfEmpty:0];
  id v4 = (id)[v3 appendInteger:self->_pairingCapability withName:@"pairingCapability"];
  id v5 = (id)[v3 appendBool:self->_paired withName:@"paired"];
  id v6 = (id)[v3 appendBool:self->_supportsTouchEvents withName:@"supportsTouchEvents"];
  id v7 = (id)[v3 appendBool:self->_supportsFindMyRemote withName:@"supportsFindMyRemote"];
  id v8 = (id)[v3 appendInteger:self->_connectionState withName:@"connectionState"];
  id v9 = TVRCDeviceLinkTypeDescription(self->_linkType);
  [v3 appendString:v9 withName:@"linkType"];

  id v10 = TVRCDeviceConnectionTypeDescription(self->_connectionType);
  [v3 appendString:v10 withName:@"connectionType"];

  id v11 = (id)[v3 appendObject:self->_keyboardState withName:@"keyboardState"];
  id v12 = (id)[v3 appendInteger:self->_disconnectReason withName:@"disconnectReason"];
  id v13 = (id)[v3 appendObject:self->_disconnectError withName:@"disconnectError" skipIfNil:1];
  id v14 = (id)[v3 appendObject:self->_pairedRemoteInfo withName:@"pairedRemoteInfo" skipIfNil:1];
  id v15 = TVRCDeviceClassificationDescription(self->_classification);
  [v3 appendString:v15 withName:@"classification"];

  id v16 = (id)[v3 appendInteger:self->_siriRemoteFindingState withName:@"siriRemoteFindingState"];
  unint64_t v17 = self->_attentionState - 1;
  if (v17 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", self->_attentionState);
    id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = off_2647AF968[v17];
  }
  [v3 appendString:v18 withName:@"attentionState"];

  id v19 = (id)[v3 appendObject:self->_supportedButtons withName:@"supportedButtons"];
  id v20 = (id)[v3 appendBool:self->_supportsDirectCaptionQueries withName:@"supportsDirectCaptionQueries"];
  v21 = [v3 build];

  return v21;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_int64_t connectionState = a3;
}

- (unint64_t)pairingCapability
{
  return self->_pairingCapability;
}

- (void)setPairingCapability:(unint64_t)a3
{
  self->_pairingCapability = a3;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int64_t)a3
{
  self->_connectionType = a3;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (BOOL)supportsDirectCaptionQueries
{
  return self->_supportsDirectCaptionQueries;
}

- (void)setSupportsDirectCaptionQueries:(BOOL)a3
{
  self->_supportsDirectCaptionQueries = a3;
}

- (BOOL)supportsFindMyRemote
{
  return self->_supportsFindMyRemote;
}

- (void)setSupportsFindMyRemote:(BOOL)a3
{
  self->_supportsFindMyRemote = a3;
}

- (BOOL)supportsTouchEvents
{
  return self->_supportsTouchEvents;
}

- (void)setSupportsTouchEvents:(BOOL)a3
{
  self->_supportsTouchEvents = a3;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSDictionary)alternateIdentifiers
{
  return self->_alternateIdentifiers;
}

- (void)setAlternateIdentifiers:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSSet)supportedButtons
{
  return self->_supportedButtons;
}

- (void)setSupportedButtons:(id)a3
{
}

- (TVRCKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
}

- (int64_t)siriRemoteFindingState
{
  return self->_siriRemoteFindingState;
}

- (void)setSiriRemoteFindingState:(int64_t)a3
{
  self->_siriRemoteFindingState = a3;
}

- (int64_t)attentionState
{
  return self->_attentionState;
}

- (void)setAttentionState:(int64_t)a3
{
  self->_attentionState = a3;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
}

- (int64_t)disconnectReason
{
  return self->_disconnectReason;
}

- (void)setDisconnectReason:(int64_t)a3
{
  self->_disconnectReason = a3;
}

- (NSError)disconnectError
{
  return self->_disconnectError;
}

- (void)setDisconnectError:(id)a3
{
}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  return self->_pairedRemoteInfo;
}

- (void)setPairedRemoteInfo:(id)a3
{
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (void)setNowPlayingInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_pairedRemoteInfo, 0);
  objc_storeStrong((id *)&self->_disconnectError, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_supportedButtons, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_alternateIdentifiers, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end