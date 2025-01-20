@interface ML3Track
+ (BOOL)_writeSyncDeletesToPlistWithLibrary:(id)a3 forPersistentIDs:(id)a4;
+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3;
+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4;
+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4 disableKeepLocal:(BOOL)a5;
+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4 disableKeepLocal:(BOOL)a5 usingConnection:(id)a6;
+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4 usingConnection:(id)a5;
+ (BOOL)clearPlaybackKeysFromLibrary:(id)a3 persistentIDs:(id)a4;
+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 canonicalizeCollections:(BOOL)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7;
+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 canonicalizeCollections:(BOOL)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7 usingConnection:(id)a8;
+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6;
+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7;
+ (BOOL)libraryContentsChangeForProperty:(id)a3;
+ (BOOL)libraryDynamicChangeForProperty:(id)a3;
+ (BOOL)registerBookmarkMetadataIdentifierFunctionOnConnection:(id)a3;
+ (BOOL)removeFromMyLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6;
+ (BOOL)trackValueAreInTheCloud:(id)a3;
+ (BOOL)trackWithPersistentID:(int64_t)a3 existsInLibrary:(id)a4;
+ (BOOL)trackWithPersistentID:(int64_t)a3 existsInLibraryWithConnection:(id)a4;
+ (BOOL)trackWithPersistentID:(int64_t)a3 visibleInLibrary:(id)a4;
+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4;
+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4 deletedFileSize:(int64_t *)a5;
+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4 deletionType:(int)a5 deletedFileSize:(int64_t *)a6;
+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4 deletionType:(int)a5 disableKeepLocal:(BOOL)a6 deletedFileSize:(int64_t *)a7;
+ (id)TVShowEpisodesDefaultOrderingTerms;
+ (id)_normalizedImportChapters:(id)a3 trackPersistentID:(int64_t)a4;
+ (id)albumAllArtistsDefaultOrderingTerms;
+ (id)albumAndArtistDefaultOrderingTerms;
+ (id)albumsByAlbumArtistDefaultOrderingTerms;
+ (id)albumsDefaultOrderingTerms;
+ (id)allProperties;
+ (id)artistAllAlbumsDefaultOrderingTerms;
+ (id)artistsDefaultOrderingTerms;
+ (id)collectionClassesToUpdateBeforeDelete;
+ (id)composersDefaultOrderingTerms;
+ (id)containerQueryWithContainer:(id)a3;
+ (id)containerQueryWithContainer:(id)a3 predicate:(id)a4;
+ (id)containerQueryWithContainer:(id)a3 predicate:(id)a4 orderingTerms:(id)a5;
+ (id)databaseTable;
+ (id)defaultOrderingTerms;
+ (id)extraTablesToDelete;
+ (id)extraTablesToInsert;
+ (id)flattenedChapterDataFromDAAPInfoDictionary:(id)a3 trackPersistentID:(int64_t)a4;
+ (id)flattenedChapterDataFromSyncInfoDictionaries:(id)a3 trackPersistentID:(int64_t)a4;
+ (id)flattenedChapterDataWithImportChapters:(id)a3 library:(id)a4 trackPersistentID:(int64_t)a5;
+ (id)foreignColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)genresDefaultOrderingTerms;
+ (id)importChaptersByParsingAsset:(id)a3;
+ (id)joinClausesForProperty:(id)a3;
+ (id)orderingTermsForITTGTrackOrder:(unsigned int)a3 descending:(BOOL)a4;
+ (id)persistentIDColumnForTable:(id)a3;
+ (id)podcastsDefaultOrderingTerms;
+ (id)podcastsEpisodesDefaultOrderingTerms;
+ (id)predicateByOptimizingComparisonPredicate:(id)a3;
+ (id)predisambiguatedProperties;
+ (id)sectionPropertyForProperty:(id)a3;
+ (id)subselectPropertyForProperty:(id)a3;
+ (id)subselectStatementForProperty:(id)a3;
+ (id)unsettableProperties;
+ (int64_t)revisionTrackingCode;
+ (void)enumeratePathsToDeleteFromLibrary:(id)a3 persistentIDs:(id)a4 usingBlock:(id)a5;
+ (void)enumeratePathsToDeleteFromLibrary:(id)a3 persistentIDs:(id)a4 usingConnection:(id)a5 usingBlock:(id)a6;
+ (void)initialize;
+ (void)populateSortOrdersOfPropertyValues:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5;
+ (void)updateAllBookmarkableStoreBookmarkMetadataIdentifiersOnConnection:(id)a3;
- (BOOL)_populateLocationPropertiesWithPath:(id)a3 protectionType:(int64_t)a4 fromLibrary:(id)a5 usingConnection:(id)a6;
- (BOOL)needsVideoSnapshot;
- (BOOL)populateArtworkCacheWithArtworkData:(id)a3;
- (BOOL)updateIntegrity;
- (ML3Track)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6;
- (id)absoluteFilePath;
- (id)artworkTokenAtPlaybackTime:(double)a3;
- (id)chapterTOC;
- (id)multiverseIdentifier;
- (id)multiverseIdentifierLibraryOnly:(BOOL)a3;
- (id)protocolItem;
- (id)protocolItemForDynamicUpdate;
- (id)rawIntegrity;
- (void)createVideoSnapshotAtTime:(double)a3;
- (void)populateChapterDataWithImportChapters:(id)a3;
- (void)populateLocationPropertiesWithPath:(id)a3;
- (void)populateLocationPropertiesWithPath:(id)a3 isProtected:(BOOL)a4;
- (void)populateLocationPropertiesWithPath:(id)a3 protectionType:(int64_t)a4;
- (void)populateLocationPropertiesWithPath:(id)a3 protectionType:(int64_t)a4 completionBlock:(id)a5;
- (void)updateCollectionCloudStatus;
- (void)updateStoreBookmarkMetadataIdentifier;
@end

@implementation ML3Track

+ (id)subselectStatementForProperty:(id)a3
{
  v3 = [(id)ML3TrackSubSelectProperties objectForKey:a3];
  v4 = [v3 objectForKey:@"subselect"];

  return v4;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  v5 = [(id)ML3TrackJoinsForProperties objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___ML3Track;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)databaseTable
{
  return @"item";
}

+ (id)predisambiguatedProperties
{
  return (id)ML3TrackPredisambiguatedPropertyForProperties;
}

+ (void)initialize
{
  v157[6] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    id v134 = a1;
    v3 = +[ML3OrderingTerm orderingTermWithProperty:@"title_order"];
    v157[0] = v3;
    id v4 = +[ML3OrderingTerm orderingTermWithProperty:@"item_artist_order"];
    v157[1] = v4;
    v5 = +[ML3OrderingTerm orderingTermWithProperty:@"album_order"];
    v157[2] = v5;
    v6 = +[ML3OrderingTerm orderingTermWithProperty:@"album_pid"];
    v157[3] = v6;
    id v7 = +[ML3OrderingTerm orderingTermWithProperty:@"disc_number"];
    v157[4] = v7;
    v8 = +[ML3OrderingTerm orderingTermWithProperty:@"track_number"];
    v157[5] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v157 count:6];
    objc_super v10 = (void *)ML3TrackDefaultOrderingTerms;
    ML3TrackDefaultOrderingTerms = v9;

    v11 = +[ML3OrderingTerm orderingTermWithProperty:@"album_order = 0"];
    v156[0] = v11;
    v12 = +[ML3OrderingTerm orderingTermWithProperty:@"album_order"];
    v156[1] = v12;
    v13 = +[ML3OrderingTerm orderingTermWithProperty:@"album_pid"];
    v156[2] = v13;
    v14 = +[ML3OrderingTerm orderingTermWithProperty:@"disc_number"];
    v156[3] = v14;
    v15 = +[ML3OrderingTerm orderingTermWithProperty:@"track_number"];
    v156[4] = v15;
    v16 = +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:");
    v156[5] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:6];
    v18 = (void *)ML3TrackAlbumsDefaultOrderingTerms;
    ML3TrackAlbumsDefaultOrderingTerms = v17;

    v19 = +[ML3OrderingTerm orderingTermWithProperty:@"album_artist_order = 0"];
    v155[0] = v19;
    v20 = +[ML3OrderingTerm orderingTermWithProperty:@"album_artist_order"];
    v155[1] = v20;
    v21 = +[ML3OrderingTerm orderingTermWithProperty:@"album_artist_pid"];
    v155[2] = v21;
    v22 = +[ML3OrderingTerm orderingTermWithProperty:@"album_order"];
    v155[3] = v22;
    v23 = +[ML3OrderingTerm orderingTermWithProperty:@"album_pid"];
    v155[4] = v23;
    v24 = +[ML3OrderingTerm orderingTermWithProperty:@"disc_number"];
    v155[5] = v24;
    v25 = +[ML3OrderingTerm orderingTermWithProperty:@"track_number"];
    v155[6] = v25;
    v26 = +[ML3OrderingTerm orderingTermWithProperty:@"title_order"];
    v155[7] = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v155 count:8];
    v28 = (void *)ML3TrackAlbumByAlbumArtistDefaultOrderingTerms;
    ML3TrackAlbumByAlbumArtistDefaultOrderingTerms = v27;

    v29 = +[ML3OrderingTerm orderingTermWithProperty:@"item_artist_order"];
    v154[0] = v29;
    v30 = +[ML3OrderingTerm orderingTermWithProperty:@"item_artist_pid"];
    v154[1] = v30;
    v31 = +[ML3OrderingTerm orderingTermWithProperty:@"album_pid"];
    v154[2] = v31;
    uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:3];
    v33 = (void *)ML3TrackArtistsDefaultOrderingTerms;
    ML3TrackArtistsDefaultOrderingTerms = v32;

    v34 = +[ML3OrderingTerm orderingTermWithProperty:@"title_order"];
    v153[0] = v34;
    v35 = +[ML3OrderingTerm orderingTermWithProperty:@"album_order"];
    v153[1] = v35;
    v36 = +[ML3OrderingTerm orderingTermWithProperty:@"album_pid"];
    v153[2] = v36;
    v37 = +[ML3OrderingTerm orderingTermWithProperty:@"disc_number"];
    v153[3] = v37;
    v38 = +[ML3OrderingTerm orderingTermWithProperty:@"track_number"];
    v153[4] = v38;
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:5];
    v40 = (void *)ML3TrackArtistAllAlbumsDefaultOrderingTerms;
    ML3TrackArtistAllAlbumsDefaultOrderingTerms = v39;

    v41 = +[ML3OrderingTerm orderingTermWithProperty:@"disc_number"];
    v152[0] = v41;
    v42 = +[ML3OrderingTerm orderingTermWithProperty:@"track_number"];
    v152[1] = v42;
    v43 = +[ML3OrderingTerm orderingTermWithProperty:@"title_order"];
    v152[2] = v43;
    v44 = +[ML3OrderingTerm orderingTermWithProperty:@"item_artist_order"];
    v152[3] = v44;
    uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:4];
    v46 = (void *)ML3TrackAlbumAllArtistsDefaultOrderingTerms;
    ML3TrackAlbumAllArtistsDefaultOrderingTerms = v45;

    v47 = +[ML3OrderingTerm orderingTermWithProperty:@"disc_number"];
    v151[0] = v47;
    v48 = +[ML3OrderingTerm orderingTermWithProperty:@"track_number"];
    v151[1] = v48;
    v49 = +[ML3OrderingTerm orderingTermWithProperty:@"title_order"];
    v151[2] = v49;
    uint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:3];
    v51 = (void *)ML3TrackAlbumAndArtistDefaultOrderingTerms;
    ML3TrackAlbumAndArtistDefaultOrderingTerms = v50;

    v52 = +[ML3OrderingTerm orderingTermWithProperty:@"composer_order"];
    v150[0] = v52;
    v53 = +[ML3OrderingTerm orderingTermWithProperty:@"composer_pid"];
    v150[1] = v53;
    v54 = +[ML3OrderingTerm orderingTermWithProperty:@"album_order"];
    v150[2] = v54;
    v55 = +[ML3OrderingTerm orderingTermWithProperty:@"title_order"];
    v150[3] = v55;
    uint64_t v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:4];
    v57 = (void *)ML3TrackComposersDefaultOrderingTerms;
    ML3TrackComposersDefaultOrderingTerms = v56;

    v58 = +[ML3OrderingTerm orderingTermWithProperty:@"genre_order"];
    v149[0] = v58;
    v59 = +[ML3OrderingTerm orderingTermWithProperty:@"genre_id"];
    v149[1] = v59;
    uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:2];
    v61 = (void *)ML3TrackGenresDefaultOrderingTerms;
    ML3TrackGenresDefaultOrderingTerms = v60;

    v62 = +[ML3OrderingTerm orderingTermWithProperty:@"item_store.date_released"];
    v148[0] = v62;
    v63 = +[ML3OrderingTerm orderingTermWithProperty:@"track_number"];
    v148[1] = v63;
    v64 = +[ML3OrderingTerm orderingTermWithProperty:@"title_order"];
    v148[2] = v64;
    uint64_t v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:3];
    v66 = (void *)ML3TrackPodcastEpisodesDefaultOrderingTerms;
    ML3TrackPodcastEpisodesDefaultOrderingTerms = v65;

    v67 = +[ML3OrderingTerm orderingTermWithProperty:@"album_order"];
    v147[0] = v67;
    v68 = +[ML3OrderingTerm orderingTermWithProperty:@"album_pid"];
    v147[1] = v68;
    v69 = +[ML3OrderingTerm orderingTermWithProperty:@"item_store.date_released"];
    v147[2] = v69;
    v70 = +[ML3OrderingTerm orderingTermWithProperty:@"track_number"];
    v147[3] = v70;
    v71 = +[ML3OrderingTerm orderingTermWithProperty:@"title_order"];
    v147[4] = v71;
    uint64_t v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:5];
    v73 = (void *)ML3TrackPodcastsDefaultOrderingTerms;
    ML3TrackPodcastsDefaultOrderingTerms = v72;

    v74 = +[ML3OrderingTerm orderingTermWithProperty:@"series_name_order"];
    v143 = v74;
    v75 = +[ML3OrderingTerm orderingTermWithProperty:@"item_artist_pid"];
    v144 = v75;
    v76 = +[ML3OrderingTerm orderingTermWithProperty:@"item_video.season_number"];
    v145 = v76;
    v77 = +[ML3OrderingTerm orderingTermWithProperty:@"album_order"];
    v146[0] = v77;
    v78 = +[ML3OrderingTerm orderingTermWithProperty:@"episode_sort_id"];
    v146[1] = v78;
    v79 = +[ML3OrderingTerm orderingTermWithProperty:@"track_number"];
    v146[2] = v79;
    v80 = +[ML3OrderingTerm orderingTermWithProperty:@"title_order"];
    v146[3] = v80;
    uint64_t v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v143 count:7];
    v82 = (void *)ML3TrackTVShowEpisodesDefaultOrderingTerms;
    ML3TrackTVShowEpisodesDefaultOrderingTerms = v81;

    v133 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"genre_id", @"property", @"SELECT genre.genre_id FROM genre WHERE genre.genre", @"subselect", 0);
    uint64_t v83 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v133, @"genre.genre", 0);
    v84 = (void *)ML3TrackSubSelectProperties;
    ML3TrackSubSelectProperties = v83;

    memcpy(__dst, &unk_1E5FB0278, sizeof(__dst));
    v85 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:269];
    v86 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:269];
    v87 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:269];
    uint64_t v88 = 0x1FFFFFFFFFFFFBCCLL;
    do
    {
      v89 = *(void **)&__dst[v88 * 8 + 8608];
      v90 = *(void **)((char *)&v144 + v88 * 8);
      v91 = (void *)v146[v88 - 1];
      id v92 = (id)v146[v88];
      id v93 = v91;
      id v94 = v90;
      id v95 = v89;
      [v85 setObject:v95 forKeyedSubscript:v94];
      [v86 setObject:v93 forKeyedSubscript:v94];
      [v87 setObject:v92 forKeyedSubscript:v94];

      v88 += 4;
    }
    while (v88 * 8);
    uint64_t v96 = [v85 copy];
    v97 = (void *)ML3TrackJoinsForProperties;
    ML3TrackJoinsForProperties = v96;

    uint64_t v98 = [v86 copy];
    v99 = (void *)ML3TrackForeignDatabaseTableForProperties;
    ML3TrackForeignDatabaseTableForProperties = v98;

    uint64_t v100 = [v87 copy];
    v101 = (void *)ML3TrackForeignColumnForProperties;
    ML3TrackForeignColumnForProperties = v100;

    uint64_t v102 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"item_extra.title", @"title_order_section", @"title_order", @"title_order_section", @"item_extra.sort_title", @"item_artist_order_section", @"item_artist.item_artist", @"item_artist_order_section", @"item_artist_order", @"item_artist_order_section", @"item_artist.sort_item_artist", @"album_order_section", @"album.album", @"album_order_section", @"album_order = 0", @"album_order_section", @"album_order",
             @"album_order_section",
             @"album.sort_album",
             @"series_name_order_section",
             @"item_artist.series_name",
             @"series_name_order_section",
             @"series_name_order",
             @"series_name_order_section",
             @"item_artist.sort_series_name",
             @"album_artist_order_section",
             @"album_artist_order = 0",
             @"album_artist_order_section",
             @"album_artist.album_artist",
             @"album_artist_order_section",
             @"album_artist_order",
             @"album_artist_order_section",
             @"album_artist.sort_album_artist",
             @"composer_order_section",
             @"composer.composer",
             @"composer_order_section",
             @"composer_order",
             @"composer_order_section",
             @"composer.sort_composer",
             @"genre_order_section",
             @"genre.genre",
             @"genre_order_section",
             @"genre_order",
             0);
    v103 = (void *)ML3TrackSectionPropertyForProperties;
    ML3TrackSectionPropertyForProperties = v102;

    uint64_t v104 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"item_extra", @"item_stats", @"item_store", @"item_playback", @"item_search", @"item_video", @"item_kvs", @"chapter", @"lyrics", @"booklet", 0);
    v105 = (void *)ML3TrackExtraTablesToDelete;
    ML3TrackExtraTablesToDelete = v104;

    uint64_t v106 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"item_extra", @"item_stats", @"item_store", @"item_playback", @"item_video", @"chapter", 0);
    v107 = (void *)ML3TrackExtraTablesToInsert;
    ML3TrackExtraTablesToInsert = v106;

    uint64_t v108 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"item_extra", @"item_pid", @"item_playback", @"item_pid", @"item_stats", @"item_pid", @"item_search", @"item_pid", @"item_store", @"item_pid", @"item_video", @"item_pid", @"item_kvs", @"item_pid", @"lyrics", @"item_pid", @"chapter",
             @"item_pid",
             @"booklet",
             0);
    v109 = (void *)ML3TrackPersistentIDForTable;
    ML3TrackPersistentIDForTable = v108;

    v140[0] = @"item_extra.genius_id";
    v140[1] = @"item_extra.content_rating_level";
    v140[2] = @"item_extra.title";
    v140[3] = @"title_order";
    v140[4] = @"title_order_section";
    v140[5] = @"item_extra.sort_title";
    v140[6] = @"item_artist_pid";
    v140[7] = @"item_artist.item_artist";
    v140[8] = @"item_artist_order";
    v140[9] = @"item_artist_order_section";
    v140[10] = @"item_artist.sort_item_artist";
    v140[11] = @"album_pid";
    v140[12] = @"album.album";
    v140[13] = @"album_order";
    v140[14] = @"album_order_section";
    v140[15] = @"album.sort_album";
    v140[16] = @"album_artist_pid";
    v140[17] = @"album_artist.album_artist";
    v140[18] = @"album_artist_order";
    v140[19] = @"album_artist_order_section";
    v140[20] = @"album_artist.sort_album_artist";
    v140[21] = @"album_artist.liked_state";
    v140[22] = @"composer_pid";
    v140[23] = @"composer.composer";
    v140[24] = @"composer_order";
    v140[25] = @"composer_order_section";
    v140[26] = @"composer.sort_composer";
    v140[27] = @"genre_id";
    v140[28] = @"genre.genre";
    v140[29] = @"genre_order";
    v140[30] = @"genre_order_section";
    v140[31] = @"disc_number";
    v140[32] = @"item_extra.disc_count";
    v140[33] = @"track_number";
    v140[34] = @"item_extra.track_count";
    v140[35] = @"item_artist.series_name";
    v140[36] = @"item_artist.sort_series_name";
    v140[37] = @"item_video.season_number";
    v140[38] = @"item_video.episode_id";
    v140[39] = @"item_store.feed_url";
    v140[40] = @"item_store.date_released";
    v140[41] = @"item_store.external_guid";
    v140[42] = @"item_extra.description";
    v140[43] = @"item_extra.comment";
    v140[44] = @"item_extra.location";
    v140[45] = @"item_extra.grouping";
    v140[46] = @"IFNULL(item_artist.series_name, item_artist.item_artist)";
    v140[47] = @"IFNULL(ML3SeasonDisplayName(item_video.season_number), album.album)";
    v140[48] = @"exclude_from_shuffle";
    v140[49] = @"(item.exclude_from_shuffle = 0)";
    v140[50] = @"media_type";
    v140[51] = @"(((item.media_type & ~65280) = 0) OR (item.media_type = 1032))";
    v140[52] = @"((item.media_type & 4128)!=0)";
    v140[53] = @"((item.media_type & 260)!=0)";
    v140[54] = @"category.category";
    v140[55] = @"item_extra.description_long";
    v140[56] = @"item_extra.collection_description";
    v140[57] = @"item_extra.location_kind_id";
    v140[58] = @"item_extra.comment";
    v140[59] = @"item_playback.eq_preset";
    v140[60] = @"item_extra.file_size";
    v140[61] = @"item_extra.total_time_ms";
    v140[62] = @"item_playback.start_time_ms";
    v140[63] = @"item_playback.stop_time_ms";
    v140[64] = @"item_extra.year";
    v140[65] = @"item_playback.bit_rate";
    v140[66] = @"item_playback.sample_rate";
    v140[67] = @"item_playback.audio_format";
    v140[68] = @"item_playback.duration";
    v140[69] = @"item_playback.gapless_heuristic_info";
    v140[70] = @"item_playback.gapless_encoding_delay";
    v140[71] = @"item_playback.gapless_encoding_drain";
    v140[72] = @"item_playback.gapless_last_frame_resynch";
    v140[73] = @"item_playback.volume_normalization_energy";
    v140[74] = @"item_extra.date_modified";
    v140[75] = @"date_added";
    v140[76] = @"item_extra.bpm";
    v140[77] = @"item_store.store_item_id";
    v140[78] = @"item_store.store_playlist_id";
    v140[79] = @"item_store.store_composer_id";
    v140[80] = @"item_store.store_genre_id";
    v140[81] = @"item_store.account_id";
    v140[82] = @"item_store.downloader_account_id";
    v140[83] = @"item_store.family_account_id";
    v140[84] = @"item_store.is_protected";
    v140[85] = @"item_store.key_id";
    v140[86] = @"item_store.date_released";
    v140[87] = @"item_video.audio_language";
    v140[88] = @"item_video.audio_track_index";
    v140[89] = @"item_video.audio_track_id";
    v140[90] = @"item_video.audio_track_locale";
    v140[91] = @"item_video.subtitle_language";
    v140[92] = @"item_video.subtitle_track_index";
    v140[93] = @"episode_sort_id";
    v140[94] = @"item_video.has_alternate_audio";
    v140[95] = @"item_video.has_subtitles";
    v140[96] = @"item_extra.content_rating";
    v140[97] = @"item_video.movie_info";
    v140[98] = @"item_extra.media_kind";
    v140[99] = @"item_extra.is_user_disabled";
    v140[100] = @"item_stats.play_count_user";
    v140[101] = @"item_stats.play_count_recent";
    v140[102] = @"item_stats.date_played";
    v140[103] = @"item_stats.date_accessed";
    v140[104] = @"item_stats.skip_count_user";
    v140[105] = @"item_stats.skip_count_recent";
    v140[106] = @"item_stats.date_skipped";
    v140[107] = @"item_stats.user_rating";
    v140[108] = @"item_stats.user_rating_is_derived";
    v140[109] = @"album.user_rating";
    v140[110] = @"album.user_rating_is_derived";
    v140[111] = @"item_stats.bookmark_time_ms";
    v140[112] = @"item_stats.remember_bookmark";
    v140[113] = @"item_stats.has_been_played";
    v140[114] = @"item_stats.hidden";
    v140[115] = @"item_stats.liked_state";
    v140[116] = @"item_stats.liked_state_changed";
    v140[117] = @"item_extra.copyright";
    v140[118] = @"lyrics.lyrics";
    v140[119] = @"lyrics.checksum";
    v140[120] = @"lyrics.pending_checksum";
    v140[121] = @"lyrics.store_lyrics_available";
    v140[122] = @"lyrics.time_synced_lyrics_available";
    v140[123] = @"item_playback.relative_volume";
    v140[124] = @"item_video.is_rental";
    v140[125] = @"item_video.is_demo";
    v140[126] = @"item_video.has_hls";
    v140[127] = @"item_store.is_ota_purchased";
    v140[128] = @"chapter.chapter_data";
    v140[129] = @"(CASE WHEN LENGTH(IFNULL(chapter.chapter_data,'')) > 0 THEN 1 ELSE 0 END)";
    v140[130] = @"container_item.container_pid";
    v140[131] = @"container_item.container_item_pid";
    v140[132] = @"container_item.position";
    v140[133] = @"ML3IsCurrentlyRestrictedMedia(item.media_type, item_extra.content_rating, item_extra.content_rating_level, (SELECT value FROM _MLDatabaseProperties WHERE key='MPExplicitContentAllowedBoolean'))";
    v140[134] = @"item_kvs.key";
    v140[135] = @"ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)";
    v140[136] = @"cloud_kvs.bookmark_sync_timestamp";
    v140[137] = @"cloud_kvs.bookmark_sync_revision";
    v140[138] = @"item_store.date_purchased";
    v140[139] = @"item_store.key_platform_id";
    v140[140] = @"item_store.storefront_id";
    v140[141] = @"item_store.store_kind";
    v140[142] = @"item_store.key_versions";
    v140[143] = @"item_store.purchase_history_token";
    v140[144] = @"item_playback.codec_type";
    v140[145] = @"item_playback.codec_subtype";
    v140[146] = @"item_playback.format";
    v140[147] = @"item_playback.data_kind";
    v140[148] = @"item_playback.data_url";
    v140[149] = @"item_playback.has_video";
    v140[150] = @"item_store.key_id_2";
    v140[151] = @"item_video.has_chapter_data";
    v140[152] = @"item_video.show_sort_type";
    v140[153] = @"item_video.episode_type";
    v140[154] = @"item_video.episode_type_display_name";
    v140[155] = @"item_video.episode_sub_sort_order";
    v140[156] = @"item_store.purchase_history_id";
    v140[157] = @"item_store.sync_id";
    v140[158] = @"item_store.home_sharing_id";
    v140[159] = @"item_store.purchase_history_redownload_params";
    v140[160] = @"item_store.match_redownload_params";
    v140[174] = @"item_store.extras_url";
    v140[175] = @"item_store.vpp_is_licensed";
    v140[176] = @"item_store.vpp_org_id";
    v140[177] = @"item_store.vpp_org_name";
    v140[178] = @"item_store.sync_redownload_params";
    v140[179] = @"needs_reporting";
    v140[180] = @"item_store.subscription_store_item_id";
    v140[184] = @"album.liked_state";
    v140[185] = @"album.sync_id";
    v140[186] = @"album.album_year";
    v140[187] = @"album.liked_state_changed_date";
    v140[189] = @"item_extra.version";
    v140[190] = @"item_extra.display_version";
    v140[191] = @"item_extra.classical_work";
    v140[192] = @"item_extra.classical_movement";
    v140[193] = @"item_extra.classical_movement_count";
    v140[194] = @"item_extra.classical_movement_number";
    v140[195] = @"item_playback.progression_direction";
    v140[196] = @"item_artist.store_id";
    v140[197] = @"album_artist.store_id";
    v140[204] = @"item_store.sync_in_my_library";
    v140[205] = @"item_store.cloud_in_my_library";
    v140[206] = @"item_store.cloud_album_id";
    v140[207] = @"item_store.cloud_playback_endpoint_type";
    v140[208] = @"item_store.cloud_universal_library_id";
    v140[209] = @"item_store.asset_store_item_id";
    v140[210] = @"item_store.reporting_store_item_id";
    v140[211] = @"item.show_composer";
    v140[213] = @"item.is_music_show";
    v140[214] = @"item_video.hls_offline_playback_keys";
    v140[215] = @"item_video.is_premium";
    v140[216] = @"item_video.color_capability";
    v140[217] = @"item_video.hls_color_capability";
    v140[218] = @"item_video.video_quality";
    v140[219] = @"item_video.hls_video_quality";
    v140[220] = @"item_video.hls_playlist_url";
    v140[221] = @"item_video.audio_capability";
    v140[222] = @"item_video.hls_audio_capability";
    v140[224] = @"album_artist.cloud_universal_library_id";
    v140[226] = @"item_extra.is_preorder";
    v140[227] = @"item_video.hls_asset_traits";
    v140[228] = @"item_video.hls_key_server_url";
    v140[229] = @"item_video.hls_key_cert_url";
    v140[230] = @"item_video.hls_key_server_protocol";
    v140[231] = @"item_store.extended_playback_attribute";
    v140[161] = @"item_store.cloud_status";
    v141 = @"item_store.extended_lyrics_attribute";
    v140[162] = @"remote_location_id";
    v140[163] = @"(item.base_location_id == 0 AND item.remote_location_id == 0 AND item_store.sync_id != 0)";
    v140[164] = @"(item_store.is_protected > 0)";
    v140[165] = @"( (item.base_location_id = 0 AND item_store.playback_endpoint_type = 3) OR item_store.is_protected = 2)";
    v140[166] = @"(item.base_location_id > 0)";
    v140[167] = @"(item.base_location_id = 100)";
    v140[168] = @"(item.base_location_id > 200)";
    v140[169] = @"(item.base_location_id BETWEEN 100 AND 200)";
    v140[170] = @"(item.base_location_id >= 250)";
    v140[171] = @"(item.remote_location_id >= 50 AND item.remote_location_id < 300)";
    v140[172] = @"(item.remote_location_id >= 50 AND item.base_location_id < 250)";
    v140[173] = @"(CASE WHEN LENGTH(IFNULL(item_store.match_redownload_params, '')) > 0 THEN item_store.match_redownload_params ELSE item_store.purchase_history_redownload_params END)";
    v140[181] = @"(item.base_location_id OR item.remote_location_id)";
    v140[182] = @"(item_extra.content_rating == 1)";
    v140[183] = @"(item_extra.content_rating == 2)";
    v140[188] = @"(LENGTH(IFNULL(item_store.match_redownload_params, '')) > 0 OR LENGTH(IFNULL(item_store.purchase_history_redownload_params, '')) > 0)";
    v140[198] = @"best_artwork_token.available_artwork_token AS available_item_artwork_token";
    v140[199] = @"best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token";
    v140[200] = @"best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type";
    v140[201] = @"best_artwork_token.available_artwork_token AS available_item_screenshot_token";
    v140[202] = @"best_artwork_token.fetchable_artwork_token AS fetchable_item_screenshot_token";
    v140[203] = @"best_artwork_token.fetchable_artwork_source_type AS fetchable_item_screenshot_source_type";
    v140[212] = @"(CASE WHEN item.show_composer = 1 THEN composer.composer ELSE album_artist.album_artist END)";
    v140[223] = @"date_downloaded";
    v140[225] = @"item_stats.liked_state_changed_date";
    uint64_t v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:233];
    v111 = (void *)ML3TrackAllProperties;
    ML3TrackAllProperties = v110;

    uint64_t v112 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:@"ML3IsCurrentlyRestrictedMedia(item.media_type, item_extra.content_rating, item_extra.content_rating_level, (SELECT value FROM _MLDatabaseProperties WHERE key='MPExplicitContentAllowedBoolean'))", @"ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)", 0];
    v113 = (void *)ML3TrackFunctionsProperties;
    ML3TrackFunctionsProperties = v112;

    id v114 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v115 = +[ML3Entity predisambiguatedProperties];
    v116 = (void *)[v114 initWithDictionary:v115];

    [v134 predisambiguateProperties:ML3TrackAllProperties toDictionary:v116];
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v117 = (id)ML3TrackFunctionsProperties;
    uint64_t v118 = [v117 countByEnumeratingWithState:&v135 objects:v139 count:16];
    if (v118)
    {
      uint64_t v119 = v118;
      uint64_t v120 = *(void *)v136;
      do
      {
        uint64_t v121 = 0;
        do
        {
          if (*(void *)v136 != v120) {
            objc_enumerationMutation(v117);
          }
          [v116 setObject:*(void *)(*((void *)&v135 + 1) + 8 * v121) forKey:*(void *)(*((void *)&v135 + 1) + 8 * v121)];
          ++v121;
        }
        while (v119 != v121);
        uint64_t v119 = [v117 countByEnumeratingWithState:&v135 objects:v139 count:16];
      }
      while (v119);
    }

    uint64_t v122 = [v116 copy];
    v123 = (void *)ML3TrackPredisambiguatedPropertyForProperties;
    ML3TrackPredisambiguatedPropertyForProperties = v122;

    uint64_t v124 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"item_video.audio_track_id", @"item_video.audio_track_locale", @"base_location_id", @"item_stats.bookmark_time_ms", @"date_added", @"item_stats.date_accessed", @"item_stats.date_played", @"item_store.date_released", @"item_stats.date_skipped", @"item_stats.download_identifier", @"item_stats.has_been_played", @"item_extra.location_kind_id", @"item_stats.liked_state", @"item_stats.liked_state_changed", @"item_stats.liked_state_changed_date", @"item_extra.location", @"lyrics.lyrics",
             @"lyrics.checksum",
             @"lyrics.pending_checksum",
             @"item_stats.play_count_recent",
             @"item_stats.play_count_user",
             @"item_stats.skip_count_recent",
             @"item_stats.skip_count_user",
             @"album.user_rating",
             @"album.user_rating_is_derived",
             @"item_stats.user_rating",
             @"item_stats.user_rating_is_derived",
             @"cloud_kvs.bookmark_sync_timestamp",
             @"cloud_kvs.bookmark_sync_revision",
             @"item_extra.file_size",
             @"keep_local",
             @"keep_local_status",
             @"keep_local_status_reason",
             @"keep_local_constraints",
             0);
    v125 = (void *)ML3TrackContentsUnchangingProperties;
    ML3TrackContentsUnchangingProperties = v124;

    uint64_t v126 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"chapter.chapter_data", @"(CASE WHEN LENGTH(IFNULL(chapter.chapter_data,'')) > 0 THEN 1 ELSE 0 END)", @"item_stats.chosen_by_auto_fill", 0);
    v127 = (void *)ML3TrackInvisibleProperties;
    ML3TrackInvisibleProperties = v126;

    uint64_t v128 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"item_stats.play_count_user", @"item_stats.play_count_recent", @"item_store.is_protected", @"keep_local", @"item_store.cloud_status", @"item_stats.needs_restore", @"date_downloaded", 0);
    v129 = (void *)ML3TrackNoAssistantSyncProperties;
    ML3TrackNoAssistantSyncProperties = v128;

    uint64_t v130 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"item_artist.item_artist", @"item_artist.sort_item_artist", @"album.album", @"album.sort_album", @"composer.composer", @"composer.sort_composer", @"album_artist.album_artist", @"album_artist.sort_album_artist", @"item_artist.series_name", @"item_artist.sort_series_name", @"genre.genre", @"ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)", @"(item.base_location_id > 0)", @"(item.base_location_id = 100)", @"(item.base_location_id > 200)", @"(item.base_location_id BETWEEN 100 AND 200)", @"(item.remote_location_id >= 50 AND item.remote_location_id < 300)",
             @"(item.remote_location_id >= 50 AND item.base_location_id < 250)",
             @"(CASE WHEN LENGTH(IFNULL(item_store.match_redownload_params, '')) > 0 THEN item_store.match_redownload_params ELSE item_store.purchase_history_redownload_params END)",
             @"remote_location_id",
             @"(item.base_location_id == 0 AND item.remote_location_id == 0 AND item_store.sync_id != 0)",
             @"(item_store.is_protected > 0)",
             @"( (item.base_location_id = 0 AND item_store.playback_endpoint_type = 3) OR item_store.is_protected = 2)",
             @"(item.base_location_id OR item.remote_location_id)",
             @"(item.base_location_id >= 250)",
             @"(item_extra.content_rating == 1)",
             @"(item_extra.content_rating == 2)",
             @"((item_extra.total_time_ms - item_stats.bookmark_time_ms < 30000 AND item_extra.total_time_ms > 60000) OR (item_stats.bookmark_time_ms >= .95 * item_extra.total_time_ms))",
             @"(item.remote_location_id != 100)",
             @"(NOT item.in_my_library)",
             @"(LENGTH(IFNULL(item_store.match_redownload_params, '')) > 0 OR LENGTH(IFNULL(item_store.purchase_history_redownload_params, '')) > 0)",
             @"best_artwork_token.available_artwork_token AS available_item_artwork_token",
             @"best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token",
             @"best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type",
             @"best_artwork_token.available_artwork_token AS available_item_screenshot_token",
             @"best_artwork_token.fetchable_artwork_token AS fetchable_item_screenshot_token",
             @"best_artwork_token.fetchable_artwork_source_type AS fetchable_item_screenshot_source_type",
             @"(CASE WHEN item.show_composer = 1 THEN composer.composer ELSE album_artist.album_artist END)",
             @"cloud_kvs.bookmark_sync_timestamp",
             @"cloud_kvs.bookmark_sync_revision",
             @"CASE WHEN rental_playback_date_started != 0 THEN MIN(rental_playback_date_started + rental_playback_duration, rental_date_started + rental_duration) ELSE rental_date_started + rental_duration END",
             @"(rental_date_started + rental_duration)",
             0);
    v131 = (void *)ML3TrackUnsettableProperties;
    ML3TrackUnsettableProperties = v130;

    uint64_t v132 = 8608;
    do
    {

      v132 -= 8;
    }
    while (v132);
  }
}

