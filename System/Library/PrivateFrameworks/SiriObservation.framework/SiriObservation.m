id MTTimerManagerTimersKeyFunction()
{
  return (id)constantMTTimerManagerTimersKey;
}

id initMTTimer()
{
  if (initMTTimer_sOnce != -1) {
    dispatch_once(&initMTTimer_sOnce, &__block_literal_global_66);
  }
  v0 = (void *)classMTTimer;
  return v0;
}

id SOClockAlarmCreateFromMTAlarm(void *a1)
{
  id v1 = a1;
  v2 = [v1 alarmID];
  if (v2)
  {
    v3 = [v1 sound];
    v4 = [v3 toneIdentifier];

    if (!v4) {
      goto LABEL_5;
    }
    v5 = [getTLToneManagerClass() sharedToneManager];
    v6 = [v1 sound];
    v7 = [v6 toneIdentifier];
    char v8 = [v5 _hasUnderlyingPlaybackArchiveForToneIdentifier:v7];

    if (v8) {
      uint64_t v9 = 1;
    }
    else {
LABEL_5:
    }
      uint64_t v9 = 0;
    v10 = (void *)MEMORY[0x263F28470];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __SOClockAlarmCreateFromMTAlarm_block_invoke;
    v13[3] = &unk_264486950;
    id v14 = v2;
    id v15 = v1;
    uint64_t v16 = v9;
    v11 = (void *)[v10 newWithBuilder:v13];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __SOClockAlarmCreateFromMTAlarm_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAlarmID:v3];
  v5 = [*(id *)(a1 + 40) alarmURL];
  [v4 setAlarmURL:v5];

  objc_msgSend(v4, "setIsFiring:", objc_msgSend(*(id *)(a1 + 40), "isFiring"));
  v6 = [*(id *)(a1 + 40) title];
  [v4 setTitle:v6];

  [v4 setType:*(void *)(a1 + 48)];
  objc_msgSend(v4, "setHour:", objc_msgSend(*(id *)(a1 + 40), "hour"));
  objc_msgSend(v4, "setMinute:", objc_msgSend(*(id *)(a1 + 40), "minute"));
  objc_msgSend(v4, "setRepeatOptions:", objc_msgSend(*(id *)(a1 + 40), "repeatSchedule") & 0x7F);
  objc_msgSend(v4, "setIsEnabled:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"));
  objc_msgSend(v4, "setIsSnoozed:", objc_msgSend(*(id *)(a1 + 40), "isSnoozed"));
  v7 = [*(id *)(a1 + 40) firedDate];
  [v4 setFiredDate:v7];

  char v8 = [*(id *)(a1 + 40) dismissedDate];
  [v4 setDismissedDate:v8];

  id v9 = [*(id *)(a1 + 40) lastModifiedDate];
  [v4 setLastModifiedDate:v9];
}

id initTLToneManager()
{
  if (initTLToneManager_sOnce != -1) {
    dispatch_once(&initTLToneManager_sOnce, &__block_literal_global);
  }
  v0 = (void *)classTLToneManager;
  return v0;
}

Class __initTLToneManager_block_invoke()
{
  if (ToneLibraryLibrary_sOnce != -1) {
    dispatch_once(&ToneLibraryLibrary_sOnce, &__block_literal_global_5);
  }
  Class result = objc_getClass("TLToneManager");
  classTLToneManager = (uint64_t)result;
  getTLToneManagerClass = (uint64_t (*)())TLToneManagerFunction;
  return result;
}

id TLToneManagerFunction()
{
  return (id)classTLToneManager;
}

void *__ToneLibraryLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/ToneLibrary.framework/ToneLibrary", 2);
  ToneLibraryLibrary_sLib = (uint64_t)result;
  return result;
}

