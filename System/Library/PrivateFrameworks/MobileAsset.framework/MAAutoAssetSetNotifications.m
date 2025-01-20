@interface MAAutoAssetSetNotifications
+ (BOOL)supportsSecureCoding;
+ (id)notifyRegistrationName:(id)a3;
+ (id)notifyRegistrationName:(id)a3 forAssetSetIdentifier:(id)a4;
- (BOOL)atomicInstanceAvailableForUse;
- (BOOL)atomicInstanceDiscovered;
- (BOOL)atomicInstancePurged;
- (BOOL)downloadAbandoned;
- (BOOL)downloadPending;
- (BOOL)downloadProgress;
- (BOOL)downloadedBecameIncomplete;
- (BOOL)filesystemSpaceCritical;
- (BOOL)lockUsageCheck;
- (MAAutoAssetSetNotifications)init;
- (MAAutoAssetSetNotifications)initWithCoder:(id)a3;
- (id)copy;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAtomicInstanceAvailableForUse:(BOOL)a3;
- (void)setAtomicInstanceDiscovered:(BOOL)a3;
- (void)setAtomicInstancePurged:(BOOL)a3;
- (void)setDownloadAbandoned:(BOOL)a3;
- (void)setDownloadPending:(BOOL)a3;
- (void)setDownloadProgress:(BOOL)a3;
- (void)setDownloadedBecameIncomplete:(BOOL)a3;
- (void)setFilesystemSpaceCritical:(BOOL)a3;
- (void)setLockUsageCheck:(BOOL)a3;
@end

@implementation MAAutoAssetSetNotifications

- (MAAutoAssetSetNotifications)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MAAutoAssetSetNotifications;
  v5 = [(MAAutoAssetSetNotifications *)&v7 init];
  if (v5)
  {
    v5->_atomicInstanceDiscovered = [v4 decodeBoolForKey:@"atomicInstanceDiscovered"];
    v5->_atomicInstanceAvailableForUse = [v4 decodeBoolForKey:@"atomicInstanceAvailableForUse"];
    v5->_lockUsageCheck = [v4 decodeBoolForKey:@"lockUsageCheck"];
    v5->_filesystemSpaceCritical = [v4 decodeBoolForKey:@"filesystemSpaceCritical"];
    v5->_atomicInstancePurged = [v4 decodeBoolForKey:@"atomicInstancePurged"];
    v5->_downloadPending = [v4 decodeBoolForKey:@"downloadPending"];
    v5->_downloadProgress = [v4 decodeBoolForKey:@"downloadProgress"];
    v5->_downloadAbandoned = [v4 decodeBoolForKey:@"downloadAbandoned"];
    v5->_downloadedBecameIncomplete = [v4 decodeBoolForKey:@"downloadedBecameIncomplete"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MAAutoAssetSetNotifications)init
{
  v3.receiver = self;
  v3.super_class = (Class)MAAutoAssetSetNotifications;
  result = [(MAAutoAssetSetNotifications *)&v3 init];
  if (result)
  {
    result->_downloadedBecameIncomplete = 0;
    *(void *)&result->_atomicInstanceDiscovered = 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications atomicInstanceDiscovered](self, "atomicInstanceDiscovered"), @"atomicInstanceDiscovered");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications atomicInstanceAvailableForUse](self, "atomicInstanceAvailableForUse"), @"atomicInstanceAvailableForUse");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications lockUsageCheck](self, "lockUsageCheck"), @"lockUsageCheck");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"), @"filesystemSpaceCritical");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications atomicInstancePurged](self, "atomicInstancePurged"), @"atomicInstancePurged");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications downloadPending](self, "downloadPending"), @"downloadPending");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications downloadProgress](self, "downloadProgress"), @"downloadProgress");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications downloadAbandoned](self, "downloadAbandoned"), @"downloadAbandoned");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications downloadedBecameIncomplete](self, "downloadedBecameIncomplete"), @"downloadedBecameIncomplete");
}

