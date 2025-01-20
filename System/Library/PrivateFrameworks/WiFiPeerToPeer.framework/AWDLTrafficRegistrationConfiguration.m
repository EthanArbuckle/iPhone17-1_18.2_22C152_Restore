@interface AWDLTrafficRegistrationConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)localizedErrorForConflictBetweenExistingService:(id)a3 withNewService:(id)a4 localDeviceName:(id)a5 localization:(id)a6;
- (AWDLTrafficRegistrationConfiguration)initWithCoder:(id)a3;
- (AWDLTrafficRegistrationConfiguration)initWithDictionary:(__CFDictionary *)a3 isActive:(BOOL *)a4;
- (AWDLTrafficRegistrationConfiguration)initWithUniqueIdentifier:(id)a3 peerAddress:(id)a4;
- (AWDLTrafficRegistrationConfiguration)initWithUniqueIdentifier:(id)a3 peerIPv6Address:(in6_addr)a4;
- (BOOL)activeFlagOverride;
- (BOOL)hasSimilarOptionsTo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)legacyUpgradeRequired;
- (NSString)localization;
- (NSString)uniqueIdentifier;
- (WiFiMACAddress)peerAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)invalidationHandler;
- (int64_t)options;
- (unint64_t)hash;
- (unsigned)preferredChannel;
- (unsigned)secondaryPreferredChannel;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveFlagOverride:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLegacyUpgradeRequired:(BOOL)a3;
- (void)setOptions:(int64_t)a3;
- (void)setPeerAddress:(id)a3;
- (void)setPreferredChannel:(unsigned __int16)a3;
- (void)setSecondaryPreferredChannel:(unsigned __int16)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation AWDLTrafficRegistrationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AWDLTrafficRegistrationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLTrafficRegistrationConfiguration.uniqueIdentifierKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLTrafficRegistrationConfiguration.peerAddressKey"];
  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = [(AWDLTrafficRegistrationConfiguration *)self initWithUniqueIdentifier:v5 peerAddress:v6];
    v10 = v9;
    if (v9)
    {
      v9->_options = [v4 decodeIntegerForKey:@"AWDLTrafficRegistrationConfiguration.optionsKey"];
      v10->_preferredChannel = [v4 decodeInt32ForKey:@"AWDLTrafficRegistrationConfiguration.preferredChannelKey"];
      v10->_secondaryPreferredChannel = [v4 decodeInt32ForKey:@"AWDLTrafficRegistrationConfiguration.secondaryPreferredChannelKey"];
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLTrafficRegistrationConfiguration.localization"];
      derivedLocalization = v10->_derivedLocalization;
      v10->_derivedLocalization = (NSString *)v11;

      if ([v5 isEqualToString:@"airplay"]) {
        v10->_legacyUpgradeRequired = [v4 decodeBoolForKey:@"AWDLTrafficRegistrationConfiguration.legacyUpgradeRequired"];
      }
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(AWDLTrafficRegistrationConfiguration *)self uniqueIdentifier];
  [v9 encodeObject:v4 forKey:@"AWDLTrafficRegistrationConfiguration.uniqueIdentifierKey"];

  v5 = [(AWDLTrafficRegistrationConfiguration *)self peerAddress];
  [v9 encodeObject:v5 forKey:@"AWDLTrafficRegistrationConfiguration.peerAddressKey"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[AWDLTrafficRegistrationConfiguration options](self, "options"), @"AWDLTrafficRegistrationConfiguration.optionsKey");
  v6 = +[WiFiP2PXPCConnection localization];
  [v9 encodeObject:v6 forKey:@"AWDLTrafficRegistrationConfiguration.localization"];

  objc_msgSend(v9, "encodeInt32:forKey:", -[AWDLTrafficRegistrationConfiguration preferredChannel](self, "preferredChannel"), @"AWDLTrafficRegistrationConfiguration.preferredChannelKey");
  objc_msgSend(v9, "encodeInt32:forKey:", -[AWDLTrafficRegistrationConfiguration secondaryPreferredChannel](self, "secondaryPreferredChannel"), @"AWDLTrafficRegistrationConfiguration.secondaryPreferredChannelKey");
  BOOL v7 = [(AWDLTrafficRegistrationConfiguration *)self uniqueIdentifier];
  int v8 = [v7 isEqualToString:@"airplay"];

  if (v8) {
    objc_msgSend(v9, "encodeBool:forKey:", -[AWDLTrafficRegistrationConfiguration legacyUpgradeRequired](self, "legacyUpgradeRequired"), @"AWDLTrafficRegistrationConfiguration.legacyUpgradeRequired");
  }
}

