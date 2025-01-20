@interface WiFiSoftErrorManager
- (BOOL)askToLaunchSlowWiFiRadar:(__CFString *)a3;
- (BOOL)askToLaunchTapToRadar:(int)a3;
- (BOOL)askToLaunchTriggerDisconnectRadar:(__CFString *)a3;
- (BOOL)askToLaunchUserDisconnectRadar;
- (BOOL)getReachabilityStatus;
- (BOOL)isEventMitigationEnabled:(int)a3;
- (BOOL)isLQAIndicatingTxStall;
- (BOOL)isTxStalled:(unsigned int *)a3 rateType:(unsigned __int8)a4 size:(unsigned int)a5;
- (BOOL)shouldSupressErrorReporting:(int)a3;
- (BOOL)supressEventDetectionProcesssing:(int)a3 deviceContext:(void *)a4;
- (BOOL)supressTapToRadar:(int)a3 deviceContext:(void *)a4;
- (BOOL)wifiSoftErrorTxDataStallProcessHistory:(__CFDictionary *)a3;
- (WiFiSoftErrorManager)initWithWiFiManager:(__WiFiManager *)a3 queue:(id)a4;
- (id)copySoftErrorEventDescription:(int)a3;
- (id)fetchSoftErrorContext:(void *)a3 softErrorType:(int)a4;
- (softErrorCounters)getErrorCounters;
- (unsigned)softErrorTypeIndex:(int)a3;
- (void)WiFiSoftErrorDriverAvailableEventhandler;
- (void)WiFiSoftErrorDriverLinkupEventhandler;
- (void)WiFiSoftErrorManagerLQMEventHandler:(id)a3;
- (void)WiFiSoftErrorReporting:(int)a3 deviceContext:(void *)a4 displayString:(__CFString *)a5;
- (void)enableSoftErrorMitigation:(int)a3;
- (void)initErrorArray:(int)a3;
- (void)initEventMitigation;
- (void)launchTapToRadar:(int)a3 displayString:(__CFString *)a4 deviceContext:(void *)a5;
- (void)populateTxFailHistory:(__CFArray *)a3 failureHistoryArray:(unsigned int *)a4 historyArraySz:(unsigned int)a5;
- (void)purgeOutdatedEvents:(id)a3 currTime:(double)a4;
- (void)recordMitigation:(int)a3;
- (void)supressSoftErrorMitigation:(int)a3;
- (void)updateReportingPreference;
- (void)wifiSoftErrorAwdlEventNotificationHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorCounterUpdate:(int)a3;
- (void)wifiSoftErrorEventHandler:(void *)a3 eventType:(int)a4 eventData:(void *)a5;
- (void)wifiSoftErrorMitigation:(int)a3 mitigationContext:(void *)a4;
- (void)wifiSoftErrorRxDataStallEventHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorSlowWiFiEventHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorTxDataStallEventHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorUnexpectedClientAssertionHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorUserConfirmationFlagSetting:(int)a3 forError:(int)a4 withDeviceContext:(void *)a5;
- (void)wifiSoftErrorUserConfirmationUpdate:(int)a3 withDeviceContext:(void *)a4;
- (void)wifiSoftErrorUserDisconnectEventHandler:(void *)a3;
- (void)wifiSoftErrorWiFiAutoJoinEventHandler:(void *)a3;
- (void)wifiSoftErrorWiFiScanEventHandler:(void *)a3;
- (void)wifiSoftErrorWiFiToggleEventHandler:(int)a3 deviceContext:(void *)a4;
- (void)wifiSoftErrorWiFiTriggerDisconnectEventHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorsInProcessStateSet:(int)a3;
- (void)wifiSoftErrorsInProcessStateUnset:(int)a3;
@end

@implementation WiFiSoftErrorManager

- (void)wifiSoftErrorEventHandler:(void *)a3 eventType:(int)a4 eventData:(void *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v15 = [(WiFiSoftErrorManager *)self copySoftErrorEventDescription:*(void *)&a4];
  if (v6 == 12)
  {
    if (a5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(WiFiSoftErrorManager *)self WiFiSoftErrorManagerLQMEventHandler:a5];
        goto LABEL_24;
      }
    }
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s: LQM Dictionary data is NULL or wrong type !", "-[WiFiSoftErrorManager wifiSoftErrorEventHandler:eventType:eventData:]"];
    }
    goto LABEL_15;
  }
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: eventType received:%u eventName:%@", "-[WiFiSoftErrorManager wifiSoftErrorEventHandler:eventType:eventData:]", v6, v15 message];
  }
  if (self->_softErrorInProcessFlags)
  {
    switch(v6)
    {
      case 0xB:
        goto LABEL_11;
      case 0xA:
        [(WiFiSoftErrorManager *)self WiFiSoftErrorDriverAvailableEventhandler];
        goto LABEL_24;
      case 9:
LABEL_11:
        [(WiFiSoftErrorManager *)self WiFiSoftErrorDriverLinkupEventhandler];
        goto LABEL_24;
    }
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Dropping SoftErrorEvent: SoftError in ProcessFlag:0x%0x", "-[WiFiSoftErrorManager wifiSoftErrorEventHandler:eventType:eventData:]", self->_softErrorInProcessFlags);
    }
    v11 = v12;
    goto LABEL_23;
  }
  if ([(WiFiSoftErrorManager *)self supressEventDetectionProcesssing:v6 deviceContext:a3])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: SoftErrorEvent Detection Supressed", @"-[WiFiSoftErrorManager wifiSoftErrorEventHandler:eventType:eventData:]"];
    }
LABEL_15:
    v11 = v10;
LABEL_23:
    goto LABEL_24;
  }
  switch((int)v6)
  {
    case 0:
    case 7:
    case 8:
      goto LABEL_18;
    case 1:
      [(WiFiSoftErrorManager *)self enableSoftErrorMitigation:2];
LABEL_18:
      [(WiFiSoftErrorManager *)self wifiSoftErrorWiFiToggleEventHandler:v6 deviceContext:a3];
      break;
    case 2:
      [(WiFiSoftErrorManager *)self wifiSoftErrorWiFiScanEventHandler:a3];
      break;
    case 3:
      [(WiFiSoftErrorManager *)self wifiSoftErrorWiFiAutoJoinEventHandler:a3];
      break;
    case 4:
      [(WiFiSoftErrorManager *)self wifiSoftErrorTxDataStallEventHandler:a3 eventData:a5];
      break;
    case 5:
      [(WiFiSoftErrorManager *)self wifiSoftErrorRxDataStallEventHandler:a3 eventData:a5];
      break;
    case 6:
      [(WiFiSoftErrorManager *)self wifiSoftErrorWiFiTriggerDisconnectEventHandler:a3 eventData:a5];
      break;
    case 14:
      [(WiFiSoftErrorManager *)self wifiSoftErrorUnexpectedClientAssertionHandler:a3 eventData:a5];
      break;
    case 15:
      [(WiFiSoftErrorManager *)self wifiSoftErrorAwdlEventNotificationHandler:a3 eventData:a5];
      break;
    case 16:
      [(WiFiSoftErrorManager *)self wifiSoftErrorSlowWiFiEventHandler:a3 eventData:a5];
      break;
    default:
      break;
  }
LABEL_24:
  BOOL v14 = v6 == 12 || (v6 & 0xFFFFFFFD) == 4;
  if (a5 && v14) {
    CFRelease(a5);
  }
}

- (void)WiFiSoftErrorManagerLQMEventHandler:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"RSSI"];
    self->_primaryInterfaceRssi = (int64_t)[v5 integerValue];

    uint64_t v6 = [v13 objectForKeyedSubscript:@"CCA"];
    self->_primaryInterfaceCca = (int64_t)[v6 integerValue];

    v7 = [v13 objectForKeyedSubscript:@"SNR"];
    self->_primaryInterfaceSnr = (int64_t)[v7 integerValue];

    v8 = [v13 objectForKeyedSubscript:@"TXFRAMES"];
    self->_primaryInterfaceTxFrms[self->_primaryInterfaceStatsHistoryIdx] = [v8 unsignedIntValue];

    v9 = [v13 objectForKeyedSubscript:@"TXFAIL"];
    self->_primaryInterfaceTxFail[self->_primaryInterfaceStatsHistoryIdx] = [v9 unsignedIntValue];

    v10 = [v13 objectForKeyedSubscript:@"RXFRAMES"];
    self->_primaryInterfaceRxFrms[self->_primaryInterfaceStatsHistoryIdx] = [v10 unsignedIntValue];

    v11 = v13;
    self->_primaryInterfaceStatsHistoryIdx = (self->_primaryInterfaceStatsHistoryIdx + 1) % 5u;
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: lqmDict is NULL", @"-[WiFiSoftErrorManager WiFiSoftErrorManagerLQMEventHandler:]"];
    }
    v11 = 0;
  }
}

