@interface NRDeviceOperationalProperties
+ (BOOL)supportsSecureCoding;
+ (id)copyPropertiesForDefaultPairedPhone;
+ (id)copyPropertiesForDefaultPairedWatch;
- (BOOL)allowsDeadPeerDetection;
- (BOOL)allowsDeviceDiscovery;
- (BOOL)allowsDirectToCloud;
- (BOOL)allowsPermittedClientsOnly;
- (BOOL)handlesLinkRecommendations;
- (BOOL)hasCompanionDatapath;
- (BOOL)hasPoliciesForProxyCriteria;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReachableOverWiFi;
- (BOOL)providesPhoneCallRelaySupport;
- (BOOL)proxyProviderRequiresWiFi;
- (BOOL)requiresReachability;
- (BOOL)usesTLS;
- (NRDeviceOperationalProperties)init;
- (NRDeviceOperationalProperties)initWithCoder:(id)a3;
- (NRDeviceProxyProviderCriteria)proxyProviderCriteria;
- (NSArray)allowedLinkSubtypes;
- (NSArray)allowedLinkTypes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)activeOperationalScope;
- (unint64_t)bluetoothEndpointType;
- (unint64_t)bluetoothRole;
- (unint64_t)operationalScope;
- (unint64_t)proxyCapability;
- (unsigned)allowedPeerDeviceType;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)mergeProperties:(id)a3;
- (void)setActiveOperationalScope:(unint64_t)a3;
- (void)setAllowedLinkSubtypes:(id)a3;
- (void)setAllowedLinkTypes:(id)a3;
- (void)setAllowedPeerDeviceType:(unsigned __int8)a3;
- (void)setAllowsDeadPeerDetection:(BOOL)a3;
- (void)setAllowsDeviceDiscovery:(BOOL)a3;
- (void)setAllowsDirectToCloud:(BOOL)a3;
- (void)setAllowsPermittedClientsOnly:(BOOL)a3;
- (void)setBluetoothEndpointType:(unint64_t)a3;
- (void)setBluetoothRole:(unint64_t)a3;
- (void)setHandlesLinkRecommendations:(BOOL)a3;
- (void)setIsReachableOverWiFi:(BOOL)a3;
- (void)setOperationalScope:(unint64_t)a3;
- (void)setProvidesPhoneCallRelaySupport:(BOOL)a3;
- (void)setProxyCapability:(unint64_t)a3;
- (void)setProxyProviderCriteria:(id)a3;
- (void)setProxyProviderRequiresWiFi:(BOOL)a3;
- (void)setRequiresReachability:(BOOL)a3;
- (void)setUsesTLS:(BOOL)a3;
- (void)setVersion:(unsigned __int16)a3;
@end

@implementation NRDeviceOperationalProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedLinkSubtypes, 0);
  objc_storeStrong((id *)&self->_allowedLinkTypes, 0);
  objc_storeStrong((id *)&self->_proxyProviderCriteria, 0);
}

- (void)setActiveOperationalScope:(unint64_t)a3
{
  self->_activeOperationalScope = a3;
}

- (unint64_t)activeOperationalScope
{
  return self->_activeOperationalScope;
}

- (void)setOperationalScope:(unint64_t)a3
{
  self->_operationalScope = a3;
}

- (unint64_t)operationalScope
{
  return self->_operationalScope;
}

- (void)setAllowedPeerDeviceType:(unsigned __int8)a3
{
  self->_allowedPeerDeviceType = a3;
}

- (unsigned)allowedPeerDeviceType
{
  return self->_allowedPeerDeviceType;
}

- (void)setAllowsDeadPeerDetection:(BOOL)a3
{
  self->_allowsDeadPeerDetection = a3;
}

- (BOOL)allowsDeadPeerDetection
{
  return self->_allowsDeadPeerDetection;
}

- (void)setAllowsDeviceDiscovery:(BOOL)a3
{
  self->_allowsDeviceDiscovery = a3;
}

- (BOOL)allowsDeviceDiscovery
{
  return self->_allowsDeviceDiscovery;
}