- (AWDLTrafficRegistrationConfiguration)initWithUniqueIdentifier:(id)a3 peerAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AWDLTrafficRegistrationConfiguration;
  int v8 = [(AWDLTrafficRegistrationConfiguration *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    v10 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v9;

    uint64_t v11 = [v7 copy];
    v12 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v11;

    *((void *)v8 + 5) = 0;
    *(_DWORD *)(v8 + 18) = 0;
    v13 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = 0;

    v8[17] = 0;
    v8[16] = [v6 isEqualToString:@"airplay"];
  }

  return (AWDLTrafficRegistrationConfiguration *)v8;
}

- (AWDLTrafficRegistrationConfiguration)initWithUniqueIdentifier:(id)a3 peerIPv6Address:(in6_addr)a4
{
  uint64_t v4 = *(void *)&a4.__u6_addr32[2];
  uint64_t v5 = *(void *)a4.__u6_addr8;
  id v7 = a3;
  int v8 = -[WiFiMACAddress initWithLinkLocalIPv6Address:]([WiFiMACAddress alloc], "initWithLinkLocalIPv6Address:", v5, v4);
  if (v8)
  {
    self = [(AWDLTrafficRegistrationConfiguration *)self initWithUniqueIdentifier:v7 peerAddress:v8];
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AWDLTrafficRegistrationConfiguration *)a3;
  if (self == v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v11 = 0;
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    uint64_t v5 = v4;
    id v6 = [(AWDLTrafficRegistrationConfiguration *)self uniqueIdentifier];
    id v7 = [(AWDLTrafficRegistrationConfiguration *)v5 uniqueIdentifier];
    if (([v6 isEqual:v7] & 1) == 0)
    {

LABEL_10:
      BOOL v11 = 0;
      goto LABEL_11;
    }
    int v8 = [(AWDLTrafficRegistrationConfiguration *)self peerAddress];
    uint64_t v9 = [(AWDLTrafficRegistrationConfiguration *)v5 peerAddress];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_10;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(AWDLTrafficRegistrationConfiguration *)self uniqueIdentifier];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(AWDLTrafficRegistrationConfiguration *)self peerAddress];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)hasSimilarOptionsTo:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AWDLTrafficRegistrationConfiguration *)self options];
  if (v5 == [v4 options]
    && (int v6 = [(AWDLTrafficRegistrationConfiguration *)self preferredChannel],
        v6 == [v4 preferredChannel]))
  {
    int v7 = [(AWDLTrafficRegistrationConfiguration *)self secondaryPreferredChannel];
    BOOL v8 = v7 == [v4 secondaryPreferredChannel];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)localization
{
  derivedLocalization = self->_derivedLocalization;
  if (derivedLocalization)
  {
    v3 = derivedLocalization;
  }
  else
  {
    v3 = +[WiFiP2PXPCConnection localization];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [AWDLTrafficRegistrationConfiguration alloc];
  int64_t v5 = [(AWDLTrafficRegistrationConfiguration *)self uniqueIdentifier];
  int v6 = [(AWDLTrafficRegistrationConfiguration *)self peerAddress];
  int v7 = [(AWDLTrafficRegistrationConfiguration *)v4 initWithUniqueIdentifier:v5 peerAddress:v6];

  [(AWDLTrafficRegistrationConfiguration *)v7 setOptions:[(AWDLTrafficRegistrationConfiguration *)self options]];
  [(AWDLTrafficRegistrationConfiguration *)v7 setPreferredChannel:[(AWDLTrafficRegistrationConfiguration *)self preferredChannel]];
  [(AWDLTrafficRegistrationConfiguration *)v7 setSecondaryPreferredChannel:[(AWDLTrafficRegistrationConfiguration *)self secondaryPreferredChannel]];
  [(AWDLTrafficRegistrationConfiguration *)v7 setLegacyUpgradeRequired:[(AWDLTrafficRegistrationConfiguration *)self legacyUpgradeRequired]];
  BOOL v8 = [(AWDLTrafficRegistrationConfiguration *)self invalidationHandler];
  [(AWDLTrafficRegistrationConfiguration *)v7 setInvalidationHandler:v8];

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(AWDLTrafficRegistrationConfiguration *)self uniqueIdentifier];
  int64_t v5 = [(AWDLTrafficRegistrationConfiguration *)self peerAddress];
  int v6 = [v3 stringWithFormat:@"<AWDLTrafficRegistrationConfiguration %@ to %@>", v4, v5];

  return v6;
}

