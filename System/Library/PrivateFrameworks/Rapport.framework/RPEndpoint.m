@interface RPEndpoint
+ (BOOL)supportsSecureCoding;
+ (id)nullEndpoint;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion;
- (BOOL)cameraCapabilityRequestIsActive;
- (BOOL)compareWithDeviceIdentifier:(id)a3;
- (BOOL)encodeSensitiveProperties;
- (BOOL)inDiscoverySession;
- (BOOL)present;
- (BOOL)removeBonjourDevice:(id)a3;
- (BOOL)removeCBDevice:(id)a3;
- (BOOL)removeSFDevice:(id)a3;
- (CBDevice)cbDevice;
- (CUBonjourDevice)bonjourDevice;
- (IDSDevice)idsDevice;
- (NSArray)homeKitUserIdentifiers;
- (NSArray)serviceTypes;
- (NSData)encodedBLETargetData;
- (NSDate)activityLevelTimeStamp;
- (NSDictionary)serviceInfo;
- (NSDictionary)verifiedAcl;
- (NSString)accountAltDSID;
- (NSString)accountID;
- (NSString)contactID;
- (NSString)identifier;
- (NSString)idsCorrelationIdentifier;
- (NSString)idsDeviceIdentifier;
- (NSString)ipAddress;
- (NSString)mediaRemoteIdentifier;
- (NSString)mediaRouteIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)serviceType;
- (NSString)sourceVersion;
- (NSString)verifiedIdentity;
- (RPEndpoint)initWithCoder:(id)a3;
- (SFDevice)bleDevice;
- (id)bleTargetData;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)activityLevel;
- (int)linkType;
- (int)proximity;
- (unint64_t)statusFlags;
- (unsigned)cameraState;
- (unsigned)hotspotInfo;
- (unsigned)nearbyActionV2Type;
- (unsigned)removeIDSDevice;
- (unsigned)updateTrustStatusFlagsWithIdentity:(id)a3;
- (unsigned)updateWithBonjourDevice:(id)a3;
- (unsigned)updateWithCBDevice:(id)a3;
- (unsigned)updateWithEndpoint:(id)a3;
- (unsigned)updateWithFamilyEndpoint:(id)a3;
- (unsigned)updateWithIDSDevice:(id)a3;
- (unsigned)updateWithIdentity:(id)a3;
- (unsigned)updateWithSFDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountAltDSID:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setActivityLevel:(int)a3;
- (void)setBleDevice:(id)a3;
- (void)setBonjourDevice:(id)a3;
- (void)setCameraCapabilityRequestIsActive:(BOOL)a3;
- (void)setCbDevice:(id)a3;
- (void)setEncodeSensitiveProperties:(BOOL)a3;
- (void)setEncodedBLETargetData:(id)a3;
- (void)setHomeKitUserIdentifiers:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsCorrelationIdentifier:(id)a3;
- (void)setIdsDevice:(id)a3;
- (void)setIdsDeviceIdentifier:(id)a3;
- (void)setInDiscoverySession:(BOOL)a3;
- (void)setIpAddress:(id)a3;
- (void)setLinkType:(int)a3;
- (void)setMediaRemoteIdentifier:(id)a3;
- (void)setMediaRouteIdentifier:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setNearbyActionV2Type:(unsigned __int8)a3;
- (void)setOperatingSystemVersion:(id *)a3;
- (void)setPresent:(BOOL)a3;
- (void)setServiceTypes:(id)a3;
- (void)setSourceVersion:(id)a3;
- (void)setStatusFlags:(unint64_t)a3;
- (void)setVerifiedAcl:(id)a3;
- (void)setVerifiedIdentity:(id)a3;
@end