- (void)updateReportingPreference
{
  self->_isReportingDisabled = sub_100005A70(self->_manager, &self->_reportingTimeout);
  if (self->_reportingTimeout == 0.0) {
    self->_reportingTimeout = 3600.0;
  }
}

- (id)copySoftErrorEventDescription:(int)a3
{
  if (a3 > 0x12) {
    return 0;
  }
  else {
    return off_10023EDA8[a3];
  }
}

- (WiFiSoftErrorManager)initWithWiFiManager:(__WiFiManager *)a3 queue:(id)a4
{
  id v7 = a4;
  if (objc_opt_class())
  {
    v16.receiver = self;
    v16.super_class = (Class)WiFiSoftErrorManager;
    v8 = [(WiFiSoftErrorManager *)&v16 init];
    if (v8)
    {
      self = v8;
      v8->_manager = a3;
      v8->_softErrorInProcessFlags = 0;
      v8->_lastReportedSoftErrorTs = 0.0;
      objc_storeStrong((id *)&v8->_queue, a4);
      *(void *)&self->_errorCounters.slowWiFiUserConfirmCount = 0;
      *(_OWORD *)&self->_errorCounters.triggerDisconnectUserConfirmCount = 0u;
      *(_OWORD *)&self->_errorCounters.noNetworksFoundErrorUserConfirmCount = 0u;
      *(_OWORD *)&self->_errorCounters.rxDataStallErrorCount = 0u;
      *(_OWORD *)&self->_errorCounters.wifiToggleErrorCount = 0u;
      [(WiFiSoftErrorManager *)self initEventMitigation];
      wifiToggleErrors = self->_wifiToggleErrors;
      self->_wifiToggleErrors = 0;

      noNetworkFoundErrors = self->_noNetworkFoundErrors;
      self->_noNetworkFoundErrors = 0;

      autoJoinDelayErrors = self->_autoJoinDelayErrors;
      self->_autoJoinDelayErrors = 0;

      txDataStallErrors = self->_txDataStallErrors;
      self->_txDataStallErrors = 0;

      rxDataStallErrors = self->_rxDataStallErrors;
      self->_rxDataStallErrors = 0;

      self->_isInternalBuild = MGGetBoolAnswer();
      self->_isReportingDisabled = 0;
      self->_reportingTimeout = 3600.0;
      *(void *)self->_primaryInterfaceTxFail = 0;
      *(void *)&self->_primaryInterfaceTxFail[2] = 0;
      self->_primaryInterfaceTxFail[4] = 0;
      *(void *)&self->_primaryInterfaceTxFrms[2] = 0;
      *(void *)self->_primaryInterfaceTxFrms = 0;
      self->_primaryInterfaceTxFrms[4] = 0;
      *(void *)self->_primaryInterfaceRxFrms = 0;
      *(void *)&self->_primaryInterfaceRxFrms[2] = 0;
      self->_primaryInterfaceRxFrms[4] = 0;
      self->_primaryInterfaceStatsHistoryIdx = 0;
    }
    else
    {
      if (qword_10027DD68) {
        [[(id)qword_10027DD68 WFLog:message:3, "%s: failed in super-init", "-[WiFiSoftErrorManager initWithWiFiManager:queue:]"];
      }
      self = 0;
    }
  }

  return self;
}

- (void)initErrorArray:(int)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v9 = v5;
  if (v5)
  {
    uint64_t v6 = v5;
    switch(a3)
    {
      case 1:
        p_wifiToggleErrors = &self->_wifiToggleErrors;
        goto LABEL_12;
      case 2:
        p_wifiToggleErrors = &self->_noNetworkFoundErrors;
        goto LABEL_12;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_6;
      case 4:
        p_wifiToggleErrors = &self->_autoJoinDelayErrors;
        goto LABEL_12;
      case 8:
        p_wifiToggleErrors = &self->_txDataStallErrors;
        goto LABEL_12;
      default:
        if (a3 != 16)
        {
LABEL_6:
          if (qword_10027DD68) {
            [((id)qword_10027DD68) WFLog:3 message:@"%s: Invalid Soft-Error" arguments:("-[WiFiSoftErrorManager initErrorArray:]")];
          }
          goto LABEL_8;
        }
        p_wifiToggleErrors = &self->_rxDataStallErrors;
LABEL_12:
        objc_storeStrong((id *)p_wifiToggleErrors, v6);
        break;
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: errorArray allocation failed" arguments:((id)qword_10027DD68, @"-[WiFiSoftErrorManager initErrorArray:]")];
    }
LABEL_8:
  }
}

- (void)wifiSoftErrorsInProcessStateSet:(int)a3
{
  if (a3 >= 0x400)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s:Invalid Soft Error", @"-[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:]", v5];
    }
  }
  else
  {
    self->_softErrorInProcessFlags |= a3;
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: softErrorsInProcessFlags:0x%0x", "-[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:]", self->_softErrorInProcessFlags);
    }
  }
}

- (void)wifiSoftErrorsInProcessStateUnset:(int)a3
{
  if (a3 >= 0x400)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s:Invalid Soft Error", @"-[WiFiSoftErrorManager wifiSoftErrorsInProcessStateUnset:]", v5];
    }
  }
  else
  {
    self->_softErrorInProcessFlags &= ~a3;
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: softErrorsInProcessFlags:0x%0x", "-[WiFiSoftErrorManager wifiSoftErrorsInProcessStateUnset:]", self->_softErrorInProcessFlags);
    }
  }
}

- (id)fetchSoftErrorContext:(void *)a3 softErrorType:(int)a4
{
  if (a3)
  {
    uint64_t v7 = 40;
    switch(a4)
    {
      case 1:
        goto LABEL_8;
      case 2:
        uint64_t v7 = 48;
        goto LABEL_8;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_18;
      case 4:
        uint64_t v7 = 56;
        goto LABEL_8;
      case 8:
        uint64_t v7 = 64;
        goto LABEL_8;
      default:
        if (a4 != 16) {
          goto LABEL_18;
        }
        uint64_t v7 = 72;
LABEL_8:
        id v8 = *(id *)((char *)&self->super.isa + v7);
        if (v8)
        {
          id v9 = v8;
          if ([v8 count])
          {
            unint64_t v10 = 0;
            v11 = 0;
            do
            {
              v12 = v11;
              v11 = [v9 objectAtIndex:v10];

              if (a4 == 1) {
                manager = self->_manager;
              }
              else {
                manager = self->_deviceManager;
              }
              if (manager == a3) {
                break;
              }
              ++v10;
            }
            while (v10 < (unint64_t)[v9 count]);
          }
          else
          {
            v11 = 0;
          }
          goto LABEL_21;
        }
LABEL_18:
        if (qword_10027DD68) {
          [[(id)qword_10027DD68 WFLog:message:3, "%s: errorListArray is NULL! ", "-[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:]"];
        }
        break;
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: Null deviceContext" -[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:]];
    }
  }
  v11 = 0;
  id v9 = 0;
LABEL_21:

  return v11;
}

- (void)wifiSoftErrorWiFiToggleEventHandler:(int)a3 deviceContext:(void *)a4
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (self->_wifiToggleErrors)
  {
    id v30 = [(WiFiSoftErrorManager *)self fetchSoftErrorContext:a4 softErrorType:1];
    if (v30) {
      goto LABEL_9;
    }
    id v8 = [[WiFiSoftErrorContext alloc] initWithErrorType:1 deviceContext:a4];
    if (!v8)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: failed to alloc wifiToggleError", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]")
      }
LABEL_51:
      id v30 = 0;
LABEL_52:
      id v13 = 0;
      v11 = 0;
