@interface MAAutoAssetNotifications
+ (BOOL)supportsSecureCoding;
+ (id)notifyRegistrationName:(id)a3 forAssetType:(id)a4;
+ (id)notifyRegistrationName:(id)a3 forAssetType:(id)a4 forAssetSpecifier:(id)a5;
- (BOOL)assetPurged;
- (BOOL)checkForNewerFailure;
- (BOOL)contentAvailableForUse;
- (BOOL)contentVersionRevoked;
- (BOOL)downloadAbandoned;
- (BOOL)downloadPending;
- (BOOL)downloadProgress;
- (BOOL)filesystemSpaceCritical;
- (BOOL)lockUsageCheck;
- (BOOL)newerVersionDiscovered;
- (MAAutoAssetNotifications)init;
- (MAAutoAssetNotifications)initWithCoder:(id)a3;
- (id)copy;
- (id)newSummaryDictionary;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetPurged:(BOOL)a3;
- (void)setCheckForNewerFailure:(BOOL)a3;
- (void)setContentAvailableForUse:(BOOL)a3;
- (void)setContentVersionRevoked:(BOOL)a3;
- (void)setDownloadAbandoned:(BOOL)a3;
- (void)setDownloadPending:(BOOL)a3;
- (void)setDownloadProgress:(BOOL)a3;
- (void)setFilesystemSpaceCritical:(BOOL)a3;
- (void)setLockUsageCheck:(BOOL)a3;
- (void)setNewerVersionDiscovered:(BOOL)a3;
@end

@implementation MAAutoAssetNotifications

+ (id)notifyRegistrationName:(id)a3 forAssetType:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@%@%@%@%@", @"com.apple.MobileAsset.AutoAssetNotification", @"^", a4, @"^", a3];
}

- (MAAutoAssetNotifications)init
{
  v3.receiver = self;
  v3.super_class = (Class)MAAutoAssetNotifications;
  result = [(MAAutoAssetNotifications *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_downloadProgress = 0;
    *(void *)&result->_newerVersionDiscovered = 0;
  }
  return result;
}

- (MAAutoAssetNotifications)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MAAutoAssetNotifications;
  v5 = [(MAAutoAssetNotifications *)&v7 init];
  if (v5)
  {
    v5->_newerVersionDiscovered = [v4 decodeBoolForKey:@"newerVersionDiscovered"];
    v5->_checkForNewerFailure = [v4 decodeBoolForKey:@"checkForNewerFailure"];
    v5->_contentAvailableForUse = [v4 decodeBoolForKey:@"contentAvailableForUse"];
    v5->_contentVersionRevoked = [v4 decodeBoolForKey:@"contentVersionRevoked"];
    v5->_lockUsageCheck = [v4 decodeBoolForKey:@"lockUsageCheck"];
    v5->_filesystemSpaceCritical = [v4 decodeBoolForKey:@"filesystemSpaceCritical"];
    v5->_assetPurged = [v4 decodeBoolForKey:@"assetPurged"];
    v5->_downloadPending = [v4 decodeBoolForKey:@"downloadPending"];
    v5->_downloadProgress = [v4 decodeBoolForKey:@"downloadProgress"];
    v5->_downloadAbandoned = [v4 decodeBoolForKey:@"downloadAbandoned"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications newerVersionDiscovered](self, "newerVersionDiscovered"), @"newerVersionDiscovered");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications checkForNewerFailure](self, "checkForNewerFailure"), @"checkForNewerFailure");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications contentAvailableForUse](self, "contentAvailableForUse"), @"contentAvailableForUse");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications contentVersionRevoked](self, "contentVersionRevoked"), @"contentVersionRevoked");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications lockUsageCheck](self, "lockUsageCheck"), @"lockUsageCheck");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"), @"filesystemSpaceCritical");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications assetPurged](self, "assetPurged"), @"assetPurged");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications downloadPending](self, "downloadPending"), @"downloadPending");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications downloadProgress](self, "downloadProgress"), @"downloadProgress");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications downloadAbandoned](self, "downloadAbandoned"), @"downloadAbandoned");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  objc_super v3 = objc_alloc_init(MAAutoAssetNotifications);
  [(MAAutoAssetNotifications *)v3 setNewerVersionDiscovered:[(MAAutoAssetNotifications *)self newerVersionDiscovered]];
  [(MAAutoAssetNotifications *)v3 setCheckForNewerFailure:[(MAAutoAssetNotifications *)self checkForNewerFailure]];
  [(MAAutoAssetNotifications *)v3 setContentAvailableForUse:[(MAAutoAssetNotifications *)self contentAvailableForUse]];
  [(MAAutoAssetNotifications *)v3 setContentVersionRevoked:[(MAAutoAssetNotifications *)self contentVersionRevoked]];
  [(MAAutoAssetNotifications *)v3 setLockUsageCheck:[(MAAutoAssetNotifications *)self lockUsageCheck]];
  [(MAAutoAssetNotifications *)v3 setFilesystemSpaceCritical:[(MAAutoAssetNotifications *)self filesystemSpaceCritical]];
  [(MAAutoAssetNotifications *)v3 setAssetPurged:[(MAAutoAssetNotifications *)self assetPurged]];
  [(MAAutoAssetNotifications *)v3 setDownloadPending:[(MAAutoAssetNotifications *)self downloadPending]];
  [(MAAutoAssetNotifications *)v3 setDownloadProgress:[(MAAutoAssetNotifications *)self downloadProgress]];
  [(MAAutoAssetNotifications *)v3 setDownloadAbandoned:[(MAAutoAssetNotifications *)self downloadAbandoned]];
  return v3;
}

