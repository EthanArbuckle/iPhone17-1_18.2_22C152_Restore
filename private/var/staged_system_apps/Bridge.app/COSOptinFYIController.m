@interface COSOptinFYIController
+ (BOOL)_wantsUnifiedFYIPane;
+ (BOOL)wantsUnifiedFYIPane;
+ (id)unifiedFYIDescription;
+ (void)clearState;
+ (void)doWorkForSkippedPanes;
+ (void)snapshotState;
@end

@implementation COSOptinFYIController

+ (void)snapshotState
{
  byte_10029B050 = +[COSOptinFYIController _wantsUnifiedFYIPane];
  byte_10029B051 = 1;
}

+ (void)clearState
{
  byte_10029B051 = 0;
  byte_10029B050 = 0;
}

+ (BOOL)_wantsUnifiedFYIPane
{
  sub_10005EC00();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        Class v6 = NSClassFromString(*(NSString **)(*((void *)&v8 + 1) + 8 * i));
        -[objc_class conformsToProtocol:](v6, "conformsToProtocol:", &OBJC_PROTOCOL___BPSUnifiedFYIOptinController, (void)v8);
        if ([(objc_class *)v6 wantsUnifiedFYI])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

+ (BOOL)wantsUnifiedFYIPane
{
  if (byte_10029B051 == 1) {
    unsigned int v2 = byte_10029B050 != 0;
  }
  else {
    unsigned int v2 = +[COSOptinFYIController _wantsUnifiedFYIPane];
  }
  id v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"Fresh State";
    CFStringRef v5 = @"Doesn't Want Unified FYI Pane";
    if (byte_10029B051) {
      CFStringRef v4 = @"Snapshot State";
    }
    if (v2) {
      CFStringRef v5 = @"Wants Unified FYI Pane";
    }
    int v7 = 138412546;
    CFStringRef v8 = v4;
    __int16 v9 = 2112;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Use %@ -> %@", (uint8_t *)&v7, 0x16u);
  }

  return v2;
}

+ (void)doWorkForSkippedPanes
{
  unsigned int v2 = sub_10005EC00();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      Class v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        Class v7 = NSClassFromString(*(NSString **)(*((void *)&v8 + 1) + 8 * (void)v6));
        if [(objc_class *)v7 conformsToProtocol:&OBJC_PROTOCOL___BPSUnifiedFYIOptinController]&& [(objc_class *)v7 wantsUnifiedFYI]&& (objc_opt_respondsToSelector())
        {
          [(objc_class *)v7 doWorkForSkippedPane];
        }
        Class v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

+ (id)unifiedFYIDescription
{
  unsigned int v2 = +[NSMutableString string];
  sub_10005EC00();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        Class v7 = *(NSString **)(*((void *)&v17 + 1) + 8 * i);
        Class v8 = NSClassFromString(v7);
        id v9 = [(objc_class *)v8 conformsToProtocol:&OBJC_PROTOCOL___BPSUnifiedFYIOptinController];
        if (v9) {
          id v10 = [(objc_class *)v8 wantsUnifiedFYI];
        }
        else {
          id v10 = 0;
        }
        char v11 = objc_opt_respondsToSelector();
        v12 = +[NSNumber numberWithBool:v9];
        v13 = +[NSNumber numberWithBool:v10];
        v14 = +[NSNumber numberWithBool:v11 & 1];
        [v2 appendFormat:@"\n#### %@ -> (Conforms to Protocol: %@) (Wants FYI: %@) (Has Work: %@)", v7, v12, v13, v14];
      }
      id v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v2;
}

@end