+ (id)TVShowEpisodesDefaultOrderingTerms
{
  return (id)ML3TrackTVShowEpisodesDefaultOrderingTerms;
}

+ (BOOL)registerBookmarkMetadataIdentifierFunctionOnConnection:(id)a3
{
  id v3 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__ML3Track_registerBookmarkMetadataIdentifierFunctionOnConnection___block_invoke;
  v6[3] = &unk_1E5FB2670;
  id v7 = v3;
  id v4 = v3;
  [v4 registerFunctionName:@"ML3TrackPropertyStoreBookmarkMetadataIdentifierFn" argumentCount:8 block:v6];

  return 1;
}

+ (BOOL)trackWithPersistentID:(int64_t)a3 visibleInLibrary:(id)a4
{
  id v5 = a4;
  v6 = +[ML3ComparisonPredicate predicateWithProperty:@"ROWID" equalToInt64:a3];
  id v7 = +[ML3Entity queryWithLibrary:v5 predicate:v6];

  char v8 = [v7 hasEntities];
  return v8;
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  id v3 = a3;
  if ([(id)ML3TrackContentsUnchangingProperties containsObject:v3]) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = [(id)ML3TrackInvisibleProperties containsObject:v3] ^ 1;
  }

  return v4;
}

+ (id)defaultOrderingTerms
{
  return (id)ML3TrackDefaultOrderingTerms;
}

+ (id)sectionPropertyForProperty:(id)a3
{
  return (id)[(id)ML3TrackSectionPropertyForProperties objectForKey:a3];
}

+ (id)albumsDefaultOrderingTerms
{
  return (id)ML3TrackAlbumsDefaultOrderingTerms;
}

+ (id)albumAllArtistsDefaultOrderingTerms
{
  return (id)ML3TrackAlbumAllArtistsDefaultOrderingTerms;
}

+ (id)genresDefaultOrderingTerms
{
  return (id)ML3TrackGenresDefaultOrderingTerms;
}

- (void)createVideoSnapshotAtTime:(double)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(ML3Entity *)self valueForProperty:@"item_video.is_rental"];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    id v7 = [(ML3Entity *)self valueForProperty:@"(item.base_location_id > 0)"];
    int v8 = [v7 BOOLValue];

    if (v8)
    {
      uint64_t v9 = [(ML3Entity *)self valueForProperty:@"(IFNULL(base_location.path, '') || '/' || item_extra.location)"];
      if ([v9 length])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
        v11 = [WeakRetained mediaFolderPathByAppendingPathComponent:v9];

        v12 = (void *)MEMORY[0x1E4F166C8];
        v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:0];
        v14 = [v12 URLAssetWithURL:v13 options:0];

        if (([v14 hasProtectedContent] & 1) == 0)
        {
          if (a3 <= 0.0) {
            a3 = 105.0;
          }
          uint64_t v39 = 0;
          uint64_t v40 = 0;
          uint64_t v41 = 0;
          if (v14)
          {
            [v14 duration];
            uint64_t v15 = v39;
            int v16 = v40;
          }
          else
          {
            int v16 = 0;
            uint64_t v15 = 0;
          }
          uint64_t v17 = v15 / v16;
          if (a3 > (double)v17) {
            a3 = (double)v17 * 0.5;
          }
          v18 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 134217984;
            *(double *)((char *)&buf + 4) = a3;
            _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "Generating video snapshot at time offset %g", (uint8_t *)&buf, 0xCu);
          }

          v19 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v14];
          memset(&v38, 0, sizeof(v38));
          CMTimeMakeWithSeconds(&v38, a3, 1);
          v20 = [MEMORY[0x1E4F29238] value:&v38 withObjCType:"{?=qiIq}"];
          v47[0] = v20;
          v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];

          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v45 = 0x2020000000;
          uint64_t v46 = 0;
          dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __53__ML3Track_VideoSnapshot__createVideoSnapshotAtTime___block_invoke;
          v35[3] = &unk_1E5FAF450;
          p_long long buf = &buf;
          v23 = v22;
          v36 = v23;
          [v19 generateCGImagesAsynchronouslyForTimes:v21 completionHandler:v35];
          dispatch_time_t v24 = dispatch_time(0, 5000000000);
          if (dispatch_semaphore_wait(v23, v24))
          {
            v25 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v42 = 134217984;
              double v43 = a3;
              _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEFAULT, "Timed out waiting for generateCGImagesAsynchronouslyForTimes: %g", v42, 0xCu);
            }

            [v19 cancelAllCGImageGeneration];
          }
          else if (*(void *)(*((void *)&buf + 1) + 24))
          {
            int64_t v26 = +[ML3MusicLibrary devicePreferredImageFormat];
            v34 = [MEMORY[0x1E4F1CA58] data];
            DataImageDestination = (CGImageDestination *)MSVImageUtilitiesCreateDataImageDestination();
            if (v26) {
              MSVImageUtilitiesAddImageToDestination();
            }
            else {
              MSVImageUtilitiesAddJPEGToDestination();
            }
            BOOL v28 = CGImageDestinationFinalize(DataImageDestination);
            CFRelease(DataImageDestination);
            CFRelease(*(CFTypeRef *)(*((void *)&buf + 1) + 24));
            if (v28)
            {
              v29 = [MEMORY[0x1E4F29128] UUID];
              v30 = [v29 UUIDString];

              v31 = [(ML3Entity *)self library];
              objc_msgSend(v31, "importArtworkTokenForEntityPersistentID:entityType:artworkToken:artworkType:sourceType:", -[ML3Entity persistentID](self, "persistentID"), 0, v30, 2, 300);
              uint64_t v32 = [(ML3Entity *)self valueForProperty:@"media_type"];
              uint64_t v33 = [v32 unsignedIntValue];

              [v31 importOriginalArtworkFromImageData:v34 withArtworkToken:v30 artworkType:2 sourceType:300 mediaType:v33];
            }
          }
          _Block_object_dispose(&buf, 8);
        }
      }
    }
  }
}

intptr_t __53__ML3Track_VideoSnapshot__createVideoSnapshotAtTime___block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  if (cf) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFRetain(cf);
  }
  int v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

- (BOOL)needsVideoSnapshot
{
  id v3 = [(ML3Entity *)self valueForProperty:@"best_artwork_token.available_artwork_token AS available_item_screenshot_token"];
  if ([v3 length])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(ML3Entity *)self valueForProperty:@"media_type"];
    int v6 = [v5 unsignedIntValue];

    BOOL v4 = v6 == 512 || v6 == 0x2000;
  }

  return v4;
}

- (void)updateStoreBookmarkMetadataIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  int v4 = [WeakRetained supportsUbiquitousPlaybackPositions];

  if (v4)
  {
    id v5 = [(ML3Entity *)self valueForProperty:@"item_kvs.key"];
    if ([v5 length]) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
    id v7 = v6;

    int v8 = [(ML3Entity *)self valueForProperty:@"item_stats.remember_bookmark"];
    if ([v8 BOOLValue]
      && ((-[ML3Entity valueForProperty:](self, "valueForProperty:", @"ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)"), v9 = objc_claimAutoreleasedReturnValue(), [v9 length])? (objc_super v10 = v9): (objc_super v10 = 0), v11 = v10, v9, v11))
    {
      if (v7) {
        v12 = v7;
      }
      else {
        v12 = &stru_1F08D4D70;
      }
      if (([v11 isEqualToString:v12] & 1) == 0) {
        [(ML3Entity *)self setValue:v11 forProperty:@"item_kvs.key"];
      }
    }
    else
    {
      if (v7)
      {
        v13 = [(ML3Entity *)self library];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __49__ML3Track_updateStoreBookmarkMetadataIdentifier__block_invoke;
        v14[3] = &unk_1E5FB7AB8;
        v14[4] = self;
        [v13 performDatabaseTransactionWithBlock:v14];
      }
      uint64_t v9 = 0;
    }
  }
}

uint64_t __49__ML3Track_updateStoreBookmarkMetadataIdentifier__block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = NSNumber;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "persistentID"));
  v8[0] = v5;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 executeUpdate:@"DELETE FROM item_kvs WHERE item_pid = ?" withParameters:v6 error:0];

  return 1;
}

- (void)updateCollectionCloudStatus
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14[0] = xmmword_1E5FB2618;
  v14[1] = *(_OWORD *)off_1E5FB2628;
  uint64_t v15 = @"genre_id";
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  [(ML3Entity *)self getValues:v11 forProperties:v14 count:5];
  uint64_t v3 = 0;
  p_library = &self->super._library;
  do
  {
    uint64_t v5 = [*(id *)((char *)v11 + v3 * 8) longLongValue];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = (void *)v13[v3];
      id WeakRetained = objc_loadWeakRetained((id *)p_library);
      uint64_t v9 = (void *)[v7 newWithPersistentID:v6 inLibrary:WeakRetained];

      [v9 updateCloudStatus];
    }
    ++v3;
  }
  while (v3 != 5);
  for (uint64_t i = 32; i != -8; i -= 8)
}