LABEL_53:
      id v15 = 0;
      goto LABEL_24;
    }
  }
  else
  {
    [(WiFiSoftErrorManager *)self initErrorArray:1];
    if (!self->_wifiToggleErrors)
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:@"%s: wifiToggleErrorArray is NULL!" message:3];
      }
      goto LABEL_51;
    }
    id v8 = [[WiFiSoftErrorContext alloc] initWithErrorType:1 deviceContext:a4];
    if (!v8)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: failed to alloc wifiToggleError Context", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]")
      }
      goto LABEL_51;
    }
  }
  id v30 = v8;
  [(NSMutableArray *)self->_wifiToggleErrors addObject:v8];
LABEL_9:
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v10)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: eventDict is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]"];
    }
    goto LABEL_52;
  }
  v11 = v10;
  uint64_t v12 = [v30 fetchSoftErrorContextData];
  if (!v12)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: wifiToggleEventsArray is NULL", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]")
    }
    id v13 = 0;
    goto LABEL_53;
  }
  id v13 = (void *)v12;
  id v14 = [objc_alloc((Class)NSNumber) initWithDouble:Current];
  if (!v14)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:@"%s: Failed to alloc CurrTime" message:3];
    }
    goto LABEL_53;
  }
  id v15 = v14;
  if ((a3 & 0xFFFFFFF7) != 0)
  {
    if (a3 == 7 || a3 == 1)
    {
      [v11 setObject:v14 forKey:@"WiFiONEvent"];
      [v13 addObject:v11];
      unint64_t v16 = (unint64_t)[v13 count];
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: wifiToggleEventsArray:eventsCount:%u", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]", v16);
      }
      if ((int)v16 + 0x7FFFFFFF < 0)
      {
        uint64_t v18 = (v16 - 1);
        while (1)
        {
          unint64_t v16 = (v16 - 1);
          v19 = [v13 objectAtIndex:v18];
          if (!v19) {
            break;
          }
          v20 = v19;
          v21 = [v19 objectForKey:@"WiFiOFFEvent"];

          if (v21)
          {
            [v21 doubleValue];
            double v23 = Current - v22;
            if (v23 >= 3.0)
            {
              if (qword_10027DD68) {
                [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Not a WiFi-Toggle: TimeDelta:%f", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]", *(void *)&v23)];
              }
            }
            else
            {
              [v30 setErrorState:2];
              if (qword_10027DD68) {
                [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s:(Soft Error):WiFi Toggle Error Detected !", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]")
              }
              [(WiFiSoftErrorManager *)self wifiSoftErrorsInProcessStateSet:1];
              [(WiFiSoftErrorManager *)self WiFiSoftErrorReporting:1 deviceContext:a4 displayString:0];
              [(WiFiSoftErrorManager *)self wifiSoftErrorMitigation:1 mitigationContext:a4];
            }
            [(NSMutableArray *)self->_wifiToggleErrors removeObject:v30];

            id v30 = 0;
            goto LABEL_24;
          }
          --v18;
          if ((int)v16 < 1) {
            goto LABEL_24;
          }
        }
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: eventRef at index:%u is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]", v16);
        }
      }
    }
  }
  else
  {
    [v11 setObject:v14 forKey:@"WiFiOFFEvent"];
    [v13 addObject:v11];
  }
LABEL_24:
}

- (void)wifiSoftErrorWiFiScanEventHandler:(void *)a3
{
  if (qword_10027DD68) {
    [[(id)qword_10027DD68 WFLog:message:3, "%s: Received zero scan results Event", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]"];
  }
  if (self->_noNetworkFoundErrors)
  {
    uint64_t v6 = [(WiFiSoftErrorManager *)self fetchSoftErrorContext:a3 softErrorType:2];
    if (v6) {
      goto LABEL_13;
    }
    uint64_t v7 = [[WiFiSoftErrorContext alloc] initWithErrorType:2 deviceContext:a3];
    if (v7)
    {
      v21 = v7;
      [(NSMutableArray *)self->_noNetworkFoundErrors addObject:v7];
LABEL_12:
      uint64_t v6 = v21;
LABEL_13:
      id v22 = v6;
      id v23 = [v6 fetchSoftErrorContextData];
      if (!v23)
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: noNetworksEventsArray is NULL", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]")
        }
        goto LABEL_27;
      }
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: noNetworksEventsArray:%@", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]", v23 message];
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if ((unint64_t)[v23 count] > 2)
      {
        id v14 = [v23 objectAtIndex:0];
        if (v14)
        {
          id v15 = v14;
          [v14 doubleValue];
          if (Current - v16 < 60.0)
          {
            [v23 removeAllObjects];
            if (qword_10027DD68) {
              [((id)qword_10027DD68) WFLog:3, @"%s:(Soft Error):No Networks Found Detected !", @"-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]"];
            }
            [v22 setErrorState:2];
            [(WiFiSoftErrorManager *)self wifiSoftErrorsInProcessStateSet:2];
            [(WiFiSoftErrorManager *)self WiFiSoftErrorReporting:2 deviceContext:a3 displayString:0];
            [(WiFiSoftErrorManager *)self wifiSoftErrorMitigation:2 mitigationContext:a3];
            [v23 removeAllObjects];
            [(NSMutableArray *)self->_noNetworkFoundErrors removeObject:v22];

            uint64_t v18 = v23;
            goto LABEL_28;
          }
          [v23 removeObjectAtIndex:0];
          id v13 = [objc_alloc((Class)NSNumber) initWithDouble:Current];

          if (v13) {
            goto LABEL_25;
          }
        }
      }
      else
      {
        id v12 = [objc_alloc((Class)NSNumber) initWithDouble:Current];
        if (v12)
        {
          id v13 = v12;
LABEL_25:
          [v23 addObject:v13];

LABEL_26:
LABEL_27:
          uint64_t v18 = v22;
LABEL_28:

          return;
        }
      }
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: numRef Null", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]");
      }
      goto LABEL_26;
    }
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: failed to alloc wifiToggleError", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]")
    }
  }
  else
  {
    [(WiFiSoftErrorManager *)self initErrorArray:2];
    if (self->_noNetworkFoundErrors)
    {
      id v8 = [[WiFiSoftErrorContext alloc] initWithErrorType:2 deviceContext:a3];
      if (v8)
      {
        v21 = v8;
        [(NSMutableArray *)self->_noNetworkFoundErrors addObject:v8];
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: noNetworksErrorList:%@", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]", self->_noNetworkFoundErrors message];
        }
        goto LABEL_12;
      }
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: failed to allocate noNetworksError ", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]")
      }
    }
    else
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: noNetworksErrorArray is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]");
      }
    }
  }
}

