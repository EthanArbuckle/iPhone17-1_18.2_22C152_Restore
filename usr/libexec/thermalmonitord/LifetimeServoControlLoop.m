@interface LifetimeServoControlLoop
- (BOOL)loopIsActive;
- (LifetimeServoControlLoop)initWithParams:(id)a3 perfStateVoltages:(int *)a4 voltageCount:(int)a5 loopType:(int)a6 persistancePath:(__CFString *)a7 filer:(id)a8;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (float)accelerationFactorForTemperature:(int)a3 cpuPerfStateIndex:(int)a4;
- (int)defaultDieTempTarget;
- (int)dieTempTarget;
- (int)numberOfFields;
- (int)updateTempMax:(int)a3;
- (void)initSensorIndexSet:(id)a3;
- (void)initializeLifetimeServoStateAsPersisted;
- (void)overrideAFi:(int)a3;
- (void)overrideIS:(int)a3;
- (void)overrideInstantaneousAF:(float)a3;
- (void)processSleepInterval:(int64_t)a3;
- (void)updateDieTempTarget;
- (void)updateForPerfStateResidency:(float *)a3 count:(int)a4 tempMax:(int)a5 tempAverage:(int)a6;
- (void)updatePersistedState;
@end

@implementation LifetimeServoControlLoop

- (LifetimeServoControlLoop)initWithParams:(id)a3 perfStateVoltages:(int *)a4 voltageCount:(int)a5 loopType:(int)a6 persistancePath:(__CFString *)a7 filer:(id)a8
{
  v41.receivedouble r = self;
  v41.super_class = (Class)LifetimeServoControlLoop;
  v14 = [(LifetimeServoControlLoop *)&v41 init];
  v15 = v14;
  if (v14)
  {
    if (a3)
    {
      v14->_int loopType = a6;
      p_int loopType = &v14->_loopType;
      if (byte_1000AA7A0)
      {
        v16 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v43 = a6;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: init", buf, 8u);
        }
      }
      switch(a6)
      {
        case 0:
          v17 = off_100086218;
          CFStringRef v18 = &stru_100089390;
          goto LABEL_14;
        case 1:
          v17 = off_100086238;
          CFStringRef v18 = @"_E";
          goto LABEL_14;
        case 2:
          v17 = off_100086258;
          CFStringRef v18 = @"_P";
          goto LABEL_14;
        case 3:
          v17 = off_100086278;
          CFStringRef v18 = @"_G";
LABEL_14:
          v15->_persistenceKeyNames = (const void **)v17;
          v15->_tGraphHeaderSuffix = (__CFString *)v18;
          break;
        default:
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
            sub_10005B5A0();
          }
          break;
      }
      v15->_persistancePath = a7;
      v15->_filedouble r = (Filer *)a8;
      v15->_override_is = -1;
      v15->_override_af_i = -1;
      v15->_override_af_i_float = (float)-1;
      [objc_msgSend(a3, "valueForKey:", @"targetAF") floatValue];
      v15->_double r = v19;
      v15->_afLUT = -[LifetimeServoAFLUT initWithAFTableColumns:]([LifetimeServoAFLUT alloc], "initWithAFTableColumns:", [a3 valueForKey:@"AFLUT"]);
      v15->_is = 0;
      [objc_msgSend(a3, "valueForKey:", @"seed") floatValue];
      float v21 = v20;
      int64_t v22 = [(int)[objc_msgSend(a3, "valueForKey:", @"seed") intValue];
      v15->_is = v22;
      if (v21 != 0.0)
      {
        if (byte_1000AA7A0)
        {
          v23 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = *p_loopType;
            *(_DWORD *)buf = 67109376;
            int v43 = v24;
            __int16 v44 = 2048;
            *(void *)v45 = v22;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: seed %lld", buf, 0x12u);
          }
        }
        v15->_is = (int)vcvts_n_s32_f32(v21, 0xAuLL);
      }
      v15->_isUp = 0;
      v15->_isDown = 0;
      [(LifetimeServoControlLoop *)v15 initializeLifetimeServoStateAsPersisted];
      v15->_int Lmin = [[objc_msgSend(a3, "valueForKey:", @"targetLmin") intValue];
      v15->_int Lmax = [[a3 valueForKey:@"targetLmax"] intValue];
      [objc_msgSend(a3, "valueForKey:", @"ki") floatValue];
      LODWORD(v15->_ki_ls) = v25;
      if (byte_1000AA7A0)
      {
        float v26 = *(float *)&v25;
        v27 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          int loopType = v15->_loopType;
          double r = v15->_r;
          int Lmin = v15->_Lmin;
          int Lmax = v15->_Lmax;
          *(_DWORD *)buf = 67110144;
          int v43 = loopType;
          __int16 v44 = 2048;
          *(double *)v45 = r;
          *(_WORD *)&v45[8] = 1024;
          int v46 = Lmin;
          __int16 v47 = 1024;
          int v48 = Lmax;
          __int16 v49 = 2048;
          double v50 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: _r %f, _Lmin %d, _Lmax %d, _ki_ls %f", buf, 0x28u);
        }
      }
      if (v15->_Lmin >= v15->_Lmax && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005B534();
      }
      if (a5 <= 16)
      {
        if (a5 >= 1)
        {
          uint64_t v32 = 0;
          uint64_t v33 = a5;
          int v34 = byte_1000AA7A0;
          *(void *)&long long v25 = 67109632;
          long long v39 = v25;
          do
          {
            int v35 = a4[v32];
            v15->_perfStateVoltages[v32] = v35;
            if (v34)
            {
              v36 = qword_1000AABC0;
              if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
              {
                int v37 = *p_loopType;
                *(_DWORD *)buf = v39;
                int v43 = v37;
                __int16 v44 = 1024;
                *(_DWORD *)v45 = v32;
                *(_WORD *)&v45[4] = 1024;
                *(_DWORD *)&v45[6] = v35;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: state[%d] %d", buf, 0x14u);
                int v34 = byte_1000AA7A0;
              }
            }
            ++v32;
          }
          while (v33 != v32);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        sub_10005B4AC();
      }
      [(LifetimeServoControlLoop *)v15 updateDieTempTarget];
      [+[TGraphSampler sharedInstance] addtGraphDataSource:v15];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005B478();
      }
      return 0;
    }
  }
  return v15;
}