- (AWDLTrafficRegistrationConfiguration)initWithDictionary:(__CFDictionary *)a3 isActive:(BOOL *)a4
{
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a3, @"TR_ACTIVE");
  if (!Value) {
    goto LABEL_36;
  }
  CFBooleanRef v8 = Value;
  CFTypeID v9 = CFGetTypeID(Value);
  if (v9 != CFBooleanGetTypeID()) {
    goto LABEL_36;
  }
  CFArrayRef v10 = (const __CFArray *)CFDictionaryGetValue(a3, @"TR_PEER_CONTEXTS");
  if (v10 && (CFArrayRef v11 = v10, v12 = CFGetTypeID(v10), v12 == CFArrayGetTypeID()))
  {
    if (CFArrayGetCount(v11) >= 1
      && (CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, 0)) != 0
      && (v14 = ValueAtIndex, CFTypeID v15 = CFGetTypeID(ValueAtIndex), v15 == CFDictionaryGetTypeID())
      && (CFDataRef v16 = (const __CFData *)CFDictionaryGetValue(v14, @"TR_PEER_ADDRESS")) != 0
      && (CFDataRef v17 = v16, v18 = CFGetTypeID(v16), v18 == CFDataGetTypeID())
      && CFDataGetLength(v17) == 6)
    {
      BytePtr = CFDataGetBytePtr(v17);
      unint64_t v20 = *(unsigned int *)BytePtr | ((unint64_t)*((unsigned __int16 *)BytePtr + 2) << 32);
    }
    else
    {
      unint64_t v20 = 0;
    }
    v25 = CFDictionaryGetValue(a3, @"TR_SESSION_FLAGS");
  }
  else
  {
    CFDataRef v21 = (const __CFData *)CFDictionaryGetValue(a3, @"AWDL_TR_ADDR");
    if (v21 && (CFDataRef v22 = v21, v23 = CFGetTypeID(v21), v23 == CFDataGetTypeID()) && CFDataGetLength(v22) == 6)
    {
      v24 = CFDataGetBytePtr(v22);
      unint64_t v20 = *(unsigned int *)v24 | ((unint64_t)*((unsigned __int16 *)v24 + 2) << 32);
    }
    else
    {
      unint64_t v20 = 0;
    }
    v25 = CFDictionaryGetValue(a3, @"AWDL_TR_RT_FLAGS");
    v26 = CFDictionaryGetValue(a3, @"AWDL_TR_UID");
    if (v26) {
      goto LABEL_22;
    }
  }
  v26 = CFDictionaryGetValue(a3, @"TR_SRV_NAME");
  if (!v26)
  {
LABEL_36:
    v38 = 0;
    goto LABEL_37;
  }
