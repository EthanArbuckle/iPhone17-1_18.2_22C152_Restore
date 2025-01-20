@interface WPScanRequest
+ (BOOL)supportsSecureCoding;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)scanningRates;
- (BOOL)activeScanning;
- (BOOL)allowDuplicates;
- (BOOL)holdVoucher;
- (BOOL)priorityCritical;
- (BOOL)range;
- (BOOL)retainDuplicates;
- (BOOL)scanCache;
- (BOOL)scanWhenLocked;
- (BOOL)startPending;
- (NSArray)peers;
- (NSArray)useCaseList;
- (NSData)blobValue;
- (NSData)maskValue;
- (NSDictionary)options;
- (NSNumber)rssiThreshold;
- (WPScanRequest)init;
- (WPScanRequest)initWithCoder:(id)a3;
- (double)updateTime;
- (id)convertUseCaseToString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)advBuffer;
- (int64_t)nearbyScanMode;
- (unsigned)clientType;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveScanning:(BOOL)a3;
- (void)setAdvBuffer:(int64_t)a3;
- (void)setAllowDuplicates:(BOOL)a3;
- (void)setBlobValue:(id)a3;
- (void)setClientType:(unsigned __int8)a3;
- (void)setHoldVoucher:(BOOL)a3;
- (void)setMaskValue:(id)a3;
- (void)setNearbyScanMode:(int64_t)a3;
- (void)setOptions:(id)a3;
- (void)setPeers:(id)a3;
- (void)setPriorityCritical:(BOOL)a3;
- (void)setRange:(BOOL)a3;
- (void)setRetainDuplicates:(BOOL)a3;
- (void)setRssiThreshold:(id)a3;
- (void)setScanCache:(BOOL)a3;
- (void)setScanWhenLocked:(BOOL)a3;
- (void)setScanningRates:(id *)a3;
- (void)setStartPending:(BOOL)a3;
- (void)setUpdateTime:(double)a3;
- (void)setUseCaseList:(id)a3;
@end

@implementation WPScanRequest

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)scanningRates
{
  objc_copyStruct(retstr, &self->_scanningRates, 24, 1, 0);
  return result;
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (NSArray)peers
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSData)maskValue
{
  return self->_maskValue;
}

- (NSData)blobValue
{
  return self->_blobValue;
}

- (NSNumber)rssiThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)allowDuplicates
{
  return self->_allowDuplicates;
}

- (NSArray)useCaseList
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)range
{
  return self->_range;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (WPScanRequest)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WPScanRequest;
  v5 = [(WPScanRequest *)&v26 init];
  if (v5)
  {
    v5->_clientType = [v4 decodeIntegerForKey:@"kClientType"];
    v5->_scanningRates.screenOffInterval = [v4 decodeIntegerForKey:@"kScanningRatesScreenOff"];
    v5->_scanningRates.screenOnInterval = [v4 decodeIntegerForKey:@"kScanningRatesScreenOn"];
    v5->_scanningRates.window = [v4 decodeIntegerForKey:@"kScanningRatesWindow"];
    v5->_scanWhenLocked = [v4 decodeBoolForKey:@"kScanWhenLocked"];
    v5->_scanCache = [v4 decodeBoolForKey:@"kWPScanCache"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRSSIThreshold"];
    rssiThreshold = v5->_rssiThreshold;
    v5->_rssiThreshold = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBlobValue"];
    blobValue = v5->_blobValue;
    v5->_blobValue = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMaskValue"];
    maskValue = v5->_maskValue;
    v5->_maskValue = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kScanningOptions"];
    options = v5->_options;
    v5->_options = (NSDictionary *)v12;

    v14 = (void *)MEMORY[0x263EFFA08];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    v16 = [v14 setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"kPeers"];
    peers = v5->_peers;
    v5->_peers = (NSArray *)v17;

    v5->_allowDuplicates = [v4 decodeBoolForKey:@"kAllowDuplicates"];
    v5->_activeScanning = [v4 decodeBoolForKey:@"kActiveScanning"];
    [v4 decodeDoubleForKey:@"kUpdateTime"];
    v5->_updateTime = v19;
    v5->_nearbyScanMode = [v4 decodeIntegerForKey:@"kNearbyScanMode"];
    v5->_advBuffer = [v4 decodeIntegerForKey:@"kAdvBuffer"];
    v5->_priorityCritical = [v4 decodeBoolForKey:@"kPriorityCritical"];
    v5->_range = [v4 decodeBoolForKey:@"kRange"];
    v5->_holdVoucher = [v4 decodeBoolForKey:@"kHoldVoucher"];
    v20 = (void *)MEMORY[0x263EFFA08];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
    v22 = [v20 setWithArray:v21];
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"kUseCases"];
    useCaseList = v5->_useCaseList;
    v5->_useCaseList = (NSArray *)v23;

    v5->_retainDuplicates = [v4 decodeBoolForKey:@"kRetainDuplicates"];
    v5->_startPending = [v4 decodeBoolForKey:@"kStartPending"];
  }

  return v5;
}