- (id)copy
{
  objc_super v3 = objc_alloc_init(MAAutoAssetSetNotifications);
  [(MAAutoAssetSetNotifications *)v3 setAtomicInstanceDiscovered:[(MAAutoAssetSetNotifications *)self atomicInstanceDiscovered]];
  [(MAAutoAssetSetNotifications *)v3 setAtomicInstanceAvailableForUse:[(MAAutoAssetSetNotifications *)self atomicInstanceAvailableForUse]];
  [(MAAutoAssetSetNotifications *)v3 setLockUsageCheck:[(MAAutoAssetSetNotifications *)self lockUsageCheck]];
  [(MAAutoAssetSetNotifications *)v3 setFilesystemSpaceCritical:[(MAAutoAssetSetNotifications *)self filesystemSpaceCritical]];
  [(MAAutoAssetSetNotifications *)v3 setAtomicInstancePurged:[(MAAutoAssetSetNotifications *)self atomicInstancePurged]];
  [(MAAutoAssetSetNotifications *)v3 setDownloadPending:[(MAAutoAssetSetNotifications *)self downloadPending]];
  [(MAAutoAssetSetNotifications *)v3 setDownloadProgress:[(MAAutoAssetSetNotifications *)self downloadProgress]];
  [(MAAutoAssetSetNotifications *)v3 setDownloadAbandoned:[(MAAutoAssetSetNotifications *)self downloadAbandoned]];
  [(MAAutoAssetSetNotifications *)v3 setDownloadedBecameIncomplete:[(MAAutoAssetSetNotifications *)self downloadedBecameIncomplete]];
  return v3;
}

- (id)summary
{
  v14 = NSString;
  if ([(MAAutoAssetSetNotifications *)self atomicInstanceDiscovered]) {
    objc_super v3 = @"Y";
  }
  else {
    objc_super v3 = @"N";
  }
  v13 = v3;
  if ([(MAAutoAssetSetNotifications *)self atomicInstanceAvailableForUse]) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  if ([(MAAutoAssetSetNotifications *)self lockUsageCheck]) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  if ([(MAAutoAssetSetNotifications *)self filesystemSpaceCritical]) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  if ([(MAAutoAssetSetNotifications *)self atomicInstancePurged]) {
    objc_super v7 = @"Y";
  }
  else {
    objc_super v7 = @"N";
  }
  if ([(MAAutoAssetSetNotifications *)self downloadPending]) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  if ([(MAAutoAssetSetNotifications *)self downloadProgress]) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  if ([(MAAutoAssetSetNotifications *)self downloadAbandoned]) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  if ([(MAAutoAssetSetNotifications *)self downloadedBecameIncomplete]) {
    v11 = @"Y";
  }
  else {
    v11 = @"N";
  }
  return (id)[v14 stringWithFormat:@"discovered:%@|availableForUse:%@|lockUsageCheck:%@|filesystemSpaceCritical:%@|purged:%@|downloadPending:%@|downloadProgress:%@|downloadAbandoned:%@|downloadBecameIncomplete:%@", v13, v4, v5, v6, v7, v8, v9, v10, v11];
}

+ (id)notifyRegistrationName:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@%@", @"com.apple.MobileAsset.AutoAssetAtomicNotification", @"^", a3];
}

+ (id)notifyRegistrationName:(id)a3 forAssetSetIdentifier:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@%@%@%@%@", @"com.apple.MobileAsset.AutoAssetAtomicNotification", @"^", a4, @"^", a3];
}

- (BOOL)atomicInstanceDiscovered
{
  return self->_atomicInstanceDiscovered;
}

- (void)setAtomicInstanceDiscovered:(BOOL)a3
{
  self->_atomicInstanceDiscovered = a3;
}

- (BOOL)atomicInstanceAvailableForUse
{
  return self->_atomicInstanceAvailableForUse;
}

- (void)setAtomicInstanceAvailableForUse:(BOOL)a3
{
  self->_atomicInstanceAvailableForUse = a3;
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

- (BOOL)atomicInstancePurged
{
  return self->_atomicInstancePurged;
}

- (void)setAtomicInstancePurged:(BOOL)a3
{
  self->_atomicInstancePurged = a3;
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

- (BOOL)downloadedBecameIncomplete
{
  return self->_downloadedBecameIncomplete;
}

- (void)setDownloadedBecameIncomplete:(BOOL)a3
{
  self->_downloadedBecameIncomplete = a3;
}

@end