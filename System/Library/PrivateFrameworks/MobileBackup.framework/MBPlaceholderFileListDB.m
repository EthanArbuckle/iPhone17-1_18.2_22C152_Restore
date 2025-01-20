@interface MBPlaceholderFileListDB
+ (id)openOrCreatePlaceholderFileListIn:(id)a3 commitID:(id)a4 error:(id *)a5;
- (BOOL)enumerateAppPlaceholderDomains:(id *)a3 block:(id)a4;
- (BOOL)enumerateDomainDependencies:(id *)a3 block:(id)a4;
- (BOOL)enumerateDomainList:(id *)a3 block:(id)a4;
- (BOOL)updateDomainListWithServerDomainHMACs:(id)a3 domainsInCurrentSnapshot:(id)a4 systemAppsInCurrentSnapshot:(id)a5 modifiedDomainDependencies:(id)a6 hmacKey:(id)a7 error:(id *)a8;
- (id)dateOfLastDomainListUpdate:(id *)a3;
@end

@implementation MBPlaceholderFileListDB

+ (id)openOrCreatePlaceholderFileListIn:(id)a3 commitID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  v11 = MBFileListDBPath(v8, (uint64_t)v9, @"PlaceholderDomain");
  id v12 = [(MBFileListDB *)[MBPlaceholderFileListDB alloc] _initWithPath:v11 domainName:@"PlaceholderDomain"];
  if ([v12 _openOrCreateWithError:a5]) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  double v14 = CFAbsoluteTimeGetCurrent();
  v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = a1;
    __int16 v19 = 2048;
    double v20 = v14 - Current;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Opened %@ as PlaceholderFileList in %.3fs", buf, 0x16u);
    _MBLog();
  }

  return v13;
}

- (id)dateOfLastDomainListUpdate:(id *)a3
{
  id v10 = 0;
  unsigned int v3 = [(MBFileListDB *)self _fetchPropertyValue:&v10 forKey:@"domainListUpdateDate" error:a3];
  id v4 = v10;
  v5 = v4;
  v6 = 0;
  if (v3)
  {
    if (v4)
    {
      double v9 = 0.0;
      [v4 getBytes:&v9 length:8];
      double v7 = v9;
    }
    else
    {
      double v7 = 0.0;
    }
    v6 = +[NSDate dateWithTimeIntervalSince1970:v7];
  }

  return v6;
}

- (BOOL)updateDomainListWithServerDomainHMACs:(id)a3 domainsInCurrentSnapshot:(id)a4 systemAppsInCurrentSnapshot:(id)a5 modifiedDomainDependencies:(id)a6 hmacKey:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  __int16 v19 = [(MBFileListDB *)self db];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1002465C0;
  v26[3] = &unk_100417090;
  id v27 = v14;
  id v28 = v15;
  id v29 = v18;
  id v30 = v16;
  id v31 = v17;
  v32 = self;
  id v20 = v17;
  id v21 = v16;
  id v22 = v18;
  id v23 = v15;
  id v24 = v14;
  LOBYTE(a8) = [v19 groupInTransaction:v26 error:a8];

  return (char)a8;
}

- (BOOL)enumerateDomainList:(id *)a3 block:(id)a4
{
  id v6 = a4;
  double v7 = [(MBFileListDB *)self db];
  id v8 = [v7 fetch:@"SELECT domain, domainHMAC, isSystemApp FROM CumulativeDomainList"];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100246C44;
  v11[3] = &unk_100413728;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a3) = [v8 enumerateWithError:a3 block:v11];

  return (char)a3;
}

- (BOOL)enumerateDomainDependencies:(id *)a3 block:(id)a4
{
  id v6 = a4;
  double v7 = [(MBFileListDB *)self db];
  id v8 = [v7 fetch:@"SELECT Parent.domain, Child.domain FROM CumulativeDomainList AS Parent  JOIN DomainDependencies ON DomainDependencies.parentDomainID = Parent.domainID JOIN CumulativeDomainList AS Child ON DomainDependencies.childDomainID = Child.domainID"];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100246DC0;
  v11[3] = &unk_100413728;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a3) = [v8 enumerateWithError:a3 block:v11];

  return (char)a3;
}

- (BOOL)enumerateAppPlaceholderDomains:(id *)a3 block:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100246EFC;
  v8[3] = &unk_1004170B8;
  id v9 = a4;
  id v6 = v9;
  LOBYTE(a3) = [(MBFileListDB *)self enumerateFileMetadataWithError:a3 block:v8];

  return (char)a3;
}

@end