LABEL_22:
  CFTypeID v27 = CFGetTypeID(v26);
  if (v27 != CFStringGetTypeID()) {
    goto LABEL_36;
  }
  v28 = [[WiFiMACAddress alloc] initWithAddress:v20 & 0xFFFFFFFFFFFFLL];
  v29 = [(AWDLTrafficRegistrationConfiguration *)self initWithUniqueIdentifier:v26 peerAddress:v28];

  if (v25)
  {
    CFTypeID v30 = CFGetTypeID(v25);
    if (v30 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)v25, kCFNumberSInt32Type, &valuePtr);
      char v31 = valuePtr;
      if ((valuePtr & 2) != 0)
      {
        [(AWDLTrafficRegistrationConfiguration *)v29 setOptions:[(AWDLTrafficRegistrationConfiguration *)v29 options] | 1];
        char v31 = valuePtr;
      }
      if ((v31 & 8) != 0) {
        [(AWDLTrafficRegistrationConfiguration *)v29 setOptions:[(AWDLTrafficRegistrationConfiguration *)v29 options] | 2];
      }
    }
  }
  CFNumberRef v32 = (const __CFNumber *)CFDictionaryGetValue(a3, @"AWDL_TR_CHANNEL");
  if (v32)
  {
    CFNumberRef v33 = v32;
    CFTypeID v34 = CFGetTypeID(v32);
    if (v34 == CFNumberGetTypeID())
    {
      unsigned __int16 v41 = 0;
      CFNumberGetValue(v33, kCFNumberSInt16Type, &v41);
      [(AWDLTrafficRegistrationConfiguration *)v29 setPreferredChannel:v41];
    }
  }
  CFNumberRef v35 = (const __CFNumber *)CFDictionaryGetValue(a3, @"AWDL_TR_SEC_CHANNEL");
  if (v35)
  {
    CFNumberRef v36 = v35;
    CFTypeID v37 = CFGetTypeID(v35);
    if (v37 == CFNumberGetTypeID())
    {
      unsigned __int16 v40 = 0;
      CFNumberGetValue(v36, kCFNumberSInt16Type, &v40);
      [(AWDLTrafficRegistrationConfiguration *)v29 setSecondaryPreferredChannel:v40];
    }
  }
  *a4 = CFBooleanGetValue(v8) != 0;
  self = v29;
  v38 = self;
LABEL_37:

  return v38;
}

+ (id)localizedErrorForConflictBetweenExistingService:(id)a3 withNewService:(id)a4 localDeviceName:(id)a5 localization:(id)a6
{
  v67[4] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v64 = +[WiFiP2PXPCConnection convertError:5];
  v13 = canonicalService(v12);

  CFDictionaryRef v14 = canonicalService(v11);

  if ([v14 isEqual:v13]) {
    goto LABEL_2;
  }
  if (![v13 isEqual:@"airplay"])
  {
    if ([v13 isEqual:@"sidecar"])
    {
      if (v9)
      {
        id v16 = [NSString alloc];
        CFDataRef v17 = +[WiFiP2PXPCConnection frameworkBundle];
        CFTypeID v18 = v17;
        v19 = @"%@ is currently using Sidecar.";
        goto LABEL_16;
      }
      unint64_t v20 = +[WiFiP2PXPCConnection frameworkBundle];
      CFTypeID v18 = v20;
      CFDataRef v21 = @"Unable to connect while the other device is running Sidecar.";
    }
    else if ([v13 isEqual:@"RemoteCamera"])
    {
      if (v9)
      {
        id v16 = [NSString alloc];
        CFDataRef v17 = +[WiFiP2PXPCConnection frameworkBundle];
        CFTypeID v18 = v17;
        v19 = @"%@ is currently using Continuity Camera.";
        goto LABEL_16;
      }
      unint64_t v20 = +[WiFiP2PXPCConnection frameworkBundle];
      CFTypeID v18 = v20;
      CFDataRef v21 = @"Unable to connect while the other device is running Continuity Camera.";
    }
    else
    {
      if (![v13 isEqual:@"RemoteScreen"])
      {
LABEL_2:
        CFTypeID v15 = &stru_1F1806D08;
        goto LABEL_22;
      }
      if (v9)
      {
        id v16 = [NSString alloc];
        CFDataRef v17 = +[WiFiP2PXPCConnection frameworkBundle];
        CFTypeID v18 = v17;
        v19 = @"%@ is currently using iPhone Mirroring.";
        goto LABEL_16;
      }
      unint64_t v20 = +[WiFiP2PXPCConnection frameworkBundle];
      CFTypeID v18 = v20;
      CFDataRef v21 = @"Unable to connect while the other device is running iPhone Mirroring.";
    }
LABEL_20:
    CFTypeID v15 = [v20 localizedStringForKey:v21 value:0 table:0 localization:v10];
    goto LABEL_21;
  }
  if (!v9)
  {
    unint64_t v20 = +[WiFiP2PXPCConnection frameworkBundle];
    CFTypeID v18 = v20;
    CFDataRef v21 = @"Unable to connect while the other device is running AirPlay.";
    goto LABEL_20;
  }
  id v16 = [NSString alloc];
  CFDataRef v17 = +[WiFiP2PXPCConnection frameworkBundle];
  CFTypeID v18 = v17;
  v19 = @"%@ is currently using AirPlay.";
LABEL_16:
  CFDataRef v22 = [v17 localizedStringForKey:v19 value:0 table:0 localization:v10];
  CFTypeID v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v10];
  CFTypeID v15 = (__CFString *)objc_msgSend(v16, "initWithFormat:locale:", v22, v23, v9);

