@interface NotificationManager
- (BOOL)includeSolarInfo;
- (id)init:(int)a3 withSolarInfo:(BOOL)a4 withModeratePressureVersion:(int)a5;
- (int64_t)updateThermalPressureLevelNotification:(unint64_t)a3 shouldForceThermalPressure:(BOOL)a4;
- (void)dealloc;
- (void)sendRadioNotification:(unsigned __int8)a3;
- (void)setIncludeSolarInfo:(BOOL)a3;
- (void)setLightPressureOverride:(BOOL)a3;
- (void)setThermalPressureLevelNotification:(unint64_t)a3;
- (void)updateMaxValueToken:(unint64_t)a3;
- (void)updateNotifyTokens;
- (void)updateThermalMitigationNotification:(unsigned __int8)a3;
- (void)updateThermalNotification:(unint64_t)a3;
- (void)updatetimeToMitigateNotification:(unsigned __int8)a3 AndReasonCode:(unsigned __int8)a4;
@end

@implementation NotificationManager

- (id)init:(int)a3 withSolarInfo:(BOOL)a4 withModeratePressureVersion:(int)a5
{
  BOOL v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NotificationManager;
  v8 = [(NotificationManager *)&v22 init];
  v9 = v8;
  if (v8)
  {
    v8->pressureLevel_previous = 0;
    v8->totalSensors = a3 + 1;
    int v10 = a3 + 4;
    if (a3 < -4) {
      int v10 = a3 + 7;
    }
    v8->includeSolarInfo = v6;
    if (v6) {
      int v11 = 2;
    }
    else {
      int v11 = 1;
    }
    uint64_t v12 = (v11 + (v10 >> 2));
    v13 = (int *)malloc_type_malloc(4 * (int)v12, 0x100004052888210uLL);
    v9->listThermalSensorToken = v13;
    if (notify_register_check("com.apple.system.maxthermalsensorvalue", v13)
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005503C();
    }
    if ((int)v12 >= 2)
    {
      unint64_t v14 = 1;
      uint64_t v15 = 1;
      qmemcpy(v18, ".thermalSensorVacom.apple.system", sizeof(v18));
      do
      {
        *(_OWORD *)name = v18[1];
        *(_OWORD *)v24 = v18[0];
        strcpy(&v24[13], "rValues");
        if (v14 != 1 && v14 <= 0x63)
        {
          __sprintf_chk(v21, 0, 3uLL, "%d", v14);
          __strcat_chk();
        }
        if (notify_register_check(name, &v9->listThermalSensorToken[v15]))
        {
          v16 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
            sub_100054FFC(&buf, v20, v16);
          }
        }
        ++v14;
        ++v15;
      }
      while (v12 != v14);
    }
    if (notify_register_check(kOSThermalNotificationName, &v9->thermalStatusToken)
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054FC8();
    }
    if (notify_register_check(kOSThermalNotificationPressureLevelName, &v9->thermalPressureLevelToken)
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054F94();
    }
    if (notify_register_check("com.apple.thermal.timeToMitigate", &v9->timeToMitigateToken)
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054F60();
    }
    if (notify_register_check("com.apple.thermal.mitigationReasonCode", &v9->mitigationReasonCodeToken)
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054F2C();
    }
    if (notify_register_check("com.apple.system.thermalmitigation", &v9->thermalMitigationToken)
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054EF8();
    }
    if (notify_register_check("com.apple.cltm.radioNotification", &v9->radioNotificationToken)
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054EC4();
    }
    if (notify_set_state(v9->thermalPressureLevelToken, 0)
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054E90();
    }
    if (notify_post(kOSThermalNotificationPressureLevelName)
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054E5C();
    }
    [(NotificationManager *)v9 updateThermalNotification:0];
    [(NotificationManager *)v9 updatetimeToMitigateNotification:0 AndReasonCode:0];
    v9->moderatePressureVersion = a5;
  }
  return v9;
}

- (void)dealloc
{
  listThermalSensorToken = self->listThermalSensorToken;
  if (listThermalSensorToken) {
    free(listThermalSensorToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)NotificationManager;
  [(NotificationManager *)&v4 dealloc];
}

- (void)updateMaxValueToken:(unint64_t)a3
{
  if (notify_set_state(*self->listThermalSensorToken, a3))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100055070();
    }
  }
}

- (void)updateNotifyTokens
{
  if ([(NotificationManager *)self includeSolarInfo])
  {
    uint64_t v3 = (void)[+[ContextAwareThermalManager sharedInstance] getContextState:0] << 48;
    int v4 = 1;
  }
  else
  {
    int v4 = 0;
    uint64_t v3 = 0;
  }
  int totalSensors = self->totalSensors;
  if (totalSensors >= 1)
  {
    uint64_t v6 = 0;
    int v7 = 1;
    do
    {
      *((void *)&v8 + 1) = *((unsigned int *)&qword_1000AACCC + v6);
      *(void *)&long long v8 = v3;
      uint64_t v3 = v8 >> 16;
      ++v4;
      uint64_t v9 = (totalSensors - 1);
      if ((v4 & 3) == 0 || v6 == v9)
      {
        if ((v4 & 3) != 0 && v6 == v9)
        {
          do
          {
            v3 >>= 16;
            ++v4;
          }
          while ((v4 & 3) != 0);
        }
        if (notify_set_state(self->listThermalSensorToken[v7], v3))
        {
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
            sub_1000550A4();
          }
          return;
        }
        uint64_t v3 = 0;
        ++v7;
        int totalSensors = self->totalSensors;
      }
      ++v6;
    }
    while (v6 < totalSensors);
  }
}

