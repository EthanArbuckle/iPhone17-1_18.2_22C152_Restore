@interface SidecarRegisterErrorDomain
@end

@implementation SidecarRegisterErrorDomain

__CFString *__SidecarRegisterErrorDomain_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  if ([v5 isEqualToString:*MEMORY[0x263F08320]])
  {
    if ([v6 code] == -999)
    {
      v7 = [v6 userInfo];
      v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F08608]];

      if (v8)
      {
        uint64_t v9 = [v8 code];
        SidecarLocalizedString(@"A miscellaneous error occurred (%ld).", v10, v11, v12, v13, v14, v15, v16, v9);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_78;
      }
    }
    uint64_t v19 = [v6 code];
    if (v19 > -302)
    {
      switch(v19)
      {
        case -105:
          v28 = @"SidecarErrorServiceExistingSession";
          break;
        case -104:
          v28 = @"SidecarErrorServiceRestricted";
          break;
        case -103:
          v28 = @"SidecarErrorServiceNotSupported";
          break;
        case -102:
          v28 = @"SidecarErrorServiceNotConnected";
          break;
        case -101:
          v28 = @"SidecarErrorServiceDisconnected";
          break;
        case -100:
          v28 = @"SidecarErrorServiceAlreadyInUse";
          break;
        default:
          switch(v19)
          {
            case -203:
              v27 = @"SidecarErrorDeviceWiFiNotEnabled";
              goto LABEL_71;
            case -202:
              v28 = @"SidecarErrorDeviceLocked";
              goto LABEL_76;
            case -201:
              v28 = @"SidecarErrorDeviceTimedOut";
              goto LABEL_76;
            case -200:
              v28 = @"SidecarErrorDeviceNotFound";
              goto LABEL_76;
            default:
              if (v19 != -301) {
                goto LABEL_75;
              }
              v28 = @"SidecarErrorAccountNoD2DEncryption";
              break;
          }
          break;
      }
    }
    else
    {
      if (v19 <= -404)
      {
        switch(v19)
        {
          case -457:
            v27 = @"SidecarErrorDisplayRealityDeviceWiFiNotEnabled";
            goto LABEL_71;
          case -456:
            v27 = @"SidecarErrorDisplayAWDLRetrograde";
            goto LABEL_71;
          case -455:
            v28 = @"SidecarErrorDisplayAWDLDegraded";
            goto LABEL_76;
          case -454:
            v27 = @"SidecarErrorDisplayDeviceWiFiNotEnabled";
            goto LABEL_71;
          case -453:
            v28 = @"SidecarErrorDisplayAirPlayBusy";
            goto LABEL_76;
          case -452:
            v27 = @"SidecarErrorDisplayHostWiFiNotEnabled";
            goto LABEL_71;
          case -451:
            v27 = @"SidecarErrorDisplayHostIsHotSpot";
            goto LABEL_71;
          default:
            goto LABEL_75;
        }
      }
      if (v19 > -304)
      {
        if (v19 == -303) {
          v27 = @"SidecarErrorHostWiFiNotEnabled";
        }
        else {
          v27 = @"SidecarErrorHostIsHotSpot";
        }
LABEL_71:
        uint64_t v29 = SidecarLocalizedWirelessString(v27, v20, v21, v22, v23, v24, v25, v26, v31);
        goto LABEL_77;
      }
      if (v19 == -403)
      {
        v28 = @"SidecarErrorDisplayDeviceSoftwareNotSupported";
      }
      else if (v19 == -402)
      {
        v28 = @"SidecarErrorDisplayHostSoftwareNotSupported";
      }
      else
      {
LABEL_75:
        uint64_t v31 = v19;
        v28 = @"A miscellaneous error occurred (%ld).";
      }
    }
LABEL_76:
    uint64_t v29 = SidecarLocalizedString(v28, v20, v21, v22, v23, v24, v25, v26, v31);