- (id)description
{
  [(WPScanRequest *)self scanningRates];
  if (v29 == 0xFFFF)
  {
    v25 = @"No Scan";
  }
  else
  {
    v3 = NSString;
    [(WPScanRequest *)self scanningRates];
    objc_msgSend(v3, "stringWithFormat:", @"%ld", v28);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [(WPScanRequest *)self scanningRates];
  if (v27 == 0xFFFF)
  {
    v24 = @"No Scan";
  }
  else
  {
    id v4 = NSString;
    [(WPScanRequest *)self scanningRates];
    objc_msgSend(v4, "stringWithFormat:", @"%ld", v26);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v23 = NSString;
  uint64_t v22 = [(WPScanRequest *)self clientType];
  v21 = [(WPScanRequest *)self blobValue];
  v20 = [(WPScanRequest *)self maskValue];
  BOOL v19 = [(WPScanRequest *)self activeScanning];
  BOOL v18 = [(WPScanRequest *)self allowDuplicates];
  BOOL v17 = [(WPScanRequest *)self scanWhenLocked];
  v5 = [(WPScanRequest *)self rssiThreshold];
  uint64_t v6 = [v5 integerValue];
  v7 = [(WPScanRequest *)self peers];
  int64_t v8 = [(WPScanRequest *)self nearbyScanMode];
  int64_t v9 = [(WPScanRequest *)self advBuffer];
  BOOL v10 = [(WPScanRequest *)self priorityCritical];
  BOOL v11 = [(WPScanRequest *)self range];
  BOOL v12 = [(WPScanRequest *)self retainDuplicates];
  v13 = [(WPScanRequest *)self useCaseList];
  v14 = [(WPScanRequest *)self convertUseCaseToString:v13];
  v15 = [v23 stringWithFormat:@"scan request of type %ld, blob: %@, mask %@, active: %d, duplicates: %d, screen on: %@, screen off: %@, locked: %d, rssi: %ld, peers: %@ nearby scan mode: %ld, advbuf: %ld, priority critical: %d, range: %d, retain duplicates: %d, usecases: %@", v22, v21, v20, v19, v18, v25, v24, v17, v6, v7, v8, v9, v10, v11, v12, v14];

  return v15;
}

- (BOOL)retainDuplicates
{
  return self->_retainDuplicates;
}

- (BOOL)priorityCritical
{
  return self->_priorityCritical;
}

- (BOOL)activeScanning
{
  return self->_activeScanning;
}

- (int64_t)nearbyScanMode
{
  return self->_nearbyScanMode;
}

- (BOOL)scanWhenLocked
{
  return self->_scanWhenLocked;
}

- (id)convertUseCaseToString:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F089D8] string];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = NSString;
        int v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) integerValue];
        if (v11 >= 0x20000)
        {
          if (v11 >= 327680)
          {
            if (v11 > 589824)
            {
              if (v11 <= 2147418111)
              {
                switch(v11)
                {
                  case 589825:
                    BOOL v12 = "FindNearbyPencil";
                    break;
                  case 655360:
                    BOOL v12 = "AccessDigitalHomeKey";
                    break;
                  case 786432:
                    BOOL v12 = "ProxControlDeviceClose";
                    break;
                  default:
LABEL_147:
                    BOOL v12 = "?";
                    break;
                }
              }
              else
              {
                switch(v11)
                {
                  case 2147418112:
                    BOOL v12 = "InternalTestNoLockScan";
                    break;
                  case 2147418113:
                    BOOL v12 = "InternalTestNoScreenOffScan";
                    break;
                  case 2147418114:
                    BOOL v12 = "InternalTestScanWithNoDups";
                    break;
                  case 2147418115:
                    BOOL v12 = "InternalTestScanWithDups";
                    break;
                  case 2147418116:
                    BOOL v12 = "InternalTestScanFor20Seconds";
                    break;
                  case 2147418117:
                    BOOL v12 = "InternalTestActiveScan";
                    break;
                  case 2147418118:
                    BOOL v12 = "InternalTestUUIDScan";
                    break;
                  case 2147418119:
                    BOOL v12 = "InternalTestScanFor10ClockSeconds";
                    break;
                  case 2147418120:
                    BOOL v12 = "InternalTestScanBoost";
                    break;
                  default:
                    goto LABEL_147;
                }
              }
            }
            else if (v11 > 458752)
            {
              switch(v11)
              {
                case 524288:
                  BOOL v12 = "ADPD";
                  break;
                case 524289:
                  BOOL v12 = "ADPDBuffer";
                  break;
                case 524290:
                  BOOL v12 = "MicroLocation";
                  break;
                case 524291:
                  BOOL v12 = "MicroLocationLeech";
                  break;
                default:
                  if (v11 == 458753)
                  {
                    BOOL v12 = "PrecisionFindingFindee";
                  }
                  else
                  {
                    if (v11 != 589824) {
                      goto LABEL_147;
                    }
                    BOOL v12 = "FindNearbyRemote";
                  }
                  break;
              }
            }
            else
            {
              switch(v11)
              {
                case 393216:
                  BOOL v12 = "CaptiveNetworkJoin";
                  break;
                case 393217:
                  BOOL v12 = "UseCaseSIMTransfer";
                  break;
                case 393218:
                  BOOL v12 = "MacSetup";
                  break;
                case 393219:
                  BOOL v12 = "AppleIDSignIn";
                  break;
                case 393220:
                  BOOL v12 = "AppleIDSignInSettings";
                  break;
                default:
                  if (v11 == 327680)
                  {
                    BOOL v12 = "RapportThirdParty";
                  }
                  else
                  {
                    if (v11 != 458752) {
                      goto LABEL_147;
                    }
                    BOOL v12 = "PrecisionFindingFinder";
                  }
                  break;
              }
            }
          }
          else
          {
            switch(v11)
            {
              case 131072:
                BOOL v12 = "SharingDefault";
                break;
              case 131073:
                BOOL v12 = "SharingPhoneAutoUnlock";
                break;
              case 131074:
                BOOL v12 = "SharingSiriWatchAuth";
                break;
              case 131075:
                BOOL v12 = "SharingMacAutoUnlock";
                break;
              case 131076:
                BOOL v12 = "SharingEDTScreenOn";
                break;
              case 131077:
                BOOL v12 = "SharingEDTWiFiDisabled";
                break;
              case 131078:
                BOOL v12 = "SharingEDTWombatEligibleAsDefaultCamera";
                break;
              case 131079:
                BOOL v12 = "SharingEDTWombatCameraPicker";
                break;
              case 131080:
                BOOL v12 = "SharingWombatBackground";
                break;
              case 131081:
                BOOL v12 = "SharingUniversalControl";
                break;
              case 131082:
                BOOL v12 = "SharingPeopleProximity";
                break;
              case 131083:
                BOOL v12 = "SharingEDTEnsembleOpenDisplayPrefs";
                break;
              case 131084:
                BOOL v12 = "SharingEDTNearbydMotionStopped";
                break;
              case 131085:
                BOOL v12 = "SharingDoubleBoostGenericScan";
                break;
              case 131086:
                BOOL v12 = "SharingEDTIncomingAdvertisement ";
                break;
              case 131087:
                BOOL v12 = "SharingEDTWombatStreamStart";
                break;
              case 131088:
                BOOL v12 = "SharingOYAutoUnlock";
                break;
              case 131089:
                goto LABEL_147;
              case 131090:
                BOOL v12 = "SharingAirDrop";
                break;
              case 131091:
                BOOL v12 = "SharingNearbyInvitationHost";
                break;
              case 131092:
                BOOL v12 = "SharingNearbyInvitationParticipant";
                break;
              case 131093:
                BOOL v12 = "SharingAirDropAskToAirDrop";
                break;
              case 131094:
                BOOL v12 = "SharingAirDropTempIdentity";
                break;
              case 131095:
                BOOL v12 = "SharingAirDropNeedsCLink";
                break;
              case 131096:
                BOOL v12 = "SharingRemoteWidgetUpdate";
                break;
              case 131097:
                BOOL v12 = "SharingCountryCodeUpdate";
                break;
              case 131098:
                BOOL v12 = "SharingMacPhoneAutoUnlock";
                break;
              case 131099:
                BOOL v12 = "SharingVisionProDiscovery";
                break;
              case 131100:
                BOOL v12 = "SharingVisionProStateChange";
                break;
              case 131101:
                BOOL v12 = "SharingContinuityScreen";
                break;
              case 131102:
                BOOL v12 = "SharingEDTRemoteDisplay";
                break;
              default:
                if (v11 == 196608)
                {
                  BOOL v12 = "DigitalIDTSA";
                }
                else
                {
                  if (v11 != 0x40000) {
                    goto LABEL_147;
                  }
                  BOOL v12 = "DigitalCarKeyThirdParty";
                }
                break;
            }
          }
        }
        else if (v11 <= 0x20000)
        {
          switch(v11)
          {
            case 65536:
              BOOL v12 = "FindMyAction";
              break;
            case 65537:
              BOOL v12 = "FindMyBackground";
              break;
            case 65538:
              BOOL v12 = "FindMyActionHELE";
              break;
            case 65539:
              BOOL v12 = "FindMyBackgroundHELE";
              break;
            case 65540:
              BOOL v12 = "FindMyActionTransient";
              break;
            case 65541:
              BOOL v12 = "FindMyBackgroundTransient";
              break;
            case 65542:
              BOOL v12 = "FindMyActionHELETransient";
              break;
            case 65543:
              BOOL v12 = "FindMyBackgroundHELETransient";
              break;
            case 65544:
              BOOL v12 = "FindMyNotOptedIn";
              break;
            case 65545:
              BOOL v12 = "FindMyOptedIn";
              break;
            case 65546:
              BOOL v12 = "FindMySepAlertsEnabled";
              break;
            case 65547:
              BOOL v12 = "FindMyTemporaryAggressiveLegacy";
              break;
            case 65548:
              BOOL v12 = "FindMyTemporaryLongAggressive";
              break;
            case 65549:
              BOOL v12 = "FindMyBTFindingUserInitiated";
              break;
            case 65550:
              BOOL v12 = "FindMyHELE";
              break;
            case 65551:
              BOOL v12 = "FindMyBeaconOnDemand";
              break;
            case 65552:
              BOOL v12 = "FindMyWildTimedScan";
              break;
            case 65553:
              BOOL v12 = "FindMyBackgroundLeechScan";
              break;
            case 65554:
              BOOL v12 = "FindMySnifferMode";
              break;
            case 65555:
              BOOL v12 = "FindMyUnpair";
              break;
            case 65556:
              BOOL v12 = "FindMyUnpairHELE";
              break;
            case 65557:
              BOOL v12 = "FindMyPlaySound";
              break;
            case 65558:
              BOOL v12 = "FindMyPlaySoundHELE";
              break;
            case 65559:
              BOOL v12 = "FindMyNotOptedInBeepOnMoveWaking";
              break;
            case 65560:
              BOOL v12 = "FindMyUTTransient";
              break;
            case 65561:
              BOOL v12 = "FindMyUTHELETransient";
              break;
            default:
              JUMPOUT(0);
          }
        }
        else
        {
          BOOL v12 = "Unspecified";
          switch(v11)
          {
            case 0:
              break;
            case 1:
              BOOL v12 = "HealthKit";
              break;
            case 2:
              BOOL v12 = "HomeKit";
              break;
            case 3:
              BOOL v12 = "FindMyObjectConnection";
              break;
            case 4:
              BOOL v12 = "FindMyObjectConnectionTransient";
              break;
            case 5:
              BOOL v12 = "MIDI";
              break;
            case 6:
              BOOL v12 = "Continuity";
              break;
            case 7:
              BOOL v12 = "InstantHotSpot";
              break;
            case 8:
              BOOL v12 = "NearBy";
              break;
            case 9:
              BOOL v12 = "Sharing";
              break;
            case 10:
              BOOL v12 = "HearingSupport";
              break;
            case 11:
              BOOL v12 = "Magnet";
              break;
            case 12:
              BOOL v12 = "HID";
              break;
            case 13:
              BOOL v12 = "LEA";
              break;
            case 14:
              BOOL v12 = "External";
              break;
            case 15:
              BOOL v12 = "ExternalMedical";
              break;
            case 16:
              BOOL v12 = "ExternalLock";
              break;
            case 17:
              BOOL v12 = "ExternalWatch";
              break;
            case 18:
              BOOL v12 = "SmartRouting";
              break;
            case 19:
              BOOL v12 = "DigitalID";
              break;
            case 20:
              BOOL v12 = "DigitalKey";
              break;
            case 21:
              BOOL v12 = "DigitalCarKey";
              break;
            case 22:
              BOOL v12 = "HeySiri";
              break;
            case 23:
              BOOL v12 = "ThirdPartyApp";
              break;
            case 24:
              BOOL v12 = "CNJ";
              break;
            default:
              switch(v11)
              {
                case 256:
                  BOOL v12 = "DevicePresenceDetection";
                  break;
                case 257:
                  BOOL v12 = "AudioBox";
                  break;
                case 258:
                  BOOL v12 = "SIMTransfer";
                  break;
                case 259:
                  BOOL v12 = "ProximityScreenOnLeechScan";
                  break;
                case 260:
                  BOOL v12 = "MacMigrate";
                  break;
                case 263:
                  BOOL v12 = "HIDUARTService";
                  break;
                case 264:
                  BOOL v12 = "AccessibilitySwitchControlPairing";
                  break;
                case 265:
                  BOOL v12 = "BaseBandFastConnect";
                  break;
                case 266:
                  BOOL v12 = "SafetyAlerts";
                  break;
                case 267:
                  BOOL v12 = "LECarPlay";
                  break;
                case 268:
                  BOOL v12 = "TCCBluetooth";
                  break;
                case 269:
                  BOOL v12 = "AOPBufferLeech";
                  break;
                default:
                  goto LABEL_147;
              }
              break;
          }
        }
        v13 = [v10 stringWithUTF8String:v12];
        [v4 appendFormat:@"%@ ", v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (int64_t)advBuffer
{
  return self->_advBuffer;
}

- (BOOL)startPending
{
  return self->_startPending;
}

- (double)updateTime
{
  return self->_updateTime;
}

- (void)setStartPending:(BOOL)a3
{
  self->_startPending = a3;
}

- (void)setMaskValue:(id)a3
{
  id v4 = (NSData *)a3;
  if ([(NSData *)v4 length] >= 0x17) {
    [MEMORY[0x263EFF940] raise:@"MaskValueTooLong", @"The mask value provided %@ is longer than the %ld bytes", v4, 22 format];
  }
  maskValue = self->_maskValue;
  self->_maskValue = v4;
}

- (void)setBlobValue:(id)a3
{
  id v4 = (NSData *)a3;
  if ([(NSData *)v4 length] >= 0x17) {
    [MEMORY[0x263EFF940] raise:@"BlobValueTooLong", @"The blob value provided %@ is longer than the %ld bytes", v4, 22 format];
  }
  blobValue = self->_blobValue;
  self->_blobValue = v4;
}

- (BOOL)holdVoucher
{
  return self->_holdVoucher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCaseList, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_maskValue, 0);
  objc_storeStrong((id *)&self->_blobValue, 0);
  objc_storeStrong((id *)&self->_rssiThreshold, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WPScanRequest)init
{
  v17.receiver = self;
  v17.super_class = (Class)WPScanRequest;
  v2 = [(WPScanRequest *)&v17 init];
  id v3 = v2;
  if (v2)
  {
    *(void *)&long long v4 = 0xFFFFLL;
    *((void *)&v4 + 1) = 0xFFFFLL;
    *(_OWORD *)&v2->_scanningRates.screenOnInterval = v4;
    v2->_scanningRates.window = 0xFFFFLL;
    v2->_scanWhenLocked = 1;
    rssiThreshold = v2->_rssiThreshold;
    v2->_rssiThreshold = (NSNumber *)&unk_26D646E18;

    uint64_t v6 = [MEMORY[0x263EFF8C0] array];
    peers = v3->_peers;
    v3->_peers = (NSArray *)v6;

    v3->_allowDuplicates = 0;
    *(_WORD *)&v3->_activeScanning = 0;
    uint64_t v8 = [NSDictionary dictionary];
    options = v3->_options;
    v3->_options = (NSDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF8F8] data];
    blobValue = v3->_blobValue;
    v3->_blobValue = (NSData *)v10;

    uint64_t v12 = [MEMORY[0x263EFF8F8] data];
    maskValue = v3->_maskValue;
    v3->_maskValue = (NSData *)v12;

    v3->_clientType = 27;
    v3->_updateTime = 0.0;
    *(_OWORD *)&v3->_nearbyScanMode = xmmword_2231CEC90;
    *(_WORD *)&v3->_priorityCritical = 0;
    v3->_holdVoucher = 0;
    uint64_t v14 = [MEMORY[0x263EFF8C0] array];
    useCaseList = v3->_useCaseList;
    v3->_useCaseList = (NSArray *)v14;

    *(_WORD *)&v3->_retainDuplicates = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  long long v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setClientType:", -[WPScanRequest clientType](self, "clientType"));
    [(WPScanRequest *)self scanningRates];
    long long v12 = v14;
    uint64_t v13 = v15;
    [v4 setScanningRates:&v12];
    objc_msgSend(v4, "setAllowDuplicates:", -[WPScanRequest allowDuplicates](self, "allowDuplicates"));
    objc_msgSend(v4, "setScanCache:", -[WPScanRequest scanCache](self, "scanCache"));
    objc_msgSend(v4, "setScanWhenLocked:", -[WPScanRequest scanWhenLocked](self, "scanWhenLocked"));
    objc_msgSend(v4, "setActiveScanning:", -[WPScanRequest activeScanning](self, "activeScanning"));
    id v5 = [(WPScanRequest *)self rssiThreshold];
    [v4 setRssiThreshold:v5];

    uint64_t v6 = [(WPScanRequest *)self blobValue];
    [v4 setBlobValue:v6];

    uint64_t v7 = [(WPScanRequest *)self maskValue];
    [v4 setMaskValue:v7];

    uint64_t v8 = [(WPScanRequest *)self options];
    [v4 setOptions:v8];

    int64_t v9 = [(WPScanRequest *)self peers];
    [v4 setPeers:v9];

    [(WPScanRequest *)self updateTime];
    objc_msgSend(v4, "setUpdateTime:");
    objc_msgSend(v4, "setNearbyScanMode:", -[WPScanRequest nearbyScanMode](self, "nearbyScanMode"));
    objc_msgSend(v4, "setAdvBuffer:", -[WPScanRequest advBuffer](self, "advBuffer"));
    objc_msgSend(v4, "setPriorityCritical:", -[WPScanRequest priorityCritical](self, "priorityCritical"));
    objc_msgSend(v4, "setRange:", -[WPScanRequest range](self, "range"));
    objc_msgSend(v4, "setHoldVoucher:", -[WPScanRequest holdVoucher](self, "holdVoucher"));
    uint64_t v10 = [(WPScanRequest *)self useCaseList];
    [v4 setUseCaseList:v10];

    objc_msgSend(v4, "setRetainDuplicates:", -[WPScanRequest retainDuplicates](self, "retainDuplicates"));
    objc_msgSend(v4, "setStartPending:", -[WPScanRequest startPending](self, "startPending"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPScanRequest clientType](self, "clientType"), @"kClientType");
  [(WPScanRequest *)self scanningRates];
  [v4 encodeInteger:v13 forKey:@"kScanningRatesScreenOn"];
  [(WPScanRequest *)self scanningRates];
  [v4 encodeInteger:v12 forKey:@"kScanningRatesScreenOff"];
  [(WPScanRequest *)self scanningRates];
  [v4 encodeInteger:v11 forKey:@"kScanningRatesWindow"];
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest scanWhenLocked](self, "scanWhenLocked"), @"kScanWhenLocked");
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest scanCache](self, "scanCache"), @"kWPScanCache");
  id v5 = [(WPScanRequest *)self rssiThreshold];
  [v4 encodeObject:v5 forKey:@"kRSSIThreshold"];

  uint64_t v6 = [(WPScanRequest *)self blobValue];
  [v4 encodeObject:v6 forKey:@"kBlobValue"];

  uint64_t v7 = [(WPScanRequest *)self maskValue];
  [v4 encodeObject:v7 forKey:@"kMaskValue"];

  uint64_t v8 = [(WPScanRequest *)self options];
  [v4 encodeObject:v8 forKey:@"kScanningOptions"];

  int64_t v9 = [(WPScanRequest *)self peers];
  [v4 encodeObject:v9 forKey:@"kPeers"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest allowDuplicates](self, "allowDuplicates"), @"kAllowDuplicates");
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest activeScanning](self, "activeScanning"), @"kActiveScanning");
  [(WPScanRequest *)self updateTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"kUpdateTime");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPScanRequest nearbyScanMode](self, "nearbyScanMode"), @"kNearbyScanMode");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPScanRequest advBuffer](self, "advBuffer"), @"kAdvBuffer");
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest priorityCritical](self, "priorityCritical"), @"kPriorityCritical");
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest range](self, "range"), @"kRange");
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest holdVoucher](self, "holdVoucher"), @"kHoldVoucher");
  uint64_t v10 = [(WPScanRequest *)self useCaseList];
  [v4 encodeObject:v10 forKey:@"kUseCases"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest retainDuplicates](self, "retainDuplicates"), @"kRetainDuplicates");
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest startPending](self, "startPending"), @"kStartPending");
}