LABEL_21:
LABEL_22:
  v65 = v9;
  v62 = v13;
  v63 = v14;
  if ([v14 isEqual:@"airplay"])
  {
    v24 = +[WiFiP2PXPCConnection frameworkBundle];
    v25 = [v24 localizedStringForKey:@"Unable to Connect to AirPlay" value:0 table:0 localization:v10];

    if ([v13 isEqual:@"airplay"])
    {
      if (v9)
      {
        id v26 = [NSString alloc];
        CFTypeID v27 = +[WiFiP2PXPCConnection frameworkBundle];
        uint64_t v28 = [v27 localizedStringForKey:@"%@ unable to connect to AirPlay while active with another device." value:0 table:0 localization:v10];
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v10];
        uint64_t v30 = objc_msgSend(v26, "initWithFormat:locale:", v28, v29, v9, v13, v63);

        CFTypeID v15 = (__CFString *)v28;
      }
      else
      {
        CFTypeID v27 = +[WiFiP2PXPCConnection frameworkBundle];
        uint64_t v30 = [v27 localizedStringForKey:@"Unable to connect while the other device is active in a different AirPlay session." value:0 table:0 localization:v10];
      }

      unsigned __int16 v41 = +[WiFiP2PXPCConnection frameworkBundle];
      CFNumberRef v33 = v41;
      v42 = @"To connect AirPlay to another device, disconnect the previous one first.";
LABEL_73:
      v43 = v10;
      v44 = [v41 localizedStringForKey:v42 value:0 table:0 localization:v10];
      CFTypeID v15 = (__CFString *)v30;
      goto LABEL_74;
    }
    if ([v13 isEqual:@"sidecar"])
    {
      CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
      CFNumberRef v33 = v32;
      CFTypeID v34 = @"To use AirPlay, disconnect Sidecar first.";
      goto LABEL_64;
    }
    if ([v13 isEqual:@"RemoteCamera"])
    {
      CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
      CFNumberRef v33 = v32;
      CFTypeID v34 = @"To use AirPlay, disconnect Continuity Camera first.";
      goto LABEL_64;
    }
    if ([v13 isEqual:@"RemoteScreen"])
    {
      CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
      CFNumberRef v33 = v32;
      CFTypeID v34 = @"To use AirPlay, disconnect iPhone Mirroring first.";
      goto LABEL_64;
    }
