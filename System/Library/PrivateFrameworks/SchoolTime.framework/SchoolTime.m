id SCLInterruptBehaviorResolutionXPCServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t vars8;

  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DF14300];
  v1 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v1 forSelector:sel_resolveBehaviorForEvent_clientIdentifier_completion_ argumentIndex:0 ofReply:0];

  v2 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v2 forSelector:sel_resolveBehaviorForEvent_clientIdentifier_completion_ argumentIndex:0 ofReply:1];

  v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v3 forSelector:sel_resolveBehaviorForEvent_clientIdentifier_completion_ argumentIndex:1 ofReply:1];

  return v0;
}

uint64_t SCLPBUnlockHistoryItemReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 56) |= 2u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v53 = 16;
          goto LABEL_79;
        case 2u:
          *(unsigned char *)(a1 + 56) |= 1u;
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v53 = 8;
LABEL_79:
          *(void *)(a1 + v53) = v20;
          continue;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 24;
          goto LABEL_29;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 48;
LABEL_29:
          v26 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        case 5u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 56) |= 0x10u;
          while (2)
          {
            uint64_t v30 = *v3;
            uint64_t v31 = *(void *)(a2 + v30);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
              *(void *)(a2 + v30) = v32;
              v29 |= (unint64_t)(v33 & 0x7F) << v27;
              if (v33 < 0)
              {
                v27 += 7;
                BOOL v15 = v28++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v29) = 0;
          }
LABEL_61:
          uint64_t v52 = 40;
          goto LABEL_74;
        case 6u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 56) |= 0x20u;
          while (2)
          {
            uint64_t v36 = *v3;
            uint64_t v37 = *(void *)(a2 + v36);
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v38;
              v29 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                BOOL v15 = v35++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v29) = 0;
          }
LABEL_65:
          uint64_t v52 = 44;
          goto LABEL_74;
        case 7u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 56) |= 4u;
          while (2)
          {
            uint64_t v42 = *v3;
            uint64_t v43 = *(void *)(a2 + v42);
            unint64_t v44 = v43 + 1;
            if (v43 == -1 || v44 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
              *(void *)(a2 + v42) = v44;
              v29 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                BOOL v15 = v41++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v29) = 0;
          }
LABEL_69:
          uint64_t v52 = 32;
          goto LABEL_74;
        case 8u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 56) |= 8u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v48 = *v3;
        uint64_t v49 = *(void *)(a2 + v48);
        unint64_t v50 = v49 + 1;
        if (v49 == -1 || v50 > *(void *)(a2 + *v4)) {
          break;
        }
        char v51 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
        *(void *)(a2 + v48) = v50;
        v29 |= (unint64_t)(v51 & 0x7F) << v46;
        if ((v51 & 0x80) == 0) {
          goto LABEL_71;
        }
        v46 += 7;
        BOOL v15 = v47++ >= 9;
        if (v15)
        {
          LODWORD(v29) = 0;
          goto LABEL_73;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_71:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v29) = 0;
      }
LABEL_73:
      uint64_t v52 = 36;
LABEL_74:
      *(_DWORD *)(a1 + v52) = v29;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_22B7B83D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B7B884C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B7B8C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
}