id SOClockAlarmCreateFromMTAlarms(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v2];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = SOClockAlarmCreateFromMTAlarm(*(void **)(*((void *)&v12 + 1) + 8 * i));
          if (v9) {
            objc_msgSend(v3, "addObject:", v9, (void)v12);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    if ([v3 count]) {
      v10 = (void *)[v3 copy];
    }
    else {
      v10 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

void sub_21DE55EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DE56960(_Unwind_Exception *a1)
{
  objc_destroyWeak(v8);
  objc_destroyWeak(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v9 - 128));
  _Unwind_Resume(a1);
}

id _SOClockAlarmObserverGetAlarmIDsFromAlarms(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v2];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "alarmID", (void)v12);
          if (v9) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    if ([v3 count]) {
      v10 = (void *)[v3 copy];
    }
    else {
      v10 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

uint64_t SOClockTimerGetTimerStateFromMTTimer(void *a1)
{
  uint64_t result = [a1 state];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

id SOClockTimerCreateFromMTTimer(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 timerID];
  if (v2)
  {
    uint64_t v3 = [v1 state];
    id v4 = (void *)MEMORY[0x263F28488];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __SOClockTimerCreateFromMTTimer_block_invoke;
    v7[3] = &unk_264486A40;
    id v8 = v2;
    id v9 = v1;
    uint64_t v10 = v3;
    uint64_t v5 = (void *)[v4 newWithBuilder:v7];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __SOClockTimerCreateFromMTTimer_block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  [v14 setTimerID:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 40) timerURL];
  [v14 setTimerURL:v3];

  objc_msgSend(v14, "setIsFiring:", objc_msgSend(*(id *)(a1 + 40), "isFiring"));
  id v4 = [*(id *)(a1 + 40) title];
  [v14 setTitle:v4];

  if ((unint64_t)(*(void *)(a1 + 48) - 1) >= 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(a1 + 48);
  }
  [v14 setState:v5];
  [*(id *)(a1 + 40) duration];
  objc_msgSend(v14, "setDuration:");
  uint64_t v6 = *(void *)(a1 + 48);
  if ((unint64_t)(v6 - 1) <= 1)
  {
    [*(id *)(a1 + 40) remainingTime];
    objc_msgSend(v14, "setFireTimeInterval:");
    uint64_t v6 = *(void *)(a1 + 48);
  }
  if (v6 == 3)
  {
    uint64_t v7 = [*(id *)(a1 + 40) fireDate];
    [v14 setFireDate:v7];
  }
  id v8 = [*(id *)(a1 + 40) siriContext];
  id v9 = [v8 objectForKeyedSubscript:@"MTTimerIntentSupportSiriContextTimerTypeKey"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v10 = [v9 integerValue];
  }
  else {
    uint64_t v10 = 1;
  }

  [v14 setType:v10];
  v11 = [*(id *)(a1 + 40) firedDate];
  [v14 setFiredDate:v11];

  long long v12 = [*(id *)(a1 + 40) dismissedDate];
  [v14 setDismissedDate:v12];

  long long v13 = [*(id *)(a1 + 40) lastModifiedDate];
  [v14 setLastModifiedDate:v13];
}

id SOClockTimerCreateFromMTTimers(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v2];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = SOClockTimerCreateFromMTTimer(*(void **)(*((void *)&v12 + 1) + 8 * i));
          if (v9) {
            objc_msgSend(v3, "addObject:", v9, (void)v12);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    if ([v3 count]) {
      uint64_t v10 = (void *)[v3 copy];
    }
    else {
      uint64_t v10 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

uint64_t SOAlarmRepeatScheduleValidate(char a1)
{
  return a1 & 0x7F;
}

id SOAlarmRepeatScheduleGetNames(uint64_t a1)
{
  if (a1)
  {
    char v1 = a1;
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v3 = v2;
    if (v1)
    {
      [v2 addObject:@"monday"];
      if ((v1 & 2) == 0)
      {
LABEL_4:
        if ((v1 & 4) == 0) {
          goto LABEL_5;
        }
        goto LABEL_17;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_4;
    }
    [v3 addObject:@"tuesday"];
    if ((v1 & 4) == 0)
    {
LABEL_5:
      if ((v1 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
LABEL_17:
    [v3 addObject:@"wednesday"];
    if ((v1 & 8) == 0)
    {
LABEL_6:
      if ((v1 & 0x10) == 0) {
        goto LABEL_7;
      }
      goto LABEL_19;
    }
LABEL_18:
    [v3 addObject:@"thursday"];
    if ((v1 & 0x10) == 0)
    {
LABEL_7:
      if ((v1 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
LABEL_19:
    [v3 addObject:@"friday"];
    if ((v1 & 0x20) == 0)
    {
LABEL_8:
      if ((v1 & 0x40) == 0)
      {
LABEL_10:
        id v4 = (void *)[v3 copy];

        goto LABEL_12;
      }
LABEL_9:
      [v3 addObject:@"sunday"];
      goto LABEL_10;
    }
LABEL_20:
    [v3 addObject:@"saturday"];
    if ((v1 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v4 = (void *)MEMORY[0x263EFFA68];
LABEL_12:
  return v4;
}

uint64_t SOAlarmRepeatScheduleGetFromNames(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v12 = v1;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)v14;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v2);
          }
          id v8 = *(id *)(*((void *)&v13 + 1) + 8 * v7);
          if ([v8 length])
          {
            if (_SOAlarmRepeatScheduleGetFromName_onceToken != -1) {
              dispatch_once(&_SOAlarmRepeatScheduleGetFromName_onceToken, &__block_literal_global_34);
            }
            id v9 = [(id)_SOAlarmRepeatScheduleGetFromName_map objectForKey:v8];
            uint64_t v10 = [v9 unsignedIntegerValue];
          }
          else
          {
            uint64_t v10 = 0;
          }

          v5 |= v10;
          ++v7;
        }
        while (v4 != v7);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = 0;
    }

    id v1 = v12;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id initMTAlarmManagerAlarmsChanged()
{
  if (initMTAlarmManagerAlarmsChanged_sOnce != -1) {
    dispatch_once(&initMTAlarmManagerAlarmsChanged_sOnce, &__block_literal_global_56);
  }
  v0 = (void *)constantMTAlarmManagerAlarmsChanged;
  return v0;
}

void __initMTAlarmManagerAlarmsChanged_block_invoke()
{
  if (MobileTimerLibrary_sOnce != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_32);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmsChanged");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsChanged, *v0);
  }
  getMTAlarmManagerAlarmsChanged = (uint64_t)MTAlarmManagerAlarmsChangedFunction;
}

id MTAlarmManagerAlarmsChangedFunction()
{
  return (id)constantMTAlarmManagerAlarmsChanged;
}

void *__MobileTimerLibrary_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/MobileTimer.framework/MobileTimer", 2);
  MobileTimerLibrary_sLib = (uint64_t)result;
  return result;
}

id initMTAlarmManagerStateReset()
{
  if (initMTAlarmManagerStateReset_sOnce != -1) {
    dispatch_once(&initMTAlarmManagerStateReset_sOnce, &__block_literal_global_53);
  }
  v0 = (void *)constantMTAlarmManagerStateReset;
  return v0;
}

void __initMTAlarmManagerStateReset_block_invoke()
{
  if (MobileTimerLibrary_sOnce != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_32);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerStateReset");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerStateReset, *v0);
  }
  getMTAlarmManagerStateReset = (uint64_t)MTAlarmManagerStateResetFunction;
}

id MTAlarmManagerStateResetFunction()
{
  return (id)constantMTAlarmManagerStateReset;
}

id initMTAlarmManagerFiringAlarmChanged()
{
  if (initMTAlarmManagerFiringAlarmChanged_sOnce != -1) {
    dispatch_once(&initMTAlarmManagerFiringAlarmChanged_sOnce, &__block_literal_global_50);
  }
  v0 = (void *)constantMTAlarmManagerFiringAlarmChanged;
  return v0;
}

void __initMTAlarmManagerFiringAlarmChanged_block_invoke()
{
  if (MobileTimerLibrary_sOnce != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_32);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerFiringAlarmChanged");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerFiringAlarmChanged, *v0);
  }
  getMTAlarmManagerFiringAlarmChanged = (uint64_t)MTAlarmManagerFiringAlarmChangedFunction;
}

id MTAlarmManagerFiringAlarmChangedFunction()
{
  return (id)constantMTAlarmManagerFiringAlarmChanged;
}

id initMTAlarmManagerFiringAlarmDismissed()
{
  if (initMTAlarmManagerFiringAlarmDismissed_sOnce != -1) {
    dispatch_once(&initMTAlarmManagerFiringAlarmDismissed_sOnce, &__block_literal_global_47);
  }
  v0 = (void *)constantMTAlarmManagerFiringAlarmDismissed;
  return v0;
}

void __initMTAlarmManagerFiringAlarmDismissed_block_invoke()
{
  if (MobileTimerLibrary_sOnce != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_32);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerFiringAlarmDismissed");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerFiringAlarmDismissed, *v0);
  }
  getMTAlarmManagerFiringAlarmDismissed = (uint64_t)MTAlarmManagerFiringAlarmDismissedFunction;
}

id MTAlarmManagerFiringAlarmDismissedFunction()
{
  return (id)constantMTAlarmManagerFiringAlarmDismissed;
}

id initMTAlarmManagerAlarmFired()
{
  if (initMTAlarmManagerAlarmFired_sOnce != -1) {
    dispatch_once(&initMTAlarmManagerAlarmFired_sOnce, &__block_literal_global_44);
  }
  v0 = (void *)constantMTAlarmManagerAlarmFired;
  return v0;
}

void __initMTAlarmManagerAlarmFired_block_invoke()
{
  if (MobileTimerLibrary_sOnce != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_32);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmFired");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmFired, *v0);
  }
  getMTAlarmManagerAlarmFired = (uint64_t)MTAlarmManagerAlarmFiredFunction;
}

id MTAlarmManagerAlarmFiredFunction()
{
  return (id)constantMTAlarmManagerAlarmFired;
}

id initMTAlarmManagerAlarmsRemoved()
{
  if (initMTAlarmManagerAlarmsRemoved_sOnce != -1) {
    dispatch_once(&initMTAlarmManagerAlarmsRemoved_sOnce, &__block_literal_global_41);
  }
  v0 = (void *)constantMTAlarmManagerAlarmsRemoved;
  return v0;
}

void __initMTAlarmManagerAlarmsRemoved_block_invoke()
{
  if (MobileTimerLibrary_sOnce != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_32);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmsRemoved");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsRemoved, *v0);
  }
  getMTAlarmManagerAlarmsRemoved = (uint64_t)MTAlarmManagerAlarmsRemovedFunction;
}

id MTAlarmManagerAlarmsRemovedFunction()
{
  return (id)constantMTAlarmManagerAlarmsRemoved;
}

id initMTAlarmManagerAlarmsUpdated()
{
  if (initMTAlarmManagerAlarmsUpdated_sOnce != -1) {
    dispatch_once(&initMTAlarmManagerAlarmsUpdated_sOnce, &__block_literal_global_38);
  }
  v0 = (void *)constantMTAlarmManagerAlarmsUpdated;
  return v0;
}

void __initMTAlarmManagerAlarmsUpdated_block_invoke()
{
  if (MobileTimerLibrary_sOnce != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_32);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmsUpdated");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsUpdated, *v0);
  }
  getMTAlarmManagerAlarmsUpdated = (uint64_t)MTAlarmManagerAlarmsUpdatedFunction;
}

id MTAlarmManagerAlarmsUpdatedFunction()
{
  return (id)constantMTAlarmManagerAlarmsUpdated;
}

id initMTAlarmManagerAlarmsAdded()
{
  if (initMTAlarmManagerAlarmsAdded_sOnce != -1) {
    dispatch_once(&initMTAlarmManagerAlarmsAdded_sOnce, &__block_literal_global_35);
  }
  v0 = (void *)constantMTAlarmManagerAlarmsAdded;
  return v0;
}

void __initMTAlarmManagerAlarmsAdded_block_invoke()
{
  if (MobileTimerLibrary_sOnce != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_32);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmsAdded");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsAdded, *v0);
  }
  getMTAlarmManagerAlarmsAdded = (uint64_t)MTAlarmManagerAlarmsAddedFunction;
}