@implementation RPEndpoint

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (SFDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setIdsDeviceIdentifier:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setIdsDevice:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  accountAltDSID = self->_accountAltDSID;
  if (accountAltDSID) {
    [v30 encodeObject:accountAltDSID forKey:@"altDSID"];
  }
  accountID = self->_accountID;
  if (accountID) {
    [v30 encodeObject:accountID forKey:@"aID"];
  }
  uint64_t activityLevel = self->_activityLevel;
  if (activityLevel) {
    [v30 encodeInteger:activityLevel forKey:@"acl"];
  }
  activityLevelTimeStamp = self->_activityLevelTimeStamp;
  if (activityLevelTimeStamp) {
    [v30 encodeObject:activityLevelTimeStamp forKey:@"aclTS"];
  }
  if (self->_cameraState) {
    objc_msgSend(v30, "encodeInteger:forKey:");
  }
  homeKitUserIdentifiers = self->_homeKitUserIdentifiers;
  if (homeKitUserIdentifiers) {
    [v30 encodeObject:homeKitUserIdentifiers forKey:@"hkUI"];
  }
  uint64_t hotspotInfo = self->_hotspotInfo;
  if (hotspotInfo) {
    [v30 encodeInt64:hotspotInfo forKey:@"hsI"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v30 encodeObject:identifier forKey:@"id"];
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  if (idsDeviceIdentifier) {
    [v30 encodeObject:idsDeviceIdentifier forKey:@"idsD"];
  }
  contactID = self->_contactID;
  if (contactID) {
    [v30 encodeObject:contactID forKey:@"cnID"];
  }
  if (self->_inDiscoverySession) {
    [v30 encodeBool:1 forKey:@"iLagS"];
  }
  ipAddress = self->_ipAddress;
  if (ipAddress) {
    [v30 encodeObject:ipAddress forKey:@"ipAdd"];
  }
  mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
  if (mediaRemoteIdentifier) {
    [v30 encodeObject:mediaRemoteIdentifier forKey:@"MRI"];
  }
  mediaRouteIdentifier = self->_mediaRouteIdentifier;
  if (mediaRouteIdentifier) {
    [v30 encodeObject:mediaRouteIdentifier forKey:@"MRtI"];
  }
  model = self->_model;
  if (model) {
    [v30 encodeObject:model forKey:@"md"];
  }
  name = self->_name;
  if (name) {
    [v30 encodeObject:name forKey:@"nm"];
  }
  int64_t majorVersion = self->_operatingSystemVersion.majorVersion;
  if (majorVersion) {
    [v30 encodeInteger:majorVersion forKey:@"osma"];
  }
  int64_t minorVersion = self->_operatingSystemVersion.minorVersion;
  if (minorVersion) {
    [v30 encodeInteger:minorVersion forKey:@"osmi"];
  }
  int64_t patchVersion = self->_operatingSystemVersion.patchVersion;
  if (patchVersion) {
    [v30 encodeInteger:patchVersion forKey:@"osp"];
  }
  uint64_t proximity = self->_proximity;
  if (proximity) {
    [v30 encodeInteger:proximity forKey:@"px"];
  }
  serviceInfo = self->_serviceInfo;
  if (serviceInfo) {
    [v30 encodeObject:serviceInfo forKey:@"si"];
  }
  serviceType = self->_serviceType;
  if (serviceType) {
    [v30 encodeObject:serviceType forKey:@"st"];
  }
  serviceTypes = self->_serviceTypes;
  if (serviceTypes) {
    [v30 encodeObject:serviceTypes forKey:@"stA"];
  }
  unint64_t statusFlags = self->_statusFlags;
  if (statusFlags) {
    [v30 encodeInt64:statusFlags forKey:@"sf"];
  }
  sourceVersion = self->_sourceVersion;
  if (sourceVersion) {
    [v30 encodeObject:sourceVersion forKey:@"sv"];
  }
  verifiedIdentity = self->_verifiedIdentity;
  if (verifiedIdentity) {
    [v30 encodeObject:verifiedIdentity forKey:@"vi"];
  }
  verifiedAcl = self->_verifiedAcl;
  if (verifiedAcl) {
    [v30 encodeObject:verifiedAcl forKey:@"vAcl"];
  }
  if (self->_encodeSensitiveProperties)
  {
    v29 = [(RPEndpoint *)self bleTargetData];
    if (v29) {
      [v30 encodeObject:v29 forKey:@"bleTD"];
    }
  }
}

- (RPEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)RPEndpoint;
  v5 = [(RPEndpoint *)&v29 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v30 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t activityLevel = v30;
    }
    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v30 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_cameraState = v30;
    }
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    uint64_t v30 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t hotspotInfo = v30;
    }
    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v13 = v12;
    if ([v13 containsValueForKey:@"iLagS"]) {
      v5->_inDiscoverySession = [v13 decodeBoolForKey:@"iLagS"];
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
    NSDecodeObjectIfPresent();

    id v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v19 = v18;
    if ([v19 containsValueForKey:@"osma"]) {
      v5->_operatingSystemVersion.int64_t majorVersion = [v19 decodeIntegerForKey:@"osma"];
    }

    id v20 = v19;
    if ([v20 containsValueForKey:@"osmi"]) {
      v5->_operatingSystemVersion.int64_t minorVersion = [v20 decodeIntegerForKey:@"osmi"];
    }

    id v21 = v20;
    if ([v21 containsValueForKey:@"osp"]) {
      v5->_operatingSystemVersion.int64_t patchVersion = [v21 decodeIntegerForKey:@"osp"];
    }

    uint64_t v30 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t proximity = v30;
    }
    id v22 = v21;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    id v23 = v22;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v24 = v23;
    if ([v24 containsValueForKey:@"sf"]) {
      v5->_unint64_t statusFlags = [v24 decodeInt64ForKey:@"sf"];
    }

    id v25 = v24;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v26 = v25;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    objc_opt_class();
    NSDecodeNSDictionaryOfClassesIfPresent();
    v27 = v5;
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDevice, 0);
  objc_storeStrong((id *)&self->_encodedBLETargetData, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceInfo, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_homeKitUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_activityLevelTimeStamp, 0);
  objc_storeStrong((id *)&self->_verifiedAcl, 0);
  objc_storeStrong((id *)&self->_verifiedIdentity, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_idsCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bonjourDevice, 0);
  objc_storeStrong((id *)&self->_cbDevice, 0);
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
}

- (unsigned)updateWithSFDevice:(id)a3
{
  id v5 = a3;
  int v133 = 0;
  id v6 = self->_bleDevice;
  objc_storeStrong((id *)&self->_bleDevice, a3);
  v129 = self->_idsDevice;
  unsigned int v7 = [v5 deviceFlags];
  int v8 = 0;
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v5 accountAltDSID];
    id v10 = v9;
    if (!v9)
    {
      int v8 = 0;
LABEL_13:

      goto LABEL_14;
    }
    unsigned int v11 = v7;
    accountAltDSID = self->_accountAltDSID;
    id v13 = v9;
    id v14 = accountAltDSID;
    if (v13 == v14)
    {
    }
    else
    {
      id v15 = v14;
      if (!v14)
      {

LABEL_11:
        objc_storeStrong((id *)&self->_accountAltDSID, v10);
        int v8 = 2;
        goto LABEL_12;
      }
      char v16 = [(NSString *)v13 isEqual:v14];

      if ((v16 & 1) == 0) {
        goto LABEL_11;
      }
    }
    int v8 = 0;
LABEL_12:
    unsigned int v7 = v11;
    goto LABEL_13;
  }