- (void)setClientType:(unsigned __int8)a3
{
  self->_clientType = a3;
}

- (void)setScanningRates:(id *)a3
{
}

- (void)setAllowDuplicates:(BOOL)a3
{
  self->_allowDuplicates = a3;
}

- (void)setScanWhenLocked:(BOOL)a3
{
  self->_scanWhenLocked = a3;
}

- (void)setActiveScanning:(BOOL)a3
{
  self->_activeScanning = a3;
}

- (void)setScanCache:(BOOL)a3
{
  self->_scanCache = a3;
}

- (void)setRssiThreshold:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOptions:(id)a3
{
}

- (void)setPeers:(id)a3
{
}

- (void)setUpdateTime:(double)a3
{
  self->_updateTime = a3;
}

- (void)setNearbyScanMode:(int64_t)a3
{
  self->_nearbyScanMode = a3;
}

- (void)setAdvBuffer:(int64_t)a3
{
  self->_advBuffer = a3;
}

- (void)setPriorityCritical:(BOOL)a3
{
  self->_priorityCritical = a3;
}

- (void)setRange:(BOOL)a3
{
  self->_range = a3;
}

- (void)setHoldVoucher:(BOOL)a3
{
  self->_holdVoucher = a3;
}

- (void)setUseCaseList:(id)a3
{
}

- (void)setRetainDuplicates:(BOOL)a3
{
  self->_retainDuplicates = a3;
}

@end