id MTAlarmManagerAlarmsAddedFunction()
{
  return (id)constantMTAlarmManagerAlarmsAdded;
}

id initMTAlarm()
{
  if (initMTAlarm_sOnce != -1) {
    dispatch_once(&initMTAlarm_sOnce, &__block_literal_global_65);
  }
  v0 = (void *)classMTAlarm;
  return v0;
}

Class __initMTAlarm_block_invoke()
{
  if (MobileTimerLibrary_sOnce != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_32);
  }
  Class result = objc_getClass("MTAlarm");
  classMTAlarm = (uint64_t)result;
  getMTAlarmClass = MTAlarmFunction;
  return result;
}

id MTAlarmFunction()
{
  return (id)classMTAlarm;
}

id initMTAlarmManagerAlarmsKey()
{
  if (initMTAlarmManagerAlarmsKey_sOnce != -1) {
    dispatch_once(&initMTAlarmManagerAlarmsKey_sOnce, &__block_literal_global_62);
  }
  v0 = (void *)constantMTAlarmManagerAlarmsKey;
  return v0;
}

void __initMTAlarmManagerAlarmsKey_block_invoke()
{
  if (MobileTimerLibrary_sOnce != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_32);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmsKey");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsKey, *v0);
  }
  getMTAlarmManagerAlarmsKey = MTAlarmManagerAlarmsKeyFunction;
}

