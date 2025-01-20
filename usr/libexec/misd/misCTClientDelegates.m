@interface misCTClientDelegates
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)subscriptionInfoDidChange;
- (void)tetheringStatus:(id)a3 connectionType:(int)a4;
@end

@implementation misCTClientDelegates

- (void)tetheringStatus:(id)a3 connectionType:(int)a4
{
  sub_100005EAC();
  if (a4 == 4)
  {
    v7 = +[misCTClientSharedInstance sharedInstance];
    [(misCTClientSharedInstance *)v7 processCTTetheringStatusChangeNotification:a3];
  }
  else
  {
    [NSStringFromSelector(a2) UTF8String];
    sub_100005EAC();
  }
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  memset(v9, 0, sizeof(v9));
  uint64_t v8 = *(void *)&a4;
  sub_100005EAC();
  [+[misCTClientSharedInstance sharedInstance] processCTConnectionStateChangeNotification:a3 connection:v6 connectionStatus:a5 ctInterfaceConnStatus:v9];
}

- (void)subscriptionInfoDidChange
{
  v2 = +[misCTClientSharedInstance sharedInstance];

  [(misCTClientSharedInstance *)v2 _updateDualSimStatus];
}

@end