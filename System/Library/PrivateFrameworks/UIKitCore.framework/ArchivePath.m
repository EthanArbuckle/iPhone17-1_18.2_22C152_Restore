@interface ArchivePath
@end

@implementation ArchivePath

void ___ArchivePath_block_invoke()
{
  v0 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v1 = [v0 objectAtIndex:0];
  _UIMainBundleIdentifier();
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(__CFString *)v2 length])
  {

    v2 = @"com.apple";
  }
  v3 = [NSString stringWithFormat:@"%@.%@", v2, @"settings"];
  uint64_t v4 = [v1 stringByAppendingPathComponent:v3];
  v5 = (void *)_MergedGlobals_1298;
  _MergedGlobals_1298 = v4;

  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  char v7 = [v6 createDirectoryAtPath:_MergedGlobals_1298 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v8 = v14;

  if ((v7 & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v10 = [v9 fileExistsAtPath:_MergedGlobals_1298];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = _MergedGlobals_1298;
      v12 = [v8 localizedDescription];
      NSLog(&cfstr_ErrorCreatingS_0.isa, v11, v12);

      v13 = (void *)_MergedGlobals_1298;
      _MergedGlobals_1298 = 0;
    }
  }
}

@end