id MTAlarmManagerAlarmsKeyFunction()
{
  return (id)constantMTAlarmManagerAlarmsKey;
}

id initMTAlarmManager()
{
  if (initMTAlarmManager_sOnce != -1) {
    dispatch_once(&initMTAlarmManager_sOnce, &__block_literal_global_64);
  }
  v0 = (void *)classMTAlarmManager;
  return v0;
}

Class __initMTAlarmManager_block_invoke()
{
  if (MobileTimerLibrary_sOnce != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_32);
  }
  Class result = objc_getClass("MTAlarmManager");
  classMTAlarmManager = (uint64_t)result;
  getMTAlarmManagerClass = MTAlarmManagerFunction;
  return result;
}

id MTAlarmManagerFunction()
{
  return (id)classMTAlarmManager;
}

BOOL SOTimerTypeGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SOTimerTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *SOTimerTypeGetName(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_264486AC8[a1];
  }
}

uint64_t SOTimerTypeGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SOTimerTypeGetFromName_onceToken != -1) {
      dispatch_once(&SOTimerTypeGetFromName_onceToken, &__block_literal_global_83);
    }
    id v2 = [(id)SOTimerTypeGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SOTimerTypeGetFromName_block_invoke()
{
  v0 = (void *)SOTimerTypeGetFromName_map;
  SOTimerTypeGetFromName_map = (uint64_t)&unk_26CEC61F0;
}

id initMTAlarmManagerStateReset_135()
{
  if (initMTAlarmManagerStateReset_sOnce_136 != -1) {
    dispatch_once(&initMTAlarmManagerStateReset_sOnce_136, &__block_literal_global_83_137);
  }
  v0 = (void *)constantMTAlarmManagerStateReset_138;
  return v0;
}

void __initMTAlarmManagerStateReset_block_invoke_140()
{
  if (MobileTimerLibrary_sOnce_141 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_141, &__block_literal_global_62_142);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_143, "MTAlarmManagerStateReset");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerStateReset_138, *v0);
  }
  getMTAlarmManagerStateReset_133 = MTAlarmManagerStateResetFunction_145;
}

id MTAlarmManagerStateResetFunction_145()
{
  return (id)constantMTAlarmManagerStateReset_138;
}

void *__MobileTimerLibrary_block_invoke_148()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/MobileTimer.framework/MobileTimer", 2);
  MobileTimerLibrary_sLib_143 = (uint64_t)result;
  return result;
}

id initMTAlarmManagerFiringAlarmDismissed_151()
{
  if (initMTAlarmManagerFiringAlarmDismissed_sOnce_152 != -1) {
    dispatch_once(&initMTAlarmManagerFiringAlarmDismissed_sOnce_152, &__block_literal_global_80);
  }
  v0 = (void *)constantMTAlarmManagerFiringAlarmDismissed_153;
  return v0;
}

void __initMTAlarmManagerFiringAlarmDismissed_block_invoke_155()
{
  if (MobileTimerLibrary_sOnce_141 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_141, &__block_literal_global_62_142);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_143, "MTAlarmManagerFiringAlarmDismissed");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerFiringAlarmDismissed_153, *v0);
  }
  getMTAlarmManagerFiringAlarmDismissed_132 = MTAlarmManagerFiringAlarmDismissedFunction_157;
}

id MTAlarmManagerFiringAlarmDismissedFunction_157()
{
  return (id)constantMTAlarmManagerFiringAlarmDismissed_153;
}

id initMTAlarmManagerFiringAlarmChanged_159()
{
  if (initMTAlarmManagerFiringAlarmChanged_sOnce_160 != -1) {
    dispatch_once(&initMTAlarmManagerFiringAlarmChanged_sOnce_160, &__block_literal_global_77);
  }
  v0 = (void *)constantMTAlarmManagerFiringAlarmChanged_161;
  return v0;
}

void __initMTAlarmManagerFiringAlarmChanged_block_invoke_163()
{
  if (MobileTimerLibrary_sOnce_141 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_141, &__block_literal_global_62_142);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_143, "MTAlarmManagerFiringAlarmChanged");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerFiringAlarmChanged_161, *v0);
  }
  getMTAlarmManagerFiringAlarmChanged_131 = MTAlarmManagerFiringAlarmChangedFunction_165;
}

id MTAlarmManagerFiringAlarmChangedFunction_165()
{
  return (id)constantMTAlarmManagerFiringAlarmChanged_161;
}

id initMTAlarmManagerAlarmFired_167()
{
  if (initMTAlarmManagerAlarmFired_sOnce_168 != -1) {
    dispatch_once(&initMTAlarmManagerAlarmFired_sOnce_168, &__block_literal_global_74);
  }
  v0 = (void *)constantMTAlarmManagerAlarmFired_169;
  return v0;
}

