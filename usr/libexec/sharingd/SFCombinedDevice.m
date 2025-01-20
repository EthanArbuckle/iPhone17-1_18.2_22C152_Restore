@interface SFCombinedDevice
- (BOOL)_canTransition:(int)a3;
- (BOOL)canTransition:(int)a3;
- (BOOL)clientProvidedError;
- (BOOL)forced;
- (BOOL)isReady;
- (BOOL)medBubbleDelayed;
- (BOOL)stateIsClose;
- (BOOL)stateIsMedium;
- (BOOL)stateIsNearby;
- (NSString)effectiveID;
- (NSString)forcedID;
- (NSString)name;
- (NSURL)attachmentURL;
- (RPCompanionLinkDevice)clinkDevice;
- (SFBubbleEstimator)notificationBubble;
- (SFBubbleEstimator)transferBubble;
- (SFDevice)bleDevice;
- (SFNotificationInfo)notificationInfo;
- (TURoute)route;
- (double)notificationDurationSecs;
- (double)pendingContentDurationSecs;
- (double)transferDoneDurationSecs;
- (double)transferPendingDurationSecs;
- (id)description;
- (int)nextState;
- (int)state;
- (int64_t)dismissReason;
- (unint64_t)notificationTicks;
- (unint64_t)pendingContentTicks;
- (unint64_t)transferDoneTicks;
- (unint64_t)transferPendingStartTicks;
- (unsigned)notificationType;
- (void)resetTicks;
- (void)setAttachmentURL:(id)a3;
- (void)setBleDevice:(id)a3;
- (void)setClientProvidedError:(BOOL)a3;
- (void)setClinkDevice:(id)a3;
- (void)setDismissReason:(int64_t)a3;
- (void)setForced:(BOOL)a3;
- (void)setForcedID:(id)a3;
- (void)setMedBubbleDelayed:(BOOL)a3;
- (void)setNextState:(int)a3;
- (void)setNotificationBubble:(id)a3;
- (void)setNotificationDurationSecs:(double)a3;
- (void)setNotificationInfo:(id)a3;
- (void)setNotificationTicks:(unint64_t)a3;
- (void)setNotificationType:(unsigned int)a3;
- (void)setPendingContentDurationSecs:(double)a3;
- (void)setPendingContentTicks:(unint64_t)a3;
- (void)setRoute:(id)a3;
- (void)setState:(int)a3;
- (void)setTransferBubble:(id)a3;
- (void)setTransferDoneDurationSecs:(double)a3;
- (void)setTransferDoneTicks:(unint64_t)a3;
- (void)setTransferPendingDurationSecs:(double)a3;
- (void)setTransferPendingStartTicks:(unint64_t)a3;
@end

@implementation SFCombinedDevice

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v4 = [(SFCombinedDevice *)self name];
  [v3 appendFormat:@"SFCombinedDevice \"%@\": ", v4];

  bleDevice = self->_bleDevice;
  if (bleDevice)
  {
    v6 = [(SFDevice *)bleDevice identifier];
    [v3 appendFormat:@", BLE %@", v6];
  }
  clinkDevice = self->_clinkDevice;
  if (clinkDevice)
  {
    v8 = [(RPCompanionLinkDevice *)clinkDevice effectiveIdentifier];
    [v3 appendFormat:@", CL %@", v8];
  }
  uint64_t v9 = [(RPCompanionLinkDevice *)self->_clinkDevice mediaRouteIdentifier];
  v10 = (void *)v9;
  if (v9) {
    [v3 appendFormat:@", CL.MR %@", v9];
  }

  if (self->_notificationInfo) {
    [v3 appendString:@", notif"];
  }
  CFStringRef v11 = @"HPMedia";
  switch(self->_notificationType)
  {
    case 0u:
      goto LABEL_17;
    case 1u:
      CFStringRef v11 = @"Unknown";
      goto LABEL_16;
    case 2u:
      goto LABEL_16;
    case 3u:
      CFStringRef v11 = @"HPCall";
      goto LABEL_16;
    case 4u:
      CFStringRef v11 = @"TVAutoFill";
      goto LABEL_16;
    case 5u:
      CFStringRef v11 = @"TVKeyboard";
      goto LABEL_16;
    case 6u:
      CFStringRef v11 = @"WatchKeyboard";
      goto LABEL_16;
    default:
      CFStringRef v11 = @"?";
LABEL_16:
      [v3 appendFormat:@", %@", v11];
LABEL_17:
      if (self->_route) {
        [v3 appendString:@", route"];
      }
      if ([(SFCombinedDevice *)self isReady]) {
        [v3 appendString:@", ready"];
      }
      uint64_t v12 = sub_1000AC00C(self->_state);
      v13 = (void *)v12;
      if (v12) {
        [v3 appendFormat:@", %@", v12];
      }

      return v3;
  }
}

