@interface IDSDevice
+ (BOOL)isDeviceInAltMode;
+ (BOOL)pairedDeviceUniqueIDOverrideExists;
+ (id)pairedDeviceUniqueIDOverride;
- (BOOL)canReceiveMessagesForCallProvider:(id)a3;
- (BOOL)canReceiveRelayedCalls;
- (BOOL)canReceiveRelayedGFTCalls;
- (BOOL)isAudioAccessoryDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPairedDevice;
- (BOOL)isWatchDevice;
- (BOOL)supportsRelayCallingWithoutLocalRelayCallingEnabled;
- (BOOL)supportsRestrictingSecondaryCalling;
- (NSArray)csd_aliasStrings;
- (NSString)csd_localizedDeviceCategory;
- (id)csd_destinationForAlias:(id)a3;
- (id)normalizedDeviceType;
@end

@implementation IDSDevice

- (id)normalizedDeviceType
{
  v2 = [(IDSDevice *)self modelIdentifier];
  if ([v2 rangeOfString:@"iPod"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v2 rangeOfString:@"iPad"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v2 rangeOfString:@"iPhone"] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v2 rangeOfString:@"Mac"] == (id)0x7FFFFFFFFFFFFFFFLL) {
          v3 = &stru_100517F40;
        }
        else {
          v3 = @"MAC";
        }
      }
      else
      {
        v3 = @"IPHONE";
      }
    }
    else
    {
      v3 = @"IPAD";
    }
  }
  else
  {
    v3 = @"IPOD";
  }
  if (![(__CFString *)v3 length])
  {
    v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[WARN] Couldn't identify device type based on model identifier (%@)", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

- (NSString)csd_localizedDeviceCategory
{
  v2 = 0;
  switch((unint64_t)[(IDSDevice *)self deviceType])
  {
    case 1uLL:
      v3 = TUBundle();
      v4 = v3;
      CFStringRef v5 = @"MAC";
      goto LABEL_7;
    case 2uLL:
      v3 = TUBundle();
      v4 = v3;
      CFStringRef v5 = @"IPHONE";
      goto LABEL_7;
    case 3uLL:
      v3 = TUBundle();
      v4 = v3;
      CFStringRef v5 = @"IPOD";
      goto LABEL_7;
    case 4uLL:
      v3 = TUBundle();
      v4 = v3;
      CFStringRef v5 = @"IPAD";
      goto LABEL_7;
    case 9uLL:
      v3 = TUBundle();
      v4 = v3;
      CFStringRef v5 = @"VISIONPRO";
LABEL_7:
      v2 = [v3 localizedStringForKey:v5 value:&stru_100517F40 table:@"TelephonyUtilities"];

      break;
    default:
      break;
  }

  return (NSString *)v2;
}

- (NSArray)csd_aliasStrings
{
  v2 = [(IDSDevice *)self identities];
  v3 = objc_msgSend(v2, "__imArrayByApplyingBlock:", &stru_100509AB0);

  return (NSArray *)v3;
}

- (id)csd_destinationForAlias:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(IDSDevice *)self pushToken];
  int v6 = (void *)IDSCopyBestGuessIDForID();

  v7 = (void *)IDSCopyIDForTokenWithID();

  return v7;
}

+ (id)pairedDeviceUniqueIDOverride
{
  if (qword_10058C5A0 != -1) {
    dispatch_once(&qword_10058C5A0, &stru_10050A270);
  }
  v2 = (void *)qword_10058C598;

  return v2;
}

+ (BOOL)pairedDeviceUniqueIDOverrideExists
{
  v2 = [a1 pairedDeviceUniqueIDOverride];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (BOOL)isDeviceInAltMode
{
  return 0;
}

- (BOOL)isPairedDevice
{
  if ([(IDSDevice *)self isDefaultPairedDevice]
    && ([(IDSDevice *)self isConnected] & 1) != 0)
  {
    return 1;
  }
  id v4 = [(id)objc_opt_class() pairedDeviceUniqueIDOverride];
  CFStringRef v5 = [(IDSDevice *)self uniqueIDOverride];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)isWatchDevice
{
  v2 = [(IDSDevice *)self modelIdentifier];
  unsigned __int8 v3 = [v2 hasPrefix:@"Watch"];

  return v3;
}

- (BOOL)isAudioAccessoryDevice
{
  v2 = [(IDSDevice *)self modelIdentifier];
  unsigned __int8 v3 = [v2 hasPrefix:@"AudioAccessory"];

  return v3;
}

- (BOOL)supportsRestrictingSecondaryCalling
{
  if ([(IDSDevice *)self isWatchDevice]) {
    return 0;
  }
  else {
    return ![(IDSDevice *)self isAudioAccessoryDevice];
  }
}

- (BOOL)supportsRelayCallingWithoutLocalRelayCallingEnabled
{
  if ([(IDSDevice *)self isPairedDevice]) {
    return 1;
  }

  return [(IDSDevice *)self isAudioAccessoryDevice];
}

- (BOOL)canReceiveRelayedCalls
{
  unsigned __int8 v3 = [(IDSDevice *)self uniqueIDOverride];
  if (+[TUCallCapabilities isRelayCallingEnabledForDeviceWithID:v3])unsigned int v4 = 1; {
  else
  }
    unsigned int v4 = ![(IDSDevice *)self supportsRestrictingSecondaryCalling];

  if ([(IDSDevice *)self supportsRelayCallingWithoutLocalRelayCallingEnabled])
  {
    unsigned __int8 v5 = +[TUCallCapabilities areRelayCallingFeaturesEnabled];
    if (!v4) {
      return 0;
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
    if (!v4) {
      return 0;
    }
  }
  return +[TUCallCapabilities isRelayCallingEnabled] | v5;
}

- (BOOL)canReceiveRelayedGFTCalls
{
  if (![(IDSDevice *)self canReceiveRelayedCalls]) {
    return 0;
  }
  unsigned __int8 v3 = [(IDSDevice *)self capabilities];
  BOOL v4 = [v3 valueForCapability:IDSRegistrationPropertySupportsGFTRelay] != 0;

  return v4;
}

- (BOOL)canReceiveMessagesForCallProvider:(id)a3
{
  id v4 = a3;
  if (([v4 isTelephonyProvider] & 1) == 0)
  {
    if ([v4 isFaceTimeProvider])
    {
      if (![(IDSDevice *)self isPairedDevice]
        && ![(IDSDevice *)self isAudioAccessoryDevice])
      {
LABEL_9:
        BOOL v5 = 0;
        goto LABEL_10;
      }
    }
    else if (![v4 isTinCanProvider] {
           || ![(IDSDevice *)self isPairedDevice])
    }
    {
      goto LABEL_9;
    }
  }
  BOOL v5 = [(IDSDevice *)self canReceiveRelayedCalls];
LABEL_10:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned __int8 v6 = [(IDSDevice *)self uniqueIDOverride];
    v7 = [v5 uniqueIDOverride];

    unsigned __int8 v8 = [v6 isEqualToString:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

@end