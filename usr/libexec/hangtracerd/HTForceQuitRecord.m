@interface HTForceQuitRecord
- (BOOL)isHang;
- (NSDate)calendarTime;
- (NSString)bundleId;
- (NSString)executablePath;
- (NSString)filePath;
- (int)pid;
- (unint64_t)absoluteTime;
- (unint64_t)expirationMSec;
- (void)setAbsoluteTime:(unint64_t)a3;
- (void)setBundleId:(id)a3;
- (void)setCalendarTime:(id)a3;
- (void)setExecutablePath:(id)a3;
- (void)setExpirationMSec:(unint64_t)a3;
- (void)setFilePath:(id)a3;
- (void)setIsHang:(BOOL)a3;
- (void)setPid:(int)a3;
@end

@implementation HTForceQuitRecord

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (void)setExecutablePath:(id)a3
{
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (unint64_t)absoluteTime
{
  return self->_absoluteTime;
}

- (void)setAbsoluteTime:(unint64_t)a3
{
  self->_absoluteTime = a3;
}

- (NSDate)calendarTime
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCalendarTime:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)isHang
{
  return self->_isHang;
}

- (void)setIsHang:(BOOL)a3
{
  self->_isHang = a3;
}

- (unint64_t)expirationMSec
{
  return self->_expirationMSec;
}

- (void)setExpirationMSec:(unint64_t)a3
{
  self->_expirationMSec = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarTime, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end