LABEL_68:
    v43 = v10;
    v44 = &stru_1F1806D08;
    goto LABEL_75;
  }
  if (![v14 isEqual:@"sidecar"])
  {
    if ([v14 isEqual:@"RemoteCamera"])
    {
      CFNumberRef v35 = +[WiFiP2PXPCConnection frameworkBundle];
      v25 = [v35 localizedStringForKey:@"Unable to Connect to Continuity Camera" value:0 table:0 localization:v10];

      if ([v13 isEqual:@"airplay"])
      {
        CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
        CFNumberRef v33 = v32;
        CFTypeID v34 = @"To use Continuity Camera, disconnect AirPlay first.";
        goto LABEL_64;
      }
      if ([v13 isEqual:@"sidecar"])
      {
        CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
        CFNumberRef v33 = v32;
        CFTypeID v34 = @"To use Continuity Camera, disconnect Sidecar first.";
        goto LABEL_64;
      }
      if ([v13 isEqual:@"RemoteCamera"])
      {
        if (v9)
        {
          id v45 = [NSString alloc];
          v46 = +[WiFiP2PXPCConnection frameworkBundle];
          uint64_t v47 = [v46 localizedStringForKey:@"%@ unable to connect to Continuity Camera while active with another device." value:0 table:0 localization:v10];
          v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v10];
          uint64_t v30 = objc_msgSend(v45, "initWithFormat:locale:", v47, v48, v9, v13, v63);

          CFTypeID v15 = (__CFString *)v47;
        }
        else
        {
          v46 = +[WiFiP2PXPCConnection frameworkBundle];
          uint64_t v30 = [v46 localizedStringForKey:@"Unable to connect while the other device is active in a different Continuity Camera session." value:0 table:0 localization:v10];
        }

        unsigned __int16 v41 = +[WiFiP2PXPCConnection frameworkBundle];
        CFNumberRef v33 = v41;
        v42 = @"To connect Continuity Camera to another device, disconnect the previous one first.";
        goto LABEL_73;
      }
      if ([v13 isEqual:@"RemoteScreen"])
      {
        CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
        CFNumberRef v33 = v32;
        CFTypeID v34 = @"To use Continuity Camera, disconnect iPhone Mirroring first.";
        goto LABEL_64;
      }
    }
    else
    {
      if (![v14 isEqual:@"RemoteScreen"])
      {
        v43 = v10;
        v25 = &stru_1F1806D08;
        v44 = &stru_1F1806D08;
        goto LABEL_75;
      }
      unsigned __int16 v40 = +[WiFiP2PXPCConnection frameworkBundle];
      v25 = [v40 localizedStringForKey:@"Unable to Connect to iPhone Mirroring" value:0 table:0 localization:v10];

      if ([v13 isEqual:@"airplay"])
      {
        CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
        CFNumberRef v33 = v32;
        CFTypeID v34 = @"To use iPhone Mirroring, disconnect AirPlay first.";
        goto LABEL_64;
      }
      if ([v13 isEqual:@"sidecar"])
      {
        CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
        CFNumberRef v33 = v32;
        CFTypeID v34 = @"To use iPhone Mirroring, disconnect Sidecar first.";
        goto LABEL_64;
      }
      if ([v13 isEqual:@"RemoteCamera"])
      {
        CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
        CFNumberRef v33 = v32;
        CFTypeID v34 = @"To use iPhone Mirroring, disconnect Continuity Camera first.";
        goto LABEL_64;
      }
      if ([v13 isEqual:@"RemoteScreen"])
      {
        if (v9)
        {
          id v49 = [NSString alloc];
          v50 = +[WiFiP2PXPCConnection frameworkBundle];
          uint64_t v51 = [v50 localizedStringForKey:@"%@ unable to connect to iPhone Mirroring while active with another device." value:0 table:0 localization:v10];
          v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v10];
          uint64_t v30 = objc_msgSend(v49, "initWithFormat:locale:", v51, v52, v9, v13, v63);

          CFTypeID v15 = (__CFString *)v51;
        }
        else
        {
          v50 = +[WiFiP2PXPCConnection frameworkBundle];
          uint64_t v30 = [v50 localizedStringForKey:@"Unable to connect while the other device is active in a different iPhone Mirroring session." value:0 table:0 localization:v10];
        }

        unsigned __int16 v41 = +[WiFiP2PXPCConnection frameworkBundle];
        CFNumberRef v33 = v41;
        v42 = @"To connect iPhone Mirroring to another device, disconnect the previous one first.";
        goto LABEL_73;
      }
    }
    goto LABEL_68;
  }
  char v31 = +[WiFiP2PXPCConnection frameworkBundle];
  v25 = [v31 localizedStringForKey:@"Unable to Connect to Sidecar" value:0 table:0 localization:v10];

  if (![v13 isEqual:@"airplay"])
  {
    if ([v13 isEqual:@"sidecar"])
    {
      if (v9)
      {
        id v36 = [NSString alloc];
        CFTypeID v37 = +[WiFiP2PXPCConnection frameworkBundle];
        uint64_t v38 = [v37 localizedStringForKey:@"%@ unable to connect to Sidecar while active with another device." value:0 table:0 localization:v10];
        v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v10];
        uint64_t v30 = objc_msgSend(v36, "initWithFormat:locale:", v38, v39, v9, v13, v63);

        CFTypeID v15 = (__CFString *)v38;
      }
      else
      {
        CFTypeID v37 = +[WiFiP2PXPCConnection frameworkBundle];
        uint64_t v30 = [v37 localizedStringForKey:@"Unable to connect while the other device is active in a different Sidecar session." value:0 table:0 localization:v10];
      }

      unsigned __int16 v41 = +[WiFiP2PXPCConnection frameworkBundle];
      CFNumberRef v33 = v41;
      v42 = @"To connect Sidecar to another device, disconnect the previous one first.";
      goto LABEL_73;
    }
    if ([v13 isEqual:@"RemoteCamera"])
    {
      CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
      CFNumberRef v33 = v32;
      CFTypeID v34 = @"To use Sidecar, disconnect Continuity Camera first.";
      goto LABEL_64;
    }
    if ([v13 isEqual:@"RemoteScreen"])
    {
      CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
      CFNumberRef v33 = v32;
      CFTypeID v34 = @"To use Sidecar, disconnect iPhone Mirroring first.";
      goto LABEL_64;
    }
    goto LABEL_68;
  }
  CFNumberRef v32 = +[WiFiP2PXPCConnection frameworkBundle];
  CFNumberRef v33 = v32;
  CFTypeID v34 = @"To use Sidecar, disconnect AirPlay first.";
