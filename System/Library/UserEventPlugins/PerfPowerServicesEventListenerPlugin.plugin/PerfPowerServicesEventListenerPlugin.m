void *logHandle()
{
  if (qword_13D08 != -1) {
    dispatch_once(&qword_13D08, &stru_10378);
  }
  return off_13B48;
}

void sub_2470(id a1)
{
  off_13B48 = os_log_create("com.apple.powerlog", "energyDebug");
  if (!off_13B48)
  {
    off_13B48 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A85C();
    }
  }
}

id sub_2CAC(void *a1)
{
  id v2 = (id)objc_opt_new();
  if (+[PLPowerEventListener hasBaseband]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 3;
  }
  do
  {
    if (objc_msgSend(a1, "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3)))
    {
      v4 = (_UNKNOWN **)objc_msgSend(a1, "objectForKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
      v5 = v2;
    }
    else
    {
      v5 = v2;
      v4 = &off_13C58;
    }
    [v5 addObject:v4];
    BOOL v6 = (int)v3 <= 0;
    uint64_t v3 = (v3 - 1);
  }
  while (!v6);
  id v7 = (id)objc_opt_new();
  if (exp2((double)(unint64_t)[v2 count]) > 0.0)
  {
    uint64_t v8 = 0;
    do
    {
      if ([v2 count])
      {
        unint64_t v9 = 0;
        char v10 = -1;
        while (1)
        {
          if ((unint64_t)objc_msgSend(objc_msgSend(v2, "objectAtIndexedSubscript:", v9), "integerValue") <= 1)
          {
            id v11 = (id)((v8 >> (v10 + [v2 count])) & 1);
            if (objc_msgSend(objc_msgSend(v2, "objectAtIndexedSubscript:", v9), "integerValue") != v11) {
              break;
            }
          }
          ++v9;
          --v10;
          if ((unint64_t)[v2 count] <= v9) {
            goto LABEL_16;
          }
        }
      }
      else
      {
LABEL_16:
        objc_msgSend(v7, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
      }
      uint64_t v8 = (v8 + 1);
    }
    while (exp2((double)(unint64_t)[v2 count]) > (double)v8);
  }

  return +[NSSet setWithArray:v7];
}

id sub_2E70(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleDayChange];
}

void sub_3FE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSDictionary *sub_40C4(uint64_t a1)
{
  v3[0] = @"duration";
  v4[0] = +[NSNumber numberWithLong:*(void *)(a1 + 40)];
  v3[1] = @"energy";
  v4[1] = +[NSNumber numberWithLong:*(void *)(a1 + 48)];
  v3[2] = @"energyAbsolute";
  v4[2] = +[NSNumber numberWithLong:*(void *)(a1 + 56)];
  v3[3] = @"energyAbsoluteNet";
  v4[3] = +[NSNumber numberWithLong:*(void *)(a1 + 64)];
  v3[4] = @"energyPassedChargeNet";
  v4[4] = +[NSNumber numberWithLong:*(void *)(a1 + 72)];
  v3[5] = @"energyChargeAccumNet";
  v4[5] = +[NSNumber numberWithLong:*(void *)(a1 + 80)];
  v3[6] = @"energyRaw";
  v4[6] = +[NSNumber numberWithLong:*(void *)(a1 + 88)];
  v3[7] = @"stateCount";
  v4[7] = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 100)];
  v3[8] = @"pluggedIn";
  v4[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (unint64_t)[*(id *)(a1 + 32) currentState] & 1);
  v3[9] = @"charging";
  v4[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ([*(id *)(a1 + 32) currentState] >> 3) & 1);
  v3[10] = @"screenOn";
  v4[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ([*(id *)(a1 + 32) currentState] >> 2) & 1);
  v3[11] = @"awake";
  v4[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ([*(id *)(a1 + 32) currentState] >> 1) & 1);
  v3[12] = @"lpm";
  v4[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ([*(id *)(a1 + 32) currentState] >> 4) & 1);
  v3[13] = @"lpmChanged";
  v4[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ((*(_DWORD *)(a1 + 96) ^ [*(id *)(a1 + 32) currentState]) >> 4) & 1);
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:14];
}

