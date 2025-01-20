@interface MIWatchKitAppSnapshot
- (BOOL)createSnapshotWithError:(id *)a3;
- (BOOL)identifierLocked;
- (BOOL)onlyV1;
- (BOOL)placeholderOnly;
- (MIWatchKitAppSnapshot)initWithBundleID:(id)a3 snapshotTo:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6;
- (NSDictionary)resultDict;
- (NSString)bundleID;
- (NSString)watchKitAppBundleID;
- (NSURL)destURL;
- (unint64_t)diskUsage;
- (void)dealloc;
- (void)setDiskUsage:(unint64_t)a3;
- (void)setIdentifierLocked:(BOOL)a3;
- (void)setResultDict:(id)a3;
- (void)setWatchKitAppBundleID:(id)a3;
@end

@implementation MIWatchKitAppSnapshot

- (MIWatchKitAppSnapshot)initWithBundleID:(id)a3 snapshotTo:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MIWatchKitAppSnapshot;
  v13 = [(MIWatchKitAppSnapshot *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_bundleID, a3);
    v14->_onlyV1 = a5;
    v14->_placeholderOnly = a6;
    objc_storeStrong((id *)&v14->_destURL, a4);
    v14->_identifierLocked = 0;
  }

  return v14;
}

- (void)dealloc
{
  if ([(MIWatchKitAppSnapshot *)self identifierLocked])
  {
    v3 = [(MIWatchKitAppSnapshot *)self bundleID];
    sub_1000550D8(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIWatchKitAppSnapshot;
  [(MIWatchKitAppSnapshot *)&v4 dealloc];
}

- (BOOL)createSnapshotWithError:(id *)a3
{
  v5 = [(MIWatchKitAppSnapshot *)self bundleID];
  sub_100054F80(v5);

  [(MIWatchKitAppSnapshot *)self setIdentifierLocked:1];
  v6 = +[MIHelperServiceClient sharedInstance];
  v7 = [(MIWatchKitAppSnapshot *)self bundleID];
  v8 = [(MIWatchKitAppSnapshot *)self destURL];
  id v13 = 0;
  v9 = [v6 createAppSnapshotWithBundleID:v7 snapshotToURL:v8 onlyV1AppIfPresent:-[MIWatchKitAppSnapshot onlyV1](self, "onlyV1") placeholderOnly:-[MIWatchKitAppSnapshot placeholderOnly](self, "placeholderOnly") withError:&v13];
  id v10 = v13;

  id v11 = [(MIWatchKitAppSnapshot *)self bundleID];
  sub_1000550D8(v11);

  [(MIWatchKitAppSnapshot *)self setIdentifierLocked:0];
  if (v9)
  {
    [(MIWatchKitAppSnapshot *)self setResultDict:v9];
  }
  else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    MOLogWrite();
  }
  if (a3 && v10) {
    *a3 = v10;
  }

  return v9 != 0;
}

- (NSDictionary)resultDict
{
  return self->_resultDict;
}

- (void)setResultDict:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)watchKitAppBundleID
{
  return self->_watchKitAppBundleID;
}

- (void)setWatchKitAppBundleID:(id)a3
{
}

- (BOOL)onlyV1
{
  return self->_onlyV1;
}

- (BOOL)placeholderOnly
{
  return self->_placeholderOnly;
}

- (NSURL)destURL
{
  return self->_destURL;
}

- (unint64_t)diskUsage
{
  return self->_diskUsage;
}

- (void)setDiskUsage:(unint64_t)a3
{
  self->_diskUsage = a3;
}

- (BOOL)identifierLocked
{
  return self->_identifierLocked;
}

- (void)setIdentifierLocked:(BOOL)a3
{
  self->_identifierLocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destURL, 0);
  objc_storeStrong((id *)&self->_watchKitAppBundleID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_resultDict, 0);
}

@end