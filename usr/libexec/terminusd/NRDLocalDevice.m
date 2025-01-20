@interface NRDLocalDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSavedClassCKeysInKeychain;
- (BOOL)isEmptyPairing;
- (NRDLocalDevice)init;
- (NRDLocalDevice)initWithCoder:(id)a3;
- (NSData)localInnerIPv6AddressBytesClassC;
- (NSData)localInnerIPv6AddressBytesClassD;
- (NSData)remoteInnerIPv6AddressBytesClassC;
- (NSData)remoteInnerIPv6AddressBytesClassD;
- (NSDate)dateCreated;
- (NSDate)dateEnabled;
- (NSDate)dateRegistered;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)pairingProtocolVersion;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBluetoothMACAddress:(id)a3;
- (void)setBluetoothUUID:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateEnabled:(id)a3;
- (void)setDateRegistered:(id)a3;
- (void)setDeviceType:(unsigned __int8)a3;
- (void)setHasAuthenticatedWithIdentity:(BOOL)a3;
- (void)setHasCompletedBluetoothPairing:(BOOL)a3;
- (void)setHasConfirmedClassAKeys:(BOOL)a3;
- (void)setHasConfirmedClassCKeys:(BOOL)a3;
- (void)setHasConfirmedClassDKeys:(BOOL)a3;
- (void)setHasSavedClassCKeysInKeychain:(BOOL)a3;
- (void)setIdsDeviceID:(id)a3;
- (void)setIsAltAccountDevice:(BOOL)a3;
- (void)setIsEmptyPairing:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsRegistered:(BOOL)a3;
- (void)setLastSeenAlwaysOnWiFiSupported:(BOOL)a3;
- (void)setLastSeenBuildVersion:(id)a3;
- (void)setLastSeenInnerLinkVersionHBO:(unsigned __int16)a3;
- (void)setLastSeenName:(id)a3;
- (void)setLocalFlags:(unint64_t)a3;
- (void)setLocalIdentity:(id)a3;
- (void)setLocalInnerIPv6AddressBytesClassC:(id)a3;
- (void)setLocalInnerIPv6AddressBytesClassD:(id)a3;
- (void)setNrUUID:(id)a3;
- (void)setOperationalProp:(id)a3;
- (void)setPairingProtocolVersion:(int64_t)a3;
- (void)setReceivedProxyNotifyPayload:(id)a3;
- (void)setRemoteFlags:(unint64_t)a3;
- (void)setRemoteIdentity:(id)a3;
- (void)setRemoteInnerIPv6AddressBytesClassC:(id)a3;
- (void)setRemoteInnerIPv6AddressBytesClassD:(id)a3;
- (void)setSelfManagedBluetoothPairing:(BOOL)a3;
- (void)setWasInitiallySetupUsingIDSPairing:(BOOL)a3;
@end

@implementation NRDLocalDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteInnerIPv6AddressBytesClassC, 0);
  objc_storeStrong((id *)&self->_localInnerIPv6AddressBytesClassC, 0);
  objc_storeStrong((id *)&self->_remoteInnerIPv6AddressBytesClassD, 0);
  objc_storeStrong((id *)&self->_localInnerIPv6AddressBytesClassD, 0);
  objc_storeStrong((id *)&self->_dateEnabled, 0);
  objc_storeStrong((id *)&self->_dateRegistered, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_outOfBandKeychainItem, 0);
  objc_storeStrong((id *)&self->_operationalProp, 0);
  objc_storeStrong((id *)&self->_lastSeenBuildVersion, 0);
  objc_storeStrong((id *)&self->_lastSeenName, 0);
  objc_storeStrong((id *)&self->_bluetoothMACAddress, 0);
  objc_storeStrong((id *)&self->_receivedProxyNotifyPayload, 0);
  objc_storeStrong((id *)&self->_classAKeychainItemsLegacyOnly, 0);
  objc_storeStrong((id *)&self->_classCKeychainItems, 0);
  objc_storeStrong((id *)&self->_classDKeychainItems, 0);
  objc_storeStrong((id *)&self->_remoteIdentity, 0);
  objc_storeStrong((id *)&self->_localIdentity, 0);
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);

  objc_storeStrong((id *)&self->_nrUUID, 0);
}

- (void)setRemoteInnerIPv6AddressBytesClassC:(id)a3
{
}