- (id)artworkTokenAtPlaybackTime:(double)a3
{
  if (a3 < 0.0
    || ([(ML3Track *)self chapterTOC], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (uint64_t v6 = (void *)v5,
        +[ML3MusicLibrary artworkTokenForChapterWithItemPID:[(ML3Entity *)self persistentID] retrievalTime:a3], id v7 = objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    id v7 = [(ML3Entity *)self valueForProperty:@"best_artwork_token.available_artwork_token AS available_item_artwork_token"];
  }

  return v7;
}

- (id)chapterTOC
{
  uint64_t v3 = [(ML3Entity *)self valueForProperty:@"chapter.chapter_data"];
  id v4 = (ML3ChapterTOC *)[v3 length];
  if (v4)
  {
    [v3 bytes];
    id v4 = 0;
    if (!ChapterData_CreateWithFlattenedData()) {
      id v4 = [[ML3ChapterTOC alloc] initWithChapterDataRef:0 track:self];
    }
  }

  return v4;
}

- (id)rawIntegrity
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__3766;
  id v11 = __Block_byref_object_dispose__3767;
  id v12 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__ML3Track_rawIntegrity__block_invoke;
  v6[3] = &unk_1E5FB7640;
  void v6[4] = self;
  v6[5] = &v7;
  [WeakRetained databaseConnectionAllowingWrites:0 withBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __24__ML3Track_rawIntegrity__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSNumber;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
  id v5 = a2;
  uint64_t v6 = [v3 numberWithLongLong:v4];
  v12[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  int v8 = [v5 executeQuery:@"SELECT integrity FROM item_extra WHERE item_pid = ?" withParameters:v7];

  uint64_t v9 = [v8 objectForFirstRowAndColumn];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (BOOL)updateIntegrity
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v3 = [(ML3Entity *)self valueForProperty:@"ML3TrackIntegrityCompute(item.item_pid, item.media_type, item_extra.location, item_extra.file_size)"];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v6 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __27__ML3Track_updateIntegrity__block_invoke;
  v11[3] = &unk_1E5FB57C0;
  v14 = &v15;
  id v8 = v6;
  id v12 = v8;
  v13 = self;
  [WeakRetained databaseConnectionAllowingWrites:1 withBlock:v11];

  char v9 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v9;
}

void __27__ML3Track_updateIntegrity__block_invoke(void *a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  v10[0] = a1[4];
  uint64_t v4 = NSNumber;
  uint64_t v5 = *(void *)(v3 + 16);
  id v6 = a2;
  uint64_t v7 = [v4 numberWithLongLong:v5];
  v10[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  char v9 = [v6 executeUpdate:@"UPDATE item_extra SET integrity = ? WHERE item_pid = ?" withParameters:v8 error:0];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v9;
}

- (ML3Track)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = (void *)[a3 mutableCopy];
  v14 = [v13 objectForKey:@"ROWID"];
  if (!v14)
  {
    v14 = [NSNumber numberWithLongLong:ML3CreateIntegerUUID()];
    [v13 setObject:v14 forKey:@"ROWID"];
  }
  [(id)objc_opt_class() populateSortOrdersOfPropertyValues:v13 inLibrary:v12 cachedNameOrders:v11];
  v17.receiver = self;
  v17.super_class = (Class)ML3Track;
  uint64_t v15 = [(ML3Entity *)&v17 initWithDictionary:v13 inLibrary:v12 cachedNameOrders:v11 usingConnection:v10];

  return v15;
}

- (id)absoluteFilePath
{
  uint64_t v3 = [(ML3Entity *)self valueForProperty:@"(IFNULL(base_location.path, '') || '/' || item_extra.location)"];
  uint64_t v4 = v3;
  if (v3 && (unint64_t)[v3 length] >= 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
    uint64_t v5 = [WeakRetained mediaFolderPathByAppendingPathComponent:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (void)enumeratePathsToDeleteFromLibrary:(id)a3 persistentIDs:(id)a4 usingConnection:(id)a5 usingBlock:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [v8 count];
  if (v11)
  {
    unint64_t v12 = v11;
    unint64_t v13 = 0;
    do
    {
      if (v12 - v13 >= 0x1F4) {
        uint64_t v14 = 500;
      }
      else {
        uint64_t v14 = v12 - v13;
      }
      uint64_t v15 = objc_msgSend(v8, "subarrayWithRange:", v13, v14);
      uint64_t v16 = +[ML3DatabaseStatementRenderer defaultRenderer];
      objc_super v17 = [v16 statementWithPrefix:@"SELECT item_extra.location, base_location.path, item.item_pid, item.base_location_id, item_store.store_saga_id, item_store.purchase_history_id, item_store.is_subscription FROM item JOIN item_extra USING (item_pid) JOIN item_store USING(item_pid) LEFT OUTER JOIN base_location USING (base_location_id) WHERE item.item_pid", objc_msgSend(v15, "count") inParameterCount];

      char v18 = [v9 executeQuery:v17 withParameters:v15];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __87__ML3Track_enumeratePathsToDeleteFromLibrary_persistentIDs_usingConnection_usingBlock___block_invoke;
      v19[3] = &unk_1E5FB26C0;
      id v20 = v10;
      [v18 enumerateRowsWithBlock:v19];
      v13 += v14;
    }
    while (v13 < v12);
  }
}

void __87__ML3Track_enumeratePathsToDeleteFromLibrary_persistentIDs_usingConnection_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 stringForColumnIndex:0];
  if ([v4 length])
  {
    uint64_t v5 = [v3 stringForColumnIndex:1];
    if ([v5 length])
    {
      id v6 = NSString;
      uint64_t v7 = +[ML3MusicLibrary mediaFolderPath];
      v10[0] = v7;
      v10[1] = v5;
      v10[2] = v4;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
      id v9 = [v6 pathWithComponents:v8];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  [v3 int64ForColumnIndex:2];
  [v3 int64ForColumnIndex:3];
  [v3 int64ForColumnIndex:4];
  [v3 int64ForColumnIndex:5];
  [v3 int64ForColumnIndex:6];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)enumeratePathsToDeleteFromLibrary:(id)a3 persistentIDs:(id)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__ML3Track_enumeratePathsToDeleteFromLibrary_persistentIDs_usingBlock___block_invoke;
  v13[3] = &unk_1E5FB6460;
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  [v12 databaseConnectionAllowingWrites:0 withBlock:v13];
}

uint64_t __71__ML3Track_enumeratePathsToDeleteFromLibrary_persistentIDs_usingBlock___block_invoke(void *a1, uint64_t a2)
{
  return +[ML3Track enumeratePathsToDeleteFromLibrary:a1[4] persistentIDs:a1[5] usingConnection:a2 usingBlock:a1[6]];
}

+ (BOOL)clearPlaybackKeysFromLibrary:(id)a3 persistentIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__ML3Track_clearPlaybackKeysFromLibrary_persistentIDs___block_invoke;
    void v10[3] = &unk_1E5FB7640;
    id v11 = v7;
    id v12 = &v13;
    [v5 databaseConnectionAllowingWrites:1 withBlock:v10];
    BOOL v8 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

void __55__ML3Track_clearPlaybackKeysFromLibrary_persistentIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[ML3DatabaseStatementRenderer defaultRenderer];
  id v5 = objc_msgSend(v4, "statementWithPrefix:inParameterCount:", @"UPDATE item_video SET hls_offline_playback_keys = NULL WHERE item_video.item_pid", objc_msgSend(*(id *)(a1 + 32), "count"));

  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = 0;
  LOBYTE(v4) = [v3 executeUpdate:v5 withParameters:v6 error:&v10];

  id v7 = v10;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v4;
  if (v7)
  {
    BOOL v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v7 localizedDescription];
      *(_DWORD *)long long buf = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "Failed to clear playback keys. %{public}@", buf, 0xCu);
    }
  }
}

+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4 disableKeepLocal:(BOOL)a5 usingConnection:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v35 = v10;
  if (v11 && [v11 count])
  {
    uint64_t v13 = [v11 count];
    id v14 = @"UPDATE item SET base_location_id=0, date_downloaded=0, download_source_container_pid=0 WHERE item.item_pid";
    if (v7) {
      id v14 = @"UPDATE item SET base_location_id=0, date_downloaded=0, download_source_container_pid=0, keep_local=-1, keep_local_constraints=0, keep_local_status=0, keep_local_status_reason=0 WHERE item.item_pid";
    }
    v37 = v14;
    if (v13)
    {
      unint64_t v15 = v13;
      id v34 = a1;
      unint64_t v16 = 0;
      unint64_t v17 = 0x1E5FAE000uLL;
      id v36 = v11;
      while (1)
      {
        if (v15 - v16 >= 0x1F4) {
          uint64_t v18 = 500;
        }
        else {
          uint64_t v18 = v15 - v16;
        }
        v19 = objc_msgSend(v11, "subarrayWithRange:", v16, v18, v34, v35);
        id v20 = [*(id *)(v17 + 3160) defaultRenderer];
        v21 = objc_msgSend(v20, "statementWithPrefix:inParameterCount:", v37, objc_msgSend(v19, "count"));

        if (([v12 executeUpdate:v21 withParameters:v19 error:0] & 1) == 0)
        {
          uint64_t v32 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)uint64_t v41 = 0;
            _os_log_impl(&dword_1B022D000, v32, OS_LOG_TYPE_ERROR, "Failed to clear download properties of tracks", v41, 2u);
          }

          goto LABEL_32;
        }
        dispatch_semaphore_t v22 = [*(id *)(v17 + 3160) defaultRenderer];
        v23 = objc_msgSend(v22, "statementWithPrefix:inParameterCount:", @"UPDATE item_extra SET location = '' WHERE item_extra.item_pid", objc_msgSend(v19, "count"));

        if ([v12 executeUpdate:v23 withParameters:v19 error:0]) {
          break;
        }
        int64_t v26 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B022D000, v26, OS_LOG_TYPE_ERROR, "Failed to clear location properties of tracks", buf, 2u);
        }
        BOOL v30 = 0;
        int v29 = 1;
LABEL_25:

        if (v29)
        {
          BOOL v30 = 0;
          id v11 = v36;
          goto LABEL_34;
        }
        id v11 = v36;
        unint64_t v17 = 0x1E5FAE000;
        if (v16 >= v15) {
          goto LABEL_34;
        }
      }
      dispatch_time_t v24 = [*(id *)(v17 + 3160) defaultRenderer];
      [v24 statementWithPrefix:@"UPDATE item_store SET sync_id = 0, downloader_account_id = 0, family_account_id = 0, is_protected = 0, is_ota_purchased = 0 WHERE item_store.item_pid", objc_msgSend(v19, "count") inParameterCount];
      int64_t v26 = v25 = v17;

      if ([v12 executeUpdate:v26 withParameters:v19 error:0])
      {
        uint64_t v27 = [*(id *)(v25 + 3160) defaultRenderer];
        BOOL v28 = objc_msgSend(v27, "statementWithPrefix:inParameterCount:", @"UPDATE item_video SET hls_asset_traits = 0 WHERE item_video.item_pid", objc_msgSend(v19, "count"));

        if ([v12 executeUpdate:v28 withParameters:v19 error:0])
        {
          [v34 incrementRevisionForRevisionTypeContentWithConnection:v12 deletionType:0 persistentIDs:v19];
          int v29 = 0;
          v16 += v18;
          BOOL v30 = 1;
LABEL_24:

          goto LABEL_25;
        }
        v31 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CMTime v38 = 0;
          _os_log_impl(&dword_1B022D000, v31, OS_LOG_TYPE_ERROR, "Failed to clear video traits properties of tracks", v38, 2u);
        }
      }
      else
      {
        BOOL v28 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v39 = 0;
          _os_log_impl(&dword_1B022D000, v28, OS_LOG_TYPE_ERROR, "Failed to clear store properties of tracks", v39, 2u);
        }
      }
      BOOL v30 = 0;
      int v29 = 1;
      goto LABEL_24;
    }
LABEL_32:
    BOOL v30 = 0;
  }
  else
  {
    BOOL v30 = 1;
  }
LABEL_34:

  return v30;
}

+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4 usingConnection:(id)a5
{
  return [a1 clearLocationFromLibrary:a3 persistentIDs:a4 disableKeepLocal:1 usingConnection:a5];
}

+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4 disableKeepLocal:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _OWORD v14[2] = __68__ML3Track_clearLocationFromLibrary_persistentIDs_disableKeepLocal___block_invoke;
  v14[3] = &unk_1E5FB2698;
  unint64_t v17 = &v20;
  id v18 = a1;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  BOOL v19 = a5;
  [v10 databaseConnectionAllowingWrites:1 withBlock:v14];
  char v12 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t __68__ML3Track_clearLocationFromLibrary_persistentIDs_disableKeepLocal___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 56) clearLocationFromLibrary:*(void *)(a1 + 32) persistentIDs:*(void *)(a1 + 40) disableKeepLocal:*(unsigned __int8 *)(a1 + 64) usingConnection:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

+ (BOOL)clearLocationFromLibrary:(id)a3 persistentIDs:(id)a4
{
  return [a1 clearLocationFromLibrary:a3 persistentIDs:a4 disableKeepLocal:1];
}

void __67__ML3Track_registerBookmarkMetadataIdentifierFunctionOnConnection___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  v34[2] = *MEMORY[0x1E4F143B8];
  __int16 v7 = sqlite3_value_int(*a4);
  sqlite3_int64 v8 = sqlite3_value_int64(a4[1]);
  if (!v8) {
    sqlite3_int64 v8 = sqlite3_value_int64(a4[2]);
  }
  if (v8) {
    BOOL v9 = (v7 & 0x104) == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9 && (v7 & 0x1020) == 0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", v8);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    unint64_t v17 = ML3CopyUTF8StringFromCFString(v11);
    sqlite3_result_text(a2, (const char *)v17, -1, MEMORY[0x1E4F14838]);
  }
  else
  {
    MLDBArgumentAsString((uint64_t)a4, 3u);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    char v12 = MLDBArgumentAsString((uint64_t)a4, 4u);
    if (-[__CFString length](v11, "length") && [v12 length])
    {
      v34[0] = v11;
      v34[1] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
      id v14 = [v13 componentsJoinedByString:&stru_1F08D4D70];
      SBKIdentifierStringByMD5HashingString(v14);
      id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v16 = ML3CopyUTF8StringFromCFString(v15);
      sqlite3_result_text(a2, (const char *)v16, -1, MEMORY[0x1E4F14838]);
    }
    else
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __67__ML3Track_registerBookmarkMetadataIdentifierFunctionOnConnection___block_invoke_2;
      v30[3] = &unk_1E5FB2648;
      uint64_t v32 = a4;
      v31 = (__CFString *)*(id *)(a1 + 32);
      id v18 = (void (**)(void, void, void, void))MEMORY[0x1B3E93EE0](v30);
      BOOL v19 = ((void (**)(void, __CFString *, __CFString *, uint64_t))v18)[2](v18, @"item_extra.title", @"item_pid", 5);
      if ([v19 length])
      {
        ((void (**)(void, __CFString *, __CFString *, uint64_t))v18)[2](v18, @"item_artist.item_artist", @"item_artist_pid", 6);
        uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        ((void (**)(void, __CFString *, __CFString *, uint64_t))v18)[2](v18, @"album.album", @"album_pid", 7);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (![(__CFString *)v20 length] || ![(__CFString *)v21 length])
        {
          if (v21) {
            uint64_t v22 = v21;
          }
          else {
            uint64_t v22 = &stru_1F08D4D70;
          }
          char v23 = v22;

          if (v20) {
            dispatch_time_t v24 = v20;
          }
          else {
            dispatch_time_t v24 = &stru_1F08D4D70;
          }
          unint64_t v25 = v24;

          uint64_t v20 = v25;
          v21 = v23;
        }
        v33[0] = v19;
        v33[1] = v20;
        v33[2] = v21;
        int64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
        uint64_t v27 = [v26 componentsJoinedByString:&stru_1F08D4D70];
        SBKIdentifierStringByMD5HashingString(v27);
        BOOL v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v28 = 0;
      }
      if ([(__CFString *)v28 length])
      {
        int v29 = ML3CopyUTF8StringFromCFString(v28);
        sqlite3_result_text(a2, (const char *)v29, -1, MEMORY[0x1E4F14838]);
      }
      else
      {
        sqlite3_result_null(a2);
      }

      id v15 = v31;
    }
  }
}

id __67__ML3Track_registerBookmarkMetadataIdentifierFunctionOnConnection___block_invoke_2(uint64_t a1, void *a2, void *a3, int a4)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(sqlite3_value **)(*(void *)(a1 + 40) + 8 * a4);
  id v7 = a3;
  id v8 = a2;
  sqlite3_int64 v9 = sqlite3_value_int64(v6);
  id v10 = [v8 stringByDeletingPathExtension];
  id v11 = [v8 pathExtension];

  char v12 = [v7 stringByDeletingPathExtension];

  uint64_t v13 = [NSString stringWithFormat:@"SELECT %@.%@ FROM %@ WHERE %@ = ?", v10, v11, v10, v12];
  id v14 = *(void **)(a1 + 32);
  id v15 = [NSNumber numberWithLongLong:v9];
  v20[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  unint64_t v17 = [v14 executeQuery:v13 withParameters:v16];

  id v18 = [v17 stringValueForFirstRowAndColumn];

  return v18;
}

+ (void)updateAllBookmarkableStoreBookmarkMetadataIdentifiersOnConnection:(id)a3
{
  _OWORD v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = @"ROWID";
  v14[0] = @"ROWID";
  v14[1] = @"ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)";
  id v5 = +[ML3ComparisonPredicate predicateWithProperty:@"item_stats.remember_bookmark" equalToInteger:1];
  uint64_t v6 = +[ML3ComparisonPredicate predicateWithProperty:@"ML3TrackPropertyStoreBookmarkMetadataIdentifierFn(item.media_type, item_store.store_item_id, item_store.subscription_store_item_id, item_store.feed_url, item_store.external_guid, item.item_pid, item.item_artist_pid, item.album_pid)" value:&stru_1F08D4D70 comparison:2 caseInsensitive:1 treatNullAsString:&stru_1F08D4D70];
  v13[0] = v5;
  v13[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v8 = +[ML3CompoundPredicate predicateMatchingPredicates:v7];

  id v9 = +[ML3Entity newSelectAllEntitiesSQLForProperties:v14 count:2 predicate:v8];
  id v10 = [NSString stringWithFormat:@"INSERT OR REPLACE INTO item_upp (item_pid, bookkeeper_identifier) %@", v9];
  id v11 = [v8 databaseStatementParameters];
  [v3 executeUpdate:v10 withParameters:v11 error:0];

  for (uint64_t i = 1; i != -1; --i)
}

+ (BOOL)trackValueAreInTheCloud:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"(item.base_location_id BETWEEN 100 AND 200)"];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) != 0
    || ([v3 objectForKey:@"(item.base_location_id = 100)"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 BOOLValue],
        v6,
        (v7 & 1) != 0))
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [v3 objectForKey:@"(CASE WHEN LENGTH(IFNULL(item_store.match_redownload_params, '')) > 0 THEN item_store.match_redownload_params ELSE item_store.purchase_history_redownload_params END)"];
    uint64_t v10 = [v9 length];

    id v11 = [v3 objectForKey:@"item_extra.location"];
    uint64_t v12 = [v11 length];

    if (v10) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    BOOL v8 = v13;
  }

  return v8;
}

+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4 deletionType:(int)a5 disableKeepLocal:(BOOL)a6 deletedFileSize:(int64_t *)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13 && [v13 count])
  {
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v37 = 0;
    CMTime v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    id v16 = [MEMORY[0x1E4F1CA80] set];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke;
    v27[3] = &unk_1E5FB25F8;
    id v28 = v14;
    id v33 = a1;
    id v29 = v12;
    id v17 = v16;
    id v30 = v17;
    uint64_t v32 = &v37;
    BOOL v36 = a6;
    int v35 = a5;
    id v34 = a7;
    id v18 = v15;
    id v31 = v18;
    [v29 performDatabaseTransactionWithBlock:v27];
    if (*((unsigned char *)v38 + 24))
    {
      BOOL v19 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [v17 count];
        v21 = @"user action";
        if (a5 == 2) {
          v21 = @"automated action";
        }
        *(_DWORD *)long long buf = 134218242;
        uint64_t v42 = v20;
        __int16 v43 = 2114;
        v44 = v21;
        _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "Unlinking %ld assets due to %{public}@", buf, 0x16u);
      }

      uint64_t v22 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2535;
      block[3] = &unk_1E5FB8298;
      id v26 = v17;
      dispatch_async(v22, block);

      BOOL v23 = *((unsigned char *)v38 + 24) != 0;
    }
    else
    {
      BOOL v23 = 0;
    }

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    BOOL v23 = 1;
  }

  return v23;
}

BOOL __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  v54 = 0;
  v54 = malloc_type_malloc(8 * [*(id *)(a1 + 32) count], 0x100004000313F17uLL);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2;
  v46[3] = &unk_1E5FB7330;
  v46[4] = &v51;
  id v29 = (void (**)(void))MEMORY[0x1B3E93EE0](v46);
  uint64_t v4 = *(void **)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 32);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_3;
  v41[3] = &unk_1E5FB25D0;
  uint64_t v6 = *(void *)(a1 + 40);
  id v42 = *(id *)(a1 + 48);
  id v7 = v3;
  id v43 = v7;
  v44 = &v51;
  uint64_t v45 = &v47;
  [v4 enumeratePathsToDeleteFromLibrary:v6 persistentIDs:v5 usingBlock:v41];
  +[ML3Track _writeSyncDeletesToPlistWithLibrary:*(void *)(a1 + 40) forPersistentIDs:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 72) clearLocationFromLibrary:*(void *)(a1 + 40) persistentIDs:v7 disableKeepLocal:*(unsigned __int8 *)(a1 + 92) usingConnection:v30];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    goto LABEL_24;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 72) clearPlaybackKeysFromLibrary:*(void *)(a1 + 40) persistentIDs:v7];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    goto LABEL_24;
  }
  uint64_t v8 = 0;
  do
  {
    if (ML3TrackRulesShouldSetRemovalPropertiesOnAssetDeleteForSource(v8))
    {
      id v9 = ML3TrackRulesRemovalPropertiesForSource(v8);
      if ([v9 count])
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
        id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2529;
        v38[3] = &unk_1E5FB7808;
        id v12 = v10;
        id v39 = v12;
        id v13 = v11;
        id v40 = v13;
        [v9 enumerateKeysAndObjectsUsingBlock:v38];
        +[ML3Entity setValues:v13 forProperties:v12 forEntityPersistentIDs:v7 inLibrary:*(void *)(a1 + 40) usingConnection:v30];
      }
    }
    uint64_t v8 = (v8 + 1);
  }
  while (v8 != 7);
  if (!v48[3]
    || (uint64_t v14 = *(void *)(a1 + 40),
        uint64_t v15 = *(unsigned int *)(a1 + 88),
        uint64_t v16 = v52[3],
        v37.receiver = *(id *)(a1 + 72),
        v37.super_class = (Class)&OBJC_METACLASS___ML3Track,
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSendSuper2(&v37, sel_deleteFromLibrary_deletionType_persistentIDs_count_, v14, v15, v16)) != 0))
  {
    id v17 = *(void **)(a1 + 80);
    if (v17) {
      *id v17 = 0;
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v55 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v34;
      uint64_t v21 = *MEMORY[0x1E4F28390];
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v18);
          }
          if (*(void *)(a1 + 80))
          {
            BOOL v23 = [*(id *)(a1 + 56) attributesOfItemAtPath:*(void *)(*((void *)&v33 + 1) + 8 * i) error:0];
            dispatch_time_t v24 = [v23 objectForKey:v21];
            uint64_t v25 = [v24 longLongValue];

            id v26 = *(void **)(a1 + 80);
            if (v26) {
              *v26 += v25;
            }
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v55 count:16];
      }
      while (v19);
    }

    v29[2]();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2_2533;
    v31[3] = &unk_1E5FB75F0;
    id v32 = *(id *)(a1 + 40);
    [v30 enqueueBlockForTransactionCommit:v31];
    BOOL v27 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0;
  }
  else
  {
LABEL_24:
    v29[2]();
    BOOL v27 = 0;
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v27;
}

void __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2535(uint64_t a1)
{
}

void __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    free(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  if (v8) {
    [*(id *)(a1 + 32) addObject:v8];
  }
  if (a4)
  {
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = [NSNumber numberWithLongLong:a5];
    [v9 addObject:v10];
  }
  else
  {
    id v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = a5;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "Deleting track that is not from the cloud with persistent-id: %lld", (uint8_t *)&v12, 0xCu);
    }

    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
              + 8 * (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))++) = a5;
  }
}

void __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2529(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(a1 + 40) addObject:v6];
}

uint64_t __110__ML3Track_unlinkRedownloadableAssetsFromLibrary_persistentIDs_deletionType_disableKeepLocal_deletedFileSize___block_invoke_2_2533(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyNonContentsPropertyDidChange];
}

+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4 deletionType:(int)a5 deletedFileSize:(int64_t *)a6
{
  return [a1 unlinkRedownloadableAssetsFromLibrary:a3 persistentIDs:a4 deletionType:*(void *)&a5 disableKeepLocal:1 deletedFileSize:a6];
}

+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4 deletedFileSize:(int64_t *)a5
{
  return [a1 unlinkRedownloadableAssetsFromLibrary:a3 persistentIDs:a4 deletionType:1 deletedFileSize:a5];
}

+ (BOOL)unlinkRedownloadableAssetsFromLibrary:(id)a3 persistentIDs:(id)a4
{
  return [a1 unlinkRedownloadableAssetsFromLibrary:a3 persistentIDs:a4 deletedFileSize:0];
}

+ (id)collectionClassesToUpdateBeforeDelete
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

+ (id)unsettableProperties
{
  return (id)ML3TrackUnsettableProperties;
}

+ (void)populateSortOrdersOfPropertyValues:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__ML3Track_populateSortOrdersOfPropertyValues_inLibrary_cachedNameOrders___block_invoke;
  v17[3] = &unk_1E5FB24D8;
  id v10 = v7;
  id v18 = v10;
  id v19 = v9;
  id v20 = v8;
  id v11 = v8;
  id v12 = v9;
  uint64_t v13 = (void (**)(void, void, void, void))MEMORY[0x1B3E93EE0](v17);
  uint64_t v14 = [v10 objectForKey:@"is_compilation"];
  int v15 = [v14 intValue];

  if (v15)
  {
    long long v38 = xmmword_1E5FB24F8;
    uint64_t v39 = 0;
    uint64_t v16 = &v38;
  }
  else
  {
    v36[0] = xmmword_1E5FB2510;
    v36[1] = *(_OWORD *)off_1E5FB2520;
    uint64_t v37 = 0;
    uint64_t v16 = v36;
  }
  ((void (**)(void, __CFString *, __CFString *, long long *))v13)[2](v13, @"album_artist_order", @"album_artist_order_section", v16);
  v35[0] = xmmword_1E5FB2538;
  v35[1] = *(_OWORD *)&off_1E5FB2548;
  ((void (**)(void, __CFString *, __CFString *, _OWORD *))v13)[2](v13, @"album_order", @"album_order_section", v35);
  uint64_t v34 = 0;
  long long v33 = xmmword_1E5FB2558;
  ((void (**)(void, __CFString *, __CFString *, long long *))v13)[2](v13, @"item_artist_order", @"item_artist_order_section", &v33);
  uint64_t v32 = 0;
  long long v31 = xmmword_1E5FB2570;
  ((void (**)(void, __CFString *, __CFString *, long long *))v13)[2](v13, @"composer_order", @"composer_order_section", &v31);
  v30[0] = @"genre.genre";
  v30[1] = 0;
  ((void (**)(void, __CFString *, __CFString *, void *))v13)[2](v13, @"genre_order", @"genre_order_section", v30);
  uint64_t v29 = 0;
  v28[0] = xmmword_1E5FB2588;
  v28[1] = *(_OWORD *)off_1E5FB2598;
  ((void (**)(void, __CFString *, __CFString *, _OWORD *))v13)[2](v13, @"series_name_order", @"series_name_order_section", v28);
  uint64_t v27 = 0;
  long long v26 = xmmword_1E5FB25B0;
  ((void (**)(void, __CFString *, __CFString *, long long *))v13)[2](v13, @"title_order", @"title_order_section", &v26);
  v25[0] = @"item_extra.title";
  v25[1] = 0;
  ((void (**)(void, __CFString *, void, void *))v13)[2](v13, @"item_search.search_title", 0, v25);
  v24[0] = @"album.album";
  v24[1] = 0;
  ((void (**)(void, __CFString *, void, void *))v13)[2](v13, @"item_search.search_album", 0, v24);
  v23[0] = @"item_artist.item_artist";
  v23[1] = 0;
  ((void (**)(void, __CFString *, void, void *))v13)[2](v13, @"item_search.search_artist", 0, v23);
  v22[0] = @"composer.composer";
  v22[1] = 0;
  ((void (**)(void, __CFString *, void, void *))v13)[2](v13, @"item_search.search_composer", 0, v22);
  v21[0] = @"album_artist.album_artist";
  v21[1] = 0;
  ((void (**)(void, __CFString *, void, void *))v13)[2](v13, @"item_search.search_album_artist", 0, v21);
}

