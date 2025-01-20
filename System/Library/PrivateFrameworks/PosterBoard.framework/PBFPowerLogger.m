@interface PBFPowerLogger
+ (signed)powerLogClientIdentifier;
+ (void)logUpdate:(int64_t)a3 reason:(int64_t)a4;
+ (void)logUpdate:(int64_t)a3 reason:(int64_t)a4 inServiceOfBundleIdentifier:(id)a5;
@end

@implementation PBFPowerLogger

+ (signed)powerLogClientIdentifier
{
  return 135;
}

+ (void)logUpdate:(int64_t)a3 reason:(int64_t)a4
{
}

+ (void)logUpdate:(int64_t)a3 reason:(int64_t)a4 inServiceOfBundleIdentifier:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (v9)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[PBFPowerLogger logUpdate:reason:inServiceOfBundleIdentifier:](a2, (uint64_t)a1, (uint64_t)v20);
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D322EC2CLL);
    }
  }

  v10 = objc_opt_new();
  v11 = [NSNumber numberWithInteger:a3];
  [v10 setObject:v11 forKeyedSubscript:@"updateType"];

  v12 = [NSNumber numberWithInteger:a4];
  [v10 setObject:v12 forKeyedSubscript:@"Reason"];

  if (![v9 length])
  {
    v13 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v14 = [v13 bundleIdentifier];

    id v9 = (id)v14;
  }
  [v10 setObject:v9 forKeyedSubscript:@"BundleID"];
  v15 = PBFLogPower();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 3) {
      v16 = @"PBFPowerLogUpdateTypeStaticDescriptors";
    }
    else {
      v16 = off_1E6982898[a3 - 1];
    }
    if ((unint64_t)(a4 - 1) > 5) {
      v17 = @"PBFPowerLogReasonUserViewed";
    }
    else {
      v17 = off_1E69828B8[a4 - 1];
    }
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v26 = v9;
    _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "logUpdate:%{public}@ reason:%{public}@ inServiceOfBundleIdentifier:%@", buf, 0x20u);
  }

  uint64_t v18 = [a1 powerLogClientIdentifier];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  v19 = (void (*)(uint64_t, __CFString *, void *, void))getPLLogRegisteredEventSymbolLoc_ptr;
  v24 = getPLLogRegisteredEventSymbolLoc_ptr;
  if (!getPLLogRegisteredEventSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPLLogRegisteredEventSymbolLoc_block_invoke;
    v26 = &unk_1E6980C98;
    v27 = &v21;
    __getPLLogRegisteredEventSymbolLoc_block_invoke((uint64_t)buf);
    v19 = (void (*)(uint64_t, __CFString *, void *, void))v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v19) {
    +[PBFPowerLogger logUpdate:reason:inServiceOfBundleIdentifier:]();
  }
  v19(v18, @"PosterUpdates", v10, 0);
}

+ (void)logUpdate:reason:inServiceOfBundleIdentifier:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void Soft_PLLogRegisteredEvent(PLClientID, CFStringRef, CFDictionaryRef, CFArrayRef)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBFPowerLogger.m", 39, @"%s", dlerror());

  __break(1u);
}

+ (void)logUpdate:(const char *)a1 reason:(uint64_t)a2 inServiceOfBundleIdentifier:(uint64_t)a3 .cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"PBFPowerLogger.m";
  __int16 v16 = 1024;
  int v17 = 73;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end