- (void)wifiSoftErrorWiFiAutoJoinEventHandler:(void *)a3
{
  if (qword_10027DD68) {
    [[(id)qword_10027DD68 WFLog:message:3, "%s: Received delayed AutoJoin", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]"];
  }
  if (self->_autoJoinDelayErrors)
  {
    uint64_t v6 = [(WiFiSoftErrorManager *)self fetchSoftErrorContext:a3 softErrorType:4];
    if (v6) {
      goto LABEL_9;
    }
  }
  else
  {
    [(WiFiSoftErrorManager *)self initErrorArray:4];
    if (!self->_autoJoinDelayErrors)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: autoJoinDelayErrorArray is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]");
      }
      goto LABEL_44;
    }
  }
  uint64_t v7 = [[WiFiSoftErrorContext alloc] initWithErrorType:4 deviceContext:a3];
  if (v7)
  {
    id v30 = v7;
    [(NSMutableArray *)self->_autoJoinDelayErrors addObject:v7];
    uint64_t v6 = v30;
LABEL_9:
    id v31 = v6;
    id v8 = [v6 fetchSoftErrorContextData];
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: slowAutoJoinEventsArray:%@", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]", v8 message];
    }
    double Current = CFAbsoluteTimeGetCurrent();
    [v31 setDetectionTime:];
    id v11 = [objc_alloc((Class)NSNumber) initWithDouble:Current];
    if (!v11)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: numRef Null", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]");
      }

      v26 = v31;
      goto LABEL_34;
    }
    id v12 = v11;
    [v8 addObject:v11];
    if ([v8 count] == (id)10) {
      [v8 replaceObjectsInRange:0 withObjectsFromArray:v8 range:1];
    }
    id v13 = [(WiFiSoftErrorManager *)self fetchSoftErrorContext:a3 softErrorType:1];
    id v29 = v13;
    if (v13)
    {
      id v14 = [v13 fetchSoftErrorContextData];
      id v15 = v14;
      if (v14 && [v14 count])
      {
        id v16 = [v15 count];
        if ((uint64_t)v16 - 1 < 0)
        {
          v21 = 0;
        }
        else
        {
          uint64_t v17 = (uint64_t)v16;
          while (1)
          {
            uint64_t v18 = [v15 objectAtIndex:--v17];
            v19 = v18;
            if (v18)
            {
              uint64_t v20 = [v18 objectForKey:@"WiFiONEvent"];
              if (v20) {
                break;
              }
            }

            if (v17 <= 0)
            {
              v21 = 0;
              goto LABEL_29;
            }
          }
          v21 = (void *)v20;

          double v22 = CFAbsoluteTimeGetCurrent();
          [v21 doubleValue];
          if (v22 - v23 < 3.0)
          {
            if (qword_10027DD68) {
              [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: device was just powered on - skipping delayed auto-join detection", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]");
            }

            goto LABEL_33;
          }
        }
LABEL_29:
      }
    }
    else
    {
      id v15 = 0;
    }
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s:(Soft Error):Slow AutoJoin Error Detected !", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]");
    }
    [v31 setErrorState:2];
    [(WiFiSoftErrorManager *)self wifiSoftErrorsInProcessStateSet:4];
    [(WiFiSoftErrorManager *)self WiFiSoftErrorReporting:4 deviceContext:a3 displayString:0];
    [(WiFiSoftErrorManager *)self wifiSoftErrorMitigation:4 mitigationContext:a3];
LABEL_33:

    v26 = v29;
LABEL_34:

    return;
  }
  if (qword_10027DD68) {
    [[(id)qword_10027DD68 WFLog:@"%s: failed to alloc autoJoinDelayedError" message:3];
  }
LABEL_44:
}

- (void)wifiSoftErrorRxDataStallEventHandler:(void *)a3 eventData:(void *)a4
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:@"%s: Received Rx-Data -Stall Event" message:3];
  }
  if (!a3 || !a4)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:@"%s: deviceRef or data is NULL!" message:3];
    }
    goto LABEL_38;
  }
  if (self->_rxDataStallErrors)
  {
    id v8 = [(WiFiSoftErrorManager *)self fetchSoftErrorContext:a3 softErrorType:16];
    if (v8) {
      goto LABEL_11;
    }
  }
  else
  {
    [(WiFiSoftErrorManager *)self initErrorArray:16];
    if (!self->_rxDataStallErrors)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: rxDataStallErrorArray is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]")
      }
      goto LABEL_38;
    }
  }
  id v9 = [[WiFiSoftErrorContext alloc] initWithErrorType:16 deviceContext:a3];
  if (v9)
  {
    double v22 = v9;
    [(NSMutableArray *)self->_rxDataStallErrors addObject:v9];
    id v8 = v22;
LABEL_11:
    id v23 = v8;
    id v10 = [v8 fetchSoftErrorContextData];
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: rxDataStallEventsArray:%@", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]", v10 message];
    }
    uint64_t v12 = *(void *)a4;
    unsigned __int8 v13 = [(WiFiSoftErrorManager *)self getReachabilityStatus];
    if (v13)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Rx-Stall with errorCode:%lluu", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]", v12);
      }
      double Current = CFAbsoluteTimeGetCurrent();
      [v23 setDetectionTime:];
      id v16 = [objc_alloc((Class)NSNumber) initWithDouble:Current];
      if (v16)
      {
        uint64_t v17 = v16;
        [v10 addObject:v16];
        if ([v10 count] == (id)20) {
          [v10 replaceObjectsInRange:0 withObjectsFromArray:v10 range:1, 19];
        }
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s:(Soft Error):RX-Data Stall Error Detected !", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]");
        }
        [v23 setErrorState:2];
        [(WiFiSoftErrorManager *)self wifiSoftErrorsInProcessStateSet:16];
        [(WiFiSoftErrorManager *)self WiFiSoftErrorReporting:16 deviceContext:a3 displayString:0];
        [(WiFiSoftErrorManager *)self wifiSoftErrorMitigation:16 mitigationContext:a3];

        goto LABEL_22;
      }
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: numRef Null", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]")
      }
      uint64_t v20 = v21;
    }
    else
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Not a Rx-Stall", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]");
      }
      uint64_t v20 = v14;
    }
LABEL_22:

    return;
  }
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, @"%s: failed to alloc rxDataStallError", @"-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]"];
  }
LABEL_38:
}

- (void)wifiSoftErrorTxDataStallEventHandler:(void *)a3 eventData:(void *)a4
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Received Tx-Data Stall Event", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]")];
  }
  if (!a3 || !a4)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: deviceRef or data is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
    }
    goto LABEL_50;
  }
  if (self->_txDataStallErrors)
  {
    id v8 = [(WiFiSoftErrorManager *)self fetchSoftErrorContext:a3 softErrorType:8];
    if (v8) {
      goto LABEL_11;
    }
  }
  else
  {
    [(WiFiSoftErrorManager *)self initErrorArray:8];
    if (!self->_txDataStallErrors)
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, "%s: txDataStallErrorArray is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]"];
      }
      goto LABEL_50;
    }
  }
  id v9 = [[WiFiSoftErrorContext alloc] initWithErrorType:8 deviceContext:a3];
  if (!v9)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: failed to alloc txDataStallError", @"-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]"];
    }
LABEL_50:
    id v16 = 0;
    id v10 = 0;
    goto LABEL_36;
  }
  id v23 = v9;
  [(NSMutableArray *)self->_txDataStallErrors addObject:v9];
  id v8 = v23;
LABEL_11:
  id v24 = v8;
  id v10 = [v8 fetchSoftErrorContextData];
  if (![(WiFiSoftErrorManager *)self wifiSoftErrorTxDataStallProcessHistory:a4])
  {
LABEL_44:
    id v16 = 0;
    goto LABEL_45;
  }
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, @"%s:Tx-Stall Instance Detected", @"-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]"];
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [v24 setDetectionTime:];
  id v13 = [objc_alloc((Class)NSNumber) initWithDouble:Current];
  if (!v13)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:@"%s: numRef Null" message:3];
    }
    goto LABEL_44;
  }
  id v14 = v13;
  [v10 addObject:v13];
  if ([v10 count]) {
    [(WiFiSoftErrorManager *)self purgeOutdatedEvents:v10 currTime:Current];
  }
  id v15 = [v10 count];
  if ((unint64_t)v15 < 2)
  {
    id v16 = v14;
    goto LABEL_45;
  }
  if ((unint64_t)v15 >= 0x15) {
    [v10 removeObjectsInRange:1, ((_BYTE)v15 - 20)];
  }
  id v16 = [v10 objectAtIndex:0];

  if (v16)
  {
    [v16 doubleValue];
    if (Current - v17 >= 10.0)
    {
      if ([(WiFiSoftErrorManager *)self isLQAIndicatingTxStall])
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: TxStall Detected due to high TxPER(as per LQM)", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
        }
      }
      else
      {
        unsigned __int8 v19 = [(WiFiSoftErrorManager *)self getReachabilityStatus];
        if (v19)
        {
          if (qword_10027DD68) {
            [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: txStall NOT detected", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]")
          }
          goto LABEL_35;
        }
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: TxStall Detected due to Reachability Failure", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
        }
      }
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s:(Soft Error):TX-Data Stall Error Detected !", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
      }
      [v24 setErrorState:2];
      [(WiFiSoftErrorManager *)self wifiSoftErrorsInProcessStateSet:8];
      [(WiFiSoftErrorManager *)self WiFiSoftErrorReporting:8 deviceContext:a3 displayString:0];
      [(WiFiSoftErrorManager *)self wifiSoftErrorMitigation:8 mitigationContext:a3];
LABEL_35:
      [v10 removeAllObjects];
      [(NSMutableArray *)self->_txDataStallErrors removeObject:v24];

LABEL_36:
      id v24 = 0;
    }
  }
LABEL_45:
}

- (void)wifiSoftErrorWiFiTriggerDisconnectEventHandler:(void *)a3 eventData:(void *)a4
{
}

