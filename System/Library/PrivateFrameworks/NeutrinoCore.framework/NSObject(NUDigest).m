@interface NSObject(NUDigest)
- (id)nu_digest;
- (void)nu_updateDigest:()NUDigest;
@end

@implementation NSObject(NUDigest)

- (id)nu_digest
{
  v2 = objc_alloc_init(NUDigest);
  objc_msgSend(a1, "nu_updateDigest:", v2);
  v3 = [(NUDigest *)v2 stringValue];

  return v3;
}

- (void)nu_updateDigest:()NUDigest
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CGColorSpaceGetTypeID())
  {
    uint64_t MD5Digest = CGColorSpaceGetMD5Digest();
    [v30 addString:@"CGColorSpace<"];
    [v30 addBytes:MD5Digest length:16];
    [v30 addString:@">"];
  }
  else
  {
    CFTypeID v6 = CFGetTypeID(a1);
    if (v6 != CGImageMetadataGetTypeID())
    {
      v9 = NUAssertLogger_369();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = NSString;
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = [v10 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v12];
        *(_DWORD *)buf = 138543362;
        v32 = v13;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v15 = NUAssertLogger_369();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v16)
        {
          v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v20 = (void *)MEMORY[0x1E4F29060];
          id v21 = v19;
          v22 = [v20 callStackSymbols];
          v23 = [v22 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v32 = v19;
          __int16 v33 = 2114;
          v34 = v23;
          _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v16)
      {
        v17 = [MEMORY[0x1E4F29060] callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v32 = v18;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      _NUAssertFailHandler((uint64_t)"-[NSObject(NUDigest) nu_updateDigest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUDigest.m", 119, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v26, v27, v28, v29, v25);
    }
    CFDataRef XMPData = CGImageMetadataCreateXMPData((CGImageMetadataRef)a1, 0);
    [v30 addString:@"CGImageMetadata<"];
    CFDataRef v8 = XMPData;
    objc_msgSend(v30, "addBytes:length:", -[__CFData bytes](v8, "bytes"), -[__CFData length](v8, "length"));
    [v30 addString:@">"];
  }
}

@end