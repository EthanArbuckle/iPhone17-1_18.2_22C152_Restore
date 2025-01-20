@interface MTPodcast(NSSortDescriptor)
+ (id)sortDescriptorsForAllPodcasts;
+ (id)sortDescriptorsForDateAddedAscending:()NSSortDescriptor;
+ (id)sortDescriptorsForFirstTimeAvailableAscending:()NSSortDescriptor;
+ (id)sortDescriptorsForLastDatePlayed;
+ (id)sortDescriptorsForManualOrder;
+ (id)sortDescriptorsForRecentlyUnfollowed;
+ (id)sortDescriptorsForRecentlyUpdatedAscending:()NSSortDescriptor;
+ (id)sortDescriptorsForSortType:()NSSortDescriptor;
+ (id)sortDescriptorsForTitle:()NSSortDescriptor;
@end

@implementation MTPodcast(NSSortDescriptor)

+ (id)sortDescriptorsForSortType:()NSSortDescriptor
{
  switch(a3)
  {
    case 0:
      v3 = [MEMORY[0x263F5EA08] sortDescriptorsForManualOrder];
      break;
    case 1:
      v4 = (void *)MEMORY[0x263F5EA08];
      uint64_t v5 = 0;
      goto LABEL_5;
    case 2:
      v4 = (void *)MEMORY[0x263F5EA08];
      uint64_t v5 = 1;
LABEL_5:
      v3 = [v4 sortDescriptorsForDateAddedAscending:v5];
      break;
    case 4:
      v6 = (void *)MEMORY[0x263F5EA08];
      uint64_t v7 = 0;
      goto LABEL_8;
    case 5:
      v8 = (void *)MEMORY[0x263F5EA08];
      uint64_t v9 = 0;
      goto LABEL_12;
    case 6:
      v8 = (void *)MEMORY[0x263F5EA08];
      uint64_t v9 = 1;
LABEL_12:
      v3 = [v8 sortDescriptorsForFirstTimeAvailableAscending:v9];
      break;
    case 7:
      v3 = [MEMORY[0x263F5EA08] sortDescriptorsForRecentlyUnfollowed];
      break;
    default:
      v6 = (void *)MEMORY[0x263F5EA08];
      uint64_t v7 = 1;
LABEL_8:
      v3 = [v6 sortDescriptorsForTitle:v7];
      break;
  }
  return v3;
}

+ (id)sortDescriptorsForManualOrder
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5ED00] ascending:0];
  v4[0] = v0;
  v1 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5ED08] ascending:0];
  v4[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)sortDescriptorsForAllPodcasts
{
  v0 = +[MTShowsPreferencesDataStore sharedInstance];
  v1 = [v0 sortDescriptors];

  return v1;
}

+ (id)sortDescriptorsForLastDatePlayed
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5ECB8] ascending:0];
  v3[0] = v0;
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];

  return v1;
}

+ (id)sortDescriptorsForRecentlyUpdatedAscending:()NSSortDescriptor
{
  v7[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EC90] ascending:a3];
  v7[0] = v3;
  v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5ED10] ascending:0 selector:sel_localizedStandardCompare_];
  v7[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)sortDescriptorsForFirstTimeAvailableAscending:()NSSortDescriptor
{
  v7[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5ECC8] ascending:a3];
  v7[0] = v3;
  v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5ED10] ascending:0 selector:sel_localizedStandardCompare_];
  v7[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)sortDescriptorsForDateAddedAscending:()NSSortDescriptor
{
  v7[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EC48] ascending:a3];
  v7[0] = v3;
  v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5ED10] ascending:0 selector:sel_localizedStandardCompare_];
  v7[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)sortDescriptorsForRecentlyUnfollowed
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB88] ascending:0];
  v4[0] = v0;
  v1 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5ED10] ascending:0 selector:sel_localizedStandardCompare_];
  v4[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)sortDescriptorsForTitle:()NSSortDescriptor
{
  v7[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5ED10] ascending:a3 selector:sel_localizedStandardCompare_];
  v7[0] = v3;
  v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5ED28] ascending:0];
  v7[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

@end