- (void)setAllowsDirectToCloud:(BOOL)a3
{
  self->_allowsDirectToCloud = a3;
}

- (BOOL)allowsDirectToCloud
{
  return self->_allowsDirectToCloud;
}

- (void)setAllowsPermittedClientsOnly:(BOOL)a3
{
  self->_allowsPermittedClientsOnly = a3;
}

- (BOOL)allowsPermittedClientsOnly
{
  return self->_allowsPermittedClientsOnly;
}

- (void)setHandlesLinkRecommendations:(BOOL)a3
{
  self->_handlesLinkRecommendations = a3;
}

- (BOOL)handlesLinkRecommendations
{
  return self->_handlesLinkRecommendations;
}

- (void)setIsReachableOverWiFi:(BOOL)a3
{
  self->_isReachableOverWiFi = a3;
}

- (BOOL)isReachableOverWiFi
{
  return self->_isReachableOverWiFi;
}

- (void)setProvidesPhoneCallRelaySupport:(BOOL)a3
{
  self->_providesPhoneCallRelaySupport = a3;
}

- (BOOL)providesPhoneCallRelaySupport
{
  return self->_providesPhoneCallRelaySupport;
}

- (void)setVersion:(unsigned __int16)a3
{
  self->_version = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setUsesTLS:(BOOL)a3
{
  self->_usesTLS = a3;
}

- (BOOL)usesTLS
{
  return self->_usesTLS;
}

- (void)setProxyProviderRequiresWiFi:(BOOL)a3
{
  self->_proxyProviderRequiresWiFi = a3;
}

- (BOOL)proxyProviderRequiresWiFi
{
  return self->_proxyProviderRequiresWiFi;
}

- (void)setRequiresReachability:(BOOL)a3
{
  self->_requiresReachability = a3;
}

- (BOOL)requiresReachability
{
  return self->_requiresReachability;
}

- (void)setAllowedLinkSubtypes:(id)a3
{
}

- (NSArray)allowedLinkSubtypes
{
  return self->_allowedLinkSubtypes;
}

- (void)setAllowedLinkTypes:(id)a3
{
}

- (NSArray)allowedLinkTypes
{
  return self->_allowedLinkTypes;
}

- (void)setBluetoothEndpointType:(unint64_t)a3
{
  self->_bluetoothEndpointType = a3;
}

- (unint64_t)bluetoothEndpointType
{
  return self->_bluetoothEndpointType;
}

- (void)setBluetoothRole:(unint64_t)a3
{
  self->_bluetoothRole = a3;
}

- (unint64_t)bluetoothRole
{
  return self->_bluetoothRole;
}

- (void)setProxyProviderCriteria:(id)a3
{
}

- (NRDeviceProxyProviderCriteria)proxyProviderCriteria
{
  return self->_proxyProviderCriteria;
}

- (void)setProxyCapability:(unint64_t)a3
{
  self->_proxyCapability = a3;
}

- (unint64_t)proxyCapability
{
  return self->_proxyCapability;
}

- (BOOL)hasPoliciesForProxyCriteria
{
  return self->_proxyProviderCriteria != 0;
}

- (BOOL)hasCompanionDatapath
{
  return !self->_usesTLS;
}

- (id)description
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"["];
  objc_msgSend(v3, "appendFormat:", @" v:%u", -[NRDeviceOperationalProperties version](self, "version"));
  objc_msgSend(v3, "appendFormat:", @" prx:%llu", -[NRDeviceOperationalProperties proxyCapability](self, "proxyCapability"));
  [v3 appendFormat:@", bt:%llu", -[NRDeviceOperationalProperties bluetoothRole](self, "bluetoothRole")];
  [v3 appendFormat:@", bt-end:%llu", -[NRDeviceOperationalProperties bluetoothEndpointType](self, "bluetoothEndpointType")];
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = [(NRDeviceOperationalProperties *)self allowedLinkTypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v11 = [*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedShortValue];
        if ((v11 - 1) < 4u) {
          StringFromNRLinkType = off_263FD1010[(v11 - 1)];
        }
        else {
          StringFromNRLinkType = (__CFString *)createStringFromNRLinkType(v11);
        }
        [v4 appendFormat:@" %@ ", StringFromNRLinkType];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  v23 = v3;

  id v12 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v13 = [(NRDeviceOperationalProperties *)self allowedLinkSubtypes];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        unsigned __int8 v19 = [*(id *)(*((void *)&v24 + 1) + 8 * j) unsignedShortValue];
        if ((v19 - 101) < 4u) {
          StringFromNRLinkSubtype = off_263FD1030[(v19 - 101)];
        }
        else {
          StringFromNRLinkSubtype = (__CFString *)createStringFromNRLinkSubtype(v19);
        }
        [v12 appendFormat:@" %@ ", StringFromNRLinkSubtype];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v15);
  }

  [v23 appendFormat:@", lnks:[%@][%@]", v4, v12];
  if ([(NRDeviceOperationalProperties *)self handlesLinkRecommendations]) {
    [v23 appendString:@", lnkRec"];
  }
  if ([(NRDeviceOperationalProperties *)self requiresReachability]) {
    [v23 appendString:@", rch"];
  }
  if ([(NRDeviceOperationalProperties *)self proxyProviderRequiresWiFi]) {
    [v23 appendString:@", prx-wifi"];
  }
  if ([(NRDeviceOperationalProperties *)self usesTLS]) {
    [v23 appendString:@", tls"];
  }
  if ([(NRDeviceOperationalProperties *)self providesPhoneCallRelaySupport]) {
    [v23 appendString:@", pcr"];
  }
  if ([(NRDeviceOperationalProperties *)self allowsPermittedClientsOnly]) {
    [v23 appendString:@", prm"];
  }
  if ([(NRDeviceOperationalProperties *)self allowsDirectToCloud]) {
    [v23 appendString:@", dtc"];
  }
  if ([(NRDeviceOperationalProperties *)self allowsDeviceDiscovery]) {
    [v23 appendString:@", disc"];
  }
  if ([(NRDeviceOperationalProperties *)self allowsDeadPeerDetection]) {
    [v23 appendString:@", dpd"];
  }
  if ([(NRDeviceOperationalProperties *)self hasCompanionDatapath]) {
    [v23 appendString:@", cmpn-dp"];
  }
  v20 = [(NRDeviceOperationalProperties *)self proxyProviderCriteria];

  if (v20)
  {
    v21 = [(NRDeviceOperationalProperties *)self proxyProviderCriteria];
    [v23 appendFormat:@", %@", v21];
  }
  if ([(NRDeviceOperationalProperties *)self operationalScope]) {
    [v23 appendFormat:@", sc %#llx", -[NRDeviceOperationalProperties operationalScope](self, "operationalScope")];
  }
  [v23 appendString:@"]"];

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NRDeviceOperationalProperties;
  id v4 = a3;
  [(NRDeviceProperties *)&v8 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", -[NRDeviceOperationalProperties version](self, "version", v8.receiver, v8.super_class), @"version");
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceOperationalProperties proxyCapability](self, "proxyCapability"), @"proxyCapability");
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceOperationalProperties bluetoothRole](self, "bluetoothRole"), @"bluetoothRole");
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceOperationalProperties bluetoothEndpointType](self, "bluetoothEndpointType"), @"bluetoothEndpointType");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties handlesLinkRecommendations](self, "handlesLinkRecommendations"), @"handlesLinkRecommendations");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties requiresReachability](self, "requiresReachability"), @"requiresReachability");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties proxyProviderRequiresWiFi](self, "proxyProviderRequiresWiFi"), @"proxyProviderRequiresWiFi");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties usesTLS](self, "usesTLS"), @"usesTLS");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties providesPhoneCallRelaySupport](self, "providesPhoneCallRelaySupport"), @"providesPhoneCallRelaySupport");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties allowsPermittedClientsOnly](self, "allowsPermittedClientsOnly"), @"allowsPermittedClientsOnly");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties allowsDirectToCloud](self, "allowsDirectToCloud"), @"allowsDirectToCloud");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties allowsDeviceDiscovery](self, "allowsDeviceDiscovery"), @"allowsDeviceDiscovery");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NRDeviceOperationalProperties allowedPeerDeviceType](self, "allowedPeerDeviceType"), @"allowedPeerDeviceType");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties allowsDeadPeerDetection](self, "allowsDeadPeerDetection"), @"allowsDeadPeerDetection");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDeviceOperationalProperties isReachableOverWiFi](self, "isReachableOverWiFi"), @"isReachableOverWiFi");
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceOperationalProperties operationalScope](self, "operationalScope"), @"operationalScope");
  v5 = [(NRDeviceOperationalProperties *)self allowedLinkTypes];
  [v4 encodeObject:v5 forKey:@"allowedLinkTypes"];

  uint64_t v6 = [(NRDeviceOperationalProperties *)self allowedLinkSubtypes];
  [v4 encodeObject:v6 forKey:@"allowedLinkSubtypes"];

  uint64_t v7 = [(NRDeviceOperationalProperties *)self proxyProviderCriteria];
  [v4 encodeObject:v7 forKey:@"proxyProviderCriteria"];
}

