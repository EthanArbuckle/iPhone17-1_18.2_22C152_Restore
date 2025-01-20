@interface CBAccessoryInfo
- (CBDevice)cbDevice;
- (CBDevice)primaryCBDevice;
- (NSMutableDictionary)powerSourceDetailsCase;
- (NSMutableDictionary)powerSourceDetailsLeft;
- (NSMutableDictionary)powerSourceDetailsRight;
- (OpaqueIOPSPowerSourceID)powerSourceIDCase;
- (OpaqueIOPSPowerSourceID)powerSourceIDLeft;
- (OpaqueIOPSPowerSourceID)powerSourceIDRight;
- (id)description;
- (void)_powerSourceUpdateWithPartID:(const char *)a3;
- (void)invalidate;
- (void)powerSourceRemove;
- (void)powerSourceUpdate;
- (void)setCbDevice:(id)a3;
- (void)setPowerSourceDetailsCase:(id)a3;
- (void)setPowerSourceDetailsLeft:(id)a3;
- (void)setPowerSourceDetailsRight:(id)a3;
- (void)setPowerSourceIDCase:(OpaqueIOPSPowerSourceID *)a3;
- (void)setPowerSourceIDLeft:(OpaqueIOPSPowerSourceID *)a3;
- (void)setPowerSourceIDRight:(OpaqueIOPSPowerSourceID *)a3;
- (void)setPrimaryCBDevice:(id)a3;
@end

@implementation CBAccessoryInfo

- (id)description
{
  objc_opt_class();
  v3 = [(CBDevice *)self->_cbDevice identifier];
  v4 = NSPrintF_safe();

  return v4;
}

- (void)invalidate
{
}