void sub_22B7B9064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t SCLPBScheduleSettingsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 5)
      {
        uint64_t v24 = objc_alloc_init(SCLPBScheduleRecurrence);
        [(id)a1 addRecurrences:v24];
        if (!PBReaderPlaceMark() || (SCLPBScheduleRecurrenceReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 2)
      {
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 24) |= 2u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 1;
          v27 |= (unint64_t)(v30 & 0x7F) << v25;
          if ((v30 & 0x80) == 0) {
            goto LABEL_45;
          }
          v25 += 7;
          BOOL v14 = v26++ >= 9;
          if (v14)
          {
            uint64_t v27 = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v27 = 0;
        }
LABEL_47:
        *(unsigned char *)(a1 + 20) = v27 != 0;
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_41;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_43:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_22B7BD664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_22B7BEDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

SCLMutableScheduleSettings *SCLScheduleSettingsFromSCLPBScheduleSettings(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = objc_alloc_init(SCLMutableScheduleSettings);
  -[SCLMutableScheduleSettings setEnabled:](v2, "setEnabled:", [v1 isEnabled]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend(v1, "recurrences", 0);
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
        unsigned int v9 = SCLScheduleRecurrenceForSCLPBScheduleRecurrence(*(void **)(*((void *)&v12 + 1) + 8 * i));
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  unint64_t v10 = [[SCLRecurrenceSchedule alloc] initWithRecurrences:v3];
  [(SCLMutableScheduleSettings *)v2 setSchedule:v10];

  return v2;
}

SCLScheduleRecurrence *SCLScheduleRecurrenceForSCLPBScheduleRecurrence(void *a1)
{
  id v1 = a1;
  v2 = [v1 timeInterval];
  id v3 = [v2 startTime];
  uint64_t v4 = SCLScheduleTimeForSCLPBScheduleTime(v3);

  uint64_t v5 = [v1 timeInterval];
  uint64_t v6 = [v5 endTime];
  uint64_t v7 = SCLScheduleTimeForSCLPBScheduleTime(v6);

  char v8 = [[SCLTimeInterval alloc] initWithStartTime:v4 endTime:v7];
  LODWORD(v6) = [v1 day];

  unsigned int v9 = [[SCLScheduleRecurrence alloc] initWithTimeInterval:v8 day:(int)v6];
  return v9;
}

SCLPBScheduleSettings *SCLPBScheduleSettingsFromSCLScheduleSettings(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = objc_alloc_init(SCLPBScheduleSettings);
  -[SCLPBScheduleSettings setIsEnabled:](v2, "setIsEnabled:", [v1 isEnabled]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend(v1, "schedule", 0);
  uint64_t v5 = [v4 recurrences];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = SCLPBScheduleRecurrenceForSCLScheduleRecurrence(*(void **)(*((void *)&v12 + 1) + 8 * i));
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(SCLPBScheduleSettings *)v2 setRecurrences:v3];
  return v2;
}

SCLPBScheduleRecurrence *SCLPBScheduleRecurrenceForSCLScheduleRecurrence(void *a1)
{
  id v1 = a1;
  v2 = objc_alloc_init(SCLPBScheduleRecurrence);
  -[SCLPBScheduleRecurrence setDay:](v2, "setDay:", [v1 day]);
  id v3 = objc_alloc_init(SCLPBTimeInterval);
  uint64_t v4 = [v1 timeInterval];
  uint64_t v5 = [v4 startTime];
  uint64_t v6 = SCLPBScheduleTimeForSCLScheduleTime(v5);
  [(SCLPBTimeInterval *)v3 setStartTime:v6];

  uint64_t v7 = [v1 timeInterval];

  uint64_t v8 = [v7 endTime];
  unsigned int v9 = SCLPBScheduleTimeForSCLScheduleTime(v8);
  [(SCLPBTimeInterval *)v3 setEndTime:v9];

  [(SCLPBScheduleRecurrence *)v2 setTimeInterval:v3];
  return v2;
}

uint64_t SCLDayForSCLPBDay(uint64_t result)
{
  return (int)result;
}

SCLPBScheduleTime *SCLPBScheduleTimeForSCLScheduleTime(void *a1)
{
  id v1 = a1;
  v2 = objc_alloc_init(SCLPBScheduleTime);
  -[SCLPBScheduleTime setHour:](v2, "setHour:", [v1 hour]);
  uint64_t v3 = [v1 minute];

  [(SCLPBScheduleTime *)v2 setMinute:v3];
  return v2;
}

SCLScheduleTime *SCLScheduleTimeForSCLPBScheduleTime(void *a1)
{
  id v1 = a1;
  if (SCLPBScheduleTimeIsEmpty(v1)) {
    v2 = 0;
  }
  else {
    v2 = -[SCLScheduleTime initWithHour:minute:]([SCLScheduleTime alloc], "initWithHour:minute:", [v1 hour], objc_msgSend(v1, "minute"));
  }

  return v2;
}

SCLPBScheduleTime *SCLPBEmptyScheduleTime()
{
  v0 = objc_alloc_init(SCLPBScheduleTime);
  return v0;
}

uint64_t SCLPBScheduleTimeIsEmpty(void *a1)
{
  id v1 = a1;
  if ([v1 hasHour]) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = [v1 hasMinute] ^ 1;
  }

  return v2;
}

SCLPBUnlockHistoryItem *SCLPBUnlockHistoryItemFromSCLUnlockHistoryItem(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(SCLPBUnlockHistoryItem);
  uint64_t v3 = [v1 unlockedInterval];
  uint64_t v4 = [v3 startDate];
  [v4 timeIntervalSinceReferenceDate];
  -[SCLPBUnlockHistoryItem setStartTimeIntervalSinceReferenceDate:](v2, "setStartTimeIntervalSinceReferenceDate:");

  uint64_t v5 = [v1 unlockedInterval];
  [v5 duration];
  -[SCLPBUnlockHistoryItem setDuration:](v2, "setDuration:");

  uint64_t v6 = [v1 calendar];
  uint64_t v7 = [v6 calendarIdentifier];
  [(SCLPBUnlockHistoryItem *)v2 setCalendarIdentifier:v7];

  uint64_t v8 = [v1 timeZone];
  unsigned int v9 = [v8 name];
  [(SCLPBUnlockHistoryItem *)v2 setTimeZoneName:v9];

  unint64_t v10 = [v1 scheduleStartTime];
  -[SCLPBUnlockHistoryItem setScheduleStartHour:](v2, "setScheduleStartHour:", [v10 hour]);

  uint64_t v11 = [v1 scheduleStartTime];
  -[SCLPBUnlockHistoryItem setScheduleStartMinute:](v2, "setScheduleStartMinute:", [v11 minute]);

  long long v12 = [v1 scheduleEndTime];
  -[SCLPBUnlockHistoryItem setScheduleEndHour:](v2, "setScheduleEndHour:", [v12 hour]);

  long long v13 = [v1 scheduleEndTime];

  -[SCLPBUnlockHistoryItem setScheduleEndMinute:](v2, "setScheduleEndMinute:", [v13 minute]);
  return v2;
}

SCLUnlockHistoryItem *SCLUnlockHistoryItemFromSCLPBUnlockHistoryItem(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF910];
  id v2 = a1;
  [v2 startTimeIntervalSinceReferenceDate];
  uint64_t v3 = objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:");
  [v2 duration];
  if (v4 >= 0.0) {
    double v5 = v4;
  }
  else {
    double v5 = 0.0;
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v3 duration:v5];
  uint64_t v7 = (void *)MEMORY[0x263EFF8F0];
  uint64_t v8 = [v2 calendarIdentifier];
  unsigned int v9 = [v7 calendarWithIdentifier:v8];

  unint64_t v10 = (void *)MEMORY[0x263EFFA18];
  uint64_t v11 = [v2 timeZoneName];
  long long v12 = [v10 timeZoneWithName:v11];

  long long v13 = -[SCLScheduleTime initWithHour:minute:]([SCLScheduleTime alloc], "initWithHour:minute:", [v2 scheduleStartHour], objc_msgSend(v2, "scheduleStartMinute"));
  long long v14 = [SCLScheduleTime alloc];
  uint64_t v15 = [v2 scheduleEndHour];
  unsigned int v16 = [v2 scheduleEndMinute];

  uint64_t v17 = [(SCLScheduleTime *)v14 initWithHour:v15 minute:v16];
  char v18 = [[SCLUnlockHistoryItem alloc] initWithInterval:v6 calendar:v9 timeZone:v12 startTime:v13 endTime:v17];

  return v18;
}

void sub_22B7C0FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B7C13D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
}