void __initMTAlarmManagerAlarmFired_block_invoke_171()
{
  if (MobileTimerLibrary_sOnce_141 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_141, &__block_literal_global_62_142);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_143, "MTAlarmManagerAlarmFired");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmFired_169, *v0);
  }
  getMTAlarmManagerAlarmFired_130 = MTAlarmManagerAlarmFiredFunction_173;
}

id MTAlarmManagerAlarmFiredFunction_173()
{
  return (id)constantMTAlarmManagerAlarmFired_169;
}

id initMTAlarmManagerAlarmsRemoved_175()
{
  if (initMTAlarmManagerAlarmsRemoved_sOnce_176 != -1) {
    dispatch_once(&initMTAlarmManagerAlarmsRemoved_sOnce_176, &__block_literal_global_71);
  }
  v0 = (void *)constantMTAlarmManagerAlarmsRemoved_177;
  return v0;
}

void __initMTAlarmManagerAlarmsRemoved_block_invoke_179()
{
  if (MobileTimerLibrary_sOnce_141 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_141, &__block_literal_global_62_142);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_143, "MTAlarmManagerAlarmsRemoved");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsRemoved_177, *v0);
  }
  getMTAlarmManagerAlarmsRemoved_129 = MTAlarmManagerAlarmsRemovedFunction_181;
}

id MTAlarmManagerAlarmsRemovedFunction_181()
{
  return (id)constantMTAlarmManagerAlarmsRemoved_177;
}

id initMTAlarmManagerAlarmsUpdated_183()
{
  if (initMTAlarmManagerAlarmsUpdated_sOnce_184 != -1) {
    dispatch_once(&initMTAlarmManagerAlarmsUpdated_sOnce_184, &__block_literal_global_68);
  }
  v0 = (void *)constantMTAlarmManagerAlarmsUpdated_185;
  return v0;
}

void __initMTAlarmManagerAlarmsUpdated_block_invoke_187()
{
  if (MobileTimerLibrary_sOnce_141 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_141, &__block_literal_global_62_142);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_143, "MTAlarmManagerAlarmsUpdated");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsUpdated_185, *v0);
  }
  getMTAlarmManagerAlarmsUpdated_128 = MTAlarmManagerAlarmsUpdatedFunction_189;
}

id MTAlarmManagerAlarmsUpdatedFunction_189()
{
  return (id)constantMTAlarmManagerAlarmsUpdated_185;
}

id initMTAlarmManagerAlarmsAdded_191()
{
  if (initMTAlarmManagerAlarmsAdded_sOnce_192 != -1) {
    dispatch_once(&initMTAlarmManagerAlarmsAdded_sOnce_192, &__block_literal_global_65_193);
  }
  v0 = (void *)constantMTAlarmManagerAlarmsAdded_194;
  return v0;
}

void __initMTAlarmManagerAlarmsAdded_block_invoke_197()
{
  if (MobileTimerLibrary_sOnce_141 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_141, &__block_literal_global_62_142);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_143, "MTAlarmManagerAlarmsAdded");
  if (v0) {
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsAdded_194, *v0);
  }
  getMTAlarmManagerAlarmsAdded_127 = MTAlarmManagerAlarmsAddedFunction_200;
}

id MTAlarmManagerAlarmsAddedFunction_200()
{
  return (id)constantMTAlarmManagerAlarmsAdded_194;
}

id initMTAlarmManager_212()
{
  if (initMTAlarmManager_sOnce_213 != -1) {
    dispatch_once(&initMTAlarmManager_sOnce_213, &__block_literal_global_214);
  }
  v0 = (void *)classMTAlarmManager_215;
  return v0;
}

Class __initMTAlarmManager_block_invoke_218()
{
  if (MobileTimerLibrary_sOnce_141 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_141, &__block_literal_global_62_142);
  }
  Class result = objc_getClass("MTAlarmManager");
  classMTAlarmManager_215 = (uint64_t)result;
  getMTAlarmManagerClass_207 = MTAlarmManagerFunction_220;
  return result;
}

id MTAlarmManagerFunction_220()
{
  return (id)classMTAlarmManager_215;
}

void sub_21DE5C964(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_21DE5D054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DE61128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DE61BC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v8);
  objc_destroyWeak(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v9 - 128));
  _Unwind_Resume(a1);
}

id _SOClockTimerObserverGetTimerIDsFromTimers(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v2];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "timerID", (void)v12);
          if (v9) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    if ([v3 count]) {
      uint64_t v10 = (void *)[v3 copy];
    }
    else {
      uint64_t v10 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

BOOL SOTimerStateGetIsValid(unint64_t a1)
{
  return a1 < 4;
}

BOOL SOTimerStateGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

__CFString *SOTimerStateGetName(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_264486F38[a1];
  }
}

uint64_t SOTimerStateGetFromName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (SOTimerStateGetFromName_onceToken != -1) {
      dispatch_once(&SOTimerStateGetFromName_onceToken, &__block_literal_global_640);
    }
    uint64_t v2 = [(id)SOTimerStateGetFromName_map objectForKey:v1];
    uint64_t v3 = [v2 integerValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __SOTimerStateGetFromName_block_invoke()
{
  v0 = (void *)SOTimerStateGetFromName_map;
  SOTimerStateGetFromName_map = (uint64_t)&unk_26CEC6218;
}

id initMTTimerManagerStateReset()
{
  if (initMTTimerManagerStateReset_sOnce != -1) {
    dispatch_once(&initMTTimerManagerStateReset_sOnce, &__block_literal_global_80_936);
  }
  v0 = (void *)constantMTTimerManagerStateReset;
  return v0;
}

void __initMTTimerManagerStateReset_block_invoke()
{
  if (MobileTimerLibrary_sOnce_938 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_938, &__block_literal_global_59);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_939, "MTTimerManagerStateReset");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerStateReset, *v0);
  }
  getMTTimerManagerStateReset = MTTimerManagerStateResetFunction;
}