LABEL_14:
  unsigned int v128 = v7;
  id v17 = [v5 accountID];
  id v18 = v17;
  if (v17)
  {
    accountID = self->_accountID;
    id v20 = v17;
    id v21 = accountID;
    if (v20 == v21)
    {
    }
    else
    {
      id v22 = v21;
      if (v21)
      {
        char v23 = [(NSString *)v20 isEqual:v21];

        if (v23) {
          goto LABEL_22;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_accountID, v18);
      int v8 = 2;
    }
  }
LABEL_22:

  v126 = [v5 bleDevice];
  int v24 = [v126 decryptedActivityLevel];
  if (v24 != 16 && self->_activityLevel != v24)
  {
    self->_uint64_t activityLevel = v24;
    id v25 = [MEMORY[0x1E4F1C9C8] date];
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    self->_activityLevelTimeStamp = v25;

    int v8 = 2;
  }
  v27 = [v5 bleDevice];
  v28 = [v27 advertisementData];
  objc_super v29 = [(SFDevice *)v6 bleDevice];
  uint64_t v30 = [v29 advertisementData];
  id v31 = v28;
  id v32 = v30;
  v33 = v32;
  if (v31 == v32)
  {
    int v34 = 1;
  }
  else if ((v31 == 0) == (v32 != 0))
  {
    int v34 = 0;
  }
  else
  {
    int v34 = [v31 isEqual:v32];
  }

  int v35 = v8 | 1;
  if (v34) {
    int v36 = v8;
  }
  else {
    int v36 = v8 | 1;
  }
  v37 = [v5 bleDevice];
  v38 = [v37 advertisementFields];
  v39 = (void *)[v38 mutableCopy];

  v40 = [(SFDevice *)v6 bleDevice];
  v41 = [v40 advertisementFields];
  v42 = (void *)[v41 mutableCopy];

  [v39 setObject:0 forKeyedSubscript:@"ch"];
  [v42 setObject:0 forKeyedSubscript:@"ch"];
  id v43 = v39;
  id v44 = v42;
  v124 = v44;
  v125 = v43;
  if (v43 == v44)
  {

    goto LABEL_38;
  }
  v45 = v44;
  if ((v43 == 0) == (v44 != 0))
  {

    goto LABEL_40;
  }
  int v46 = [v43 isEqual:v44];

  if (v46) {
LABEL_38:
  }
    int v35 = v36;
LABEL_40:
  v47 = [v5 bleDevice];
  v48 = [v47 advertisementFields];
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();

  if (self->_cameraState != Int64Ranged)
  {
    self->_cameraState = Int64Ranged;
    v35 |= 2u;
  }
  unsigned int hotspotInfo = self->_hotspotInfo;
  if (hotspotInfo != [v5 hotspotInfo])
  {
    self->_unsigned int hotspotInfo = [v5 hotspotInfo];
    v35 |= 1u;
  }
  v51 = [v5 idsIdentifier];
  v52 = v51;
  if (v51)
  {
    idsDeviceIdentifier = self->_idsDeviceIdentifier;
    v54 = v51;
    v55 = idsDeviceIdentifier;
    if (v54 == v55)
    {

      goto LABEL_52;
    }
    v56 = v55;
    if (v55)
    {
      char v57 = [(NSString *)v54 isEqual:v55];

      if (v57) {
        goto LABEL_52;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_idsDeviceIdentifier, v52);
    v35 |= 2u;
  }
LABEL_52:

  int v58 = [v5 inDiscoverySession];
  if (self->_inDiscoverySession != v58)
  {
    self->_inDiscoverySession = v58;
    v35 |= 0x400u;
  }
  v59 = [v5 contactIdentifier];
  v60 = v59;
  if (v59)
  {
    contactID = self->_contactID;
    v62 = v59;
    v63 = contactID;
    if (v62 == v63)
    {

      goto LABEL_62;
    }
    v64 = v63;
    if (v63)
    {
      char v65 = [(NSString *)v62 isEqual:v63];

      if (v65) {
        goto LABEL_62;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_contactID, v60);
    v35 |= 2u;
  }
LABEL_62:

  if (self->_mediaRemoteIdentifier)
  {
    v66 = v129;
  }
  else
  {
    v67 = [v5 mediaRemoteID];
    if (v67)
    {
      objc_storeStrong((id *)&self->_mediaRemoteIdentifier, v67);
      v35 |= 2u;
    }
    v66 = v129;
  }
  if (self->_mediaRouteIdentifier)
  {
    BOOL v122 = (v128 & 0x400) == 0;
  }
  else
  {
    v68 = [v5 mediaRouteID];
    if (v68)
    {
      objc_storeStrong((id *)&self->_mediaRouteIdentifier, v68);
      v35 |= 2u;
    }

    if (self->_mediaRouteIdentifier || (v128 & 0x400) == 0)
    {
      BOOL v122 = (v128 & 0x400) == 0;
    }
    else
    {
      v69 = [v5 rapportIdentifier];
      if (v69)
      {
        objc_storeStrong((id *)&self->_mediaRouteIdentifier, v69);
        v35 |= 2u;
      }

      BOOL v122 = 0;
    }
  }
  v70 = self->_model;
  if (v70)
  {
    v71 = (__CFString *)v70;
    goto LABEL_82;
  }
  v71 = [v5 model];
  if (v71) {
    goto LABEL_81;
  }
  v71 = [(IDSDevice *)v66 modelIdentifier];
  if (v71) {
    goto LABEL_81;
  }
  if ([v5 deviceClassCode] == 4)
  {
    if ([v5 deviceModelCode] == 5)
    {
      v71 = @"AudioAccessory5,1";
    }
    else if ([v5 deviceModelCode] == 6)
    {
      v71 = @"AudioAccessory6,1";
    }
    else
    {
      v71 = @"AudioAccessory1,1";
    }
LABEL_81:
    objc_storeStrong((id *)&self->_model, v71);
    v35 |= 2u;
    goto LABEL_82;
  }
  v71 = 0;
LABEL_82:
  v72 = [v5 name];
  v73 = v72;
  if (!v72) {
    goto LABEL_90;
  }
  name = self->_name;
  v75 = v72;
  v76 = name;
  if (v75 == v76)
  {

    v66 = v129;
    goto LABEL_90;
  }
  v77 = v76;
  if (!v76)
  {

    v66 = v129;
    goto LABEL_89;
  }
  char v78 = [(NSString *)v75 isEqual:v76];

  v66 = v129;
  if ((v78 & 1) == 0)
  {
LABEL_89:
    objc_storeStrong((id *)&self->_name, v73);
    v35 |= 0x10u;
  }
LABEL_90:

  long long v131 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  int64_t patchVersion = self->_operatingSystemVersion.patchVersion;
  uint64_t v79 = RPNSOperatingSystemVersionToString((uint64_t *)&v131);
  v127 = v6;
  v123 = (void *)v79;
  if (!v66) {
    goto LABEL_102;
  }
  v80 = (void *)v79;
  [(IDSDevice *)v66 operatingSystemVersion];
  if (v130[3] >= 1)
  {
    [(IDSDevice *)v66 operatingSystemVersion];
    v81 = RPNSOperatingSystemVersionToString(v130);
    id v82 = v80;
    id v83 = v81;
    if (v82 == v83)
    {

      goto LABEL_99;
    }
    v84 = v83;
    if ((v82 == 0) == (v83 != 0))
    {
    }
    else
    {
      char v85 = [v82 isEqual:v83];

      if (v85)
      {
        v66 = v129;
        goto LABEL_99;
      }
    }
    v66 = v129;
    [(IDSDevice *)v129 operatingSystemVersion];
    *(_OWORD *)&self->_operatingSystemVersion.int64_t majorVersion = v131;
    self->_operatingSystemVersion.int64_t patchVersion = patchVersion;
    v35 |= 2u;
  }
LABEL_99:
  if (!self->_sourceVersion)
  {
    [(IDSDevice *)v66 operatingSystemVersion];
    RPModelOSVersionToSourceVersionString();
    v86 = (NSString *)objc_claimAutoreleasedReturnValue();
    sourceVersion = self->_sourceVersion;
    self->_sourceVersion = v86;

    if (self->_sourceVersion) {
      v35 |= 2u;
    }
  }
LABEL_102:
  unint64_t statusFlags = self->_statusFlags;
  int v89 = [v5 deviceActionType];
  int v90 = [(IDSDevice *)v66 supportsApplePay];
  uint64_t v91 = 2;
  if (v90) {
    uint64_t v91 = 8388610;
  }
  unint64_t v92 = statusFlags & 0xFFFFFF7FF7DFFEFDLL | v91 & 0xFFFFFF7FFFFFFFFFLL | ((((unint64_t)(v128 & 0x80) >> 7) & 1) << 39);
  if ((v128 & 8) != 0 && v89 == 28) {
    uint64_t v94 = 0x200000;
  }
  else {
    uint64_t v94 = 0;
  }
  int v95 = [v5 duetSync];
  uint64_t v96 = 256;
  if (!v95) {
    uint64_t v96 = 0;
  }
  unint64_t v97 = v92 | v94 | v96 | ((unint64_t)(v89 == 29) << 27);
  v98 = [v5 bleDevice];
  v99 = [v98 advertisementFields];
  char v100 = CFDictionaryGetInt64Ranged();

  if (!v133) {
    unint64_t v97 = v97 & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)(v100 != 0) << 9);
  }
  unint64_t v101 = v97 & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)(v89 == 34) << 30);
  v102 = v71;
  int v103 = [(__CFString *)v102 hasPrefix:@"AppleTV"];

  uint64_t v104 = v101 | 0x50800;
  if (!v103) {
    uint64_t v104 = v101;
  }
  if ((v128 & 8) != 0) {
    v104 |= 0x80000uLL;
  }
  uint64_t v105 = v104 | (v128 << 13) & 0x4000 | (((v128 >> 2) & 1) << 17);
  if (!v122) {
    v105 |= 0x8000uLL;
  }
  unint64_t v106 = (v128 << 7) & 0x2000 | ((unint64_t)(((unsigned __int16)(v128 & 0xC000) >> 8) >> 6) << 36) | v105;
  v107 = [v5 bleDevice];
  v108 = [v107 advertisementFields];
  uint64_t Int64 = CFDictionaryGetInt64();

  unint64_t v110 = v106 | 0x80;
  if (!Int64) {
    unint64_t v110 = v106;
  }
  if (v110 == statusFlags)
  {
    v111 = v127;
    int v112 = v35;
  }
  else
  {
    self->_unint64_t statusFlags = v110;
    int v112 = v35 | 2;
    v111 = v127;
  }
  uint64_t v113 = [v5 distance];
  if (v113 >= 21) {
    int v114 = 30;
  }
  else {
    int v114 = 20;
  }
  if (v113 < 11) {
    int v114 = 10;
  }
  if (v114 != self->_proximity)
  {
    self->_uint64_t proximity = v114;
    v112 |= 0x80u;
  }
  v115 = [v5 bleDevice];
  uint64_t v116 = [v115 rssi];

  v117 = [(SFDevice *)v111 bleDevice];
  uint64_t v118 = [v117 rssi];

  if (v116 == v118 || v116 == 0) {
    unsigned int v120 = v112;
  }
  else {
    unsigned int v120 = v112 | 0x20;
  }

  return v120;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (NSString)mediaRemoteIdentifier
{
  return self->_mediaRemoteIdentifier;
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (NSString)idsCorrelationIdentifier
{
  return self->_idsCorrelationIdentifier;
}

- (NSArray)homeKitUserIdentifiers
{
  return self->_homeKitUserIdentifiers;
}

- (NSString)accountID
{
  return self->_accountID;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)((char *)self + 128);
  return self;
}