- (BOOL)canTransition:(int)a3
{
  BOOL v5 = -[SFCombinedDevice _canTransition:](self, "_canTransition:");
  if (!v5 && dword_100966E40 <= 10 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    v6 = [(SFCombinedDevice *)self name];
    v7 = sub_1000AC00C(self->_state);
    uint64_t v9 = sub_1000AC00C(a3);
    LogPrintF();
  }
  return v5;
}

- (BOOL)_canTransition:(int)a3
{
  switch(a3)
  {
    case 10:
      BOOL v4 = ((self->_state - 11) & 0xFFFFFFFB) == 0;
      goto LABEL_24;
    case 11:
      BOOL v4 = self->_state == 10;
      goto LABEL_24;
    case 12:
      BOOL v4 = self->_state == 11;
      goto LABEL_24;
    case 13:
      BOOL v5 = [(SFCombinedDevice *)self isReady];
      if (!v5) {
        return v5;
      }
      BOOL v6 = (self->_state - 11) >= 2;
LABEL_15:
      LOBYTE(v5) = !v6;
      return v5;
    case 14:
      BOOL v5 = [(SFCombinedDevice *)self isReady];
      if (!v5) {
        return v5;
      }
      BOOL v4 = self->_state == 13;
      goto LABEL_24;
    case 15:
      int state = self->_state;
      BOOL v4 = state == 14 || state == 20;
      goto LABEL_24;
    case 16:
      BOOL v6 = (self->_state - 13) >= 3;
      goto LABEL_15;
    case 17:
      BOOL v4 = self->_state == 16;
      goto LABEL_24;
    case 18:
      unsigned int v9 = self->_state;
      BOOL v6 = v9 >= 0x12;
      unsigned int v10 = (0x34000u >> v9) & 1;
      if (v6) {
        LOBYTE(v5) = 0;
      }
      else {
        LOBYTE(v5) = v10;
      }
      return v5;
    case 19:
      unsigned int v7 = self->_state;
      goto LABEL_23;
    case 20:
      unsigned int v7 = self->_state & 0xFFFFFFFE;
LABEL_23:
      BOOL v4 = v7 == 18;
LABEL_24:
      LOBYTE(v5) = v4;
      break;
    default:
      LOBYTE(v5) = 0;
      break;
  }
  return v5;
}

- (BOOL)isReady
{
  unsigned int notificationType = self->_notificationType;
  if (notificationType == 2)
  {
    if (self->_forced && self->_notificationInfo) {
      return 1;
    }
    unsigned int v9 = [(RPCompanionLinkDevice *)self->_clinkDevice mediaRouteIdentifier];

    if (v9)
    {
      if (self->_bleDevice)
      {
        notificationInfo = self->_notificationInfo;
        if (notificationInfo) {
          return [(SFNotificationInfo *)notificationInfo notificationType] == 2;
        }
      }
    }
    return 0;
  }
  if (notificationType != 3) {
    return 0;
  }
  if (self->_forced && self->_notificationInfo) {
    return 1;
  }
  BOOL v4 = self->_clinkDevice;
  if (v4)
  {
    BOOL v5 = self->_route;
    if (v5)
    {
      BOOL v6 = self->_bleDevice;
      BOOL v8 = v6
        && RPCompanionLinkDeviceIsEqualToSFDevice()
        && sub_1000AC3E4(v6, v5, v4)
        && (unsigned int v7 = self->_notificationInfo) != 0
        && [(SFNotificationInfo *)v7 notificationType] == 3;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)effectiveID
{
  if (self->_forced)
  {
    v2 = self->_forcedID;
  }
  else
  {
    id v3 = [(RPCompanionLinkDevice *)self->_clinkDevice mediaRouteIdentifier];
    v2 = v3;
    if (!v3 || ![(NSString *)v3 length])
    {

      v2 = 0;
    }
  }

  return v2;
}

- (NSString)name
{
  id v3 = [(SFDevice *)self->_bleDevice name];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    BOOL v6 = [(RPCompanionLinkDevice *)self->_clinkDevice name];
    unsigned int v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(TURoute *)self->_route name];
    }
    id v5 = v8;
  }

  return (NSString *)v5;
}

- (void)resetTicks
{
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    BOOL v4 = [(SFCombinedDevice *)self name];
    LogPrintF();
  }
  -[SFCombinedDevice setNotificationDurationSecs:](self, "setNotificationDurationSecs:", -1.0, v4);
  [(SFCombinedDevice *)self setNotificationTicks:-1];
  [(SFCombinedDevice *)self setPendingContentDurationSecs:-1.0];
  [(SFCombinedDevice *)self setPendingContentTicks:-1];
  [(SFCombinedDevice *)self setTransferDoneDurationSecs:-1.0];
  [(SFCombinedDevice *)self setTransferDoneTicks:-1];
  [(SFCombinedDevice *)self setTransferPendingDurationSecs:-1.0];
  [(SFCombinedDevice *)self setTransferPendingStartTicks:-1];
  id v3 = [(SFCombinedDevice *)self notificationBubble];
  [v3 reset];

  id v5 = [(SFCombinedDevice *)self transferBubble];
  [v5 reset];
}

