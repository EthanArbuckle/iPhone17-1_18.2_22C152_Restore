@interface Ace3UpdaterInstance
- (BOOL)skipApplyStage;
- (const)namePrefix;
- (const)uarpRestoreQueueName;
- (uarpRestoreLayer4Callbacks)uarpRestoreLayer4Callbacks;
- (void)uarpRestoreInitOptions;
@end

@implementation Ace3UpdaterInstance

- (void)uarpRestoreInitOptions
{
  v3 = uarpZalloc(0x50uLL);
  v4 = v3;
  if (v3)
  {
    v3[9] = 1;
    unsigned char *v3 = [(UARPSoCUpdaterInstance *)self routerID];
    *((_DWORD *)v4 + 1) = [(UARPSoCUpdaterInstance *)self logicUnitNumber];
    v4[8] = [(UARPSoCUpdaterInstance *)self skipSameVersion];
    *((_DWORD *)v4 + 18) = [(UARPSoCUpdaterInstance *)self updaterMode];
    if ([(UARPSoCUpdaterInstance *)self updaterMode] == 4) {
      v4[10] = 1;
    }
  }
  else
  {
    v5 = [(UARPSoCUpdaterInstance *)self log];
    [v5 log:@"%s: error allocating options: No resources"];
  }
  return v4;
}

- (uarpRestoreLayer4Callbacks)uarpRestoreLayer4Callbacks
{
  v3 = (uarpRestoreLayer4Callbacks *)uarpZalloc(0x88uLL);
  v4 = v3;
  if (v3)
  {
    v3->var0 = USBCUpdateEndpointInitialize;
  }
  else
  {
    v5 = [(UARPSoCUpdaterInstance *)self log];
    [v5 log:@"%s: error allocating callbacks: No resources", @"-[Ace3UpdaterInstance uarpRestoreLayer4Callbacks]"];
  }
  return v4;
}

- (const)uarpRestoreQueueName
{
  return "com.apple.uarp.restore.ace3";
}

- (BOOL)skipApplyStage
{
  return 1;
}

- (const)namePrefix
{
  return "ace3";
}

@end