- (int)activityLevel
{
  return self->_activityLevel;
}

- (BOOL)removeSFDevice:(id)a3
{
  bleDevice = self->_bleDevice;
  self->_bleDevice = 0;

  self->_uint64_t activityLevel = 0;
  activityLevelTimeStamp = self->_activityLevelTimeStamp;
  self->_activityLevelTimeStamp = 0;

  unint64_t statusFlags = self->_statusFlags;
  self->_unint64_t statusFlags = statusFlags & 0xFFFFFFFFBFDFFCFDLL;
  return (statusFlags & 0x10001D) == 0;
}

+ (id)nullEndpoint
{
  if (nullEndpoint_sOnce != -1) {
    dispatch_once(&nullEndpoint_sOnce, &__block_literal_global_5);
  }
  v2 = (void *)nullEndpoint_sObj;
  return v2;
}

void __26__RPEndpoint_nullEndpoint__block_invoke()
{
  v0 = objc_alloc_init(RPEndpoint);
  v1 = (void *)nullEndpoint_sObj;
  nullEndpoint_sObj = (uint64_t)v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return [(RPEndpoint *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v72 = 0;
  NSAppendPrintF();
  id v5 = 0;
  id v6 = v5;
  identifier = self->_identifier;
  if (identifier)
  {
    id v71 = v5;
    v42 = identifier;
    NSAppendPrintF();
    id v8 = v71;

    id v6 = v8;
  }
  if (shouldPrintSensitiveData())
  {
    name = self->_name;
    if (name)
    {
      v70 = v6;
      id v43 = name;
      NSAppendPrintF();
      id v10 = v6;

      id v6 = v10;
    }
    model = self->_model;
    if (model)
    {
      v69 = v6;
      id v44 = model;
      NSAppendPrintF();
      id v12 = v6;

      id v6 = v12;
    }
    accountAltDSID = self->_accountAltDSID;
    if (accountAltDSID)
    {
      v68 = v6;
      v50 = accountAltDSID;
      NSAppendPrintF();
      id v14 = v6;

      id v6 = v14;
    }
    accountID = self->_accountID;
    if (accountID)
    {
      v67 = v6;
      v51 = accountID;
      NSAppendPrintF();
      id v16 = v6;

      id v6 = v16;
    }
    if (self->_activityLevel)
    {
      v66 = v6;
      NSAppendPrintF();
      id v17 = v6;

      id v6 = v17;
    }
    if (self->_cameraState)
    {
      char v65 = v6;
      NSAppendPrintF();
      id v18 = v6;

      id v6 = v18;
    }
    homeKitUserIdentifiers = self->_homeKitUserIdentifiers;
    if (homeKitUserIdentifiers)
    {
      v64 = v6;
      v52 = homeKitUserIdentifiers;
      NSAppendPrintF();
      id v20 = v6;

      id v6 = v20;
    }
    idsDeviceIdentifier = self->_idsDeviceIdentifier;
    if (idsDeviceIdentifier)
    {
      v63 = v6;
      v53 = idsDeviceIdentifier;
      NSAppendPrintF();
      id v22 = v6;

      id v6 = v22;
    }
    contactID = self->_contactID;
    if (contactID)
    {
      v62 = v6;
      v54 = contactID;
      NSAppendPrintF();
      id v24 = v6;

      id v6 = v24;
    }
    mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
    if (mediaRemoteIdentifier)
    {
      v61 = v6;
      v55 = mediaRemoteIdentifier;
      NSAppendPrintF();
      id v26 = v6;

      id v6 = v26;
    }
    mediaRouteIdentifier = self->_mediaRouteIdentifier;
    if (mediaRouteIdentifier)
    {
      v60 = v6;
      v56 = mediaRouteIdentifier;
      NSAppendPrintF();
      id v28 = v6;

      id v6 = v28;
    }
    if (self->_operatingSystemVersion.majorVersion)
    {
      id v59 = v6;
      long long v57 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
      int64_t patchVersion = self->_operatingSystemVersion.patchVersion;
      v45 = RPNSOperatingSystemVersionToString((uint64_t *)&v57);
      NSAppendPrintF();
      id v29 = v59;

      id v6 = v29;
    }
    verifiedIdentity = self->_verifiedIdentity;
    if (verifiedIdentity)
    {
      int v46 = verifiedIdentity;
      NSAppendPrintF();
      id v31 = v6;

      id v6 = v31;
    }
    sourceVersion = self->_sourceVersion;
    if (sourceVersion)
    {
      v47 = sourceVersion;
      NSAppendPrintF();
      id v33 = v6;

      id v6 = v33;
    }
    if (self->_proximity)
    {
      NSAppendPrintF();
      id v35 = v6;

      id v6 = v35;
    }
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v48 = serviceType;
    NSAppendPrintF();
    id v37 = v6;

    id v6 = v37;
  }
  if (self->_statusFlags)
  {
    NSAppendPrintF();
    id v38 = v6;

    id v6 = v38;
  }
  if (a3 >= 20)
  {
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    if (activityLevelTimeStamp)
    {
      v49 = activityLevelTimeStamp;
      NSAppendPrintF();
      id v40 = v6;

      id v6 = v40;
    }
  }
  return v6;
}

- (unsigned)updateWithBonjourDevice:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 txtDictionary];
  objc_storeStrong((id *)&self->_bonjourDevice, a3);
  unsigned int v7 = [v5 deviceInfo];
  char Int64Ranged = CFDictionaryGetInt64Ranged();

  id v9 = self->_idsDevice;
  id v10 = self->_model;
  char v37 = Int64Ranged;
  if (v10)
  {
    unsigned int v11 = v10;
LABEL_3:
    unsigned int v12 = 0;
    goto LABEL_7;
  }
  CFStringGetTypeID();
  unsigned int v11 = CFDictionaryGetTypedValue();
  if (!v11)
  {
    unsigned int v11 = [(IDSDevice *)v9 modelIdentifier];
    if (!v11) {
      goto LABEL_3;
    }
  }
  objc_storeStrong((id *)&self->_model, v11);
  unsigned int v12 = 2;
LABEL_7:
  id v13 = [v5 name];
  id v14 = v13;
  id v38 = (void *)v6;
  if (v13)
  {
    name = self->_name;
    id v16 = v13;
    id v17 = name;
    if (v16 == v17)
    {
    }
    else
    {
      id v18 = v17;
      if (v17)
      {
        char v19 = [(NSString *)v16 isEqual:v17];

        if (v19) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_name, v14);
      v12 |= 0x10u;
    }
  }
LABEL_15:
  long long v40 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  int64_t patchVersion = self->_operatingSystemVersion.patchVersion;
  id v20 = RPNSOperatingSystemVersionToString((uint64_t *)&v40);
  if (v9)
  {
    [(IDSDevice *)v9 operatingSystemVersion];
    if (v39[3] >= 1)
    {
      [(IDSDevice *)v9 operatingSystemVersion];
      id v21 = RPNSOperatingSystemVersionToString(v39);
      id v22 = v20;
      id v23 = v21;
      if (v22 == v23)
      {

        goto LABEL_24;
      }
      id v24 = v23;
      if ((v22 == 0) == (v23 != 0))
      {
      }
      else
      {
        char v25 = [v22 isEqual:v23];

        if (v25) {
          goto LABEL_24;
        }
      }
      [(IDSDevice *)v9 operatingSystemVersion];
      *(_OWORD *)&self->_operatingSystemVersion.int64_t majorVersion = v40;
      self->_operatingSystemVersion.int64_t patchVersion = patchVersion;
      v12 |= 2u;
    }
  }
LABEL_24:
  id v26 = self->_sourceVersion;
  if (v26)
  {
    v27 = v26;
  }
  else
  {
    CFStringGetTypeID();
    uint64_t v28 = CFDictionaryGetTypedValue();
    v27 = (void *)v28;
    if (v9 && !v28)
    {
      [(IDSDevice *)v9 operatingSystemVersion];
      v27 = RPModelOSVersionToSourceVersionString();
    }
    if (v27)
    {
      objc_storeStrong((id *)&self->_sourceVersion, v27);
      v12 |= 2u;
    }
  }
  unint64_t Int64 = CFDictionaryGetInt64();
  unint64_t statusFlags = self->_statusFlags;
  int v31 = [(IDSDevice *)v9 supportsApplePay];
  uint64_t v32 = 4;
  if (v31) {
    uint64_t v32 = 8388612;
  }
  uint64x2_t v33 = (uint64x2_t)vdupq_n_s64(Int64);
  int8x16_t v34 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v33, (uint64x2_t)xmmword_1B39711A0), (int8x16_t)xmmword_1B39711D0), vandq_s8((int8x16_t)vshlq_u64(v33, (uint64x2_t)xmmword_1B39711B0), (int8x16_t)xmmword_1B39711C0));
  unint64_t v35 = *(void *)&vorr_s8(*(int8x8_t *)v34.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL)) | statusFlags & 0xFFFFFFF27EBAF7FBLL | (Int64 >> 2) & 0x800 | (4 * Int64) & 0x50000 | (Int64 << 11) & 0x400000000 | ((unint64_t)((v37 & 0x18) != 0) << 24) | v32;
  if (v35 != statusFlags)
  {
    self->_unint64_t statusFlags = v35;
    v12 |= 2u;
  }

  return v12;
}