NSDictionary *sub_4314(uint64_t a1)
{
  id v2 = @"value";
  uint64_t v3 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  return +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
}

NSDictionary *sub_4398(uint64_t a1)
{
  v2[1] = @"duration";
  v3[0] = @"pluggedin_screen";
  v2[0] = @"state";
  v3[1] = +[NSNumber numberWithLong:*(void *)(a1 + 32)];
  return +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
}

NSDictionary *sub_4430(uint64_t a1)
{
  v2[1] = @"duration";
  v3[0] = @"unpluggedin_screen";
  v2[0] = @"state";
  v3[1] = +[NSNumber numberWithLong:*(void *)(a1 + 32)];
  return +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
}

NSDictionary *sub_4BE8(uint64_t a1)
{
  v4[0] = @"enable";
  v3[0] = @"status";
  v3[1] = @"batteryLevel";
  v1 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 32) + 40)];
  void v3[2] = @"counter";
  v4[1] = v1;
  v4[2] = &off_13C40;
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_4C98(uint64_t a1)
{
  v4[0] = @"disable";
  v3[0] = @"status";
  v3[1] = @"batteryLevel";
  v1 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 32) + 40)];
  void v3[2] = @"counter";
  v4[1] = v1;
  v4[2] = &off_13C40;
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_519C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = @"reason";
  uint64_t v4 = v1;
  return +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
}

NSDictionary *__cdecl sub_520C(id a1)
{
  return (NSDictionary *)&off_13CE0;
}

NSDictionary *sub_5580(uint64_t a1)
{
  v6[0] = @"rawMaxCapacity";
  [*(id *)(a1 + 32) rawMaxCapacity];
  v7[0] = +[NSNumber numberWithLongLong:(uint64_t)v2];
  v6[1] = @"designCapacity";
  v7[1] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [*(id *)(a1 + 32) designCapacity]);
  v6[2] = @"fullAvailableCapacity";
  [*(id *)(a1 + 32) fullAvailableCapacity];
  v7[2] = +[NSNumber numberWithLongLong:(uint64_t)v3];
  v6[3] = @"nominalChargeCapacity";
  [*(id *)(a1 + 32) nominalChargeCapacity];
  v7[3] = +[NSNumber numberWithLongLong:(uint64_t)v4];
  v6[4] = @"cycleCount";
  v7[4] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [*(id *)(a1 + 32) cycleCount]);
  return +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:5];
}

id sub_5754(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleDayChange];
}

void sub_5974(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void *PELLog()
{
  if (qword_13D10 != -1) {
    dispatch_once(&qword_13D10, &stru_104F8);
  }
  return off_13B50;
}

void sub_59D4(id a1)
{
  off_13B50 = os_log_create("com.apple.powerlog", "powerEventListenerDebug");
  if (!off_13B50)
  {
    off_13B50 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_AB70();
    }
  }
}

void sub_5A6C(id a1)
{
  byte_13D18 = MGGetBoolAnswer();
}

void sub_5B18(id a1)
{
  byte_13D30 = objc_msgSend(+[PLPowerEventListener valueForMobileGestaltCapability:](PLPowerEventListener, "valueForMobileGestaltCapability:", @"DeviceClass"), "isEqualToString:", @"iPhone");
}

void sub_5B98(id a1)
{
  unsigned int v1 = +[PLPowerEventListener isiPhone];
  if (v1) {
    LOBYTE(v1) = MGGetBoolAnswer();
  }
  byte_13D40 = v1;
}

void sub_5C14(id a1)
{
  CFBooleanRef v1 = (const __CFBoolean *)MGCopyAnswer();
  byte_13D50 = CFBooleanGetValue(v1) != 0;

  CFRelease(v1);
}