- (id)summary
{
  v16 = NSString;
  if ([(MAAutoAssetNotifications *)self newerVersionDiscovered]) {
    objc_super v3 = @"Y";
  }
  else {
    objc_super v3 = @"N";
  }
  v15 = v3;
  if ([(MAAutoAssetNotifications *)self checkForNewerFailure]) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  v14 = v4;
  if ([(MAAutoAssetNotifications *)self contentAvailableForUse]) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  if ([(MAAutoAssetNotifications *)self contentVersionRevoked]) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  if ([(MAAutoAssetNotifications *)self lockUsageCheck]) {
    objc_super v7 = @"Y";
  }
  else {
    objc_super v7 = @"N";
  }
  if ([(MAAutoAssetNotifications *)self filesystemSpaceCritical]) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  if ([(MAAutoAssetNotifications *)self assetPurged]) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  if ([(MAAutoAssetNotifications *)self downloadPending]) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  if ([(MAAutoAssetNotifications *)self downloadProgress]) {
    v11 = @"Y";
  }
  else {
    v11 = @"N";
  }
  if ([(MAAutoAssetNotifications *)self downloadAbandoned]) {
    v12 = @"Y";
  }
  else {
    v12 = @"N";
  }
  return (id)[v16 stringWithFormat:@"discovered:%@|checkFail:%@|avail:%@|revoked:%@|usageCheck:%@|spaceCritical:%@|purged:%@|pending:%@|progress:%@|abandoned:%@", v15, v14, v5, v6, v7, v8, v9, v10, v11, v12];
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(MAAutoAssetNotifications *)self newerVersionDiscovered]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 setSafeObject:v4 forKey:@"newerVersionDiscovered"];
  if ([(MAAutoAssetNotifications *)self checkForNewerFailure]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 setSafeObject:v5 forKey:@"checkForNewerFailure"];
  if ([(MAAutoAssetNotifications *)self contentAvailableForUse]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 setSafeObject:v6 forKey:@"contentAvailableForUse"];
  if ([(MAAutoAssetNotifications *)self contentVersionRevoked]) {
    objc_super v7 = @"YES";
  }
  else {
    objc_super v7 = @"NO";
  }
  [v3 setSafeObject:v7 forKey:@"contentVersionRevoked"];
  if ([(MAAutoAssetNotifications *)self lockUsageCheck]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v3 setSafeObject:v8 forKey:@"lockUsageCheck"];
  if ([(MAAutoAssetNotifications *)self filesystemSpaceCritical]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v3 setSafeObject:v9 forKey:@"filesystemSpaceCritical"];
  if ([(MAAutoAssetNotifications *)self assetPurged]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v3 setSafeObject:v10 forKey:@"assetPurged"];
  if ([(MAAutoAssetNotifications *)self downloadPending]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  [v3 setSafeObject:v11 forKey:@"downloadPending"];
  if ([(MAAutoAssetNotifications *)self downloadProgress]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  [v3 setSafeObject:v12 forKey:@"downloadProgress"];
  if ([(MAAutoAssetNotifications *)self downloadAbandoned]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v3 setSafeObject:v13 forKey:@"downloadAbandoned"];
  return v3;
}

+ (id)notifyRegistrationName:(id)a3 forAssetType:(id)a4 forAssetSpecifier:(id)a5
{
  return (id)[NSString stringWithFormat:@"%@%@%@%@%@%@%@", @"com.apple.MobileAsset.AutoAssetNotification", @"^", a4, @"^", a5, @"^", a3];
}

- (BOOL)newerVersionDiscovered
{
  return self->_newerVersionDiscovered;
}

- (void)setNewerVersionDiscovered:(BOOL)a3
{
  self->_newerVersionDiscovered = a3;
}

- (BOOL)checkForNewerFailure
{
  return self->_checkForNewerFailure;
}

- (void)setCheckForNewerFailure:(BOOL)a3
{
  self->_checkForNewerFailure = a3;
}

- (BOOL)contentAvailableForUse
{
  return self->_contentAvailableForUse;
}

- (void)setContentAvailableForUse:(BOOL)a3
{
  self->_contentAvailableForUse = a3;
}

- (BOOL)contentVersionRevoked
{
  return self->_contentVersionRevoked;
}

- (void)setContentVersionRevoked:(BOOL)a3
{
  self->_contentVersionRevoked = a3;
}

- (BOOL)lockUsageCheck
{
  return self->_lockUsageCheck;
}

- (void)setLockUsageCheck:(BOOL)a3
{
  self->_lockUsageCheck = a3;
}

- (BOOL)filesystemSpaceCritical
{
  return self->_filesystemSpaceCritical;
}

- (void)setFilesystemSpaceCritical:(BOOL)a3
{
  self->_filesystemSpaceCritical = a3;
}

- (BOOL)assetPurged
{
  return self->_assetPurged;
}

- (void)setAssetPurged:(BOOL)a3
{
  self->_assetPurged = a3;
}

- (BOOL)downloadPending
{
  return self->_downloadPending;
}

- (void)setDownloadPending:(BOOL)a3
{
  self->_downloadPending = a3;
}

- (BOOL)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(BOOL)a3
{
  self->_downloadProgress = a3;
}

- (BOOL)downloadAbandoned
{
  return self->_downloadAbandoned;
}

- (void)setDownloadAbandoned:(BOOL)a3
{
  self->_downloadAbandoned = a3;
}

@end