- (BOOL)removeBonjourDevice:(id)a3
{
  bonjourDevice = self->_bonjourDevice;
  self->_bonjourDevice = 0;
  id v5 = a3;

  self->_statusFlags &= ~4uLL;
  uint64_t v6 = [v5 deviceInfo];

  LOBYTE(v5) = CFDictionaryGetInt64Ranged();
  unint64_t statusFlags = self->_statusFlags;
  if ((v5 & 0x18) != 0)
  {
    statusFlags &= ~0x1000000uLL;
    self->_unint64_t statusFlags = statusFlags;
  }
  return (statusFlags & 0x10001F) == 0;
}

- (unsigned)updateWithFamilyEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceUniqueID];
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  id v8 = v5;
  id v9 = idsDeviceIdentifier;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  id v10 = v9;
  if (v9)
  {
    char v11 = [(NSString *)v8 isEqual:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unsigned int v12 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, v6);
  unsigned int v12 = 2;
LABEL_10:

  id v13 = [v4 deviceName];
  id v14 = v13;
  if (!v13) {
    goto LABEL_18;
  }
  name = self->_name;
  id v16 = v13;
  id v17 = name;
  if (v16 == v17)
  {

    goto LABEL_18;
  }
  id v18 = v17;
  if (!v17)
  {

    goto LABEL_17;
  }
  char v19 = [(NSString *)v16 isEqual:v17];

  if ((v19 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_name, v14);
    v12 |= 0x10u;
  }
LABEL_18:

  long long v39 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  int64_t patchVersion = self->_operatingSystemVersion.patchVersion;
  id v20 = RPNSOperatingSystemVersionToString((uint64_t *)&v39);
  uint64_t v21 = [v4 productVersion];
  if (!v21) {
    goto LABEL_26;
  }
  id v22 = (void *)v21;
  id v23 = [v4 productVersion];
  id v24 = v20;
  id v25 = v23;
  if (v24 == v25)
  {

    goto LABEL_26;
  }
  id v26 = v25;
  if ((v24 == 0) == (v25 != 0))
  {

    goto LABEL_25;
  }
  char v27 = [v24 isEqual:v25];

  if ((v27 & 1) == 0)
  {
LABEL_25:
    uint64_t v28 = [v4 productVersion];
    RPStringToOperatingSystemVersion(v28, &v39);
    *(_OWORD *)&self->_operatingSystemVersion.int64_t majorVersion = v39;
    self->_operatingSystemVersion.int64_t patchVersion = patchVersion;

    v12 |= 2u;
  }
LABEL_26:
  id v29 = [v4 productVersion];
  RPStringToOperatingSystemVersion(v29, v38);
  uint64_t v30 = RPModelOSVersionToSourceVersionString();

  if (v30)
  {
    sourceVersion = self->_sourceVersion;
    p_sourceVersion = &self->_sourceVersion;
    uint64x2_t v33 = v30;
    int8x16_t v34 = sourceVersion;
    if (v33 == v34)
    {
    }
    else
    {
      unint64_t v35 = v34;
      if (v34)
      {
        char v36 = [(NSString *)v33 isEqual:v34];

        if (v36) {
          goto LABEL_34;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)p_sourceVersion, v30);
      v12 |= 2u;
    }
  }
LABEL_34:

  return v12;
}

