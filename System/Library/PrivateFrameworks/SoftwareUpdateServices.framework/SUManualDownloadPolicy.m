@interface SUManualDownloadPolicy
- (BOOL)hasEnoughDiskSpace;
- (BOOL)isDownloadAllowableForCellular;
- (BOOL)isDownloadAllowableForCellular2G;
- (BOOL)isDownloadAllowableForCellularRoaming;
- (BOOL)isDownloadAllowableForWiFi;
- (BOOL)isDownloadFreeForCellular;
- (BOOL)isDownloadable;
- (BOOL)isPowerRequired;
- (BOOL)superIsDownloadable;
- (Class)class;
- (Class)fakeClass;
- (SUManualDownloadPolicy)init;
- (void)setDownloadAllowableForCellular2G:(BOOL)a3;
- (void)setDownloadAllowableForCellular:(BOOL)a3;
- (void)setDownloadAllowableForCellularRoaming:(BOOL)a3;
- (void)setDownloadAllowableForWiFi:(BOOL)a3;
- (void)setDownloadFreeForCellular:(BOOL)a3;
- (void)setDownloadable:(BOOL)a3;
- (void)setFakeClass:(Class)a3;
- (void)setHasEnoughDiskSpace:(BOOL)a3;
- (void)setPowerRequired:(BOOL)a3;
@end

@implementation SUManualDownloadPolicy

- (SUManualDownloadPolicy)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUManualDownloadPolicy;
  v2 = [(SUManualDownloadPolicy *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(SUManualDownloadPolicy *)v2 setDownloadable:1];
    uint64_t v4 = objc_opt_class();
    Class fakeClass = v3->_fakeClass;
    v3->_Class fakeClass = (Class)v4;
  }
  return v3;
}

- (BOOL)superIsDownloadable
{
  v3.receiver = self;
  v3.super_class = (Class)SUManualDownloadPolicy;
  return [(SUDefaultDownloadPolicy *)&v3 isDownloadable];
}

- (Class)class
{
  return self->_fakeClass;
}

- (Class)fakeClass
{
  return self->_fakeClass;
}

- (void)setFakeClass:(Class)a3
{
}

- (BOOL)isDownloadable
{
  return self->_downloadable;
}

- (void)setDownloadable:(BOOL)a3
{
  self->_downloadable = a3;
}

- (BOOL)hasEnoughDiskSpace
{
  return self->_hasEnoughDiskSpace;
}

- (void)setHasEnoughDiskSpace:(BOOL)a3
{
  self->_hasEnoughDiskSpace = a3;
}

- (BOOL)isPowerRequired
{
  return self->_powerRequired;
}

- (void)setPowerRequired:(BOOL)a3
{
  self->_powerRequired = a3;
}

- (BOOL)isDownloadFreeForCellular
{
  return self->_downloadFreeForCellular;
}

- (void)setDownloadFreeForCellular:(BOOL)a3
{
  self->_downloadFreeForCellular = a3;
}

- (BOOL)isDownloadAllowableForCellular
{
  return self->_downloadAllowableForCellular;
}

- (void)setDownloadAllowableForCellular:(BOOL)a3
{
  self->_downloadAllowableForCellular = a3;
}

- (BOOL)isDownloadAllowableForCellular2G
{
  return self->_downloadAllowableForCellular2G;
}

- (void)setDownloadAllowableForCellular2G:(BOOL)a3
{
  self->_downloadAllowableForCellular2G = a3;
}

- (BOOL)isDownloadAllowableForCellularRoaming
{
  return self->_downloadAllowableForCellularRoaming;
}

- (void)setDownloadAllowableForCellularRoaming:(BOOL)a3
{
  self->_downloadAllowableForCellularRoaming = a3;
}

- (BOOL)isDownloadAllowableForWiFi
{
  return self->_downloadAllowableForWiFi;
}

- (void)setDownloadAllowableForWiFi:(BOOL)a3
{
  self->_downloadAllowableForWiFi = a3;
}

- (void).cxx_destruct
{
}

@end