- (void)updateDieTempTarget
{
  float v2 = self->_ki_ls * (float)(100 * (self->_is / 1024));
  int Lmax = self->_Lmax;
  if (Lmax >= (int)(float)((float)Lmax + (float)(v2 * 5.0))) {
    int Lmax = (int)(float)((float)Lmax + (float)(v2 * 5.0));
  }
  if (self->_Lmin > Lmax) {
    int Lmax = self->_Lmin;
  }
  self->_u = Lmax;
}

- (int)dieTempTarget
{
  return self->_u;
}

- (int)defaultDieTempTarget
{
  return self->_Lmax;
}

- (void)initializeLifetimeServoStateAsPersisted
{
  int64_t v38 = 0;
  p_persistenceKeyNames = &self->_persistenceKeyNames;
  persistenceKeyNames = self->_persistenceKeyNames;
  filedouble r = self->_filer;
  CFStringRef v6 = (const __CFString *)persistenceKeyNames[3];
  if (filer)
  {
    if (![(Filer *)filer getValueForKey:v6])
    {
      [(LifetimeServoControlLoop *)self updatePersistedState];
      v7 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> LS State reset", buf, 2u);
      }
      [(Filer *)self->_filer setValue:&off_10008D3A0 forKey:*((void *)self->_persistenceKeyNames + 3)];
    }
    id v8 = [(Filer *)self->_filer getValueForKey:*self->_persistenceKeyNames];
    if (v8)
    {
      self->_int64_t is = (int64_t)[v8 unsignedLongLongValue];
      id v9 = [(Filer *)self->_filer getValueForKey:*((void *)self->_persistenceKeyNames + 1)];
      if (v9)
      {
        self->_int64_t isUp = (int64_t)[v9 unsignedLongLongValue];
        id v10 = [(Filer *)self->_filer getValueForKey:*((void *)self->_persistenceKeyNames + 2)];
        if (v10)
        {
          id v11 = [v10 unsignedLongLongValue];
          self->_isDown = (int64_t)v11;
          if (byte_1000AA7A0)
          {
            id v12 = v11;
            v13 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              int loopType = self->_loopType;
              v15 = self->_persistenceKeyNames;
              v16 = *v15;
              v17 = v15[1];
              int64_t is = self->_is;
              int64_t isUp = self->_isUp;
              float v20 = v15[2];
              *(_DWORD *)buf = 67110658;
              int v40 = loopType;
              __int16 v41 = 2112;
              v42 = v16;
              __int16 v43 = 2048;
              int64_t v44 = is;
              __int16 v45 = 2112;
              int v46 = v17;
              __int16 v47 = 2048;
              int64_t v48 = isUp;
              __int16 v49 = 2112;
              double v50 = v20;
              __int16 v51 = 2048;
              id v52 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: initializing %@ to %lld; initializing %@ to %lld; initializing %@ to %lld",
                buf,
                0x44u);
            }
          }
          return;
        }
        if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          return;
        }
      }
      else if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        return;
      }
    }
    else if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      return;
    }
    sub_10005B6E0();
    return;
  }
  CFPropertyListRef v21 = CFPreferencesCopyValue(v6, self->_persistancePath, @"root", kCFPreferencesCurrentHost);
  if (v21)
  {
    CFAllocatorRef v22 = kCFAllocatorDefault;
  }
  else
  {
    [(LifetimeServoControlLoop *)self updatePersistedState];
    v23 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "<Notice> LS State reset", buf, 2u);
    }
    buf[0] = 1;
    CFAllocatorRef v22 = kCFAllocatorDefault;
    CFNumberRef v24 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, buf);
    CFPreferencesSetValue(*((CFStringRef *)self->_persistenceKeyNames + 3), v24, self->_persistancePath, @"root", kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(self->_persistancePath);
    if (v24) {
      CFRelease(v24);
    }
  }
  CFArrayRef v25 = CFArrayCreate(v22, *p_persistenceKeyNames, 4, &kCFTypeArrayCallBacks);
  CFArrayRef v26 = v25;
  if (!v25)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005B608();
    }