- (unsigned)updateWithIDSDevice:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_idsDevice, a3);
  uint64_t v6 = [v5 uniqueIDOverride];
  unsigned int v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  id v9 = v6;
  id v10 = idsDeviceIdentifier;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  char v11 = v10;
  if (v10)
  {
    char v12 = [(NSString *)v9 isEqual:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unsigned int v13 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, v7);
  unsigned int v13 = 2;
LABEL_10:

  id v14 = [v5 modelIdentifier];
  id v15 = v14;
  id v16 = v15;
  if (!v14) {
    goto LABEL_18;
  }
  model = self->_model;
  id v18 = (NSString *)v15;
  char v19 = model;
  if (v18 == v19)
  {

    goto LABEL_18;
  }
  id v20 = v19;
  if (!v19)
  {

    goto LABEL_17;
  }
  char v21 = [(NSString *)v18 isEqual:v19];

  if ((v21 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_model, v14);
    unsigned int v13 = 2;
  }
LABEL_18:

  id v22 = [v5 name];
  id v23 = v22;
  if (!v22) {
    goto LABEL_26;
  }
  name = self->_name;
  id v25 = v22;
  id v26 = name;
  if (v25 == v26)
  {

    goto LABEL_26;
  }
  char v27 = v26;
  if (!v26)
  {

    goto LABEL_25;
  }
  char v28 = [(NSString *)v25 isEqual:v26];

  if ((v28 & 1) == 0)
  {
LABEL_25:
    objc_storeStrong((id *)&self->_name, v23);
    v13 |= 0x10u;
  }
LABEL_26:

  long long v47 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  int64_t patchVersion = self->_operatingSystemVersion.patchVersion;
  id v29 = RPNSOperatingSystemVersionToString((uint64_t *)&v47);
  if (!v5)
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    p_sourceVersion = &self->_sourceVersion;
    if (self->_sourceVersion || !v16) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }
  [v5 operatingSystemVersion];
  if (v44 >= 1)
  {
    [v5 operatingSystemVersion];
    uint64_t v30 = RPNSOperatingSystemVersionToString(v43);
    id v31 = v29;
    id v32 = v30;
    if (v31 == v32)
    {

      goto LABEL_38;
    }
    uint64x2_t v33 = v32;
    if ((v31 == 0) == (v32 != 0))
    {
    }
    else
    {
      char v34 = [v31 isEqual:v32];

      if (v34) {
        goto LABEL_38;
      }
    }
    [v5 operatingSystemVersion];
    *(_OWORD *)&self->_operatingSystemVersion.int64_t majorVersion = v47;
    self->_operatingSystemVersion.int64_t patchVersion = patchVersion;
    v13 |= 2u;
  }
LABEL_38:
  p_sourceVersion = &self->_sourceVersion;
  if (self->_sourceVersion || !v16) {
    goto LABEL_43;
  }
  [v5 operatingSystemVersion];
LABEL_41:
  uint64_t v36 = RPModelOSVersionToSourceVersionString();
  char v37 = *p_sourceVersion;
  *p_sourceVersion = (NSString *)v36;

  if (*p_sourceVersion) {
    v13 |= 2u;
  }
LABEL_43:
  unint64_t statusFlags = self->_statusFlags;
  int v39 = [v5 supportsApplePay];
  uint64_t v40 = 1572864;
  if (v39) {
    uint64_t v40 = 9961472;
  }
  unint64_t v41 = v40 | statusFlags;
  if (v41 != statusFlags)
  {
    self->_unint64_t statusFlags = v41;
    v13 |= 2u;
  }

  return v13;
}

- (unsigned)removeIDSDevice
{
  idsDevice = self->_idsDevice;
  self->_idsDevice = 0;

  unint64_t statusFlags = self->_statusFlags;
  if ((statusFlags & 0xFFFFFFFFFFEFFFFFLL) == statusFlags)
  {
    unsigned int v5 = 0;
  }
  else
  {
    self->_unint64_t statusFlags = statusFlags & 0xFFFFFFFFFFEFFFFFLL;
    unsigned int v5 = 2;
    LODWORD(statusFlags) = statusFlags & 0xFFEFFFFF;
  }
  if ((statusFlags & 0x10001F) != 0) {
    return v5;
  }
  else {
    return v5 | 0x200;
  }
}

- (unsigned)updateTrustStatusFlagsWithIdentity:(id)a3
{
  unint64_t statusFlags = self->_statusFlags;
  unsigned int v5 = [a3 type] - 1;
  if (v5 > 0xE) {
    return 0;
  }
  if (((0x59ABu >> v5) & 1) == 0) {
    return 0;
  }
  unint64_t v6 = statusFlags | qword_1B39713A0[v5];
  if (v6 == statusFlags) {
    return 0;
  }
  self->_unint64_t statusFlags = v6;
  return 2;
}

