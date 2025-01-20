@interface OBLogFile
@end

@implementation OBLogFile

uint64_t ___OBLogFile_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_OBLogFile_dateFormatter;
  _OBLogFile_dateFormatter = v0;

  [(id)_OBLogFile_dateFormatter setDateStyle:1];
  v2 = (void *)_OBLogFile_dateFormatter;
  return [v2 setTimeStyle:1];
}

@end