- (NSData)remoteInnerIPv6AddressBytesClassC
{
  return self->_remoteInnerIPv6AddressBytesClassC;
}

- (void)setLocalInnerIPv6AddressBytesClassC:(id)a3
{
}

- (NSData)localInnerIPv6AddressBytesClassC
{
  return self->_localInnerIPv6AddressBytesClassC;
}

- (void)setRemoteInnerIPv6AddressBytesClassD:(id)a3
{
}

- (NSData)remoteInnerIPv6AddressBytesClassD
{
  return self->_remoteInnerIPv6AddressBytesClassD;
}

- (void)setLocalInnerIPv6AddressBytesClassD:(id)a3
{
}

- (NSData)localInnerIPv6AddressBytesClassD
{
  return self->_localInnerIPv6AddressBytesClassD;
}

- (void)setHasSavedClassCKeysInKeychain:(BOOL)a3
{
  self->_hasSavedClassCKeysInKeychain = a3;
}

- (BOOL)hasSavedClassCKeysInKeychain
{
  return self->_hasSavedClassCKeysInKeychain;
}

- (void)setDateEnabled:(id)a3
{
}

- (NSDate)dateEnabled
{
  return self->_dateEnabled;
}

- (void)setDateRegistered:(id)a3
{
}

- (NSDate)dateRegistered
{
  return self->_dateRegistered;
}

- (void)setDateCreated:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setPairingProtocolVersion:(int64_t)a3
{
  self->_pairingProtocolVersion = a3;
}

- (int64_t)pairingProtocolVersion
{
  return self->_pairingProtocolVersion;
}

- (BOOL)isEmptyPairing
{
  return self->_isEmptyPairing;
}

- (void)setSelfManagedBluetoothPairing:(BOOL)a3
{
  self->_selfManagedBluetoothPairing = a3;
}

- (void)setRemoteFlags:(unint64_t)a3
{
  self->_remoteFlags = a3;
}

- (void)setLocalFlags:(unint64_t)a3
{
  self->_localFlags = a3;
}

- (void)setOperationalProp:(id)a3
{
}

- (void)setDeviceType:(unsigned __int8)a3
{
  self->_deviceType = a3;
}

- (void)setLastSeenAlwaysOnWiFiSupported:(BOOL)a3
{
  self->_lastSeenAlwaysOnWiFiSupported = a3;
}

- (void)setLastSeenBuildVersion:(id)a3
{
}

- (void)setLastSeenName:(id)a3
{
}

- (void)setLastSeenInnerLinkVersionHBO:(unsigned __int16)a3
{
  self->_lastSeenInnerLinkVersionHBO = a3;
}

- (void)setIsAltAccountDevice:(BOOL)a3
{
  self->_isAltAccountDevice = a3;
}

- (void)setWasInitiallySetupUsingIDSPairing:(BOOL)a3
{
  self->_wasInitiallySetupUsingIDSPairing = a3;
}

- (void)setBluetoothMACAddress:(id)a3
{
}

- (void)setReceivedProxyNotifyPayload:(id)a3
{
}

- (void)setHasConfirmedClassAKeys:(BOOL)a3
{
  self->_hasConfirmedClassAKeys = a3;
}

- (void)setHasConfirmedClassCKeys:(BOOL)a3
{
  self->_hasConfirmedClassCKeys = a3;
}

- (void)setHasConfirmedClassDKeys:(BOOL)a3
{
  self->_hasConfirmedClassDKeys = a3;
}

- (void)setHasAuthenticatedWithIdentity:(BOOL)a3
{
  self->_hasAuthenticatedWithIdentity = a3;
}

- (void)setRemoteIdentity:(id)a3
{
}

- (void)setLocalIdentity:(id)a3
{
}

- (void)setHasCompletedBluetoothPairing:(BOOL)a3
{
  self->_hasCompletedBluetoothPairing = a3;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void)setIsRegistered:(BOOL)a3
{
  self->_isRegistered = a3;
}

- (void)setIdsDeviceID:(id)a3
{
}

- (void)setBluetoothUUID:(id)a3
{
}