- (NRDeviceOperationalProperties)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NRDeviceOperationalProperties;
  v5 = [(NRDeviceProperties *)&v22 initWithCoder:v4];
  if (!v5)
  {
    unsigned __int8 v11 = nrCopyLogObj_1005();
    id v12 = v11;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!v13)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v20 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v20 = 136446210;
        *(void *)(v20 + 4) = "-[NRDeviceOperationalProperties initWithCoder:]";
        id v21 = nrCopyLogObj_1005();
        _NRLogAbortWithPack(v21);
      }
    }
    id v14 = nrCopyLogObj_1005();
    _NRLogWithArgs((uint64_t)v14, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super initWithCoder:] failed", v15, v16, v17, v18, v19, (uint64_t)"");

    goto LABEL_8;
  }
  uint64_t v6 = v5;
  -[NRDeviceOperationalProperties setVersion:](v5, "setVersion:", (unsigned __int16)[v4 decodeInt32ForKey:@"version"]);
  -[NRDeviceOperationalProperties setProxyCapability:](v6, "setProxyCapability:", [v4 decodeInt64ForKey:@"proxyCapability"]);
  -[NRDeviceOperationalProperties setBluetoothRole:](v6, "setBluetoothRole:", [v4 decodeInt64ForKey:@"bluetoothRole"]);
  -[NRDeviceOperationalProperties setBluetoothEndpointType:](v6, "setBluetoothEndpointType:", [v4 decodeInt64ForKey:@"bluetoothEndpointType"]);
  -[NRDeviceOperationalProperties setHandlesLinkRecommendations:](v6, "setHandlesLinkRecommendations:", [v4 decodeBoolForKey:@"handlesLinkRecommendations"]);
  -[NRDeviceOperationalProperties setRequiresReachability:](v6, "setRequiresReachability:", [v4 decodeBoolForKey:@"requiresReachability"]);
  -[NRDeviceOperationalProperties setProxyProviderRequiresWiFi:](v6, "setProxyProviderRequiresWiFi:", [v4 decodeBoolForKey:@"proxyProviderRequiresWiFi"]);
  -[NRDeviceOperationalProperties setUsesTLS:](v6, "setUsesTLS:", [v4 decodeBoolForKey:@"usesTLS"]);
  -[NRDeviceOperationalProperties setProvidesPhoneCallRelaySupport:](v6, "setProvidesPhoneCallRelaySupport:", [v4 decodeBoolForKey:@"providesPhoneCallRelaySupport"]);
  -[NRDeviceOperationalProperties setAllowsPermittedClientsOnly:](v6, "setAllowsPermittedClientsOnly:", [v4 decodeBoolForKey:@"allowsPermittedClientsOnly"]);
  -[NRDeviceOperationalProperties setAllowsDirectToCloud:](v6, "setAllowsDirectToCloud:", [v4 decodeBoolForKey:@"allowsDirectToCloud"]);
  -[NRDeviceOperationalProperties setAllowsDeviceDiscovery:](v6, "setAllowsDeviceDiscovery:", [v4 decodeBoolForKey:@"allowsDeviceDiscovery"]);
  -[NRDeviceOperationalProperties setAllowedPeerDeviceType:](v6, "setAllowedPeerDeviceType:", [v4 decodeInt32ForKey:@"allowedPeerDeviceType"]);
  -[NRDeviceOperationalProperties setAllowsDeadPeerDetection:](v6, "setAllowsDeadPeerDetection:", [v4 decodeBoolForKey:@"allowsDeadPeerDetection"]);
  -[NRDeviceOperationalProperties setIsReachableOverWiFi:](v6, "setIsReachableOverWiFi:", [v4 decodeBoolForKey:@"isReachableOverWiFi"]);
  -[NRDeviceOperationalProperties setOperationalScope:](v6, "setOperationalScope:", [v4 decodeInt64ForKey:@"operationalScope"]);
  uint64_t v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"allowedLinkTypes"];
  [(NRDeviceOperationalProperties *)v6 setAllowedLinkTypes:v7];

  objc_super v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"allowedLinkSubtypes"];
  [(NRDeviceOperationalProperties *)v6 setAllowedLinkSubtypes:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyProviderCriteria"];
  [(NRDeviceOperationalProperties *)v6 setProxyProviderCriteria:v9];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NRDeviceOperationalProperties;
  id v4 = [(NRDeviceProperties *)&v12 copyWithZone:a3];
  objc_msgSend(v4, "setVersion:", -[NRDeviceOperationalProperties version](self, "version"));
  objc_msgSend(v4, "setProxyCapability:", -[NRDeviceOperationalProperties proxyCapability](self, "proxyCapability"));
  objc_msgSend(v4, "setBluetoothRole:", -[NRDeviceOperationalProperties bluetoothRole](self, "bluetoothRole"));
  objc_msgSend(v4, "setHandlesLinkRecommendations:", -[NRDeviceOperationalProperties handlesLinkRecommendations](self, "handlesLinkRecommendations"));
  objc_msgSend(v4, "setRequiresReachability:", -[NRDeviceOperationalProperties requiresReachability](self, "requiresReachability"));
  objc_msgSend(v4, "setProxyProviderRequiresWiFi:", -[NRDeviceOperationalProperties proxyProviderRequiresWiFi](self, "proxyProviderRequiresWiFi"));
  objc_msgSend(v4, "setUsesTLS:", -[NRDeviceOperationalProperties usesTLS](self, "usesTLS"));
  objc_msgSend(v4, "setProvidesPhoneCallRelaySupport:", -[NRDeviceOperationalProperties providesPhoneCallRelaySupport](self, "providesPhoneCallRelaySupport"));
  objc_msgSend(v4, "setAllowsPermittedClientsOnly:", -[NRDeviceOperationalProperties allowsPermittedClientsOnly](self, "allowsPermittedClientsOnly"));
  objc_msgSend(v4, "setBluetoothEndpointType:", -[NRDeviceOperationalProperties bluetoothEndpointType](self, "bluetoothEndpointType"));
  objc_msgSend(v4, "setAllowsDirectToCloud:", -[NRDeviceOperationalProperties allowsDirectToCloud](self, "allowsDirectToCloud"));
  objc_msgSend(v4, "setAllowsDeviceDiscovery:", -[NRDeviceOperationalProperties allowsDeviceDiscovery](self, "allowsDeviceDiscovery"));
  objc_msgSend(v4, "setAllowedPeerDeviceType:", -[NRDeviceOperationalProperties allowedPeerDeviceType](self, "allowedPeerDeviceType"));
  objc_msgSend(v4, "setAllowsDeadPeerDetection:", -[NRDeviceOperationalProperties allowsDeadPeerDetection](self, "allowsDeadPeerDetection"));
  objc_msgSend(v4, "setIsReachableOverWiFi:", -[NRDeviceOperationalProperties isReachableOverWiFi](self, "isReachableOverWiFi"));
  objc_msgSend(v4, "setOperationalScope:", -[NRDeviceOperationalProperties operationalScope](self, "operationalScope"));
  v5 = [(NRDeviceOperationalProperties *)self allowedLinkTypes];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setAllowedLinkTypes:v6];

  uint64_t v7 = [(NRDeviceOperationalProperties *)self allowedLinkSubtypes];
  objc_super v8 = (void *)[v7 copy];
  [v4 setAllowedLinkSubtypes:v8];

  v9 = [(NRDeviceOperationalProperties *)self proxyProviderCriteria];
  v10 = (void *)[v9 copy];
  [v4 setProxyProviderCriteria:v10];

  return v4;
}

