@interface RPCompanionLinkDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)changed;
- (BOOL)daemon;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)isEqualToDeviceBasic:(id)a3;
- (BOOL)isPersonal;
- (BOOL)uiTriggered;
- (NSDictionary)siriInfo;
- (NSString)activeUserAltDSID;
- (NSString)deviceColor;
- (NSString)effectiveIdentifier;
- (NSString)idsPersonalDeviceIdentifier;
- (NSString)mediaSystemName;
- (NSString)password;
- (NSString)publicIdentifier;
- (NSString)role;
- (NSString)roomName;
- (NSUUID)homeKitIdentifier;
- (NSUUID)launchInstanceID;
- (NSUUID)mediaSystemIdentifier;
- (NSUUID)mediaSystemIdentifierEffective;
- (NSUUID)pairingIdentifier;
- (RPCompanionLinkDevice)init;
- (RPCompanionLinkDevice)initWithCoder:(id)a3;
- (char)standaloneWatch;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)listeningPort;
- (int)mediaAccessControlSetting;
- (int)mediaSystemRole;
- (int)mediaSystemRoleEffective;
- (int)mediaSystemState;
- (int)personalDeviceState;
- (int)personalRequestsState;
- (int)serversChangedState;
- (unsigned)deviceCapabilityFlags;
- (unsigned)deviceFlags;
- (unsigned)flags;
- (unsigned)updateWithBonjourDevice:(id)a3;
- (unsigned)updateWithSFDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveUserAltDSID:(id)a3;
- (void)setChanged:(BOOL)a3;
- (void)setDaemon:(BOOL)a3;
- (void)setDeviceCapabilityFlags:(unsigned int)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceFlags:(unsigned __int8)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHomeKitIdentifier:(id)a3;
- (void)setIdsPersonalDeviceIdentifier:(id)a3;
- (void)setLaunchInstanceID:(id)a3;
- (void)setListeningPort:(int)a3;
- (void)setMediaAccessControlSetting:(int)a3;
- (void)setMediaSystemIdentifier:(id)a3;
- (void)setMediaSystemIdentifierEffective:(id)a3;
- (void)setMediaSystemName:(id)a3;
- (void)setMediaSystemRole:(int)a3;
- (void)setMediaSystemRoleEffective:(int)a3;
- (void)setMediaSystemState:(int)a3;
- (void)setPairingIdentifier:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPersonal:(BOOL)a3;
- (void)setPersonalDeviceState:(int)a3;
- (void)setPersonalRequestsState:(int)a3;
- (void)setPublicIdentifier:(id)a3;
- (void)setRole:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setServersChangedState:(int)a3;
- (void)setSiriInfo:(id)a3;
- (void)setStandaloneWatch:(char)a3;
- (void)setUiTriggered:(BOOL)a3;
@end

@implementation RPCompanionLinkDevice

- (unsigned)flags
{
  return self->_flags;
}

- (id)description
{
  return [(RPCompanionLinkDevice *)self descriptionWithLevel:50];
}

