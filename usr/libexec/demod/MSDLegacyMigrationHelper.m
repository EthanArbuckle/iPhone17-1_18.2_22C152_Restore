@interface MSDLegacyMigrationHelper
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getLastMigrationVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getSkyEquivalentVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getSydneyEquivalentVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastMigrationVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)skyEquivalentVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)sydneyEquivalentVersion;
- (BOOL)doPreSkyMigration;
- (BOOL)doPreSydneyMigration;
- (BOOL)getDoMigrationForTargetRelease:(id *)a3;
- (BOOL)isVersion:(id *)a3 lowerThan:(id *)a4;
- (MSDLegacyMigrationHelper)init;
- (NSString)osVersionStr;
- (id)stringFromNSOperatingSystemVersion:(id *)a3;
- (void)saveOSVerionAfterMigration;
- (void)setCurrentOSVersion:(id *)a3;
- (void)setDoPreSkyMigration:(BOOL)a3;
- (void)setDoPreSydneyMigration:(BOOL)a3;
- (void)setLastMigrationVersion:(id *)a3;
- (void)setOsVersionStr:(id)a3;
- (void)setSkyEquivalentVersion:(id *)a3;
- (void)setSydneyEquivalentVersion:(id *)a3;
@end

@implementation MSDLegacyMigrationHelper

- (MSDLegacyMigrationHelper)init
{
  v28.receiver = self;
  v28.super_class = (Class)MSDLegacyMigrationHelper;
  v2 = [(MSDLegacyMigrationHelper *)&v28 init];
  v3 = v2;
  if (v2)
  {
    [(MSDLegacyMigrationHelper *)v2 getSkyEquivalentVersion];
    long long v24 = v26;
    uint64_t v25 = v27;
    [(MSDLegacyMigrationHelper *)v3 setSkyEquivalentVersion:&v24];
    [(MSDLegacyMigrationHelper *)v3 getSydneyEquivalentVersion];
    long long v20 = v22;
    uint64_t v21 = v23;
    [(MSDLegacyMigrationHelper *)v3 setSydneyEquivalentVersion:&v20];
    [(MSDLegacyMigrationHelper *)v3 getLastMigrationVersion];
    long long v16 = v18;
    uint64_t v17 = v19;
    [(MSDLegacyMigrationHelper *)v3 setLastMigrationVersion:&v16];
    v4 = +[NSProcessInfo processInfo];
    v5 = v4;
    if (v4)
    {
      [v4 operatingSystemVersion];
    }
    else
    {
      long long v14 = 0uLL;
      uint64_t v15 = 0;
    }
    long long v12 = v14;
    uint64_t v13 = v15;
    [(MSDLegacyMigrationHelper *)v3 setCurrentOSVersion:&v12];

    [(MSDLegacyMigrationHelper *)v3 skyEquivalentVersion];
    [(MSDLegacyMigrationHelper *)v3 setDoPreSkyMigration:[(MSDLegacyMigrationHelper *)v3 getDoMigrationForTargetRelease:v11]];
    [(MSDLegacyMigrationHelper *)v3 sydneyEquivalentVersion];
    [(MSDLegacyMigrationHelper *)v3 setDoPreSydneyMigration:[(MSDLegacyMigrationHelper *)v3 getDoMigrationForTargetRelease:v10]];
    [(MSDLegacyMigrationHelper *)v3 currentOSVersion];
    v6 = [(MSDLegacyMigrationHelper *)v3 stringFromNSOperatingSystemVersion:v9];
    [(MSDLegacyMigrationHelper *)v3 setOsVersionStr:v6];

    v7 = v3;
  }

  return v3;
}

- (void)saveOSVerionAfterMigration
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MSDLegacyMigrationHelper *)self osVersionStr];
    int v7 = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Saving last migration OS version: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  v5 = +[MSDPreferencesFile sharedInstance];
  v6 = [(MSDLegacyMigrationHelper *)self osVersionStr];
  [v5 setObject:v6 forKey:@"LastMigrationVersion"];
}