- (void)mergeProperties:(id)a3
{
  id v4 = a3;
  id v25 = v4;
  if (v4)
  {
    -[NRDeviceOperationalProperties setVersion:](self, "setVersion:", [v4 version]);
    -[NRDeviceOperationalProperties setProxyCapability:](self, "setProxyCapability:", [v25 proxyCapability]);
    -[NRDeviceOperationalProperties setBluetoothRole:](self, "setBluetoothRole:", [v25 bluetoothRole]);
    -[NRDeviceOperationalProperties setHandlesLinkRecommendations:](self, "setHandlesLinkRecommendations:", [v25 handlesLinkRecommendations]);
    -[NRDeviceOperationalProperties setRequiresReachability:](self, "setRequiresReachability:", [v25 requiresReachability]);
    -[NRDeviceOperationalProperties setProxyProviderRequiresWiFi:](self, "setProxyProviderRequiresWiFi:", [v25 proxyProviderRequiresWiFi]);
    -[NRDeviceOperationalProperties setUsesTLS:](self, "setUsesTLS:", [v25 usesTLS]);
    -[NRDeviceOperationalProperties setProvidesPhoneCallRelaySupport:](self, "setProvidesPhoneCallRelaySupport:", [v25 providesPhoneCallRelaySupport]);
    -[NRDeviceOperationalProperties setAllowsPermittedClientsOnly:](self, "setAllowsPermittedClientsOnly:", [v25 allowsPermittedClientsOnly]);
    -[NRDeviceOperationalProperties setBluetoothEndpointType:](self, "setBluetoothEndpointType:", [v25 bluetoothEndpointType]);
    -[NRDeviceOperationalProperties setAllowsDirectToCloud:](self, "setAllowsDirectToCloud:", [v25 allowsDirectToCloud]);
    -[NRDeviceOperationalProperties setAllowsDeviceDiscovery:](self, "setAllowsDeviceDiscovery:", [v25 allowsDeviceDiscovery]);
    -[NRDeviceOperationalProperties setAllowedPeerDeviceType:](self, "setAllowedPeerDeviceType:", [v25 allowedPeerDeviceType]);
    -[NRDeviceOperationalProperties setAllowsDeadPeerDetection:](self, "setAllowsDeadPeerDetection:", [v25 allowsDeadPeerDetection]);
    -[NRDeviceOperationalProperties setIsReachableOverWiFi:](self, "setIsReachableOverWiFi:", [v25 isReachableOverWiFi]);
    -[NRDeviceOperationalProperties setOperationalScope:](self, "setOperationalScope:", [v25 operationalScope]);
    v5 = [v25 allowedLinkTypes];
    uint64_t v6 = (void *)[v5 copy];
    [(NRDeviceOperationalProperties *)self setAllowedLinkTypes:v6];

    uint64_t v7 = [v25 allowedLinkSubtypes];
    objc_super v8 = (void *)[v7 copy];
    [(NRDeviceOperationalProperties *)self setAllowedLinkSubtypes:v8];

    v9 = [v25 proxyProviderCriteria];
    v10 = (void *)[v9 copy];
    [(NRDeviceOperationalProperties *)self setProxyProviderCriteria:v10];

    if (nrCopyLogObj_onceToken_1009 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1009, &__block_literal_global_420);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1010, OS_LOG_TYPE_DEFAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1010, 0, (uint64_t)"%s%.30s:%-4d merged properties: %@", v11, v12, v13, v14, v15, (uint64_t)"");
    }
  }
  else
  {
    uint64_t v16 = nrCopyLogObj_1005();
    uint64_t v17 = v16;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v18 = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);

      if (!v18) {
        goto LABEL_7;
      }
    }
    id v19 = nrCopyLogObj_1005();
    _NRLogWithArgs((uint64_t)v19, 17, (uint64_t)"%s called with null prop", v20, v21, v22, v23, v24, (uint64_t)"-[NRDeviceOperationalProperties mergeProperties:]");
  }