- (unsigned)updateWithIdentity:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (self->_identifier)
  {
    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v7 = [v4 identifier];
    if (v7)
    {
      objc_storeStrong((id *)&self->_identifier, v7);
      unsigned int v6 = 2;
    }
    else
    {
      unsigned int v6 = 0;
    }
  }
  if (!self->_idsDeviceIdentifier)
  {
    id v8 = [v5 idsDeviceID];
    if (v8)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v8);
      unsigned int v6 = 2;
    }
  }
  if (!self->_accountAltDSID)
  {
    id v9 = [v5 accountAltDSID];
    if (v9)
    {
      objc_storeStrong((id *)&self->_accountAltDSID, v9);
      v6 |= 2u;
    }
  }
  if (!self->_accountID)
  {
    id v10 = [v5 accountID];
    if (v10)
    {
      objc_storeStrong((id *)&self->_accountID, v10);
      v6 |= 2u;
    }
  }
  if (!self->_contactID)
  {
    char v11 = [v5 contactID];
    if (v11)
    {
      objc_storeStrong((id *)&self->_contactID, v11);
      v6 |= 2u;
    }
  }
  if (!self->_model)
  {
    char v12 = [v5 model];
    if (v12)
    {
      objc_storeStrong((id *)&self->_model, v12);
      v6 |= 2u;
    }
  }
  unint64_t statusFlags = self->_statusFlags;
  uint64_t v14 = statusFlags | 2;
  switch([v5 type])
  {
    case 1u:
    case 2u:
      uint64_t v15 = 524290;
      goto LABEL_36;
    case 3u:
    case 4u:
      uint64_t v15 = 16386;
      goto LABEL_36;
    case 5u:
    case 6u:
      uint64_t v15 = 131074;
      goto LABEL_36;
    case 7u:
    case 8u:
      uint64_t v15 = 32770;
      goto LABEL_36;
    case 9u:
      uint64_t v15 = 8194;
      goto LABEL_36;
    case 0xCu:
      uint64_t v15 = 0x1000000002;
      goto LABEL_36;
    case 0xDu:
      uint64_t v15 = 0x2000000002;
      goto LABEL_36;
    case 0xFu:
      uint64_t v15 = 0x4000000002;
LABEL_36:
      uint64_t v14 = statusFlags | v15;
      break;
    default:
      break;
  }
  BOOL v16 = [(NSString *)self->_model hasPrefix:@"AppleTV"];
  unint64_t v17 = v14 | 0x50800;
  if (!v16) {
    unint64_t v17 = v14;
  }
  if (v17 != statusFlags)
  {
    self->_unint64_t statusFlags = v17;
    v6 |= 2u;
  }
  if (!self->_idsDeviceIdentifier)
  {
    id v18 = [v5 idsDeviceID];
    if (v18)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v18);
      v6 |= 2u;
    }
  }
  if (!self->_mediaRemoteIdentifier)
  {
    char v19 = [v5 mediaRemoteID];
    if (v19)
    {
      objc_storeStrong((id *)&self->_mediaRemoteIdentifier, v19);
      v6 |= 2u;
    }
  }
  if (!self->_mediaRouteIdentifier)
  {
    id v20 = [v5 mediaRouteID];
    if (v20)
    {
      objc_storeStrong((id *)&self->_mediaRouteIdentifier, v20);
      v6 |= 2u;
    }
  }
  char v21 = [v5 name];
  id v22 = v21;
  if (v21)
  {
    name = self->_name;
    p_name = &self->_name;
    id v25 = v21;
    id v26 = name;
    if (v25 == v26)
    {
    }
    else
    {
      char v27 = v26;
      if (v26)
      {
        char v28 = [(NSString *)v25 isEqual:v26];

        if (v28) {
          goto LABEL_61;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)p_name, v22);
      v6 |= 0x10u;
    }
  }
LABEL_61:

  return v6;
}

- (unsigned)updateWithCBDevice:(id)a3
{
  id v5 = a3;
  unsigned int v6 = self->_cbDevice;
  objc_storeStrong((id *)&self->_cbDevice, a3);
  unsigned int v7 = [v5 bleAdvertisementData];
  id v8 = [(CBDevice *)v6 bleAdvertisementData];
  id v9 = v7;
  id v10 = v8;
  char v11 = v10;
  if (v9 == v10)
  {
    int v12 = 0;
  }
  else if ((v9 == 0) == (v10 != 0))
  {
    int v12 = 1;
  }
  else
  {
    int v12 = [v9 isEqual:v10] ^ 1;
  }

  int v13 = [v5 rssi];
  if (v13 == [(CBDevice *)v6 rssi] || v13 == 0) {
    unsigned int v15 = v12;
  }
  else {
    unsigned int v15 = v12 | 0x20;
  }

  return v15;
}