- (void)powerSourceUpdate
{
  if ([(CBDevice *)self->_cbDevice proximityPairingProductID]
    && ([(CBDevice *)self->_cbDevice accessoryStatusFlags] & 1) != 0)
  {
    if ([(CBDevice *)self->_cbDevice batteryStateMain]) {
      return;
    }
    [(CBAccessoryInfo *)self _powerSourceUpdateWithPartID:"Left"];
    [(CBAccessoryInfo *)self _powerSourceUpdateWithPartID:"Right"];
  }
  else
  {
    if (self->_powerSourceIDLeft)
    {
      IOPSReleasePowerSource();
      if (dword_1009F7F28 < 31 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
      {
        v5 = CUPrintErrorCode();
        LogPrintF_safe();
      }
      self->_powerSourceIDLeft = 0;
    }
    powerSourceDetailsLeft = self->_powerSourceDetailsLeft;
    self->_powerSourceDetailsLeft = 0;

    if (self->_powerSourceIDRight)
    {
      IOPSReleasePowerSource();
      if (dword_1009F7F28 < 31 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
      {
        v6 = CUPrintErrorCode();
        LogPrintF_safe();
      }
      self->_powerSourceIDRight = 0;
    }
    powerSourceDetailsRight = self->_powerSourceDetailsRight;
    self->_powerSourceDetailsRight = 0;
  }

  [(CBAccessoryInfo *)self _powerSourceUpdateWithPartID:"Case"];
}

- (void)_powerSourceUpdateWithPartID:(const char *)a3
{
  v5 = self->_cbDevice;
  v6 = [(CBDevice *)v5 identifier];
  if (v6)
  {
    unsigned int v7 = [(CBDevice *)v5 proximityPairingProductID];
    unsigned int v8 = [(CBDevice *)v5 proximityPairingProductID];
    v91 = self;
    if (v8 == 8213) {
      unsigned int v9 = 8212;
    }
    else {
      unsigned int v9 = v7;
    }
    unsigned int v10 = [(CBDevice *)v5 proximityPairingProductID];
    if (v10 == 8216) {
      unsigned int v9 = 8228;
    }
    unsigned int v11 = [(CBDevice *)v5 proximityPairingProductID];
    uint64_t v12 = v11 == 8220 ? 8219 : v9;
    BOOL v13 = v11 == 8220 || v10 == 8216;
    if (v13 || v8 == 8213)
    {
      if (!strcmp(a3, "Left"))
      {
        [(CBDevice *)v5 batteryLevelLeft];
        float v16 = v15;
        unsigned int v17 = [(CBDevice *)v5 batteryStateLeft];
        uint64_t v18 = 24;
        uint64_t v19 = 16;
      }
      else
      {
        if (strcmp(a3, "Right"))
        {
          if (strcmp(a3, "Case"))
          {
            if (dword_1009F7F28 <= 90 && (dword_1009F7F28 != -1 || _LogCategory_Initialize())) {
              LogPrintF_safe();
            }
            goto LABEL_152;
          }
          [(CBDevice *)v5 batteryLevelCase];
          float v16 = v34;
          unsigned int v17 = [(CBDevice *)v5 batteryStateCase];
          uint64_t v18 = 56;
          uint64_t v19 = 48;
          v21 = "Audio Battery Case";
LABEL_27:
          v22 = (id *)((char *)&self->super.isa + v19);
          if (!v17)
          {
            if (*(Class *)((char *)&self->super.isa + v18))
            {
              IOPSReleasePowerSource();
              if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
              {
                v84 = CUPrintErrorCode();
                LogPrintF_safe();
              }
              *(Class *)((char *)&self->super.isa + v18) = 0;
            }
            id v38 = *v22;
            id *v22 = 0;

            goto LABEL_152;
          }
          uint64_t v88 = v18;
          id v23 = *v22;
          BOOL v90 = v23 == 0;
          if (!v23)
          {
            id v23 = objc_alloc_init((Class)NSMutableDictionary);
            objc_storeStrong(v22, v23);
            v24 = +[NSString stringWithUTF8String:v21];
            [v23 setObject:v24 forKeyedSubscript:@"Accessory Category"];

            [v23 setObject:v6 forKeyedSubscript:@"Accessory Identifier"];
            [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Is Present"];
            [v23 setObject:&off_1009E0A40 forKeyedSubscript:@"Max Capacity"];
            v25 = +[NSString stringWithUTF8String:a3];
            [v23 setObject:v25 forKeyedSubscript:@"Part Identifier"];

            v26 = +[NSNumber numberWithUnsignedInt:v12];
            [v23 setObject:v26 forKeyedSubscript:@"Product ID"];

            [v23 setObject:@"Bluetooth LE" forKeyedSubscript:@"Transport Type"];
            [v23 setObject:@"Accessory Source" forKeyedSubscript:@"Type"];
            [v23 setObject:&off_1009E0A58 forKeyedSubscript:@"Vendor ID"];
            v27 = +[NSNumber numberWithUnsignedChar:[(CBDevice *)v5 vendorIDSource]];
            [v23 setObject:v27 forKeyedSubscript:@"Vendor ID Source"];

            v28 = [(CBDevice *)v5 btAddressData];
            v29 = CUPrintNSDataAddress();
            [v23 setObject:v29 forKeyedSubscript:@"Group Identifier"];
          }
          int v30 = strcmp(a3, "Case");
          v31 = [v23 objectForKeyedSubscript:@"Name"];
          if (v30)
          {
            v32 = [self->_primaryCBDevice name];
            goto LABEL_82;
          }
          id v33 = [(CBDevice *)v5 proximityPairingProductID];
          if ((int)v33 > 665)
          {
            if ((int)v33 <= 799)
            {
              if ((int)v33 > 776)
              {
                switch((int)v33)
                {
                  case 777:
                    v35 = +[NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                    v36 = v35;
                    CFStringRef v37 = @"apple_wireless_mouse";
                    goto LABEL_80;
                  case 780:
                    v35 = +[NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                    v36 = v35;
                    CFStringRef v37 = @"apple_mighty_mouse";
                    goto LABEL_80;
                  case 781:
LABEL_74:
                    v35 = +[NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                    v36 = v35;
                    CFStringRef v37 = @"apple_magic_mouse";
                    goto LABEL_80;
                  case 782:
LABEL_65:
                    v35 = +[NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                    v36 = v35;
                    CFStringRef v37 = @"apple_magic_trackpad";
                    goto LABEL_80;
                  default:
                    goto LABEL_157;
                }
              }
              switch(v33)
              {
                case 0x29A:
LABEL_153:
                  v35 = +[NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                  v36 = v35;
                  CFStringRef v37 = @"apple_magic_keyboard_touch";
                  break;
                case 0x29C:
LABEL_75:
                  v35 = +[NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                  v36 = v35;
                  CFStringRef v37 = @"apple_magic_keyboard";
                  break;
                case 0x29F:
LABEL_73:
                  v35 = +[NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                  v36 = v35;
                  CFStringRef v37 = @"apple_magic_keyboard_touch_keypad";
                  break;
                default:
LABEL_157:
                  v36 = +[CBProductInfo productInfoWithProductID:v33];
                  uint64_t v39 = [v36 productName];
                  goto LABEL_81;
              }
            }
            else
            {
              if ((int)v33 <= 8212)
              {
                switch((int)v33)
                {
                  case 800:
                    goto LABEL_75;
                  case 801:
                    goto LABEL_153;
                  case 802:
                    goto LABEL_73;
                  case 803:
                    goto LABEL_74;
                  case 804:
                    goto LABEL_65;
                  default:
                    goto LABEL_157;
                }
              }
              if (v33 != 8220 && v33 != 8216 && v33 != 8213) {
                goto LABEL_157;
              }
              v35 = +[NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
              v36 = v35;
              CFStringRef v37 = @"apple_airpods_case";
            }
          }
          else
          {
            if ((int)v33 > 570)
            {
              if ((int)v33 > 598)
              {
                switch((int)v33)
                {
                  case 613:
                    goto LABEL_65;
                  case 614:
                  case 616:
                  case 618:
                  case 619:
                    goto LABEL_157;
                  case 615:
                    goto LABEL_75;
                  case 617:
                    goto LABEL_74;
                  case 620:
                    v35 = +[NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
                    v36 = v35;
                    CFStringRef v37 = @"apple_magic_keyboard_keypad";
                    goto LABEL_80;
                  default:
                    if (v33 != 599) {
                      goto LABEL_157;
                    }
                    goto LABEL_79;
                }
              }
              if (v33 != 571 && v33 != 597 && v33 != 598) {
                goto LABEL_157;
              }
            }
            else if ((int)v33 <= 555)
            {
              if ((int)v33 > 520)
              {
                if (v33 != 521 && v33 != 522) {
                  goto LABEL_157;
                }
              }
              else
              {
                if (!v33)
                {
                  v32 = 0;
LABEL_82:
                  v89 = v6;
                  if (v32)
                  {
                    id v40 = v31;
                    id v41 = v32;
                    if (v40 == v41)
                    {
                    }
                    else
                    {
                      v42 = v41;
                      if (v40)
                      {
                        unsigned __int8 v43 = [v40 isEqual:v41];

                        if (v43) {
                          goto LABEL_90;
                        }
                      }
                      else
                      {
                      }
                      [v23 setObject:v42 forKeyedSubscript:@"Name"];
                      BOOL v90 = 1;
                    }
                  }
LABEL_90:
                  if (dword_1009F7F28 <= 30 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
                  {
                    uint64_t v82 = (int)(float)(v16 * 100.0);
                    LogPrintF_safe();
                  }
                  v44 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)(float)(v16 * 100.0), v82);
                  v45 = [v23 objectForKeyedSubscript:@"Current Capacity"];
                  id v46 = v44;
                  id v47 = v45;
                  v86 = v32;
                  v87 = v31;
                  if (v46 == v47)
                  {

                    goto LABEL_101;
                  }
                  v48 = v47;
                  if ((v46 == 0) != (v47 != 0))
                  {
                    unsigned __int8 v49 = [v46 isEqual:v47];

                    if (v49)
                    {
LABEL_101:
                      v50 = @"Battery Power";
                      if (v17 == 1) {
                        v50 = @"AC Power";
                      }
                      v51 = v50;
                      v52 = [v23 objectForKeyedSubscript:@"Power Source State"];
                      v53 = v51;
                      v54 = v52;
                      if (v53 == v54)
                      {

                        goto LABEL_110;
                      }
                      v55 = v54;
                      if (v54)
                      {
                        unsigned __int8 v56 = [(__CFString *)v53 isEqual:v54];

                        if (v56)
                        {
LABEL_110:
                          if (v17 == 1) {
                            v57 = &__kCFBooleanTrue;
                          }
                          else {
                            v57 = &__kCFBooleanFalse;
                          }
                          id v58 = v57;
                          v59 = [v23 objectForKeyedSubscript:@"Is Charging"];
                          id v60 = v58;
                          id v61 = v59;
                          if (v60 == v61)
                          {

                            goto LABEL_120;
                          }
                          v62 = v61;
                          if (v61)
                          {
                            unsigned __int8 v63 = [v60 isEqual:v61];

                            if (v63)
                            {
LABEL_120:
                              if ((int)(float)(v16 * 100.0) >= 10) {
                                v64 = &__kCFBooleanFalse;
                              }
                              else {
                                v64 = &__kCFBooleanTrue;
                              }
                              id v65 = v64;
                              v66 = [v23 objectForKeyedSubscript:@"Low Warn Level"];
                              id v67 = v65;
                              id v68 = v66;
                              if (v67 == v68)
                              {

                                v70 = v91;
                                goto LABEL_130;
                              }
                              v69 = v68;
                              v70 = v91;
                              if (v68)
                              {
                                unsigned __int8 v71 = [v67 isEqual:v68];

                                if (v71)
                                {
LABEL_130:
                                  [(CBDevice *)v5 accessoryStatusOBCTime];
                                  if ((int)(v72 / 60.0) < 1)
                                  {
LABEL_139:
                                    uint64_t v79 = *(uint64_t *)((char *)&v70->super.isa + v88);
                                    int v80 = v90;
                                    if (!v79)
                                    {
                                      IOPSCreatePowerSource();
                                      uint64_t v79 = 0;
                                      *(Class *)((char *)&v70->super.isa + v88) = 0;
                                      if (dword_1009F7F28 <= 30
                                        && (dword_1009F7F28 != -1 || (v81 = _LogCategory_Initialize(), uint64_t v79 = 0, v81)))
                                      {
                                        v85 = CUPrintErrorCode();
                                        LogPrintF_safe();

                                        int v80 = 1;
                                        uint64_t v79 = 0;
                                      }
                                      else
                                      {
                                        int v80 = 1;
                                      }
                                    }
                                    if (v79)
                                    {
                                      if (v80)
                                      {
                                        IOPSSetPowerSourceDetails();
                                        if (dword_1009F7F28 <= 30
                                          && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
                                        {
                                          v83 = CUPrintErrorCode();
                                          LogPrintF_safe();
                                        }
                                      }
                                    }

                                    v6 = v89;
                                    goto LABEL_152;
                                  }
                                  v73 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
                                  v74 = [v23 objectForKeyedSubscript:@"Time to Full Charge"];
                                  id v75 = v73;
                                  id v76 = v74;
                                  if (v75 == v76)
                                  {
                                  }
                                  else
                                  {
                                    v77 = v76;
                                    if ((v75 == 0) != (v76 != 0))
                                    {
                                      unsigned __int8 v78 = [v75 isEqual:v76];

                                      if (v78) {
                                        goto LABEL_138;
                                      }
                                    }
                                    else
                                    {
                                    }
                                    [v23 setObject:v75 forKeyedSubscript:@"Time to Full Charge"];
                                    BOOL v90 = 1;
                                  }
LABEL_138:

                                  goto LABEL_139;
                                }
                              }
                              else
                              {
                              }
                              [v23 setObject:v67 forKeyedSubscript:@"Low Warn Level"];
                              BOOL v90 = 1;
                              goto LABEL_130;
                            }
                          }
                          else
                          {
                          }
                          [v23 setObject:v60 forKeyedSubscript:@"Is Charging"];
                          BOOL v90 = 1;
                          goto LABEL_120;
                        }
                      }
                      else
                      {
                      }
                      [v23 setObject:v53 forKeyedSubscript:@"Power Source State"];
                      BOOL v90 = 1;
                      goto LABEL_110;
                    }
                  }
                  else
                  {
                  }
                  [v23 setObject:v46 forKeyedSubscript:@"Current Capacity"];
                  BOOL v90 = 1;
                  goto LABEL_101;
                }
                if (v33 != 520) {
                  goto LABEL_157;
                }
              }
            }
            else if ((int)v33 > 558 && v33 != 569 && v33 != 570)
            {
              goto LABEL_157;
            }
LABEL_79:
            v35 = +[NSBundle bundleWithIdentifier:@"com.apple.CoreBluetooth"];
            v36 = v35;
            CFStringRef v37 = @"apple_wireless_keyboard";
          }
LABEL_80:
          uint64_t v39 = [v35 localizedStringForKey:v37 value:&stru_1009C1AC8 table:@"CBLocalizable"];
LABEL_81:
          v32 = (void *)v39;

          goto LABEL_82;
        }
        [(CBDevice *)v5 batteryLevelRight];
        float v16 = v20;
        unsigned int v17 = [(CBDevice *)v5 batteryStateRight];
        uint64_t v18 = 40;
        uint64_t v19 = 32;
      }
      v21 = "Headset";
      goto LABEL_27;
    }
  }
LABEL_152:
}

- (void)powerSourceRemove
{
  if (self->_powerSourceIDLeft)
  {
    IOPSReleasePowerSource();
    if (dword_1009F7F28 < 31 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
    {
      v6 = CUPrintErrorCode();
      LogPrintF_safe();
    }
    self->_powerSourceIDLeft = 0;
  }
  powerSourceDetailsLeft = self->_powerSourceDetailsLeft;
  self->_powerSourceDetailsLeft = 0;

  if (self->_powerSourceIDRight)
  {
    IOPSReleasePowerSource();
    if (dword_1009F7F28 < 31 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v7 = CUPrintErrorCode();
      LogPrintF_safe();
    }
    self->_powerSourceIDRight = 0;
  }
  powerSourceDetailsRight = self->_powerSourceDetailsRight;
  self->_powerSourceDetailsRight = 0;

  if (self->_powerSourceIDCase)
  {
    IOPSReleasePowerSource();
    if (dword_1009F7F28 < 31 && (dword_1009F7F28 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v8 = CUPrintErrorCode();
      LogPrintF_safe();
    }
    self->_powerSourceIDCase = 0;
  }
  powerSourceDetailsCase = self->_powerSourceDetailsCase;
  self->_powerSourceDetailsCase = 0;
}

- (CBDevice)cbDevice
{
  return self->_cbDevice;
}

- (void)setCbDevice:(id)a3
{
}

- (NSMutableDictionary)powerSourceDetailsLeft
{
  return self->_powerSourceDetailsLeft;
}

- (void)setPowerSourceDetailsLeft:(id)a3
{
}

- (OpaqueIOPSPowerSourceID)powerSourceIDLeft
{
  return self->_powerSourceIDLeft;
}

- (void)setPowerSourceIDLeft:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceIDLeft = a3;
}

- (NSMutableDictionary)powerSourceDetailsRight
{
  return self->_powerSourceDetailsRight;
}

- (void)setPowerSourceDetailsRight:(id)a3
{
}

- (OpaqueIOPSPowerSourceID)powerSourceIDRight
{
  return self->_powerSourceIDRight;
}

- (void)setPowerSourceIDRight:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceIDRight = a3;
}

- (NSMutableDictionary)powerSourceDetailsCase
{
  return self->_powerSourceDetailsCase;
}

- (void)setPowerSourceDetailsCase:(id)a3
{
}

- (OpaqueIOPSPowerSourceID)powerSourceIDCase
{
  return self->_powerSourceIDCase;
}

- (void)setPowerSourceIDCase:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceIDCase = a3;
}

- (CBDevice)primaryCBDevice
{
  return self->_primaryCBDevice;
}

- (void)setPrimaryCBDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryCBDevice, 0);
  objc_storeStrong((id *)&self->_powerSourceDetailsCase, 0);
  objc_storeStrong((id *)&self->_powerSourceDetailsRight, 0);
  objc_storeStrong((id *)&self->_powerSourceDetailsLeft, 0);

  objc_storeStrong((id *)&self->_cbDevice, 0);
}

@end