void sub_22B7C14F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_22B7C17B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state,char a26)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_22B7C1E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_22B7C2374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

id scl_persistence_log()
{
  if (scl_persistence_log_onceToken != -1) {
    dispatch_once(&scl_persistence_log_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)scl_persistence_log___logger;
  return v0;
}

uint64_t __scl_persistence_log_block_invoke()
{
  scl_persistence_log___logger = (uint64_t)os_log_create("com.apple.SchoolTime", "persistence");
  return MEMORY[0x270F9A758]();
}

id scl_pairing_log()
{
  if (scl_pairing_log_onceToken != -1) {
    dispatch_once(&scl_pairing_log_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)scl_pairing_log___logger;
  return v0;
}

uint64_t __scl_pairing_log_block_invoke()
{
  scl_pairing_log___logger = (uint64_t)os_log_create("com.apple.SchoolTime", "pairing");
  return MEMORY[0x270F9A758]();
}

id scl_transport_log()
{
  if (scl_transport_log_onceToken != -1) {
    dispatch_once(&scl_transport_log_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)scl_transport_log___logger;
  return v0;
}

uint64_t __scl_transport_log_block_invoke()
{
  scl_transport_log___logger = (uint64_t)os_log_create("com.apple.SchoolTime", "transport");
  return MEMORY[0x270F9A758]();
}

id scl_framework_log()
{
  if (scl_framework_log_onceToken != -1) {
    dispatch_once(&scl_framework_log_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)scl_framework_log___logger;
  return v0;
}

uint64_t __scl_framework_log_block_invoke()
{
  scl_framework_log___logger = (uint64_t)os_log_create("com.apple.SchoolTime", "framework");
  return MEMORY[0x270F9A758]();
}

id scl_interrupt_log()
{
  if (scl_interrupt_log_onceToken != -1) {
    dispatch_once(&scl_interrupt_log_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)scl_interrupt_log___logger;
  return v0;
}

uint64_t __scl_interrupt_log_block_invoke()
{
  scl_interrupt_log___logger = (uint64_t)os_log_create("com.apple.SchoolTime", "interrupt");
  return MEMORY[0x270F9A758]();
}

_DWORD *SCLSStateDataWithTitleDescriptionAndHints(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v9 = 0;
  double v4 = [MEMORY[0x263F08AC0] dataWithPropertyList:a2 format:200 options:0 error:&v9];
  double v5 = v4;
  if (v4)
  {
    size_t v6 = [v4 length];
    uint64_t v7 = malloc_type_calloc(1uLL, v6 + 200, 0xF9CF26B8uLL);
    _DWORD *v7 = 1;
    v7[1] = v6;
    [v3 UTF8String];
    __strlcpy_chk();
    memcpy(v7 + 50, (const void *)[v5 bytes], v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_22B7C459C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_22B7C490C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_22B7C5F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_22B7C62B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_22B7C71A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t SCLIsStateTransitionStartOfUnlockPeriod(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 activeState] == 2 || objc_msgSend(v3, "activeState") == 1) {
    int v5 = [v3 isInSchedule];
  }
  else {
    int v5 = 0;
  }
  if ([v4 activeState]) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = [v4 isInSchedule];
  }
  uint64_t v7 = v5 & v6;

  return v7;
}

uint64_t SCLIsStateTransitionEndOfUnlockPeriod(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 isInSchedule]) {
    BOOL v5 = [v3 activeState] == 0;
  }
  else {
    BOOL v5 = 0;
  }
  BOOL v6 = [v4 activeState] == 2 || objc_msgSend(v4, "activeState") == 1;
  unsigned int v7 = v6 | [v4 isInSchedule] ^ 1;
  if (v5) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t SCLPBScheduleRequestResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  BOOL v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unsigned int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(SCLPBScheduleSettings);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (SCLPBScheduleSettingsReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SCLPBScheduleRecurrenceReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  BOOL v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unsigned int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 8) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(SCLPBTimeInterval);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || !SCLPBTimeIntervalReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SCLPBScheduleRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  BOOL v5 = (int *)MEMORY[0x263F62270];
  BOOL v6 = (int *)MEMORY[0x263F62268];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

void sub_22B7CA904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_22B7CB80C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

BOOL SCLPBTimeIntervalReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  BOOL v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v17 = objc_alloc_init(SCLPBScheduleTime);
        uint64_t v18 = 8;
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
          continue;
        }
        uint64_t v17 = objc_alloc_init(SCLPBScheduleTime);
        uint64_t v18 = 16;
      }
      objc_storeStrong((id *)(a1 + v18), v17);
      if (!PBReaderPlaceMark() || !SCLPBScheduleTimeReadFrom((uint64_t)v17, a2))
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id SCLSuppressSchoolModeAssertionXPCServerInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DF163C8];
  id v1 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v1 forSelector:sel_acquireWithExplanation_UUID_completion_ argumentIndex:1 ofReply:0];

  uint64_t v2 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v2 forSelector:sel_acquireWithExplanation_UUID_completion_ argumentIndex:1 ofReply:1];

  return v0;
}

