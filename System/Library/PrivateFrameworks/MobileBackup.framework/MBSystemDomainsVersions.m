@interface MBSystemDomainsVersions
- (MBSystemDomainsVersions)init;
- (MBSystemDomainsVersions)initWithDefaultSystemDomainsPlist;
- (MBSystemDomainsVersions)initWithVersion:(double)a3 minSupportedVersion:(double)a4 maxSupportedVersion:(double)a5;
- (double)maxSupportedVersion;
- (double)minSupportedVersion;
- (double)version;
- (void)setMaxSupportedVersion:(double)a3;
- (void)setMinSupportedVersion:(double)a3;
- (void)setVersion:(double)a3;
@end

@implementation MBSystemDomainsVersions

- (MBSystemDomainsVersions)init
{
  v8.receiver = self;
  v8.super_class = (Class)MBSystemDomainsVersions;
  result = [(MBSystemDomainsVersions *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_version = _Q0;
    result->_maxSupportedVersion = 2.0;
  }
  return result;
}

- (MBSystemDomainsVersions)initWithVersion:(double)a3 minSupportedVersion:(double)a4 maxSupportedVersion:(double)a5
{
  result = [(MBSystemDomainsVersions *)self init];
  if (result)
  {
    result->_version = a3;
    result->_minSupportedVersion = a4;
    result->_maxSupportedVersion = a5;
  }
  return result;
}

- (MBSystemDomainsVersions)initWithDefaultSystemDomainsPlist
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = [(MBSystemDomainsVersions *)self init];
  if (!v2) {
    return v2;
  }
  v3 = (void *)MEMORY[0x1E01C2AA0]();
  v4 = _systemDomainsPlistPath();
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v4;
    _os_log_impl(&dword_1DD9AE000, v5, OS_LOG_TYPE_DEFAULT, "Loading system domains versions from %{public}@", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"Loading system domains versions from %{public}@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }

  v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
  id v33 = 0;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v12 error:&v33];
  id v14 = v33;
  if (!v13)
  {
    v30 = [[MBException alloc] initWithCode:11, @"Error loading system domains from %@: %@", v4, v14 format];
    goto LABEL_12;
  }
  v15 = [v13 objectForKeyedSubscript:@"SystemDomains"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [[MBException alloc] initWithCode:11, @"SystemDomains value not a dictionary", v31, v32 format];
LABEL_12:
    objc_exception_throw(v30);
  }
  +[MBDomain doubleFromStringValueForKey:@"Version" plist:v13];
  v2->_double version = v16;
  +[MBDomain doubleFromStringValueForKey:@"MinSupportedVersion" plist:v13];
  v2->_double minSupportedVersion = v17;
  +[MBDomain doubleFromStringValueForKey:@"MaxSupportedVersion" plist:v13];
  v2->_double maxSupportedVersion = v18;
  v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    double version = v2->_version;
    double minSupportedVersion = v2->_minSupportedVersion;
    double maxSupportedVersion = v2->_maxSupportedVersion;
    *(_DWORD *)buf = 138544130;
    v35 = v4;
    __int16 v36 = 2048;
    double v37 = version;
    __int16 v38 = 2048;
    double v39 = minSupportedVersion;
    __int16 v40 = 2048;
    double v41 = maxSupportedVersion;
    _os_log_impl(&dword_1DD9AE000, v19, OS_LOG_TYPE_DEFAULT, "Loaded system domains versions from %{public}@: (%.1f,%.1f,%.1f)", buf, 0x2Au);
    _MBLog(@"DEFAULT", (uint64_t)"Loaded system domains versions from %{public}@: (%.1f,%.1f,%.1f)", v23, v24, v25, v26, v27, v28, (uint64_t)v4);
  }

  return v2;
}

- (double)version
{
  return self->_version;
}

- (void)setVersion:(double)a3
{
  self->_double version = a3;
}

- (double)minSupportedVersion
{
  return self->_minSupportedVersion;
}

- (void)setMinSupportedVersion:(double)a3
{
  self->_double minSupportedVersion = a3;
}

- (double)maxSupportedVersion
{
  return self->_maxSupportedVersion;
}

- (void)setMaxSupportedVersion:(double)a3
{
  self->_double maxSupportedVersion = a3;
}

@end