@interface VUIMediaEntitiesDataSourceFactory
+ (id)_dataSourceForShelfType:(int64_t)a3 withLibrary:(id)a4 withOwnerIdentifier:(id)a5;
+ (id)_fetchRequestForGenre:(id)a3;
+ (id)dataSourceForCategoryType:(int64_t)a3;
+ (id)dataSourceForCategoryType:(int64_t)a3 withFamilyMember:(id)a4;
+ (id)dataSourceForCategoryType:(int64_t)a3 withLibrary:(id)a4;
+ (id)dataSourceForCategoryType:(int64_t)a3 withLibrary:(id)a4 withOwnerIdentifier:(id)a5;
+ (id)dataSourceForFetchRequest:(id)a3 withLibrary:(id)a4;
+ (id)dataSourceForGenre:(id)a3 withFamilyMember:(id)a4;
+ (id)dataSourceForGenre:(id)a3 withLibrary:(id)a4;
+ (id)dataSourceForShelf:(int64_t)a3 withFamilyMember:(id)a4;
+ (id)dataSourceForShelf:(int64_t)a3 withLibrary:(id)a4;
+ (id)episodesDataSourceForSeasonIdentifier:(id)a3 showIdentifier:(id)a4 withFamilyMember:(id)a5;
+ (id)episodesDataSourceForShowIdentifier:(id)a3 withFamilyMember:(id)a4;
+ (id)seasonsDataSourceForSeasonIdentifier:(id)a3 showIdentifier:(id)a4 withFamilyMember:(id)a5;
+ (id)seasonsDataSourceForShowIdentifier:(id)a3 withFamilyMember:(id)a4;
@end

@implementation VUIMediaEntitiesDataSourceFactory

+ (id)dataSourceForCategoryType:(int64_t)a3
{
  v5 = +[VUIMediaLibraryManager defaultManager];
  v6 = [v5 deviceMediaLibrary];
  v7 = [a1 dataSourceForCategoryType:a3 withLibrary:v6 withOwnerIdentifier:0];

  return v7;
}

+ (id)dataSourceForFetchRequest:(id)a3 withLibrary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[VUIMPMediaEntitiesDataSource alloc] initWithMediaLibrary:v5 fetchRequest:v6];

  return v7;
}

+ (id)seasonsDataSourceForShowIdentifier:(id)a3 withFamilyMember:(id)a4
{
  id v5 = a3;
  id v6 = [a4 memberIdentifier];
  v7 = [v6 stringValue];

  v8 = +[VUIMediaAPIRequestFactory seasonsRequestWithShowIdentifier:v5 withOwnerIdentifier:v7];

  v9 = [[VUIFamilySharingMediaEntitiesDataSource alloc] initWithNSURLRequest:v8];
  [(VUIFamilySharingMediaEntitiesDataSource *)v9 setShouldCoalesceEpisodesToSeasons:1];

  return v9;
}

+ (id)episodesDataSourceForShowIdentifier:(id)a3 withFamilyMember:(id)a4
{
  id v5 = a3;
  id v6 = [a4 memberIdentifier];
  v7 = [v6 stringValue];

  v8 = +[VUIMediaAPIRequestFactory episodesRequestWithShowIdentifier:v5 withOwnerIdentifier:v7];

  v9 = [[VUIFamilySharingMediaEntitiesDataSource alloc] initWithNSURLRequest:v8];
  [(VUIFamilySharingMediaEntitiesDataSource *)v9 setShouldGroupBySeason:1];
  [(VUIFamilySharingMediaEntitiesDataSource *)v9 setOrderEpisodesByEpisodeNumber:1];

  return v9;
}

+ (id)seasonsDataSourceForSeasonIdentifier:(id)a3 showIdentifier:(id)a4 withFamilyMember:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [a5 memberIdentifier];
  v10 = [v9 stringValue];

  v11 = +[VUIMediaAPIRequestFactory seasonsRequestWithShowIdentifier:v7 withOwnerIdentifier:v10];

  v12 = [[VUIFamilySharingMediaEntitiesDataSource alloc] initWithNSURLRequest:v11];
  [(VUIFamilySharingMediaEntitiesDataSource *)v12 setShouldCoalesceEpisodesToSeasons:1];
  [(VUIFamilySharingMediaEntitiesDataSource *)v12 setSeasonIdentifierFilter:v8];

  return v12;
}