- (void)updateThermalNotification:(unint64_t)a3
{
  if (notify_set_state(self->thermalStatusToken, a3))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005510C();
    }
  }
  else if (notify_post(kOSThermalNotificationName) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_1000550D8();
  }
}

- (void)sendRadioNotification:(unsigned __int8)a3
{
  if (notify_set_state(self->radioNotificationToken, a3)
    && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_100055174();
  }
  if (notify_post("com.apple.cltm.radioNotification"))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100055140();
    }
  }
}

- (int64_t)updateThermalPressureLevelNotification:(unint64_t)a3 shouldForceThermalPressure:(BOOL)a4
{
  uint64_t v6 = 50;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
      goto LABEL_8;
    case 4uLL:
      if (self->moderatePressureVersion == 1) {
        goto LABEL_10;
      }
LABEL_8:
      if (self->moderatePressureVersion)
      {
LABEL_9:
        BOOL v7 = self->pressureLevel_previous > 0xA;
        uint64_t v8 = 10;
        uint64_t v9 = 20;
LABEL_15:
        if (v7) {
          uint64_t v6 = v9;
        }
        else {
          uint64_t v6 = v8;
        }
      }
      else
      {
LABEL_10:
        if (self->pressureLevel_previous) {
          uint64_t v6 = 20;
        }
        else {
          uint64_t v6 = 10;
        }
      }
LABEL_18:
      if (v6 == self->pressureLevel_previous || byte_1000A2510 == 0) {
        goto LABEL_23;
      }
      if (notify_set_state(self->thermalPressureLevelToken, v6))
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100054E90();
        }
        return -1;
      }
      uint32_t v11 = notify_post(kOSThermalNotificationPressureLevelName);
      uint64_t v12 = qword_1000AABC0;
      if (v11)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100054E5C();
        }
        return -1;
      }
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134218240;
        uint64_t v15 = v6;
        __int16 v16 = 2048;
        unint64_t v17 = a3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> Thermal pressure level %llu thermal level %llu", (uint8_t *)&v14, 0x16u);
      }
LABEL_23:
      kdebug_trace();
      self->pressureLevel_previous = v6;
      return v6;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      BOOL v7 = self->pressureLevel_previous > 0x14;
      uint64_t v8 = 20;
      uint64_t v9 = 30;
      goto LABEL_15;
    case 0xAuLL:
      uint64_t v6 = 30;
      goto LABEL_18;
    case 0xBuLL:
      BOOL v7 = self->pressureLevel_previous > 0x1E;
      uint64_t v8 = 30;
      uint64_t v9 = 40;
      goto LABEL_15;
    case 0xCuLL:
      uint64_t v6 = 40;
      goto LABEL_18;
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      BOOL v7 = self->pressureLevel_previous > 0x28;
      uint64_t v8 = 40;
      uint64_t v9 = 50;
      goto LABEL_15;
    case 0x10uLL:
      goto LABEL_18;
    default:
      if (a4 || self->lightPressureOverride)
      {
        uint64_t v6 = 10;
      }
      else if (self->pressureLevel_previous <= 0xA)
      {
        uint64_t v6 = 0;
      }
      else
      {
        uint64_t v6 = 10;
      }
      goto LABEL_18;
  }
}

- (void)setThermalPressureLevelNotification:(unint64_t)a3
{
  if (self->pressureLevel_previous == a3 || byte_1000A2510 == 0)
  {
LABEL_6:
    kdebug_trace();
    return;
  }
  if (notify_set_state(self->thermalPressureLevelToken, a3))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100054E90();
    }
    return;
  }
  uint32_t v6 = notify_post(kOSThermalNotificationPressureLevelName);
  BOOL v7 = qword_1000AABC0;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      unint64_t v9 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Thermal pressure level %llu", (uint8_t *)&v8, 0xCu);
    }
    self->pressureLevel_previous = a3;
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100054E5C();
  }
}

- (void)setLightPressureOverride:(BOOL)a3
{
  self->lightPressureOverride = a3;
}

- (void)updatetimeToMitigateNotification:(unsigned __int8)a3 AndReasonCode:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  if (notify_set_state(self->timeToMitigateToken, a3)
    && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_100055244();
  }
  if (notify_post("com.apple.thermal.timeToMitigate")
    && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_100055210();
  }
  if (notify_set_state(self->mitigationReasonCodeToken, v4)
    && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_1000551DC();
  }
  if (notify_post("com.apple.thermal.mitigationReasonCode"))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_1000551A8();
    }
  }
}

- (void)updateThermalMitigationNotification:(unsigned __int8)a3
{
  if (notify_set_state(self->thermalMitigationToken, a3)
    && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_1000552AC();
  }
  if (notify_post("com.apple.system.thermalmitigation"))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100055278();
    }
  }
}

- (BOOL)includeSolarInfo
{
  return self->includeSolarInfo;
}

- (void)setIncludeSolarInfo:(BOOL)a3
{
  self->includeSolarInfo = a3;
}

@end