void __74__ML3Track_populateSortOrdersOfPropertyValues_inLibrary_cachedNameOrders___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [a1[4] objectForKey:v7];

  if (!v9 && *a4)
  {
    id v10 = a4 + 1;
    while (1)
    {
      id v11 = objc_msgSend(a1[4], "objectForKey:");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 integerValue] >= 1)
      {
        uint64_t v13 = [v11 stringValue];

        id v11 = (void *)v13;
        break;
      }

      if (!*v10++) {
        goto LABEL_2;
      }
    }
    if (v11)
    {
      uint64_t v14 = [a1[5] objectForKey:v11];
      int v15 = v14;
      if (v14) {
        uint64_t v16 = [v14 ML3NameOrderValue];
      }
      else {
        uint64_t v16 = [a1[6] nameOrderForString:v11];
      }
      uint64_t v18 = v17;
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v19 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138543618;
          id v25 = v7;
          __int16 v26 = 2114;
          uint64_t v27 = v11;
          _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "Could not find sort order for %{public}@ of %{public}@", (uint8_t *)&v24, 0x16u);
        }
      }
      else
      {
        id v20 = a1[4];
        uint64_t v21 = [NSNumber numberWithLongLong:v16];
        [v20 setObject:v21 forKey:v7];

        if (v8)
        {
          id v22 = a1[4];
          BOOL v23 = [NSNumber numberWithLongLong:v18];
          [v22 setObject:v23 forKey:v8];
        }
      }
    }
  }
LABEL_2:
}

+ (BOOL)trackWithPersistentID:(int64_t)a3 existsInLibraryWithConnection:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  id v6 = a4;
  id v7 = [v5 numberWithLongLong:a3];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [v6 executeQuery:@"SELECT 1 FROM item WHERE ROWID = ?" withParameters:v8];

  LOBYTE(v7) = [v9 hasAtLeastOneRow];
  return (char)v7;
}

+ (BOOL)trackWithPersistentID:(int64_t)a3 existsInLibrary:(id)a4
{
  id v6 = a4;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __50__ML3Track_trackWithPersistentID_existsInLibrary___block_invoke;
  v8[3] = &unk_1E5FB24B0;
  v8[4] = &v9;
  v8[5] = a1;
  v8[6] = a3;
  [v6 databaseConnectionAllowingWrites:0 withBlock:v8];
  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return a3;
}

uint64_t __50__ML3Track_trackWithPersistentID_existsInLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 40) trackWithPersistentID:*(void *)(a1 + 48) existsInLibraryWithConnection:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (BOOL)removeFromMyLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  id v8 = a3;
  for (uint64_t i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a6];
  {
    uint64_t v10 = *a5++;
    uint64_t v11 = [NSNumber numberWithLongLong:v10];
    [i addObject:v11];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__ML3Track_removeFromMyLibrary_deletionType_persistentIDs_count___block_invoke;
  v15[3] = &unk_1E5FB58B8;
  id v16 = v8;
  id v17 = i;
  id v12 = i;
  id v13 = v8;
  [v13 performDatabaseTransactionWithBlock:v15];

  return 1;
}

uint64_t __65__ML3Track_removeFromMyLibrary_deletionType_persistentIDs_count___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  +[ML3Track _writeSyncDeletesToPlistWithLibrary:*(void *)(a1 + 32) forPersistentIDs:*(void *)(a1 + 40)];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 2;
  do
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v11[0] = v5;
    v11[1] = 3221225472;
    void v11[2] = __65__ML3Track_removeFromMyLibrary_deletionType_persistentIDs_count___block_invoke_2;
    v11[3] = &unk_1E5FB83A8;
    uint64_t v9 = v4;
    id v12 = v9;
    [v7 removeTracksWithPersistentIDs:v8 fromSource:v6 usingConnection:v3 withCompletionHandler:v11];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v6 = (v6 + 1);
  }
  while (v6 != 6);

  return 1;
}

intptr_t __65__ML3Track_removeFromMyLibrary_deletionType_persistentIDs_count___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 canonicalizeCollections:(BOOL)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7 usingConnection:(id)a8
{
  BOOL v11 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a8;
  id v16 = v15;
  if (a7)
  {
    unsigned int v29 = a4;
    id v30 = v15;
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v19 = 0;
    do
    {
      id v20 = [NSNumber numberWithLongLong:a6[v19]];
      [v18 addObject:v20];

      ++v19;
    }
    while (a7 != v19);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __103__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke;
    void v34[3] = &unk_1E5FB61E0;
    id v21 = v17;
    id v35 = v21;
    [a1 enumeratePathsToDeleteFromLibrary:v14 persistentIDs:v18 usingBlock:v34];
    v33.receiver = a1;
    v33.super_class = (Class)&OBJC_METACLASS___ML3Track;
    id v16 = v30;
    unsigned __int8 v22 = objc_msgSendSuper2(&v33, sel_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection_, v14, v29, v11, a6, a7, v30);
    if (v22)
    {
      BOOL v23 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [v21 count];
        id v25 = @"user action";
        if (v29 == 2) {
          id v25 = @"automated action";
        }
        *(_DWORD *)long long buf = 134218242;
        uint64_t v37 = v24;
        __int16 v38 = 2114;
        uint64_t v39 = v25;
        _os_log_impl(&dword_1B022D000, v23, OS_LOG_TYPE_DEFAULT, "Deleting %ld assets due to %{public}@", buf, 0x16u);
      }

      dispatch_time_t v26 = dispatch_time(0, 5000000000);
      uint64_t v27 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __103__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke_2501;
      block[3] = &unk_1E5FB8298;
      id v32 = v21;
      dispatch_after(v26, v27, block);
    }
  }
  else
  {
    unsigned __int8 v22 = 1;
  }

  return v22;
}

uint64_t __103__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

void __103__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke_2501(uint64_t a1)
{
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7
{
  return [a1 deleteFromLibrary:a3 deletionType:*(void *)&a4 canonicalizeCollections:1 persistentIDs:a5 count:a6 usingConnection:a7];
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 canonicalizeCollections:(BOOL)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7
{
  id v12 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count___block_invoke;
  v15[3] = &unk_1E5FB2488;
  id v17 = &v23;
  id v18 = a1;
  id v13 = v12;
  int v21 = a4;
  BOOL v22 = a5;
  id v16 = v13;
  uint64_t v19 = a6;
  unint64_t v20 = a7;
  [v13 performDatabaseTransactionWithBlock:v15];
  LOBYTE(a7) = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return a7;
}

uint64_t __87__ML3Track_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 48) deleteFromLibrary:*(void *)(a1 + 32) deletionType:*(unsigned int *)(a1 + 72) canonicalizeCollections:*(unsigned __int8 *)(a1 + 76) persistentIDs:*(void *)(a1 + 56) count:*(void *)(a1 + 64) usingConnection:a2];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __63__ML3Track_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke;
  v13[3] = &unk_1E5FB4A60;
  id v15 = &v20;
  id v16 = a1;
  id v11 = v10;
  int v19 = a4;
  id v14 = v11;
  id v17 = a5;
  unint64_t v18 = a6;
  [v11 performDatabaseTransactionWithBlock:v13];
  LOBYTE(a6) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return a6;
}

uint64_t __63__ML3Track_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 48) deleteFromLibrary:*(void *)(a1 + 32) deletionType:*(unsigned int *)(a1 + 72) canonicalizeCollections:1 persistentIDs:*(void *)(a1 + 56) count:*(void *)(a1 + 64) usingConnection:a2];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

+ (BOOL)_writeSyncDeletesToPlistWithLibrary:(id)a3 forPersistentIDs:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = 1;
  __int16 v38 = [v5 pathForResourceFileOrFolder:1 basePath:0 relativeToBase:0 createParentFolderIfNecessary:1];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v67 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v40 = 0;
    unint64_t v11 = 0x1E5FAE000uLL;
    uint64_t v47 = *(void *)v49;
    id v39 = v5;
    id v44 = v8;
    do
    {
      uint64_t v12 = 0;
      uint64_t v46 = v10;
      do
      {
        if (*(void *)v49 != v47) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
        id v14 = objc_msgSend(*(id *)(v11 + 3624), "newWithPersistentID:inLibrary:", objc_msgSend(v13, "unsignedLongLongValue"), v5);
        if ([v14 existsInLibrary])
        {
          v65[4] = xmmword_1E5FB2458;
          v65[5] = *(_OWORD *)off_1E5FB2468;
          v66 = @"base_location_id";
          v65[0] = xmmword_1E5FB2418;
          v65[1] = *(_OWORD *)&off_1E5FB2428;
          v65[2] = xmmword_1E5FB2438;
          v65[3] = *(_OWORD *)&off_1E5FB2448;
          id v64 = 0;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          [v14 getValues:&v58 forProperties:v65 count:13];
          id v15 = (id)v58;
          id v16 = v64;
          if ([v15 unsignedLongLongValue]
            && ([v16 longLongValue] > 249 || !objc_msgSend(v16, "longLongValue")))
          {
            id v17 = [MEMORY[0x1E4F1CA60] dictionary];
            uint64_t v45 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*((id *)&v61 + 1), "longLongValue"));
            int v21 = NSNumber;
            [(id)v60 doubleValue];
            id v43 = [v21 numberWithUnsignedInt:ML3UInt32MacTimeFromCFAbsoluteTime(v22)];
            char v23 = NSNumber;
            [*((id *)&v60 + 1) doubleValue];
            id v42 = [v23 numberWithUnsignedInt:ML3UInt32MacTimeFromCFAbsoluteTime(v24)];
            uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*((id *)&v62 + 1), "longLongValue"));
            char v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend((id)v63, "longLongValue"));
            [v17 setValue:(void)v58 forKey:@"persistentID"];
            [v17 setValue:MEMORY[0x1E4F1CC38] forKey:@"deleted"];
            if (![*((id *)&v58 + 1) longLongValue])
            {
              if ([(id)v59 intValue])
              {
                [v17 setValue:(void)v59 forKey:@"playCount"];
                [v17 setObject:v43 forKey:@"playMacOSDate"];
                [v17 setValue:(void)v61 forKey:@"playedState"];
              }
              if ([*((id *)&v59 + 1) intValue])
              {
                [v17 setValue:*((void *)&v59 + 1) forKey:@"skipCount"];
                [v17 setObject:v42 forKey:@"skipMacOSDate"];
              }
              [v17 setValue:v45 forKey:@"bookmarkTimeInMS"];
              [v17 setValue:(void)v62 forKey:@"audioTrackID"];
              [v17 setValue:v25 forKey:@"userRating"];
              [v17 setValue:v26 forKey:@"likedState"];
              [v17 setValue:*((void *)&v63 + 1) forKey:@"albumLikedState"];
            }
            uint64_t v27 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = [v13 longLongValue];
              *(_DWORD *)long long buf = 134218242;
              uint64_t v53 = v28;
              __int16 v54 = 2114;
              uint64_t v55 = (uint64_t)v17;
              _os_log_impl(&dword_1B022D000, v27, OS_LOG_TYPE_DEFAULT, "Writing tombstone for track with persistent ID %lld: %{public}@", buf, 0x16u);
            }

            unsigned int v29 = v40;
            if (!v40)
            {
              uint64_t v41 = v25;
              id v30 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v38];
              long long v31 = (void *)[v30 mutableCopy];
              id v32 = v31;
              if (v31)
              {
                id v33 = v31;
              }
              else
              {
                id v33 = [MEMORY[0x1E4F1CA48] array];
              }
              id v34 = v33;

              unsigned int v29 = v34;
              uint64_t v25 = v41;
            }
            uint64_t v40 = v29;
            [v29 addObject:v17];

            id v5 = v39;
          }
          else
          {
            id v17 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = [v13 longLongValue];
              uint64_t v19 = [v15 longLongValue];
              uint64_t v20 = [v16 longLongValue];
              *(_DWORD *)long long buf = 134218496;
              uint64_t v53 = v18;
              __int16 v54 = 2048;
              uint64_t v55 = v19;
              id v5 = v39;
              __int16 v56 = 2048;
              uint64_t v57 = v20;
              _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_DEFAULT, "Skipping writing tombstone for track with persistent ID %lld (sync_id = %lld, base_location_id = %lld)", buf, 0x20u);
            }
          }

          for (uint64_t i = 96; i != -8; i -= 8)
          id v8 = v44;
          unint64_t v11 = 0x1E5FAE000;
          uint64_t v10 = v46;
        }

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v67 count:16];
    }
    while (v10);

    if (!v40)
    {
      char v7 = 1;
      goto LABEL_36;
    }
    char v7 = [v40 writeToFile:v38 atomically:1];
    long long v36 = v40;
  }
  else
  {
    long long v36 = v8;
  }

LABEL_36:
  return v7;
}

+ (BOOL)libraryDynamicChangeForProperty:(id)a3
{
  return [(id)ML3TrackContentsUnchangingProperties containsObject:a3];
}

+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3
{
  return [(id)ML3TrackNoAssistantSyncProperties containsObject:a3] ^ 1;
}

+ (id)persistentIDColumnForTable:(id)a3
{
  return (id)[(id)ML3TrackPersistentIDForTable objectForKey:a3];
}

+ (id)extraTablesToInsert
{
  return (id)ML3TrackExtraTablesToInsert;
}

+ (id)extraTablesToDelete
{
  return (id)ML3TrackExtraTablesToDelete;
}

+ (id)foreignColumnForProperty:(id)a3
{
  id v3 = [(id)ML3TrackForeignColumnForProperties objectForKey:a3];
  if ([v3 length]) {
    dispatch_semaphore_t v4 = v3;
  }
  else {
    dispatch_semaphore_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  id v3 = [(id)ML3TrackForeignDatabaseTableForProperties objectForKey:a3];
  if ([v3 length]) {
    dispatch_semaphore_t v4 = v3;
  }
  else {
    dispatch_semaphore_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)allProperties
{
  return (id)ML3TrackAllProperties;
}

+ (id)subselectPropertyForProperty:(id)a3
{
  id v3 = [(id)ML3TrackSubSelectProperties objectForKey:a3];
  dispatch_semaphore_t v4 = [v3 objectForKey:@"property"];

  return v4;
}

+ (id)podcastsEpisodesDefaultOrderingTerms
{
  return (id)ML3TrackPodcastEpisodesDefaultOrderingTerms;
}

+ (id)composersDefaultOrderingTerms
{
  return (id)ML3TrackComposersDefaultOrderingTerms;
}

+ (id)albumAndArtistDefaultOrderingTerms
{
  return (id)ML3TrackAlbumAndArtistDefaultOrderingTerms;
}

+ (id)artistsDefaultOrderingTerms
{
  return (id)ML3TrackArtistsDefaultOrderingTerms;
}

+ (id)artistAllAlbumsDefaultOrderingTerms
{
  return (id)ML3TrackArtistAllAlbumsDefaultOrderingTerms;
}

+ (id)podcastsDefaultOrderingTerms
{
  return (id)ML3TrackPodcastsDefaultOrderingTerms;
}

+ (id)albumsByAlbumArtistDefaultOrderingTerms
{
  return (id)ML3TrackAlbumByAlbumArtistDefaultOrderingTerms;
}

+ (int64_t)revisionTrackingCode
{
  return 0;
}

+ (id)predicateByOptimizingComparisonPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 property];
  int v6 = [v5 isEqualToString:@"((item.media_type & 1024) = 1024)"];

  char v7 = v4;
  if (v6)
  {
    unsigned int v8 = 1024;
LABEL_9:
    _containmentPredicateForIsMediaTypePredicate(v7, v8);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    id v16 = v15;
    goto LABEL_11;
  }
  uint64_t v9 = [v4 property];
  int v10 = [v9 isEqualToString:@"((item.media_type & 260)!=0)"];

  char v7 = v4;
  if (v10)
  {
    unsigned int v8 = 260;
    goto LABEL_9;
  }
  unint64_t v11 = [v4 property];
  int v12 = [v11 isEqualToString:@"((item.media_type & 4128)!=0)"];

  char v7 = v4;
  if (v12)
  {
    unsigned int v8 = 4128;
    goto LABEL_9;
  }
  id v13 = [v4 property];
  int v14 = [v13 isEqualToString:@"(((item.media_type & ~65280) = 0) OR (item.media_type = 1032))"];

  char v7 = v4;
  if (v14)
  {
    unsigned int v8 = 65280;
    goto LABEL_9;
  }
  uint64_t v18 = [v4 property];
  int v19 = [v18 isEqualToString:@"media_type"];

  if (!v19)
  {
LABEL_24:
    v29.receiver = a1;
    v29.super_class = (Class)&OBJC_METACLASS___ML3Track;
    objc_msgSendSuper2(&v29, sel_predicateByOptimizingComparisonPredicate_, v4);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  int v20 = [v4 comparison];
  int v21 = [v4 value];
  uint64_t v22 = [v21 integerValue];

  if (v20 == 2)
  {
    char v23 = [v4 property];
    CFAbsoluteTime v24 = +[ML3ComparisonPredicate predicateWithProperty:v23 equalToInteger:v22];

    uint64_t v25 = [a1 predicateByOptimizingComparisonPredicate:v24];
    id v16 = +[ML3UnaryPredicate predicateWithPredicate:v25];

    goto LABEL_11;
  }
  if (!v22)
  {
    id v15 = +[ML3TruthPredicate falsePredicate];
    goto LABEL_10;
  }
  if (v22 == 0xFFFFFF)
  {
    id v15 = +[ML3TruthPredicate truePredicate];
    goto LABEL_10;
  }
  if (v20 != 10)
  {
    if (v20 == 1)
    {
      id v15 = v4;
      goto LABEL_10;
    }
    goto LABEL_24;
  }
  if (v22 == 32)
  {
    char v26 = &unk_1F09105E8;
  }
  else if ((v22 & 0xFFFFF7FF) == 0x1000)
  {
    char v26 = &unk_1F0910600;
  }
  else if (v22 == 4128)
  {
    char v26 = &unk_1F0910618;
  }
  else if (v22 == 4)
  {
    char v26 = &unk_1F0910630;
  }
  else if ((v22 & 0xFFFFF7FF) == 0x100)
  {
    char v26 = &unk_1F0910648;
  }
  else
  {
    if (v22 != 260)
    {
LABEL_39:
      _containmentMediaTypeMasksPredicateForMediaTypeMask(v22);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    char v26 = &unk_1F0910660;
  }
  uint64_t v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v26];
  if (!v27) {
    goto LABEL_39;
  }
  uint64_t v28 = (void *)v27;
  id v16 = +[ML3ContainmentPredicate predicateWithProperty:@"media_type" values:v27];

LABEL_11:

  return v16;
}

+ (id)orderingTermsForITTGTrackOrder:(unsigned int)a3 descending:(BOOL)a4
{
  v218[6] = *MEMORY[0x1E4F143B8];
  BOOL v5 = a4;
  int v6 = 0;
  switch(a3)
  {
    case 0u:
    case 1u:
    case 2u:
      goto LABEL_270;
    case 3u:
      uint64_t v25 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v26 = 2;
      }
      else {
        uint64_t v26 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v25 initWithProperty:@"ROWID" direction:v26];
      v188 = v9;
      uint64_t v27 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v28 = &v188;
      goto LABEL_277;
    case 5u:
      id v30 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v31 = 2;
      }
      else {
        uint64_t v31 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v30 initWithProperty:@"title_order" direction:v31];
      v218[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v31];
      v218[1] = v10;
      id v32 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v31];
      v218[2] = v32;
      id v33 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v31];
      v218[3] = v33;
      id v34 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v31];
      v218[4] = v34;
      id v35 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v31];
      v218[5] = v35;
      int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v218 count:6];

      goto LABEL_268;
    case 6u:
    case 0x22u:
      char v7 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v7 initWithProperty:@"album_order" direction:v8];
      v217[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"album_artist_order" direction:v8];
      v217[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v8];
      v217[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v8];
      v217[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v8];
      v217[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v8];
      v217[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v217;
      goto LABEL_263;
    case 7u:
    case 0x20u:
      id v17 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v18 = 2;
      }
      else {
        uint64_t v18 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v17 initWithProperty:@"item_artist_order" direction:v18];
      v216[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v18];
      v216[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v18];
      v216[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v18];
      v216[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v18];
      v216[4] = v13;
      int v19 = (void *)MEMORY[0x1E4F1C978];
      int v20 = v216;
      goto LABEL_178;
    case 8u:
      long long v36 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v37 = 2;
      }
      else {
        uint64_t v37 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v36 initWithProperty:@"item_playback.bit_rate" direction:v37];
      v197[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v37];
      v197[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v197;
      goto LABEL_255;
    case 9u:
    case 0x23u:
      int v21 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v21 initWithProperty:@"genre_order" direction:v22];
      v213[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v22];
      v213[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v22];
      v213[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v22];
      v213[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v22];
      v213[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v22];
      v213[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v213;
      goto LABEL_263;
    case 0xAu:
      uint64_t v40 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v41 = 2;
      }
      else {
        uint64_t v41 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v40 initWithProperty:@"item_extra.media_kind" direction:v41];
      v195[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v41];
      v195[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v195;
      goto LABEL_255;
    case 0xCu:
      id v42 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v43 = 2;
      }
      else {
        uint64_t v43 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v42 initWithProperty:@"track_number" direction:v43];
      v194[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v43];
      v194[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v43];
      v194[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v43];
      v194[3] = v12;
      id v44 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v45 = v194;
      goto LABEL_104;
    case 0xDu:
      uint64_t v46 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v47 = 2;
      }
      else {
        uint64_t v47 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v46 initWithProperty:@"item_extra.file_size" direction:v47];
      v192[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v47];
      v192[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v192;
      goto LABEL_255;
    case 0xEu:
      long long v48 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v49 = 2;
      }
      else {
        uint64_t v49 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v48 initWithProperty:@"item_extra.file_size" direction:v49];
      v191[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v49];
      v191[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v191;
      goto LABEL_255;
    case 0xFu:
      long long v50 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v51 = 2;
      }
      else {
        uint64_t v51 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v50 initWithProperty:@"item_extra.year" direction:v51];
      v190[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v51];
      v190[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v51];
      v190[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v51];
      v190[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v51];
      v190[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v51];
      v190[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v190;
      goto LABEL_263;
    case 0x10u:
      v52 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v53 = 2;
      }
      else {
        uint64_t v53 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v52 initWithProperty:@"item_playback.sample_rate" direction:v53];
      v196[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v53];
      v196[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v196;
      goto LABEL_255;
    case 0x11u:
      __int16 v54 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v55 = 2;
      }
      else {
        uint64_t v55 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v54 initWithProperty:@"category.category" direction:v55];
      v187[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v55];
      v187[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v187;
      goto LABEL_255;
    case 0x14u:
      __int16 v56 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v57 = 2;
      }
      else {
        uint64_t v57 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v56 initWithProperty:@"item_extra.description" direction:v57];
      v182[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v57];
      v182[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v182;
      goto LABEL_255;
    case 0x15u:
      long long v58 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v59 = 2;
      }
      else {
        uint64_t v59 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v58 initWithProperty:@"item_extra.comment" direction:v59];
      v211[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v59];
      v211[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v211;
      goto LABEL_255;
    case 0x16u:
      long long v60 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v61 = 2;
      }
      else {
        uint64_t v61 = 1;
      }
      if (v5) {
        uint64_t v62 = 1;
      }
      else {
        uint64_t v62 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v60 initWithProperty:@"date_added" direction:v61];
      v203[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v62];
      v203[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v203;
      goto LABEL_255;
    case 0x17u:
      long long v63 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v64 = 2;
      }
      else {
        uint64_t v64 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v63 initWithProperty:@"item_playback.eq_preset" direction:v64];
      v207[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v64];
      v207[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v207;
      goto LABEL_255;
    case 0x18u:
    case 0x24u:
      char v23 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v24 = 2;
      }
      else {
        uint64_t v24 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v23 initWithProperty:@"composer_order" direction:v24];
      v214[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v24];
      v214[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v24];
      v214[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v24];
      v214[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v24];
      v214[4] = v13;
      int v19 = (void *)MEMORY[0x1E4F1C978];
      int v20 = v214;
      goto LABEL_178;
    case 0x19u:
      uint64_t v65 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v66 = 2;
      }
      else {
        uint64_t v66 = 1;
      }
      if (v5) {
        uint64_t v67 = 1;
      }
      else {
        uint64_t v67 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v65 initWithProperty:@"item_playback.volume_normalization_energy" direction:v66];
      v189[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v67];
      v189[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v67];
      v189[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v67];
      v189[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v67];
      v189[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v67];
      v189[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v189;
      goto LABEL_263;
    case 0x1Au:
      uint64_t v68 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v69 = 2;
      }
      else {
        uint64_t v69 = 1;
      }
      if (v5) {
        uint64_t v70 = 1;
      }
      else {
        uint64_t v70 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v68 initWithProperty:@"item_stats.play_count_user" direction:v69];
      v204[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v70];
      v204[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v70];
      v204[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v70];
      v204[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v70];
      v204[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v70];
      v204[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v204;
      goto LABEL_263;
    case 0x1Bu:
      v71 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v72 = 2;
      }
      else {
        uint64_t v72 = 1;
      }
      if (v5) {
        uint64_t v73 = 1;
      }
      else {
        uint64_t v73 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v71 initWithProperty:@"item_stats.date_played" direction:v72];
      v205[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v73];
      v205[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v73];
      v205[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v73];
      v205[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v73];
      v205[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v73];
      v205[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v205;
      goto LABEL_263;
    case 0x1Cu:
      v74 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v75 = 2;
      }
      else {
        uint64_t v75 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v74 initWithProperty:@"disc_number" direction:v75];
      v193[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v75];
      v193[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v75];
      v193[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v75];
      v193[3] = v12;
      id v44 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v45 = v193;