- (BOOL)stateIsClose
{
  return (self->_state - 16) < 5;
}

- (BOOL)stateIsMedium
{
  return [(SFCombinedDevice *)self stateIsClose] || (self->_state - 11) < 5;
}

- (BOOL)stateIsNearby
{
  return [(SFCombinedDevice *)self stateIsClose]
      || [(SFCombinedDevice *)self stateIsMedium]
      || self->_state == 10;
}

- (void)setNextState:(int)a3
{
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    id v5 = [(SFCombinedDevice *)self name];
    BOOL v6 = sub_1000AC00C(a3);
    LogPrintF();
  }
  self->_nextState = a3;
}

- (void)setState:(int)a3
{
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
  {
    id v5 = [(SFCombinedDevice *)self name];
    BOOL v6 = sub_1000AC00C(self->_state);
    unsigned int v7 = sub_1000AC00C(a3);
    LogPrintF();
  }
  self->_int state = a3;
}

- (NSURL)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
}

- (SFDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
}

- (BOOL)clientProvidedError
{
  return self->_clientProvidedError;
}

- (void)setClientProvidedError:(BOOL)a3
{
  self->_clientProvidedError = a3;
}

- (RPCompanionLinkDevice)clinkDevice
{
  return self->_clinkDevice;
}

- (void)setClinkDevice:(id)a3
{
}

- (int64_t)dismissReason
{
  return self->_dismissReason;
}

- (void)setDismissReason:(int64_t)a3
{
  self->_dismissReason = a3;
}

- (BOOL)forced
{
  return self->_forced;
}

- (void)setForced:(BOOL)a3
{
  self->_forced = a3;
}

- (NSString)forcedID
{
  return self->_forcedID;
}

- (void)setForcedID:(id)a3
{
}

- (int)nextState
{
  return self->_nextState;
}

- (SFBubbleEstimator)notificationBubble
{
  return self->_notificationBubble;
}

- (void)setNotificationBubble:(id)a3
{
}

- (SFNotificationInfo)notificationInfo
{
  return self->_notificationInfo;
}

- (void)setNotificationInfo:(id)a3
{
}

- (unsigned)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(unsigned int)a3
{
  self->_unsigned int notificationType = a3;
}

- (BOOL)medBubbleDelayed
{
  return self->_medBubbleDelayed;
}

- (void)setMedBubbleDelayed:(BOOL)a3
{
  self->_medBubbleDelayed = a3;
}

- (TURoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (SFBubbleEstimator)transferBubble
{
  return self->_transferBubble;
}

- (void)setTransferBubble:(id)a3
{
}

- (unint64_t)notificationTicks
{
  return self->_notificationTicks;
}

- (void)setNotificationTicks:(unint64_t)a3
{
  self->_notificationTicks = a3;
}

- (double)notificationDurationSecs
{
  return self->_notificationDurationSecs;
}

- (void)setNotificationDurationSecs:(double)a3
{
  self->_notificationDurationSecs = a3;
}

- (unint64_t)pendingContentTicks
{
  return self->_pendingContentTicks;
}

- (void)setPendingContentTicks:(unint64_t)a3
{
  self->_pendingContentTicks = a3;
}

- (double)pendingContentDurationSecs
{
  return self->_pendingContentDurationSecs;
}

- (void)setPendingContentDurationSecs:(double)a3
{
  self->_pendingContentDurationSecs = a3;
}

- (unint64_t)transferDoneTicks
{
  return self->_transferDoneTicks;
}

- (void)setTransferDoneTicks:(unint64_t)a3
{
  self->_transferDoneTicks = a3;
}

- (double)transferDoneDurationSecs
{
  return self->_transferDoneDurationSecs;
}

- (void)setTransferDoneDurationSecs:(double)a3
{
  self->_transferDoneDurationSecs = a3;
}

- (unint64_t)transferPendingStartTicks
{
  return self->_transferPendingStartTicks;
}

- (void)setTransferPendingStartTicks:(unint64_t)a3
{
  self->_transferPendingStartTicks = a3;
}

- (double)transferPendingDurationSecs
{
  return self->_transferPendingDurationSecs;
}

- (void)setTransferPendingDurationSecs:(double)a3
{
  self->_transferPendingDurationSecs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferBubble, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_notificationInfo, 0);
  objc_storeStrong((id *)&self->_notificationBubble, 0);
  objc_storeStrong((id *)&self->_forcedID, 0);
  objc_storeStrong((id *)&self->_clinkDevice, 0);
  objc_storeStrong((id *)&self->_bleDevice, 0);

  objc_storeStrong((id *)&self->_attachmentURL, 0);
}

@end