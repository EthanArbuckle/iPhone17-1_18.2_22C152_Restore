@interface PCCancelAllProcessWakesOperation
- (void)main;
@end

@implementation PCCancelAllProcessWakesOperation

- (void)main
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  IOPMAssertionID AssertionID = 0;
  unint64_t v2 = 0x1EB4D0000uLL;
  unint64_t v3 = 0x1E4F29000uLL;
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"schedulingwake-PCCancelAllProcessWakesOperation(%p)", self);
  v5 = +[PCPersistentIdentifiers processNamePidAndStringIdentifier:v4];

  IOReturn v6 = IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, v5, &AssertionID);
  if (v6)
  {
    int v7 = v6;
    v8 = +[PCLog wakeManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      [(PCScheduleSystemWakeOperation *)v7 main];
    }
  }
  CFArrayRef v9 = IOPMCopyScheduledPowerEvents();
  if (v9)
  {
    CFArrayRef v10 = v9;
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == CFArrayGetTypeID())
    {
      CFArrayRef v27 = v10;
      v28 = v5;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      CFArrayRef v12 = v10;
      uint64_t v13 = [(__CFArray *)v12 countByEnumeratingWithState:&v30 objects:v41 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v18 = [v17 objectForKey:@"eventtype"];
            v19 = [v17 objectForKey:@"scheduledby"];
            if ([(__CFString *)v18 isEqual:@"wake"])
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ([(id)(v2 + 1472) pidFromMatchingIdentifer:v19] & 0x80000000) == 0)
              {
                CFArrayRef v20 = v12;
                unint64_t v21 = v3;
                CFDateRef v22 = [v17 objectForKey:@"time"];
                if (v22)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    IOReturn v23 = IOPMCancelScheduledPowerEvent(v22, v19, v18);
                    v24 = +[PCLog wakeManager];
                    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
                    if (v23)
                    {
                      if (v25)
                      {
                        v29 = PCStringFromDate(v22);
                        *(_DWORD *)buf = 138412802;
                        v36 = v19;
                        __int16 v37 = 2112;
                        v38 = v29;
                        __int16 v39 = 1024;
                        IOReturn v40 = v23;
                        _os_log_impl(&dword_1D340D000, v24, OS_LOG_TYPE_DEFAULT, "Unable to unschedule orphaned wake with identifier '%@' and date [%@]. IOPMCancelScheduledPowerEvent() returned: %i", buf, 0x1Cu);
                      }
                    }
                    else if (v25)
                    {
                      v26 = PCStringFromDate(v22);
                      *(_DWORD *)buf = 138412546;
                      v36 = v19;
                      __int16 v37 = 2112;
                      v38 = v26;
                      _os_log_impl(&dword_1D340D000, v24, OS_LOG_TYPE_DEFAULT, "Unscheduled orphaned wake with identifier '%@' and date [%@]", buf, 0x16u);
                    }
                    unint64_t v2 = 0x1EB4D0000;
                  }
                }

                unint64_t v3 = v21;
                CFArrayRef v12 = v20;
              }
            }
          }
          uint64_t v14 = [(__CFArray *)v12 countByEnumeratingWithState:&v30 objects:v41 count:16];
        }
        while (v14);
      }

      CFArrayRef v10 = v27;
      v5 = v28;
    }
    CFRelease(v10);
  }
  IOPMAssertionRelease(AssertionID);
}

@end