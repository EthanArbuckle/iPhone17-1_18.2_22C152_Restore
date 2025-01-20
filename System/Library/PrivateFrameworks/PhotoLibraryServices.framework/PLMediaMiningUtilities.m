@interface PLMediaMiningUtilities
+ (id)sortDescriptorsForSortingItemsByTime;
@end

@implementation PLMediaMiningUtilities

+ (id)sortDescriptorsForSortingItemsByTime
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"pl_startDate" ascending:1];
  v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"pl_endDate", 1, v2);
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"pl_numberOfAssets" ascending:1];
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

@end