@interface NSObject(NUUtilities)
+ (uint64_t)nu_implementsProtocol:()NUUtilities;
@end

@implementation NSObject(NUUtilities)

+ (uint64_t)nu_implementsProtocol:()NUUtilities
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v8 = NUAssertLogger_27470();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "protocol != nil");
      *(_DWORD *)buf = 138543362;
      v26 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_27470();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v26 = v15;
        __int16 v27 = 2114;
        v28 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v26 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NSObject(NUUtilities) nu_implementsProtocol:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUUtilities.m", 94, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"protocol != nil");
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__NSObject_NUUtilities__nu_implementsProtocol___block_invoke;
  v24[3] = &__block_descriptor_40_e42_B24__0__objc_method_description____8B16B20l;
  v24[4] = a1;
  v5 = (Protocol *)v4;
  uint64_t v6 = 0;
  if (NUProtocolEnumerateMethods(v5, 1, 0, v24))
  {
    if (NUProtocolEnumerateMethods(v5, 1, 1, v24))
    {
      uint64_t v6 = 0;
      if (NUProtocolEnumerateMethods(v5, 0, 0, v24)) {
        uint64_t v6 = NUProtocolEnumerateMethods(v5, 0, 1, v24);
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

@end