id MTTimerManagerStateResetFunction()
{
  return (id)constantMTTimerManagerStateReset;
}

void *__MobileTimerLibrary_block_invoke_942()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/MobileTimer.framework/MobileTimer", 2);
  MobileTimerLibrary_sLib_939 = (uint64_t)result;
  return result;
}

id initMTTimerManagerFiringTimerDismissed()
{
  if (initMTTimerManagerFiringTimerDismissed_sOnce != -1) {
    dispatch_once(&initMTTimerManagerFiringTimerDismissed_sOnce, &__block_literal_global_77_944);
  }
  v0 = (void *)constantMTTimerManagerFiringTimerDismissed;
  return v0;
}

void __initMTTimerManagerFiringTimerDismissed_block_invoke()
{
  if (MobileTimerLibrary_sOnce_938 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_938, &__block_literal_global_59);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_939, "MTTimerManagerFiringTimerDismissed");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerFiringTimerDismissed, *v0);
  }
  getMTTimerManagerFiringTimerDismissed = MTTimerManagerFiringTimerDismissedFunction;
}

id MTTimerManagerFiringTimerDismissedFunction()
{
  return (id)constantMTTimerManagerFiringTimerDismissed;
}

id initMTTimerManagerFiringTimerChanged()
{
  if (initMTTimerManagerFiringTimerChanged_sOnce != -1) {
    dispatch_once(&initMTTimerManagerFiringTimerChanged_sOnce, &__block_literal_global_74_947);
  }
  v0 = (void *)constantMTTimerManagerFiringTimerChanged;
  return v0;
}

void __initMTTimerManagerFiringTimerChanged_block_invoke()
{
  if (MobileTimerLibrary_sOnce_938 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_938, &__block_literal_global_59);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_939, "MTTimerManagerFiringTimerChanged");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerFiringTimerChanged, *v0);
  }
  getMTTimerManagerFiringTimerChanged = MTTimerManagerFiringTimerChangedFunction;
}

id MTTimerManagerFiringTimerChangedFunction()
{
  return (id)constantMTTimerManagerFiringTimerChanged;
}

id initMTTimerManagerTimerFired()
{
  if (initMTTimerManagerTimerFired_sOnce != -1) {
    dispatch_once(&initMTTimerManagerTimerFired_sOnce, &__block_literal_global_71_950);
  }
  v0 = (void *)constantMTTimerManagerTimerFired;
  return v0;
}

void __initMTTimerManagerTimerFired_block_invoke()
{
  if (MobileTimerLibrary_sOnce_938 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_938, &__block_literal_global_59);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_939, "MTTimerManagerTimerFired");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerTimerFired, *v0);
  }
  getMTTimerManagerTimerFired = MTTimerManagerTimerFiredFunction;
}

id MTTimerManagerTimerFiredFunction()
{
  return (id)constantMTTimerManagerTimerFired;
}

id initMTTimerManagerTimersRemoved()
{
  if (initMTTimerManagerTimersRemoved_sOnce != -1) {
    dispatch_once(&initMTTimerManagerTimersRemoved_sOnce, &__block_literal_global_68_953);
  }
  v0 = (void *)constantMTTimerManagerTimersRemoved;
  return v0;
}

void __initMTTimerManagerTimersRemoved_block_invoke()
{
  if (MobileTimerLibrary_sOnce_938 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_938, &__block_literal_global_59);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_939, "MTTimerManagerTimersRemoved");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerTimersRemoved, *v0);
  }
  getMTTimerManagerTimersRemoved = MTTimerManagerTimersRemovedFunction;
}

id MTTimerManagerTimersRemovedFunction()
{
  return (id)constantMTTimerManagerTimersRemoved;
}

id initMTTimerManagerTimersUpdated()
{
  if (initMTTimerManagerTimersUpdated_sOnce != -1) {
    dispatch_once(&initMTTimerManagerTimersUpdated_sOnce, &__block_literal_global_65_956);
  }
  v0 = (void *)constantMTTimerManagerTimersUpdated;
  return v0;
}

void __initMTTimerManagerTimersUpdated_block_invoke()
{
  if (MobileTimerLibrary_sOnce_938 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_938, &__block_literal_global_59);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_939, "MTTimerManagerTimersUpdated");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerTimersUpdated, *v0);
  }
  getMTTimerManagerTimersUpdated = MTTimerManagerTimersUpdatedFunction;
}

id MTTimerManagerTimersUpdatedFunction()
{
  return (id)constantMTTimerManagerTimersUpdated;
}

id initMTTimerManagerTimersAdded()
{
  if (initMTTimerManagerTimersAdded_sOnce != -1) {
    dispatch_once(&initMTTimerManagerTimersAdded_sOnce, &__block_literal_global_62_959);
  }
  v0 = (void *)constantMTTimerManagerTimersAdded;
  return v0;
}

void __initMTTimerManagerTimersAdded_block_invoke()
{
  if (MobileTimerLibrary_sOnce_938 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_938, &__block_literal_global_59);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_939, "MTTimerManagerTimersAdded");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerTimersAdded, *v0);
  }
  getMTTimerManagerTimersAdded = MTTimerManagerTimersAddedFunction;
}

id MTTimerManagerTimersAddedFunction()
{
  return (id)constantMTTimerManagerTimersAdded;
}

