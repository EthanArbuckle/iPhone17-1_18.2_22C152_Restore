@interface UVFSVolumeAnalytics
- (BOOL)isDCIM;
- (NSString)fsTypeName;
- (NSString)volumeLoadErrorReason;
- (int)volumeCount;
- (int)volumeLoadStatus;
- (void)setFsTypeName:(id)a3;
- (void)setIsDCIM:(BOOL)a3;
- (void)setVolumeCount:(int)a3;
- (void)setVolumeLoadErrorReason:(id)a3;
- (void)setVolumeLoadStatus:(int)a3;
@end

@implementation UVFSVolumeAnalytics

- (NSString)fsTypeName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFsTypeName:(id)a3
{
}

- (int)volumeCount
{
  return self->_volumeCount;
}

- (void)setVolumeCount:(int)a3
{
  self->_volumeCount = a3;
}

- (BOOL)isDCIM
{
  return self->_isDCIM;
}

- (void)setIsDCIM:(BOOL)a3
{
  self->_isDCIM = a3;
}

- (int)volumeLoadStatus
{
  return self->_volumeLoadStatus;
}

- (void)setVolumeLoadStatus:(int)a3
{
  self->_volumeLoadStatus = a3;
}

- (NSString)volumeLoadErrorReason
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVolumeLoadErrorReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeLoadErrorReason, 0);

  objc_storeStrong((id *)&self->_fsTypeName, 0);
}

@end