- (void)setNrUUID:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  if (self)
  {
    [v18 encodeObject:self->_nrUUID forKey:@"nrUUID"];
    [v18 encodeObject:self->_bluetoothUUID forKey:@"bluetoothUUID"];
    idsDeviceID = self->_idsDeviceID;
  }
  else
  {
    [v18 encodeObject:0 forKey:@"nrUUID"];
    [v18 encodeObject:0 forKey:@"bluetoothUUID"];
    idsDeviceID = 0;
  }
  [v18 encodeObject:idsDeviceID forKey:@"idsDeviceID"];
  v6 = [(NRDLocalDevice *)self dateCreated];
  [v18 encodeObject:v6 forKey:@"dateCreated"];

  [v18 encodeBool:-[NRDLocalDevice isEmptyPairing](self, "isEmptyPairing") forKey:@"isEmptyPairing"];
  if (![(NRDLocalDevice *)self isEmptyPairing])
  {
    if (self)
    {
      [v18 encodeBool:self->_isRegistered forKey:@"isRegistered"];
      BOOL isEnabled = self->_isEnabled;
    }
    else
    {
      [v18 encodeBool:0 forKey:@"isRegistered"];
      BOOL isEnabled = 0;
    }
    [v18 encodeBool:isEnabled forKey:@"isEnabled"];
    [v18 encodeInt64:-[NRDLocalDevice pairingProtocolVersion](self, "pairingProtocolVersion") forKey:@"pairingProtocolVersion"];
    if (self)
    {
      [v18 encodeInt32:self->_lastSeenInnerLinkVersionHBO forKey:@"lastSeenInnerLinkVersionHBO"];
      [v18 encodeObject:self->_lastSeenName forKey:@"lastSeenName"];
      [v18 encodeObject:self->_lastSeenBuildVersion forKey:@"lastSeenBuildVersion"];
      [v18 encodeBool:self->_wasInitiallySetupUsingIDSPairing forKey:@"wasInitiallySetupUsingIDSPairing"];
      [v18 encodeBool:self->_isAltAccountDevice forKey:@"isAltAccountDevice"];
      BOOL lastSeenAlwaysOnWiFiSupported = self->_lastSeenAlwaysOnWiFiSupported;
    }
    else
    {
      [v18 encodeInt32:0 forKey:@"lastSeenInnerLinkVersionHBO"];
      [v18 encodeObject:0 forKey:@"lastSeenName"];
      [v18 encodeObject:0 forKey:@"lastSeenBuildVersion"];
      [v18 encodeBool:0 forKey:@"wasInitiallySetupUsingIDSPairing"];
      [v18 encodeBool:0 forKey:@"isAltAccountDevice"];
      BOOL lastSeenAlwaysOnWiFiSupported = 0;
    }
    [v18 encodeBool:lastSeenAlwaysOnWiFiSupported forKey:@"lastSeenAlwaysOnWiFiSupported"];
    v9 = [(NRDLocalDevice *)self dateRegistered];
    [v18 encodeObject:v9 forKey:@"dateRegistered"];

    v10 = [(NRDLocalDevice *)self dateEnabled];
    [v18 encodeObject:v10 forKey:@"dateEnabled"];

    if (self)
    {
      [v18 encodeObject:self->_localIdentity forKey:@"localIdentity"];
      [v18 encodeObject:self->_remoteIdentity forKey:@"remoteIdentity"];
      [v18 encodeBool:self->_hasAuthenticatedWithIdentity forKey:@"hasAuthenticatedWithIdentity"];
      [v18 encodeBool:self->_hasConfirmedClassDKeys forKey:@"hasConfirmedClassDKeys"];
      [v18 encodeBool:self->_hasConfirmedClassCKeys forKey:@"hasConfirmedClassCKeys"];
      BOOL hasConfirmedClassAKeys = self->_hasConfirmedClassAKeys;
    }
    else
    {
      [v18 encodeObject:0 forKey:@"localIdentity"];
      [v18 encodeObject:0 forKey:@"remoteIdentity"];
      [v18 encodeBool:0 forKey:@"hasAuthenticatedWithIdentity"];
      [v18 encodeBool:0 forKey:@"hasConfirmedClassDKeys"];
      [v18 encodeBool:0 forKey:@"hasConfirmedClassCKeys"];
      BOOL hasConfirmedClassAKeys = 0;
    }
    [v18 encodeBool:hasConfirmedClassAKeys forKey:@"hasConfirmedClassAKeys"];
    [v18 encodeBool:-[NRDLocalDevice hasSavedClassCKeysInKeychain](self, "hasSavedClassCKeysInKeychain") forKey:@"hasSavedClassCKeysInKeychain"];
    if (self)
    {
      [v18 encodeInt32:self->_deviceType forKey:@"deviceType"];
      [v18 encodeObject:self->_operationalProp forKey:@"operationalProp"];
      [v18 encodeInt64:self->_localFlags forKey:@"localFlags"];
      [v18 encodeInt64:self->_remoteFlags forKey:@"remoteFlags"];
      bluetoothMACAddress = self->_bluetoothMACAddress;
    }
    else
    {
      [v18 encodeInt32:0 forKey:@"deviceType"];
      [v18 encodeObject:0 forKey:@"operationalProp"];
      [v18 encodeInt64:0 forKey:@"localFlags"];
      [v18 encodeInt64:0 forKey:@"remoteFlags"];
      bluetoothMACAddress = 0;
    }
    [v18 encodeObject:bluetoothMACAddress forKey:@"bluetoothMACAddress"];
    v13 = [(NRDLocalDevice *)self localInnerIPv6AddressBytesClassD];
    [v18 encodeObject:v13 forKey:@"localInnerIPv6AddressBytesClassD"];

    v14 = [(NRDLocalDevice *)self remoteInnerIPv6AddressBytesClassD];
    [v18 encodeObject:v14 forKey:@"remoteInnerIPv6AddressBytesClassD"];

    v15 = [(NRDLocalDevice *)self localInnerIPv6AddressBytesClassC];
    [v18 encodeObject:v15 forKey:@"localInnerIPv6AddressBytesClassC"];

    v16 = [(NRDLocalDevice *)self remoteInnerIPv6AddressBytesClassC];
    [v18 encodeObject:v16 forKey:@"remoteInnerIPv6AddressBytesClassC"];

    if (self) {
      receivedProxyNotifyPayload = self->_receivedProxyNotifyPayload;
    }
    else {
      receivedProxyNotifyPayload = 0;
    }
    [v18 encodeObject:receivedProxyNotifyPayload forKey:@"receivedProxyNotifyPayload"];
  }
}