LABEL_7:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int v6 = [(NRDeviceOperationalProperties *)self version];
      if (v6 != [v5 version]) {
        goto LABEL_33;
      }
      unint64_t v7 = [(NRDeviceOperationalProperties *)self proxyCapability];
      if (v7 != [v5 proxyCapability]) {
        goto LABEL_33;
      }
      unint64_t v8 = [(NRDeviceOperationalProperties *)self bluetoothRole];
      if (v8 != [v5 bluetoothRole]) {
        goto LABEL_33;
      }
      int v9 = [(NRDeviceOperationalProperties *)self handlesLinkRecommendations];
      if (v9 != [v5 handlesLinkRecommendations]) {
        goto LABEL_33;
      }
      int v10 = [(NRDeviceOperationalProperties *)self requiresReachability];
      if (v10 != [v5 requiresReachability]) {
        goto LABEL_33;
      }
      int v11 = [(NRDeviceOperationalProperties *)self proxyProviderRequiresWiFi];
      if (v11 != [v5 proxyProviderRequiresWiFi]) {
        goto LABEL_33;
      }
      int v12 = [(NRDeviceOperationalProperties *)self usesTLS];
      if (v12 != [v5 usesTLS]) {
        goto LABEL_33;
      }
      int v13 = [(NRDeviceOperationalProperties *)self providesPhoneCallRelaySupport];
      if (v13 != [v5 providesPhoneCallRelaySupport]) {
        goto LABEL_33;
      }
      int v14 = [(NRDeviceOperationalProperties *)self allowsPermittedClientsOnly];
      if (v14 != [v5 allowsPermittedClientsOnly]) {
        goto LABEL_33;
      }
      unint64_t v15 = [(NRDeviceOperationalProperties *)self bluetoothEndpointType];
      if (v15 != [v5 bluetoothEndpointType]) {
        goto LABEL_33;
      }
      int v16 = [(NRDeviceOperationalProperties *)self allowsDirectToCloud];
      if (v16 != [v5 allowsDirectToCloud]) {
        goto LABEL_33;
      }
      int v17 = [(NRDeviceOperationalProperties *)self allowsDeviceDiscovery];
      if (v17 != [v5 allowsDeviceDiscovery]) {
        goto LABEL_33;
      }
      int v18 = [(NRDeviceOperationalProperties *)self allowedPeerDeviceType];
      if (v18 != [v5 allowedPeerDeviceType]) {
        goto LABEL_33;
      }
      int v19 = [(NRDeviceOperationalProperties *)self allowsDeadPeerDetection];
      if (v19 != [v5 allowsDeadPeerDetection]) {
        goto LABEL_33;
      }
      int v20 = [(NRDeviceOperationalProperties *)self isReachableOverWiFi];
      if (v20 != [v5 isReachableOverWiFi]) {
        goto LABEL_33;
      }
      unint64_t v21 = [(NRDeviceOperationalProperties *)self operationalScope];
      if (v21 != [v5 operationalScope]) {
        goto LABEL_33;
      }
      uint64_t v22 = [(NRDeviceOperationalProperties *)self allowedLinkTypes];
      if (v22)
      {
      }
      else
      {
        uint64_t v24 = [v5 allowedLinkTypes];

        if (!v24) {
          goto LABEL_24;
        }
      }
      id v25 = [(NRDeviceOperationalProperties *)self allowedLinkTypes];
      long long v26 = [v5 allowedLinkTypes];
      int v27 = [v25 isEqual:v26];

      if (!v27) {
        goto LABEL_33;
      }