LABEL_64:
  v43 = v10;
  v44 = [v32 localizedStringForKey:v34 value:0 table:0 localization:v10];
LABEL_74:

LABEL_75:
  v53 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v54 = *MEMORY[0x1E4F28588];
  v66[0] = *MEMORY[0x1E4F28568];
  v66[1] = v54;
  v67[0] = v25;
  v67[1] = v15;
  uint64_t v55 = *MEMORY[0x1E4F285A0];
  v67[2] = v44;
  uint64_t v56 = *MEMORY[0x1E4F28228];
  v66[2] = v55;
  v66[3] = v56;
  v57 = [v64 description];
  v67[3] = v57;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:4];
  v59 = v58 = v25;
  v60 = [v53 errorWithDomain:@"com.apple.wifip2pd" code:5 userInfo:v59];

  return v60;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (WiFiMACAddress)peerAddress
{
  return self->_peerAddress;
}

- (void)setPeerAddress:(id)a3
{
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (BOOL)legacyUpgradeRequired
{
  return self->_legacyUpgradeRequired;
}

- (void)setLegacyUpgradeRequired:(BOOL)a3
{
  self->_legacyUpgradeRequired = a3;
}

- (unsigned)preferredChannel
{
  return self->_preferredChannel;
}

- (void)setPreferredChannel:(unsigned __int16)a3
{
  self->_preferredChannel = a3;
}

- (unsigned)secondaryPreferredChannel
{
  return self->_secondaryPreferredChannel;
}

- (void)setSecondaryPreferredChannel:(unsigned __int16)a3
{
  self->_secondaryPreferredChannel = a3;
}

- (BOOL)activeFlagOverride
{
  return self->_activeFlagOverride;
}

- (void)setActiveFlagOverride:(BOOL)a3
{
  self->_activeFlagOverride = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_peerAddress, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_derivedLocalization, 0);
}

@end