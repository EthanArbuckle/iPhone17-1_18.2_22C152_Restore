@interface NTKCachedComplicationSnapshotPath
@end

@implementation NTKCachedComplicationSnapshotPath

void ___NTKCachedComplicationSnapshotPath_block_invoke()
{
  BSCurrentUserDirectory();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v4 stringByAppendingPathComponent:@"/Library/Caches"];
  v1 = [v0 stringByAppendingPathComponent:@"NanoTimeKit"];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Complications"];
  v3 = (void *)_NTKCachedComplicationSnapshotPath_snapshotPath;
  _NTKCachedComplicationSnapshotPath_snapshotPath = v2;
}

@end