LABEL_24:
      long long v28 = [(NRDeviceOperationalProperties *)self allowedLinkSubtypes];
      if (v28)
      {
      }
      else
      {
        long long v29 = [v5 allowedLinkSubtypes];

        if (!v29)
        {
LABEL_28:
          v33 = [(NRDeviceOperationalProperties *)self proxyProviderCriteria];
          if (v33)
          {
          }
          else
          {
            uint64_t v34 = [v5 proxyProviderCriteria];

            if (!v34)
            {
LABEL_32:
              BOOL v23 = 1;
LABEL_34:

              goto LABEL_35;
            }
          }
          v35 = [(NRDeviceOperationalProperties *)self proxyProviderCriteria];
          v36 = [v5 proxyProviderCriteria];
          int v37 = [v35 isEqual:v36];

          if (v37) {
            goto LABEL_32;
          }
LABEL_33:
          BOOL v23 = 0;
          goto LABEL_34;
        }
      }
      long long v30 = [(NRDeviceOperationalProperties *)self allowedLinkSubtypes];
      long long v31 = [v5 allowedLinkSubtypes];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_33;
      }
      goto LABEL_28;
    }
  }
  BOOL v23 = 0;
LABEL_35:

  return v23;
}

- (NRDeviceOperationalProperties)init
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)NRDeviceOperationalProperties;
  v2 = [(NRDeviceOperationalProperties *)&v16 init];
  if (!v2)
  {
    id v5 = nrCopyLogObj_1005();
    int v6 = v5;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

      if (!v7)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v14 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v14 = 136446210;
        *(void *)(v14 + 4) = "-[NRDeviceOperationalProperties init]";
        id v15 = nrCopyLogObj_1005();
        _NRLogAbortWithPack(v15);
      }
    }
    id v8 = nrCopyLogObj_1005();
    _NRLogWithArgs((uint64_t)v8, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v9, v10, v11, v12, v13, (uint64_t)"");

    goto LABEL_8;
  }
  v3 = v2;
  [(NRDeviceOperationalProperties *)v2 setVersion:1];
  [(NRDeviceOperationalProperties *)v3 setAllowedLinkTypes:&unk_26BE1DB78];
  [(NRDeviceOperationalProperties *)v3 setBluetoothEndpointType:3];
  [(NRDeviceOperationalProperties *)v3 setIsReachableOverWiFi:1];
  return v3;
}

