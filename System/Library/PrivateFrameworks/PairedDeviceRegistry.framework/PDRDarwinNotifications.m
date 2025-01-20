@interface PDRDarwinNotifications
+ (char)deviceDidPair;
+ (char)deviceDidUnpair;
+ (char)deviceIsPairingLinkIsUp;
+ (char)initialPairedSyncDidComplete;
+ (char)migrationPairedSyncDidComplete;
+ (char)pairedDeviceDidChangeCapabilities;
+ (char)pairedDeviceDidChangeVersion;
+ (char)pairedSyncIsOkayToSync;
+ (char)remoteUnpairingBeginning;
+ (char)restarted;
+ (char)reunionPairedSyncDidComplete;
+ (char)watchDidBecomeActive;
@end

@implementation PDRDarwinNotifications

+ (char)deviceIsPairingLinkIsUp
{
  return "com.apple.nanoregistry.deviceispairinglinkisup";
}

+ (char)deviceDidPair
{
  return "com.apple.nanoregistry.devicedidpair";
}

+ (char)deviceDidUnpair
{
  return "com.apple.nanoregistry.devicedidunpair";
}

+ (char)restarted
{
  return "com.apple.nanoregistry.restarted";
}

+ (char)remoteUnpairingBeginning
{
  return "com.apple.nanoregistry.remoteunpairingbeginning";
}

+ (char)pairedDeviceDidChangeVersion
{
  return "com.apple.nanoregistry.paireddevicedidchangeversion";
}

+ (char)pairedDeviceDidChangeCapabilities
{
  return "com.apple.nanoregistry.paireddevicedidchangecapabilities";
}

+ (char)watchDidBecomeActive
{
  return "com.apple.nanoregistry.watchdidbecomeactive";
}

+ (char)initialPairedSyncDidComplete
{
  return "com.apple.nanoregistry.pairedSync.initialSyncDidComplete";
}

+ (char)migrationPairedSyncDidComplete
{
  return "com.apple.nanoregistry.pairedSync.migrationSyncDidComplete";
}

+ (char)reunionPairedSyncDidComplete
{
  return "com.apple.nanoregistry.pairedSync.reunionSyncDidComplete";
}

+ (char)pairedSyncIsOkayToSync
{
  return "com.apple.nanoregistry.pairedsync.isokaytosync";
}

@end