- (NRDLocalDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nrUUID"];
  if (!v6)
  {
    id v62 = sub_100135DDC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v64 = sub_100135DDC();
      _NRLogWithArgs();
    }
    v11 = 0;
    goto LABEL_6;
  }
  v7 = sub_100137298((char *)self, v6);
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothUUID"];
  [v7 setBluetoothUUID:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsDeviceID"];
  [v7 setIdsDeviceID:v9];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateCreated"];
  [v7 setDateCreated:v10];

  [v7 setIsEmptyPairing:[v4 decodeBoolForKey:@"isEmptyPairing"]];
  if ([v7 isEmptyPairing])
  {
    if (v7) {
      v7[21] = 0;
    }
    self = v7;
    v11 = self;
LABEL_6:

    goto LABEL_62;
  }
  [v7 setIsRegistered:[v4 decodeBoolForKey:@"isRegistered"]];
  [v7 setIsEnabled:[v4 decodeBoolForKey:@"isEnabled"]];
  [v7 setPairingProtocolVersion:[v4 decodeInt64ForKey:@"pairingProtocolVersion"]];
  [v7 setLastSeenInnerLinkVersionHBO:(unsigned __int16)[v4 decodeInt32ForKey:@"lastSeenInnerLinkVersionHBO"]];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSeenName"];
  [v7 setLastSeenName:v12];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSeenBuildVersion"];
  [v7 setLastSeenBuildVersion:v13];

  [v7 setWasInitiallySetupUsingIDSPairing:[v4 decodeBoolForKey:@"wasInitiallySetupUsingIDSPairing"]];
  [v7 setIsAltAccountDevice:[v4 decodeBoolForKey:@"isAltAccountDevice"]];
  [v7 setLastSeenAlwaysOnWiFiSupported:[v4 decodeBoolForKey:@"lastSeenAlwaysOnWiFiSupported"]];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateRegistered"];
  [v7 setDateRegistered:v14];

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateEnabled"];
  [v7 setDateEnabled:v15];

  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localIdentity"];
  [v7 setLocalIdentity:v16];

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteIdentity"];
  [v7 setRemoteIdentity:v17];

  [v7 setHasAuthenticatedWithIdentity:[v4 decodeBoolForKey:@"hasAuthenticatedWithIdentity"]];
  [v7 setHasConfirmedClassDKeys:[v4 decodeBoolForKey:@"hasConfirmedClassDKeys"]];
  [v7 setHasConfirmedClassCKeys:[v4 decodeBoolForKey:@"hasConfirmedClassCKeys"]];
  [v7 setHasConfirmedClassAKeys:[v4 decodeBoolForKey:@"hasConfirmedClassAKeys"]];
  [v7 setHasSavedClassCKeysInKeychain:[v4 decodeBoolForKey:@"hasSavedClassCKeysInKeychain"]];
  [v7 setDeviceType:[v4 decodeInt32ForKey:@"deviceType"]];
  id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationalProp"];
  [v7 setOperationalProp:v18];

  [v7 setLocalFlags:[v4 decodeInt64ForKey:@"localFlags"]];
  [v7 setRemoteFlags:[v4 decodeInt64ForKey:@"remoteFlags"]];
  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothMACAddress"];
  v20 = v19;
  if (v19)
  {
    id v21 = v19;
    id v22 = [v21 length];
    if (v22) {
      id v23 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v21 bytes], v22);
    }
    else {
      id v23 = objc_alloc_init((Class)NSData);
    }
    v24 = v23;

    [v7 setBluetoothMACAddress:v24];
  }
  else
  {
    [v7 setBluetoothMACAddress:0];
  }

  v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localInnerIPv6AddressBytesClassD"];
  v26 = v25;
  if (v25)
  {
    id v27 = v25;
    id v28 = [v27 length];
    if (v28) {
      id v29 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v27 bytes], v28);
    }
    else {
      id v29 = objc_alloc_init((Class)NSData);
    }
    v30 = v29;

    [v7 setLocalInnerIPv6AddressBytesClassD:v30];
  }
  else
  {
    [v7 setLocalInnerIPv6AddressBytesClassD:0];
  }

  v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteInnerIPv6AddressBytesClassD"];
  v32 = v31;
  if (v31)
  {
    id v33 = v31;
    id v34 = [v33 length];
    if (v34) {
      id v35 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v33 bytes], v34);
    }
    else {
      id v35 = objc_alloc_init((Class)NSData);
    }
    v36 = v35;

    [v7 setRemoteInnerIPv6AddressBytesClassD:v36];
  }
  else
  {
    [v7 setRemoteInnerIPv6AddressBytesClassD:0];
  }

  v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localInnerIPv6AddressBytesClassC"];
  v38 = v37;
  if (v37)
  {
    id v39 = v37;
    id v40 = [v39 length];
    if (v40) {
      id v41 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v39 bytes], v40);
    }
    else {
      id v41 = objc_alloc_init((Class)NSData);
    }
    v42 = v41;

    [v7 setLocalInnerIPv6AddressBytesClassC:v42];
  }
  else
  {
    [v7 setLocalInnerIPv6AddressBytesClassC:0];
  }

  v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteInnerIPv6AddressBytesClassC"];
  v44 = v43;
  if (v43)
  {
    id v45 = v43;
    id v46 = [v45 length];
    if (v46) {
      id v47 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v45 bytes], v46);
    }
    else {
      id v47 = objc_alloc_init((Class)NSData);
    }
    v48 = v47;

    [v7 setRemoteInnerIPv6AddressBytesClassC:v48];
  }
  else
  {
    [v7 setRemoteInnerIPv6AddressBytesClassC:0];
  }

  v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receivedProxyNotifyPayload"];
  v50 = v49;
  if (v49)
  {
    id v51 = v49;
    id v52 = [v51 length];
    if (v52) {
      id v53 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v51 bytes], v52);
    }
    else {
      id v53 = objc_alloc_init((Class)NSData);
    }
    v54 = v53;

    [v7 setReceivedProxyNotifyPayload:v54];
  }
  else
  {
    [v7 setReceivedProxyNotifyPayload:0];
  }

  v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classDKeys"];
  if (v55)
  {
    if (qword_1001F4DA0 != -1) {
      dispatch_once(&qword_1001F4DA0, &stru_1001C87F8);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4DA0 != -1) {
        dispatch_once(&qword_1001F4DA0, &stru_1001C87F8);
      }
      _NRLogWithArgs();
    }
    v56 = sub_100137480([NRDLDDataClassKeychainItems alloc], v55);
    if (v7)
    {
      v57 = (void *)*((void *)v7 + 9);
      *((void *)v7 + 9) = v56;

      v7[21] = 1;
    }
    else
    {
    }
  }
  v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outOfBandKey"];
  if (v58)
  {
    if (qword_1001F4DA0 != -1) {
      dispatch_once(&qword_1001F4DA0, &stru_1001C87F8);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4DA0 != -1) {
        dispatch_once(&qword_1001F4DA0, &stru_1001C87F8);
      }
      _NRLogWithArgs();
    }
    v59 = sub_100137880((char *)[NRDLDKeychainItemData alloc], v58);
    if (v7)
    {
      v60 = (void *)*((void *)v7 + 19);
      *((void *)v7 + 19) = v59;

      v7[21] = 1;
    }
    else
    {
    }
  }
  sub_100137A5C(v7);

  self = v7;
  v11 = self;