+ (id)episodesDataSourceForSeasonIdentifier:(id)a3 showIdentifier:(id)a4 withFamilyMember:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [a5 memberIdentifier];
  v10 = [v9 stringValue];

  v11 = +[VUIMediaAPIRequestFactory episodesRequestWithShowIdentifier:v7 withOwnerIdentifier:v10];

  v12 = [[VUIFamilySharingMediaEntitiesDataSource alloc] initWithNSURLRequest:v11];
  [(VUIFamilySharingMediaEntitiesDataSource *)v12 setShouldGroupBySeason:1];
  [(VUIFamilySharingMediaEntitiesDataSource *)v12 setOrderEpisodesByEpisodeNumber:1];
  [(VUIFamilySharingMediaEntitiesDataSource *)v12 setSeasonIdentifierFilter:v8];

  return v12;
}

+ (id)dataSourceForCategoryType:(int64_t)a3 withFamilyMember:(id)a4
{
  if (a4)
  {
    id v5 = [a4 memberIdentifier];
    id v6 = [v5 stringValue];

    id v7 = +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:a3 withLibrary:0 withOwnerIdentifier:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

+ (id)dataSourceForCategoryType:(int64_t)a3 withLibrary:(id)a4
{
  return +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:a3 withLibrary:a4 withOwnerIdentifier:0];
}

+ (id)dataSourceForCategoryType:(int64_t)a3 withLibrary:(id)a4 withOwnerIdentifier:(id)a5
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (!v7)
  {
    v9 = +[VUIMediaLibraryManager defaultManager];
    id v7 = [v9 deviceMediaLibrary];
  }
  v10 = 0;
  switch(a3)
  {
    case 0:
      if (v8)
      {
        v11 = +[VUIMediaAPIRequestFactory recentPurchasesRequestWithOwnerIdentifier:v8];
        v10 = [[VUIFamilySharingMediaEntitiesDataSource alloc] initWithNSURLRequest:v11];
        v12 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v13 = 0;
        goto LABEL_8;
      }
      v31 = [VUIMediaEntityFetchRequest alloc];
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      v33 = [(VUIMediaEntityFetchRequest *)v31 initWithMediaEntityTypes:v32];

      v34 = VUIMediaEntityFetchRequestMinimalPropertiesSet();
      [(VUIMediaEntityFetchRequest *)v33 setProperties:v34];

      [(VUIMediaEntityFetchRequest *)v33 addRecentlyAddedSortDescriptorWithLimit:0];
      v10 = [[VUIMPMediaEntitiesDataSource alloc] initWithMediaLibrary:v7 fetchRequest:v33];

      goto LABEL_27;
    case 1:
      if (!v8)
      {
        v35 = [VUIMediaEntityFetchRequest alloc];
        v36 = (void *)MEMORY[0x1E4F1CAD0];
        v37 = +[VUIMediaEntityType movie];
        v38 = +[VUIMediaEntityType show];
        v39 = objc_msgSend(v36, "setWithObjects:", v37, v38, 0);
        v11 = [(VUIMediaEntityFetchRequest *)v35 initWithMediaEntityTypes:v39];

        v40 = VUIMediaEntityFetchRequestMinimalPropertiesSet();
        [(VUIMediaEntityFetchRequest *)v11 setProperties:v40];

        v41 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:0];
        v49[0] = v41;
        v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
        [(VUIMediaEntityFetchRequest *)v11 setSortDescriptors:v42];

        [(VUIMediaEntityFetchRequest *)v11 addRecentlyAddedSortDescriptorWithLimit:25];
        v43 = (void *)MEMORY[0x1E4F28F60];
        id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v45 = objc_msgSend(v43, "vui_predicateWithSubpredicates:type:", v44, 1);
        [(VUIMediaEntityFetchRequest *)v11 setPredicate:v45];

        goto LABEL_23;
      }
      v11 = +[VUIMediaAPIRequestFactory recentPurchasesRequestWithOwnerIdentifier:v8];
      v10 = [[VUIFamilySharingMediaEntitiesDataSource alloc] initWithNSURLRequest:v11];
      v12 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v13 = 25;
LABEL_8:
      v14 = [v12 numberWithInt:v13];
      [(VUIFamilySharingMediaEntitiesDataSource *)v10 setResultLimit:v14];

      v15 = v10;
      goto LABEL_13;
    case 2:
      if (v8)
      {
        v11 = +[VUIMediaAPIRequestFactory moviesPurchasesRequestWithOwnerIdentifier:v8 sortType:0];
        v16 = [[VUIFamilySharingMediaEntitiesDataSource alloc] initWithNSURLRequest:v11];
        goto LABEL_25;
      }
      v46 = +[VUIMediaEntityFetchRequest moviesFetchRequest];
      goto LABEL_22;
    case 3:
      if (v8)
      {
        v11 = +[VUIMediaAPIRequestFactory showsPurchasesRequestWithOwnerIdentifier:v8 sortType:0];
        v15 = [[VUIFamilySharingMediaEntitiesDataSource alloc] initWithNSURLRequest:v11];
        v10 = v15;
LABEL_13:
        [(VUIFamilySharingMediaEntitiesDataSource *)v15 setShouldCoalesceEpisodesToShows:1];
      }
      else
      {
        v46 = +[VUIMediaEntityFetchRequest showsFetchRequest];
LABEL_22:
        v11 = v46;
        [(VUIMediaEntityFetchRequest *)v46 setGroupingKeyPath:@"genreTitle"];
LABEL_23:
        v30 = VUIMPMediaEntitiesDataSource;
LABEL_24:
        v16 = (VUIFamilySharingMediaEntitiesDataSource *)[[v30 alloc] initWithMediaLibrary:v7 fetchRequest:v11];
LABEL_25:
        v10 = v16;
      }
LABEL_26:

LABEL_27:
      return v10;
    case 4:
      v11 = +[VUIMediaEntityFetchRequest moviesFetchRequest];
      [(VUIMediaEntityFetchRequest *)v11 addHDRColorCapabilityOr4KResolutionPredicate];
      goto LABEL_23;
    case 5:
      v11 = +[VUIMediaEntityFetchRequest homeVideosFetchRequest];
      goto LABEL_23;
    case 6:
      v11 = +[VUIMediaEntityFetchRequest movieRentalsFetchRequest];
      id v17 = objc_alloc(MEMORY[0x1E4F1C978]);
      v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rentalExpirationDate" ascending:1];
      v19 = objc_msgSend(v17, "initWithObjects:", v18, 0);

      [(VUIMediaEntityFetchRequest *)v11 setSortDescriptors:v19];
      v10 = [[VUIMPMediaEntitiesDataSource alloc] initWithMediaLibrary:v7 fetchRequest:v11];

      goto LABEL_26;
    case 8:
      v20 = [VUIMediaEntityFetchRequest alloc];
      v21 = (void *)MEMORY[0x1E4F1CAD0];
      v22 = +[VUIMediaEntityType movieRental];
      v23 = +[VUIMediaEntityType movie];
      v24 = +[VUIMediaEntityType episode];
      v25 = +[VUIMediaEntityType homeVideo];
      v26 = objc_msgSend(v21, "setWithObjects:", v22, v23, v24, v25, 0);
      v11 = [(VUIMediaEntityFetchRequest *)v20 initWithMediaEntityTypes:v26];

      v27 = VUIMediaEntityFetchRequestAllPropertiesSet();
      [(VUIMediaEntityFetchRequest *)v11 setProperties:v27];

      [(VUIMediaEntityFetchRequest *)v11 setGroupingKeyPath:@"showTitle"];
      v28 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
      v48 = v28;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
      [(VUIMediaEntityFetchRequest *)v11 setSortDescriptors:v29];

      [(VUIMediaEntityFetchRequest *)v11 addIsLocalOrHasExpiredDownloadPredicate];
      v30 = VUIDownloadDataSource;
      goto LABEL_24;
    default:
      goto LABEL_27;
  }
}