LABEL_52:
    CFDictionaryRef v28 = 0;
    if (!v21) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  CFDictionaryRef v27 = CFPreferencesCopyMultiple(v25, self->_persistancePath, @"root", kCFPreferencesCurrentHost);
  if (!v27)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005B674();
    }
    goto LABEL_52;
  }
  CFDictionaryRef v28 = v27;
  if (sub_100008280(v27, (void *)**p_persistenceKeyNames, kCFNumberLongLongType, &v38))
  {
    if (byte_1000AA7A0)
    {
      v29 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = self->_loopType;
        v31 = *self->_persistenceKeyNames;
        *(_DWORD *)buf = 67109634;
        int v40 = v30;
        __int16 v41 = 2112;
        v42 = v31;
        __int16 v43 = 2048;
        int64_t v44 = v38;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: initializing %@ to %lld", buf, 0x1Cu);
      }
    }
    self->_int64_t is = v38;
  }
  if (sub_100008280(v28, (void *)(*p_persistenceKeyNames)[1], kCFNumberLongLongType, &v38))
  {
    if (byte_1000AA7A0)
    {
      uint64_t v32 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = self->_loopType;
        int v34 = (const void *)*((void *)self->_persistenceKeyNames + 1);
        *(_DWORD *)buf = 67109634;
        int v40 = v33;
        __int16 v41 = 2112;
        v42 = v34;
        __int16 v43 = 2048;
        int64_t v44 = v38;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: initializing %@ to %lld", buf, 0x1Cu);
      }
    }
    self->_int64_t isUp = v38;
  }
  if (sub_100008280(v28, (void *)(*p_persistenceKeyNames)[2], kCFNumberLongLongType, &v38))
  {
    if (byte_1000AA7A0)
    {
      int v35 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = self->_loopType;
        int v37 = (const void *)*((void *)self->_persistenceKeyNames + 2);
        *(_DWORD *)buf = 67109634;
        int v40 = v36;
        __int16 v41 = 2112;
        v42 = v37;
        __int16 v43 = 2048;
        int64_t v44 = v38;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: initializing %@ to %lld", buf, 0x1Cu);
      }
    }
    self->_isDown = v38;
  }
  if (!v21) {
    goto LABEL_37;
  }