void sub_5CB0(id a1)
{
  CFBooleanRef v1 = (void *)MGCopyAnswer();
  if (v1)
  {
    double v2 = v1;
    byte_13D60 = [v1 isEqualToString:@"NonUI"];
    CFRelease(v2);
  }
  else
  {
    byte_13D60 = 1;
  }
}

void sub_5D68(id a1)
{
  CFBooleanRef v1 = (const __CFBoolean *)MGCopyAnswer();
  byte_13D70 = CFBooleanGetValue(v1) != 0;

  CFRelease(v1);
}

void sub_601C(os_unfair_lock_s *a1, uint64_t a2, int a3)
{
  BOOL v6 = a1 + 20;
  os_unfair_lock_lock(a1 + 20);
  if (a3 == -536723200)
  {
    uint64_t v8 = [[PLBatteryProperties alloc] initWithBatteryEntry:a2];
    [(os_unfair_lock_s *)a1 batteryStatusChanged:v8];
  }

  os_unfair_lock_unlock(v6);
}

void sub_60B4(void *a1, uint64_t a2, int a3, intptr_t a4)
{
  if (a3 == -536870288)
  {
    uint64_t v8 = +[NSNotificationCenter defaultCenter];
    uint64_t v9 = @"PLDeviceCanSleepNotification";
LABEL_6:
    [(NSNotificationCenter *)v8 postNotificationName:v9 object:a1];
    IOAllowPowerChange((io_connect_t)[a1 rootDomainConnect], a4);
    goto LABEL_8;
  }
  if (a3 != -536870144)
  {
    if (a3 != -536870272) {
      goto LABEL_8;
    }
    uint64_t v8 = +[NSNotificationCenter defaultCenter];
    uint64_t v9 = @"PLDeviceWillSleepNotification";
    goto LABEL_6;
  }
  [a1 systemPoweredOn];
LABEL_8:
}

void sub_6354(os_unfair_lock_s *a1, io_registry_entry_t a2, int a3)
{
  if (a3 == -536870608)
  {
    os_unfair_lock_lock(a1 + 20);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a2, @"IODisplayParameters", kCFAllocatorDefault, 0);
    id v8 = objc_msgSend(objc_msgSend(objc_msgSend(CFProperty, "objectForKeyedSubscript:", @"brightness"), "objectForKeyedSubscript:", @"value"), "intValue");
    [(os_unfair_lock_s *)a1 bucketize:v8];
    if (dword_13C24 != (int)v8 > 0)
    {
      uint64_t v9 = +[NSNotificationCenter defaultCenter];
      if ((int)v8 <= 0) {
        char v10 = @"PLDeviceBacklightOffNotification";
      }
      else {
        char v10 = @"PLDeviceBacklightOnNotification";
      }
      [(NSNotificationCenter *)v9 postNotificationName:v10 object:0];
      dword_13C24 = (int)v8 > 0;
    }

    os_unfair_lock_unlock(a1 + 20);
  }
}

void sub_65BC(uint64_t a1, uint64_t a2, uint64_t a3, os_unfair_lock_s *a4)
{
  v5 = a4 + 20;
  os_unfair_lock_lock(a4 + 20);
  if (dword_13C20 != (a3 != 0))
  {
    BOOL v6 = +[NSNotificationCenter defaultCenter];
    if (a3) {
      id v7 = @"PLDeviceBacklightOnNotification";
    }
    else {
      id v7 = @"PLDeviceBacklightOffNotification";
    }
    [(NSNotificationCenter *)v6 postNotificationName:v7 object:0];
    dword_13C20 = a3 != 0;
  }

  os_unfair_lock_unlock(v5);
}

dispatch_queue_t sub_6764(uint64_t a1)
{
  double v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t result = dispatch_queue_create(0, v2);
  *(void *)(*(void *)(a1 + 32) + 88) = result;
  return result;
}