LABEL_104:
      int v6 = [v44 arrayWithObjects:v45 count:4];
      goto LABEL_266;
    case 0x1Du:
      v76 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v77 = 2;
      }
      else {
        uint64_t v77 = 1;
      }
      if (v5) {
        uint64_t v78 = 1;
      }
      else {
        uint64_t v78 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v76 initWithProperty:@"item_stats.user_rating" direction:v77];
      v206[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v78];
      v206[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v78];
      v206[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v78];
      v206[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v78];
      v206[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v78];
      v206[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v206;
      goto LABEL_263;
    case 0x1Eu:
      v79 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v80 = 2;
      }
      else {
        uint64_t v80 = 1;
      }
      if (v5) {
        uint64_t v81 = 1;
      }
      else {
        uint64_t v81 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v79 initWithProperty:@"is_compilation" direction:v80];
      v185[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v81];
      v185[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v81];
      v185[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v81];
      v185[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v81];
      v185[4] = v13;
      int v19 = (void *)MEMORY[0x1E4F1C978];
      int v20 = v185;
      goto LABEL_178;
    case 0x1Fu:
      v82 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v83 = 2;
      }
      else {
        uint64_t v83 = 1;
      }
      if (v5) {
        uint64_t v84 = 1;
      }
      else {
        uint64_t v84 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v82 initWithProperty:@"genre_order" direction:v83];
      v184[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"is_compilation" direction:v83];
      v184[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v84];
      v184[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v84];
      v184[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v84];
      v184[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v84];
      v184[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v184;
      goto LABEL_263;
    case 0x28u:
      v85 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v86 = 2;
      }
      else {
        uint64_t v86 = 1;
      }
      if (v5) {
        uint64_t v87 = 1;
      }
      else {
        uint64_t v87 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v85 initWithProperty:@"item_store.date_released" direction:v86];
      v183[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v87];
      v183[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v87];
      v183[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v87];
      v183[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v87];
      v183[4] = v13;
      int v19 = (void *)MEMORY[0x1E4F1C978];
      int v20 = v183;
      goto LABEL_178;
    case 0x29u:
      uint64_t v88 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v89 = 2;
      }
      else {
        uint64_t v89 = 1;
      }
      if (v5) {
        uint64_t v90 = 1;
      }
      else {
        uint64_t v90 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v88 initWithProperty:@"item_extra.bpm" direction:v89];
      v186[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v90];
      v186[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v90];
      v186[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v90];
      v186[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v90];
      v186[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v90];
      v186[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v186;
      goto LABEL_263;
    case 0x2Bu:
      v91 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v92 = 2;
      }
      else {
        uint64_t v92 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v91 initWithProperty:@"item_extra.grouping" direction:v92];
      v212[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v92];
      v212[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_artist_order" direction:v92];
      v212[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v92];
      v212[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v92];
      v212[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v92];
      v212[5] = v14;
      id v93 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v92];
      v212[6] = v93;
      id v94 = (void *)MEMORY[0x1E4F1C978];
      id v95 = v212;
      goto LABEL_205;
    case 0x2Cu:
      uint64_t v96 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v97 = 2;
      }
      else {
        uint64_t v97 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v96 initWithProperty:@"series_name_order" direction:v97];
      v210[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_video.season_number" direction:v97];
      v210[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"episode_sort_id" direction:v97];
      v210[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"item_video.episode_id" direction:v97];
      v210[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v97];
      v210[4] = v13;
      int v19 = (void *)MEMORY[0x1E4F1C978];
      int v20 = v210;
      goto LABEL_178;
    case 0x2Du:
      uint64_t v98 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v99 = 2;
      }
      else {
        uint64_t v99 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v98 initWithProperty:@"item_video.season_number" direction:v99];
      v202[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"series_name_order" direction:v99];
      v202[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"episode_sort_id" direction:v99];
      v202[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"item_video.episode_id" direction:v99];
      v202[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v99];
      v202[4] = v13;
      int v19 = (void *)MEMORY[0x1E4F1C978];
      int v20 = v202;
      goto LABEL_178;
    case 0x2Eu:
      uint64_t v100 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v101 = 2;
      }
      else {
        uint64_t v101 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v100 initWithProperty:@"item_video.episode_id" direction:v101];
      v209[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v101];
      v209[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v209;
      goto LABEL_255;
    case 0x2Fu:
      uint64_t v102 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v103 = 2;
      }
      else {
        uint64_t v103 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v102 initWithProperty:@"episode_sort_id" direction:v103];
      v208[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_video.episode_id" direction:v103];
      v208[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v103];
      v208[2] = v11;
      int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v208 count:3];
      goto LABEL_267;
    case 0x31u:
      uint64_t v104 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v105 = 2;
      }
      else {
        uint64_t v105 = 1;
      }
      if (v5) {
        uint64_t v106 = 1;
      }
      else {
        uint64_t v106 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v104 initWithProperty:@"item_stats.skip_count_user" direction:v105];
      v201[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v106];
      v201[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v106];
      v201[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v106];
      v201[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v106];
      v201[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v106];
      v201[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v201;
      goto LABEL_263;
    case 0x32u:
      v107 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v108 = 2;
      }
      else {
        uint64_t v108 = 1;
      }
      if (v5) {
        uint64_t v109 = 1;
      }
      else {
        uint64_t v109 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v107 initWithProperty:@"item_stats.date_skipped" direction:v108];
      v200[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v109];
      v200[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v109];
      v200[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v109];
      v200[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v109];
      v200[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v109];
      v200[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v200;
      goto LABEL_263;
    case 0x33u:
      uint64_t v110 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v111 = 2;
      }
      else {
        uint64_t v111 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v110 initWithProperty:@"album_artist_order" direction:v111];
      v215[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v111];
      v215[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v111];
      v215[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v111];
      v215[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v111];
      v215[4] = v13;
      int v19 = (void *)MEMORY[0x1E4F1C978];
      int v20 = v215;
LABEL_178:
      int v6 = [v19 arrayWithObjects:v20 count:5];
      goto LABEL_265;
    case 0x34u:
      uint64_t v112 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v113 = 2;
      }
      else {
        uint64_t v113 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v112 initWithProperty:@"item_artist_order" direction:v113];
      v198[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_extra.year" direction:v113];
      v198[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v113];
      v198[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v113];
      v198[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v113];
      v198[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v113];
      v198[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v198;
      goto LABEL_263;
    case 0x35u:
      id v114 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v115 = 2;
      }
      else {
        uint64_t v115 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v114 initWithProperty:@"item_artist_order" direction:v115];
      v199[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v115];
      v199[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v115];
      v199[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v115];
      v199[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v115];
      v199[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v115];
      v199[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v199;
      goto LABEL_263;
    case 0x36u:
      v116 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v117 = 2;
      }
      else {
        uint64_t v117 = 1;
      }
      if (v5) {
        uint64_t v118 = 1;
      }
      else {
        uint64_t v118 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v116 initWithProperty:@"album.user_rating" direction:v117];
      v181[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v118];
      v181[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v118];
      v181[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v118];
      v181[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v118];
      v181[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v118];
      v181[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v181;
      goto LABEL_263;
    case 0x37u:
      uint64_t v9 = _ML3LogCategoryDefault();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_197;
      }
      *(_DWORD *)long long buf = 67109120;
      unsigned int v168 = 55;
      objc_super v29 = "Unsupported order type: %u";
      goto LABEL_196;
    case 0x38u:
      uint64_t v119 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v120 = 2;
      }
      else {
        uint64_t v120 = 1;
      }
      if (v5) {
        uint64_t v121 = 1;
      }
      else {
        uint64_t v121 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v119 initWithProperty:@"composer_order" direction:v120];
      v180[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v121];
      v180[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_artist_order" direction:v121];
      v180[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v121];
      v180[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v121];
      v180[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v121];
      v180[5] = v14;
      id v93 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v121];
      v180[6] = v93;
      id v94 = (void *)MEMORY[0x1E4F1C978];
      id v95 = v180;
LABEL_205:
      int v6 = [v94 arrayWithObjects:v95 count:7];

      goto LABEL_264;
    case 0x39u:
      uint64_t v122 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v123 = 2;
      }
      else {
        uint64_t v123 = 1;
      }
      if (v5) {
        uint64_t v124 = 1;
      }
      else {
        uint64_t v124 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v122 initWithProperty:@"category.category" direction:v123];
      v179[0] = v9;
      v166 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v124];
      v179[1] = v166;
      v165 = [[ML3OrderingTerm alloc] initWithProperty:@"album_artist_order" direction:v124];
      v179[2] = v165;
      v164 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v124];
      v179[3] = v164;
      v125 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v124];
      v179[4] = v125;
      uint64_t v126 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v124];
      v179[5] = v126;
      v127 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v124];
      v179[6] = v127;
      uint64_t v128 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v124];
      v179[7] = v128;
      v129 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v124];
      v179[8] = v129;
      uint64_t v130 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v124];
      v179[9] = v130;
      v131 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v124];
      v179[10] = v131;
      uint64_t v132 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v124];
      v179[11] = v132;
      v133 = (void *)MEMORY[0x1E4F1C978];
      id v134 = v179;
      goto LABEL_238;
    case 0x3Au:
      long long v135 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v136 = 2;
      }
      else {
        uint64_t v136 = 1;
      }
      if (v5) {
        uint64_t v137 = 1;
      }
      else {
        uint64_t v137 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v135 initWithProperty:@"genre_order" direction:v136];
      v177[0] = v9;
      v166 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v137];
      v177[1] = v166;
      v165 = [[ML3OrderingTerm alloc] initWithProperty:@"album_artist_order" direction:v137];
      v177[2] = v165;
      v164 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v137];
      v177[3] = v164;
      v125 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v137];
      v177[4] = v125;
      uint64_t v126 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v137];
      v177[5] = v126;
      v127 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v137];
      v177[6] = v127;
      uint64_t v128 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v137];
      v177[7] = v128;
      v129 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v137];
      v177[8] = v129;
      uint64_t v130 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v137];
      v177[9] = v130;
      v131 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v137];
      v177[10] = v131;
      uint64_t v132 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v137];
      v177[11] = v132;
      v133 = (void *)MEMORY[0x1E4F1C978];
      id v134 = v177;
      goto LABEL_238;
    case 0x3Bu:
      long long v138 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v139 = 2;
      }
      else {
        uint64_t v139 = 1;
      }
      if (v5) {
        uint64_t v140 = 1;
      }
      else {
        uint64_t v140 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v138 initWithProperty:@"genre_order" direction:v139];
      v176[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v139];
      v176[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v140];
      v176[2] = v11;
      v141 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v140];
      v176[3] = v141;
      v142 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v140];
      v176[4] = v142;
      v143 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v140];
      v176[5] = v143;
      v144 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v140];
      v176[6] = v144;
      int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:7];

      goto LABEL_267;
    case 0x3Cu:
      v145 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v146 = 2;
      }
      else {
        uint64_t v146 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v145 initWithProperty:@"item_extra.genius_id" direction:v146];
      v175[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v146];
      v175[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v175;
      goto LABEL_255;
    case 0x3Du:
      v147 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v148 = 2;
      }
      else {
        uint64_t v148 = 1;
      }
      if (v5) {
        uint64_t v149 = 1;
      }
      else {
        uint64_t v149 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v147 initWithProperty:@"item_store.feed_url" direction:v148];
      v178[0] = v9;
      v166 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v149];
      v178[1] = v166;
      v165 = [[ML3OrderingTerm alloc] initWithProperty:@"album_artist_order" direction:v149];
      v178[2] = v165;
      v164 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v149];
      v178[3] = v164;
      v125 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v149];
      v178[4] = v125;
      uint64_t v126 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v149];
      v178[5] = v126;
      v127 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v149];
      v178[6] = v127;
      uint64_t v128 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v149];
      v178[7] = v128;
      v129 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v149];
      v178[8] = v129;
      uint64_t v130 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v149];
      v178[9] = v130;
      v131 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v149];
      v178[10] = v131;
      uint64_t v132 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v149];
      v178[11] = v132;
      v133 = (void *)MEMORY[0x1E4F1C978];
      id v134 = v178;
LABEL_238:
      int v6 = [v133 arrayWithObjects:v134 count:12];

      break;
    case 0x3Eu:
      v150 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v151 = 2;
      }
      else {
        uint64_t v151 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v150 initWithProperty:@"item_store.store_item_id" direction:v151];
      v174 = v9;
      uint64_t v27 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v28 = &v174;
      goto LABEL_277;
    case 0x43u:
      v152 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v153 = 2;
      }
      else {
        uint64_t v153 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v152 initWithProperty:@"item_extra.is_user_disabled" direction:v153];
      v171[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v153];
      v171[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v171;
      goto LABEL_255;
    case 0x46u:
      v154 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v155 = 2;
      }
      else {
        uint64_t v155 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v154 initWithProperty:@"item_store.store_saga_id" direction:v155];
      v173[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v155];
      v173[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v173;
      goto LABEL_255;
    case 0x47u:
      v156 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v157 = 2;
      }
      else {
        uint64_t v157 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v156 initWithProperty:@"item_store.account_id" direction:v157];
      v172[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v157];
      v172[1] = v10;
      __int16 v38 = (void *)MEMORY[0x1E4F1C978];
      id v39 = v172;
LABEL_255:
      int v6 = [v38 arrayWithObjects:v39 count:2];
      goto LABEL_268;
    case 0x48u:
      v158 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v159 = 2;
      }
      else {
        uint64_t v159 = 1;
      }
      if (v5) {
        uint64_t v160 = 1;
      }
      else {
        uint64_t v160 = 2;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v158 initWithProperty:@"item_store.cloud_status" direction:v159];
      v170[0] = v9;
      int v10 = [[ML3OrderingTerm alloc] initWithProperty:@"item_artist_order" direction:v160];
      v170[1] = v10;
      unint64_t v11 = [[ML3OrderingTerm alloc] initWithProperty:@"album_order" direction:v160];
      v170[2] = v11;
      int v12 = [[ML3OrderingTerm alloc] initWithProperty:@"disc_number" direction:v160];
      v170[3] = v12;
      id v13 = [[ML3OrderingTerm alloc] initWithProperty:@"track_number" direction:v160];
      v170[4] = v13;
      int v14 = [[ML3OrderingTerm alloc] initWithProperty:@"title_order" direction:v160];
      v170[5] = v14;
      id v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v170;
LABEL_263:
      int v6 = [v15 arrayWithObjects:v16 count:6];
LABEL_264:

LABEL_265:
LABEL_266:

LABEL_267:
LABEL_268:

      break;
    case 0x70u:
      v162 = [ML3OrderingTerm alloc];
      if (v5) {
        uint64_t v163 = 2;
      }
      else {
        uint64_t v163 = 1;
      }
      uint64_t v9 = [(ML3OrderingTerm *)v162 initWithProperty:@"item_stats.liked_state_changed_date" direction:v163];
      v169 = v9;
      uint64_t v27 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v28 = &v169;
LABEL_277:
      int v6 = [v27 arrayWithObjects:v28 count:1];
      break;
    default:
      uint64_t v9 = _ML3LogCategoryDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        unsigned int v168 = a3;
        objc_super v29 = "Unexpected order type: %u";
LABEL_196:
        _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, v29, buf, 8u);
      }
LABEL_197:
      int v6 = 0;
      break;
  }

LABEL_270:

  return v6;
}

+ (id)containerQueryWithContainer:(id)a3 predicate:(id)a4 orderingTerms:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [[ML3ContainerQuery alloc] initWithEntityClass:a1 container:v10 predicate:v9 orderingTerms:v8];

  return v11;
}

+ (id)containerQueryWithContainer:(id)a3 predicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[ML3ContainerQuery alloc] initWithEntityClass:a1 container:v7 predicate:v6 orderingTerms:0];

  return v8;
}

+ (id)containerQueryWithContainer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[ML3ContainerQuery alloc] initWithEntityClass:a1 container:v4 predicate:0 orderingTerms:0];

  return v5;
}

- (BOOL)_populateLocationPropertiesWithPath:(id)a3 protectionType:(int64_t)a4 fromLibrary:(id)a5 usingConnection:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v11 length]) {
    int v15 = [v14 fileExistsAtPath:v11] ^ 1;
  }
  else {
    int v15 = 1;
  }
  if ([v11 length] && v15)
  {
    id v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v33 = v11;
      _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "populateLocationPropertiesWithPath called with invalid path '%{public}@'", buf, 0xCu);
    }
  }
  if (v15)
  {
    id v17 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ML3Entity persistentID](self, "persistentID"));
    uint64_t v31 = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    +[ML3Track clearLocationFromLibrary:v12 persistentIDs:v18];
  }
  else
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __109__ML3Track_ML3TrackImporter___populateLocationPropertiesWithPath_protectionType_fromLibrary_usingConnection___block_invoke;
    char v23 = &unk_1E5FB5940;
    uint64_t v24 = self;
    id v25 = v14;
    id v26 = v11;
    SEL v29 = a2;
    id v27 = v12;
    int64_t v30 = a4;
    id v28 = v13;
    [v28 performTransactionWithBlock:&v20];
  }
  [(ML3Track *)self updateCollectionCloudStatus];
  [(ML3Track *)self updateIntegrity];

  return 1;
}

BOOL __109__ML3Track_ML3TrackImporter___populateLocationPropertiesWithPath_protectionType_fromLibrary_usingConnection___block_invoke(uint64_t a1)
{
  v104[7] = *MEMORY[0x1E4F143B8];
  v2 = @"keep_local";
  v104[0] = @"keep_local";
  id v3 = @"keep_local_status";
  v104[1] = @"keep_local_status";
  id v4 = @"keep_local_status_reason";
  v104[2] = @"keep_local_status_reason";
  BOOL v5 = @"(IFNULL(base_location.path, '') || '/' || item_extra.location)";
  v104[3] = @"(IFNULL(base_location.path, '') || '/' || item_extra.location)";
  id v6 = @"item_store.key_id";
  v104[4] = @"item_store.key_id";
  id v7 = @"media_type";
  v104[5] = @"media_type";
  id v8 = @"(CASE WHEN LENGTH(IFNULL(chapter.chapter_data,'')) > 0 THEN 1 ELSE 0 END)";
  v104[6] = @"(CASE WHEN LENGTH(IFNULL(chapter.chapter_data,'')) > 0 THEN 1 ELSE 0 END)";
  id v103 = 0;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v100 = 0u;
  [*(id *)(a1 + 32) getValues:&v100 forProperties:v104 count:7];
  id v9 = @"base_location_id";
  v99[0] = @"base_location_id";
  id v10 = @"item_extra.location";
  v99[1] = @"item_extra.location";
  id v11 = @"item_extra.file_size";
  v99[2] = @"item_extra.file_size";
  id v12 = @"item_stats.needs_restore";
  v99[3] = @"item_stats.needs_restore";
  id v13 = @"keep_local";
  v99[4] = @"keep_local";
  id v14 = @"keep_local_status";
  v99[5] = @"keep_local_status";
  int v15 = @"keep_local_status_reason";
  v99[6] = @"keep_local_status_reason";
  id v16 = @"item_store.is_protected";
  v99[7] = @"item_store.is_protected";
  id v17 = @"item_stats.download_identifier";
  v99[8] = @"item_stats.download_identifier";
  uint64_t v18 = @"item_stats.date_accessed";
  v99[9] = @"item_stats.date_accessed";
  int v19 = @"date_downloaded";
  v99[10] = @"date_downloaded";
  uint64_t v98 = 0;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v93 = 0u;
  uint64_t v20 = *(void **)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 48);
  id v87 = 0;
  uint64_t v22 = [v20 attributesOfItemAtPath:v21 error:&v87];
  id v23 = v87;
  if (v22)
  {
    uint64_t v24 = [v22 objectForKey:*MEMORY[0x1E4F283B8]];
    id v84 = v23;
    if ([v24 isEqualToString:*MEMORY[0x1E4F283C0]]) {
      [NSNumber numberWithLong:MSVGetDiskUsageForPath()];
    }
    else {
    uint64_t v25 = [v22 objectForKey:*MEMORY[0x1E4F28390]];
    }
    id v27 = (void *)v94;
    *(void *)&long long v94 = v25;

    id v28 = [*(id *)(a1 + 48) lastPathComponent];
    if (![v28 length])
    {
      uint64_t v81 = [MEMORY[0x1E4F28B00] currentHandler];
      [v81 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"ML3TrackImporter.m", 460, @"populateLocationPropertiesWithPath passed file with invalid name '%@'", v28 object file lineNumber description];
    }
    uint64_t v83 = v28;
    objc_storeStrong((id *)&v93 + 1, v28);
    SEL v29 = *(void **)(a1 + 56);
    int64_t v30 = [*(id *)(a1 + 48) stringByDeletingLastPathComponent];
    uint64_t v31 = [v29 mediaFolderRelativePath:v30];

    uint64_t v32 = *(void *)(a1 + 56);
    v85 = (void *)v31;
    id v33 = +[ML3ComparisonPredicate predicateWithProperty:@"path" equalToValue:v31];
    id v34 = +[ML3Entity anyInLibrary:v32 predicate:v33];

    if (!v34)
    {
      id v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v85, @"path", 0);
      id v34 = +[ML3BaseLocation newWithDictionary:v35 inLibrary:*(void *)(a1 + 56)];
    }
    uint64_t v36 = [v34 valueForProperty:@"ROWID"];
    uint64_t v37 = (void *)v93;
    *(void *)&long long v93 = v36;

    __int16 v38 = (void *)*((void *)&v94 + 1);
    *((void *)&v94 + 1) = MEMORY[0x1E4F1CC28];

    id v39 = (void *)v97;
    *(void *)&long long v97 = 0;

    if ((int)[(id)v93 intValue] >= 250 && objc_msgSend((id)v100, "integerValue") <= 0)
    {
      if ([*((id *)&v100 + 1) integerValue] == 1 || (MSVDeviceIsWatch() & 1) != 0)
      {
        uint64_t v41 = (void *)v95;
        *(void *)&long long v95 = &unk_1F0911560;
      }
      else
      {
        uint64_t v41 = (void *)v95;
        *(void *)&long long v95 = &unk_1F0911548;
      }
    }
    else
    {
      id v40 = (id)v100;
      uint64_t v41 = (void *)v95;
      *(void *)&long long v95 = v40;
    }

    if ((int)[(id)v93 intValue] <= 249) {
      id v42 = &unk_1F0911560;
    }
    else {
      id v42 = &unk_1F0911578;
    }
    objc_storeStrong((id *)&v95 + 1, v42);
    uint64_t v43 = (void *)v96;
    *(void *)&long long v96 = &unk_1F0911590;

    uint64_t v44 = [NSNumber numberWithInteger:*(void *)(a1 + 80)];
    uint64_t v45 = (void *)*((void *)&v96 + 1);
    *((void *)&v96 + 1) = v44;

    if (!*(void *)(a1 + 80))
    {
      id v46 = (id)v102;
      if ([v46 integerValue])
      {
        uint64_t v47 = (void *)*((void *)&v96 + 1);
        *((void *)&v96 + 1) = &unk_1F09115A8;
      }
    }
    uint64_t v48 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v49 = (void *)*((void *)&v97 + 1);
    *((void *)&v97 + 1) = v48;

    uint64_t v50 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v51 = v98;
    uint64_t v98 = (void *)v50;

    [*(id *)(a1 + 32) setValues:&v93 forProperties:v99 count:11];
    v52 = *(void **)(a1 + 64);
    uint64_t v53 = [MEMORY[0x1E4F1C9C8] date];
    v88[0] = v53;
    __int16 v54 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
    v88[1] = v54;
    uint64_t v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
    id v86 = 0;
    [v52 executeUpdate:@"update container set date_downloaded=? where container_pid in (select DISTINCT container_pid from (select container_pid from container_item join container using(container_pid) where keep_local > 0 AND item_pid=?))" withParameters:v55 error:&v86];
    id v56 = v86;

    if (v56)
    {
      uint64_t v57 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        uint64_t v58 = [*(id *)(a1 + 32) persistentID];
        *(_DWORD *)long long buf = 134218242;
        uint64_t v90 = v58;
        __int16 v91 = 2114;
        id v92 = v56;
        _os_log_impl(&dword_1B022D000, v57, OS_LOG_TYPE_ERROR, "updating container for item_pid=%lld finished with error=%{public}@", buf, 0x16u);
      }
    }
    int v59 = [*((id *)&v102 + 1) integerValue];
    char v60 = [v103 BOOLValue];
    if (v59 == 2 && (v60 & 1) == 0)
    {
      id v61 = objc_alloc(MEMORY[0x1E4F166C8]);
      uint64_t v62 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 48)];
      long long v63 = (void *)[v61 initWithURL:v62 options:0];

      if (v63)
      {
        uint64_t v64 = +[ML3Track importChaptersByParsingAsset:v63];
        if (v64)
        {
          uint64_t v65 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1B022D000, v65, OS_LOG_TYPE_DEFAULT, "updating chapter data from asset file", buf, 2u);
          }

          [*(id *)(a1 + 32) populateChapterDataWithImportChapters:v64];
        }
      }
    }
    id v66 = *((id *)&v101 + 1);
    if (v66)
    {
      uint64_t v67 = *(void *)(a1 + 56);
      uint64_t v68 = +[ML3ComparisonPredicate predicateWithProperty:@"(IFNULL(base_location.path, '') || '/' || item_extra.location)" equalToValue:v66];
      uint64_t v69 = +[ML3Entity anyInLibrary:v67 predicate:v68 options:7];

      if (!v69)
      {
        v82 = v24;
        uint64_t v70 = [*(id *)(a1 + 56) mediaFolderPathByAppendingPathComponent:v66];
        v71 = [v70 pathExtension];
        if (v71
          && (objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"movpkg", @"m4bpkg", 0),
              uint64_t v72 = objc_claimAutoreleasedReturnValue(),
              int v73 = [v72 containsObject:v71],
              v72,
              v73))
        {
          v74 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v90 = (uint64_t)v70;
            _os_log_impl(&dword_1B022D000, v74, OS_LOG_TYPE_DEFAULT, "Marking orphan asset purgeable at path: %{public}@", buf, 0xCu);
          }

          MSVEnableDirStatsForDirectory();
          [*(id *)(a1 + 56) markSystemPurgeableMusicPath:v70 forUrgency:0];
        }
        else
        {
          uint64_t v75 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v90 = (uint64_t)v70;
            _os_log_impl(&dword_1B022D000, v75, OS_LOG_TYPE_DEFAULT, "Deleting orphan asset at path: %{public}@", buf, 0xCu);
          }

          v76 = [MEMORY[0x1E4F1CAD0] setWithObject:v70];
          ML3DeleteAssetsAtPaths(v76);
        }
        uint64_t v24 = v82;
      }
    }
    id v23 = v84;
  }
  else
  {
    uint64_t v24 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v90 = v26;
      __int16 v91 = 2114;
      id v92 = v23;
      _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_ERROR, "failed to obtain file attributes for %{public}@. err=%{public}@", buf, 0x16u);
    }
  }

  for (uint64_t i = 80; i != -8; i -= 8)
  for (uint64_t j = 10; j != -1; --j)

  for (uint64_t k = 6; k != -1; --k)
  return v22 != 0;
}

