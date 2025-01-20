@interface ManagedConfigWrapper
+ (id)sharedInstance;
- (BOOL)isEAPShareBlockedByManagedDefault;
- (BOOL)isMegaWiFiProfileInstalled;
- (BOOL)isSupervisedDevice;
- (BOOL)isWiFiNetworkMDMNetwork:(__WiFiNetwork *)a3;
- (BOOL)isWiFiNetworkSubjectToMDM:(__WiFiNetwork *)a3;
- (BOOL)isWiFiPowerModificationDisabled;
- (BOOL)mcInitialized;
- (BOOL)monitoring;
- (MCProfileConnection)mcConnection;
- (NSString)profileIdentifier;
- (OS_dispatch_queue)queue;
- (__WiFiManager)manager;
- (void)MCInitialize;
- (void)MCSettingsDidChange:(id)a3;
- (void)dealloc;
- (void)initializeWithHandler:(__WiFiManager *)a3;
- (void)installMegaWiFiProfile;
- (void)scheduleWithQueue:(id)a3;
- (void)setManager:(__WiFiManager *)a3;
- (void)setMcConnection:(id)a3;
- (void)setMcInitialized:(BOOL)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)uninstallMegaWiFiProfile;
- (void)unscheduleFromQueue:(id)a3;
@end

@implementation ManagedConfigWrapper

+ (id)sharedInstance
{
  if (qword_10027D5C8 != -1) {
    dispatch_once(&qword_10027D5C8, &stru_10023EF30);
  }
  return (id)qword_10027D5C0;
}

- (void)initializeWithHandler:(__WiFiManager *)a3
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, @"%s: starting", @"-[ManagedConfigWrapper initializeWithHandler:]"];
  }
  [(ManagedConfigWrapper *)self setManager:a3];
  [(ManagedConfigWrapper *)self setMcInitialized:0];
  [(ManagedConfigWrapper *)self setMonitoring:0];
  [(ManagedConfigWrapper *)self setMcConnection:+[MCProfileConnection sharedConnection]];

  [(ManagedConfigWrapper *)self setProfileIdentifier:0];
}

- (void)dealloc
{
  if ([(ManagedConfigWrapper *)self monitoring]) {
    [(ManagedConfigWrapper *)self stopMonitoring];
  }

  self->_profileIdentifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)ManagedConfigWrapper;
  [(ManagedConfigWrapper *)&v3 dealloc];
}

- (void)MCSettingsDidChange:(id)a3
{
  unsigned int v5 = [(MCProfileConnection *)[(ManagedConfigWrapper *)self mcConnection] isWiFiWithAllowedNetworksOnlyEnforced];
  unsigned int v6 = [(MCProfileConnection *)[(ManagedConfigWrapper *)self mcConnection] isWiFiPowerModificationAllowed];
  unsigned int v7 = [(MCProfileConnection *)[(ManagedConfigWrapper *)self mcConnection] isPersonalHotspotModificationAllowed];
  if (qword_10027DD68)
  {
    v9 = "FALSE";
    if (v5) {
      v9 = "TRUE";
    }
    v10 = "Disabled";
    if (v6) {
      v11 = "Enabled";
    }
    else {
      v11 = "Disabled";
    }
    if (v7) {
      v10 = "Enabled";
    }
    [((id)qword_10027DD68) WFLog:3, @"%s: MCNotification received. isWiFiWithAllowedNetworksOnlyEnforced (%s) WiFiPowerModification (%s) PersonalHotspotModification (%s)", @"-[ManagedConfigWrapper MCSettingsDidChange:]", v9, v11, v10];
  }
  if ([(ManagedConfigWrapper *)self queue])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003219C;
    block[3] = &unk_10023EF58;
    block[4] = self;
    char v14 = v6 ^ 1;
    char v15 = v7 ^ 1;
    char v16 = v5;
    dispatch_async((dispatch_queue_t)[(ManagedConfigWrapper *)self queue], block);
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, "%s: probably WiFiManager is in middle of closing.", "-[ManagedConfigWrapper MCSettingsDidChange:]"];
    }
  }
}

- (BOOL)isWiFiPowerModificationDisabled
{
  LOBYTE(self) = [(MCProfileConnection *)[(ManagedConfigWrapper *)self mcConnection] isWiFiPowerModificationAllowed] ^ 1;
  return (char)self;
}