void sub_22B7CF8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_22B7CFE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void SCLWatchServerRun()
{
  id v0 = +[SCLWatchServer sharedWatchServer];
  [v0 run];
}

void sub_22B7D1308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

BOOL SCLRepeatScheduleContainsDay(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) >= 7) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = (1 << (a2 - 1));
  }
  return (v2 & a1) != 0;
}

uint64_t SCLRepeatScheduleForDay(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 7) {
    return 0;
  }
  else {
    return (1 << (a1 - 1));
  }
}

uint64_t SCLEnumerateDaysInRepeatSchedule(uint64_t result, uint64_t a2)
{
  int v3 = result;
  for (uint64_t i = 1; i != 8; ++i)
  {
    if (((1 << (i - 1)) & v3) != 0) {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, i);
    }
  }
  return result;
}

uint64_t SCLGetNextDay(uint64_t a1)
{
  if (a1 == 7) {
    return 1;
  }
  else {
    return a1 + 1;
  }
}

uint64_t SCLGetPreviousDay(uint64_t a1)
{
  if (a1 == 1) {
    return 7;
  }
  else {
    return a1 - 1;
  }
}

id NSStringForSCLDay(uint64_t a1)
{
  if (NSStringForSCLDay_onceToken != -1) {
    dispatch_once(&NSStringForSCLDay_onceToken, &__block_literal_global_10);
  }
  uint64_t v2 = [(id)NSStringForSCLDay_formatter weekdaySymbols];
  int v3 = [v2 objectAtIndex:a1 - 1];

  return v3;
}