- (void)populateLocationPropertiesWithPath:(id)a3 protectionType:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ML3Entity *)self library];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __96__ML3Track_ML3TrackImporter__populateLocationPropertiesWithPath_protectionType_completionBlock___block_invoke;
  v13[3] = &unk_1E5FB58E0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v10;
  int64_t v16 = a4;
  id v11 = v10;
  id v12 = v8;
  [v11 performAsyncDatabaseWriteTransactionWithBlock:v13 completionBlock:v9];
}

uint64_t __96__ML3Track_ML3TrackImporter__populateLocationPropertiesWithPath_protectionType_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _populateLocationPropertiesWithPath:*(void *)(a1 + 40) protectionType:*(void *)(a1 + 56) fromLibrary:*(void *)(a1 + 48) usingConnection:a2];
}

- (void)populateLocationPropertiesWithPath:(id)a3 protectionType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ML3Entity *)self library];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__ML3Track_ML3TrackImporter__populateLocationPropertiesWithPath_protectionType___block_invoke;
  void v10[3] = &unk_1E5FB58E0;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  int64_t v13 = a4;
  id v8 = v7;
  id v9 = v6;
  [v8 performDatabaseTransactionWithBlock:v10];
}

uint64_t __80__ML3Track_ML3TrackImporter__populateLocationPropertiesWithPath_protectionType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _populateLocationPropertiesWithPath:*(void *)(a1 + 40) protectionType:*(void *)(a1 + 56) fromLibrary:*(void *)(a1 + 48) usingConnection:a2];
}

- (void)populateLocationPropertiesWithPath:(id)a3 isProtected:(BOOL)a4
{
}

- (void)populateLocationPropertiesWithPath:(id)a3
{
}

- (void)populateChapterDataWithImportChapters:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ML3Track_ML3TrackImporter__populateChapterDataWithImportChapters___block_invoke;
  v7[3] = &unk_1E5FB58B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained performDatabaseTransactionWithBlock:v7];
}

uint64_t __68__ML3Track_ML3TrackImporter__populateChapterDataWithImportChapters___block_invoke(uint64_t a1)
{
  v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  BOOL v5 = objc_msgSend(v2, "flattenedChapterDataWithImportChapters:library:trackPersistentID:", v3, WeakRetained, objc_msgSend(*(id *)(a1 + 32), "persistentID"));

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    [v6 setValue:v5 forProperty:@"chapter.chapter_data"];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
    [v6 setValue:v7 forProperty:@"chapter.chapter_data"];
  }
  return 1;
}

- (BOOL)populateArtworkCacheWithArtworkData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [[ML3ArtworkTokenSet alloc] initWithEntity:self artworkType:1];
    id v6 = [(ML3ArtworkTokenSet *)v5 artworkTokenForSource:500];
    if ([v6 length])
    {
      id v7 = [(ML3Entity *)self valueForProperty:@"media_type"];
      uint64_t v8 = [v7 integerValue];

      id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
      char v10 = [WeakRetained importOriginalArtworkFromImageData:v4 withArtworkToken:v6 artworkType:1 sourceType:500 mediaType:v8];
    }
    else
    {
      id v11 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 134217984;
        int64_t v14 = [(ML3Entity *)self persistentID];
        _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "Attempting to import store item artwork with invalid artwork token for item pid %lld", (uint8_t *)&v13, 0xCu);
      }

      char v10 = 0;
    }
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

+ (id)importChaptersByParsingAsset:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 availableChapterLocales];
  if ([v5 count])
  {
    id v32 = a1;
    id v6 = [MEMORY[0x1E4F1CA20] systemLocale];
    id v33 = v5;
    if (([v5 containsObject:v6] & 1) == 0)
    {
      uint64_t v7 = [v5 objectAtIndex:0];

      id v6 = (void *)v7;
    }
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v43 = *MEMORY[0x1E4F15C98];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
    id v34 = v4;
    uint64_t v31 = v6;
    id v9 = [v4 chapterMetadataGroupsWithTitleLocale:v6 containingItemsWithCommonKeys:v8];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    obuint64_t j = v9;
    uint64_t v37 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v37)
    {
      uint64_t v36 = *(void *)v53;
      uint64_t v40 = *MEMORY[0x1E4F15CD0];
      uint64_t v39 = *MEMORY[0x1E4F15CF0];
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v53 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = v10;
          id v11 = [*(id *)(*((void *)&v52 + 1) + 8 * v10) items];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v41 = v11;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v44 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v49 != v44) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
                id v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"commonKey", @"extraAttributes", @"time", @"value", 0);
                v46[0] = MEMORY[0x1E4F143A8];
                v46[1] = 3221225472;
                v46[2] = __59__ML3Track_ML3TrackImporter__importChaptersByParsingAsset___block_invoke;
                v46[3] = &unk_1E5FB8298;
                uint64_t v18 = v16;
                uint64_t v47 = v18;
                [v15 loadValuesAsynchronouslyForKeys:v17 completionHandler:v46];

                dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
                if (v15) {
                  [v15 time];
                }
                else {
                  memset(&time, 0, sizeof(time));
                }
                unint64_t v19 = (unint64_t)(floor(CMTimeGetSeconds(&time)) * 1000.0);
                uint64_t v20 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v19];
                uint64_t v21 = [v15 commonKey];
                if ([v21 isEqualToString:v43])
                {
                  uint64_t v22 = [v15 dataValue];
                }
                else
                {
                  if ([v21 isEqualToString:v40])
                  {
                    id v23 = [v15 stringValue];
                    uint64_t v24 = [v15 extraAttributes];
                    uint64_t v25 = [v24 objectForKey:v39];

                    uint64_t v22 = 0;
                    goto LABEL_23;
                  }
                  uint64_t v22 = 0;
                }
                id v23 = 0;
                uint64_t v25 = 0;
                if (v22) {
                  goto LABEL_25;
                }
LABEL_23:
                if (v23 || v25)
                {
LABEL_25:
                  uint64_t v26 = [v42 objectForKey:v20];
                  if (v26)
                  {
                    if (v22) {
                      goto LABEL_27;
                    }
LABEL_29:
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v25];
                      [(MLTrackImportChapter *)v26 setURL:v27];
                      [(MLTrackImportChapter *)v26 setURLTitle:v23];
                    }
                    else if (v23)
                    {
                      [(MLTrackImportChapter *)v26 setTitle:v23];
                    }
                  }
                  else
                  {
                    uint64_t v26 = objc_alloc_init(MLTrackImportChapter);
                    [(MLTrackImportChapter *)v26 setStartTimeInMilliseconds:v19];
                    [v42 setObject:v26 forKey:v20];
                    if (!v22) {
                      goto LABEL_29;
                    }
LABEL_27:
                    [(MLTrackImportChapter *)v26 setImageData:v22];
                  }
                }
              }
              uint64_t v13 = [v41 countByEnumeratingWithState:&v48 objects:v56 count:16];
            }
            while (v13);
          }

          uint64_t v10 = v38 + 1;
        }
        while (v38 + 1 != v37);
        uint64_t v37 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v37);
    }

    id v28 = [v42 allValues];
    SEL v29 = [v32 _normalizedImportChapters:v28 trackPersistentID:0];

    BOOL v5 = v33;
    id v4 = v34;
  }
  else
  {
    SEL v29 = 0;
  }

  return v29;
}

intptr_t __59__ML3Track_ML3TrackImporter__importChaptersByParsingAsset___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)flattenedChapterDataFromDAAPInfoDictionary:(id)a3 trackPersistentID:(int64_t)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKey:@"chapters"];
  uint64_t v8 = [v7 objectForKey:@"time-format"];

  if (v8 && ([v8 isEqualToString:@"decimal-seconds"] & 1) == 0)
  {
    uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      long long v54 = v8;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "Unknown time format in chapter data: %{public}@, returning nil", buf, 0xCu);
    }
    id v28 = 0;
    goto LABEL_29;
  }
  int64_t v43 = a4;
  uint64_t v44 = v8;
  unint64_t v9 = 0x1E4F1C000uLL;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale", a1);
  uint64_t v47 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v45 = v6;
  id v11 = [v6 objectForKey:@"chapters"];
  uint64_t v12 = [v11 objectForKey:@"locales"];

  uint64_t v13 = [v12 count];
  uint64_t v14 = *MEMORY[0x1E4F1C438];
  if (!v13) {
    goto LABEL_17;
  }
  uint64_t v15 = 0;
  uint64_t v46 = *MEMORY[0x1E4F1C400];
  while (1)
  {
    id v16 = objc_alloc(*(Class *)(v9 + 2592));
    id v17 = [v12 objectAtIndex:v15];
    uint64_t v18 = (void *)[v16 initWithLocaleIdentifier:v17];

    unint64_t v19 = [v18 objectForKey:v14];
    uint64_t v20 = [v10 objectForKey:v14];
    if (([v19 isEqualToString:v20] & 1) == 0)
    {

      if (!v18) {
        goto LABEL_9;
      }
LABEL_8:
      id v27 = [v18 objectForKey:v14];
      [v47 addObject:v27];

      goto LABEL_9;
    }
    uint64_t v21 = [v18 objectForKey:v46];
    [v10 objectForKey:v46];
    uint64_t v22 = v14;
    unint64_t v23 = v9;
    uint64_t v24 = v12;
    uint64_t v26 = v25 = v10;
    char v48 = [v21 isEqualToString:v26];

    uint64_t v10 = v25;
    uint64_t v12 = v24;
    unint64_t v9 = v23;
    uint64_t v14 = v22;

    if (v48) {
      break;
    }
    if (v18) {
      goto LABEL_8;
    }
LABEL_9:

    if ([v12 count] <= (unint64_t)++v15) {
      goto LABEL_17;
    }
  }
  SEL v29 = [v12 objectAtIndex:v15];

  if (!v29)
  {
LABEL_17:
    int64_t v30 = [v10 objectForKey:v14];
    uint64_t v31 = [v47 indexOfObject:v30];
    if (v31 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_22;
    }
    if ([v47 count])
    {
      id v32 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = [v10 localeIdentifier];
        id v34 = [v12 objectAtIndex:0];
        *(_DWORD *)long long buf = 138543618;
        long long v54 = v33;
        __int16 v55 = 2114;
        id v56 = v34;
        _os_log_impl(&dword_1B022D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ not found in locales, using %{public}@ instead", buf, 0x16u);
      }
      uint64_t v31 = 0;
LABEL_22:
      SEL v29 = [v12 objectAtIndex:v31];
    }
    else
    {
      SEL v29 = 0;
    }
  }
  id v6 = v45;
  id v35 = [v45 objectForKey:@"chapters"];
  uint64_t v36 = [v35 objectForKey:@"chapter-list"];

  uint64_t v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v36, "count"));
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __91__ML3Track_ML3TrackImporter__flattenedChapterDataFromDAAPInfoDictionary_trackPersistentID___block_invoke;
  v49[3] = &unk_1E5FB5890;
  id v50 = v29;
  int64_t v52 = v43;
  id v38 = v37;
  id v51 = v38;
  id v39 = v29;
  [v36 enumerateObjectsUsingBlock:v49];
  id v28 = [v42 flattenedChapterDataWithImportChapters:v38 library:0 trackPersistentID:v43];
  if (!v28)
  {
    uint64_t v40 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      long long v54 = 0;
      _os_log_impl(&dword_1B022D000, v40, OS_LOG_TYPE_ERROR, "Could not create flattened item chapters: %ld", buf, 0xCu);
    }
  }
  uint64_t v8 = v44;
LABEL_29:

  return v28;
}

void __91__ML3Track_ML3TrackImporter__flattenedChapterDataFromDAAPInfoDictionary_trackPersistentID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = objc_alloc_init(MLTrackImportChapter);
  id v4 = [v3 objectForKey:@"start"];
  [v4 floatValue];
  uint64_t v6 = (float)(v5 * 1000.0);

  [(MLTrackImportChapter *)v10 setStartTimeInMilliseconds:v6];
  uint64_t v7 = [v3 objectForKey:@"titles"];

  uint64_t v8 = [v7 objectForKey:*(void *)(a1 + 32)];
  [(MLTrackImportChapter *)v10 setTitle:v8];

  unint64_t v9 = +[ML3MusicLibrary artworkTokenForChapterWithItemPID:*(void *)(a1 + 48) retrievalTime:(double)v6];
  [(MLTrackImportChapter *)v10 setImageCacheKey:v9];

  [*(id *)(a1 + 40) addObject:v10];
}

+ (id)flattenedChapterDataFromSyncInfoDictionaries:(id)a3 trackPersistentID:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  float v5 = v4;
  if (v4 && [v4 count])
  {
    int v6 = ChapterData_Create();
    uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "Could not create chapter data: %ld", buf, 0xCu);
    }
  }

  return 0;
}

void __93__ML3Track_ML3TrackImporter__flattenedChapterDataFromSyncInfoDictionaries_trackPersistentID___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v3 = objc_alloc_init(MLTrackImportChapter);
  id v4 = [v17 objectForKey:@"start_time_ms"];
  unsigned int v5 = [v4 integerValue];

  [(MLTrackImportChapter *)v3 setStartTimeInMilliseconds:v5];
  int v6 = [v17 objectForKey:@"name"];
  [(MLTrackImportChapter *)v3 setTitle:v6];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v8 = [v17 objectForKey:@"url"];
  unint64_t v9 = [v7 URLWithString:v8];
  [(MLTrackImportChapter *)v3 setURL:v9];

  uint64_t v10 = [v17 objectForKey:@"url_title"];
  uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v12 = [v10 stringByTrimmingCharactersInSet:v11];

  [(MLTrackImportChapter *)v3 setURLTitle:v12];
  uint64_t v13 = [v17 objectForKey:@"artwork_start_time_ms"];

  if (v13)
  {
    uint64_t v14 = [v17 objectForKey:@"artwork_start_time_ms"];
    int v15 = [v14 integerValue];

    if ((v15 & 0x80000000) == 0)
    {
      id v16 = +[ML3MusicLibrary artworkTokenForChapterWithItemPID:*(void *)(a1 + 40) retrievalTime:(double)v15 / 1000.0];
      [(MLTrackImportChapter *)v3 setImageCacheKey:v16];
    }
  }
  [*(id *)(a1 + 32) addObject:v3];
}

+ (id)flattenedChapterDataWithImportChapters:(id)a3 library:(id)a4 trackPersistentID:(int64_t)a5
{
  id v8 = a4;
  unint64_t v9 = [a1 _normalizedImportChapters:a3 trackPersistentID:a5];
  if ([v9 count])
  {
    uint64_t v21 = 0;
    ChapterData_Create();
    uint64_t v10 = [v9 sortedArrayUsingSelector:sel_compare_];
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__13071;
    void v19[4] = __Block_byref_object_dispose__13072;
    id v20 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __95__ML3Track_ML3TrackImporter__flattenedChapterDataWithImportChapters_library_trackPersistentID___block_invoke;
    v13[3] = &unk_1E5FB5840;
    id v11 = v10;
    id v16 = v19;
    uint64_t v17 = v21;
    id v14 = v11;
    id v15 = v8;
    int64_t v18 = a5;
    [v11 enumerateObjectsUsingBlock:v13];
    ChapterData_ExportFlattenedData();
    ChapterData_Release();

    _Block_object_dispose(v19, 8);
  }

  return 0;
}

void __95__ML3Track_ML3TrackImporter__flattenedChapterDataWithImportChapters_library_trackPersistentID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = a3 + 1;
  if (v6 >= [*(id *)(a1 + 32) count])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) objectAtIndex:v6];
  }
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v39 = *(void *)(a1 + 64);
  id v45 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v10 = v5;
  id v41 = v7;
  id v42 = v8;
  uint64_t v11 = [v10 startTimeInMilliseconds];
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  char v55 = 0;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __MLChapterDataAddImportChapter_block_invoke;
  v53[3] = &unk_1E5FB5968;
  v53[4] = v54;
  v53[5] = v9;
  uint64_t v44 = v11;
  v53[6] = v11;
  uint64_t v12 = (void *)MEMORY[0x1B3E93EE0](v53);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __MLChapterDataAddImportChapter_block_invoke_2;
  v51[3] = &unk_1E5FB5990;
  int64_t v43 = v12;
  int64_t v52 = v43;
  uint64_t v13 = (uint64_t (**)(void, void, void, void))MEMORY[0x1B3E93EE0](v51);
  id v14 = [v10 title];
  id v15 = [v45 title];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __MLChapterDataAddImportChapter_block_invoke_3;
  v50[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
  v50[4] = v9;
  v50[5] = v44;
  LOBYTE(v8) = ((uint64_t (**)(void, void *, void *, void *))v13)[2](v13, v14, v15, v50);

  if ((v8 & 1) == 0)
  {
    id v16 = v45;
    if (!v45) {
      id v16 = v10;
    }
    id v17 = v16;
    int64_t v18 = v41;
    if (!v41) {
      int64_t v18 = v10;
    }
    id v19 = v18;
    id v20 = [v17 title];
    if (![v20 length])
    {
      uint64_t v21 = [v19 title];
      if (![v21 length])
      {
        int v38 = [v17 isEqualIgnoringTimesAndTitle:v19];

        if (v38)
        {
          v43[2]();
          MLChapterDataSetUTF16Value(v9, &stru_1F08D4D70);
        }
        goto LABEL_13;
      }
    }
LABEL_13:
  }
  uint64_t v22 = objc_msgSend(v10, "URL", v39);
  unint64_t v23 = [v22 absoluteString];
  uint64_t v24 = [v45 URL];
  uint64_t v25 = [v24 absoluteString];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __MLChapterDataAddImportChapter_block_invoke_4;
  v46[3] = &unk_1E5FB59D8;
  uint64_t v48 = v9;
  uint64_t v49 = v44;
  id v26 = v10;
  id v47 = v26;
  ((uint64_t (**)(void, void *, void *, void *))v13)[2](v13, v23, v25, v46);

  id v27 = [v26 imageData];
  if (v27)
  {
    v43[2]();
    id v28 = [v26 imageCacheKey];
    id v29 = v27;
    id v30 = v42;
    MLChapterDataSetChapterArtworkCacheKey(v9, v44, v28);
    if ([v29 length])
    {
      id v31 = +[ML3Entity newWithPersistentID:v40 inLibrary:v30];
      id v32 = [v31 valueForProperty:@"media_type"];
      uint64_t v33 = [v32 unsignedIntValue];

      id v34 = +[ML3MusicLibrary artworkTokenForChapterWithItemPID:v40 retrievalTime:(double)(unint64_t)v44];
      [v30 importOriginalArtworkFromImageData:v29 withArtworkToken:v34 artworkType:3 sourceType:300 mediaType:v33];
    }
    goto LABEL_20;
  }
  id v35 = [v26 imageCacheKey];

  if (v35)
  {
    v43[2]();
    id v28 = [v26 imageCacheKey];
    MLChapterDataSetChapterArtworkCacheKey(v9, v44, v28);
LABEL_20:
  }
  _Block_object_dispose(v54, 8);

  uint64_t v36 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v37 = *(void **)(v36 + 40);
  *(void *)(v36 + 40) = v26;
}