LABEL_36:
  CFRelease(v21);
LABEL_37:
  if (v28) {
    CFRelease(v28);
  }
  if (v26) {
    CFRelease(v26);
  }
}

- (void)updatePersistedState
{
  filedouble r = self->_filer;
  if (filer)
  {
    [(Filer *)filer setValue:+[NSNumber numberWithUnsignedLongLong:self->_is] forKey:*self->_persistenceKeyNames];
    [(Filer *)self->_filer setValue:+[NSNumber numberWithUnsignedLongLong:self->_isUp] forKey:*((void *)self->_persistenceKeyNames + 1)];
    [(Filer *)self->_filer setValue:+[NSNumber numberWithUnsignedLongLong:self->_isDown] forKey:*((void *)self->_persistenceKeyNames + 2)];
    if (byte_1000AA7A0)
    {
      v4 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int loopType = self->_loopType;
        id v6 = [(Filer *)self->_filer copyDictionaryFromFile];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = loopType;
        LOWORD(v16) = 2112;
        *(void *)((char *)&v16 + 2) = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: persisting dictionary %@", buf, 0x12u);
      }
    }
    [(Filer *)self->_filer synchronizeToFile];
  }
  else
  {
    *(void *)buf = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &self->_is);
    *(void *)&long long v16 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &self->_isUp);
    *((void *)&v16 + 1) = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &self->_isDown);
    uint64_t v17 = 0;
    CFDictionaryRef v7 = CFDictionaryCreate(kCFAllocatorDefault, self->_persistenceKeyNames, (const void **)buf, 4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v7)
    {
      if (byte_1000AA7A0)
      {
        id v8 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = self->_loopType;
          v12[0] = 67109378;
          v12[1] = v9;
          __int16 v13 = 2112;
          CFDictionaryRef v14 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: persisting %@", (uint8_t *)v12, 0x12u);
        }
      }
      CFPreferencesSetMultiple(v7, 0, self->_persistancePath, @"root", kCFPreferencesCurrentHost);
      CFPreferencesAppSynchronize(self->_persistancePath);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005B748();
    }
    for (uint64_t i = 0; i != 32; i += 8)
    {
      id v11 = *(const void **)&buf[i];
      if (v11) {
        CFRelease(v11);
      }
    }
    if (v7) {
      CFRelease(v7);
    }
  }
}

- (int)updateTempMax:(int)a3
{
  sensorIndexSet = self->_sensorIndexSet;
  if (sensorIndexSet) {
    return sub_100009188(sensorIndexSet, (int *)&qword_1000AACCC, 0);
  }
  else {
    return a3;
  }
}