- (void)wifiSoftErrorUserDisconnectEventHandler:(void *)a3
{
}

- (void)wifiSoftErrorUnexpectedClientAssertionHandler:(void *)a3 eventData:(void *)a4
{
}

- (void)wifiSoftErrorAwdlEventNotificationHandler:(void *)a3 eventData:(void *)a4
{
  if (qword_10027DD68)
  {
    if (a4) {
      uint64_t v8 = *(unsigned int *)a4;
    }
    else {
      uint64_t v8 = 0;
    }
    [((id)qword_10027DD68) WFLog:message:3, "%s: SoftError eventType is %u \n", "-[WiFiSoftErrorManager wifiSoftErrorAwdlEventNotificationHandler:eventData:]", v8];
  }

  [(WiFiSoftErrorManager *)self WiFiSoftErrorReporting:256 deviceContext:a3 displayString:0];
}

- (void)wifiSoftErrorSlowWiFiEventHandler:(void *)a3 eventData:(void *)a4
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Slow WiFi event occured\n", "-[WiFiSoftErrorManager wifiSoftErrorSlowWiFiEventHandler:eventData:]")];
  }
  uint64_t v8 = sub_10000E5D0((uint64_t)a3, a4);
  if (v8)
  {
    id v9 = v8;
    id v10 = sub_10001A43C(v8);
    Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
    uint64_t v12 = Mutable;
    if (Mutable) {
      BOOL v13 = v10 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      CFRelease(v9);
      if (!v12) {
        return;
      }
    }
    else
    {
      CFStringAppendFormat(Mutable, 0, @"A slow Wi-Fi connection to “%@“ has been detected. Your response will be used to help tune our detection algorithm.", v10);
      [(WiFiSoftErrorManager *)self WiFiSoftErrorReporting:512 deviceContext:a3 displayString:v12];
      CFRelease(v9);
    }
    CFRelease(v12);
  }
}

- (void)WiFiSoftErrorDriverAvailableEventhandler
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Handle DriverAvailable Event: inProcessFlags:0x%0x", "-[WiFiSoftErrorManager WiFiSoftErrorDriverAvailableEventhandler]", self->_softErrorInProcessFlags);
  }
  if ((self->_softErrorInProcessFlags & 2) != 0)
  {
    [(WiFiSoftErrorManager *)self wifiSoftErrorsInProcessStateUnset:2];
  }
  else
  {
    self->_softErrorInProcessFlags = 0;
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: DriverAvailbale event received when not expected.Clearing inProcess State", "-[WiFiSoftErrorManager WiFiSoftErrorDriverAvailableEventhandler]");
    }
  }
}

- (void)WiFiSoftErrorDriverLinkupEventhandler
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:message:3, "%s: Handle Linkup/Roam Event:inProcessFlags:0x%0x", "-[WiFiSoftErrorManager WiFiSoftErrorDriverLinkupEventhandler]", self->_softErrorInProcessFlags];
  }
  if ((self->_softErrorInProcessFlags & 8) != 0)
  {
    [(WiFiSoftErrorManager *)self wifiSoftErrorsInProcessStateUnset:8];
  }
}

- (void)WiFiSoftErrorReporting:(int)a3 deviceContext:(void *)a4 displayString:(__CFString *)a5
{
  if (a3 >= 0x400)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: errorType Not Handled", @"-[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]"];
    }
  }
  else
  {
    uint64_t v7 = *(void *)&a3;
    -[WiFiSoftErrorManager wifiSoftErrorCounterUpdate:](self, "wifiSoftErrorCounterUpdate:");
    if (![(WiFiSoftErrorManager *)self shouldSupressErrorReporting:v7])
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: _isInternalBuild:%u _isReportingDisabled:%u supressTapToRadar:%u", "-[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]", self->_isInternalBuild, self->_isReportingDisabled, -[WiFiSoftErrorManager supressTapToRadar:deviceContext:](self, "supressTapToRadar:deviceContext:", v7, a4));
      }
      if (!self->_isInternalBuild
        || self->_isReportingDisabled
        || [(WiFiSoftErrorManager *)self supressTapToRadar:v7 deviceContext:a4])
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Supressed TapToRadar:errorType:%u !", "-[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]", v7);
        }
      }
      else
      {
        v15[0] = 0;
        v15[1] = v15;
        v15[2] = 0x2020000000;
        unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
        if (a5) {
          CFTypeRef v11 = CFRetain(a5);
        }
        else {
          CFTypeRef v11 = 0;
        }
        unint64_t v16 = (unint64_t)v11;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002DB74;
        block[3] = &unk_10023ED38;
        int v14 = v7;
        block[6] = a5;
        block[7] = a4;
        block[4] = self;
        block[5] = v15;
        dispatch_async((dispatch_queue_t)qword_10027DD88, block);
        _Block_object_dispose(v15, 8);
      }
      if (v7 == 64 || v7 == 32) {
        self->_lastReportedDisconnect = CFAbsoluteTimeGetCurrent();
      }
      else {
        self->_lastReportedSoftErrorTs = CFAbsoluteTimeGetCurrent();
      }
    }
  }
}

- (void)wifiSoftErrorMitigation:(int)a3 mitigationContext:(void *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (-[WiFiSoftErrorManager isEventMitigationEnabled:](self, "isEventMitigationEnabled:"))
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002DD0C;
    block[3] = &unk_10023ED60;
    int v10 = v5;
    block[4] = self;
    block[5] = a4;
    dispatch_async(queue, block);
  }
  else
  {
    [(WiFiSoftErrorManager *)self wifiSoftErrorsInProcessStateUnset:v5];
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: mitigation is supressed for SoftError:%u", "-[WiFiSoftErrorManager wifiSoftErrorMitigation:mitigationContext:]", v5];
    }
  }
}

- (void)wifiSoftErrorCounterUpdate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 > 31)
  {
    if (a3 > 255)
    {
      if (a3 == 256)
      {
        ++self->_errorCounters.awdlSoftErrorCount;
        return;
      }
      if (a3 == 512)
      {
        ++self->_errorCounters.slowWiFiErrorCount;
        return;
      }
    }
    else
    {
      if (a3 == 32)
      {
        ++self->_errorCounters.triggerDisconnectCount;
        return;
      }
      if (a3 == 64)
      {
        ++self->_errorCounters.userDisconnectCount;
        return;
      }
    }
LABEL_19:
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: invalid softErrorType:%u", "-[WiFiSoftErrorManager wifiSoftErrorCounterUpdate:]", v3);
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        ++self->_errorCounters.wifiToggleErrorCount;
        break;
      case 2:
        ++self->_errorCounters.noNetworksFoundErrorCount;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_19;
      case 4:
        ++self->_errorCounters.slowAutoJoinErrorCount;
        break;
      case 8:
        ++self->_errorCounters.txDataStallErrorCount;
        break;
      default:
        if (a3 != 16) {
          goto LABEL_19;
        }
        ++self->_errorCounters.rxDataStallErrorCount;
        break;
    }
  }
}

- (void)wifiSoftErrorUserConfirmationFlagSetting:(int)a3 forError:(int)a4 withDeviceContext:(void *)a5
{
  self->_errorCounters.lastSoftErrorUserFeedbk = a3;
  if (a3 != -1 && a4 == 512) {
    sub_100125B18((uint64_t)a5, a3 == 1);
  }
}

- (void)wifiSoftErrorUserConfirmationUpdate:(int)a3 withDeviceContext:(void *)a4
{
  uint64_t v4 = *(void *)&a3;
  [(WiFiSoftErrorManager *)self wifiSoftErrorUserConfirmationFlagSetting:1 forError:*(void *)&a3 withDeviceContext:a4];
  if ((int)v4 > 31)
  {
    if ((int)v4 > 255)
    {
      if (v4 == 256)
      {
        ++self->_errorCounters.awdlSoftErrorCount;
        return;
      }
      if (v4 == 512)
      {
        ++self->_errorCounters.slowWiFiUserConfirmCount;
        return;
      }
    }
    else
    {
      if (v4 == 32)
      {
        ++self->_errorCounters.triggerDisconnectUserConfirmCount;
        return;
      }
      if (v4 == 64)
      {
        ++self->_errorCounters.UserDisconnectUserConfirmCount;
        return;
      }
    }
LABEL_19:
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: invalid softErrorType:%u", "-[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:]", v4);
    }
  }
  else
  {
    switch((int)v4)
    {
      case 1:
        ++self->_errorCounters.wifiToggleErrorUserConfirmCount;
        break;
      case 2:
        ++self->_errorCounters.noNetworksFoundErrorUserConfirmCount;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_19;
      case 4:
        ++self->_errorCounters.slowAutoJoinErrorUserConfirmCount;
        break;
      case 8:
        ++self->_errorCounters.txDataStallErrorUserConfirmCount;
        break;
      default:
        if (v4 != 16) {
          goto LABEL_19;
        }
        ++self->_errorCounters.rxDataStallErrorUserConfirmCount;
        break;
    }
  }
}