+ (id)_normalizedImportChapters:(id)a3 trackPersistentID:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [a3 sortedArrayUsingSelector:sel_compare_];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "normalizeProperties", (void)v14);
        if (a4)
        {
          uint64_t v11 = [v10 imageCacheKey];
          if (!v11)
          {
            uint64_t v12 = [v10 imageData];

            if (!v12) {
              continue;
            }
            uint64_t v11 = +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", a4, (double)(unint64_t)[v10 startTimeInMilliseconds] / 1000.0);
            [v10 setImageCacheKey:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)protocolItemForDynamicUpdate
{
  id v3 = objc_alloc_init(MIPMediaItem);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke;
  block[3] = &unk_1E5FB8298;
  void block[4] = self;
  if (protocolItemForDynamicUpdate_onceToken != -1) {
    dispatch_once(&protocolItemForDynamicUpdate_onceToken, block);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke_2;
  v9[3] = &unk_1E5FB6A58;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [WeakRetained databaseConnectionAllowingWrites:0 withBlock:v9];

  uint64_t v6 = v10;
  uint64_t v7 = v5;

  return v7;
}

void __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke(uint64_t a1)
{
  v25[14] = *MEMORY[0x1E4F143B8];
  v2 = @"media_type";
  v25[0] = @"media_type";
  id v3 = @"item_stats.date_played";
  v25[1] = @"item_stats.date_played";
  id v4 = @"item_store.date_released";
  void v25[2] = @"item_store.date_released";
  id v5 = @"item_stats.date_skipped";
  v25[3] = @"item_stats.date_skipped";
  uint64_t v6 = @"(item.base_location_id > 0)";
  v25[4] = @"(item.base_location_id > 0)";
  uint64_t v7 = @"item_stats.liked_state";
  v25[5] = @"item_stats.liked_state";
  uint64_t v8 = @"item_stats.liked_state_changed";
  v25[6] = @"item_stats.liked_state_changed";
  uint64_t v9 = @"item_stats.play_count_recent";
  v25[7] = @"item_stats.play_count_recent";
  id v10 = @"item_stats.play_count_user";
  v25[8] = @"item_stats.play_count_user";
  uint64_t v11 = @"item_stats.skip_count_recent";
  v25[9] = @"item_stats.skip_count_recent";
  uint64_t v12 = @"item_stats.skip_count_user";
  v25[10] = @"item_stats.skip_count_user";
  uint64_t v13 = @"album.user_rating";
  v25[11] = @"album.user_rating";
  long long v14 = @"item_stats.user_rating";
  v25[12] = @"item_stats.user_rating";
  long long v15 = @"item_stats.liked_state_changed_date";
  v25[13] = @"item_stats.liked_state_changed_date";
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:14];
  long long v17 = (void *)protocolItemForDynamicUpdate___trackProperties;
  protocolItemForDynamicUpdate___trackProperties = v16;

  int64_t v18 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v20 = +[ML3ComparisonPredicate predicateWithProperty:@"ROWID" equalToInt64:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v21 = [v18 unrestrictedAllItemsQueryWithlibrary:WeakRetained predicate:v20 orderingTerms:0];

  uint64_t v22 = [v21 selectPersistentIDsSQLAndProperties:protocolItemForDynamicUpdate___trackProperties ordered:0];
  unint64_t v23 = (void *)protocolItemForDynamicUpdate___sqlQueryStr;
  protocolItemForDynamicUpdate___sqlQueryStr = v22;

  for (uint64_t i = 13; i != -1; --i)
}

void __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = protocolItemForDynamicUpdate___sqlQueryStr;
  id v4 = NSNumber;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
  id v6 = a2;
  uint64_t v7 = [v4 numberWithLongLong:v5];
  v12[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v9 = [v6 executeQuery:v3 withParameters:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke_3;
  void v10[3] = &unk_1E5FB83F8;
  id v11 = *(id *)(a1 + 40);
  [v9 enumerateRowsWithBlock:v10];
}

void __52__ML3Track_MLProtocol__protocolItemForDynamicUpdate__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  *a4 = 1;
  LOWORD(a4) = [v8 intForColumnIndex:1];
  objc_msgSend(*(id *)(a1 + 32), "setLastPlayedDateTime:", objc_msgSend(v8, "int64ForColumnIndex:", 2));
  objc_msgSend(*(id *)(a1 + 32), "setReleaseDateTime:", objc_msgSend(v8, "int64ForColumnIndex:", 3));
  objc_msgSend(*(id *)(a1 + 32), "setLastSkippedDateTime:", objc_msgSend(v8, "int64ForColumnIndex:", 4));
  objc_msgSend(*(id *)(a1 + 32), "setHasLocalAsset:", objc_msgSend(v8, "int64ForColumnIndex:", 5) != 0);
  objc_msgSend(*(id *)(a1 + 32), "setLikedState:", objc_msgSend(v8, "intForColumnIndex:", 6));
  objc_msgSend(*(id *)(a1 + 32), "setLikedStateChanged:", objc_msgSend(v8, "intForColumnIndex:", 7) != 0);
  objc_msgSend(*(id *)(a1 + 32), "setPlayCount:", objc_msgSend(v8, "intForColumnIndex:", 9));
  objc_msgSend(*(id *)(a1 + 32), "setPlayCountDelta:", objc_msgSend(v8, "intForColumnIndex:", 8));
  objc_msgSend(*(id *)(a1 + 32), "setSkipCount:", objc_msgSend(v8, "intForColumnIndex:", 11));
  objc_msgSend(*(id *)(a1 + 32), "setSkipCountDelta:", objc_msgSend(v8, "intForColumnIndex:", 10));
  objc_msgSend(*(id *)(a1 + 32), "setLikedStateChangedDate:", objc_msgSend(v8, "int64ForColumnIndex:", 14));
  if (((unsigned __int16)a4 & 0x408) != 0)
  {
    id v6 = objc_alloc_init(MIPSong);
    -[MIPSong setUserRating:](v6, "setUserRating:", [v8 intForColumnIndex:13]);
    uint64_t v7 = objc_alloc_init(MIPAlbum);
    -[MIPAlbum setUserRating:](v7, "setUserRating:", [v8 intForColumnIndex:12]);
    [(MIPSong *)v6 setAlbum:v7];
    [*(id *)(a1 + 32) setSong:v6];
  }
}

- (id)protocolItem
{
  uint64_t v3 = objc_alloc_init(MIPMediaItem);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ML3Track_MLProtocol__protocolItem__block_invoke;
  block[3] = &unk_1E5FB8298;
  void block[4] = self;
  if (protocolItem_onceToken != -1) {
    dispatch_once(&protocolItem_onceToken, block);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__ML3Track_MLProtocol__protocolItem__block_invoke_2;
  void v10[3] = &unk_1E5FB6A28;
  void v10[4] = self;
  uint64_t v5 = v3;
  id v11 = v5;
  id v12 = WeakRetained;
  id v6 = WeakRetained;
  [v6 databaseConnectionAllowingWrites:0 withBlock:v10];
  uint64_t v7 = v12;
  id v8 = v5;

  return v8;
}

void __36__ML3Track_MLProtocol__protocolItem__block_invoke(uint64_t a1)
{
  v163[152] = *MEMORY[0x1E4F143B8];
  v2 = @"item_extra.title";
  v163[0] = @"item_extra.title";
  uint64_t v3 = @"media_type";
  v163[1] = @"media_type";
  id v4 = @"item_extra.sort_title";
  v163[2] = @"item_extra.sort_title";
  uint64_t v5 = @"item_store.date_released";
  v163[3] = @"item_store.date_released";
  id v6 = @"date_added";
  v163[4] = @"date_added";
  uint64_t v7 = @"item_extra.date_modified";
  v163[5] = @"item_extra.date_modified";
  id v8 = @"item_extra.file_size";
  v163[6] = @"item_extra.file_size";
  uint64_t v9 = @"item_extra.total_time_ms";
  v163[7] = @"item_extra.total_time_ms";
  id v10 = @"item_extra.content_rating";
  v163[8] = @"item_extra.content_rating";
  id v11 = @"(item_extra.content_rating == 1)";
  v163[9] = @"(item_extra.content_rating == 1)";
  id v12 = @"item_extra.description";
  v163[10] = @"item_extra.description";
  uint64_t v13 = @"item_extra.description_long";
  v163[11] = @"item_extra.description_long";
  long long v14 = @"item_extra.copyright";
  v163[12] = @"item_extra.copyright";
  long long v15 = @"best_artwork_token.available_artwork_token AS available_item_artwork_token";
  v163[13] = @"best_artwork_token.available_artwork_token AS available_item_artwork_token";
  uint64_t v16 = @"item_store.store_item_id";
  v163[14] = @"item_store.store_item_id";
  long long v17 = @"item_store.storefront_id";
  v163[15] = @"item_store.storefront_id";
  int64_t v18 = @"item_store.account_id";
  v163[16] = @"item_store.account_id";
  uint64_t v19 = @"item_store.purchase_history_id";
  v163[17] = @"item_store.purchase_history_id";
  id v20 = @"item_store.purchase_history_token";
  v163[18] = @"item_store.purchase_history_token";
  uint64_t v21 = @"item_store.purchase_history_redownload_params";
  v163[19] = @"item_store.purchase_history_redownload_params";
  uint64_t v22 = @"item_store.store_saga_id";
  v163[20] = @"item_store.store_saga_id";
  unint64_t v23 = @"item_store.match_redownload_params";
  v163[21] = @"item_store.match_redownload_params";
  uint64_t v24 = @"item_store.sync_id";
  v163[22] = @"item_store.sync_id";
  uint64_t v25 = @"item_playback.audio_format";
  v163[23] = @"item_playback.audio_format";
  id v26 = @"disc_number";
  v163[24] = @"disc_number";
  id v27 = @"item_extra.genius_id";
  v163[25] = @"item_extra.genius_id";
  id v28 = @"lyrics.lyrics";
  v163[26] = @"lyrics.lyrics";
  id v29 = @"lyrics.checksum";
  v163[27] = @"lyrics.checksum";
  id v30 = @"track_number";
  v163[28] = @"track_number";
  id v31 = @"item_stats.user_rating";
  v163[29] = @"item_stats.user_rating";
  id v32 = @"exclude_from_shuffle";
  v163[30] = @"exclude_from_shuffle";
  uint64_t v33 = @"item_playback.has_video";
  v163[31] = @"item_playback.has_video";
  id v34 = @"item_video.rental_duration";
  v163[32] = @"item_video.rental_duration";
  id v35 = @"item_video.rental_playback_duration";
  v163[33] = @"item_video.rental_playback_duration";
  uint64_t v36 = @"item_video.rental_playback_date_started";
  v163[34] = @"item_video.rental_playback_date_started";
  uint64_t v37 = @"item_video.rental_date_started";
  v163[35] = @"item_video.rental_date_started";
  int v38 = @"item_video.audio_language";
  v163[36] = @"item_video.audio_language";
  uint64_t v39 = @"item_video.audio_track_id";
  v163[37] = @"item_video.audio_track_id";
  uint64_t v40 = @"item_video.audio_track_index";
  v163[38] = @"item_video.audio_track_index";
  id v41 = @"item_video.extended_content_rating";
  v163[39] = @"item_video.extended_content_rating";
  id v42 = @"item_video.movie_info";
  v163[40] = @"item_video.movie_info";
  int64_t v43 = @"item_video.subtitle_language";
  v163[41] = @"item_video.subtitle_language";
  uint64_t v44 = @"item_video.subtitle_track_index";
  v163[42] = @"item_video.subtitle_track_index";
  id v45 = @"(item_video.video_quality != 0)";
  v163[43] = @"(item_video.video_quality != 0)";
  uint64_t v46 = @"item_video.has_alternate_audio";
  v163[44] = @"item_video.has_alternate_audio";
  id v47 = @"item_video.has_chapter_data";
  v163[45] = @"item_video.has_chapter_data";
  uint64_t v48 = @"item_video.has_subtitles";
  v163[46] = @"item_video.has_subtitles";
  uint64_t v49 = @"item_video.is_rental";
  v163[47] = @"item_video.is_rental";
  id v50 = @"item_video.episode_id";
  v163[48] = @"item_video.episode_id";
  id v51 = @"episode_sort_id";
  v163[49] = @"episode_sort_id";
  int64_t v52 = @"item_video.network_name";
  v163[50] = @"item_video.network_name";
  long long v53 = @"item_video.season_number";
  v163[51] = @"item_video.season_number";
  long long v54 = @"item_store.external_guid";
  v163[52] = @"item_store.external_guid";
  char v55 = @"item_extra.disc_count";
  v163[53] = @"item_extra.disc_count";
  id v56 = @"item_extra.track_count";
  v163[54] = @"item_extra.track_count";
  uint64_t v57 = @"album.album";
  v163[55] = @"album.album";
  uint64_t v58 = @"album.sort_album";
  v163[56] = @"album.sort_album";
  int v59 = @"album.user_rating";
  v163[57] = @"album.user_rating";
  char v60 = @"is_compilation";
  v163[58] = @"is_compilation";
  id v61 = @"item_artist.store_id";
  v163[59] = @"item_artist.store_id";
  uint64_t v62 = @"item_artist.item_artist";
  v163[60] = @"item_artist.item_artist";
  long long v63 = @"item_artist.sort_item_artist";
  v163[61] = @"item_artist.sort_item_artist";
  uint64_t v64 = @"album_artist.album_artist";
  v163[62] = @"album_artist.album_artist";
  uint64_t v65 = @"album_artist.sort_album_artist";
  v163[63] = @"album_artist.sort_album_artist";
  id v66 = @"composer.composer";
  v163[64] = @"composer.composer";
  uint64_t v67 = @"composer.sort_composer";
  v163[65] = @"composer.sort_composer";
  uint64_t v68 = @"genre.genre";
  v163[66] = @"genre.genre";
  uint64_t v69 = @"item_playback.gapless_encoding_drain";
  v163[67] = @"item_playback.gapless_encoding_drain";
  uint64_t v70 = @"item_playback.gapless_last_frame_resynch";
  v163[68] = @"item_playback.gapless_last_frame_resynch";
  v71 = @"item_playback.gapless_heuristic_info";
  v163[69] = @"item_playback.gapless_heuristic_info";
  uint64_t v72 = @"item_playback.gapless_encoding_delay";
  v163[70] = @"item_playback.gapless_encoding_delay";
  int v73 = @"item_playback.start_time_ms";
  v163[71] = @"item_playback.start_time_ms";
  v74 = @"item_playback.stop_time_ms";
  v163[72] = @"item_playback.stop_time_ms";
  uint64_t v75 = @"item_playback.volume_normalization_energy";
  v163[73] = @"item_playback.volume_normalization_energy";
  v76 = @"item_extra.bpm";
  v163[74] = @"item_extra.bpm";
  uint64_t v77 = @"item_playback.bit_rate";
  v163[75] = @"item_playback.bit_rate";
  uint64_t v78 = @"item_playback.codec_subtype";
  v163[76] = @"item_playback.codec_subtype";
  v79 = @"item_playback.codec_type";
  v163[77] = @"item_playback.codec_type";
  uint64_t v80 = @"item_playback.data_kind";
  v163[78] = @"item_playback.data_kind";
  uint64_t v81 = @"item_playback.data_url";
  v163[79] = @"item_playback.data_url";
  v82 = @"item_playback.eq_preset";
  v163[80] = @"item_playback.eq_preset";
  uint64_t v83 = @"item_playback.format";
  v163[81] = @"item_playback.format";
  id v84 = @"item_playback.relative_volume";
  v163[82] = @"item_playback.relative_volume";
  v85 = @"item_playback.sample_rate";
  v163[83] = @"item_playback.sample_rate";
  id v86 = @"item_extra.year";
  v163[84] = @"item_extra.year";
  id v87 = @"item_extra.content_rating_level";
  v163[85] = @"item_extra.content_rating_level";
  uint64_t v88 = @"item_extra.comment";
  v163[86] = @"item_extra.comment";
  uint64_t v89 = @"item_extra.location_kind_id";
  v163[87] = @"item_extra.location_kind_id";
  uint64_t v90 = @"item_store.key_versions";
  v163[88] = @"item_store.key_versions";
  __int16 v91 = @"item_store.key_platform_id";
  v163[89] = @"item_store.key_platform_id";
  id v92 = @"item_store.key_id";
  v163[90] = @"item_store.key_id";
  long long v93 = @"item_store.key_id_2";
  v163[91] = @"item_store.key_id_2";
  long long v94 = @"item_store.artwork_url";
  v163[92] = @"item_store.artwork_url";
  long long v95 = @"item_store.store_xid";
  v163[93] = @"item_store.store_xid";
  long long v96 = @"item_store.extras_url";
  v163[94] = @"item_store.extras_url";
  long long v97 = @"album_pid";
  v163[95] = @"album_pid";
  uint64_t v98 = @"item_artist_pid";
  v163[96] = @"item_artist_pid";
  uint64_t v99 = @"album_artist_pid";
  v163[97] = @"album_artist_pid";
  long long v100 = @"genre_id";
  v163[98] = @"genre_id";
  long long v101 = @"item_store.cloud_status";
  v163[99] = @"item_store.cloud_status";
  long long v102 = @"item_playback.progression_direction";
  v163[100] = @"item_playback.progression_direction";
  id v103 = @"item_stats.play_count_user";
  v163[101] = @"item_stats.play_count_user";
  uint64_t v104 = @"item_stats.play_count_recent";
  v163[102] = @"item_stats.play_count_recent";
  uint64_t v105 = @"item_stats.date_played";
  v163[103] = @"item_stats.date_played";
  uint64_t v106 = @"item_stats.skip_count_user";
  v163[104] = @"item_stats.skip_count_user";
  v107 = @"item_stats.skip_count_recent";
  v163[105] = @"item_stats.skip_count_recent";
  uint64_t v108 = @"item_stats.date_skipped";
  v163[106] = @"item_stats.date_skipped";
  uint64_t v109 = @"item_stats.remember_bookmark";
  v163[107] = @"item_stats.remember_bookmark";
  uint64_t v110 = @"item_stats.bookmark_time_ms";
  v163[108] = @"item_stats.bookmark_time_ms";
  uint64_t v111 = @"item_stats.hidden";
  v163[109] = @"item_stats.hidden";
  uint64_t v112 = @"chapter.chapter_data";
  v163[110] = @"chapter.chapter_data";
  uint64_t v113 = @"(item.base_location_id > 200)";
  v163[111] = @"(item.base_location_id > 200)";
  id v114 = @"item_playback.duration";
  v163[112] = @"item_playback.duration";
  uint64_t v115 = @"item_extra.grouping";
  v163[113] = @"item_extra.grouping";
  v116 = @"item_store.store_playlist_id";
  v163[114] = @"item_store.store_playlist_id";
  uint64_t v117 = @"item_store.store_composer_id";
  v163[115] = @"item_store.store_composer_id";
  uint64_t v118 = @"item_store.store_genre_id";
  v163[116] = @"item_store.store_genre_id";
  uint64_t v119 = @"composer_pid";
  v163[117] = @"composer_pid";
  uint64_t v120 = @"item_stats.liked_state";
  v163[118] = @"item_stats.liked_state";
  uint64_t v121 = @"item_stats.liked_state_changed";
  v163[119] = @"item_stats.liked_state_changed";
  uint64_t v122 = @"needs_reporting";
  v163[120] = @"needs_reporting";
  uint64_t v123 = @"item_store.subscription_store_item_id";
  v163[121] = @"item_store.subscription_store_item_id";
  uint64_t v124 = @"in_my_library";
  v163[122] = @"in_my_library";
  v125 = @"item_store.cloud_asset_available";
  v163[123] = @"item_store.cloud_asset_available";
  uint64_t v126 = @"item_store.is_protected";
  v163[124] = @"item_store.is_protected";
  v127 = @"item_store.cloud_album_id";
  v163[125] = @"item_store.cloud_album_id";
  uint64_t v128 = @"item_extra.is_user_disabled";
  v163[126] = @"item_extra.is_user_disabled";
  v129 = @"item_store.feed_url";
  v163[127] = @"item_store.feed_url";
  uint64_t v130 = @"item_artist.series_name";
  v163[128] = @"item_artist.series_name";
  v131 = @"item_store.cloud_playback_endpoint_type";
  v163[129] = @"item_store.cloud_playback_endpoint_type";
  uint64_t v132 = @"item_store.playback_endpoint_type";
  v163[130] = @"item_store.playback_endpoint_type";
  v133 = @"item_store.store_matched_status";
  v163[131] = @"item_store.store_matched_status";
  id v134 = @"item_store.cloud_in_my_library";
  v163[132] = @"item_store.cloud_in_my_library";
  long long v135 = @"album_artist.store_id";
  v163[133] = @"album_artist.store_id";
  uint64_t v136 = @"item_store.cloud_universal_library_id";
  v163[134] = @"item_store.cloud_universal_library_id";
  uint64_t v137 = @"best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type";
  v163[135] = @"best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type";
  long long v138 = @"best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token";
  v163[136] = @"best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token";
  uint64_t v139 = @"item_video.hls_playlist_url";
  v163[137] = @"item_video.hls_playlist_url";
  uint64_t v140 = @"album_artist.cloud_universal_library_id";
  v163[138] = @"album_artist.cloud_universal_library_id";
  v141 = @"item_extra.is_preorder";
  v163[139] = @"item_extra.is_preorder";
  v142 = @"item_stats.liked_state_changed_date";
  v163[140] = @"item_stats.liked_state_changed_date";
  v143 = @"item_store.reporting_store_item_id";
  v163[141] = @"item_store.reporting_store_item_id";
  v144 = @"item_store.asset_store_item_id";
  v163[142] = @"item_store.asset_store_item_id";
  v145 = @"album.liked_state";
  v163[143] = @"album.liked_state";
  uint64_t v146 = @"album.liked_state_changed_date";
  v163[144] = @"album.liked_state_changed_date";
  v147 = @"album_artist.liked_state";
  v163[145] = @"album_artist.liked_state";
  uint64_t v148 = @"album_artist.liked_state_changed_date";
  v163[146] = @"album_artist.liked_state_changed_date";
  uint64_t v149 = @"album_artist.sync_id";
  v163[147] = @"album_artist.sync_id";
  v150 = @"album.sync_id";
  v163[148] = @"album.sync_id";
  uint64_t v151 = @"item_artist.sync_id";
  v163[149] = @"item_artist.sync_id";
  v152 = @"album_artist_order";
  v163[150] = @"album_artist_order";
  uint64_t v153 = @"album_artist_order_section";
  v163[151] = @"album_artist_order_section";
  uint64_t v154 = [MEMORY[0x1E4F1C978] arrayWithObjects:v163 count:152];
  uint64_t v155 = (void *)protocolItem___trackProperties;
  protocolItem___trackProperties = v154;

  v156 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v158 = +[ML3ComparisonPredicate predicateWithProperty:@"ROWID" equalToInt64:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v159 = [v156 unrestrictedAllItemsQueryWithlibrary:WeakRetained predicate:v158 orderingTerms:0];

  uint64_t v160 = [v159 selectPersistentIDsSQLAndProperties:protocolItem___trackProperties ordered:0];
  v161 = (void *)protocolItem___sqlQueryStr;
  protocolItem___sqlQueryStr = v160;

  for (uint64_t i = 151; i != -1; --i)
}

void __36__ML3Track_MLProtocol__protocolItem__block_invoke_2(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = protocolItem___sqlQueryStr;
  id v4 = NSNumber;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
  id v6 = a2;
  uint64_t v7 = [v4 numberWithLongLong:v5];
  v16[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v9 = [v6 executeQuery:v3 withParameters:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __36__ML3Track_MLProtocol__protocolItem__block_invoke_3;
  v12[3] = &unk_1E5FB6A00;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = v10;
  uint64_t v14 = v11;
  id v15 = *(id *)(a1 + 48);
  [v9 enumerateRowsWithBlock:v12];
}

void __36__ML3Track_MLProtocol__protocolItem__block_invoke_3(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v93 = a2;
  objc_msgSend(a1[4], "setMediaType:", ML3ProtocolMediaTypeForMLMediaType(objc_msgSend(v93, "intForColumnIndex:", 2)));
  uint64_t v5 = [v93 stringForColumnIndex:1];
  [a1[4] setTitle:v5];

  id v6 = [v93 stringForColumnIndex:3];
  [a1[4] setSortTitle:v6];

  objc_msgSend(a1[4], "setReleaseDateTime:", objc_msgSend(v93, "int64ForColumnIndex:", 4));
  objc_msgSend(a1[4], "setCreationDateTime:", objc_msgSend(v93, "int64ForColumnIndex:", 5));
  objc_msgSend(a1[4], "setModificationDateTime:", objc_msgSend(v93, "int64ForColumnIndex:", 6));
  objc_msgSend(a1[4], "setFileSize:", objc_msgSend(v93, "int64ForColumnIndex:", 7));
  objc_msgSend(a1[4], "setDuration:", objc_msgSend(v93, "int64ForColumnIndex:", 8));
  objc_msgSend(a1[4], "setContentRating:", objc_msgSend(v93, "intForColumnIndex:", 9));
  objc_msgSend(a1[4], "setExplicitContent:", objc_msgSend(v93, "intForColumnIndex:", 10) != 0);
  uint64_t v7 = [v93 stringForColumnIndex:11];
  [a1[4] setShortDescription:v7];

  id v8 = [v93 stringForColumnIndex:12];
  [a1[4] setLongDescription:v8];

  uint64_t v9 = [v93 stringForColumnIndex:13];
  [a1[4] setCopyright:v9];

  objc_msgSend(a1[4], "setStoreId:", objc_msgSend(v93, "int64ForColumnIndex:", 15));
  objc_msgSend(a1[4], "setStorefrontId:", objc_msgSend(v93, "int64ForColumnIndex:", 16));
  objc_msgSend(a1[4], "setAccountId:", objc_msgSend(v93, "int64ForColumnIndex:", 17));
  objc_msgSend(a1[4], "setPurchaseHistoryId:", objc_msgSend(v93, "int64ForColumnIndex:", 18));
  objc_msgSend(a1[4], "setPurchaseHistoryToken:", objc_msgSend(v93, "int64ForColumnIndex:", 19));
  id v10 = [v93 stringForColumnIndex:20];
  [a1[4] setPurchaseHistoryRedownloadParams:v10];

  objc_msgSend(a1[4], "setSagaId:", objc_msgSend(v93, "int64ForColumnIndex:", 21));
  objc_msgSend(a1[4], "setYear:", objc_msgSend(v93, "intForColumnIndex:", 85));
  objc_msgSend(a1[4], "setContentRatingLevel:", objc_msgSend(v93, "intForColumnIndex:", 86));
  uint64_t v11 = [v93 stringForColumnIndex:22];
  [a1[4] setSagaRedownloadParams:v11];

  id v12 = [v93 stringForColumnIndex:87];
  [a1[4] setComment:v12];

  objc_msgSend(a1[4], "setFileKind:", objc_msgSend(v93, "intForColumnIndex:", 88));
  objc_msgSend(a1[4], "setDrmVersionsCode:", objc_msgSend(v93, "int64ForColumnIndex:", 89));
  objc_msgSend(a1[4], "setDrmPlatformIdCode:", objc_msgSend(v93, "int64ForColumnIndex:", 90));
  objc_msgSend(a1[4], "setDrmKey1IdCode:", objc_msgSend(v93, "int64ForColumnIndex:", 91));
  objc_msgSend(a1[4], "setDrmKey2IdCode:", objc_msgSend(v93, "int64ForColumnIndex:", 92));
  id v13 = [v93 stringForColumnIndex:93];
  [a1[4] setChapterMetadataUrl:v13];

  uint64_t v14 = [v93 stringForColumnIndex:94];
  [a1[4] setStoreXID:v14];

  id v15 = [v93 stringForColumnIndex:95];
  [a1[4] setExtrasUrl:v15];

  objc_msgSend(a1[4], "setCloudStatus:", objc_msgSend(v93, "intForColumnIndex:", 100));
  objc_msgSend(a1[4], "setPlayCount:", objc_msgSend(v93, "intForColumnIndex:", 102));
  objc_msgSend(a1[4], "setPlayCountDelta:", objc_msgSend(v93, "intForColumnIndex:", 103));
  objc_msgSend(a1[4], "setLastPlayedDateTime:", objc_msgSend(v93, "int64ForColumnIndex:", 104));
  objc_msgSend(a1[4], "setSkipCount:", objc_msgSend(v93, "intForColumnIndex:", 105));
  objc_msgSend(a1[4], "setSkipCountDelta:", objc_msgSend(v93, "intForColumnIndex:", 106));
  objc_msgSend(a1[4], "setLastSkippedDateTime:", objc_msgSend(v93, "int64ForColumnIndex:", 107));
  objc_msgSend(a1[4], "setRememberBookmark:", objc_msgSend(v93, "intForColumnIndex:", 108) != 0);
  objc_msgSend(a1[4], "setBookmarkTimeMilliseconds:", objc_msgSend(v93, "int64ForColumnIndex:", 109));
  objc_msgSend(a1[4], "setHidden:", objc_msgSend(v93, "intForColumnIndex:", 110) != 0);
  objc_msgSend(a1[4], "setHasLocalAsset:", objc_msgSend(v93, "intForColumnIndex:", 112) != 0);
  uint64_t v16 = [v93 stringForColumnIndex:14];
  [a1[4] setArtworkId:v16];

  long long v17 = [v93 stringForColumnIndex:114];
  [a1[4] setGrouping:v17];

  objc_msgSend(a1[4], "setStorePlaylistId:", objc_msgSend(v93, "int64ForColumnIndex:", 115));
  objc_msgSend(a1[4], "setLikedState:", objc_msgSend(v93, "intForColumnIndex:", 119));
  objc_msgSend(a1[4], "setLikedStateChanged:", objc_msgSend(v93, "intForColumnIndex:", 120) != 0);
  objc_msgSend(a1[4], "setNeedsReporting:", objc_msgSend(v93, "intForColumnIndex:", 121) != 0);
  objc_msgSend(a1[4], "setSubscriptionStoreItemId:", objc_msgSend(v93, "int64ForColumnIndex:", 122));
  objc_msgSend(a1[4], "setIsInUsersLibrary:", objc_msgSend(v93, "intForColumnIndex:", 123) != 0);
  objc_msgSend(a1[4], "setCloudAssetAvailable:", objc_msgSend(v93, "intForColumnIndex:", 124) != 0);
  objc_msgSend(a1[4], "setStoreProtectionType:", objc_msgSend(v93, "intForColumnIndex:", 125));
  objc_msgSend(a1[4], "setUserDisabled:", objc_msgSend(v93, "intForColumnIndex:", 127) != 0);
  objc_msgSend(a1[4], "setCloudPlaybackEndpointType:", objc_msgSend(v93, "intForColumnIndex:", 130));
  objc_msgSend(a1[4], "setPlaybackEndpointType:", objc_msgSend(v93, "intForColumnIndex:", 131));
  objc_msgSend(a1[4], "setCloudMatchedStatus:", objc_msgSend(v93, "intForColumnIndex:", 132));
  objc_msgSend(a1[4], "setInUsersCloudLibrary:", objc_msgSend(v93, "intForColumnIndex:", 133) != 0);
  int64_t v18 = [v93 stringForColumnIndex:135];
  [a1[4] setCloudUniversalLibraryId:v18];

  uint64_t v19 = [v93 stringForColumnIndex:46];
  [a1[4] setHasChapterData:v19 != 0];

  id v20 = [v93 dataForColumnIndex:111];
  [a1[4] setFlattenedChapterData:v20];

  objc_msgSend(a1[4], "setIsPreorder:", objc_msgSend(v93, "intForColumnIndex:", 140) != 0);
  objc_msgSend(a1[4], "setLikedStateChangedDate:", objc_msgSend(v93, "int64ForColumnIndex:", 141));
  objc_msgSend(a1[4], "setReportingStoreItemId:", objc_msgSend(v93, "int64ForColumnIndex:", 142));
  objc_msgSend(a1[4], "setAssetStoreItemId:", objc_msgSend(v93, "int64ForColumnIndex:", 143));
  uint64_t v21 = [v93 intForColumnIndex:136];
  if (v21) {
    [a1[4] setSecondaryArtworkSourceType:v21];
  }
  uint64_t v22 = [v93 stringForColumnIndex:137];
  if ([v22 length]) {
    [a1[4] setSecondaryArtworkId:v22];
  }
  uint64_t v88 = v22;
  uint64_t v23 = [v93 int64ForColumnIndex:23];
  uint64_t v24 = [a1[5] persistentID];
  uint64_t v25 = [a1[6] syncLibraryID];
  if (v24)
  {
    id v26 = objc_alloc_init(MIPLibraryIdentifier);
    [(MIPLibraryIdentifier *)v26 setLibraryId:v24];
    id v27 = [a1[6] libraryUID];
    [(MIPLibraryIdentifier *)v26 setLibraryName:v27];

    [a1[4] addLibraryIdentifiers:v26];
  }
  if (v23 >= 1 && [v25 length])
  {
    id v28 = objc_alloc_init(MIPLibraryIdentifier);
    [(MIPLibraryIdentifier *)v28 setLibraryId:v23];
    [(MIPLibraryIdentifier *)v28 setLibraryName:v25];
    [a1[4] addLibraryIdentifiers:v28];
  }
  id v87 = v25;
  __int16 v92 = [v93 intForColumnIndex:2];
  uint64_t v29 = [a1[6] libraryUID];
  id v30 = [a1[6] syncLibraryID];
  id v31 = objc_alloc_init(MIPArtist);
  -[MIPArtist setStoreId:](v31, "setStoreId:", [v93 int64ForColumnIndex:60]);
  [(MIPArtist *)v31 setArtworkId:0];
  id v32 = [v93 stringForColumnIndex:61];
  [(MIPArtist *)v31 setName:v32];

  uint64_t v33 = [v93 stringForColumnIndex:62];
  [(MIPArtist *)v31 setSortName:v33];

  -[MIPArtist setPersistentId:](v31, "setPersistentId:", [v93 int64ForColumnIndex:97]);
  uint64_t v34 = [v93 int64ForColumnIndex:150];
  id v35 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v36 = objc_alloc_init(MIPLibraryIdentifier);
  [(MIPLibraryIdentifier *)v36 setLibraryId:[(MIPArtist *)v31 persistentId]];
  [(MIPLibraryIdentifier *)v36 setLibraryName:v29];
  id v84 = v36;
  [v35 addObject:v36];
  if (v34 >= 1 && [v30 length])
  {
    uint64_t v37 = objc_alloc_init(MIPLibraryIdentifier);
    [(MIPLibraryIdentifier *)v37 setLibraryId:v34];
    [(MIPLibraryIdentifier *)v37 setLibraryName:v30];
    [v35 addObject:v37];
  }
  v85 = v35;
  [(MIPArtist *)v31 setLibraryIdentifiers:v35];
  int v38 = objc_alloc_init(MIPAlbum);
  -[MIPAlbum setStoreId:](v38, "setStoreId:", [v93 int64ForColumnIndex:115]);
  uint64_t v39 = [v93 stringForColumnIndex:14];
  [(MIPAlbum *)v38 setArtworkId:v39];

  uint64_t v40 = [v93 stringForColumnIndex:56];
  [(MIPAlbum *)v38 setName:v40];

  -[MIPAlbum setNumDiscs:](v38, "setNumDiscs:", [v93 intForColumnIndex:54]);
  -[MIPAlbum setNumTracks:](v38, "setNumTracks:", [v93 intForColumnIndex:55]);
  id v41 = [v93 stringForColumnIndex:57];
  [(MIPAlbum *)v38 setSortName:v41];

  -[MIPAlbum setUserRating:](v38, "setUserRating:", [v93 intForColumnIndex:58]);
  -[MIPAlbum setCompilation:](v38, "setCompilation:", [v93 intForColumnIndex:59] != 0);
  -[MIPAlbum setPersistentId:](v38, "setPersistentId:", [v93 int64ForColumnIndex:96]);
  id v42 = [v93 stringForColumnIndex:126];
  [(MIPAlbum *)v38 setCloudId:v42];

  -[MIPAlbum setLikedState:](v38, "setLikedState:", [v93 intForColumnIndex:144]);
  -[MIPAlbum setLikedStateChangedDate:](v38, "setLikedStateChangedDate:", [v93 int64ForColumnIndex:145]);
  uint64_t v43 = [v93 int64ForColumnIndex:149];
  uint64_t v44 = [MEMORY[0x1E4F1CA48] array];
  id v45 = objc_alloc_init(MIPLibraryIdentifier);
  [(MIPLibraryIdentifier *)v45 setLibraryId:[(MIPAlbum *)v38 persistentId]];
  [(MIPLibraryIdentifier *)v45 setLibraryName:v29];
  uint64_t v83 = v45;
  [v44 addObject:v45];
  __int16 v91 = v44;
  if (v43 >= 1 && [v30 length])
  {
    uint64_t v46 = objc_alloc_init(MIPLibraryIdentifier);
    [(MIPLibraryIdentifier *)v46 setLibraryId:v43];
    [(MIPLibraryIdentifier *)v46 setLibraryName:v30];
    [v91 addObject:v46];

    uint64_t v44 = v91;
  }
  uint64_t v90 = v30;
  [(MIPAlbum *)v38 setLibraryIdentifiers:v44];
  id v47 = objc_alloc_init(MIPArtist);
  -[MIPArtist setStoreId:](v47, "setStoreId:", [v93 int64ForColumnIndex:134]);
  uint64_t v48 = [v93 stringForColumnIndex:14];
  [(MIPArtist *)v47 setArtworkId:v48];

  uint64_t v49 = [v93 stringForColumnIndex:63];
  [(MIPArtist *)v47 setName:v49];

  id v50 = [v93 stringForColumnIndex:64];
  [(MIPArtist *)v47 setSortName:v50];

  -[MIPArtist setPersistentId:](v47, "setPersistentId:", [v93 int64ForColumnIndex:98]);
  id v51 = [v93 stringForColumnIndex:139];
  [(MIPArtist *)v47 setCloudUniversalLibraryId:v51];

  -[MIPArtist setLikedState:](v47, "setLikedState:", [v93 intForColumnIndex:146]);
  -[MIPArtist setLikedStateChangedDate:](v47, "setLikedStateChangedDate:", [v93 int64ForColumnIndex:147]);
  -[MIPArtist setSortOrder:](v47, "setSortOrder:", [v93 int64ForColumnIndex:151]);
  -[MIPArtist setSortOrderSection:](v47, "setSortOrderSection:", [v93 int64ForColumnIndex:152]);
  uint64_t v52 = [v93 int64ForColumnIndex:148];
  long long v53 = [MEMORY[0x1E4F1CA48] array];
  long long v54 = objc_alloc_init(MIPLibraryIdentifier);
  [(MIPLibraryIdentifier *)v54 setLibraryId:[(MIPArtist *)v47 persistentId]];
  id v86 = (void *)v29;
  [(MIPLibraryIdentifier *)v54 setLibraryName:v29];
  uint64_t v81 = v54;
  [v53 addObject:v54];
  if (v52 >= 1 && [v90 length])
  {
    char v55 = objc_alloc_init(MIPLibraryIdentifier);
    [(MIPLibraryIdentifier *)v55 setLibraryId:v52];
    [(MIPLibraryIdentifier *)v55 setLibraryName:v90];
    [v91 addObject:v55];
  }
  v82 = v53;
  [(MIPArtist *)v47 setLibraryIdentifiers:v53];
  [(MIPAlbum *)v38 setArtist:v47];
  id v56 = objc_alloc_init(MIPArtist);
  -[MIPArtist setStoreId:](v56, "setStoreId:", [v93 int64ForColumnIndex:116]);
  [(MIPArtist *)v56 setArtworkId:0];
  uint64_t v57 = [v93 stringForColumnIndex:65];
  [(MIPArtist *)v56 setName:v57];

  uint64_t v58 = [v93 stringForColumnIndex:66];
  [(MIPArtist *)v56 setSortName:v58];

  -[MIPArtist setPersistentId:](v56, "setPersistentId:", [v93 int64ForColumnIndex:118]);
  int v59 = objc_alloc_init(MIPGenre);
  -[MIPGenre setStoreId:](v59, "setStoreId:", [v93 int64ForColumnIndex:117]);
  char v60 = [v93 stringForColumnIndex:67];
  [(MIPGenre *)v59 setName:v60];

  -[MIPGenre setPersistentId:](v59, "setPersistentId:", [v93 int64ForColumnIndex:99]);
  id v61 = objc_alloc_init(MIPPlaybackInfo);
  -[MIPPlaybackInfo setGaplessEncodingDrainCode:](v61, "setGaplessEncodingDrainCode:", [v93 int64ForColumnIndex:68]);
  -[MIPPlaybackInfo setGaplessFrameResyncCode:](v61, "setGaplessFrameResyncCode:", [v93 int64ForColumnIndex:69]);
  -[MIPPlaybackInfo setGaplessHeuristicCode:](v61, "setGaplessHeuristicCode:", [v93 int64ForColumnIndex:70]);
  -[MIPPlaybackInfo setGaplessHeuristicDelayCode:](v61, "setGaplessHeuristicDelayCode:", [v93 int64ForColumnIndex:71]);
  -[MIPPlaybackInfo setStartTime:](v61, "setStartTime:", [v93 int64ForColumnIndex:72]);
  -[MIPPlaybackInfo setStopTime:](v61, "setStopTime:", [v93 int64ForColumnIndex:73]);
  -[MIPPlaybackInfo setVolumeNormalizationEnergy:](v61, "setVolumeNormalizationEnergy:", [v93 int64ForColumnIndex:74]);
  -[MIPPlaybackInfo setBeatsPerMinute:](v61, "setBeatsPerMinute:", [v93 int64ForColumnIndex:75]);
  -[MIPPlaybackInfo setBitRate:](v61, "setBitRate:", [v93 int64ForColumnIndex:76]);
  -[MIPPlaybackInfo setCodecSubType:](v61, "setCodecSubType:", [v93 int64ForColumnIndex:77]);
  -[MIPPlaybackInfo setCodecType:](v61, "setCodecType:", [v93 int64ForColumnIndex:78]);
  -[MIPPlaybackInfo setDataKind:](v61, "setDataKind:", [v93 int64ForColumnIndex:79]);
  uint64_t v62 = [v93 stringForColumnIndex:80];
  [(MIPPlaybackInfo *)v61 setDataUrl:v62];

  long long v63 = [v93 stringForColumnIndex:81];
  [(MIPPlaybackInfo *)v61 setEqPreset:v63];

  uint64_t v64 = [v93 stringForColumnIndex:82];
  [(MIPPlaybackInfo *)v61 setPlaybackFormat:v64];

  -[MIPPlaybackInfo setRelativeVolume:](v61, "setRelativeVolume:", [v93 intForColumnIndex:83]);
  -[MIPPlaybackInfo setSampleRate:](v61, "setSampleRate:", [v93 intForColumnIndex:84]);
  -[MIPPlaybackInfo setProgressionDirection:](v61, "setProgressionDirection:", [v93 intForColumnIndex:101]);
  -[MIPPlaybackInfo setDurationInSamples:](v61, "setDurationInSamples:", [v93 int64ForColumnIndex:113]);
  LOWORD(v65) = v92;
  if ((v92 & 0x404) != 0)
  {
    id v66 = objc_alloc_init(MIPSeries);
    uint64_t v67 = [v93 stringForColumnIndex:56];
    [(MIPSeries *)v66 setName:v67];

    uint64_t v68 = [v93 stringForColumnIndex:57];
    [(MIPSeries *)v66 setSortName:v68];

    -[MIPSeries setStoreId:](v66, "setStoreId:", [v93 int64ForColumnIndex:115]);
  }
  else
  {
    id v66 = 0;
  }
  if ((v92 & 0x408) != 0)
  {
    uint64_t v69 = objc_alloc_init(MIPSong);
    -[MIPSong setAudioFormat:](v69, "setAudioFormat:", [v93 intForColumnIndex:24]);
    -[MIPSong setDiscNumber:](v69, "setDiscNumber:", [v93 intForColumnIndex:25]);
    -[MIPSong setGeniusId:](v69, "setGeniusId:", [v93 int64ForColumnIndex:26]);
    -[MIPSong setLyricsChecksum:](v69, "setLyricsChecksum:", [v93 int64ForColumnIndex:28]);
    -[MIPSong setTrackNumber:](v69, "setTrackNumber:", [v93 intForColumnIndex:29]);
    -[MIPSong setUserRating:](v69, "setUserRating:", [v93 intForColumnIndex:30]);
    -[MIPSong setExcludeFromShuffle:](v69, "setExcludeFromShuffle:", [v93 intForColumnIndex:31] != 0);
    -[MIPSong setHasVideo:](v69, "setHasVideo:", [v93 intForColumnIndex:32] != 0);
    uint64_t v65 = [v93 stringForColumnIndex:138];
    [(MIPSong *)v69 setHlsPlaylistURL:v65];

    LOWORD(v65) = v92;
    [(MIPSong *)v69 setArtist:v31];
    [(MIPSong *)v69 setAlbum:v38];
    [(MIPSong *)v69 setComposer:v56];
    [(MIPSong *)v69 setGenre:v59];
    [(MIPSong *)v69 setPlaybackInfo:v61];
    [a1[4] setSong:v69];

    if ((v92 & 0x400) != 0)
    {
      uint64_t v70 = objc_alloc_init(MIPTVShow);
      [(MIPTVShow *)v70 setArtist:v31];
      [(MIPTVShow *)v70 setSeries:v66];
      v71 = [v93 stringForColumnIndex:49];
      [(MIPTVShow *)v70 setEpisodeId:v71];

      uint64_t v72 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v93, "intForColumnIndex:", 50));
      [(MIPTVShow *)v70 setEpisodeSortId:v72];

      uint64_t v65 = [v93 stringForColumnIndex:51];
      [(MIPTVShow *)v70 setNetworkName:v65];

      LOWORD(v65) = v92;
      -[MIPTVShow setSeasonNumber:](v70, "setSeasonNumber:", [v93 intForColumnIndex:52]);
      -[MIPTVShow setVideoQuality:](v70, "setVideoQuality:", [v93 intForColumnIndex:44]);
      [a1[4] setTvShow:v70];
    }
  }
  if ((v65 & 0x800) != 0)
  {
    uint64_t v75 = objc_alloc_init(MIPMovie);
    [(MIPMovie *)v75 setArtist:v31];
    -[MIPMovie setRentalDuration:](v75, "setRentalDuration:", (int)[v93 intForColumnIndex:33]);
    -[MIPMovie setRentalPlaybackDuration:](v75, "setRentalPlaybackDuration:", (int)[v93 intForColumnIndex:34]);
    -[MIPMovie setRentalPlaybackStartedDateTime:](v75, "setRentalPlaybackStartedDateTime:", (int)[v93 intForColumnIndex:35]);
    -[MIPMovie setRentalStartedDateTime:](v75, "setRentalStartedDateTime:", (int)[v93 intForColumnIndex:36]);
    -[MIPMovie setAudioLanguage:](v75, "setAudioLanguage:", [v93 intForColumnIndex:37]);
    -[MIPMovie setAudioTrackId:](v75, "setAudioTrackId:", [v93 intForColumnIndex:38]);
    -[MIPMovie setAudioTrackIndex:](v75, "setAudioTrackIndex:", [v93 intForColumnIndex:39]);
    v76 = [v93 stringForColumnIndex:40];
    [(MIPMovie *)v75 setExtendedContentName:v76];

    uint64_t v77 = [v93 stringForColumnIndex:41];
    [(MIPMovie *)v75 setMovieInfo:v77];

    -[MIPMovie setSubtitleLanguage:](v75, "setSubtitleLanguage:", [v93 intForColumnIndex:42]);
    -[MIPMovie setSubtitleTrackIndex:](v75, "setSubtitleTrackIndex:", [v93 intForColumnIndex:43]);
    -[MIPMovie setVideoQuality:](v75, "setVideoQuality:", [v93 intForColumnIndex:44]);
    -[MIPMovie setHasAlternateAudio:](v75, "setHasAlternateAudio:", [v93 intForColumnIndex:45] != 0);
    -[MIPMovie setHasChapterData:](v75, "setHasChapterData:", [v93 intForColumnIndex:46] != 0);
    -[MIPMovie setHasSubtitles:](v75, "setHasSubtitles:", [v93 intForColumnIndex:47] != 0);
    -[MIPMovie setRental:](v75, "setRental:", [v93 intForColumnIndex:48] != 0);
    uint64_t v65 = [v93 dataForColumnIndex:111];
    [(MIPMovie *)v75 setFlattenedChapterData:v65];

    LOBYTE(v65) = v92;
    [a1[4] setMovie:v75];

    if ((v92 & 4) == 0)
    {
LABEL_27:
      if ((v65 & 2) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((v65 & 4) == 0)
  {
    goto LABEL_27;
  }
  uint64_t v78 = objc_alloc_init(MIPPodcast);
  [(MIPPodcast *)v78 setArtist:v31];
  [(MIPPodcast *)v78 setSeries:v66];
  v79 = [v93 stringForColumnIndex:53];
  [(MIPPodcast *)v78 setExternalGuid:v79];

  uint64_t v80 = [v93 stringForColumnIndex:128];
  [(MIPPodcast *)v78 setFeedUrl:v80];

  [a1[4] setPodcast:v78];
  if ((v92 & 2) != 0)
  {
LABEL_28:
    int v73 = objc_alloc_init(MIPAudiobook);
    -[MIPAudiobook setAudioFormat:](v73, "setAudioFormat:", [v93 intForColumnIndex:24]);
    -[MIPAudiobook setDiscNumber:](v73, "setDiscNumber:", [v93 intForColumnIndex:25]);
    -[MIPAudiobook setTrackNumber:](v73, "setTrackNumber:", [v93 intForColumnIndex:29]);
    -[MIPAudiobook setUserRating:](v73, "setUserRating:", [v93 intForColumnIndex:30]);
    -[MIPAudiobook setExcludeFromShuffle:](v73, "setExcludeFromShuffle:", [v93 intForColumnIndex:31] != 0);
    -[MIPAudiobook setHasVideo:](v73, "setHasVideo:", [v93 intForColumnIndex:32] != 0);
    v74 = [v93 stringForColumnIndex:138];
    [(MIPAudiobook *)v73 setHlsPlaylistURL:v74];

    [(MIPAudiobook *)v73 setArtist:v31];
    [(MIPAudiobook *)v73 setAlbum:v38];
    [(MIPAudiobook *)v73 setComposer:v56];
    [(MIPAudiobook *)v73 setGenre:v59];
    [(MIPAudiobook *)v73 setPlaybackInfo:v61];
    [a1[4] setAudiobook:v73];
  }
LABEL_29:
  *a4 = 1;
}

- (id)multiverseIdentifierLibraryOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_alloc_init(MIPMultiverseIdentifier);
  [(MIPMultiverseIdentifier *)v5 setMediaObjectType:6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  uint64_t v7 = objc_alloc_init(MIPLibraryIdentifier);
  [(MIPLibraryIdentifier *)v7 setLibraryId:self->super._persistentID];
  id v8 = [WeakRetained libraryUID];
  [(MIPLibraryIdentifier *)v7 setLibraryName:v8];

  [(MIPMultiverseIdentifier *)v5 addLibraryIdentifiers:v7];
  uint64_t v9 = @"SELECT item_store.sync_id, item_extra.title, item.media_type, item_store.account_id, item_store.store_item_id, item_store.store_saga_id, item_store.purchase_history_id, item_store.cloud_universal_library_id FROM item JOIN item_store USING (item_pid) JOIN item_extra USING (item_pid) WHERE item.ROWID = ?";
  if (v3) {
    uint64_t v9 = @"SELECT item_store.sync_id FROM item JOIN item_store USING (item_pid) WHERE item.ROWID = ?";
  }
  id v10 = v9;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __56__ML3Track_MLProtocol__multiverseIdentifierLibraryOnly___block_invoke;
  v16[3] = &unk_1E5FB6618;
  long long v17 = v10;
  int64_t v18 = self;
  uint64_t v11 = v5;
  uint64_t v19 = v11;
  BOOL v20 = v3;
  id v12 = v10;
  [WeakRetained databaseConnectionAllowingWrites:0 withBlock:v16];
  id v13 = v19;
  uint64_t v14 = v11;

  return v14;
}

void __56__ML3Track_MLProtocol__multiverseIdentifierLibraryOnly___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 16);
  id v6 = a2;
  uint64_t v7 = [v3 numberWithLongLong:v5];
  v14[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v9 = [v6 executeQuery:v4 withParameters:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __56__ML3Track_MLProtocol__multiverseIdentifierLibraryOnly___block_invoke_2;
  v11[3] = &unk_1E5FB65F0;
  id v10 = *(void **)(a1 + 48);
  void v11[4] = *(void *)(a1 + 40);
  id v12 = v10;
  char v13 = *(unsigned char *)(a1 + 56);
  [v9 enumerateRowsWithBlock:v11];
}

void __56__ML3Track_MLProtocol__multiverseIdentifierLibraryOnly___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [v14 int64ForColumnIndex:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v5 = [WeakRetained syncLibraryID];

  if (v3 >= 1 && [v5 length])
  {
    id v6 = objc_alloc_init(MIPLibraryIdentifier);
    [(MIPLibraryIdentifier *)v6 setLibraryId:v3];
    [(MIPLibraryIdentifier *)v6 setLibraryName:v5];
    [*(id *)(a1 + 40) addLibraryIdentifiers:v6];
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v7 = [v14 stringForColumnIndex:1];
    int v8 = [v14 intForColumnIndex:2];
    uint64_t v9 = [v14 int64ForColumnIndex:3];
    uint64_t v10 = [v14 int64ForColumnIndex:4];
    uint64_t v11 = [v14 int64ForColumnIndex:5];
    uint64_t v12 = [v14 int64ForColumnIndex:6];
    char v13 = [v14 stringForColumnIndex:7];
    if ([v7 length]) {
      [*(id *)(a1 + 40) setName:v7];
    }
    if (v8 >= 1) {
      [*(id *)(a1 + 40) setMediaType:ML3ProtocolMediaTypeForMLMediaType(v8)];
    }
    if (v9 >= 1) {
      [*(id *)(a1 + 40) setAccountId:v9];
    }
    if (v10 >= 1) {
      [*(id *)(a1 + 40) setStoreId:v10];
    }
    if (v11 >= 1) {
      [*(id *)(a1 + 40) setSagaId:v11];
    }
    if (v12 >= 1) {
      [*(id *)(a1 + 40) setPurchaseHistoryId:v12];
    }
    if ([v13 length]) {
      [*(id *)(a1 + 40) setCloudUniversalLibraryId:v13];
    }
  }
}

- (id)multiverseIdentifier
{
  return [(ML3Track *)self multiverseIdentifierLibraryOnly:0];
}

@end