- (id)stringFromNSOperatingSystemVersion:(id *)a3
{
  return +[NSString stringWithFormat:@"%td.%td.%td", a3->var0, a3->var1, a3->var2];
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getSkyEquivalentVersion
{
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 15;
  return self;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getSydneyEquivalentVersion
{
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 16;
  return self;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getLastMigrationVersion
{
  retstr->var1 = -1;
  retstr->var2 = -1;
  retstr->var0 = -1;
  v4 = +[MSDPreferencesFile sharedInstance];
  v5 = [v4 objectForKey:@"LastMigrationVersion"];

  if (v5)
  {
    v6 = [v5 componentsSeparatedByString:@"."];
    int v7 = v6;
    if (v6 && [v6 count] == (id)3)
    {
      v8 = [v7 objectAtIndexedSubscript:0];
      retstr->var0 = (int64_t)[v8 integerValue];

      v9 = [v7 objectAtIndexedSubscript:1];
      retstr->var1 = (int64_t)[v9 integerValue];

      v10 = [v7 objectAtIndexedSubscript:2];
      retstr->var2 = (int64_t)[v10 integerValue];
    }
    else
    {
      uint64_t v13 = sub_100068600();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000DA9B0((uint64_t)v5, v13);
      }
    }
  }
  else
  {
    int v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000DA96C(v7);
    }
  }

  v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    uint64_t v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Last migration OS version: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  return result;
}

- (BOOL)getDoMigrationForTargetRelease:(id *)a3
{
  $9FE6E10C8CE45DBC9A88DFDEA39A390D buf = *a3;
  v5 = [(MSDLegacyMigrationHelper *)self stringFromNSOperatingSystemVersion:&buf];
  [(MSDLegacyMigrationHelper *)self lastMigrationVersion];
  if (v9[3] == -1)
  {
    BOOL v6 = 1;
  }
  else
  {
    [(MSDLegacyMigrationHelper *)self lastMigrationVersion];
    $9FE6E10C8CE45DBC9A88DFDEA39A390D buf = *a3;
    BOOL v6 = [(MSDLegacyMigrationHelper *)self isVersion:v9 lowerThan:&buf];
  }
  int v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.var0) = 138543618;
    *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v5;
    WORD2(buf.var1) = 1026;
    *(_DWORD *)((char *)&buf.var1 + 6) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Need legacy migration for target OS release (%{public}@): %{public, BOOL}d", (uint8_t *)&buf, 0x12u);
  }

  return v6;
}

- (BOOL)isVersion:(id *)a3 lowerThan:(id *)a4
{
  BOOL v4 = a3->var0 < a4->var0;
  if (a3->var0 == a4->var0)
  {
    int64_t var1 = a3->var1;
    int64_t v6 = a4->var1;
    BOOL v4 = var1 < v6;
    if (var1 == v6) {
      return a3->var2 < a4->var2;
    }
  }
  return v4;
}

- (BOOL)doPreSkyMigration
{
  return self->_doPreSkyMigration;
}

- (void)setDoPreSkyMigration:(BOOL)a3
{
  self->_doPreSkyMigration = a3;
}

- (BOOL)doPreSydneyMigration
{
  return self->_doPreSydneyMigration;
}

- (void)setDoPreSydneyMigration:(BOOL)a3
{
  self->_doPreSydneyMigration = a3;
}

- (NSString)osVersionStr
{
  return self->_osVersionStr;
}

- (void)setOsVersionStr:(id)a3
{
  self->_osVersionStr = (NSString *)a3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)skyEquivalentVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[1];
  return self;
}

- (void)setSkyEquivalentVersion:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_skyEquivalentVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_skyEquivalentVersion.majorVersion = v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)sydneyEquivalentVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[2];
  return self;
}

- (void)setSydneyEquivalentVersion:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_sydneyEquivalentVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_sydneyEquivalentVersion.majorVersion = v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastMigrationVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[3];
  return self;
}

- (void)setLastMigrationVersion:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastMigrationVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_lastMigrationVersion.majorVersion = v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[4];
  return self;
}

- (void)setCurrentOSVersion:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_currentOSVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_currentOSVersion.majorVersion = v3;
}

@end