uint64_t sub_67A8(uint64_t a1, int token)
{
  uint64_t v6 = 0;
  uint64_t result = notify_get_state(token, &v6);
  if (!result)
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v7[1] = @"value";
    v8[0] = v4;
    v7[0] = @"mode";
    v8[1] = +[NSNumber numberWithUnsignedLongLong:v6];
    return (uint64_t)objc_msgSend(v5, "LPMStatusChanged:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
  }
  return result;
}

NSDictionary *sub_7D4C(uint64_t a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  CFBooleanRef v1 = *(void **)(a1 + 40);
  v4[0] = *(void *)(a1 + 32);
  v4[1] = @"tcpBadFormat";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*v1 - **(void **)(a1 + 48)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_7E00(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpUnspecv6";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 8) - *(void *)(a1[6] + 8)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_7EB4(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpSynFin";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 16) - *(void *)(a1[6] + 16)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_7F68(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpBadFormatIPSec";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 24) - *(void *)(a1[6] + 24)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_801C(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpNoConnNoList";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 32) - *(void *)(a1[6] + 32)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_80D0(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpNoConnList";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 40) - *(void *)(a1[6] + 40)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_8184(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpListBadSyn";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 48) - *(void *)(a1[6] + 48)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_8238(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpICMP6Unreach";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 56) - *(void *)(a1[6] + 56)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_82EC(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpDeprecate6";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 64) - *(void *)(a1[6] + 64)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_83A0(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpRstInSynRcv";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 72) - *(void *)(a1[6] + 72)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_8454(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpOOOPkt";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 80) - *(void *)(a1[6] + 80)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_8508(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpDOSPkt";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 88) - *(void *)(a1[6] + 88)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_85BC(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpCleanup";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 96) - *(void *)(a1[6] + 96)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_8670(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tcpSynWindow";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 104) - *(void *)(a1[6] + 104)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_8724(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"udpPortUnreach";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 160) - *(void *)(a1[6] + 160)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_87D8(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"udpFaithPrefix";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 168) - *(void *)(a1[6] + 168)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_888C(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"udpPort0";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 176) - *(void *)(a1[6] + 176)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_8940(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"udpBadLength";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 184) - *(void *)(a1[6] + 184)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_89F4(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"tudpBadChksum";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 192) - *(void *)(a1[6] + 192)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_8AA8(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"udpBadMcast";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 200) - *(void *)(a1[6] + 200)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_8B5C(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"udpCleanup";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 208) - *(void *)(a1[6] + 208)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_8C10(void *a1)
{
  v3[0] = @"interface";
  v3[1] = @"packet";
  uint64_t v1 = a1[5];
  v4[0] = a1[4];
  v4[1] = @"udpBadIPSec";
  void v3[2] = @"value";
  v4[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(v1 + 216) - *(void *)(a1[6] + 216)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

uint64_t checkBucket(uint64_t result)
{
  if (result >= 0xC)
  {
    if (dword_13D88 > 99)
    {
      return 0;
    }
    else
    {
      NSLog(&cfstr_BucketizeBadBu.isa, result);
      uint64_t result = 0;
      ++dword_13D88;
    }
  }
  return result;
}

uint64_t makeBucket(int a1, int a2)
{
  if (a1 == -1) {
    LODWORD(v2) = a2;
  }
  else {
    LODWORD(v2) = 0;
  }
  if (!a1) {
    LODWORD(v2) = 0;
  }
  if (a1 < 1
    || (uint64_t v3 = 1717986919 * (100 * (a1 - minBright) / maxBright),
        unint64_t v2 = (v3 >> 34) + ((unint64_t)v3 >> 63) + 1,
        v2 < 0xC))
  {
    if (v2 == 11) {
      return 10;
    }
    else {
      return v2;
    }
  }
  else if (dword_13D88 > 99)
  {
    return 0;
  }
  else
  {
    NSLog(&cfstr_BucketizeBadBu.isa, v2);
    uint64_t result = 0;
    ++dword_13D88;
  }
  return result;
}

id sub_9368(uint64_t a1)
{
  if (qword_13D10 != -1) {
    dispatch_once(&qword_13D10, &stru_104F8);
  }
  unint64_t v2 = off_13B50;
  if (os_log_type_enabled((os_log_t)off_13B50, OS_LOG_TYPE_DEBUG)) {
    sub_ACE4(a1, v2);
  }
  uint64_t v4 = @"value";
  v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"), "backlightState"));
  return [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter") postNotificationName:@"PLAODModeNotification" object:*(void *)(a1 + 32) userInfo:+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1], @"PLAODModeNotification")];
}

void sub_9D44(id a1)
{
  uint64_t v1 = (const char *)kOSThermalNotificationName;
  global_queue = dispatch_get_global_queue(0, 0);

  notify_register_dispatch(v1, &dword_13E00, global_queue, &stru_10690);
}

void sub_9DA0(id a1, int a2)
{
  v2.n128_f64[0] = (double)(int)OSThermalNotificationCurrentLevel();

  _ADClientPushValueForDistributionKey(@"com.apple.springboard.thermalLevels", v2);
}

void sub_9E18(id a1)
{
  CFTypeRef v1 = IOPSCopyPowerSourcesInfo();
  if (v1)
  {
    __n128 v2 = v1;
    CFBooleanRef v3 = (const __CFBoolean *)IOPSPowerSourceSupported();
    byte_13E04 = CFBooleanGetValue(v3) != 0;
    CFRelease(v2);
  }
}

void PLEventModuleInitializer()
{
  if (!qword_13E10)
  {
    CFTypeRef v1 = [PLEventListener alloc];
    xpc_event_module_get_queue();
  }
}

void sub_A85C()
{
  int v0 = 136315394;
  CFTypeRef v1 = "com.apple.powerlog";
  __int16 v2 = 2080;
  CFBooleanRef v3 = "energyDebug";
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "err creating log for %s %s", (uint8_t *)&v0, 0x16u);
}

void sub_A8F8(os_log_t log)
{
  *(_WORD *)CFTypeRef v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "the screen state is not on, or off or AOD", v1, 2u);
}

void sub_A93C()
{
  sub_595C();
  sub_5974(&dword_0, v0, v1, "energyRaw:%.2f, unclamped:%.2f", v2, v3, v4, v5, v6);
}

uint64_t sub_A9A8()
{
  sub_595C();
  sub_5974(&dword_0, v0, v1, "energyAbsolute:%.2f, unclamped:%.2f", v2, v3, v4, v5, v7);
  if (qword_13D08 == -1) {
    return 1;
  }
  dispatch_once(&qword_13D08, &stru_10378);
  return 0;
}

uint64_t sub_AA44()
{
  sub_595C();
  sub_5974(&dword_0, v0, v1, "energy:%.2f, unclamped:%.2f", v2, v3, v4, v5, v7);
  if (qword_13D08 == -1) {
    return 1;
  }
  dispatch_once(&qword_13D08, &stru_10378);
  return 0;
}

uint64_t sub_AAE0(char a1, char a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1 & 1;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a2 & 1;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "isCharging:%d, isPlugged:%d", buf, 0xEu);
  if (qword_13D08 == -1) {
    return 1;
  }
  dispatch_once(&qword_13D08, &stru_10378);
  return 0;
}

void sub_AB70()
{
  int v0 = 136315394;
  uint64_t v1 = "com.apple.powerlog";
  __int16 v2 = 2080;
  uint64_t v3 = "powerEventListenerDebug";
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "err creating log for %s %s", (uint8_t *)&v0, 0x16u);
}

void sub_AC0C(NSObject *a1)
{
  v2[0] = 67109120;
  v2[1] = +[PLPowerEventListener hasDCP];
  _os_log_error_impl(&dword_0, a1, OS_LOG_TYPE_ERROR, "Failed to register for screen on/off notifications. hasDCP: %d", (uint8_t *)v2, 8u);
}

void sub_ACA0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error initializing IOMFB", v1, 2u);
}