LABEL_77:
    v17 = (__CFString *)v29;
    goto LABEL_78;
  }
  if ([v5 isEqualToString:*MEMORY[0x263F07F80]])
  {
    uint64_t v18 = [v6 code];
    v17 = 0;
    if (v18 > -402)
    {
      if (v18 > -302)
      {
        if ((unint64_t)v18 <= 0xFFFFFFFFFFFFFED2)
        {
          switch(v18)
          {
            case -205:
              v17 = @"SidecarErrorDeviceUSBDisconnect";
              break;
            case -204:
              v17 = @"SidecarErrorDeviceUSBConnect";
              break;
            case -203:
              v17 = @"SidecarErrorDeviceWiFiNotEnabled";
              break;
            case -202:
              v17 = @"SidecarErrorDeviceLocked";
              break;
            case -201:
              v17 = @"SidecarErrorDeviceTimedOut";
              break;
            case -200:
              v17 = @"SidecarErrorDeviceNotFound";
              break;
            default:
              JUMPOUT(0);
          }
        }
        else
        {
          switch(v18)
          {
            case -105:
              v17 = @"SidecarErrorServiceExistingSession";
              break;
            case -104:
              v17 = @"SidecarErrorServiceRestricted";
              break;
            case -103:
              v17 = @"SidecarErrorServiceNotSupported";
              break;
            case -102:
              v17 = @"SidecarErrorServiceNotConnected";
              break;
            case -101:
              v17 = @"SidecarErrorServiceDisconnected";
              break;
            case -100:
              v17 = @"SidecarErrorServiceAlreadyInUse";
              break;
            default:
              if (v18 == -301) {
                v17 = @"SidecarErrorAccountNoD2DEncryption";
              }
              break;
          }
        }
      }
      else
      {
        switch(v18)
        {
          case -401:
            v17 = @"SidecarErrorDisplayVideoStreamInterrupted";
            break;
          case -303:
            v17 = @"SidecarErrorHostWiFiNotEnabled";
            break;
          case -302:
            v17 = @"SidecarErrorHostIsHotSpot";
            break;
        }
      }
    }
    else if (v18 > -457)
    {
      switch(v18)
      {
        case -456:
          v17 = @"SidecarErrorDisplayAWDLRetrograde";
          break;
        case -455:
          v17 = @"SidecarErrorDisplayAWDLDegraded";
          break;
        case -454:
          v17 = @"SidecarErrorDisplayDeviceWiFiNotEnabled";
          break;
        case -453:
          v17 = @"SidecarErrorDisplayAirPlayBusy";
          break;
        case -452:
          v17 = @"SidecarErrorDisplayHostWiFiNotEnabled";
          break;
        case -451:
          v17 = @"SidecarErrorDisplayHostIsHotSpot";
          break;
        default:
          if (v18 == -403)
          {
            v17 = @"SidecarErrorDisplayDeviceSoftwareNotSupported";
          }
          else if (v18 == -402)
          {
            v17 = @"SidecarErrorDisplayHostSoftwareNotSupported";
          }
          break;
      }
    }
    else if (v18 <= -1001)
    {
      if (v18 > -1011)
      {
        if (v18 == -1010)
        {
          v17 = @"SidecarErrorProtocolError";
        }
        else if (v18 == -1001)
        {
          v17 = @"SidecarErrorInvalidArgument";
        }
      }
      else if (v18 == -1020)
      {
        v17 = @"SidecarErrorSessionNotFound";
      }
      else if (v18 == -1011)
      {
        v17 = @"SidecarErrorEncodingFailed";
      }
    }
    else if (v18 <= -503)
    {
      if (v18 == -1000)
      {
        v17 = @"SidecarErrorEntitlementMissing";
      }
      else if (v18 == -999)
      {
        v17 = @"SidecarErrorGenericError";
      }
    }
    else
    {
      switch(v18)
      {
        case -502:
          v17 = @"SidecarErrorVirtualDisplayInvalid";
          break;
        case -501:
          v17 = @"SidecarErrorVirtualDisplayFailed";
          break;
        case -500:
          v17 = @"SidecarErrorVirtualDisplayBusy";
          break;
      }
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_78:

  return v17;
}

@end