@interface MBBooksPlugin
- (id)_standardizePath:(id)a3 fromDomain:(id)a4;
- (id)startingBackupWithEngine:(id)a3;
- (void)_populatePathsForEngine:(id)a3 domainName:(id)a4;
@end

@implementation MBBooksPlugin

- (id)_standardizePath:(id)a3 fromDomain:(id)a4
{
  id v7 = [a3 stringByStandardizingPath];
  if (![v7 isAbsolutePath]) {
    return v7;
  }
  if ((objc_msgSend(v7, "hasPrefix:", objc_msgSend(a4, "rootPath")) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBBooksPlugin.m", 23, @"Absolute path doesn't have domain root %@ as prefix: %@", [a4 rootPath], v7);
  }
  v8 = (char *)[a4 rootPath].length + 1;

  return [v7 substringFromIndex:v8];
}

- (void)_populatePathsForEngine:(id)a3 domainName:(id)a4
{
  id v5 = [[[a3 domainManager] domainForName:a4];
  id v6 = (id)objc_opt_new();
  if ((objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isEnterpriseBookBackupAllowed") & 1) == 0)
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Managed books backup disallowed. Excluding from backup.", v8, 2u);
      _MBLog();
    }
    [v6 addObject:-[MBBooksPlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", @"/var/mobile/Media/Books/Managed", v5)];
  }
  if ([v5 relativePathsNotToBackup]) {
    [v6 unionSet:[v5 relativePathsNotToBackup]];
  }
  [v5 setRelativePathsNotToBackup:v6];
}

- (id)startingBackupWithEngine:(id)a3
{
  if ([a3 backsUpPrimaryAccount]) {
    [(MBBooksPlugin *)self _populatePathsForEngine:a3 domainName:@"BooksDomain"];
  }
  return 0;
}

@end