+ (id)copyPropertiesForDefaultPairedWatch
{
  v2 = objc_alloc_init(NRDeviceOperationalProperties);
  [(NRDeviceOperationalProperties *)v2 setProxyCapability:2];
  [(NRDeviceOperationalProperties *)v2 setBluetoothRole:2];
  [(NRDeviceOperationalProperties *)v2 setBluetoothEndpointType:1];
  [(NRDeviceOperationalProperties *)v2 setHandlesLinkRecommendations:1];
  [(NRDeviceOperationalProperties *)v2 setRequiresReachability:1];
  [(NRDeviceOperationalProperties *)v2 setAllowsDirectToCloud:1];
  [(NRDeviceOperationalProperties *)v2 setProvidesPhoneCallRelaySupport:1];
  [(NRDeviceOperationalProperties *)v2 setAllowedLinkTypes:&unk_26BE1DBC0];
  [(NRDeviceOperationalProperties *)v2 setAllowedLinkSubtypes:&unk_26BE1DBD8];
  return v2;
}

+ (id)copyPropertiesForDefaultPairedPhone
{
  v2 = objc_alloc_init(NRDeviceOperationalProperties);
  [(NRDeviceOperationalProperties *)v2 setProxyCapability:1];
  [(NRDeviceOperationalProperties *)v2 setBluetoothRole:1];
  [(NRDeviceOperationalProperties *)v2 setBluetoothEndpointType:2];
  [(NRDeviceOperationalProperties *)v2 setAllowsPermittedClientsOnly:1];
  [(NRDeviceOperationalProperties *)v2 setIsReachableOverWiFi:1];
  [(NRDeviceOperationalProperties *)v2 setProvidesPhoneCallRelaySupport:1];
  [(NRDeviceOperationalProperties *)v2 setAllowedLinkTypes:&unk_26BE1DB90];
  [(NRDeviceOperationalProperties *)v2 setAllowedLinkSubtypes:&unk_26BE1DBA8];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end