- (unsigned)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unsigned __int8)a3
{
  self->_deviceFlags = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RPCompanionLinkDevice;
  [(RPEndpoint *)&v24 encodeWithCoder:v4];
  activeUserAltDSID = self->_activeUserAltDSID;
  if (activeUserAltDSID) {
    [v4 encodeObject:activeUserAltDSID forKey:@"altDSID"];
  }
  uint64_t deviceCapabilityFlags = self->_deviceCapabilityFlags;
  if (deviceCapabilityFlags) {
    [v4 encodeInt64:deviceCapabilityFlags forKey:@"dCapF"];
  }
  deviceColor = self->_deviceColor;
  if (deviceColor) {
    [v4 encodeObject:deviceColor forKey:@"dCl"];
  }
  if (self->_deviceFlags) {
    objc_msgSend(v4, "encodeInteger:forKey:");
  }
  uint64_t flags = self->_flags;
  if (flags) {
    [v4 encodeInt64:flags forKey:@"flags"];
  }
  homeKitIdentifier = self->_homeKitIdentifier;
  if (homeKitIdentifier) {
    [v4 encodeObject:homeKitIdentifier forKey:@"hkID"];
  }
  idsCorrelationIdentifier = self->super._idsCorrelationIdentifier;
  if (idsCorrelationIdentifier) {
    [v4 encodeObject:idsCorrelationIdentifier forKey:@"idsCID"];
  }
  idsPersonalDeviceIdentifier = self->_idsPersonalDeviceIdentifier;
  if (idsPersonalDeviceIdentifier) {
    [v4 encodeObject:idsPersonalDeviceIdentifier forKey:@"idsP"];
  }
  uint64_t listeningPort = self->_listeningPort;
  if (listeningPort) {
    [v4 encodeInteger:listeningPort forKey:@"lP"];
  }
  uint64_t mediaAccessControlSetting = self->_mediaAccessControlSetting;
  if (mediaAccessControlSetting) {
    [v4 encodeInteger:mediaAccessControlSetting forKey:@"MAc"];
  }
  mediaSystemIdentifier = self->_mediaSystemIdentifier;
  if (mediaSystemIdentifier) {
    [v4 encodeObject:mediaSystemIdentifier forKey:@"MSi"];
  }
  mediaSystemName = self->_mediaSystemName;
  if (mediaSystemName) {
    [v4 encodeObject:mediaSystemName forKey:@"MSn"];
  }
  uint64_t mediaSystemRole = self->_mediaSystemRole;
  if (mediaSystemRole) {
    [v4 encodeInteger:mediaSystemRole forKey:@"MSr"];
  }
  uint64_t mediaSystemState = self->_mediaSystemState;
  if (mediaSystemState) {
    [v4 encodeInteger:mediaSystemState forKey:@"MSs"];
  }
  if (self->_personal) {
    [v4 encodeBool:1 forKey:@"pers"];
  }
  uint64_t personalDeviceState = self->_personalDeviceState;
  if (personalDeviceState) {
    [v4 encodeInteger:personalDeviceState forKey:@"pds"];
  }
  uint64_t personalRequestsState = self->_personalRequestsState;
  if (personalRequestsState) {
    [v4 encodeInteger:personalRequestsState forKey:@"prs"];
  }
  publicIdentifier = self->_publicIdentifier;
  if (publicIdentifier) {
    [v4 encodeObject:publicIdentifier forKey:@"pubID"];
  }
  role = self->_role;
  if (role) {
    [v4 encodeObject:role forKey:@"role"];
  }
  roomName = self->_roomName;
  if (roomName) {
    [v4 encodeObject:roomName forKey:@"rn"];
  }
  siriInfo = self->_siriInfo;
  if (siriInfo) {
    [v4 encodeObject:siriInfo forKey:@"siriInfo"];
  }
  if (self->_standaloneWatch) {
    objc_msgSend(v4, "encodeInteger:forKey:");
  }
}

- (RPCompanionLinkDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RPCompanionLinkDevice;
  v5 = [(RPEndpoint *)&v20 initWithCoder:v4];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t deviceCapabilityFlags = v21;
    }
    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_deviceFlags = v21;
    }
    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t flags = v21;
    }
    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t listeningPort = v21;
    }
    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t mediaAccessControlSetting = v21;
    }
    id v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t mediaSystemRole = v21;
    }
    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t mediaSystemState = v21;
    }
    id v13 = v12;
    if ([v13 containsValueForKey:@"pers"]) {
      v5->_personal = [v13 decodeBoolForKey:@"pers"];
    }

    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t personalDeviceState = v21;
    }
    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t personalRequestsState = v21;
    }
    id v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v17 = v16;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    uint64_t v21 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_standaloneWatch = v21;
    }
    v18 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifierEffective, 0);
  objc_storeStrong((id *)&self->_launchInstanceID, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_activeUserAltDSID, 0);
  objc_storeStrong((id *)&self->_siriInfo, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_publicIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemName, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_idsPersonalDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
}

