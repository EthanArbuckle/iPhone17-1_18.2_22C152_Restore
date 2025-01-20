@interface WCM_ExternalAccessoryIOS
- (NSArray)connectedAccessories;
- (WCM_ExternalAccessoryIOS)init;
- (void)_accessoryConnected:(id)a3;
- (void)_accessoryDisconnected:(id)a3;
- (void)accessoryReconnect;
- (void)dealloc;
@end

@implementation WCM_ExternalAccessoryIOS

- (WCM_ExternalAccessoryIOS)init
{
  v4.receiver = self;
  v4.super_class = (Class)WCM_ExternalAccessoryIOS;
  v2 = [(WCM_ExternalAccessory *)&v4 init];
  if (v2)
  {
    *(void *)(v2 + 12) = [objc_alloc((Class)NSMutableArray) initWithArray:+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager") connectedAccessories];
    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"_accessoryConnected:" name:EAAccessoryDidConnectNotification object:0];
    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"_accessoryDisconnected:" name:EAAccessoryDidDisconnectNotification object:0];
    [+[EAAccessoryManager sharedAccessoryManager] registerForLocalNotifications];
  }
  return (WCM_ExternalAccessoryIOS *)v2;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:EAAccessoryDidConnectNotification object:0];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:EAAccessoryDidDisconnectNotification object:0];
  [+[EAAccessoryManager sharedAccessoryManager] unregisterForLocalNotifications];

  v3.receiver = self;
  v3.super_class = (Class)WCM_ExternalAccessoryIOS;
  [(WCM_ExternalAccessory *)&v3 dealloc];
}

- (void)_accessoryConnected:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"External AccessoryConnected"];
  id v5 = [[objc_msgSend(a3, "userInfo") objectForKey:EAAccessoryKey];
  [*(id *)(&self->super._eaConnection + 1) addObject:v5];
  id v6 = [v5 name];
  id v7 = [v5 manufacturer];
  id v8 = [v5 modelNumber];
  id v9 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
  +[WCM_Logging logLevel:2, @"WCM_ExternalAccessory:accessory connected [%@] [%@] [%@]", v6, v7, v8 message];
  if (![v7 isEqualToString:@"Medtronic"]) {
    goto LABEL_12;
  }
  if ([v8 isEqualToString:@"Model 24970A"])
  {
    if ((unint64_t)[v6 length] >= 0x15)
    {
      if ([objc_msgSend(v6 substringToIndex:16), "isEqualToString:", objc_msgSend(@"Model 24970A SPMxxxxxxA", "substringToIndex:", 16)])
      {
        +[WCM_Logging logLevel:2 message:@"WCM_ExternalAccessory:Medtronic Base connected"];
        ++dword_10027D324;
        if (!v9) {
          byte_10027D328 = 1;
        }
      }
    }
  }
  if ([v8 isEqualToString:@"Model 24967"]
    && (unint64_t)[v6 length] >= 0x15
    && [objc_msgSend(v6 substringToIndex:15), "isEqualToString:", objc_msgSend(@"Model 24967 RFAxxxxxxA", "substringToIndex:", 15)])
  {
    +[WCM_Logging logLevel:2 message:@"WCM_ExternalAccessory:Medtronic Tele connected"];
    int v10 = ++dword_10027D324;
    if (!v9) {
      byte_10027D328 = 1;
    }
  }
  else
  {
LABEL_12:
    int v10 = dword_10027D324;
  }
  if (v10 == 1)
  {
    +[WCM_Logging logLevel:2 message:@"WCM_ExternalAccessory:Send Medtrionic Connected btc"];
    [(WCM_ExternalAccessory *)self setEaConnection:0];
    id v11 = +[WCM_PolicyManager singleton];
    [v11 updateControllerState:1200];
  }
}

- (void)_accessoryDisconnected:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"External AccessoryDisConnected"];
  id v5 = [[objc_msgSend(a3, "userInfo") objectForKey:EAAccessoryKey];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = self;
  id v20 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
  id v7 = *(void **)(&self->super._eaConnection + 1);
  id v8 = (char *)[v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      v12 = 0;
      v13 = &v9[(void)v10];
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v12);
        id v15 = [v14 connectionID];
        if (v15 == [v5 connectionID])
        {
          id v16 = [v14 name];
          id v17 = [v14 manufacturer];
          id v18 = [v14 modelNumber];
          +[WCM_Logging logLevel:2, @"WCM_ExternalAccessory:accessory disconnected [%@] [%@] [%@]", v16, v17, v18 message];
          if ([v17 isEqualToString:@"Medtronic"])
          {
            if ([v18 isEqualToString:@"Model 24970A"]
              && (unint64_t)[v16 length] >= 0x15
              && [objc_msgSend(v16 substringToIndex:16), "isEqualToString:", objc_msgSend(@"Model 24970A SPMxxxxxxA", "substringToIndex:", 16)]&& (+[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"WCM_ExternalAccessory:Medtronic Base Disconnected"), dword_10027D324 >= 1))
            {
              --dword_10027D324;
              BOOL v19 = 1;
              if (!v20) {
                byte_10027D328 = 1;
              }
            }
            else
            {
              BOOL v19 = 0;
            }
            if ([v18 isEqualToString:@"Model 24967"]
              && (unint64_t)[v16 length] >= 0x15)
            {
              if ([objc_msgSend(v16 substringToIndex:15), "isEqualToString:", objc_msgSend(@"Model 24967 RFAxxxxxxA", "substringToIndex:", 15)])
              {
                +[WCM_Logging logLevel:2 message:@"WCM_ExternalAccessory:Medtronic Tele Disconnected"];
                if (dword_10027D324 >= 1)
                {
                  --dword_10027D324;
                  BOOL v19 = 1;
                  if (!v20) {
                    byte_10027D328 = 1;
                  }
                }
              }
              BOOL v19 = v19;
            }
            if (v19 && !dword_10027D324)
            {
              [(WCM_ExternalAccessory *)v6 setEaConnection:1];
              +[WCM_Logging logLevel:2 message:@"WCM_ExternalAccessory:Send Medtronic Disconnected btc"];
              [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:1200];
            }
          }
          [*(id *)(&v6->super._eaConnection + 1) removeObjectAtIndex:&v12[(void)v10]];
          return;
        }
        ++v12;
      }
      while (v9 != v12);
      id v9 = (char *)[v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      int v10 = v13;
      if (v9) {
        continue;
      }
      break;
    }
  }
}

- (void)accessoryReconnect
{
  if (byte_10027D328 == 1)
  {
    BOOL v3 = dword_10027D324 < 1;
    if (dword_10027D324 >= 1) {
      CFStringRef v4 = @"WCM_ExternalAccessory: Medtronic reset btc_param c due to WiFi was off";
    }
    else {
      CFStringRef v4 = @"WCM_ExternalAccessory: Medtronic reset btc_param d due to WiFi was off";
    }
    +[WCM_Logging logLevel:2 message:v4];
    [(WCM_ExternalAccessory *)self setEaConnection:v3];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:1200];
  }
  byte_10027D328 = 0;
}

- (NSArray)connectedAccessories
{
  return *(NSArray **)(&self->super._eaConnection + 1);
}

@end