- (void)MCInitialize
{
  if (![(ManagedConfigWrapper *)self mcInitialized])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000322D8;
    v4[3] = &unk_10023EF80;
    v4[4] = self;
    [(MCProfileConnection *)[(ManagedConfigWrapper *)self mcConnection] checkInWithCompletion:v4];
  }
}

- (void)scheduleWithQueue:(id)a3
{
  [(ManagedConfigWrapper *)self setQueue:a3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032434;
  block[3] = &unk_10023EFA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_10027DD88, block);
}

- (void)unscheduleFromQueue:(id)a3
{
  [(ManagedConfigWrapper *)self stopMonitoring];
  [(ManagedConfigWrapper *)self setQueue:0];
}

- (void)startMonitoring
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, @"%s: adding observer", @"-[ManagedConfigWrapper startMonitoring]"];
  }
  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v5 addObserver:self selector:"MCSettingsDidChange:" name:MCEffectiveSettingsChangedNotification object:0];
  [(ManagedConfigWrapper *)self setMonitoring:1];
}

- (void)stopMonitoring
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: removing observer", "-[ManagedConfigWrapper stopMonitoring]");
  }
  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v5 removeObserver:self name:MCEffectiveSettingsChangedNotification object:0];
  [(ManagedConfigWrapper *)self setMonitoring:0];
}

- (BOOL)isWiFiNetworkSubjectToMDM:(__WiFiNetwork *)a3
{
  unsigned int v6 = sub_10001E404((uint64_t)a3, @"PayloadUUID");
  if (v6)
  {
    id v7 = [(MCProfileConnection *)[(ManagedConfigWrapper *)self mcConnection] installedProfilesWithFilterFlags:69];
    if (v7) {
      LOBYTE(v6) = [[objc_msgSend(v7 filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"ANY SELF.payloads.UUID MATCHES %@", v6)) count] == 0;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  return (char)v6;
}

- (BOOL)isEAPShareBlockedByManagedDefault
{
  objc_super v3 = +[NSDictionary dictionaryWithContentsOfFile:@"/Library/Managed Preferences/mobile/.GlobalPreferences.plist"];
  BOOL v4 = v3
    && [[v3 objectForKeyedSubscript:@"EAPCredentialShareDisable"] intValue];
  return v4;
}

- (BOOL)isSupervisedDevice
{
  unsigned __int8 v3 = [[+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection") isSupervised];
  return v3;
}

- (BOOL)isWiFiNetworkMDMNetwork:(__WiFiNetwork *)a3
{
  unsigned int v6 = sub_10001E404((uint64_t)a3, @"PayloadUUID");
  if (v6)
  {
    id v7 = [(MCProfileConnection *)[(ManagedConfigWrapper *)self mcConnection] installedProfilesWithFilterFlags:32];
    if (v7) {
      LOBYTE(v6) = [[objc_msgSend(v7 filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"ANY SELF.payloads.UUID MATCHES %@", v6)) count] != 0;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  return (char)v6;
}

- (void)installMegaWiFiProfile
{
  uint64_t v5 = 0;
  [(ManagedConfigWrapper *)self setProfileIdentifier:[(MCProfileConnection *)self->_mcConnection installProfileData:+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", +[NSURL fileURLWithPath:@"/AppleInternal/Library/WiFi/Profiles/MegaWifi Profile.mobileconfig"]) outError:&v5]];
  if (v5)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:4, "%s: %@", "-[ManagedConfigWrapper installMegaWiFiProfile]", v5 message];
    }
  }
}

- (void)uninstallMegaWiFiProfile
{
  if ([(ManagedConfigWrapper *)self profileIdentifier])
  {
    [(MCProfileConnection *)self->_mcConnection removeProfileWithIdentifier:[(ManagedConfigWrapper *)self profileIdentifier]];
    [(ManagedConfigWrapper *)self setProfileIdentifier:0];
  }
}

- (BOOL)isMegaWiFiProfileInstalled
{
  id v4 = [(MCProfileConnection *)self->_mcConnection installedProfilesWithFilterFlags:1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "identifier"), "isEqualToString:", @"com.apple.defaults.managed.corecapture.wifi.megawifi"))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:
  return v9;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (BOOL)mcInitialized
{
  return self->_mcInitialized;
}

- (void)setMcInitialized:(BOOL)a3
{
  self->_mcInitialized = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (MCProfileConnection)mcConnection
{
  return self->_mcConnection;
}

- (void)setMcConnection:(id)a3
{
  self->_mcConnection = (MCProfileConnection *)a3;
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProfileIdentifier:(id)a3
{
}

@end