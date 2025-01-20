@interface SetLastSeenUnreadToBeforeMostRecentActivities
@end

@implementation SetLastSeenUnreadToBeforeMostRecentActivities

uint64_t ___SetLastSeenUnreadToBeforeMostRecentActivities_block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v1 = objc_msgSend(v0, "px_standardLibrarySpecificFetchOptions");
  [v1 setFetchLimit:20];
  v2 = +[PXSharedAlbumsActivityEntry fetchRecentActivitiesWithOptions:v1 olderThanDate:0 filter:2];
  v3 = [v2 lastObject];
  v4 = [v3 date];

  if (v4) {
    PXSetSharedAlbumsActivityLastSeenDateToDate(v4);
  }

  return 1;
}

@end