- (softErrorCounters)getErrorCounters
{
  return &self->_errorCounters;
}

- (BOOL)wifiSoftErrorTxDataStallProcessHistory:(__CFDictionary *)a3
{
  unsigned int valuePtr = 0;
  double v17 = 0;
  value = 0;
  memset(v24, 0, 48);
  memset(v23, 0, sizeof(v23));
  memset(v22, 0, sizeof(v22));
  memset(v21, 0, sizeof(v21));
  memset(v20, 0, sizeof(v20));
  if (a3)
  {
    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_COUNT", (const void **)&value) && value)
    {
      CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Number of RateSeries Present:%u", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", valuePtr);
      }
    }
    uint64_t v6 = 0;
    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_LEGACY_RATES", (const void **)&v17) && v17)
    {
      [(WiFiSoftErrorManager *)self populateTxFailHistory:v17 failureHistoryArray:v24 historyArraySz:12];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: Legacy Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17 message];
      }
      uint64_t v6 = v24;
    }
    uint64_t v8 = 0;
    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_11N_1SS", (const void **)&v17) && v17)
    {
      [(WiFiSoftErrorManager *)self populateTxFailHistory:v17 failureHistoryArray:v23 historyArraySz:12];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: 11n 1SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17 message];
      }
      uint64_t v6 = v23;
      uint64_t v8 = 1;
    }
    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_11N_2SS", (const void **)&v17) && v17)
    {
      [(WiFiSoftErrorManager *)self populateTxFailHistory:v17 failureHistoryArray:v22 historyArraySz:12];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: 11N 2SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17 message];
      }
      uint64_t v6 = v22;
      uint64_t v8 = 1;
    }
    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_11AC_1SS", (const void **)&v17) && v17)
    {
      [(WiFiSoftErrorManager *)self populateTxFailHistory:v17 failureHistoryArray:v21 historyArraySz:12];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: 11AC 1SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17 message];
      }
      uint64_t v6 = v21;
      uint64_t v8 = 1;
    }
    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_11AC_2SS", (const void **)&v17) && v17)
    {
      [(WiFiSoftErrorManager *)self populateTxFailHistory:v17 failureHistoryArray:v20 historyArraySz:12];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: 11AC 2SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17 message];
      }
      uint64_t v6 = v20;
      uint64_t v8 = 1;
    }
    BOOL v13 = [(WiFiSoftErrorManager *)self isTxStalled:v6 rateType:v8 size:12];
    if (v13)
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, @"%s: Possible Tx-Stall", @"-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]"];
      }
      LOBYTE(v13) = 1;
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s:txFailHistoryDictionary is NULL", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]")
    }
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (BOOL)isTxStalled:(unsigned int *)a3 rateType:(unsigned __int8)a4 size:(unsigned int)a5
{
  if (a3 && a5)
  {
    unint64_t v5 = 0;
    unsigned int v6 = 0;
    unsigned int v7 = 0;
    do
    {
      unsigned int v8 = a3[v5];
      if (v5 >= 9) {
        unsigned int v9 = 0;
      }
      else {
        unsigned int v9 = a3[v5];
      }
      if (v5) {
        unsigned int v10 = 0;
      }
      else {
        unsigned int v10 = *a3;
      }
      if (a4) {
        unsigned int v9 = v10;
      }
      unsigned int v11 = v9 + v6;
      if (v8)
      {
        v7 += v8;
        unsigned int v6 = v11;
      }
      ++v5;
    }
    while (a5 != v5);
    if (v7) {
      double v12 = (float)(v6 / v7);
    }
    else {
      double v12 = 0.0;
    }
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: failureRatio:%f", "-[WiFiSoftErrorManager isTxStalled:rateType:size:]", *(void *)&v12);
    }
    if (v12 > 0.7) {
      return 1;
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s: Bad params!", "-[WiFiSoftErrorManager isTxStalled:rateType:size:]"];
    }
  }
  return 0;
}

- (void)populateTxFailHistory:(__CFArray *)a3 failureHistoryArray:(unsigned int *)a4 historyArraySz:(unsigned int)a5
{
  if (CFArrayGetCount(a3) >= a5) {
    uint64_t Count = a5;
  }
  else {
    uint64_t Count = CFArrayGetCount(a3);
  }
  if (a3 && a4 && a5)
  {
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a3, i);
        if (ValueAtIndex) {
          CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, a4);
        }
        ++a4;
      }
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Failure History params are invalid", "-[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:]");
    }
  }
}

- (BOOL)shouldSupressErrorReporting:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 64 || a3 == 32)
  {
    p_lastReportedDisconnect = &self->_lastReportedDisconnect;
    double reportingTimeout = 82800.0;
  }
  else
  {
    p_lastReportedDisconnect = &self->_lastReportedSoftErrorTs;
    double reportingTimeout = self->_reportingTimeout;
  }
  if ((a3 - 1) <= 0x3F && ((1 << (a3 - 1)) & 0x8000000080000001) != 0)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "Suppressing softerror (%u) reporting", v3, v10, v11);
    }
LABEL_9:
    return 1;
  }
  double v8 = *p_lastReportedDisconnect;
  double v9 = CFAbsoluteTimeGetCurrent() - v8;
  if (v9 < reportingTimeout)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s:Rate-Limiting-dropping this(%u) SoftError. TimeDelta:(%f)secs", "-[WiFiSoftErrorManager shouldSupressErrorReporting:]", v3, *(void *)&v9);
    }
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)askToLaunchTapToRadar:(int)a3
{
  CFOptionFlags v11 = 0;
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (Mutable)
  {
    CFStringRef v5 = Mutable;
    if (a3 == 4) {
      CFStringRef v6 = @"Did you manually disconnect from this network?";
    }
    else {
      CFStringRef v6 = @"Seeing WiFi Problems?";
    }
    if (a3 == 4) {
      CFStringRef v7 = @"If not, please file a radar.";
    }
    else {
      CFStringRef v7 = @"File a radar now?";
    }
    CFStringAppend(Mutable, v6);
    CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v5, v7, @"Dismiss", @"Radar", 0, &v11);
    BOOL v8 = (v11 & 3) != 0;
    CFRelease(v5);
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: failed to alloc string", @"-[WiFiSoftErrorManager askToLaunchTapToRadar:]"];
    }
    return 1;
  }
  return v8;
}

- (BOOL)askToLaunchTriggerDisconnectRadar:(__CFString *)a3
{
  CFOptionFlags v4 = 0;
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, a3, @"If WiFi was usable, please file radar", @"Dismiss", @"Radar", 0, &v4);
  return (v4 & 3) != 0;
}

- (BOOL)askToLaunchSlowWiFiRadar:(__CFString *)a3
{
  CFOptionFlags v4 = 0;
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, @"[Internal Only]", a3, @"Slow, File Radar", @"Not Slow", 0, &v4);
  return (v4 & 3) == 0;
}

- (BOOL)askToLaunchUserDisconnectRadar
{
  CFOptionFlags v3 = 0;
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, @"User Disconnected from WiFi", @"Seeing WiFi problems?", @"Dismiss", @"Radar", 0, &v3);
  return (v3 & 3) != 0;
}