- (void)setSiriInfo:(id)a3
{
}

- (unsigned)updateWithSFDevice:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RPCompanionLinkDevice;
  unsigned int v4 = [(RPEndpoint *)&v9 updateWithSFDevice:a3];
  unsigned int flags = self->_flags;
  id v6 = self->super._model;
  if ([(NSString *)v6 hasPrefix:@"AudioAccessory1,"]
    || [(NSString *)v6 hasPrefix:@"AudioAccessory5,"]
    || [(NSString *)v6 hasPrefix:@"AudioAccessory6,"]
    || [(NSString *)v6 hasPrefix:@"HomePod"])
  {

    unsigned int v7 = flags | 2;
  }
  else
  {

    unsigned int v7 = flags;
  }
  if ((self->super._statusFlags & 0x10000) != 0) {
    v7 |= 0x1D00u;
  }
  if (v7 != flags)
  {
    self->_unsigned int flags = v7;
    v4 |= 2u;
  }
  return v4;
}

- (NSString)effectiveIdentifier
{
  identifier = (__CFString *)self->super._identifier;
  if (!identifier)
  {
    identifier = (__CFString *)self->_publicIdentifier;
    if (!identifier) {
      identifier = &stru_1F0C22DA8;
    }
  }
  return (NSString *)identifier;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  if (a3 <= 49) {
    unsigned int v5 = 100;
  }
  else {
    unsigned int v5 = 8;
  }
  BOOL v6 = shouldPrintSensitiveData();
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 8;
  }
  uint64_t v71 = v7;
  id v8 = self->super._identifier;
  objc_super v9 = self->super._idsDeviceIdentifier;
  if ([(NSString *)v9 isEqual:v8])
  {

    id v8 = 0;
  }
  id v10 = self->_publicIdentifier;
  if ([(NSString *)v10 isEqual:v8])
  {

    id v8 = 0;
    goto LABEL_14;
  }
  if (!v8)
  {
LABEL_14:
    id v11 = 0;
    if (!v9) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v92 = 0;
  formatSensitiveData((uint64_t)"%sID ", v6);
  [0 length];
  NSAppendPrintF();
  id v11 = 0;
  if (v9)
  {
LABEL_15:
    id v91 = v11;
    formatSensitiveData((uint64_t)"%sIDS ", v6);
    [v11 length];
    NSAppendPrintF();
    id v12 = v11;

    id v11 = v12;
  }
LABEL_16:
  if (v10)
  {
    id v90 = v11;
    formatSensitiveData((uint64_t)"%sPI ", v6);
    [v11 length];
    NSAppendPrintF();
    id v13 = v11;

    id v11 = v13;
  }
  id v14 = self->super._name;
  if (v14)
  {
    id v89 = v11;
    formatSensitiveData((uint64_t)", Nm ", v6);
    NSAppendPrintF();
    id v15 = v11;

    id v11 = v15;
  }

  id v16 = self->super._model;
  if (v16)
  {
    id v88 = v11;
    formatSensitiveData((uint64_t)", Md ", v6);
    NSAppendPrintF();
    id v17 = v11;

    id v11 = v17;
  }

  v87.receiver = self;
  v87.super_class = (Class)RPCompanionLinkDevice;
  if ([(RPEndpoint *)&v87 activityLevel])
  {
    id v86 = v11;
    NSAppendPrintF();
    id v18 = v11;

    id v11 = v18;
  }
  if (a3 <= 20)
  {
    v19 = self->super._accountID;
    if (v19)
    {
      id v85 = v11;
      formatSensitiveData((uint64_t)", AID ", v6);
      NSAppendPrintF();
      id v20 = v11;

      id v11 = v20;
    }

    uint64_t v21 = self->super._idsCorrelationIdentifier;
    if (v21)
    {
      id v84 = v11;
      formatSensitiveData((uint64_t)", CID ", v6);
      NSAppendPrintF();
      id v22 = v11;

      id v11 = v22;
    }

    v23 = self->_deviceColor;
    if (v23)
    {
      id v83 = v11;
      formatSensitiveData((uint64_t)", Cl ", v6);
      NSAppendPrintF();
      id v24 = v11;

      id v11 = v24;
    }

    v25 = self->_roomName;
    if (v25)
    {
      id v82 = v11;
      formatSensitiveData((uint64_t)", Rm ", v6);
      NSAppendPrintF();
      id v26 = v11;

      id v11 = v26;
    }

    v27 = self->_homeKitIdentifier;
    if (v27)
    {
      id v81 = v11;
      formatSensitiveData((uint64_t)", HKI ", v6);
      NSAppendPrintF();
      id v28 = v11;

      id v11 = v28;
    }

    if (self->super._hotspotInfo)
    {
      id v80 = v11;
      NSAppendPrintF();
      id v29 = v11;

      id v11 = v29;
    }
    v30 = self->_idsPersonalDeviceIdentifier;
    if (v30)
    {
      id v79 = v11;
      formatSensitiveData((uint64_t)", IDP ", v6);
      NSAppendPrintF();
      id v31 = v11;

      id v11 = v31;
    }
  }
  v32 = self->_activeUserAltDSID;
  if (v32)
  {
    id v78 = v11;
    formatSensitiveData((uint64_t)", ADSID ", v6);
    NSAppendPrintF();
    id v33 = v11;

    id v11 = v33;
  }

  v34 = self->super._sourceVersion;
  if (v34)
  {
    id v77 = v11;
    formatSensitiveData((uint64_t)", SV ", v6);
    NSAppendPrintF();
    id v35 = v11;

    id v11 = v35;
  }

  v76.receiver = self;
  v76.super_class = (Class)RPCompanionLinkDevice;
  [(RPEndpoint *)&v76 operatingSystemVersion];
  if (v75)
  {
    id v74 = v11;
    formatSensitiveData((uint64_t)", OSV ", v6);
    v72.receiver = self;
    v72.super_class = (Class)RPCompanionLinkDevice;
    [(RPEndpoint *)&v72 operatingSystemVersion];
    v68 = RPNSOperatingSystemVersionToString(v73);
    NSAppendPrintF();
    id v36 = v74;

    id v11 = v36;
  }
  if (self->super._linkType)
  {
    NSAppendPrintF();
    id v37 = v11;

    id v11 = v37;
  }
  if (self->_uiTriggered)
  {
    NSAppendPrintF();
    id v38 = v11;

    id v11 = v38;
  }
  if (self->super._statusFlags)
  {
    NSAppendPrintF();
    id v39 = v11;

    id v11 = v39;
  }
  if (self->_deviceFlags)
  {
    NSAppendPrintF();
    id v40 = v11;

    id v11 = v40;
  }
  if (a3 <= 20)
  {
    if (self->super._hotspotInfo)
    {
      NSAppendPrintF();
      id v41 = v11;

      id v11 = v41;
    }
    if (self->_listeningPort)
    {
      NSAppendPrintF();
      id v42 = v11;

      id v11 = v42;
    }
    v43 = self->_launchInstanceID;
    v44 = v43;
    if (v43)
    {
      v69 = [(NSUUID *)v43 UUIDString];
      NSAppendPrintF();
      id v45 = v11;

      id v11 = v45;
    }

    if (self->_mediaAccessControlSetting)
    {
      NSAppendPrintF();
      id v46 = v11;

      id v11 = v46;
    }
    v47 = self->super._mediaRemoteIdentifier;
    if (v47)
    {
      NSAppendPrintF();
      id v48 = v11;

      id v11 = v48;
    }

    v49 = self->super._mediaRouteIdentifier;
    if (v49)
    {
      NSAppendPrintF();
      id v50 = v11;

      id v11 = v50;
    }

    if (self->_mediaSystemIdentifier)
    {
      mediaSystemIdentifier = self->_mediaSystemIdentifier;
      NSAppendPrintF();
      id v51 = v11;

      if (self->_daemon)
      {
        -[NSUUID isEqual:](self->_mediaSystemIdentifierEffective, "isEqual:", self->_mediaSystemIdentifier, v71, mediaSystemIdentifier);
        NSAppendPrintF();
        id v11 = v51;
      }
      else
      {
        id v11 = v51;
      }
    }
    if (self->_mediaSystemName)
    {
      NSAppendPrintF();
      id v52 = v11;

      id v11 = v52;
    }
    if (self->_mediaSystemRole)
    {
      NSAppendPrintF();
      id v53 = v11;

      if (self->_daemon)
      {
        NSAppendPrintF();
        id v11 = v53;
      }
      else
      {
        id v11 = v53;
      }
    }
    if (self->_mediaSystemState >= 2u)
    {
      NSAppendPrintF();
      id v54 = v11;

      id v11 = v54;
    }
    if ((self->_flags & 0x40) != 0)
    {
      NSAppendPrintF();
      id v55 = v11;

      NSAppendPrintF();
      id v11 = v55;
    }
    v56 = self->_siriInfo;
    v57 = v56;
    if (v56)
    {
      [(NSDictionary *)v56 count];
      NSAppendPrintF();
      id v58 = v11;

      id v11 = v58;
    }
    v59 = v11;

    RPCompanionLinkFlagsToShortString(self->_flags, (uint64_t)v93);
    NSAppendPrintF();
    id v11 = v11;

    v60 = self->super._serviceTypes;
    if (v60)
    {
      NSAppendPrintF();
      id v61 = v11;

      id v11 = v61;
    }

    v62 = self->_activeUserAltDSID;
    if (v62)
    {
      NSAppendPrintF();
      id v63 = v11;

      id v11 = v63;
    }

    int standaloneWatch = self->_standaloneWatch;
    if ((standaloneWatch & 0x80000000) == 0)
    {
      NSAppendPrintF();
      id v65 = v11;

      id v11 = v65;
    }
  }
  id v66 = v11;

  return v66;
}

