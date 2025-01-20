@interface UIEventBus
@end

@implementation UIEventBus

void __27___UIEventBus_drainEvents___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v2 = (char *)off_1EB256BF8 + 648;
  if (*((_DWORD *)off_1EB256BF8 + 160) != 1) {
    v2 = 0;
  }
  unint64_t v3 = *(void *)v2;
  uint64_t v4 = *((unsigned int *)v2 + 9);
  unint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  for (uint64_t i = 16; i != 40; i += 8)
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + i) stopEventForModelTime:v3 alignment:v4];
    if (v7)
    {
      unint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) indexOfObjectIdenticalTo:v7];
      if (v8 < v5) {
        unint64_t v5 = v8;
      }
    }
  }
  if (v5)
  {
    uint64_t v9 = 0;
    unint64_t v29 = 0;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      v12 = [*(id *)(*(void *)(a1 + 32) + 8) firstObject];
      unint64_t TimeStamp = IOHIDEventGetTimeStamp();
      unint64_t v14 = TimeStamp;
      if (v10 <= TimeStamp) {
        unint64_t v10 = TimeStamp;
      }
      if (v11 - 1 >= TimeStamp) {
        unint64_t v11 = TimeStamp;
      }
      if (_UIInternalPreferencesRevisionOnce != -1) {
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
      }
      int v15 = _UIInternalPreferencesRevisionVar;
      if (_UIInternalPreferencesRevisionVar >= 1)
      {
        for (int j = _UIInternalPreference_UseHIDEventRemoteTimestamp;
              v15 != j;
              int j = _UIInternalPreference_UseHIDEventRemoteTimestamp)
        {
          if (v15 < j)
          {
            if (byte_1EB25789C)
            {
              unint64_t v18 = _UIEventHIDEventRemoteTimestamp((uint64_t)v12);
              if (v18)
              {
                log = *(NSObject **)(__UILogGetCategoryCachedImpl("RemoteTimestamp", &qword_1EB262F08) + 8);
                if (os_signpost_enabled(log))
                {
                  *(_DWORD *)buf = 134218240;
                  unint64_t v34 = v18;
                  __int16 v35 = 2048;
                  v36 = (char *)v14;
                  _os_signpost_emit_with_name_impl(&dword_1853B0000, log, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventRemoteTimestamp", "eventRemoteTime=%llu, eventTime=%llu", buf, 0x16u);
                }
              }
              unint64_t v19 = v29;
              if (v29 <= v18) {
                unint64_t v19 = v18;
              }
              unint64_t v29 = v19;
            }
            break;
          }
          _UIInternalPreferenceSync(v15, &_UIInternalPreference_UseHIDEventRemoteTimestamp, @"UseHIDEventRemoteTimestamp", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        }
      }
      v16 = -[_UIEventBus inputForEvent:](*(void **)(a1 + 32), (uint64_t)v12);
      [v16 removeEvent:v12];

      [*(id *)(a1 + 40) insertObject:v12 atIndex:0];
      [*(id *)(*(void *)(a1 + 32) + 8) removeObjectAtIndex:0];

      ++v9;
    }
    while (v9 != v5);
    *(void *)&xmmword_1EB265718 = v10;
    *((void *)&xmmword_1EB265718 + 1) = v29;
    if (_UIUpdateCycleDebugTracingCheck && _UIUpdateCycleDebugTracingCheck())
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventBus", &qword_1EB262F10);
      v21 = *(id *)(CategoryCachedImpl + 8);
      os_signpost_id_t v22 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), *(const void **)(a1 + 32));
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v23 = v22;
        if (os_signpost_enabled(v21))
        {
          memset(v32, 0, sizeof(v32));
          v24 = _UIMachTimeDebugDescriptionCopyCStr(v3, 0, (char *)v32, 0x30uLL);
          memset(v31, 0, sizeof(v31));
          v25 = _UIMachTimeDebugDescriptionCopyCStr(v11, v3, (char *)v31, 0x30uLL);
          memset(v30, 0, sizeof(v30));
          v26 = _UIMachTimeDebugDescriptionCopyCStr(v10, v3, (char *)v30, 0x30uLL);
          int v27 = [*(id *)(*(void *)(a1 + 32) + 8) count];
          *(_DWORD *)buf = 136316162;
          unint64_t v34 = (unint64_t)v24;
          __int16 v35 = 2080;
          v36 = v25;
          __int16 v37 = 2080;
          v38 = v26;
          __int16 v39 = 1024;
          int v40 = v5;
          __int16 v41 = 1024;
          int v42 = v27;
          _os_signpost_emit_with_name_impl(&dword_1853B0000, v21, OS_SIGNPOST_EVENT, v23, "DrainEvents", "modelTime=%s, minEventTime=%s, maxEventTime=%s, drained=%u, remaining=%u", buf, 0x2Cu);
        }
      }
    }
  }
}

void __19___UIEventBus_init__block_invoke(uint64_t a1)
{
  v2 = [_UIUpdateHIDInput alloc];
  if (v2)
  {
    v14.receiver = v2;
    v14.super_class = (Class)_UIUpdateHIDInput;
    unint64_t v3 = (char *)objc_msgSendSuper2(&v14, sel_init);
    if (v3)
    {
      uint64_t v4 = objc_opt_new();
      unint64_t v5 = (void *)*((void *)v3 + 13);
      *((void *)v3 + 13) = v4;

      *((_DWORD *)v3 + 2) = 0;
      *((_OWORD *)v3 + 1) = xmmword_186B91E40;
      *((_DWORD *)v3 + 8) = 0;
      *(_OWORD *)(v3 + 40) = 0u;
      *(_OWORD *)(v3 + 56) = 0u;
      *(_OWORD *)(v3 + 72) = 0u;
      *((void *)v3 + 11) = 0;
      *((void *)v3 + 12) = "HIDEvent";
      _UIUpdateInputSetAddInput((uint64_t)&commonSet, (void *)v3 + 1);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v3;

  uint64_t v8 = +[_UIUpdateHIDDigitizerInput inputWithProfileName:]((uint64_t)_UIUpdateHIDDigitizerInput, "Touch");
  uint64_t v9 = *(void *)(a1 + 32);
  unint64_t v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v8;

  uint64_t v11 = +[_UIUpdateHIDDigitizerInput inputWithProfileName:]((uint64_t)_UIUpdateHIDDigitizerInput, "Pencil");
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v11;
}

void __25___UIEventBus_addEvents___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "addObject:", v7, (void)v9);
        uint64_t v8 = -[_UIEventBus inputForEvent:](*(void **)(a1 + 40), v7);
        [v8 addEvent:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __23___UIEventBus_instance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB262F00;
  qword_1EB262F00 = v0;
}

@end