- (unsigned)updateWithEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accountAltDSID];
  unsigned int v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  accountAltDSID = self->_accountAltDSID;
  id v8 = v5;
  id v9 = accountAltDSID;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  id v10 = v9;
  if (v9)
  {
    char v11 = [(NSString *)v8 isEqual:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    int v12 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_accountAltDSID, v6);
  int v12 = 2;
LABEL_10:
  int v13 = [v4 identifier];
  uint64_t v14 = v13;
  int v48 = v12;
  if (!v13) {
    goto LABEL_18;
  }
  identifier = self->_identifier;
  BOOL v16 = v13;
  unint64_t v17 = identifier;
  if (v16 == v17)
  {

    goto LABEL_18;
  }
  id v18 = v17;
  if (!v17)
  {

    goto LABEL_17;
  }
  char v19 = [(NSString *)v16 isEqual:v17];

  if ((v19 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_identifier, v14);
    int v48 = 2;
  }
LABEL_18:
  id v20 = [v4 idsDeviceIdentifier];
  char v21 = v20;
  if (!v20) {
    goto LABEL_26;
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  id v23 = v20;
  id v24 = idsDeviceIdentifier;
  if (v23 == v24)
  {

    goto LABEL_26;
  }
  id v25 = v24;
  if (!v24)
  {

    goto LABEL_25;
  }
  char v26 = [(NSString *)v23 isEqual:v24];

  if ((v26 & 1) == 0)
  {
LABEL_25:
    objc_storeStrong((id *)&self->_idsDeviceIdentifier, v21);
    int v48 = 2;
  }
LABEL_26:
  char v27 = [v4 model];
  char v28 = v27;
  if (!v27) {
    goto LABEL_34;
  }
  id v29 = v14;
  uint64_t v30 = v6;
  model = self->_model;
  id v32 = v27;
  uint64x2_t v33 = model;
  if (v32 == v33)
  {

    uint64_t v14 = v29;
    goto LABEL_34;
  }
  char v34 = v33;
  if (!v33)
  {

    unsigned int v6 = v30;
    uint64_t v14 = v29;
    goto LABEL_33;
  }
  char v35 = [(NSString *)v32 isEqual:v33];

  unsigned int v6 = v30;
  uint64_t v14 = v29;
  if ((v35 & 1) == 0)
  {
LABEL_33:
    objc_storeStrong((id *)&self->_model, v28);
    int v48 = 2;
  }
LABEL_34:
  uint64_t v36 = [v4 name];
  char v37 = v36;
  if (!v36)
  {
LABEL_40:
    unsigned int v44 = v48;
    goto LABEL_43;
  }
  id v38 = v6;
  name = self->_name;
  uint64_t v40 = v36;
  unint64_t v41 = name;
  if (v40 == v41)
  {

    unsigned int v6 = v38;
    goto LABEL_40;
  }
  v42 = v41;
  long long v47 = v14;
  if (v41)
  {
    char v43 = [(NSString *)v40 isEqual:v41];

    if (v43)
    {
      unsigned int v6 = v38;
      uint64_t v14 = v47;
      goto LABEL_40;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->_name, v37);
  unsigned int v44 = v48 | 0x10;
  unsigned int v6 = v38;
  uint64_t v14 = v47;
LABEL_43:
  unint64_t v45 = objc_msgSend(v4, "statusFlags", v47);
  if (v45 != self->_statusFlags)
  {
    self->_unint64_t statusFlags = v45;
    v44 |= 2u;
  }
  if (v4)
  {
    [v4 operatingSystemVersion];
    if (v51 >= 1)
    {
      [v4 operatingSystemVersion];
      *(_OWORD *)&self->_operatingSystemVersion.int64_t majorVersion = v49;
      self->_operatingSystemVersion.int64_t patchVersion = v50;
      v44 |= 2u;
    }
  }

  return v44;
}

- (BOOL)removeCBDevice:(id)a3
{
  cbDevice = self->_cbDevice;
  self->_cbDevice = 0;

  unint64_t statusFlags = self->_statusFlags;
  self->_unint64_t statusFlags = statusFlags & 0xFFFFFFFFFFFFFFFDLL;
  return (statusFlags & 0x10001D) == 0;
}

- (BOOL)compareWithDeviceIdentifier:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  unsigned int v6 = (NSString *)v4;
  unsigned int v7 = identifier;
  if (v7 == v6)
  {
    char v10 = 1;
    char v11 = v6;
LABEL_24:

    goto LABEL_25;
  }
  id v8 = v7;
  if ((v6 == 0) != (v7 != 0))
  {
    char v9 = [(NSString *)v6 isEqual:v7];

    if (v9) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  char v11 = v6;
  int v13 = idsDeviceIdentifier;
  if (v13 == v11) {
    goto LABEL_16;
  }
  uint64_t v14 = v13;
  if ((v6 == 0) != (v13 != 0))
  {
    char v15 = [(NSString *)v11 isEqual:v13];

    if (v15) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  verifiedIdentity = self->_verifiedIdentity;
  char v11 = v11;
  unint64_t v17 = verifiedIdentity;
  if (v17 == v11)
  {
LABEL_16:
    char v10 = 1;
    goto LABEL_24;
  }
  id v18 = v17;
  if ((v6 == 0) == (v17 != 0))
  {

    goto LABEL_18;
  }
  char v19 = [(NSString *)v11 isEqual:v17];

  if ((v19 & 1) == 0)
  {
LABEL_18:
    id v20 = [(SFDevice *)self->_bleDevice rapportIdentifier];
    char v21 = v11;
    id v22 = v20;
    char v11 = v22;
    if (v22 == v21)
    {
      char v10 = 1;
    }
    else if ((v6 == 0) == (v22 != 0))
    {
      char v10 = 0;
    }
    else
    {
      char v10 = [(NSString *)v21 isEqual:v22];
    }

    goto LABEL_24;
  }
LABEL_15:
  char v10 = 1;
LABEL_25:

  return v10;
}

- (id)bleTargetData
{
  v3 = self->_encodedBLETargetData;
  if (!v3)
  {
    id v4 = [(RPEndpoint *)self bleDevice];
    id v5 = [v4 bleDevice];

    unsigned int v6 = [(RPEndpoint *)self cbDevice];
    unsigned int v7 = [v5 advertisementFields];
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();

    if (!v3 && v6)
    {
      v3 = [v6 nearbyInfoV2TempAuthTagData];
    }
  }
  return v3;
}

- (void)setActivityLevel:(int)a3
{
  self->_uint64_t activityLevel = a3;
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (void)setAccountAltDSID:(id)a3
{
}

- (void)setAccountID:(id)a3
{
}

- (NSDate)activityLevelTimeStamp
{
  return self->_activityLevelTimeStamp;
}

- (unsigned)cameraState
{
  return self->_cameraState;
}

- (void)setHomeKitUserIdentifiers:(id)a3
{
}

- (unsigned)hotspotInfo
{
  return self->_hotspotInfo;
}

- (void)setIdsCorrelationIdentifier:(id)a3
{
}

- (BOOL)inDiscoverySession
{
  return self->_inDiscoverySession;
}

- (void)setInDiscoverySession:(BOOL)a3
{
  self->_inDiscoverySession = a3;
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (void)setIpAddress:(id)a3
{
}

- (void)setMediaRemoteIdentifier:(id)a3
{
}

- (void)setMediaRouteIdentifier:(id)a3
{
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setOperatingSystemVersion:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_operatingSystemVersion.int64_t patchVersion = a3->var2;
  *(_OWORD *)&self->_operatingSystemVersion.int64_t majorVersion = v3;
}

- (int)proximity
{
  return self->_proximity;
}

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (void)setServiceTypes:(id)a3
{
}

- (void)setStatusFlags:(unint64_t)a3
{
  self->_unint64_t statusFlags = a3;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
}

- (NSString)verifiedIdentity
{
  return self->_verifiedIdentity;
}

- (void)setVerifiedIdentity:(id)a3
{
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSData)encodedBLETargetData
{
  return self->_encodedBLETargetData;
}

- (void)setEncodedBLETargetData:(id)a3
{
}

- (void)setBleDevice:(id)a3
{
}

- (CBDevice)cbDevice
{
  return self->_cbDevice;
}

- (void)setCbDevice:(id)a3
{
}

- (CUBonjourDevice)bonjourDevice
{
  return self->_bonjourDevice;
}

- (void)setBonjourDevice:(id)a3
{
}

- (BOOL)cameraCapabilityRequestIsActive
{
  return self->_cameraCapabilityRequestIsActive;
}

- (void)setCameraCapabilityRequestIsActive:(BOOL)a3
{
  self->_cameraCapabilityRequestIsActive = a3;
}

- (BOOL)encodeSensitiveProperties
{
  return self->_encodeSensitiveProperties;
}

- (void)setEncodeSensitiveProperties:(BOOL)a3
{
  self->_encodeSensitiveProperties = a3;
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (int)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int)a3
{
  self->_linkType = a3;
}

- (unsigned)nearbyActionV2Type
{
  return self->_nearbyActionV2Type;
}

- (void)setNearbyActionV2Type:(unsigned __int8)a3
{
  self->_nearbyActionV2Type = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (NSDictionary)verifiedAcl
{
  return self->_verifiedAcl;
}

- (void)setVerifiedAcl:(id)a3
{
}

@end