- (void)launchTapToRadar:(int)a3 displayString:(__CFString *)a4 deviceContext:(void *)a5
{
  uint64_t v7 = *(void *)&a3;
  -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:](self, "wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:", 0xFFFFFFFFLL, *(void *)&a3);
  if ((int)v7 <= 31)
  {
    if (v7 == 8)
    {
      if ([(id)qword_10027DD68 getLogLevelEnable] == (id)1) {
        sub_100179B2C("softerror.tx_datapath_stall");
      }
      [(WiFiSoftErrorManager *)self wifiSoftErrorUserConfirmationUpdate:8 withDeviceContext:a5];
LABEL_21:
      CFStringRef v9 = @"tap-to-radar://new?Title=WiFi%20Tx%20Data%20Stall%20Problem&AutoDiagnostics=phone&Description=Not%20able%20to%20browse%20over%20WiFi%29%20Please%20provide%20following%20feedback%20%20-%0A1.%20Are%20you%20seeing%20poor%20wifi%20connectivity%20%28yes%2Fno%29%20-%0A2.%20User%20activity%20during%20this%20period%20-&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
      goto LABEL_22;
    }
    if (v7 == 16)
    {
      if ([(id)qword_10027DD68 getLogLevelEnable] == (id)1) {
        sub_100179B2C("softerror.rx_datapath.stall");
      }
      [(WiFiSoftErrorManager *)self wifiSoftErrorUserConfirmationUpdate:16 withDeviceContext:a5];
      CFStringRef v9 = @"tap-to-radar://new?Title=WiFi%20Rx%20Data%20Stall%20Problem&AutoDiagnostics=phone&Description=Not%20able%20to%20browse%20over%20WiFi&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  if (v7 != 512)
  {
    if (v7 == 64)
    {
      if (![(WiFiSoftErrorManager *)self askToLaunchUserDisconnectRadar])
      {
        [(WiFiSoftErrorManager *)self wifiSoftErrorUserConfirmationFlagSetting:0 forError:64 withDeviceContext:a5];
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s:User-Cancelled Filing UD Radar", "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]")
        }
        goto LABEL_36;
      }
      [(WiFiSoftErrorManager *)self wifiSoftErrorUserConfirmationUpdate:64 withDeviceContext:a5];
      CFStringRef v9 = @"tap-to-radar://new?Title=WiFi%20User%20Disconnect%20From%20Network&AutoDiagnostics=phone&Description=Please%20provide%20feedback%20on%20following-%0A1.%20Are%20you%20seeing%20poor%20wifi%20connectivity%20%28yes%2Fno%29%20-%0A2.%20You%20dont%20want%20WiFi%20to%20connect%20to%20this%20network%20%28yes%2Fno%29%20-%0A3.%20Did%20WiFi%20happen%20to%20rejoin%20again%20%28yes%2Fno%29%20-&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug";
      goto LABEL_22;
    }
    if (v7 == 32)
    {
      if ([(WiFiSoftErrorManager *)self askToLaunchTriggerDisconnectRadar:a4])
      {
        [(WiFiSoftErrorManager *)self wifiSoftErrorUserConfirmationUpdate:32 withDeviceContext:a5];
        CFStringRef v9 = @"tap-to-radar://new?Title=WiFi%20Trigger%20Disconnected%20too%20early&AutoDiagnostics=phone&Description=Please%20provide%20following%20feedback%20%20-%0A1.%20Are%20you%20seeing%20poor%20wifi%20connectivity%20%28yes%2Fno%29%20-%0A2.%20Do%20you%20expect%20wifi%20to%20be%20connected%20%28yes%2Fno%29%20-%0A3.%20User%20activity%20during%20this%20period%20-&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
        goto LABEL_22;
      }
      int v14 = self;
      uint64_t v15 = 32;
      goto LABEL_41;
    }
LABEL_27:
    if (![(WiFiSoftErrorManager *)self askToLaunchTapToRadar:v7])
    {
      [(WiFiSoftErrorManager *)self wifiSoftErrorUserConfirmationFlagSetting:0 forError:v7 withDeviceContext:a5];
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, "%s:User-Cancelled Filing Radar", "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]"];
      }
      goto LABEL_36;
    }
    [(WiFiSoftErrorManager *)self wifiSoftErrorUserConfirmationUpdate:v7 withDeviceContext:a5];
    if ((int)v7 <= 15)
    {
      CFStringRef v9 = @"tap-to-radar://new?Title=WiFi%20Toggle%20Problem&AutoDiagnostics=phone&Description=WiFi%20doesn't%20seem%20to%20work&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
      switch((int)v7)
      {
        case 1:
          goto LABEL_22;
        case 2:
          CFStringRef v9 = @"tap-to-radar://new?Title=No%20WiFi%20Networks%20Found%20Problem&AutoDiagnostics=phone&Description=I%20am%20not%20seeing%20any%20WiFi%20Networks%20On%20WiFi-Setting%20Page&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
          goto LABEL_22;
        case 4:
          CFStringRef v9 = @"tap-to-radar://new?Title=Slow%20AutoJoin%20Problem&AutoDiagnostics=phone&Description=WiFi%20is%20taking%20too%20long%20to%20connect%20to%20my%20known%20Network&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
          goto LABEL_22;
        case 8:
          goto LABEL_21;
        default:
          goto LABEL_34;
      }
    }
    if (v7 != 256)
    {
LABEL_34:
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:message:3, "%s: UnKnown Soft-Error Type\n", "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]"];
      }
      goto LABEL_36;
    }
    CFStringRef v9 = @"tap-to-radar://new?Title=WiFi%20Awdl%20Issues&AutoDiagnostics=phone&Description=Please%20provide%20feedback%20on%20following-%0A1.%20Which%20application%20are%20you%20running%29%20-%0A2.%20Did%20you%20see%20any%20performance%20issue%29%20-&ComponentID=482277&ComponentName=WiFi%20AWDL&ComponentVersion=iOS&Classification=Other%20Bug";
LABEL_22:
    uint64_t v11 = +[NSURL URLWithString:v9];
    if (v11)
    {
      id v16 = (id)v11;
      double v12 = +[LSApplicationWorkspace defaultWorkspace];
      [v12 openURL:v16];
    }
    return;
  }
  if ([(WiFiSoftErrorManager *)self askToLaunchSlowWiFiRadar:a4])
  {
    [(WiFiSoftErrorManager *)self wifiSoftErrorUserConfirmationUpdate:512 withDeviceContext:a5];
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s:SlowWiFi tap URL", "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]")];
    }
    CFStringRef v9 = @"tap-to-radar://new?Title=Slow%20WiFi%20detected&AutoDiagnostics=phone&Description=Please%20describe%20user%20activity%3A%0A%0AAt%20the%20time%20of%20Slow%20Wi-Fi%20error%20pop-up%2C%20were%20you%20observing%20any%20degraded%20wifi%20performance%3F%20%5BYes%2FNo%2FUnsure%5D%3A%0A%0AAfter%20selecting%20%E2%80%98Slow%2C%20File%20Radar%E2%80%99%20in%20the%20pop-up%2C%20was%20there%20any%20perceivable%20change%20in%20Wi-Fi%20performance%3F%20%5BYes%2FNo%2FUnsure%5D%3A%0A%0AAre%20you%20currently%20at%20home%2C%20office%20or%20other%20location%3F%0A%0A%20%20-If%20other%20location%2C%20please%20provide%20some%20details%20like%20Starbucks%2C%20Hotel%20captive%20network%2C%20etc%E2%80%A6%0A%0A%20%20-If%20at%20home%3A%0A%20%20%20%20-What%20is%20the%20make%20and%20model%20of%20the%20router%3F%0A%0A%20%20%20%20-Is%20the%20router%20at%20home%20surrounded%20by%20other%20electronic%20devices%20i.e.%20susceptible%20to%20RF%20interference%20or%20any%20obstacles%20strongly%20blocking%20RF%20signal%20%3F&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
    goto LABEL_22;
  }
  int v14 = self;
  uint64_t v15 = 512;
LABEL_41:
  [(WiFiSoftErrorManager *)v14 wifiSoftErrorUserConfirmationFlagSetting:0 forError:v15 withDeviceContext:a5];
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s:User-Cancelled Filing TD Radar", "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]")];
  }
LABEL_36:
}

- (void)purgeOutdatedEvents:(id)a3 currTime:(double)a4
{
  id v15 = a3;
  if (!v15)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: txStallEvents Array is NULL", "-[WiFiSoftErrorManager purgeOutdatedEvents:currTime:]"];
    }
    goto LABEL_20;
  }
  uint64_t v5 = +[NSMutableIndexSet indexSet];
  if (!v5)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: outdatedEvents allocation failed", @"-[WiFiSoftErrorManager purgeOutdatedEvents:currTime:]"];
    }
