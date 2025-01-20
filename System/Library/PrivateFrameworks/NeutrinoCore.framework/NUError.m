@interface NUError
+ (id)canceledError:(id)a3 object:(id)a4;
+ (id)duplicateError:(id)a3 object:(id)a4;
+ (id)errorWithCode:(int64_t)a3 reason:(id)a4 object:(id)a5;
+ (id)errorWithCode:(int64_t)a3 reason:(id)a4 object:(id)a5 underlyingError:(id)a6;
+ (id)extraError:(id)a3 object:(id)a4;
+ (id)failureError:(id)a3 object:(id)a4;
+ (id)invalidError:(id)a3 object:(id)a4;
+ (id)mismatchError:(id)a3 object:(id)a4;
+ (id)missingError:(id)a3 object:(id)a4;
+ (id)notFoundError:(id)a3 object:(id)a4;
+ (id)rangeError:(id)a3 object:(id)a4;
+ (id)resourceUnavailableError:(id)a3 object:(id)a4;
+ (id)rootError:(id)a3;
+ (id)skippedError:(id)a3 object:(id)a4;
+ (id)timeoutError:(id)a3 object:(id)a4;
+ (id)underlyingError:(id)a3;
+ (id)unknownError:(id)a3 object:(id)a4;
+ (id)unsupportedError:(id)a3 object:(id)a4;
- (NSString)nonLocalizedFailureReason;
- (id)description;
- (id)descriptionWithIndent:(int64_t)a3;
- (id)errorCodeDescription;
- (id)invalidObject;
- (id)replacementObjectForCoder:(id)a3;
@end

@implementation NUError

+ (id)errorWithCode:(int64_t)a3 reason:(id)a4 object:(id)a5 underlyingError:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    v18 = NUAssertLogger_13139();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "reason != nil");
      *(_DWORD *)buf = 138543362;
      v35 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_13139();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v35 = v25;
        __int16 v36 = 2114;
        v37 = v29;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v35 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUError errorWithCode:reason:object:underlyingError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUError.m", 118, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"reason != nil");
  }
  v13 = v12;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v14 setObject:v10 forKeyedSubscript:@"NUNonLocalizedFailureReason"];
  v15 = [v11 description];
  [v14 setObject:v15 forKeyedSubscript:@"NURelatedObject"];

  [v14 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  v16 = (void *)[objc_alloc((Class)a1) initWithDomain:@"NUError" code:a3 userInfo:v14];

  return v16;
}

+ (id)errorWithCode:(int64_t)a3 reason:(id)a4 object:(id)a5
{
  return (id)[a1 errorWithCode:a3 reason:a4 object:a5 underlyingError:0];
}

+ (id)notFoundError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:14 reason:a3 object:a4];
}

+ (id)skippedError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:13 reason:a3 object:a4];
}

+ (id)resourceUnavailableError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:12 reason:a3 object:a4];
}

+ (id)timeoutError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:11 reason:a3 object:a4];
}

+ (id)canceledError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:10 reason:a3 object:a4];
}

+ (id)unsupportedError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:9 reason:a3 object:a4];
}

+ (id)duplicateError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:8 reason:a3 object:a4];
}

+ (id)unknownError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:7 reason:a3 object:a4];
}

+ (id)rangeError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:6 reason:a3 object:a4];
}

+ (id)mismatchError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:5 reason:a3 object:a4];
}

+ (id)extraError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:4 reason:a3 object:a4];
}

+ (id)missingError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:3 reason:a3 object:a4];
}

+ (id)invalidError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:2 reason:a3 object:a4];
}

+ (id)failureError:(id)a3 object:(id)a4
{
  return (id)[a1 errorWithCode:1 reason:a3 object:a4];
}

+ (id)rootError:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  uint64_t v5 = *MEMORY[0x1E4F28A50];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  if (v6)
  {
    do
    {
      v7 = (void *)v6;

      v4 = [v7 userInfo];
      uint64_t v6 = [v4 objectForKeyedSubscript:v5];
      id v3 = v7;
    }
    while (v6);
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

+ (id)underlyingError:(id)a3
{
  id v3 = [a3 userInfo];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  return v4;
}

- (id)replacementObjectForCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = [(NUError *)self domain];
  uint64_t v6 = [(NUError *)self code];
  v7 = [(NUError *)self userInfo];
  v8 = [v4 errorWithDomain:v5 code:v6 userInfo:v7];

  return v8;
}

- (id)invalidObject
{
  v2 = [(NUError *)self userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"NURelatedObject"];

  return v3;
}

- (NSString)nonLocalizedFailureReason
{
  v2 = [(NUError *)self userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"NUNonLocalizedFailureReason"];

  return (NSString *)v3;
}

- (id)errorCodeDescription
{
  uint64_t v2 = [(NUError *)self code];
  if ((unint64_t)(v2 - 1) > 0xD) {
    return @"Unknown";
  }
  else {
    return off_1E5D94A00[v2 - 1];
  }
}

- (id)descriptionWithIndent:(int64_t)a3
{
  uint64_t v5 = NSString;
  uint64_t v6 = [(NUError *)self domain];
  uint64_t v7 = [(NUError *)self code];
  v8 = [(NUError *)self errorCodeDescription];
  v9 = [(NUError *)self nonLocalizedFailureReason];
  id v10 = [(NUError *)self invalidObject];
  id v11 = [v10 description];
  id v12 = [v5 stringWithFormat:@"%*sError Domain=%@ Code=%d (%@) Reason=%@ Object=%@", a3, "", v6, v7, v8, v9, v11];

  v13 = [(NUError *)self userInfo];
  id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (v14)
  {
    v15 = [v14 descriptionWithIndent:a3 + 1];
    v16 = [v15 stringByAppendingFormat:@"\n%@", v12];

    if (a3)
    {
      id v12 = v16;
    }
    else
    {
      v17 = NSString;
      v18 = [(NUError *)self nonLocalizedFailureReason];
      id v12 = [v17 stringWithFormat:@"ParentReason=%@\n%@", v18, v16];
    }
  }

  return v12;
}

- (id)description
{
  return [(NUError *)self descriptionWithIndent:0];
}

@end