void __NSStringForSCLDay_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  id v1 = NSStringForSCLDay_formatter;
  NSStringForSCLDay_formatter = (uint64_t)v0;

  uint64_t v2 = NSStringForSCLDay_formatter;
  id v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [v2 setLocale:v3];
}

void sub_22B7D2574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B7D288C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B7D2FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *StringFromSCLInterruptEventType(unint64_t a1)
{
  if (a1 > 2) {
    return @"<unknown>";
  }
  else {
    return off_2648ACBA8[a1];
  }
}

__CFString *StringFromSCLInterruptEventUrgency(uint64_t a1)
{
  id v1 = @"<unknown>";
  if (a1 == 1) {
    id v1 = @"critical";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"default";
  }
}

uint64_t SCLIsNRDeviceEligibleForSchoolTime(void *a1, char a2)
{
  id v3 = a1;
  id v4 = [v3 valueForProperty:*MEMORY[0x263F575B8]];
  char v5 = [v4 BOOLValue];

  if (v5) {
    goto LABEL_11;
  }
  BOOL v6 = [v3 pairingID];

  if (!v6)
  {
    unsigned int v9 = scl_pairing_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      SCLIsNRDeviceEligibleForSchoolTime_cold_1((uint64_t)v3, v9);
    }
    goto LABEL_10;
  }
  int v7 = [v3 valueForProperty:*MEMORY[0x263F575E8]];

  if (!v7)
  {
    unsigned int v9 = scl_pairing_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      SCLIsNRDeviceEligibleForSchoolTime_cold_2(v3, v9);
    }
LABEL_10:

LABEL_11:
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  if (a2)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v11 = [v3 valueForProperty:*MEMORY[0x263F575B0]];
    uint64_t v8 = [v11 BOOLValue];
  }
LABEL_12:

  return v8;
}

id SCLAutoUpdatingPairingID()
{
  v2[2] = *MEMORY[0x263EF8340];
  v2[0] = 0;
  v2[1] = 0;
  id v0 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v2];
  return v0;
}

void sub_22B7D4F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_22B7D535C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B7D569C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_22B7D5970(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_22B7D6054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

BOOL SCLPBScheduleTimeReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            uint64_t v24 = &OBJC_IVAR___SCLPBScheduleTime__hour;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            uint64_t v24 = &OBJC_IVAR___SCLPBScheduleTime__hour;
            goto LABEL_41;
          }
        }
        uint64_t v24 = &OBJC_IVAR___SCLPBScheduleTime__hour;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 16) |= 2u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        uint64_t v24 = &OBJC_IVAR___SCLPBScheduleTime__minute;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        uint64_t v24 = &OBJC_IVAR___SCLPBScheduleTime__minute;
        goto LABEL_41;
      }
    }
    uint64_t v24 = &OBJC_IVAR___SCLPBScheduleTime__minute;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id SCLEntitlementError(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v1 = [NSString stringWithFormat:@"Cannot set schedule because client is missing the %@ entitlement", a1];
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v7[0] = v1;
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"com.apple.schooltime" code:1 userInfo:v3];

  return v4;
}