id initMTTimerManager()
{
  if (initMTTimerManager_sOnce != -1) {
    dispatch_once(&initMTTimerManager_sOnce, &__block_literal_global_970);
  }
  v0 = (void *)classMTTimerManager;
  return v0;
}

Class __initMTTimerManager_block_invoke()
{
  if (MobileTimerLibrary_sOnce_938 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_938, &__block_literal_global_59);
  }
  Class result = objc_getClass("MTTimerManager");
  classMTTimerManager = (uint64_t)result;
  getMTTimerManagerClass = MTTimerManagerFunction;
  return result;
}

id MTTimerManagerFunction()
{
  return (id)classMTTimerManager;
}

id initMTTimerManagerStateReset_1014()
{
  if (initMTTimerManagerStateReset_sOnce_1015 != -1) {
    dispatch_once(&initMTTimerManagerStateReset_sOnce_1015, &__block_literal_global_57);
  }
  v0 = (void *)constantMTTimerManagerStateReset_1016;
  return v0;
}

void __initMTTimerManagerStateReset_block_invoke_1018()
{
  if (MobileTimerLibrary_sOnce_1019 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_1019, &__block_literal_global_33);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_1020, "MTTimerManagerStateReset");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerStateReset_1016, *v0);
  }
  getMTTimerManagerStateReset_1012 = (uint64_t)MTTimerManagerStateResetFunction_1023;
}

id MTTimerManagerStateResetFunction_1023()
{
  return (id)constantMTTimerManagerStateReset_1016;
}

void *__MobileTimerLibrary_block_invoke_1025()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/MobileTimer.framework/MobileTimer", 2);
  MobileTimerLibrary_sLib_1020 = (uint64_t)result;
  return result;
}

id initMTTimerManagerTimersChanged()
{
  if (initMTTimerManagerTimersChanged_sOnce != -1) {
    dispatch_once(&initMTTimerManagerTimersChanged_sOnce, &__block_literal_global_54);
  }
  v0 = (void *)constantMTTimerManagerTimersChanged;
  return v0;
}

void __initMTTimerManagerTimersChanged_block_invoke()
{
  if (MobileTimerLibrary_sOnce_1019 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_1019, &__block_literal_global_33);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_1020, "MTTimerManagerTimersChanged");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerTimersChanged, *v0);
  }
  getMTTimerManagerTimersChanged = (uint64_t)MTTimerManagerTimersChangedFunction;
}

id MTTimerManagerTimersChangedFunction()
{
  return (id)constantMTTimerManagerTimersChanged;
}

id initMTTimerManagerFiringTimerDismissed_1029()
{
  if (initMTTimerManagerFiringTimerDismissed_sOnce_1030 != -1) {
    dispatch_once(&initMTTimerManagerFiringTimerDismissed_sOnce_1030, &__block_literal_global_51);
  }
  v0 = (void *)constantMTTimerManagerFiringTimerDismissed_1031;
  return v0;
}

void __initMTTimerManagerFiringTimerDismissed_block_invoke_1033()
{
  if (MobileTimerLibrary_sOnce_1019 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_1019, &__block_literal_global_33);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_1020, "MTTimerManagerFiringTimerDismissed");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerFiringTimerDismissed_1031, *v0);
  }
  getMTTimerManagerFiringTimerDismissed_1011 = (uint64_t)MTTimerManagerFiringTimerDismissedFunction_1036;
}

id MTTimerManagerFiringTimerDismissedFunction_1036()
{
  return (id)constantMTTimerManagerFiringTimerDismissed_1031;
}

id initMTTimerManagerFiringTimerChanged_1038()
{
  if (initMTTimerManagerFiringTimerChanged_sOnce_1039 != -1) {
    dispatch_once(&initMTTimerManagerFiringTimerChanged_sOnce_1039, &__block_literal_global_48);
  }
  v0 = (void *)constantMTTimerManagerFiringTimerChanged_1040;
  return v0;
}

void __initMTTimerManagerFiringTimerChanged_block_invoke_1042()
{
  if (MobileTimerLibrary_sOnce_1019 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_1019, &__block_literal_global_33);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_1020, "MTTimerManagerFiringTimerChanged");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerFiringTimerChanged_1040, *v0);
  }
  getMTTimerManagerFiringTimerChanged_1010 = (uint64_t)MTTimerManagerFiringTimerChangedFunction_1045;
}

id MTTimerManagerFiringTimerChangedFunction_1045()
{
  return (id)constantMTTimerManagerFiringTimerChanged_1040;
}

id initMTTimerManagerTimerFired_1047()
{
  if (initMTTimerManagerTimerFired_sOnce_1048 != -1) {
    dispatch_once(&initMTTimerManagerTimerFired_sOnce_1048, &__block_literal_global_45);
  }
  v0 = (void *)constantMTTimerManagerTimerFired_1049;
  return v0;
}

void __initMTTimerManagerTimerFired_block_invoke_1051()
{
  if (MobileTimerLibrary_sOnce_1019 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_1019, &__block_literal_global_33);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_1020, "MTTimerManagerTimerFired");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerTimerFired_1049, *v0);
  }
  getMTTimerManagerTimerFired_1009 = (uint64_t)MTTimerManagerTimerFiredFunction_1054;
}

id MTTimerManagerTimerFiredFunction_1054()
{
  return (id)constantMTTimerManagerTimerFired_1049;
}