- (void)updateForPerfStateResidency:(float *)a3 count:(int)a4 tempMax:(int)a5 tempAverage:(int)a6
{
  uint64_t v7 = *(void *)&a5;
  self->_af_uint64_t i = 0.0;
  if (a4 < 1)
  {
    float v12 = 0.0;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = a4;
    float v12 = 0.0;
    do
    {
      float v13 = a3[v10];
      if (v13 > 0.0)
      {
        uint64_t v14 = v7;
        if (!v10)
        {
          if (self->_loopType == 3) {
            uint64_t v14 = v7;
          }
          else {
            uint64_t v14 = a6;
          }
        }
        [(LifetimeServoControlLoop *)self accelerationFactorForTemperature:v14 cpuPerfStateIndex:v10];
        float v12 = self->_af_i + (float)(v13 * v15);
        self->_af_uint64_t i = v12;
      }
      ++v10;
    }
    while (v11 != v10);
  }
  float override_af_i_float = self->_override_af_i_float;
  if (override_af_i_float != (float)-1)
  {
    self->_af_uint64_t i = override_af_i_float;
    float v12 = override_af_i_float;
  }
  float r = self->_r;
  uint64_t v18 = vcvts_n_s32_f32(r - v12, 0xAuLL);
  if (byte_1000AA7A0)
  {
    float v19 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134218752;
      *(void *)v29 = v18;
      *(_WORD *)&v29[8] = 2048;
      double v30 = r;
      *(_WORD *)v31 = 2048;
      *(double *)&v31[2] = v12;
      LOWORD(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 2) = 1024;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<Notice>  e_ls %lld  _r %f _af_i %f LifetimeServoControllerIntegratorScale %d", (uint8_t *)&v28, 0x26u);
    }
  }
  override_int64_t is = self->_override_is;
  if (override_is == -1) {
    self->_int64_t is = sub_100039754(self->_is, v18);
  }
  else {
    self->_int64_t is = override_is << 10;
  }
  if (v18 < 1) {
    self->_int64_t isDown = sub_100039754(self->_isDown, -v18);
  }
  else {
    self->_int64_t isUp = sub_100039754(self->_isUp, v18);
  }
  [(LifetimeServoControlLoop *)self updateDieTempTarget];
  if (byte_1000AA7A0)
  {
    CFPropertyListRef v21 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int loopType = self->_loopType;
      af_uint64_t i = self->_af_i;
      int64_t is = self->_is;
      int64_t isUp = self->_isUp;
      int64_t isDown = self->_isDown;
      int u = self->_u;
      int v28 = 67110912;
      *(_DWORD *)v29 = loopType;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v7;
      LOWORD(v30) = 1024;
      *(_DWORD *)((char *)&v30 + 2) = a6;
      HIWORD(v30) = 2048;
      *(double *)v31 = af_i;
      *(_WORD *)&v31[8] = 2048;
      int64_t v32 = is;
      __int16 v33 = 2048;
      int64_t v34 = isUp;
      __int16 v35 = 2048;
      int64_t v36 = isDown;
      __int16 v37 = 1024;
      int v38 = u;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: tempMax %d, tempAverage %d, AFi %f, LS-ris %lld (up %lld, down %lld), target %d", (uint8_t *)&v28, 0x42u);
    }
  }
}

- (float)accelerationFactorForTemperature:(int)a3 cpuPerfStateIndex:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = self->_perfStateVoltages[a4];
  if (!v6 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005B7B4();
  }
  [(LifetimeServoAFLUT *)self->_afLUT accelerationFactor:v4 voltage:v6];
  return result;
}

- (void)overrideIS:(int)a3
{
  self->_override_int64_t is = a3;
}

- (void)overrideAFi:(int)a3
{
  self->_override_af_uint64_t i = a3;
}

- (void)overrideInstantaneousAF:(float)a3
{
  self->_float override_af_i_float = a3;
}

- (BOOL)loopIsActive
{
  return self->_ki_ls > 0.0;
}

- (void)processSleepInterval:(int64_t)a3
{
  if (self->_override_is == -1)
  {
    float v5 = (float)((float)(self->_r * (float)a3) * 1024.0) / 5.0;
    uint64_t v6 = (uint64_t)v5;
    if ((uint64_t)v5 >= 1) {
      self->_int64_t is = sub_100039754(self->_is, (uint64_t)v5);
    }
    if (byte_1000AA7A0)
    {
      uint64_t v7 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int loopType = self->_loopType;
        v9[0] = 67109632;
        v9[1] = loopType;
        __int16 v10 = 2048;
        int64_t v11 = a3;
        __int16 v12 = 2048;
        uint64_t v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> LSControlLoop %d: delta %ld, is_sleep_adjustment %lld", (uint8_t *)v9, 0x1Cu);
      }
    }
  }
}

- (void)initSensorIndexSet:(id)a3
{
  self->_sensorIndexSet = (NSArray *)a3;
  float v5 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    int loopType = self->_loopType;
    v7[0] = 67109378;
    v7[1] = loopType;
    __int16 v8 = 2112;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> looptype %d sensorIndex %@", (uint8_t *)v7, 0x12u);
  }
}

- (int)numberOfFields
{
  return 5;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, *(&off_1000862E8 + a3), self->_tGraphHeaderSuffix);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  switch(a3)
  {
    case 0:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      int64_t is = self->_is;
      goto LABEL_6;
    case 1:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      int64_t is = self->_isUp;
      goto LABEL_6;
    case 2:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      int64_t is = self->_isDown;
LABEL_6:
      float result = (__CFString *)CFStringCreateWithFormat(v3, 0, @"%lld", is);
      break;
    case 3:
      float result = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%f", self->_af_i);
      break;
    case 4:
      float result = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", self->_u);
      break;
    default:
      float result = 0;
      break;
  }
  return result;
}

@end