+ (id)dataSourceForGenre:(id)a3 withFamilyMember:(id)a4
{
  id v5 = a3;
  id v6 = [a4 memberIdentifier];
  id v7 = [v6 stringValue];

  id v8 = +[VUIMediaAPIRequestFactory genresRequestForVUIFamilySharingGenre:v5 withOwnerIdentifier:v7];

  v9 = [[VUIFamilySharingMediaEntitiesDataSource alloc] initWithNSURLRequest:v8];
  [(VUIFamilySharingMediaEntitiesDataSource *)v9 setShouldCoalesceEpisodesToShows:1];

  return v9;
}

+ (id)dataSourceForGenre:(id)a3 withLibrary:(id)a4
{
  id v5 = a4;
  id v6 = +[VUIMediaEntitiesDataSourceFactory _fetchRequestForGenre:a3];
  id v7 = [[VUIMPMediaEntitiesDataSource alloc] initWithMediaLibrary:v5 fetchRequest:v6];

  return v7;
}

+ (id)_fetchRequestForGenre:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [VUIMediaEntityFetchRequest alloc];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = +[VUIMediaEntityType movie];
  id v7 = +[VUIMediaEntityType show];
  id v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, 0);
  v9 = [(VUIMediaEntityFetchRequest *)v4 initWithMediaEntityTypes:v8];

  v10 = VUIMediaEntityFetchRequestMinimalPropertiesSet();
  [(VUIMediaEntityFetchRequest *)v9 setProperties:v10];

  v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
  v15[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [(VUIMediaEntityFetchRequest *)v9 setSortDescriptors:v12];

  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F60], "vui_equalPredicateWithKeyPath:value:", @"genreTitle", v3);

  [(VUIMediaEntityFetchRequest *)v9 setPredicate:v13];
  return v9;
}