id initMTTimerManagerTimersRemoved_1056()
{
  if (initMTTimerManagerTimersRemoved_sOnce_1057 != -1) {
    dispatch_once(&initMTTimerManagerTimersRemoved_sOnce_1057, &__block_literal_global_42);
  }
  v0 = (void *)constantMTTimerManagerTimersRemoved_1058;
  return v0;
}

void __initMTTimerManagerTimersRemoved_block_invoke_1060()
{
  if (MobileTimerLibrary_sOnce_1019 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_1019, &__block_literal_global_33);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_1020, "MTTimerManagerTimersRemoved");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerTimersRemoved_1058, *v0);
  }
  getMTTimerManagerTimersRemoved_1008 = (uint64_t)MTTimerManagerTimersRemovedFunction_1062;
}

id MTTimerManagerTimersRemovedFunction_1062()
{
  return (id)constantMTTimerManagerTimersRemoved_1058;
}

id initMTTimerManagerTimersUpdated_1064()
{
  if (initMTTimerManagerTimersUpdated_sOnce_1065 != -1) {
    dispatch_once(&initMTTimerManagerTimersUpdated_sOnce_1065, &__block_literal_global_39);
  }
  v0 = (void *)constantMTTimerManagerTimersUpdated_1066;
  return v0;
}

void __initMTTimerManagerTimersUpdated_block_invoke_1068()
{
  if (MobileTimerLibrary_sOnce_1019 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_1019, &__block_literal_global_33);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_1020, "MTTimerManagerTimersUpdated");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerTimersUpdated_1066, *v0);
  }
  getMTTimerManagerTimersUpdated_1007 = (uint64_t)MTTimerManagerTimersUpdatedFunction_1070;
}

id MTTimerManagerTimersUpdatedFunction_1070()
{
  return (id)constantMTTimerManagerTimersUpdated_1066;
}

id initMTTimerManagerTimersAdded_1072()
{
  if (initMTTimerManagerTimersAdded_sOnce_1073 != -1) {
    dispatch_once(&initMTTimerManagerTimersAdded_sOnce_1073, &__block_literal_global_36);
  }
  v0 = (void *)constantMTTimerManagerTimersAdded_1074;
  return v0;
}

void __initMTTimerManagerTimersAdded_block_invoke_1077()
{
  if (MobileTimerLibrary_sOnce_1019 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_1019, &__block_literal_global_33);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_1020, "MTTimerManagerTimersAdded");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerTimersAdded_1074, *v0);
  }
  getMTTimerManagerTimersAdded_1006 = (uint64_t)MTTimerManagerTimersAddedFunction_1080;
}

id MTTimerManagerTimersAddedFunction_1080()
{
  return (id)constantMTTimerManagerTimersAdded_1074;
}

Class __initMTTimer_block_invoke()
{
  if (MobileTimerLibrary_sOnce_1019 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_1019, &__block_literal_global_33);
  }
  Class result = objc_getClass("MTTimer");
  classMTTimer = (uint64_t)result;
  getMTTimerClass = MTTimerFunction;
  return result;
}

id MTTimerFunction()
{
  return (id)classMTTimer;
}

id initMTTimerManagerTimersKey()
{
  if (initMTTimerManagerTimersKey_sOnce != -1) {
    dispatch_once(&initMTTimerManagerTimersKey_sOnce, &__block_literal_global_63);
  }
  v0 = (void *)constantMTTimerManagerTimersKey;
  return v0;
}

void __initMTTimerManagerTimersKey_block_invoke()
{
  if (MobileTimerLibrary_sOnce_1019 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_1019, &__block_literal_global_33);
  }
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_1020, "MTTimerManagerTimersKey");
  if (v0) {
    objc_storeStrong((id *)&constantMTTimerManagerTimersKey, *v0);
  }
  getMTTimerManagerTimersKey = MTTimerManagerTimersKeyFunction;
}

id initMTTimerManager_1095()
{
  if (initMTTimerManager_sOnce_1096 != -1) {
    dispatch_once(&initMTTimerManager_sOnce_1096, &__block_literal_global_1097);
  }
  v0 = (void *)classMTTimerManager_1098;
  return v0;
}

Class __initMTTimerManager_block_invoke_1101()
{
  if (MobileTimerLibrary_sOnce_1019 != -1) {
    dispatch_once(&MobileTimerLibrary_sOnce_1019, &__block_literal_global_33);
  }
  Class result = objc_getClass("MTTimerManager");
  classMTTimerManager_1098 = (uint64_t)result;
  getMTTimerManagerClass_1091 = MTTimerManagerFunction_1104;
  return result;
}

id MTTimerManagerFunction_1104()
{
  return (id)classMTTimerManager_1098;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t AFClockAlarmManagerEventGetName()
{
  return MEMORY[0x270F0EC68]();
}

uint64_t AFClockTimerManagerEventGetName()
{
  return MEMORY[0x270F0EC70]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x270F0EE20]();
}

uint64_t AFMediaPlaybackStateGetIsValidAndSpecified()
{
  return MEMORY[0x270F0EE28]();
}

uint64_t AFMediaPlaybackStateGetName()
{
  return MEMORY[0x270F0EE30]();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MRMediaRemoteCopyDeviceInfo()
{
  return MEMORY[0x270F49EE8]();
}

uint64_t MRMediaRemoteCopyPlaybackStateDescription()
{
  return MEMORY[0x270F49F08]();
}

uint64_t MRMediaRemoteGetActiveOrigin()
{
  return MEMORY[0x270F49F30]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x270F49F68]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x270F4A090]();
}

uint64_t MRPairedDeviceIsProxyGroupPlayer()
{
  return MEMORY[0x270F4A178]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t _AFGetPlaybackState()
{
  return MEMORY[0x270F0F008]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}