void sub_ACE4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "screen state received by AOD is %ld", (uint8_t *)&v3, 0xCu);
}

uint64_t ADClientBatchKeys()
{
  return _ADClientBatchKeys();
}

uint64_t ADClientSetValueForScalarKey()
{
  return _ADClientSetValueForScalarKey();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return _BKSDisplayBrightnessGetCurrent();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

uint64_t IOMobileFramebufferDisablePowerNotifications()
{
  return _IOMobileFramebufferDisablePowerNotifications();
}

uint64_t IOMobileFramebufferEnablePowerNotifications()
{
  return _IOMobileFramebufferEnablePowerNotifications();
}

uint64_t IOMobileFramebufferGetMainDisplay()
{
  return _IOMobileFramebufferGetMainDisplay();
}

uint64_t IOMobileFramebufferGetRunLoopSource()
{
  return _IOMobileFramebufferGetRunLoopSource();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return _IOPSCopyPowerSourcesInfo();
}

uint64_t IOPSPowerSourceSupported()
{
  return _IOPSPowerSourceSupported();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return _OSThermalNotificationCurrentLevel();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

void freeifaddrs(ifaddrs *a1)
{
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
}

id objc_msgSend_AODNotificationQueue(void *a1, const char *a2, ...)
{
  return [a1 AODNotificationQueue];
}

id objc_msgSend_LPMNotificationQueue(void *a1, const char *a2, ...)
{
  return [a1 LPMNotificationQueue];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_adapterInfo(void *a1, const char *a2, ...)
{
  return [a1 adapterInfo];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_backlightLevel(void *a1, const char *a2, ...)
{
  return [a1 backlightLevel];
}

id objc_msgSend_backlightState(void *a1, const char *a2, ...)
{
  return [a1 backlightState];
}

id objc_msgSend_baseStates(void *a1, const char *a2, ...)
{
  return [a1 baseStates];
}

id objc_msgSend_batteryProperties(void *a1, const char *a2, ...)
{
  return [a1 batteryProperties];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_chargeAccum(void *a1, const char *a2, ...)
{
  return [a1 chargeAccum];
}

id objc_msgSend_compositeTime(void *a1, const char *a2, ...)
{
  return [a1 compositeTime];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAbsoluteCapacity(void *a1, const char *a2, ...)
{
  return [a1 currentAbsoluteCapacity];
}

id objc_msgSend_currentCapacity(void *a1, const char *a2, ...)
{
  return [a1 currentCapacity];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_cycleCount(void *a1, const char *a2, ...)
{
  return [a1 cycleCount];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_designCapacity(void *a1, const char *a2, ...)
{
  return [a1 designCapacity];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dod0(void *a1, const char *a2, ...)
{
  return [a1 dod0];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_energy(void *a1, const char *a2, ...)
{
  return [a1 energy];
}

id objc_msgSend_energyAbsolute(void *a1, const char *a2, ...)
{
  return [a1 energyAbsolute];
}

id objc_msgSend_energyAbsoluteNet(void *a1, const char *a2, ...)
{
  return [a1 energyAbsoluteNet];
}

id objc_msgSend_energyChargeAccumNet(void *a1, const char *a2, ...)
{
  return [a1 energyChargeAccumNet];
}

id objc_msgSend_energyPassedChargeNet(void *a1, const char *a2, ...)
{
  return [a1 energyPassedChargeNet];
}

id objc_msgSend_energyRaw(void *a1, const char *a2, ...)
{
  return [a1 energyRaw];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fullAvailableCapacity(void *a1, const char *a2, ...)
{
  return [a1 fullAvailableCapacity];
}

id objc_msgSend_fullyCharged(void *a1, const char *a2, ...)
{
  return [a1 fullyCharged];
}

id objc_msgSend_gasGaugeEnabled(void *a1, const char *a2, ...)
{
  return [a1 gasGaugeEnabled];
}

id objc_msgSend_getCurrentDisplayState(void *a1, const char *a2, ...)
{
  return [a1 getCurrentDisplayState];
}

id objc_msgSend_getCurrentLPMState(void *a1, const char *a2, ...)
{
  return [a1 getCurrentLPMState];
}

id objc_msgSend_hasAOD(void *a1, const char *a2, ...)
{
  return [a1 hasAOD];
}

id objc_msgSend_hasBaseband(void *a1, const char *a2, ...)
{
  return [a1 hasBaseband];
}

id objc_msgSend_hasDCP(void *a1, const char *a2, ...)
{
  return [a1 hasDCP];
}

id objc_msgSend_incrementCount(void *a1, const char *a2, ...)
{
  return [a1 incrementCount];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCharging(void *a1, const char *a2, ...)
{
  return [a1 isCharging];
}

id objc_msgSend_isLPMOn(void *a1, const char *a2, ...)
{
  return [a1 isLPMOn];
}

id objc_msgSend_isPlugged(void *a1, const char *a2, ...)
{
  return [a1 isPlugged];
}

id objc_msgSend_isPluggedIn(void *a1, const char *a2, ...)
{
  return [a1 isPluggedIn];
}

id objc_msgSend_isiPhone(void *a1, const char *a2, ...)
{
  return [a1 isiPhone];
}

id objc_msgSend_lastLPMStatus(void *a1, const char *a2, ...)
{
  return [a1 lastLPMStatus];
}

id objc_msgSend_logSupStats(void *a1, const char *a2, ...)
{
  return [a1 logSupStats];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_maxCapacity(void *a1, const char *a2, ...)
{
  return [a1 maxCapacity];
}

id objc_msgSend_nominalChargeCapacity(void *a1, const char *a2, ...)
{
  return [a1 nominalChargeCapacity];
}

id objc_msgSend_passedCharge(void *a1, const char *a2, ...)
{
  return [a1 passedCharge];
}

id objc_msgSend_queryBatteryStatsAtBoot(void *a1, const char *a2, ...)
{
  return [a1 queryBatteryStatsAtBoot];
}

id objc_msgSend_rawCapacity(void *a1, const char *a2, ...)
{
  return [a1 rawCapacity];
}

id objc_msgSend_rawCurrentCapacity(void *a1, const char *a2, ...)
{
  return [a1 rawCurrentCapacity];
}

id objc_msgSend_rawMaxCapacity(void *a1, const char *a2, ...)
{
  return [a1 rawMaxCapacity];
}

id objc_msgSend_registerForIOMFBNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForIOMFBNotifications];
}

id objc_msgSend_registerForThermalNotification(void *a1, const char *a2, ...)
{
  return [a1 registerForThermalNotification];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resetStats(void *a1, const char *a2, ...)
{
  return [a1 resetStats];
}

id objc_msgSend_rootDomainConnect(void *a1, const char *a2, ...)
{
  return [a1 rootDomainConnect];
}

id objc_msgSend_setupBacklightService(void *a1, const char *a2, ...)
{
  return [a1 setupBacklightService];
}

id objc_msgSend_sharedBacklight(void *a1, const char *a2, ...)
{
  return [a1 sharedBacklight];
}

id objc_msgSend_substateIndices(void *a1, const char *a2, ...)
{
  return [a1 substateIndices];
}

id objc_msgSend_supportsLPM(void *a1, const char *a2, ...)
{
  return [a1 supportsLPM];
}

id objc_msgSend_systemPoweredOn(void *a1, const char *a2, ...)
{
  return [a1 systemPoweredOn];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_voltage(void *a1, const char *a2, ...)
{
  return [a1 voltage];
}

id objc_msgSend_wakeReason(void *a1, const char *a2, ...)
{
  return [a1 wakeReason];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}