LABEL_20:
    goto LABEL_13;
  }
  CFStringRef v6 = (void *)v5;
  uint64_t v7 = (char *)[v15 count];
  if (v7)
  {
    BOOL v8 = v7;
    for (CFIndex i = 0; i != v8; ++i)
    {
      uint64_t v10 = [v15 objectAtIndex:i];
      uint64_t v11 = v10;
      if (v10)
      {
        [v10 doubleValue];
        if (v12 != 0.0 && a4 - v12 > 15.0) {
          [v6 addIndex:i];
        }
      }
    }
  }
  [v15 removeObjectsAtIndexes:v6];

LABEL_13:
}

- (BOOL)isLQAIndicatingTxStall
{
  int v2 = self->_primaryInterfaceStatsHistoryIdx + 4;
  unsigned int v3 = v2 - 5 * ((13108 * v2) >> 16);
  CFOptionFlags v4 = (char *)self + 4 * (unsigned __int16)(v2 - 5 * ((13108 * v2) >> 16));
  uint64_t v5 = *((unsigned int *)v4 + 81);
  uint64_t v6 = *((unsigned int *)v4 + 76);
  double v7 = 0.0;
  if (v6) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    double v7 = (float)((float)v6 / (float)v5);
  }
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: lastLqaStatsRdIdx:%u lastSampleStats txFrms:%u txFails:%u txPer:%f", "-[WiFiSoftErrorManager isLQAIndicatingTxStall]", (unsigned __int16)v3, v5, v6, *(void *)&v7);
  }
  return v7 > 0.5;
}

- (BOOL)getReachabilityStatus
{
  SCNetworkReachabilityFlags flags = 0;
  *(void *)&address.sa_data[6] = 0;
  *(void *)&address.sa_len = 528;
  int v2 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
  if (SCNetworkReachabilityGetFlags(v2, &flags)) {
    BOOL v3 = flags == 0;
  }
  else {
    BOOL v3 = 1;
  }
  BOOL v4 = !v3;
  if (!v3)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: NetworkReachabilityFlags :0x%0x", "-[WiFiSoftErrorManager getReachabilityStatus]", flags);
    }
  }
  if (qword_10027DD68)
  {
    double v7 = "NO";
    if (v4) {
      double v7 = "YES";
    }
    [((id)qword_10027DD68) WFLog:3, "%s: Internet Reachability Status :%s", "-[WiFiSoftErrorManager getReachabilityStatus]", v7];
  }
  if (v2) {
    CFRelease(v2);
  }
  return v4;
}

- (BOOL)supressTapToRadar:(int)a3 deviceContext:(void *)a4
{
  uint64_t v11 = 0;
  if (sub_10008FDD4((uint64_t)self->_manager) == 1)
  {
    unsigned int v12 = -1431655766;
    int v6 = sub_1000A4494((uint64_t)self->_manager, &v12, &v11);
    if (v6)
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:message:3, "%s: Failed to get motion state", "-[WiFiSoftErrorManager supressTapToRadar:deviceContext:]", v10, v11];
      }
    }
    else if (qword_10027DD68)
    {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Motion state is:%u", "-[WiFiSoftErrorManager supressTapToRadar:deviceContext:]", v12, v11);
    }
    if (a3 > 15)
    {
      if (a3 != 16) {
        return a3 == 512;
      }
    }
    else if (a3 != 4 && a3 != 8)
    {
      return 0;
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: WiFiDevice UserMode is Not Interactive!", "-[WiFiSoftErrorManager supressTapToRadar:deviceContext:]");
    }
  }
  return 1;
}

- (BOOL)supressEventDetectionProcesssing:(int)a3 deviceContext:(void *)a4
{
  if ((a3 & 0xFFFFFFFE) != 4) {
    return 0;
  }
  if (a4) {
    return (int)sub_1001221EC((uint64_t)a4) < -70;
  }
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, @"%s: deviceManagerRef is NULL!", @"-[WiFiSoftErrorManager supressEventDetectionProcesssing:deviceContext:]"];
  }
  return 0;
}

- (void)initEventMitigation
{
  *(_OWORD *)&self->_mitigationInfo.lastMitigationTime[4] = 0u;
  *(_OWORD *)&self->_mitigationInfo.lastMitigationTime[6] = 0u;
  *(_OWORD *)self->_mitigationInfo.lastMitigationTime = 0u;
  *(_OWORD *)&self->_mitigationInfo.lastMitigationTime[2] = 0u;
  *(_OWORD *)self->_mitigationInfo.mitigationAttemptuint64_t Count = 0u;
  *(_OWORD *)&self->_mitigationInfo.mitigationAttemptCount[4] = 0u;
  [(WiFiSoftErrorManager *)self enableSoftErrorMitigation:2];

  [(WiFiSoftErrorManager *)self enableSoftErrorMitigation:8];
}

- (void)enableSoftErrorMitigation:(int)a3
{
  unsigned int v4 = [(WiFiSoftErrorManager *)self softErrorTypeIndex:*(void *)&a3];
  if (v4 >= 7)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: Invalid softError Type", @"-[WiFiSoftErrorManager enableSoftErrorMitigation:]"];
    }
  }
  else
  {
    self->_mitigationInfo.mitigationAllowedFlag[v4] = 1;
  }
}

- (void)supressSoftErrorMitigation:(int)a3
{
  unsigned int v4 = [(WiFiSoftErrorManager *)self softErrorTypeIndex:*(void *)&a3];
  if (v4 >= 7)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Invalid softError Type", "-[WiFiSoftErrorManager supressSoftErrorMitigation:]");
    }
  }
  else
  {
    self->_mitigationInfo.mitigationAllowedFlag[v4] = 0;
  }
}

- (BOOL)isEventMitigationEnabled:(int)a3
{
  unsigned int v5 = -[WiFiSoftErrorManager softErrorTypeIndex:](self, "softErrorTypeIndex:");
  if (v5 >= 7)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: Invalid softError Type", "-[WiFiSoftErrorManager isEventMitigationEnabled:]"];
    }
  }
  else
  {
    if (a3 == 8) {
      return 1;
    }
    if (a3 == 2) {
      return self->_mitigationInfo.mitigationAllowedFlag[v5];
    }
  }
  return 0;
}

- (void)recordMitigation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  unsigned int v6 = [(WiFiSoftErrorManager *)self softErrorTypeIndex:v3];
  if (v6 >= 7)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Invalid softError Type", "-[WiFiSoftErrorManager recordMitigation:]", v10, v11);
    }
  }
  else
  {
    unsigned int v7 = v6;
    p_mitigationInfo = &self->_mitigationInfo;
    self->_mitigationInfo.lastMitigationTime[v6] = Current;
    ++self->_mitigationInfo.mitigationAttemptCount[v6];
    if (v3 == 2) {
      [(WiFiSoftErrorManager *)self supressSoftErrorMitigation:2];
    }
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: recording mitigationAttempt Count:(%u) for SoftError:%u", "-[WiFiSoftErrorManager recordMitigation:]", p_mitigationInfo->mitigationAttemptCount[v7], v3);
    }
  }
}

- (unsigned)softErrorTypeIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 > 15)
  {
    switch(a3)
    {
      case 16:
        return 4;
      case 32:
        return 5;
      case 64:
        return 6;
      default:
LABEL_12:
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Invalid softErrorType:%u", "-[WiFiSoftErrorManager softErrorTypeIndex:]", v3);
        }
        return 255;
    }
  }
  else
  {
    unsigned int result = 0;
    switch(a3)
    {
      case 1:
        return result;
      case 2:
        unsigned int result = 1;
        break;
      case 4:
        unsigned int result = 2;
        break;
      case 8:
        unsigned int result = 3;
        break;
      default:
        goto LABEL_12;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rxDataStallErrors, 0);
  objc_storeStrong((id *)&self->_txDataStallErrors, 0);
  objc_storeStrong((id *)&self->_autoJoinDelayErrors, 0);
  objc_storeStrong((id *)&self->_noNetworkFoundErrors, 0);
  objc_storeStrong((id *)&self->_wifiToggleErrors, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end