id SCLPairingUnavailableError(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v1 = [NSString stringWithFormat:@"No pairing for pairingID %@", a1];
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v7[0] = v1;
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"com.apple.schooltime" code:2 userInfo:v3];

  return v4;
}

void sub_22B7D79DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *StringFromSCLContactType(uint64_t a1)
{
  id v1 = @"unknown";
  if (a1 == 2) {
    id v1 = @"phone";
  }
  if (a1 == 1) {
    return @"email";
  }
  else {
    return v1;
  }
}

void sub_22B7D8A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B7DA120(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_22B7DAE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_22B7DB3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,os_activity_scope_state_s state)
{
}

void sub_22B7DBD0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B7DC050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

__CFString *StringFromSCLInterruptEligibility(uint64_t a1)
{
  uint64_t v1 = @"<unknown>";
  if (a1 == 1) {
    uint64_t v1 = @"eligible";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"none";
  }
}

id SCLSchoolModeClientXPCInterface()
{
  os_unfair_lock_lock((os_unfair_lock_t)&SCLSchoolModeClientXPCInterface___lock);
  WeakRetained = objc_loadWeakRetained(&SCLSchoolModeClientXPCInterface___interface);
  if (!WeakRetained)
  {
    WeakRetained = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DF11080];
    [WeakRetained setClass:objc_opt_class() forSelector:sel_applyServerSettings_ argumentIndex:0 ofReply:0];
    objc_storeWeak(&SCLSchoolModeClientXPCInterface___interface, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&SCLSchoolModeClientXPCInterface___lock);
  return WeakRetained;
}

id SCLSchoolModeServerXPCInterface()
{
  os_unfair_lock_lock(&SCLSchoolModeServerXPCInterface___lock);
  WeakRetained = objc_loadWeakRetained(&SCLSchoolModeServerXPCInterface___interface);
  if (!WeakRetained)
  {
    WeakRetained = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DF16628];
    [WeakRetained setClass:objc_opt_class() forSelector:sel_connectWithPairingID_identifier_completion_ argumentIndex:0 ofReply:1];
    [WeakRetained setClass:objc_opt_class() forSelector:sel_connectWithPairingID_identifier_completion_ argumentIndex:1 ofReply:1];
    [WeakRetained setClass:objc_opt_class() forSelector:sel_applySchedule_completion_ argumentIndex:0 ofReply:0];
    [WeakRetained setClass:objc_opt_class() forSelector:sel_applySchedule_completion_ argumentIndex:1 ofReply:1];
    [WeakRetained setClass:objc_opt_class() forSelector:sel_setActive_options_completion_ argumentIndex:1 ofReply:1];
    [WeakRetained setClass:objc_opt_class() forSelector:sel_addUnlockHistoryItem_completion_ argumentIndex:0 ofReply:0];
    [WeakRetained setClass:objc_opt_class() forSelector:sel_addUnlockHistoryItem_completion_ argumentIndex:1 ofReply:1];
    uint64_t v1 = (void *)MEMORY[0x263EFFA08];
    uint64_t v2 = objc_opt_class();
    id v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
    [WeakRetained setClasses:v3 forSelector:sel_fetchRecentUnlockHistoryItemsWithCompletion_ argumentIndex:0 ofReply:1];

    [WeakRetained setClass:objc_opt_class() forSelector:sel_fetchRecentUnlockHistoryItemsWithCompletion_ argumentIndex:1 ofReply:1];
    [WeakRetained setClass:objc_opt_class() forSelector:sel_deleteHistoryWithCompletion_ argumentIndex:1 ofReply:1];
    objc_storeWeak(&SCLSchoolModeServerXPCInterface___interface, WeakRetained);
  }
  os_unfair_lock_unlock(&SCLSchoolModeServerXPCInterface___lock);
  return WeakRetained;
}

void SCLIsNRDeviceEligibleForSchoolTime_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_ERROR, "Device %@ is missing pairingID", (uint8_t *)&v2, 0xCu);
}

void SCLIsNRDeviceEligibleForSchoolTime_cold_2(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 pairingID];
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2112;
  char v8 = a1;
  _os_log_error_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_ERROR, "Have pairing id %@ but nil pairing store path. Perhaps device hasn't completed pairing yet? %@", (uint8_t *)&v5, 0x16u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x270F107C8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x270EE5668]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x270EE56B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95C8](label);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x270EDA148]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x270F796D8]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}