- (void)setChanged:(BOOL)a3
{
  self->_changed = a3;
}

- (int)serversChangedState
{
  return self->_serversChangedState;
}

- (int)personalDeviceState
{
  return self->_personalDeviceState;
}

- (int)listeningPort
{
  return self->_listeningPort;
}

- (NSString)idsPersonalDeviceIdentifier
{
  return self->_idsPersonalDeviceIdentifier;
}

- (NSUUID)homeKitIdentifier
{
  return self->_homeKitIdentifier;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (BOOL)changed
{
  return self->_changed;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPCompanionLinkDevice)init
{
  v4.receiver = self;
  v4.super_class = (Class)RPCompanionLinkDevice;
  v2 = [(RPCompanionLinkDevice *)&v4 init];
  if (v2 && GestaltGetDeviceClass() != 6) {
    v2->_int standaloneWatch = -1;
  }
  return v2;
}

- (unsigned)updateWithBonjourDevice:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)RPCompanionLinkDevice;
  id v4 = a3;
  unsigned int v5 = [(RPEndpoint *)&v19 updateWithBonjourDevice:v4];
  BOOL v6 = [v4 txtDictionary];

  unsigned int Int64 = CFDictionaryGetInt64();
  unsigned int flags = self->_flags;
  RPCompanionLinkFlagsWithUpdateBonjourFlags(&flags, Int64);
  if (flags != self->_flags)
  {
    self->_unsigned int flags = flags;
    v5 |= 2u;
  }
  CFStringGetTypeID();
  id v8 = CFDictionaryGetTypedValue();
  objc_super v9 = v8;
  if (v8)
  {
    publicIdentifier = self->_publicIdentifier;
    id v11 = v8;
    id v12 = publicIdentifier;
    if (v11 == v12)
    {

      goto LABEL_11;
    }
    id v13 = v12;
    if (v12)
    {
      char v14 = [(NSString *)v11 isEqual:v12];

      if (v14) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_publicIdentifier, v9);
    v5 |= 2u;
  }
