@interface PTCinematographyDetection(Serialization)
@end

@implementation PTCinematographyDetection(Serialization)

+ (void)_detectionsFromInnerAtomStream:()Serialization .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "error reading detection from container", v1, 2u);
}

@end