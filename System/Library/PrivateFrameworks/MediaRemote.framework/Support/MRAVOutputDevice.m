@interface MRAVOutputDevice
- (BOOL)isLocallyHosted;
- (BOOL)isSmartDevice;
- (BOOL)willBeLocallyHosted;
@end

@implementation MRAVOutputDevice

- (BOOL)isLocallyHosted
{
  v3 = +[MRDAVOutputContextManager sharedManager];
  v4 = [v3 populatedOutputContexts];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F0B74;
  v7[3] = &unk_10041C5E0;
  v7[4] = self;
  v5 = objc_msgSend(v4, "msv_firstWhere:", v7);
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)willBeLocallyHosted
{
  v3 = +[MRUserSettings currentSettings];
  if ([v3 supportMultiplayerHost])
  {
    if ([(MRAVOutputDevice *)self isLocallyHosted]
      || ([(MRAVOutputDevice *)self shouldBeLocallyHosted] & 1) != 0)
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      unsigned __int8 v4 = [(MRAVOutputDevice *)self isPrimaryLocalDevice];
    }
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isSmartDevice
{
  unsigned int v3 = [(MRAVOutputDevice *)self isRemoteControllable];
  if (v3) {
    LOBYTE(v3) = [(MRAVOutputDevice *)self isAuxiliary] ^ 1;
  }
  return v3;
}

@end