LABEL_11:
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (self->_mediaAccessControlSetting != Int64Ranged)
  {
    self->_uint64_t mediaAccessControlSetting = Int64Ranged;
    v5 |= 2u;
  }
  CFStringGetTypeID();
  id v16 = CFDictionaryGetTypedValue();
  if (v16)
  {
    objc_storeStrong((id *)&self->super._mediaRouteIdentifier, v16);
    v5 |= 2u;
  }

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    uint64_t v7 = [v4 identifier];
    v31.receiver = self;
    v31.super_class = (Class)RPCompanionLinkDevice;
    unsigned __int8 v8 = [(RPEndpoint *)&v31 compareWithDeviceIdentifier:v7];

    if (v8) {
      goto LABEL_11;
    }
  }
  uint64_t v9 = [v4 idsDeviceIdentifier];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [v4 idsDeviceIdentifier];
    v30.receiver = self;
    v30.super_class = (Class)RPCompanionLinkDevice;
    unsigned __int8 v12 = [(RPEndpoint *)&v30 compareWithDeviceIdentifier:v11];

    if (v12) {
      goto LABEL_11;
    }
  }
  if (([v4 statusFlags] & 0x2000) == 0 && (self->super._statusFlags & 0x2000) == 0)
  {
    uint64_t v13 = [v4 verifiedIdentity];
    if (v13)
    {
      char v14 = (void *)v13;
      id v15 = [v4 verifiedIdentity];
      v29.receiver = self;
      v29.super_class = (Class)RPCompanionLinkDevice;
      unsigned __int8 v16 = [(RPEndpoint *)&v29 compareWithDeviceIdentifier:v15];

      if (v16) {
        goto LABEL_11;
      }
    }
  }
  uint64_t v17 = [v4 publicIdentifier];
  if (!v17) {
    goto LABEL_12;
  }
  id v18 = (void *)v17;
  objc_super v19 = [v4 publicIdentifier];
  v28.receiver = self;
  v28.super_class = (Class)RPCompanionLinkDevice;
  unsigned __int8 v20 = [(RPEndpoint *)&v28 compareWithDeviceIdentifier:v19];

  if (v20)
  {
LABEL_11:
    BOOL v21 = 1;
  }
  else
  {
LABEL_12:
    id v22 = [v4 bleDevice];
    v23 = [v22 rapportIdentifier];
    if (v23)
    {
      id v24 = [v4 bleDevice];
      v25 = [v24 rapportIdentifier];
      v27.receiver = self;
      v27.super_class = (Class)RPCompanionLinkDevice;
      BOOL v21 = [(RPEndpoint *)&v27 compareWithDeviceIdentifier:v25];
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  return v21;
}

- (BOOL)isEqualToDeviceBasic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->super._idsDeviceIdentifier
    && ([v4 idsDeviceIdentifier], BOOL v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    idsDeviceIdentifier = self->super._idsDeviceIdentifier;
    uint64_t v8 = [v5 idsDeviceIdentifier];
  }
  else if (self->super._identifier {
         && ([v5 identifier], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  }
  {
    idsDeviceIdentifier = self->super._identifier;
    uint64_t v8 = [v5 identifier];
  }
  else
  {
    idsDeviceIdentifier = self->_publicIdentifier;
    uint64_t v8 = [v5 publicIdentifier];
  }
  id v10 = (void *)v8;
  id v11 = idsDeviceIdentifier;
  unsigned __int8 v12 = v10;
  uint64_t v13 = v12;
  if (v11 == v12)
  {
    char v14 = 1;
  }
  else if ((v11 == 0) == (v12 != 0))
  {
    char v14 = 0;
  }
  else
  {
    char v14 = [(NSString *)v11 isEqual:v12];
  }

  return v14;
}

- (void)setDeviceColor:(id)a3
{
}

- (void)setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
}

- (void)setHomeKitIdentifier:(id)a3
{
}

- (void)setIdsPersonalDeviceIdentifier:(id)a3
{
}

- (void)setListeningPort:(int)a3
{
  self->_uint64_t listeningPort = a3;
}

- (int)mediaAccessControlSetting
{
  return self->_mediaAccessControlSetting;
}

- (void)setMediaAccessControlSetting:(int)a3
{
  self->_uint64_t mediaAccessControlSetting = a3;
}

- (NSUUID)mediaSystemIdentifier
{
  return self->_mediaSystemIdentifier;
}

- (void)setMediaSystemIdentifier:(id)a3
{
}

- (NSString)mediaSystemName
{
  return self->_mediaSystemName;
}

- (void)setMediaSystemName:(id)a3
{
}

- (int)mediaSystemRole
{
  return self->_mediaSystemRole;
}

- (void)setMediaSystemRole:(int)a3
{
  self->_uint64_t mediaSystemRole = a3;
}

- (int)mediaSystemState
{
  return self->_mediaSystemState;
}

- (void)setMediaSystemState:(int)a3
{
  self->_uint64_t mediaSystemState = a3;
}

- (BOOL)isPersonal
{
  return self->_personal;
}

- (void)setPersonal:(BOOL)a3
{
  self->_personal = a3;
}

- (void)setPersonalDeviceState:(int)a3
{
  self->_uint64_t personalDeviceState = a3;
}

- (int)personalRequestsState
{
  return self->_personalRequestsState;
}

- (void)setPersonalRequestsState:(int)a3
{
  self->_uint64_t personalRequestsState = a3;
}

- (NSString)publicIdentifier
{
  return self->_publicIdentifier;
}

- (void)setPublicIdentifier:(id)a3
{
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
}

- (NSDictionary)siriInfo
{
  return self->_siriInfo;
}

- (unsigned)deviceCapabilityFlags
{
  return self->_deviceCapabilityFlags;
}

- (void)setDeviceCapabilityFlags:(unsigned int)a3
{
  self->_uint64_t deviceCapabilityFlags = a3;
}

- (NSString)activeUserAltDSID
{
  return self->_activeUserAltDSID;
}

- (void)setActiveUserAltDSID:(id)a3
{
}

- (char)standaloneWatch
{
  return self->_standaloneWatch;
}

- (void)setStandaloneWatch:(char)a3
{
  self->_int standaloneWatch = a3;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (BOOL)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(BOOL)a3
{
  self->_daemon = a3;
}

- (NSUUID)launchInstanceID
{
  return self->_launchInstanceID;
}

- (void)setLaunchInstanceID:(id)a3
{
}

- (NSUUID)mediaSystemIdentifierEffective
{
  return self->_mediaSystemIdentifierEffective;
}

- (void)setMediaSystemIdentifierEffective:(id)a3
{
}

- (int)mediaSystemRoleEffective
{
  return self->_mediaSystemRoleEffective;
}

- (void)setMediaSystemRoleEffective:(int)a3
{
  self->_mediaSystemRoleEffective = a3;
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setPairingIdentifier:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void)setServersChangedState:(int)a3
{
  self->_serversChangedState = a3;
}

- (BOOL)uiTriggered
{
  return self->_uiTriggered;
}

- (void)setUiTriggered:(BOOL)a3
{
  self->_uiTriggered = a3;
}

@end