+ (id)dataSourceForShelf:(int64_t)a3 withLibrary:(id)a4
{
  return +[VUIMediaEntitiesDataSourceFactory _dataSourceForShelfType:a3 withLibrary:a4 withOwnerIdentifier:0];
}

+ (id)dataSourceForShelf:(int64_t)a3 withFamilyMember:(id)a4
{
  id v5 = [a4 memberIdentifier];
  id v6 = [v5 stringValue];

  id v7 = +[VUIMediaEntitiesDataSourceFactory _dataSourceForShelfType:a3 withLibrary:0 withOwnerIdentifier:v6];

  return v7;
}

+ (id)_dataSourceForShelfType:(int64_t)a3 withLibrary:(id)a4 withOwnerIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!v7)
  {
    v9 = +[VUIMediaLibraryManager defaultManager];
    id v7 = [v9 deviceMediaLibrary];
  }
  switch(a3)
  {
    case 0:
      v10 = +[VUIMediaEntityFetchRequest movieRentalsFetchRequest];
      id v11 = objc_alloc(MEMORY[0x1E4F1C978]);
      v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rentalExpirationDate" ascending:1];
      uint64_t v13 = objc_msgSend(v11, "initWithObjects:", v12, 0);

      [v10 setSortDescriptors:v13];
      v14 = [[VUIMPMediaEntitiesDataSource alloc] initWithMediaLibrary:v7 fetchRequest:v10];

      goto LABEL_16;
    case 1:
      if (v8)
      {
        v10 = +[VUIMediaAPIRequestFactory showsPurchasesRequestWithOwnerIdentifier:v8 sortType:3];
        v14 = [[VUIFamilySharingMediaEntitiesDataSource alloc] initWithNSURLRequest:v10];
        [(VUIMPMediaEntitiesDataSource *)v14 setShouldCoalesceEpisodesToShows:1];
        goto LABEL_16;
      }
      v16 = +[VUIMediaEntityFetchRequest showsFetchRequest];
      goto LABEL_13;
    case 2:
      if (v8)
      {
        v10 = +[VUIMediaAPIRequestFactory moviesPurchasesRequestWithOwnerIdentifier:v8 sortType:3];
        v15 = [[VUIFamilySharingMediaEntitiesDataSource alloc] initWithNSURLRequest:v10];
      }
      else
      {
        v16 = +[VUIMediaEntityFetchRequest moviesFetchRequest];
LABEL_13:
        v10 = v16;
        [v16 addRecentlyAddedSortDescriptorWithLimit:25];
        [v10 setGroupingKeyPath:@"genreTitle"];
LABEL_14:
        v15 = [[VUIMPMediaEntitiesDataSource alloc] initWithMediaLibrary:v7 fetchRequest:v10];
      }
      v14 = (VUIMPMediaEntitiesDataSource *)v15;
LABEL_16:

LABEL_17:
      return v14;
    case 3:
      v10 = +[VUIMediaEntityFetchRequest moviesFetchRequest];
      [v10 addHDRColorCapabilityOr4KResolutionPredicate];
      goto LABEL_14;
    default:
      v14 = 0;
      goto LABEL_17;
  }
}

@end