LABEL_62:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = (char *)[(id)objc_opt_class() allocWithZone:a3];
  if (self)
  {
    v7 = sub_100137298(v6, self->_nrUUID);
    if (v7) {
      goto LABEL_3;
    }
LABEL_31:
    id v57 = sub_100135DDC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    self = (NRDLocalDevice *)"-[NRDLocalDevice copyWithZone:]";
    if (IsLevelEnabled)
    {
      id v59 = sub_100135DDC();
      _NRLogWithArgs();
    }
    v5 = (void *)_os_log_pack_size();
    v8 = (char *)&v70 - (((unint64_t)v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    __error();
    uint64_t v60 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v60 = 136446210;
    *(void *)(v60 + 4) = "-[NRDLocalDevice copyWithZone:]";
    sub_100135DDC();
    _NRLogAbortWithPack();
    goto LABEL_34;
  }
  v7 = sub_100137298(v6, 0);
  if (!v7) {
    goto LABEL_31;
  }
LABEL_3:
  v8 = v7;
  if (self)
  {
    id v9 = [(NSUUID *)self->_bluetoothUUID copy];
    [v8 setBluetoothUUID:v9];

    idsDeviceID = self->_idsDeviceID;
    goto LABEL_5;
  }
LABEL_34:
  id v61 = [0 copy];
  [v8 setBluetoothUUID:v61];

  idsDeviceID = 0;
LABEL_5:
  id v11 = [(NSString *)idsDeviceID copy];
  [v8 setIdsDeviceID:v11];

  v12 = [(NRDLocalDevice *)self dateCreated];
  id v13 = [v12 copy];
  [v8 setDateCreated:v13];

  [v8 setIsEmptyPairing:-[NRDLocalDevice isEmptyPairing](self, "isEmptyPairing")];
  if (self)
  {
    v8[24] = self->_isEphemeral;
    if ([v8 isEmptyPairing])
    {
      BOOL isChanged = self->_isChanged;
LABEL_8:
      v8[21] = isChanged;
      goto LABEL_29;
    }
    [v8 setIsRegistered:self->_isRegistered];
    BOOL isEnabled = self->_isEnabled;
  }
  else
  {
    v8[24] = 0;
    unsigned __int8 v62 = [v8 isEmptyPairing];
    BOOL isChanged = 0;
    if (v62) {
      goto LABEL_8;
    }
    [v8 setIsRegistered:0];
    BOOL isEnabled = 0;
  }
  [v8 setIsEnabled:isEnabled];
  [v8 setPairingProtocolVersion:-[NRDLocalDevice pairingProtocolVersion](self, "pairingProtocolVersion")];
  if (self)
  {
    [v8 setLastSeenInnerLinkVersionHBO:self->_lastSeenInnerLinkVersionHBO];
    lastSeenName = self->_lastSeenName;
  }
  else
  {
    [v8 setLastSeenInnerLinkVersionHBO:0];
    lastSeenName = 0;
  }
  id v17 = [(NSString *)lastSeenName copy];
  [v8 setLastSeenName:v17];

  if (self)
  {
    id v18 = [(NSString *)self->_lastSeenBuildVersion copy];
    [v8 setLastSeenBuildVersion:v18];

    [v8 setWasInitiallySetupUsingIDSPairing:self->_wasInitiallySetupUsingIDSPairing];
    [v8 setIsAltAccountDevice:self->_isAltAccountDevice];
    BOOL lastSeenAlwaysOnWiFiSupported = self->_lastSeenAlwaysOnWiFiSupported;
  }
  else
  {
    id v63 = [0 copy];
    [v8 setLastSeenBuildVersion:v63];

    [v8 setWasInitiallySetupUsingIDSPairing:0];
    [v8 setIsAltAccountDevice:0];
    BOOL lastSeenAlwaysOnWiFiSupported = 0;
  }
  [v8 setLastSeenAlwaysOnWiFiSupported:lastSeenAlwaysOnWiFiSupported];
  v20 = [(NRDLocalDevice *)self dateRegistered];
  id v21 = [v20 copy];
  [v8 setDateRegistered:v21];

  id v22 = [(NRDLocalDevice *)self dateEnabled];
  id v23 = [v22 copy];
  [v8 setDateEnabled:v23];

  if (self)
  {
    id v24 = [(NSUUID *)self->_localIdentity copy];
    [v8 setLocalIdentity:v24];

    remoteIdentity = self->_remoteIdentity;
  }
  else
  {
    id v64 = [0 copy];
    [v8 setLocalIdentity:v64];

    remoteIdentity = 0;
  }
  id v26 = [(NRDDeviceIdentity *)remoteIdentity copy];
  [v8 setRemoteIdentity:v26];

  if (self)
  {
    [v8 setHasAuthenticatedWithIdentity:self->_hasAuthenticatedWithIdentity];
    classDKeychainItems = self->_classDKeychainItems;
  }
  else
  {
    [v8 setHasAuthenticatedWithIdentity:0];
    classDKeychainItems = 0;
  }
  id v28 = classDKeychainItems;
  id v29 = [(NRDLDDataClassKeychainItems *)v28 copy];
  v30 = (void *)*((void *)v8 + 9);
  *((void *)v8 + 9) = v29;

  if (self)
  {
    v31 = self->_classCKeychainItems;
    id v32 = [(NRDLDDataClassKeychainItems *)v31 copy];
    id v33 = (void *)*((void *)v8 + 10);
    *((void *)v8 + 10) = v32;

    classAKeychainItemsLegacyOnly = self->_classAKeychainItemsLegacyOnly;
  }
  else
  {
    id v65 = [0 copy];
    v66 = (void *)*((void *)v8 + 10);
    *((void *)v8 + 10) = v65;

    classAKeychainItemsLegacyOnly = 0;
  }
  id v35 = classAKeychainItemsLegacyOnly;
  id v36 = [(NRDLDDataClassKeychainItems *)v35 copy];
  v37 = (void *)*((void *)v8 + 11);
  *((void *)v8 + 11) = v36;

  if (self)
  {
    v38 = self->_outOfBandKeychainItem;
    id v39 = [(NRDLDKeychainItemData *)v38 copy];
    id v40 = (void *)*((void *)v8 + 19);
    *((void *)v8 + 19) = v39;

    [v8 setHasConfirmedClassDKeys:self->_hasConfirmedClassDKeys];
    [v8 setHasConfirmedClassCKeys:self->_hasConfirmedClassCKeys];
    BOOL hasConfirmedClassAKeys = self->_hasConfirmedClassAKeys;
  }
  else
  {
    id v67 = [0 copy];
    v68 = (void *)*((void *)v8 + 19);
    *((void *)v8 + 19) = v67;

    [v8 setHasConfirmedClassDKeys:0];
    [v8 setHasConfirmedClassCKeys:0];
    BOOL hasConfirmedClassAKeys = 0;
  }
  [v8 setHasConfirmedClassAKeys:hasConfirmedClassAKeys];
  [v8 setHasSavedClassCKeysInKeychain:-[NRDLocalDevice hasSavedClassCKeysInKeychain](self, "hasSavedClassCKeysInKeychain")];
  if (self)
  {
    [v8 setDeviceType:self->_deviceType];
    operationalProp = self->_operationalProp;
  }
  else
  {
    [v8 setDeviceType:0];
    operationalProp = 0;
  }
  id v43 = [(NRDeviceOperationalProperties *)operationalProp copy];
  [v8 setOperationalProp:v43];

  if (self)
  {
    [v8 setLocalFlags:self->_localFlags];
    [v8 setRemoteFlags:self->_remoteFlags];
    bluetoothMACAddress = self->_bluetoothMACAddress;
  }
  else
  {
    [v8 setLocalFlags:0];
    [v8 setRemoteFlags:0];
    bluetoothMACAddress = 0;
  }
  id v45 = [(NSData *)bluetoothMACAddress copy];
  [v8 setBluetoothMACAddress:v45];

  id v46 = [(NRDLocalDevice *)self localInnerIPv6AddressBytesClassD];
  id v47 = [v46 copy];
  [v8 setLocalInnerIPv6AddressBytesClassD:v47];

  v48 = [(NRDLocalDevice *)self remoteInnerIPv6AddressBytesClassD];
  id v49 = [v48 copy];
  [v8 setRemoteInnerIPv6AddressBytesClassD:v49];

  v50 = [(NRDLocalDevice *)self localInnerIPv6AddressBytesClassC];
  id v51 = [v50 copy];
  [v8 setLocalInnerIPv6AddressBytesClassC:v51];

  id v52 = [(NRDLocalDevice *)self remoteInnerIPv6AddressBytesClassC];
  id v53 = [v52 copy];
  [v8 setRemoteInnerIPv6AddressBytesClassC:v53];

  if (self)
  {
    id v54 = [(NSData *)self->_receivedProxyNotifyPayload copy];
    [v8 setReceivedProxyNotifyPayload:v54];

    BOOL v55 = self->_isChanged;
  }
  else
  {
    id v69 = [0 copy];
    [v8 setReceivedProxyNotifyPayload:v69];

    BOOL v55 = 0;
  }
  v8[21] = v55;
  sub_100137A5C(v8);
LABEL_29:
  return v8;
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"NRDLD["];
  if ([(NRDLocalDevice *)self isEmptyPairing]) {
    [v3 appendString:@"empty pairing:"];
  }
  if (self)
  {
    id v4 = [(NSUUID *)self->_nrUUID UUIDString];
    [v3 appendString:v4];

    if (self->_isRegistered) {
      [v3 appendString:@", R"];
    }
    if (self->_isEphemeral) {
      [v3 appendString:@", Epml"];
    }
    if (self->_isEnabled) {
      [v3 appendString:@", E"];
    }
    if (self->_wasInitiallySetupUsingIDSPairing) {
      [v3 appendString:@", IDS"];
    }
    bluetoothUUID = self->_bluetoothUUID;
    if (bluetoothUUID)
    {
      v6 = [(NSUUID *)bluetoothUUID UUIDString];
      [v3 appendFormat:@", BT<%@>", v6];
    }
    if (self->_idsDeviceID) {
      [v3 appendFormat:@", IDSDeviceID<%@>", self->_idsDeviceID];
    }
    if (self->_isAltAccountDevice) {
      [v3 appendFormat:@", ALT-ACC"];
    }
  }
  else
  {
    v8 = [0 UUIDString];
    [v3 appendString:v8];
  }
  [v3 appendString:@"]"];

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v15 = a5;
  v7 = sub_10015BD9C();
  dispatch_assert_queue_V2(v7);

  v8 = [v15 objectForKeyedSubscript:NSKeyValueChangeOldKey];
  id v9 = +[NSNull null];
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {

    v8 = 0;
  }
  id v11 = [v15 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  v12 = +[NSNull null];
  unsigned int v13 = [v11 isEqual:v12];

  if (v13)
  {

    id v11 = 0;
  }
  if (v8 != v11)
  {
    unsigned __int8 v14 = [v8 isEqual:v11];
    if (self)
    {
      if ((v14 & 1) == 0) {
        self->_BOOL isChanged = 1;
      }
    }
  }
}

- (void)dealloc
{
  sub_1001391D0(self);
  v3.receiver = self;
  v3.super_class = (Class)NRDLocalDevice;
  [(NRDLocalDevice *)&v3 dealloc];
}

- (void)setIsEmptyPairing:(BOOL)a3
{
  if (self->_isEmptyPairing != a3)
  {
    self->_isEmptyPairing = a3;
    if (a3) {
      sub_1001391D0(self);
    }
    else {
      sub_100137A5C(self);
    }
  }
}

- (NRDLocalDevice)init
{
  v2 = (NRDLocalDevice *)sub_100139440(self);
  sub_100137A5C(v2);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end