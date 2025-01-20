@interface ML3Container
+ (BOOL)_reloadContainedMediaTypes:(BOOL)a3 removedMediaTypes:(id)a4 addedMediaTypes:(id)a5 notify:(BOOL)a6 incrementEntityRevision:(BOOL)a7 usingLibrary:(id)a8 connection:(id)a9 forContainerPersistentID:(int64_t)a10;
+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3;
+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6;
+ (BOOL)hasCriterionInCriteriaList:(SearchCriteriaList *)a3 forITDBTrackField:(int)a4;
+ (BOOL)libraryContentsChangeForProperty:(id)a3;
+ (BOOL)libraryDynamicChangeForProperty:(id)a3;
+ (BOOL)smartCriteriaCanBeEvaluated:(id)a3;
+ (BOOL)updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary:(id)a3;
+ (id)_allStaticItemContainersInLibrary:(id)a3 usingConnection:(id)a4;
+ (id)_mediaTypesForTracksInContainerWithPersistentID:(int64_t)a3 connection:(id)a4;
+ (id)_mediaTypesForTracksWithPersistentIDs:(id)a3 usingConnection:(id)a4;
+ (id)autoCreatedBuiltInSmartPlaylistsPIDs:(id)a3;
+ (id)currentDeviceFavoritesPlaylistInLibrary:(id)a3 usingConnection:(id)a4;
+ (id)databaseTable;
+ (id)defaultFilterPredicates;
+ (id)defaultOrderingTerms;
+ (id)extraTablesToDelete;
+ (id)foreignColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)joinClausesForProperty:(id)a3;
+ (id)nextFilepathForPlaylistType:(int)a3 withPersistentID:(unint64_t)a4 inLibrary:(id)a5;
+ (id)persistentIDColumnForTable:(id)a3;
+ (id)predicateForCriteriaList:(SearchCriteriaList *)a3 parentMatchedAny:(BOOL)a4;
+ (id)sectionPropertyForProperty:(id)a3;
+ (int)protocolSortTypeFromTrackOrder:(unsigned int)a3;
+ (int64_t)revisionTrackingCode;
+ (unsigned)trackOrderFromProtocolSortType:(int)a3;
+ (void)_addMediaTypesToContainerWithPersistentID:(int64_t)a3 mediaTypes:(id)a4 connection:(id)a5;
+ (void)_clearContainerMediaTypeInContainerWithPersistentID:(int64_t)a3 connection:(id)a4;
+ (void)_insertNewSmartPlaylist:(id)a3 criteriaBlob:(id)a4 evaluationOrder:(unsigned int)a5 limited:(BOOL)a6 trackOrder:(unsigned int)a7 distinguishedKind:(int)a8 inLibrary:(id)a9 cachedNameOrders:(id)a10;
+ (void)_removeMediaTypesFromContainerWithPersistentID:(int64_t)a3 mediaTypes:(id)a4 connection:(id)a5;
+ (void)_updateContainedMediaTypeInContainerWithPersistentID:(int64_t)a3 connection:(id)a4 itemUpdateBlock:(id)a5;
+ (void)deleteAutoCreatedBuiltInSmartPlaylistsPIDs:(id)a3 inLibrary:(id)a4;
+ (void)initialize;
+ (void)populateMediaTypesOfStaticContainersInLibrary:(id)a3;
+ (void)populateSortOrdersOfPropertyValues:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5;
+ (void)reloadContainedMediaTypesForContainerWithPersistID:(int64_t)a3 usingConnection:(id)a4;
+ (void)removeAnyNonLibraryItemsInPersistentIDs:(id)a3 fromContainersInLibrary:(id)a4 usingConnection:(id)a5;
+ (void)removeNonLibraryItemsFromContainer:(id)a3 usingConnection:(id)a4;
+ (void)removeNonLibraryItemsFromContainersInLibrary:(id)a3 usingConnection:(id)a4;
- (BOOL)_reloadContainedMediaTypes:(BOOL)a3 removedMediaTypes:(id)a4 addedMediaTypes:(id)a5 notify:(BOOL)a6 incrementEntityRevision:(BOOL)a7 usingConnection:(id)a8;
- (BOOL)_removeTracksAtIndexes:(id)a3 notify:(BOOL)a4 usingConnection:(id)a5;
- (BOOL)_setItemPersistentIDs:(id)a3 andEntryProperties:(id)a4 withAttributionIdentifier:(id)a5 reloadContainedMediaTypes:(BOOL)a6 removedMediaTypes:(id)a7 addedMediaTypes:(id)a8 notify:(BOOL)a9 incrementEntityRevision:(BOOL)a10 usingConnection:(id)a11;
- (BOOL)_supportsOrderedTrackOperations;
- (BOOL)appendTracksWithPersistentIDs:(id)a3 andEntryProperties:(id)a4 withAttributionIdentifier:(id)a5 notify:(BOOL)a6;
- (BOOL)appendTracksWithPersistentIDs:(id)a3 notify:(BOOL)a4;
- (BOOL)isBuiltInSmartPlaylist;
- (BOOL)isEvaluationOrderingDescending;
- (BOOL)isLimitOrderingDescending;
- (BOOL)isLimitedByCount;
- (BOOL)moveTrackFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (BOOL)removeAllTracks;
- (BOOL)removeFirstTrack;
- (BOOL)removeTracksAtIndexes:(id)a3 notify:(BOOL)a4;
- (BOOL)setItemReactionText:(id)a3 onEntryAtPosition:(unint64_t)a4 forUserIdentifier:(id)a5 previousReactionText:(id *)a6;
- (BOOL)setTracksWithPersistentIDs:(id)a3 andEntryProperties:(id)a4 withAttributionIdentifier:(id)a5 notify:(BOOL)a6;
- (BOOL)setTracksWithPersistentIDs:(id)a3 notify:(BOOL)a4;
- (ML3Container)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6;
- (ML3Predicate)smartCriteriaPredicate;
- (NSArray)cloudDisplayOrderingTerms;
- (NSArray)displayOrderingTerms;
- (NSArray)limitOrderingTerms;
- (NSString)limitingProperty;
- (SearchCriteriaList)importedCriteriaList;
- (id)_BOOLeanStringForCriteriaInfo:(id *)a3;
- (id)_addUnitesForCriterionInfo:(id *)a3;
- (id)_convertNumericValueFromCriterionMatchKey:(unsigned int)a3 criteriaValue:(int64_t)a4;
- (id)_criteriaListDescription:(SearchCriteriaList *)a3 level:(int64_t)a4;
- (id)_dateStringForCriteriaInfo:(id *)a3;
- (id)_formatTime:(int64_t)a3;
- (id)_nonzeroStringForCriteriaInfo:(id *)a3;
- (id)_numericStringForCriteriaInfo:(id *)a3;
- (id)_stringForCriterionBuffer:(id *)a3;
- (id)_stringForCriterionMatchKey:(id *)a3;
- (id)_stringForCriterionMatchType:(id *)a3;
- (id)_stringForTrackFieldCloudStatus:(int64_t)a3;
- (id)_stringForTrackFieldMediaKind:(int64_t)a3;
- (id)_stringStringForCriteriaInfo:(id *)a3;
- (id)childPlaylistPersistentIds;
- (id)criteriaListDescription;
- (id)evaluationOrderingTerms;
- (id)multiverseIdentifier;
- (id)protocolItem;
- (id)protocolItemForDynamicUpdate;
- (id)trackPersistentIds;
- (int64_t)_maxPositionForTracksUsingConnection:(id)a3;
- (int64_t)limitValue;
- (void)_setContainerSeedItemPersistentIDValue:(id)a3;
- (void)setValues:(id)a3 forProperties:(id)a4 async:(BOOL)a5 withCompletionBlock:(id)a6;
@end

@implementation ML3Container

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  v5 = [(id)ML3ContainerJoinsForProperties objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___ML3Container;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)databaseTable
{
  return @"container";
}

+ (id)defaultFilterPredicates
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[ML3ComparisonPredicate predicateWithProperty:@"is_ignorable_itunes_playlist" equalToValue:MEMORY[0x1E4F1CC28]];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  return [(id)ML3ContainerContentsUnchangingProperties containsObject:a3] ^ 1;
}

+ (int64_t)revisionTrackingCode
{
  return 1;
}

+ (id)defaultOrderingTerms
{
  return (id)ML3ContainerDefaultOrderingTerms;
}

+ (void)initialize
{
  v26[6] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[ML3OrderingTerm orderingTermWithProperty:@"cloud_is_subscribed"];
    v26[0] = v2;
    v3 = +[ML3OrderingTerm orderingTermWithProperty:@"(container.smart_is_folder = 0)"];
    v26[1] = v3;
    id v4 = +[ML3OrderingTerm orderingTermWithProperty:@"(container.smart_is_genius = 0)"];
    v26[2] = v4;
    v5 = +[ML3OrderingTerm orderingTermWithProperty:@"(container.smart_criteria IS NULL)"];
    v26[3] = v5;
    v6 = +[ML3OrderingTerm orderingTermWithProperty:@"name_order"];
    v26[4] = v6;
    id v7 = +[ML3OrderingTerm orderingTermWithProperty:@"container_pid"];
    v26[5] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:6];
    v9 = (void *)ML3ContainerDefaultOrderingTerms;
    ML3ContainerDefaultOrderingTerms = v8;

    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F0910738, @"(IFNULL(container.workout_template_id, 0) != 0)", &unk_1F0910750, @"(container.distinguished_kind = 17)", &unk_1F0910768, @"(container.distinguished_kind = 32)", &unk_1F0910780, @"((IFNULL(container.smart_is_genius, 0) << 2) | ((container.smart_criteria IS NOT NULL) << 1) | IFNULL(container.is_saveable, 0))", &unk_1F0910798, @"(container.is_container_type_active_target AND container.smart_is_genius)", &unk_1F09107B0, @"(container.is_container_type_active_target AND (container.container_type = 2))", &unk_1F09107C8, @"(container.distinguished_kind = 19 OR container.distinguished_kind = 20)", &unk_1F09107E0, @"(container.distinguished_kind = 20 AND container.is_container_type_active_target)", &unk_1F09107F8,
            @"(container.distinguished_kind = 71)",
            &unk_1F0910810,
            @"(container.distinguished_kind = 10000 AND container.is_container_type_active_target)",
            &unk_1F0910828,
            @"(container.distinguished_kind = 10010 AND container.is_container_type_active_target)",
            &unk_1F0910840,
            @"(is_src_remote = 0 OR container.distinguished_kind = 0)",
            &unk_1F0910858,
            @"((container.smart_criteria IS NOT NULL) AND (container.smart_is_dynamic = 1) AND (container.smart_is_limited = 1))",
            &unk_1F0910870,
            @"(container.smart_criteria IS NULL)",
            &unk_1F0910888,
            @"(container.smart_is_genius = 0)",
            &unk_1F09108A0,
            @"(container.smart_is_folder = 0)",
            &unk_1F09108B8,
            @"(container.distinguished_kind = 0 AND container.is_hidden = 0 AND container.smart_criteria IS NULL AND container.smart_is_genius = 0 AND (container.cloud_is_subscribed = 0 OR container.is_editable = 1))",
            &unk_1F09108D0,
            @"(container.is_src_remote = 1)",
            &unk_1F09108E8,
            @"container_seed.item_pid",
            &unk_1F0910900,
            @"(IFNULL(container_item.container_pid, 0) != 0 OR smart_criteria IS NOT NULL)",
            &unk_1F0910918,
            @"best_artwork_token.available_artwork_token AS available_container_artwork_token",
            &unk_1F0910930,
            @"best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token",
            &unk_1F0910948,
            @"best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type",
            0);
    v11 = (void *)ML3ContainerJoinsForProperties;
    ML3ContainerJoinsForProperties = v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    v13 = (void *)ML3ContainerSectionPropertyForProperties;
    ML3ContainerSectionPropertyForProperties = (uint64_t)v12;

    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"container_seed", @"container_seed.item_pid", @"best_artwork_token", @"best_artwork_token.available_artwork_token AS available_container_artwork_token", @"best_artwork_token", @"best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token", @"best_artwork_token", @"best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type", 0);
    v15 = (void *)ML3ContainerForeignDatabaseTableForProperties;
    ML3ContainerForeignDatabaseTableForProperties = v14;

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"item_pid", @"container_seed.item_pid", @"available_artwork_token", @"best_artwork_token.available_artwork_token AS available_container_artwork_token", @"fetchable_artwork_token", @"best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token", @"fetchable_artwork_source_type", @"best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type", 0);
    v17 = (void *)ML3ContainerForeignColumnForProperties;
    ML3ContainerForeignColumnForProperties = v16;

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"container_seed", 0);
    v19 = (void *)ML3ContainerExtraTablesToDelete;
    ML3ContainerExtraTablesToDelete = v18;

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"container_pid", @"container_seed", 0);
    v21 = (void *)ML3ContainerPersistentIDForTable;
    ML3ContainerPersistentIDForTable = v20;

    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"play_count_user", @"play_count_recent", @"date_played", @"date_modified", @"liked_state", @"keep_local", @"keep_local_status", @"keep_local_status_reason", @"keep_local_constraints", @"cloud_user_count", @"cloud_global_like_count", @"cloud_global_play_count", @"date_played_local", @"liked_state_changed_date", 0);
    v23 = (void *)ML3ContainerContentsUnchangingProperties;
    ML3ContainerContentsUnchangingProperties = v22;

    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"play_count_user", @"play_count_recent", 0);
    v25 = (void *)ML3ContainerNoAssistantSyncProperties;
    ML3ContainerNoAssistantSyncProperties = v24;

    bzero(&TrackFieldToML3Info, 0xB80uLL);
    qword_1EB551090 = @"item_extra.title";
    unk_1EB551098 = StringPredicateForCriteriaInfo;
    qword_1EB5510A0 = @"album.album";
    unk_1EB5510A8 = StringPredicateForCriteriaInfo;
    qword_1EB5510B0 = @"item_artist.item_artist";
    unk_1EB5510B8 = StringPredicateForCriteriaInfo;
    qword_1EB5510C0 = @"item_playback.bit_rate";
    qword_1EB5510C8 = (uint64_t)NumericPredicateForCriteriaInfo;
    unk_1EB5510D0 = @"item_playback.sample_rate";
    qword_1EB5510D8 = (uint64_t)NumericPredicateForCriteriaInfo;
    unk_1EB5510E0 = @"item_extra.year";
    qword_1EB5510E8 = (uint64_t)NumericPredicateForCriteriaInfo;
    unk_1EB5510F0 = @"genre.genre";
    qword_1EB5510F8 = (uint64_t)StringPredicateForCriteriaInfo;
    unk_1EB551100 = @"item_extra.location_kind_id";
    qword_1EB551108 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551120 = @"track_number";
    unk_1EB551128 = NumericPredicateForCriteriaInfo;
    qword_1EB551140 = @"item_extra.total_time_ms";
    unk_1EB551148 = NumericPredicateForCriteriaInfo;
    qword_1EB551150 = @"item_extra.comment";
    unk_1EB551158 = StringPredicateForCriteriaInfo;
    qword_1EB551180 = @"item_playback.eq_preset";
    unk_1EB551188 = StringPredicateForCriteriaInfo;
    qword_1EB551190 = @"composer.composer";
    unk_1EB551198 = StringPredicateForCriteriaInfo;
    qword_1EB5511B0 = @"item_playback.volume_normalization_energy";
    unk_1EB5511B8 = NumericPredicateForCriteriaInfo;
    qword_1EB5511F0 = @"disc_number";
    unk_1EB5511F8 = NumericPredicateForCriteriaInfo;
    qword_1EB551220 = @"ROWID";
    unk_1EB551228 = NumericPredicateForCriteriaInfo;
    qword_1EB551230 = @"ROWID";
    unk_1EB551238 = NumericPredicateForCriteriaInfo;
    qword_1EB551240 = @"item_extra.is_user_disabled";
    unk_1EB551248 = BooleanPredicateForCriteriaInfo;
    qword_1EB551260 = @"is_compilation";
    unk_1EB551268 = BooleanPredicateForCriteriaInfo;
    qword_1EB5512A0 = @"item_extra.bpm";
    qword_1EB5512A8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB5512E0 = @"item_extra.grouping";
    qword_1EB5512E8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551300 = @"item_store.store_item_id";
    qword_1EB551308 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551310 = @"item_artist.store_id";
    qword_1EB551318 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551320 = @"item_store.store_playlist_id";
    qword_1EB551328 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551330 = @"item_store.store_composer_id";
    qword_1EB551338 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551340 = @"item_store.store_genre_id";
    qword_1EB551348 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551380 = @"item_extra.disc_count";
    qword_1EB551388 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551390 = @"item_playback.start_time_ms";
    qword_1EB551398 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB5513A0 = @"item_playback.stop_time_ms";
    qword_1EB5513A8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB5513B0 = @"item_extra.track_count";
    qword_1EB5513B8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB5513C0 = @"item_store.storefront_id";
    qword_1EB5513C8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB5513D0 = @"item_extra.description";
    qword_1EB5513D8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB5513E0 = @"category.category";
    qword_1EB5513E8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB5514E0 = @"album_artist.album_artist";
    qword_1EB5514E8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551510 = @"item_playback.relative_volume";
    qword_1EB551518 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551550 = @"item_extra.sort_title";
    qword_1EB551558 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551560 = @"album.sort_album";
    qword_1EB551568 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551570 = @"item_artist.sort_item_artist";
    qword_1EB551578 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551580 = @"album_artist.sort_album_artist";
    qword_1EB551588 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551590 = @"composer.sort_composer";
    qword_1EB551598 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB5515A0 = @"item_artist.sort_series_name";
    qword_1EB5515A8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551610 = @"album.user_rating";
    qword_1EB551618 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551650 = @"item_stats.remember_bookmark";
    qword_1EB551658 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1EB5515D0 = @"item_extra.description_long";
    qword_1EB5515D8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551670 = @"item_video.has_alternate_audio";
    qword_1EB551678 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1EB551690 = @"item_video.audio_language";
    qword_1EB551698 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB5516A0 = @"item_video.audio_track_index";
    qword_1EB5516A8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB5516B0 = @"item_video.audio_track_id";
    qword_1EB5516B8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551760 = @"item_extra.genius_id";
    qword_1EB551768 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551770 = @"exclude_from_shuffle";
    qword_1EB551778 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1EB551780 = @"lyrics.lyrics";
    qword_1EB551788 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551790 = @"item_store.store_item_id";
    qword_1EB551798 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB5517C0 = @"((item.media_type & 4128)!=0)";
    qword_1EB5517C8 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1EB5517D0 = @"((item.media_type & 4128)!=0)";
    qword_1EB5517D8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551830 = @"item_extra.copyright";
    qword_1EB551838 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551840 = @"item_extra.is_user_disabled";
    qword_1EB551848 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1EB5517E0 = @"item_store.store_xid";
    qword_1EB5517E8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551850 = @"best_artwork_token.available_artwork_token IS NOT NULL";
    qword_1EB551858 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1EB551860 = @"item_extra.collection_description";
    qword_1EB551868 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB551870 = @"item_store.store_flavor";
    qword_1EB551878 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1EB5518A0 = @"item_stats.chosen_by_auto_fill";
    qword_1EB5518A8 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1EB551880 = @"item_store.store_saga_id";
    qword_1EB551888 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB5518D0 = @"item_store.cloud_status";
    qword_1EB5518D8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551130 = @"item_extra.file_size";
    unk_1EB551138 = NumericPredicateForCriteriaInfo;
    qword_1EB551110 = @"item_extra.date_modified";
    unk_1EB551118 = DatePredicateForCriteriaInfo;
    qword_1EB551170 = @"date_added";
    unk_1EB551178 = DatePredicateForCriteriaInfo;
    qword_1EB551290 = @"item_store.date_released";
    qword_1EB551298 = (uint64_t)DatePredicateForCriteriaInfo;
    qword_1EB5511D0 = @"item_stats.play_count_user";
    unk_1EB5511D8 = NumericPredicateForCriteriaInfo;
    qword_1EB5511E0 = @"item_stats.date_played";
    unk_1EB5511E8 = DatePredicateForCriteriaInfo;
    qword_1EB551200 = @"item_stats.user_rating";
    unk_1EB551208 = NumericPredicateForCriteriaInfo;
    qword_1EB5514B0 = @"item_stats.skip_count_user";
    qword_1EB5514B8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB5514C0 = @"item_stats.date_skipped";
    qword_1EB5514C8 = (uint64_t)DatePredicateForCriteriaInfo;
    qword_1EB551640 = @"item_stats.bookmark_time_ms";
    qword_1EB551648 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551660 = @"item_stats.has_been_played";
    qword_1EB551668 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1EB5518C0 = @"(item.base_location_id >= 250)";
    qword_1EB5518C8 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1EB5512C0 = @"best_artwork_token.available_artwork_token IS NOT NULL";
    qword_1EB5512C8 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1EB551A10 = @"item_stats.liked_state";
    qword_1EB551A18 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551BE0 = @"item_stats.liked_state_changed_date";
    qword_1EB551BE8 = (uint64_t)DatePredicateForCriteriaInfo;
    qword_1EB551A30 = @"album.liked_state";
    qword_1EB551A38 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1EB551430 = @"item_extra.media_kind";
    qword_1EB551438 = (uint64_t)NumericPredicateForCriteriaInfo;
  }
}

- (BOOL)_setItemPersistentIDs:(id)a3 andEntryProperties:(id)a4 withAttributionIdentifier:(id)a5 reloadContainedMediaTypes:(BOOL)a6 removedMediaTypes:(id)a7 addedMediaTypes:(id)a8 notify:(BOOL)a9 incrementEntityRevision:(BOOL)a10 usingConnection:(id)a11
{
  uint64_t v13 = a6;
  v162[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  uint64_t v20 = self;
  id v114 = v19;
  id v112 = a7;
  id v111 = a8;
  id v21 = a11;
  uint64_t v22 = [NSNumber numberWithLongLong:self->super._persistentID];
  v131 = v21;
  if ([v17 count])
  {
    v121 = (void *)v22;
    unsigned int v107 = v13;
    v110 = self;
    id v108 = v17;
    v23 = [[ML3ContainerItemDiffOperation alloc] initWithContainerPersistentID:self->super._persistentID updatedItemsPersistentIDs:v17 updatedItemsProperties:v18 connection:v21];
    [(ML3ContainerItemDiffOperation *)v23 start];
    [(ML3ContainerItemDiffOperation *)v23 waitUntilFinished];
    v109 = v23;
    uint64_t v24 = [(ML3ContainerItemDiffOperation *)v23 containerItemsToDelete];
    v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v24, "count"));
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id v26 = v24;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v141 objects:v160 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v142;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v142 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v141 + 1) + 8 * i), "persistentID"));
          [v25 addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v141 objects:v160 count:16];
      }
      while (v28);
    }
    id v122 = v18;
    id v113 = v26;

    v32 = +[ML3DatabaseStatementRenderer defaultRenderer];
    unint64_t v130 = [v25 count];
    unint64_t v33 = 0;
    v124 = v32;
    do
    {
      if (v130 <= v33) {
        break;
      }
      if (v130 - v33 >= 0x64) {
        uint64_t v34 = 100;
      }
      else {
        uint64_t v34 = v130 - v33;
      }
      v35 = -[NSObject subarrayWithRange:](v25, "subarrayWithRange:", v33, v34);
      v36 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v151 = (uint64_t)v35;
        _os_log_impl(&dword_1B022D000, v36, OS_LOG_TYPE_DEFAULT, "Deleting container_item rows with persistent-ids: %{public}@", buf, 0xCu);
      }

      v37 = [v32 statementWithPrefix:@"DELETE FROM container_item_person WHERE container_item_pid" inParameterCount:v34];
      id v140 = 0;
      char v38 = [v131 executeUpdate:v37 withParameters:v35 error:&v140];
      id v39 = v140;
      if (v38)
      {
        v40 = [v32 statementWithPrefix:@"DELETE FROM container_item WHERE ROWID" inParameterCount:v34];
        id v139 = 0;
        char v41 = [v131 executeUpdate:v40 withParameters:v35 error:&v139];
        v42 = v139;
        if (v41)
        {
          int v43 = 0;
        }
        else
        {
          v44 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v151 = (uint64_t)v42;
            _os_log_impl(&dword_1B022D000, v44, OS_LOG_TYPE_ERROR, "Failed to delete container_item rows with error: %{public}@", buf, 0xCu);
          }

          int v43 = 5;
        }
      }
      else
      {
        v42 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v151 = (uint64_t)v39;
          _os_log_impl(&dword_1B022D000, v42, OS_LOG_TYPE_ERROR, "Failed to delete container_item_person rows with error: %{public}@", buf, 0xCu);
        }
        int v43 = 5;
      }
      v33 += v34;

      v32 = v124;
    }
    while (!v43);
    if (v114)
    {
      id v159 = v114;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v159 count:1];
      v46 = [v131 executeQuery:@"SELECT person_pid FROM person WHERE cloud_id = ?" withParameters:v45];
      uint64_t v47 = [v46 int64ValueForFirstRowAndColumn];

      id v18 = v122;
      v48 = self;
      uint64_t v123 = v47;
      if (!v47)
      {
        v49 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v151 = (uint64_t)v114;
          _os_log_impl(&dword_1B022D000, v49, OS_LOG_TYPE_ERROR, "No person entry for cloud ID '%{public}@' - skipping attribution", buf, 0xCu);
        }

        uint64_t v123 = 0;
      }
    }
    else
    {
      uint64_t v123 = 0;
      id v18 = v122;
      v48 = self;
    }
    v57 = [(ML3Entity *)v48 valueForProperty:@"keep_local"];
    int v58 = [v57 integerValue];

    v59 = [(ML3ContainerItemDiffOperation *)v109 containerItemsToUpdate];
    v115 = [[ML3PersistentIDGenerator alloc] initWithDatabaseConnection:v131 tableName:@"container_item"];
    v116 = [[ML3PersistentIDGenerator alloc] initWithDatabaseConnection:v131 tableName:@"container_item_person"];
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id obj = v59;
    uint64_t v120 = [obj countByEnumeratingWithState:&v135 objects:v158 count:16];
    if (!v120) {
      goto LABEL_79;
    }
    unsigned int v118 = v58 - 1;
    uint64_t v119 = *(void *)v136;
    *(void *)&long long v60 = 134218242;
    long long v106 = v60;
LABEL_42:
    uint64_t v61 = 0;
    while (1)
    {
      if (*(void *)v136 != v119) {
        objc_enumerationMutation(obj);
      }
      v62 = *(void **)(*((void *)&v135 + 1) + 8 * v61);
      uint64_t v63 = objc_msgSend(v62, "persistentID", v106);
      v64 = os_log_create("com.apple.amp.medialibrary", "Default");
      BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
      uint64_t v125 = v61;
      if (v63)
      {
        if (v65)
        {
          uint64_t v66 = [v62 newPosition];
          uint64_t v67 = [v62 persistentID];
          uint64_t v68 = [v62 previousPosition];
          uint64_t v69 = [v62 newPosition];
          *(_DWORD *)buf = 134218752;
          uint64_t v151 = v66;
          __int16 v152 = 2048;
          uint64_t v153 = v67;
          __int16 v154 = 2048;
          uint64_t v155 = v68;
          __int16 v156 = 2048;
          uint64_t v157 = v69;
          _os_log_impl(&dword_1B022D000, v64, OS_LOG_TYPE_DEFAULT, "Mapped item at position %lld to existing container_item with pid %lld (update position: %lld -> %lld)", buf, 0x2Au);
        }
      }
      else
      {
        if (v65)
        {
          uint64_t v70 = [v62 newPosition];
          *(_DWORD *)buf = 134217984;
          uint64_t v151 = v70;
          _os_log_impl(&dword_1B022D000, v64, OS_LOG_TYPE_DEFAULT, "Creating new container_item for item at position %lld", buf, 0xCu);
        }

        objc_msgSend(v62, "setPersistentID:", -[ML3PersistentIDGenerator nextPersistentID](v115, "nextPersistentID"));
      }
      v71 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v62, "itemPersistentID"));
      v72 = [v18 objectForKeyedSubscript:v71];

      v73 = [v72 objectForKeyedSubscript:@"uuid"];
      v74 = v73;
      if (v73)
      {
        id v75 = v73;
      }
      else
      {
        id v75 = [v62 uuid];
      }
      id v76 = v75;

      v77 = [v72 objectForKeyedSubscript:@"position_uuid"];
      v78 = v77;
      v129 = v72;
      if (v77)
      {
        id v79 = v77;
      }
      else
      {
        id v79 = [v62 positionUUID];
      }
      id v80 = v79;

      uint64_t v81 = [v62 occurrenceID];
      v82 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v62, "persistentID"));
      v149[0] = v82;
      v149[1] = v121;
      v83 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v62, "itemPersistentID"));
      v149[2] = v83;
      v84 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v62, "newPosition"));
      v149[3] = v84;
      v127 = (void *)v81;
      v128 = v76;
      v149[4] = v76;
      v126 = v80;
      v149[5] = v80;
      v149[6] = v81;
      v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:7];
      id v134 = 0;
      char v86 = [v131 executeUpdate:@"INSERT OR REPLACE INTO container_item (container_item_pid, container_pid, item_pid, position, uuid, position_uuid, occurrence_id) VALUES (?, ?, ?, ?, ?, ?, ?)", v85, &v134 withParameters error];
      id v87 = v134;

      if ((v86 & 1) == 0) {
        break;
      }
      uint64_t v88 = v63;
      if (!v63 && v123)
      {
        uint64_t v89 = [(ML3PersistentIDGenerator *)v116 nextPersistentID];
        v90 = [NSNumber numberWithLongLong:v89];
        v148[0] = v90;
        v91 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v62, "persistentID"));
        v148[1] = v91;
        v92 = [NSNumber numberWithLongLong:v123];
        v148[2] = v92;
        v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:3];
        id v133 = 0;
        char v94 = [v131 executeUpdate:@"INSERT OR REPLACE INTO container_item_person (container_item_person_pid, container_item_pid, person_pid) VALUES (?, ?, ?)", v93, &v133 withParameters error];
        id v95 = v133;

        if ((v94 & 1) == 0)
        {
          v96 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
          {
            uint64_t v97 = [v62 itemPersistentID];
            *(_DWORD *)buf = v106;
            uint64_t v151 = v97;
            __int16 v152 = 2114;
            uint64_t v153 = (uint64_t)v95;
            _os_log_impl(&dword_1B022D000, v96, OS_LOG_TYPE_ERROR, "Failed to add container_item_person for track %lld. err = %{public}@", buf, 0x16u);
          }
        }
        uint64_t v88 = 0;
      }
      if (!v88 && v118 <= 1)
      {
        v98 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v62, "itemPersistentID"));
        v147[0] = v98;
        v147[1] = &unk_1F0911020;
        v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:2];
        id v132 = 0;
        int v100 = objc_msgSend(v131, "executeUpdate:withParameters:error:", @"UPDATE item set keep_local=0 WHERE (item_pid=? AND keep_local<?);",
                 v99,
                 &v132);
        os_log_t v101 = (os_log_t)v132;

        if (!v100)
        {
          v102 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            uint64_t v103 = [v62 persistentID];
            *(_DWORD *)buf = v106;
            uint64_t v151 = v103;
            __int16 v152 = 2114;
            uint64_t v153 = (uint64_t)v101;
            _os_log_impl(&dword_1B022D000, v102, OS_LOG_TYPE_ERROR, "Failed to clear keep_local for track %lld - error: %{public}@", buf, 0x16u);
          }

LABEL_78:
          id v18 = v122;
          goto LABEL_79;
        }
      }
      uint64_t v61 = v125 + 1;
      id v18 = v122;
      if (v120 == v125 + 1)
      {
        uint64_t v120 = [obj countByEnumeratingWithState:&v135 objects:v158 count:16];
        if (v120) {
          goto LABEL_42;
        }
LABEL_79:

        v52 = v109;
        uint64_t v20 = v110;
        v53 = v121;
LABEL_80:

        id v17 = v108;
        uint64_t v13 = v107;
        goto LABEL_81;
      }
    }
    os_log_t v101 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v151 = (uint64_t)v87;
      _os_log_impl(&dword_1B022D000, v101, OS_LOG_TYPE_ERROR, "Failed to insert container_item with error: %{public}@", buf, 0xCu);
    }
    goto LABEL_78;
  }
  v162[0] = v22;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:1];
  id v146 = 0;
  char v51 = [v21 executeUpdate:@"DELETE FROM container_item_person WHERE container_item_pid in (SELECT container_item_pid from container_item where container_pid=?)" withParameters:v50 error:&v146];
  v52 = (ML3ContainerItemDiffOperation *)v146;

  v53 = (void *)v22;
  if ((v51 & 1) == 0)
  {
    v54 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v151 = (uint64_t)v52;
      _os_log_impl(&dword_1B022D000, v54, OS_LOG_TYPE_ERROR, "Failed to delete from container_item_persons with error: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v161 = v22;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v161 count:1];
  id v145 = 0;
  char v56 = [v131 executeUpdate:@"DELETE FROM container_item WHERE container_pid = ?" withParameters:v55 error:&v145];
  id v113 = v145;

  if ((v56 & 1) == 0)
  {
    unsigned int v107 = v13;
    id v108 = v17;
    v25 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v151 = (uint64_t)v113;
      _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_ERROR, "Failed to delete all existing container_item rows with error: %{public}@", buf, 0xCu);
    }
    goto LABEL_80;
  }
LABEL_81:

  BOOL v104 = [(ML3Container *)v20 _reloadContainedMediaTypes:v13 removedMediaTypes:v112 addedMediaTypes:v111 notify:a9 incrementEntityRevision:a10 usingConnection:v131];
  return v104;
}

- (BOOL)_supportsOrderedTrackOperations
{
  v3 = [MEMORY[0x1E4F1CAD0] set];
  id v4 = [(ML3Entity *)self valueForProperty:@"distinguished_kind"];
  char v5 = [v3 containsObject:v4] ^ 1;

  return v5;
}

- (void)_setContainerSeedItemPersistentIDValue:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ML3Container__setContainerSeedItemPersistentIDValue___block_invoke;
  v7[3] = &unk_1E5FB6A58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained databaseConnectionAllowingWrites:1 withBlock:v7];
}

void __55__ML3Container__setContainerSeedItemPersistentIDValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ML3Container__setContainerSeedItemPersistentIDValue___block_invoke_2;
  v7[3] = &unk_1E5FB4C68;
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  [v6 performTransactionWithBlock:v7];
}

uint64_t __55__ML3Container__setContainerSeedItemPersistentIDValue___block_invoke_2(void *a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  id v3 = [NSNumber numberWithLongLong:*(void *)(a1[5] + 16)];
  v12[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  LODWORD(v2) = objc_msgSend(v2, "executeUpdate:withParameters:error:", @"DELETE FROM container_seed WHERE container_pid = ?;",
                  v4,
                  0);

  if (!v2) {
    return 0;
  }
  char v5 = (void *)a1[4];
  id v6 = [NSNumber numberWithLongLong:*(void *)(a1[5] + 16)];
  uint64_t v7 = a1[6];
  v11[0] = v6;
  v11[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v9 = objc_msgSend(v5, "executeUpdate:withParameters:error:", @"INSERT INTO container_seed (container_pid, item_pid) VALUES (?, ?);",
         v8,
         0);

  return v9;
}

- (BOOL)_removeTracksAtIndexes:(id)a3 notify:(BOOL)a4 usingConnection:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ML3Entity persistentID](self, "persistentID"));
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__ML3Container__removeTracksAtIndexes_notify_usingConnection___block_invoke;
  v16[3] = &unk_1E5FB4C40;
  id v19 = v24;
  v16[4] = self;
  SEL v22 = a2;
  uint64_t v20 = &v25;
  id v12 = v10;
  id v17 = v12;
  id v13 = v11;
  id v18 = v13;
  id v21 = v23;
  [v9 enumerateRangesUsingBlock:v16];
  if (*((unsigned char *)v26 + 24))
  {
    BOOL v14 = [(ML3Container *)self _reloadContainedMediaTypes:1 removedMediaTypes:0 addedMediaTypes:0 notify:v6 incrementEntityRevision:1 usingConnection:v12];
    *((unsigned char *)v26 + 24) = v14;
  }
  else
  {
    BOOL v14 = 0;
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

void __62__ML3Container__removeTracksAtIndexes_notify_usingConnection___block_invoke(void *a1, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  v40[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void *)(a1[7] + 8);
  unint64_t v8 = *(void *)(v7 + 24);
  if (v8) {
    BOOL v9 = a2 > v8;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a1[10] object:a1[4] file:@"ML3Container.m" lineNumber:2129 description:@"[NSIndexSet enumerateRangesUsingBlock:] is not enumerating ranges in order!"];

    uint64_t v7 = *(void *)(a1[7] + 8);
  }
  *(void *)(v7 + 24) = a2;
  id v10 = (void *)a1[5];
  v40[0] = a1[6];
  v11 = [NSNumber numberWithUnsignedInteger:a2 - *(void *)(*(void *)(a1[9] + 8) + 24)];
  v40[1] = v11;
  id v12 = [NSNumber numberWithUnsignedInteger:a2 + a3 + ~*(void *)(*(void *)(a1[9] + 8) + 24)];
  v40[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  id v35 = 0;
  char v14 = [v10 executeUpdate:@"DELETE FROM container_item_person WHERE container_item_pid in (SELECT container_item_pid from container_item where container_pid = ? AND position BETWEEN ? AND ?)" withParameters:v13 error:&v35];
  id v15 = v35;
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v14;

  if ((v14 & 1) == 0)
  {
    uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v15;
      _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "Failed to delete from container_item_persons with error: %{public}@", buf, 0xCu);
    }
  }
  id v17 = (void *)a1[5];
  v37[0] = a1[6];
  id v18 = [NSNumber numberWithUnsignedInteger:a2 - *(void *)(*(void *)(a1[9] + 8) + 24)];
  v37[1] = v18;
  id v19 = [NSNumber numberWithUnsignedInteger:a2 + a3 + ~*(void *)(*(void *)(a1[9] + 8) + 24)];
  v37[2] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
  id v34 = 0;
  char v21 = [v17 executeUpdate:@"DELETE FROM container_item WHERE container_pid = ? AND position BETWEEN ? AND ?" withParameters:v20 error:&v34];
  id v22 = v34;
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v21;

  if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
  {
    v23 = (void *)a1[5];
    uint64_t v24 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v25 = a1[6];
    v36[0] = v24;
    v36[1] = v25;
    id v26 = [NSNumber numberWithUnsignedInteger:a2 - *(void *)(*(void *)(a1[9] + 8) + 24)];
    v36[2] = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
    id v33 = 0;
    LOBYTE(v23) = [v23 executeUpdate:@"UPDATE container_item SET position = (position - ?) WHERE container_pid = ? AND position >= ?" withParameters:v27 error:&v33];
    id v28 = v33;
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = (_BYTE)v23;

    if (!*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
    {
      uint64_t v29 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v39 = v28;
        _os_log_impl(&dword_1B022D000, v29, OS_LOG_TYPE_ERROR, "Failed to update container_item position(s) with error: %{public}@", buf, 0xCu);
      }

      *a4 = 1;
    }
  }
  else
  {
    v30 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v22;
      _os_log_impl(&dword_1B022D000, v30, OS_LOG_TYPE_ERROR, "Failed to delete existing container_item row(s) with error: %{public}@", buf, 0xCu);
    }

    *a4 = 1;
  }
  *(void *)(*(void *)(a1[9] + 8) + 24) += a3;
}

- (BOOL)_reloadContainedMediaTypes:(BOOL)a3 removedMediaTypes:(id)a4 addedMediaTypes:(id)a5 notify:(BOOL)a6 incrementEntityRevision:(BOOL)a7 usingConnection:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  BOOL v12 = a3;
  p_library = &self->super._library;
  id v15 = a8;
  id v16 = a5;
  id v17 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_library);
  LOBYTE(v8) = +[ML3Container _reloadContainedMediaTypes:v12 removedMediaTypes:v17 addedMediaTypes:v16 notify:v9 incrementEntityRevision:v8 usingLibrary:WeakRetained connection:v15 forContainerPersistentID:[(ML3Entity *)self persistentID]];

  return v8;
}

- (int64_t)_maxPositionForTracksUsingConnection:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSNumber;
  id v5 = a3;
  BOOL v6 = objc_msgSend(v4, "numberWithLongLong:", -[ML3Entity persistentID](self, "persistentID"));
  v12[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  BOOL v8 = [v5 executeQuery:@"SELECT IFNULL(MAX(position), -1) FROM container_item WHERE container_pid = ?", v7 withParameters];

  BOOL v9 = [v8 objectForFirstRowAndColumn];
  int64_t v10 = [v9 integerValue];

  return v10;
}

- (BOOL)setItemReactionText:(id)a3 onEntryAtPosition:(unint64_t)a4 forUserIdentifier:(id)a5 previousReactionText:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__8120;
  id v28 = __Block_byref_object_dispose__8121;
  id v29 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke;
  v17[3] = &unk_1E5FB4BF0;
  id v13 = v11;
  id v18 = v13;
  id v19 = self;
  unint64_t v23 = a4;
  char v21 = &v24;
  id v14 = v10;
  id v20 = v14;
  id v22 = &v30;
  [WeakRetained databaseConnectionAllowingWrites:1 withBlock:v17];

  if (a6) {
    *a6 = (id) v25[5];
  }
  char v15 = *((unsigned char *)v31 + 24);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke(void *a1, void *a2)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1[4])
  {
    v46[0] = a1[4];
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    id v5 = [v3 executeQuery:@"SELECT person_pid FROM person WHERE cloud_id = ?" withParameters:v4];
    uint64_t v6 = [v5 int64ValueForFirstRowAndColumn];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [NSNumber numberWithLongLong:*(void *)(a1[5] + 16)];
  v45[0] = v7;
  BOOL v8 = [NSNumber numberWithUnsignedInteger:a1[9]];
  v45[1] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  id v10 = [v3 executeQuery:@"SELECT container_item_pid FROM container_item WHERE container_pid = ? AND position = ?" withParameters:v9];
  uint64_t v11 = [v10 int64ValueForFirstRowAndColumn];

  uint64_t v37 = 0;
  char v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  BOOL v12 = [NSNumber numberWithLongLong:v6];
  v44[0] = v12;
  id v13 = [NSNumber numberWithLongLong:v11];
  v44[1] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  char v15 = [v3 executeQuery:@"SELECT container_item_reaction_pid, reaction FROM container_item_reaction WHERE person_pid = ? AND container_item_pid = ?", v14 withParameters];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke_2;
  void v36[3] = &unk_1E5FB76A0;
  uint64_t v16 = a1[7];
  v36[4] = &v37;
  v36[5] = v16;
  [v15 enumerateRowsWithBlock:v36];

  if (v38[3])
  {
    if (a1[6])
    {
      v42[0] = a1[6];
      objc_msgSend(NSNumber, "numberWithLongLong:");
      id v17 = (ML3PersistentIDGenerator *)objc_claimAutoreleasedReturnValue();
      v42[1] = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
      id v34 = 0;
      char v19 = [v3 executeUpdate:@"UPDATE container_item_reaction SET reaction = ? WHERE container_item_reaction_pid = ?" withParameters:v18 error:&v34];
      id v20 = v34;
    }
    else
    {
      objc_msgSend(NSNumber, "numberWithLongLong:");
      id v17 = (ML3PersistentIDGenerator *)objc_claimAutoreleasedReturnValue();
      int v43 = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
      id v35 = 0;
      char v19 = [v3 executeUpdate:@"DELETE FROM container_item_reaction WHERE container_item_reaction_pid = ?" withParameters:v18 error:&v35];
      id v20 = v35;
    }
    id v29 = v20;
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v19;
  }
  else
  {
    id v17 = [[ML3PersistentIDGenerator alloc] initWithDatabaseConnection:v3 tableName:@"container_item_reaction"];
    uint64_t v21 = [(ML3PersistentIDGenerator *)v17 nextPersistentID];
    v38[3] = v21;
    id v18 = [NSNumber numberWithLongLong:v21];
    v41[0] = v18;
    v31 = [NSNumber numberWithLongLong:v11];
    v41[1] = v31;
    id v22 = [NSNumber numberWithLongLong:v6];
    uint64_t v23 = a1[6];
    v41[2] = v22;
    v41[3] = v23;
    uint64_t v24 = NSNumber;
    uint64_t v25 = [MEMORY[0x1E4F1C9C8] now];
    [v25 timeIntervalSince1970];
    uint64_t v26 = objc_msgSend(v24, "numberWithDouble:");
    v41[4] = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];
    id v33 = 0;
    char v28 = [v3 executeUpdate:@"INSERT INTO container_item_reaction (container_item_reaction_pid, container_item_pid, person_pid, reaction, date) VALUES (?, ?, ?, ?, ?)", v27, &v33 withParameters error];
    id v29 = v33;
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v28;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke_3;
  v32[3] = &unk_1E5FB6078;
  uint64_t v30 = a1[8];
  v32[4] = a1[5];
  v32[5] = v30;
  [v3 enqueueBlockForTransactionCommit:v32];

  _Block_object_dispose(&v37, 8);
}

void __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 int64ForColumnIndex:0];
  uint64_t v4 = [v3 stringForColumnIndex:1];

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke_3(uint64_t a1, int a2)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [WeakRetained notifyDisplayValuesPropertyDidChange];
  }
}

- (BOOL)isBuiltInSmartPlaylist
{
  BOOL v2 = [(ML3Entity *)self valueForProperty:@"distinguished_kind"];
  int v3 = [v2 longValue];

  unint64_t v4 = 0;
  uint64_t v5 = &dword_1F08C8D1C;
  do
  {
    int v7 = *v5;
    v5 += 6;
    int v6 = v7;
    if (v4 > 3) {
      break;
    }
    ++v4;
  }
  while (v6 != v3);
  return v6 == v3;
}

- (id)childPlaylistPersistentIds
{
  int v3 = [NSNumber numberWithLongLong:self->super._persistentID];
  unint64_t v4 = +[ML3ComparisonPredicate predicateWithProperty:@"parent_pid" value:v3 comparison:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  int v6 = +[ML3Entity queryWithLibrary:WeakRetained predicate:v4];

  int v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "countOfEntities"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__ML3Container_childPlaylistPersistentIds__block_invoke;
  v10[3] = &unk_1E5FB7EE0;
  id v8 = v7;
  id v11 = v8;
  [v6 enumeratePersistentIDsUsingBlock:v10];

  return v8;
}

void __42__ML3Container_childPlaylistPersistentIds__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

- (id)trackPersistentIds
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  uint64_t v5 = +[ML3ComparisonPredicate predicateWithProperty:@"container_pid" equalToInt64:self->super._persistentID];
  int v6 = +[ML3Entity queryWithLibrary:WeakRetained predicate:v5];

  v12[0] = @"item_pid";
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__ML3Container_trackPersistentIds__block_invoke;
  v10[3] = &unk_1E5FB5218;
  id v8 = v3;
  id v11 = v8;
  [v6 enumeratePersistentIDsAndProperties:v7 usingBlock:v10];

  return v8;
}

uint64_t __34__ML3Container_trackPersistentIds__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [*(id *)(a1 + 32) addObject:*a3];
}

- (BOOL)removeFirstTrack
{
  id v3 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  LOBYTE(self) = [(ML3Container *)self removeTracksAtIndexes:v3 notify:1];

  return (char)self;
}

- (BOOL)removeTracksAtIndexes:(id)a3 notify:(BOOL)a4
{
  id v7 = a3;
  if (![(ML3Container *)self _supportsOrderedTrackOperations])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"ML3Container.m" lineNumber:1843 description:@"removeTracksAtIndexes:notify: called on unsupported container"];
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  if ([v7 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __45__ML3Container_removeTracksAtIndexes_notify___block_invoke;
    v12[3] = &unk_1E5FB4BC8;
    id v14 = &v16;
    v12[4] = self;
    id v13 = v7;
    BOOL v15 = a4;
    [WeakRetained performDatabaseTransactionWithBlock:v12];
  }
  char v9 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v9;
}

uint64_t __45__ML3Container_removeTracksAtIndexes_notify___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _removeTracksAtIndexes:*(void *)(a1 + 40) notify:*(unsigned __int8 *)(a1 + 56) usingConnection:a2];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (BOOL)moveTrackFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  if (![(ML3Container *)self _supportsOrderedTrackOperations])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"ML3Container.m" lineNumber:1774 description:@"moveTrackFromIndex:toIndex: called on unsupported container"];
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  BOOL v8 = 1;
  char v16 = 1;
  if (a3 != a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __43__ML3Container_moveTrackFromIndex_toIndex___block_invoke;
    v12[3] = &unk_1E5FB4BA0;
    v12[4] = self;
    void v12[5] = &v13;
    v12[6] = a3;
    v12[7] = a4;
    [WeakRetained performDatabaseTransactionWithBlock:v12];

    BOOL v8 = *((unsigned char *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);
  return v8;
}

BOOL __43__ML3Container_moveTrackFromIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  unint64_t v5 = [*(id *)(a1 + 32) _maxPositionForTracksUsingConnection:v3];
  if (v5 == -1)
  {
    int v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      id v39 = v7;
      __int16 v40 = 2048;
      uint64_t v41 = [v7 persistentID];
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_ERROR, "No tracks in container %p (pid = %lld)", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  BOOL v8 = (void *)(a1 + 48);
  if (*(void *)(a1 + 48) > v5)
  {
    char v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = *(void **)(a1 + 48);
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = [v11 persistentID];
      *(_DWORD *)buf = 134218752;
      id v39 = v10;
      __int16 v40 = 2048;
      uint64_t v41 = v5;
      __int16 v42 = 2048;
      int v43 = v11;
      __int16 v44 = 2048;
      uint64_t v45 = v12;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "From index (%lu) out of bounds (%ld) of %p (pid = %lld)", buf, 0x2Au);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  uint64_t v13 = (void *)(a1 + 56);
  if (*(void *)(a1 + 56) > v5)
  {
    id v14 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void **)(a1 + 56);
      char v16 = *(void **)(a1 + 32);
      uint64_t v17 = [v16 persistentID];
      *(_DWORD *)buf = 134218752;
      id v39 = v15;
      __int16 v40 = 2048;
      uint64_t v41 = v5;
      __int16 v42 = 2048;
      int v43 = v16;
      __int16 v44 = 2048;
      uint64_t v45 = v17;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "To index (%lu) out of bounds (%ld) of %p (pid = %lld)", buf, 0x2Au);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v35 = v4;
    if (*v8 >= *v13)
    {
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      uint64_t v19 = [NSNumber numberWithUnsignedInteger:*v8 - 1];
      uint64_t v21 = (void *)(a1 + 56);
      uint64_t v13 = (void *)(a1 + 48);
      id v20 = &unk_1F0911020;
    }
    else
    {
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:*v8 + 1];
      uint64_t v19 = [NSNumber numberWithUnsignedInteger:*v13];
      id v20 = &unk_1F0911050;
      uint64_t v21 = (void *)(a1 + 48);
    }
    uint64_t v23 = [NSNumber numberWithUnsignedInteger:*v21];
    uint64_t v24 = [NSNumber numberWithUnsignedInteger:*v13];
    uint64_t v25 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    v37[0] = v25;
    uint64_t v26 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    v37[1] = v26;
    v37[2] = v18;
    uint64_t v27 = (void *)v18;
    id v34 = (void *)v19;
    void v37[3] = v19;
    v37[4] = v20;
    char v28 = (void *)v23;
    v37[5] = v35;
    v37[6] = v23;
    v37[7] = v24;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:8];
    id v36 = 0;
    char v30 = [v3 executeUpdate:@"UPDATE container_item SET position = (CASE WHEN position = ? THEN ? ELSE CASE WHEN position BETWEEN ? AND ? THEN position + ? END END) WHERE container_pid = ? AND position BETWEEN ? AND ?" withParameters:v29 error:&v36];
    id v31 = v36;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v30;

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _reloadContainedMediaTypes:0 removedMediaTypes:0 addedMediaTypes:0 notify:1 incrementEntityRevision:1 usingConnection:v3];
    }
    else
    {
      uint64_t v32 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v39 = v31;
        _os_log_impl(&dword_1B022D000, v32, OS_LOG_TYPE_ERROR, "Failed to update positions in container_item with error: %{public}@", buf, 0xCu);
      }
    }
    unint64_t v4 = v35;

    BOOL v22 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)appendTracksWithPersistentIDs:(id)a3 andEntryProperties:(id)a4 withAttributionIdentifier:(id)a5 notify:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([v11 count])
  {
    if (![(ML3Container *)self _supportsOrderedTrackOperations])
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"ML3Container.m" lineNumber:1705 description:@"appendTracksWithPersistentIDs:notify: called on unsupported container"];
    }
    uint64_t v27 = 0;
    char v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    id v14 = [(ML3Entity *)self valueForProperty:@"keep_local"];
    int v15 = [v14 integerValue];

    id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __98__ML3Container_appendTracksWithPersistentIDs_andEntryProperties_withAttributionIdentifier_notify___block_invoke;
    v20[3] = &unk_1E5FB4B78;
    v20[4] = self;
    id v21 = v13;
    id v22 = v11;
    id v23 = v12;
    uint64_t v24 = &v27;
    int v25 = v15;
    BOOL v26 = a6;
    [WeakRetained performDatabaseTransactionWithBlock:v20];

    BOOL v17 = *((unsigned char *)v28 + 24) != 0;
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

BOOL __98__ML3Container_appendTracksWithPersistentIDs_andEntryProperties_withAttributionIdentifier_notify___block_invoke(uint64_t a1, void *a2)
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v57 = [*(id *)(a1 + 32) _maxPositionForTracksUsingConnection:v3];
  v59 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  int v58 = [[ML3PersistentIDGenerator alloc] initWithDatabaseConnection:v3 tableName:@"container_item"];
  v53 = [[ML3PersistentIDGenerator alloc] initWithDatabaseConnection:v3 tableName:@"container_item_person"];
  if (!*(void *)(a1 + 40))
  {
LABEL_6:
    uint64_t v62 = 0;
    goto LABEL_7;
  }
  v81[0] = *(void *)(a1 + 40);
  unint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
  unint64_t v5 = [v3 executeQuery:@"SELECT person_pid FROM person WHERE cloud_id = ?" withParameters:v4];
  uint64_t v6 = [v5 int64ValueForFirstRowAndColumn];

  uint64_t v62 = v6;
  if (!v6)
  {
    id v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(void *)id v76 = v8;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "No person entry for cloud ID '%{public}@' - skipping attribution", buf, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v55 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
  id v10 = 0;
  if (!v55) {
    goto LABEL_39;
  }
  uint64_t v54 = *(void *)v70;
  *(void *)&long long v9 = 138543618;
  long long v51 = v9;
  uint64_t v61 = v3;
  uint64_t v56 = a1;
  uint64_t v11 = a1;
  while (2)
  {
    uint64_t v12 = 0;
    id v13 = v10;
    do
    {
      if (*(void *)v70 != v54) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v69 + 1) + 8 * v12);
      int v15 = objc_msgSend(*(id *)(v11 + 56), "objectForKeyedSubscript:", v14, v51);
      uint64_t v16 = [v15 objectForKeyedSubscript:@"uuid"];
      BOOL v17 = (void *)v16;
      if (v16) {
        uint64_t v18 = (__CFString *)v16;
      }
      else {
        uint64_t v18 = &stru_1F08D4D70;
      }
      uint64_t v19 = v18;

      v64 = v15;
      uint64_t v20 = [v15 objectForKeyedSubscript:@"position_uuid"];
      id v21 = (void *)v20;
      if (v20) {
        id v22 = (__CFString *)v20;
      }
      else {
        id v22 = &stru_1F08D4D70;
      }
      id v23 = v22;

      uint64_t v24 = [(ML3PersistentIDGenerator *)v58 nextPersistentID];
      int v25 = [NSNumber numberWithLongLong:v24];
      v79[0] = v25;
      v79[1] = v59;
      long long v60 = v14;
      v79[2] = v14;
      BOOL v26 = [NSNumber numberWithInteger:v57 + v12 + 1];
      v79[3] = v26;
      v79[4] = v19;
      uint64_t v63 = v19;
      v79[5] = v23;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:6];
      id v68 = v13;
      id v3 = v61;
      char v28 = [v61 executeUpdate:@"INSERT INTO container_item (container_item_pid, container_pid, item_pid, position, uuid, position_uuid) VALUES (?, ?, ?, ?, ?, ?)", v27, &v68 withParameters error];
      id v65 = v68;

      a1 = v11;
      *(unsigned char *)(*(void *)(*(void *)(v11 + 64) + 8) + 24) = v28;

      if (!*(unsigned char *)(*(void *)(*(void *)(v11 + 64) + 8) + 24))
      {
        id v39 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          goto LABEL_37;
        }
        *(_DWORD *)buf = 138543362;
        id v10 = v65;
        *(void *)id v76 = v65;
        _os_log_impl(&dword_1B022D000, v39, OS_LOG_TYPE_ERROR, "Failed to insert container_item with error: %{public}@", buf, 0xCu);
LABEL_38:

        goto LABEL_39;
      }
      if (v62)
      {
        uint64_t v29 = [(ML3PersistentIDGenerator *)v53 nextPersistentID];
        char v30 = [NSNumber numberWithLongLong:v29];
        v78[0] = v30;
        id v31 = [NSNumber numberWithLongLong:v24];
        v78[1] = v31;
        uint64_t v32 = [NSNumber numberWithLongLong:v62];
        v78[2] = v32;
        id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:3];
        id v67 = 0;
        char v34 = [v61 executeUpdate:@"INSERT INTO container_item_person (container_item_person_pid, container_item_pid, person_pid) VALUES (?, ?, ?)", v33, &v67 withParameters error];
        id v35 = v67;
        *(unsigned char *)(*(void *)(*(void *)(v11 + 64) + 8) + 24) = v34;

        if ((v34 & 1) == 0)
        {
          id v36 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v51;
            *(void *)id v76 = v60;
            *(_WORD *)&v76[8] = 2114;
            *(void *)&v76[10] = v35;
            _os_log_impl(&dword_1B022D000, v36, OS_LOG_TYPE_ERROR, "Failed to add container_item_person for track %{public}@. err = %{public}@", buf, 0x16u);
          }
        }
        id v3 = v61;
      }
      id v10 = v65;
      if ((*(_DWORD *)(v11 + 72) - 1) <= 1)
      {
        v77[0] = v60;
        v77[1] = &unk_1F0911020;
        uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
        id v66 = 0;
        char v38 = objc_msgSend(v3, "executeUpdate:withParameters:error:", @"UPDATE item set keep_local=0 WHERE (item_pid=? AND keep_local<?);",
                v37,
                &v66);
        id v39 = v66;
        *(unsigned char *)(*(void *)(*(void *)(v11 + 64) + 8) + 24) = v38;

        if (*(unsigned char *)(*(void *)(*(void *)(v11 + 64) + 8) + 24))
        {

          goto LABEL_28;
        }
        __int16 v40 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          int v41 = *(_DWORD *)(v11 + 72);
          uint64_t v42 = [v60 longLongValue];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)id v76 = v41;
          *(_WORD *)&v76[4] = 2048;
          *(void *)&v76[6] = v42;
          *(_WORD *)&v76[14] = 2114;
          *(void *)&v76[16] = v39;
          _os_log_impl(&dword_1B022D000, v40, OS_LOG_TYPE_ERROR, "Could not set keep_local to %d for track %lld - error: %{public}@", buf, 0x1Cu);
        }

LABEL_37:
        id v10 = v65;
        goto LABEL_38;
      }
LABEL_28:

      ++v12;
      id v13 = v65;
    }
    while (v55 != v12);
    v57 += v12;
    a1 = v56;
    uint64_t v55 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (v55) {
      continue;
    }
    break;
  }
LABEL_39:

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    int v43 = *(void **)(a1 + 32);
    __int16 v44 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v45 = objc_msgSend(v44, "numberWithDouble:");
    v74 = v45;
    uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
    v73 = @"date_modified";
    uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
    [v43 setValues:v46 forProperties:v47 usingConnection:v3];

    v48 = +[ML3Container _mediaTypesForTracksWithPersistentIDs:*(void *)(a1 + 48) usingConnection:v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingConnection:", objc_msgSend(v48, "count") == 0, 0, v48, *(unsigned __int8 *)(a1 + 76), 1, v3);

    BOOL v49 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0;
  }
  else
  {
    BOOL v49 = 0;
  }

  return v49;
}

- (BOOL)appendTracksWithPersistentIDs:(id)a3 notify:(BOOL)a4
{
  return [(ML3Container *)self appendTracksWithPersistentIDs:a3 andEntryProperties:MEMORY[0x1E4F1CC08] withAttributionIdentifier:0 notify:a4];
}

- (BOOL)setTracksWithPersistentIDs:(id)a3 andEntryProperties:(id)a4 withAttributionIdentifier:(id)a5 notify:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (![(ML3Container *)self _supportsOrderedTrackOperations])
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"ML3Container.m" lineNumber:1686 description:@"setTracksWithPersistentIDs:notify: called on unsupported container"];
  }
  uint64_t v27 = 0;
  char v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__ML3Container_setTracksWithPersistentIDs_andEntryProperties_withAttributionIdentifier_notify___block_invoke;
  v21[3] = &unk_1E5FB4B50;
  int v25 = &v27;
  v21[4] = self;
  id v15 = v11;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  id v17 = v13;
  id v24 = v17;
  BOOL v26 = a6;
  [WeakRetained performDatabaseTransactionWithBlock:v21];

  char v18 = *((unsigned char *)v28 + 24);
  _Block_object_dispose(&v27, 8);

  return v18;
}

uint64_t __95__ML3Container_setTracksWithPersistentIDs_andEntryProperties_withAttributionIdentifier_notify___block_invoke(uint64_t a1, uint64_t a2)
{
  BYTE1(v4) = 1;
  LOBYTE(v4) = *(unsigned char *)(a1 + 72);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setItemPersistentIDs:andEntryProperties:withAttributionIdentifier:reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingConnection:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), 1, 0, 0, v4, a2);
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

- (BOOL)setTracksWithPersistentIDs:(id)a3 notify:(BOOL)a4
{
  return [(ML3Container *)self setTracksWithPersistentIDs:a3 andEntryProperties:MEMORY[0x1E4F1CC08] withAttributionIdentifier:0 notify:a4];
}

- (BOOL)removeAllTracks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __31__ML3Container_removeAllTracks__block_invoke;
  v5[3] = &unk_1E5FB4F10;
  v5[4] = self;
  v5[5] = &v6;
  [WeakRetained performDatabaseTransactionWithBlock:v5];

  LOBYTE(WeakRetained) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)WeakRetained;
}

uint64_t __31__ML3Container_removeAllTracks__block_invoke(uint64_t a1, uint64_t a2)
{
  LOWORD(v4) = 257;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setItemPersistentIDs:andEntryProperties:withAttributionIdentifier:reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingConnection:", 0, MEMORY[0x1E4F1CC08], 0, 1, 0, 0, v4, a2);
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (NSArray)displayOrderingTerms
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(ML3Entity *)self valueForProperty:@"is_reversed"];
  uint64_t v4 = [v3 BOOLValue];

  unint64_t v5 = [(ML3Entity *)self valueForProperty:@"play_order"];
  uint64_t v6 = [v5 intValue];

  id v7 = +[ML3Track orderingTermsForITTGTrackOrder:v6 descending:v4];
  if ([v7 count])
  {
    id v8 = v7;
  }
  else
  {
    char v9 = [(ML3Container *)self limitOrderingTerms];
    if ([v9 count])
    {
      id v8 = v9;
    }
    else
    {
      id v10 = [(ML3Container *)self evaluationOrderingTerms];
      if ([v10 count])
      {
        id v11 = v10;
      }
      else
      {
        if ([(ML3Container *)self importedCriteriaList])
        {
          LockSearchCriteriaList();
          uint64_t v12 = CountSearchCriteria();
          if (v12)
          {
            int v14 = 0;
            *(void *)&long long v13 = 67109120;
            long long v19 = v13;
            do
            {
              int SearchCriterionInfo = GetSearchCriterionInfo();
              if (SearchCriterionInfo)
              {
                int v16 = SearchCriterionInfo;
                id v17 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  uint64_t v21 = v16;
                  _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_ERROR, "Got an error getting search criterion info: %ld", buf, 0xCu);
                }
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = 0;
          }
          UnlockSearchCriteriaList();
          DisposeSearchCriteriaList();
        }
        else
        {
          uint64_t v12 = 0;
        }
        +[ML3Track orderingTermsForITTGTrackOrder:descending:](ML3Track, "orderingTermsForITTGTrackOrder:descending:", v12, 0, v19);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v8 = v11;
    }
  }

  return (NSArray *)v8;
}

- (NSArray)cloudDisplayOrderingTerms
{
  id v3 = [(ML3Entity *)self valueForProperty:@"is_reversed"];
  uint64_t v4 = [v3 BOOLValue];

  unint64_t v5 = [(ML3Entity *)self valueForProperty:@"play_order"];
  uint64_t v6 = [v5 intValue];

  return (NSArray *)+[ML3Track orderingTermsForITTGTrackOrder:v6 descending:v4];
}

- (int64_t)limitValue
{
  id v3 = [(ML3Entity *)self valueForProperty:@"smart_limit_kind"];
  int v4 = [v3 intValue];

  unint64_t v5 = [(ML3Entity *)self valueForProperty:@"smart_limit_value"];
  int64_t v6 = [v5 longLongValue];

  switch(v4)
  {
    case 0:
      goto LABEL_3;
    case 1:
      goto LABEL_5;
    case 3:
      v6 *= 60;
LABEL_3:
      v6 *= 60000;
      return v6;
    case 4:
      v6 <<= 10;
LABEL_5:
      v6 <<= 20;
      break;
    default:
      return v6;
  }
  return v6;
}

- (NSArray)limitOrderingTerms
{
  id v3 = [(ML3Entity *)self valueForProperty:@"smart_limit_order"];
  uint64_t v4 = [v3 intValue];

  BOOL v5 = [(ML3Container *)self isLimitOrderingDescending];

  return (NSArray *)+[ML3Track orderingTermsForITTGTrackOrder:v4 descending:v5];
}

- (id)evaluationOrderingTerms
{
  id v3 = [(ML3Entity *)self valueForProperty:@"smart_evaluation_order"];
  uint64_t v4 = [v3 intValue];

  BOOL v5 = [(ML3Container *)self isEvaluationOrderingDescending];

  return +[ML3Track orderingTermsForITTGTrackOrder:v4 descending:v5];
}

- (NSString)limitingProperty
{
  BOOL v2 = [(ML3Entity *)self valueForProperty:@"smart_limit_kind"];
  int v3 = [v2 intValue];

  switch(v3)
  {
    case 0:
    case 3:
      uint64_t v4 = @"item_extra.total_time_ms";
      goto LABEL_4;
    case 1:
    case 4:
      uint64_t v4 = @"item_extra.file_size";
LABEL_4:
      BOOL v5 = v4;
      break;
    case 2:
      uint64_t v4 = @"1";
      break;
    default:
      uint64_t v4 = 0;
      break;
  }

  return (NSString *)v4;
}

- (BOOL)isLimitOrderingDescending
{
  int v3 = [(ML3Entity *)self valueForProperty:@"smart_limit_order"];
  unsigned int v4 = [v3 intValue];

  BOOL v5 = [(ML3Entity *)self valueForProperty:@"smart_reverse_limit_order"];
  int v6 = [v5 intValue];
  BOOL v7 = v6 != 0;

  if (v4 <= 0x1D && ((1 << v4) & 0x2C400000) != 0 || v4 == 112) {
    return v6 == 0;
  }
  return v7;
}

- (BOOL)isLimitedByCount
{
  BOOL v2 = [(ML3Entity *)self valueForProperty:@"smart_limit_kind"];
  BOOL v3 = [v2 intValue] == 2;

  return v3;
}

- (BOOL)isEvaluationOrderingDescending
{
  BOOL v2 = [(ML3Entity *)self valueForProperty:@"smart_evaluation_order"];
  unsigned int v3 = [v2 intValue];

  return v3 <= 0x1D && ((1 << v3) & 0x2C400000) != 0 || v3 == 112;
}

- (ML3Predicate)smartCriteriaPredicate
{
  BOOL v2 = [(ML3Container *)self importedCriteriaList];
  if (v2)
  {
    unsigned int v3 = [(id)objc_opt_class() predicateForCriteriaList:v2 parentMatchedAny:0];
    DisposeSearchCriteriaList();
  }
  else
  {
    unsigned int v3 = 0;
  }

  return (ML3Predicate *)v3;
}

- (SearchCriteriaList)importedCriteriaList
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(ML3Entity *)self valueForProperty:@"smart_criteria"];
  unsigned int v4 = v3;
  uint64_t v12 = 0;
  if (v3)
  {
    id v5 = v3;
    int v6 = MEMORY[0x1B3E92EF0]([v5 bytes], objc_msgSend(v5, "length"), &v12);
    if (v6)
    {
      int v7 = v6;
      id v8 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int64_t v9 = [(ML3Entity *)self persistentID];
        *(_DWORD *)buf = 134218496;
        int v14 = self;
        __int16 v15 = 2048;
        int64_t v16 = v9;
        __int16 v17 = 2048;
        uint64_t v18 = v7;
        _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "Could not parse search criteria list for playlist %p (pid = %lld): %ld", buf, 0x20u);
      }
    }
  }
  id v10 = v12;

  return v10;
}

- (void)setValues:(id)a3 forProperties:(id)a4 async:(BOOL)a5 withCompletionBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, uint64_t, void))a6;
  long long v13 = [MEMORY[0x1E4F1CA60] dictionary];
  int v14 = [MEMORY[0x1E4F28E60] indexSet];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __66__ML3Container_setValues_forProperties_async_withCompletionBlock___block_invoke;
  v30[3] = &unk_1E5FB4938;
  id v16 = v10;
  id v31 = v16;
  id v17 = WeakRetained;
  id v32 = v17;
  id v33 = self;
  id v18 = v13;
  id v34 = v18;
  id v19 = v14;
  id v35 = v19;
  [v11 enumerateObjectsUsingBlock:v30];
  if ([v18 count] || objc_msgSend(v19, "count"))
  {
    uint64_t v20 = (void *)[v11 mutableCopy];
    uint64_t v21 = (void *)[v16 mutableCopy];
    [v20 removeObjectsAtIndexes:v19];
    [v21 removeObjectsAtIndexes:v19];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __66__ML3Container_setValues_forProperties_async_withCompletionBlock___block_invoke_2;
    v27[3] = &unk_1E5FB7A70;
    id v22 = v20;
    id v28 = v22;
    id v23 = v21;
    id v29 = v23;
    [v18 enumerateKeysAndObjectsUsingBlock:v27];
    id v24 = v22;

    id v25 = v23;
    id v11 = v24;
    id v16 = v25;
  }
  if ([v11 count])
  {
    v26.receiver = self;
    v26.super_class = (Class)ML3Container;
    [(ML3Entity *)&v26 setValues:v16 forProperties:v11 async:v7 withCompletionBlock:v12];
  }
  else if (v12)
  {
    v12[2](v12, 1, 0);
  }
}

void __66__ML3Container_setValues_forProperties_async_withCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  if ([v13 isEqual:@"name"])
  {
    id v5 = [*(id *)(a1 + 32) objectAtIndex:a3];
    uint64_t v6 = [*(id *)(a1 + 40) nameOrderForString:v5];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
      uint64_t v9 = [WeakRetained insertStringIntoSortMapNoTransaction:v5];
    }
    else
    {
      uint64_t v9 = v6;
    }
    id v11 = *(void **)(a1 + 56);
    uint64_t v12 = [NSNumber numberWithLongLong:v9];
    [v11 setObject:v12 forKey:@"name_order"];
  }
  else
  {
    if (![v13 isEqual:@"container_seed.item_pid"]) {
      goto LABEL_9;
    }
    [*(id *)(a1 + 64) addIndex:a3];
    id v10 = *(void **)(a1 + 48);
    id v5 = [*(id *)(a1 + 32) objectAtIndex:a3];
    [v10 _setContainerSeedItemPersistentIDValue:v5];
  }

LABEL_9:
}

void __66__ML3Container_setValues_forProperties_async_withCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(a1 + 40) addObject:v6];
}

- (ML3Container)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v49 = a6;
  id v13 = (void *)[a3 mutableCopy];
  int v14 = [v13 objectForKey:@"ROWID"];
  if (!v14)
  {
    int v14 = [NSNumber numberWithLongLong:ML3CreateIntegerUUID()];
    [v13 setObject:v14 forKey:@"ROWID"];
  }
  uint64_t v48 = [v14 unsignedLongLongValue];
  __int16 v15 = [v13 objectForKey:@"container_type"];
  uint64_t v16 = [v15 integerValue];
  v50 = v12;
  if (v16 != 3)
  {
    uint64_t v7 = [v13 objectForKey:@"smart_is_genius"];
    if (![v7 integerValue])
    {
      BOOL v17 = 0;
      goto LABEL_8;
    }
  }
  id v6 = [v13 objectForKey:@"is_container_type_active_target"];
  BOOL v17 = 1;
  if (![v6 integerValue])
  {
LABEL_8:
    BOOL v18 = v17;
    id v19 = [v13 objectForKey:@"(container.is_container_type_active_target AND container.smart_is_genius)"];
    BOOL v17 = [v19 integerValue] != 0;

    if (!v18) {
      goto LABEL_10;
    }
  }

LABEL_10:
  if (v16 != 3) {

  }
  uint64_t v20 = [v13 objectForKey:@"container_type"];
  uint64_t v21 = [v20 integerValue];
  if (v21 == 3
    && ([v13 objectForKey:@"is_container_type_active_target"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 integerValue]))
  {
    BOOL v22 = 1;
  }
  else
  {
    id v23 = [v13 objectForKey:@"(container.is_container_type_active_target AND (container.container_type = 2))"];
    BOOL v22 = [v23 integerValue] != 0;

    if (v21 != 3) {
      goto LABEL_17;
    }
  }

LABEL_17:
  [v13 removeObjectForKey:@"(container.is_container_type_active_target AND container.smart_is_genius)"];
  [v13 removeObjectForKey:@"(container.is_container_type_active_target AND (container.container_type = 2))"];
  if (v17)
  {
    id v24 = [NSNumber numberWithInt:1];
    [v13 setObject:v24 forKey:@"is_container_type_active_target"];

    id v25 = [NSNumber numberWithInt:3];
    [v13 setObject:v25 forKey:@"container_type"];

    objc_super v26 = [NSNumber numberWithInt:1];
    [v13 setObject:v26 forKey:@"smart_is_genius"];
  }
  if (v22)
  {
    uint64_t v27 = [NSNumber numberWithInt:1];
    [v13 setObject:v27 forKey:@"is_container_type_active_target"];

    id v28 = [NSNumber numberWithInt:2];
    [v13 setObject:v28 forKey:@"container_type"];
  }
  id v29 = [v13 objectForKey:@"filepath"];

  if (!v29)
  {
    char v30 = objc_opt_class();
    if (v17) {
      uint64_t v31 = 3;
    }
    else {
      uint64_t v31 = 2;
    }
    id v32 = [v30 nextFilepathForPlaylistType:v31 withPersistentID:v48 inLibrary:v11];
    [v13 setValue:v32 forKey:@"filepath"];
  }
  id v33 = [v13 objectForKey:@"date_created"];
  if (!v33)
  {
    id v34 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    id v33 = objc_msgSend(v34, "numberWithDouble:");
    [v13 setObject:v33 forKey:@"date_created"];
  }
  id v35 = [v13 objectForKey:@"date_modified"];
  if (!v35)
  {
    id v36 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    id v35 = objc_msgSend(v36, "numberWithDouble:");
    [v13 setObject:v35 forKey:@"date_modified"];
  }
  uint64_t v37 = [v13 objectForKey:@"distinguished_kind"];
  char v38 = v37;
  if (v37)
  {
    unsigned int v39 = [v37 integerValue];
    if (v39)
    {
      __int16 v40 = [v13 objectForKey:@"is_hidden"];
      int v41 = [v40 BOOLValue];

      if (v41)
      {
        if ((v39 > 0x20 || ((1 << v39) & 0x100180000) == 0) && v39 != 10000 && v39 != 10010)
        {
          uint64_t v42 = [NSNumber numberWithBool:1];
          [v13 setValue:v42 forKey:@"is_ignorable_itunes_playlist"];
        }
      }
    }
  }
  [(id)objc_opt_class() populateSortOrdersOfPropertyValues:v13 inLibrary:v11 cachedNameOrders:v50];
  int v43 = [v13 objectForKey:@"orig_date_modified"];

  if (!v43)
  {
    __int16 v44 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v45 = objc_msgSend(v44, "numberWithDouble:");
    [v13 setObject:v45 forKey:@"orig_date_modified"];
  }
  v52.receiver = self;
  v52.super_class = (Class)ML3Container;
  uint64_t v46 = [(ML3Entity *)&v52 initWithDictionary:v13 inLibrary:v11 cachedNameOrders:v50 usingConnection:v49];

  return v46;
}

+ (BOOL)_reloadContainedMediaTypes:(BOOL)a3 removedMediaTypes:(id)a4 addedMediaTypes:(id)a5 notify:(BOOL)a6 incrementEntityRevision:(BOOL)a7 usingLibrary:(id)a8 connection:(id)a9 forContainerPersistentID:(int64_t)a10
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  int v14 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  if ((v14 & 1) != 0 || [v18 count] || objc_msgSend(v17, "count"))
  {
    int v21 = [v18 count] || objc_msgSend(v17, "count") != 0;
    if (v21 == v14)
    {
      id v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, a1, @"ML3Container.m", 2075, @"Only one of reloadContainedMediaTypes, and removedMediaTypes/addedMediaTypes can be used" object file lineNumber description];
    }
  }
  if ([v17 count]) {
    +[ML3Container _removeMediaTypesFromContainerWithPersistentID:a10 mediaTypes:v17 connection:v20];
  }
  if ([v18 count]) {
    +[ML3Container _addMediaTypesToContainerWithPersistentID:a10 mediaTypes:v18 connection:v20];
  }
  if (v12)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __157__ML3Container__reloadContainedMediaTypes_removedMediaTypes_addedMediaTypes_notify_incrementEntityRevision_usingLibrary_connection_forContainerPersistentID___block_invoke;
    id v28 = &unk_1E5FB7668;
    int64_t v30 = a10;
    id v29 = v19;
    [v20 enqueueBlockForTransactionCommit:&v25];
  }
  if (v11)
  {
    char v22 = [(id)objc_opt_class() incrementRevisionWithLibrary:v19 persistentID:a10 deletionType:0 revisionType:0 usingConnection:v20];
    if (!v14) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  char v22 = 1;
  if (v14) {
LABEL_19:
  }
    +[ML3Container reloadContainedMediaTypesForContainerWithPersistID:usingConnection:](ML3Container, "reloadContainedMediaTypesForContainerWithPersistID:usingConnection:", a10, v20, v25, v26, v27, v28);
LABEL_20:

  return v22;
}

void __157__ML3Container__reloadContainedMediaTypes_removedMediaTypes_addedMediaTypes_notify_incrementEntityRevision_usingLibrary_connection_forContainerPersistentID___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v6 = [(ML3Entity *)[ML3Container alloc] initWithPersistentID:*(void *)(a1 + 40) inLibrary:*(void *)(a1 + 32)];
    unsigned int v3 = [(ML3Entity *)v6 valueForProperty:@"is_hidden"];
    int v4 = [v3 BOOLValue];

    id v5 = *(void **)(a1 + 32);
    if (v4)
    {
      [v5 notifyNonContentsPropertyDidChange];
    }
    else
    {
      [v5 notifyEntitiesAddedOrRemoved];
      [*(id *)(a1 + 32) notifyContentsDidChange];
    }
  }
}

+ (void)_insertNewSmartPlaylist:(id)a3 criteriaBlob:(id)a4 evaluationOrder:(unsigned int)a5 limited:(BOOL)a6 trackOrder:(unsigned int)a7 distinguishedKind:(int)a8 inLibrary:(id)a9 cachedNameOrders:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v11 = *(void *)&a7;
  BOOL v12 = a6;
  v30[17] = *MEMORY[0x1E4F143B8];
  v30[0] = a3;
  v29[0] = @"name";
  v29[1] = @"distinguished_kind";
  __int16 v15 = NSNumber;
  id v16 = a10;
  id v17 = a9;
  id v18 = a4;
  id v28 = a3;
  id v19 = [v15 numberWithUnsignedInt:v10];
  v30[1] = v19;
  v29[2] = @"date_created";
  id v20 = NSNumber;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  int v21 = objc_msgSend(v20, "numberWithDouble:");
  v30[2] = v21;
  v30[3] = &unk_1F0911080;
  v29[3] = @"parent_pid";
  v29[4] = @"is_hidden";
  void v30[4] = &unk_1F0911080;
  v30[5] = &unk_1F0911080;
  v29[5] = @"smart_is_folder";
  v29[6] = @"smart_criteria";
  v30[6] = v18;
  v30[7] = &unk_1F0911020;
  v29[7] = @"smart_is_dynamic";
  v29[8] = @"smart_is_filtered";
  v30[8] = &unk_1F0911020;
  v30[9] = &unk_1F0911080;
  v29[9] = @"smart_is_genius";
  v29[10] = @"smart_is_limited";
  char v22 = [NSNumber numberWithBool:v12];
  v30[10] = v22;
  v29[11] = @"smart_limit_order";
  id v23 = [NSNumber numberWithUnsignedInt:v11];
  v30[11] = v23;
  v29[12] = @"smart_evaluation_order";
  id v24 = [NSNumber numberWithUnsignedInt:a5];
  v30[12] = v24;
  v30[13] = &unk_1F0911098;
  v29[13] = @"smart_limit_value";
  v29[14] = @"smart_limit_kind";
  v30[14] = &unk_1F09110B0;
  v30[15] = &unk_1F0911020;
  v29[15] = @"is_ignored_syncing";
  v29[16] = @"contained_media_type";
  v30[16] = &unk_1F0911080;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:17];

  id v26 = +[ML3Entity newWithDictionary:v25 inLibrary:v17 cachedNameOrders:v16];
}

+ (id)_allStaticItemContainersInLibrary:(id)a3 usingConnection:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = [v6 array];
  uint64_t v9 = [v7 executeQuery:@"SELECT container.container_pid FROM container JOIN container_item ON (container.container_pid = container_item.container_pid AND position = 0) WHERE distinguished_kind = 0 AND smart_criteria IS NULL AND is_hidden = 0 AND cloud_is_subscribed = 0 AND cloud_is_curator_playlist = 0"];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__ML3Container__allStaticItemContainersInLibrary_usingConnection___block_invoke;
  v15[3] = &unk_1E5FB6278;
  id v16 = v5;
  id v10 = v8;
  id v17 = v10;
  id v11 = v5;
  [v9 enumerateRowsWithBlock:v15];
  BOOL v12 = v17;
  id v13 = v10;

  return v13;
}

void __66__ML3Container__allStaticItemContainersInLibrary_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", [a2 int64ForColumnIndex:0], *(void *)(a1 + 32));
  [*(id *)(a1 + 40) addObject:v3];
}

+ (id)currentDeviceFavoritesPlaylistInLibrary:(id)a3 usingConnection:(id)a4
{
  id v5 = a3;
  id v6 = [a4 executeQuery:@"SELECT container_pid FROM container WHERE distinguished_kind=?" withParameters:&unk_1F0910960];
  uint64_t v7 = [v6 int64ValueForFirstRowAndColumn];
  if (v7) {
    id v8 = +[ML3Entity newWithPersistentID:v7 inLibrary:v5];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

+ (void)reloadContainedMediaTypesForContainerWithPersistID:(int64_t)a3 usingConnection:(id)a4
{
  id v5 = a4;
  +[ML3Container _clearContainerMediaTypeInContainerWithPersistentID:a3 connection:v5];
  id v6 = +[ML3Container _mediaTypesForTracksInContainerWithPersistentID:a3 connection:v5];
  +[ML3Container _addMediaTypesToContainerWithPersistentID:a3 mediaTypes:v6 connection:v5];
}

+ (void)removeNonLibraryItemsFromContainer:(id)a3 usingConnection:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28E60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 indexSet];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
  v15[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v11 = [v6 executeQuery:@"SELECT position FROM container_item LEFT OUTER JOIN item USING (item_pid) WHERE NOT IFNULL(in_my_library, 0) AND container_pid = ?", v10 withParameters];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__ML3Container_removeNonLibraryItemsFromContainer_usingConnection___block_invoke;
  v13[3] = &unk_1E5FB83F8;
  id v14 = v8;
  id v12 = v8;
  [v11 enumerateRowsWithBlock:v13];
  [v7 _removeTracksAtIndexes:v12 notify:1 usingConnection:v6];
}

uint64_t __67__ML3Container_removeNonLibraryItemsFromContainer_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 int64ForColumnIndex:0];
  int v4 = *(void **)(a1 + 32);

  return [v4 addIndex:v3];
}

+ (void)removeNonLibraryItemsFromContainersInLibrary:(id)a3 usingConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 _allStaticItemContainersInLibrary:a3 usingConnection:v6];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [a1 removeNonLibraryItemsFromContainer:*(void *)(*((void *)&v12 + 1) + 8 * v11++) usingConnection:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

+ (void)removeAnyNonLibraryItemsInPersistentIDs:(id)a3 fromContainersInLibrary:(id)a4 usingConnection:(id)a5
{
  id v7 = a3;
  id v21 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = +[ML3DatabaseStatementRenderer defaultRenderer];
  uint64_t v11 = [v7 count];
  if (v11)
  {
    unint64_t v12 = v11;
    unint64_t v13 = 0;
    do
    {
      if (v12 - v13 >= 0x64) {
        uint64_t v14 = 100;
      }
      else {
        uint64_t v14 = v12 - v13;
      }
      long long v15 = objc_msgSend(v7, "subarrayWithRange:", v13, v14, v21);
      v13 += v14;
      id v16 = objc_msgSend(v10, "statementWithPrefix:inParameterCount:", @"SELECT IFNULL(in_my_library, 0), container_pid, position FROM container_item LEFT OUTER JOIN item USING (item_pid) JOIN container USING (container_pid) WHERE distinguished_kind IN (0, 19, 20) AND smart_criteria IS NULL AND is_hidden = 0 AND cloud_is_subscribed = 0 AND cloud_is_curator_playlist = 0 AND (item.item_pid IS NULL OR container_item.item_pid"), v14;
      uint64_t v17 = [v16 stringByAppendingString:@""]);

      id v18 = [v8 executeQuery:v17 withParameters:v15];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __96__ML3Container_removeAnyNonLibraryItemsInPersistentIDs_fromContainersInLibrary_usingConnection___block_invoke;
      v25[3] = &unk_1E5FB83F8;
      id v26 = v9;
      [v18 enumerateRowsWithBlock:v25];
    }
    while (v13 < v12);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__ML3Container_removeAnyNonLibraryItemsInPersistentIDs_fromContainersInLibrary_usingConnection___block_invoke_2;
  v22[3] = &unk_1E5FB4C18;
  id v23 = v21;
  id v24 = v8;
  id v19 = v8;
  id v20 = v21;
  [v9 enumerateKeysAndObjectsUsingBlock:v22];
}

uint64_t __96__ML3Container_removeAnyNonLibraryItemsInPersistentIDs_fromContainersInLibrary_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (![v8 intForColumnIndex:0])
  {
    uint64_t v3 = [v8 numberForColumnIndex:1];
    uint64_t v4 = [v8 int64ForColumnIndex:2];
    id v5 = [*(id *)(a1 + 32) objectForKey:v3];
    if (v5)
    {
      id v6 = v5;
      [v5 addIndex:v4];
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v4];
      [*(id *)(a1 + 32) setObject:v6 forKey:v3];
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __96__ML3Container_removeAnyNonLibraryItemsInPersistentIDs_fromContainersInLibrary_usingConnection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", [a2 longLongValue], *(void *)(a1 + 32));
  [v6 _removeTracksAtIndexes:v5 notify:1 usingConnection:*(void *)(a1 + 40)];
}

+ (void)populateMediaTypesOfStaticContainersInLibrary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke;
  v7[3] = &unk_1E5FB6A58;
  id v8 = v3;
  id v9 = v4;
  id v5 = v4;
  id v6 = v3;
  [v6 databaseConnectionAllowingWrites:0 withBlock:v7];
}

void __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 executeQuery:@"SELECT ROWID FROM container WHERE smart_is_dynamic = 0 AND is_hidden = 0"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke_2;
  v9[3] = &unk_1E5FB6278;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  [v4 enumerateRowsWithBlock:v9];
  id v5 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke_3;
  v7[3] = &unk_1E5FB4B28;
  id v8 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", [a2 int64ForColumnIndex:0], *(void *)(a1 + 32));
  [*(id *)(a1 + 40) addObject:v3];
}

uint64_t __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 persistentID];
  uint64_t v4 = *(void *)(a1 + 32);

  return +[ML3Container reloadContainedMediaTypesForContainerWithPersistID:v3 usingConnection:v4];
}

+ (void)_removeMediaTypesFromContainerWithPersistentID:(int64_t)a3 mediaTypes:(id)a4 connection:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __85__ML3Container__removeMediaTypesFromContainerWithPersistentID_mediaTypes_connection___block_invoke;
  v11[3] = &unk_1E5FB4B00;
  id v12 = v7;
  id v13 = v8;
  int64_t v14 = a3;
  id v9 = v8;
  id v10 = v7;
  +[ML3Container _updateContainedMediaTypeInContainerWithPersistentID:a3 connection:v9 itemUpdateBlock:v11];
}

uint64_t __85__ML3Container__removeMediaTypesFromContainerWithPersistentID_mediaTypes_connection___block_invoke(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__ML3Container__removeMediaTypesFromContainerWithPersistentID_mediaTypes_connection___block_invoke_2;
  v7[3] = &unk_1E5FB4AB0;
  id v9 = &v11;
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = v3;
  uint64_t v10 = v4;
  [v2 enumerateMediaTypesWithBlock:v7];
  uint64_t v5 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __85__ML3Container__removeMediaTypesFromContainerWithPersistentID_mediaTypes_connection___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)a1[4];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", a1[6], v8);
  v12[1] = v9;
  uint64_t v10 = [NSNumber numberWithUnsignedInt:a2];
  void v12[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v7 executeUpdate:@"UPDATE container_item_media_type SET count = count - ? WHERE container_pid = ? AND media_type = ?" withParameters:v11 error:0];

  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *a4 = 1;
  }
}

+ (void)_addMediaTypesToContainerWithPersistentID:(int64_t)a3 mediaTypes:(id)a4 connection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 count])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke;
    v10[3] = &unk_1E5FB4B00;
    id v11 = v9;
    id v12 = v8;
    int64_t v13 = a3;
    [a1 _updateContainedMediaTypeInContainerWithPersistentID:a3 connection:v11 itemUpdateBlock:v10];
  }
}

uint64_t __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  int64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke_2;
  v7[3] = &unk_1E5FB4AD8;
  BOOL v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v10 = &v12;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v9 = v3;
  uint64_t v11 = v4;
  [v2 performTransactionWithBlock:v7];
  uint64_t v5 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke_3;
  v7[3] = &unk_1E5FB4AB0;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v6;
  long long v8 = v6;
  uint64_t v9 = *(void *)(a1 + 56);
  [v2 enumerateMediaTypesWithBlock:v7];
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  return v4;
}

void __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  long long v8 = (void *)a1[4];
  uint64_t v9 = [NSNumber numberWithLongLong:a1[6]];
  v18[0] = v9;
  uint64_t v10 = [NSNumber numberWithUnsignedInt:a2];
  v18[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v8 executeUpdate:@"INSERT OR IGNORE INTO container_item_media_type (container_pid, media_type) VALUES(?, ?)", v11, 0 withParameters error];

  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    goto LABEL_3;
  }
  uint64_t v12 = (void *)a1[4];
  int64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithLongLong:", a1[6], v13);
  v17[1] = v14;
  char v15 = [NSNumber numberWithUnsignedInt:a2];
  v17[2] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v12 executeUpdate:@"UPDATE container_item_media_type SET count = count + ? WHERE container_pid = ? AND media_type = ?" withParameters:v16 error:0];

  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
LABEL_3:
  }
    *a4 = 1;
}

+ (void)_clearContainerMediaTypeInContainerWithPersistentID:(int64_t)a3 connection:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__ML3Container__clearContainerMediaTypeInContainerWithPersistentID_connection___block_invoke;
  v8[3] = &unk_1E5FB4A88;
  id v9 = v6;
  int64_t v10 = a3;
  id v7 = v6;
  [a1 _updateContainedMediaTypeInContainerWithPersistentID:a3 connection:v7 itemUpdateBlock:v8];
}

uint64_t __79__ML3Container__clearContainerMediaTypeInContainerWithPersistentID_connection___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  BOOL v2 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v4 = [v1 executeUpdate:@"DELETE FROM container_item_media_type WHERE container_pid = ?" withParameters:v3 error:0];

  return v4;
}

+ (id)_mediaTypesForTracksInContainerWithPersistentID:(int64_t)a3 connection:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MLMediaTypeCountedSet);
  id v7 = [NSNumber numberWithLongLong:a3];
  v14[0] = v7;
  long long v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v9 = [v5 executeQuery:@"SELECT media_type, COUNT(media_type) FROM item JOIN container_item USING (item_pid) WHERE container_pid = ? GROUP BY media_type", v8 withParameters];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __75__ML3Container__mediaTypesForTracksInContainerWithPersistentID_connection___block_invoke;
  v12[3] = &unk_1E5FB83F8;
  int64_t v10 = v6;
  int64_t v13 = v10;
  [v9 enumerateRowsWithBlock:v12];

  return v10;
}

uint64_t __75__ML3Container__mediaTypesForTracksInContainerWithPersistentID_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 numberForColumnIndex:0];
  uint64_t v5 = [v4 integerValue];

  id v6 = [v3 numberForColumnIndex:1];

  uint64_t v7 = [v6 integerValue];
  long long v8 = *(void **)(a1 + 32);

  return [v8 addMediaType:v5 count:v7];
}

+ (id)_mediaTypesForTracksWithPersistentIDs:(id)a3 usingConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(MLMediaTypeCountedSet);
  long long v8 = +[ML3DatabaseStatementRenderer defaultRenderer];
  uint64_t v9 = [v5 count];
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      if (v10 - v12 >= 0x64) {
        uint64_t v13 = 100;
      }
      else {
        uint64_t v13 = v10 - v12;
      }
      uint64_t v14 = objc_msgSend(v5, "subarrayWithRange:", v12, v13);
      v12 += v13;
      char v15 = [v8 statementWithPrefix:@"SELECT media_type, COUNT(media_type) FROM item WHERE item_pid", v13 inParameterCount];

      uint64_t v11 = [v15 stringByAppendingString:@" GROUP BY media_type"];

      id v16 = [v6 executeQuery:v11 withParameters:v14];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __70__ML3Container__mediaTypesForTracksWithPersistentIDs_usingConnection___block_invoke;
      void v18[3] = &unk_1E5FB83F8;
      id v19 = v7;
      [v16 enumerateRowsWithBlock:v18];
    }
    while (v12 < v10);
  }

  return v7;
}

void __70__ML3Container__mediaTypesForTracksWithPersistentIDs_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v3 numberForColumnIndex:0];
  uint64_t v4 = [v6 integerValue];
  id v5 = [v3 numberForColumnIndex:1];

  objc_msgSend(v2, "addMediaType:count:", v4, objc_msgSend(v5, "integerValue"));
}

+ (void)_updateContainedMediaTypeInContainerWithPersistentID:(int64_t)a3 connection:(id)a4 itemUpdateBlock:(id)a5
{
  id v7 = a4;
  if ((*((unsigned int (**)(id))a5 + 2))(a5))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __96__ML3Container__updateContainedMediaTypeInContainerWithPersistentID_connection_itemUpdateBlock___block_invoke;
    v8[3] = &unk_1E5FB4A88;
    id v9 = v7;
    int64_t v10 = a3;
    [v9 performTransactionWithBlock:v8];
  }
}

uint64_t __96__ML3Container__updateContainedMediaTypeInContainerWithPersistentID_connection_itemUpdateBlock___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  v18[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v5 = [v2 executeQuery:@"SELECT media_type FROM container_item_media_type WHERE container_pid = ? AND count > 0" withParameters:v4];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __96__ML3Container__updateContainedMediaTypeInContainerWithPersistentID_connection_itemUpdateBlock___block_invoke_2;
  v12[3] = &unk_1E5FB77B8;
  void v12[4] = &v13;
  [v5 enumerateRowsWithBlock:v12];
  id v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v14 + 6)];
  v17[0] = v7;
  long long v8 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  v17[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v10 = [v6 executeUpdate:@"UPDATE container SET contained_media_type = ? WHERE container_pid = ?" withParameters:v9 error:0];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __96__ML3Container__updateContainedMediaTypeInContainerWithPersistentID_connection_itemUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 numberForColumnIndex:0];
  int v4 = [v3 integerValue];

  if (v4 != 0xFFFFFF) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v4;
  }
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v11 = v10;
  BOOL v12 = 1;
  if (a6)
  {
    uint64_t v21 = 0;
    char v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __67__ML3Container_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke;
    v14[3] = &unk_1E5FB4A60;
    unint64_t v17 = a6;
    id v18 = a5;
    id v19 = a1;
    int v20 = a4;
    id v15 = v10;
    int v16 = &v21;
    [v15 performDatabaseTransactionWithBlock:v14];
    BOOL v12 = *((unsigned char *)v22 + 24) != 0;

    _Block_object_dispose(&v21, 8);
  }

  return v12;
}

BOOL __67__ML3Container_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v41 = [MEMORY[0x1E4F1CA80] setWithCapacity:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 48))
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1 + 56) + 8 * v4)];
      [v41 addObject:v5];

      ++v4;
    }
    while (v4 < *(void *)(a1 + 48));
  }
  unsigned int v39 = +[ML3ContainmentPredicate predicateWithProperty:@"parent_pid" values:v41];
  __int16 v40 = +[ML3Entity queryWithLibrary:*(void *)(a1 + 32) predicate:v39 orderingTerms:MEMORY[0x1E4F1CBF0]];
  uint64_t v6 = [v40 countOfEntities];
  if (v6)
  {
    uint64_t v7 = v6;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    uint64_t v57 = 0;
    int v58 = &v57;
    uint64_t v59 = 0x2020000000;
    long long v60 = 0;
    long long v60 = malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __67__ML3Container_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke_2;
    v56[3] = &unk_1E5FB4A38;
    v56[4] = &v57;
    v56[5] = &buf;
    [v40 enumeratePersistentIDsUsingBlock:v56];
    [*(id *)(a1 + 64) deleteFromLibrary:*(void *)(a1 + 32) deletionType:*(unsigned int *)(a1 + 72) persistentIDs:v58[3] count:v7];
    free((void *)v58[3]);
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&buf, 8);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(unsigned int *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 48);
  v55.receiver = *(id *)(a1 + 64);
  v55.super_class = (Class)&OBJC_METACLASS___ML3Container;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSendSuper2(&v55, sel_deleteFromLibrary_deletionType_persistentIDs_count_, v9, v10, v8, v11);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v41;
    uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v66 count:16];
    if (v44)
    {
      uint64_t v43 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v52 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v65 = v13;
          uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
          id v50 = 0;
          char v15 = [v3 executeUpdate:@"DELETE FROM container_item_person WHERE container_item_pid in (SELECT container_item_pid from container_item where container_pid = ?)" withParameters:v14 error:&v50];
          id v16 = v50;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15;

          if ((v15 & 1) == 0)
          {
            unint64_t v17 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v16;
              _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_ERROR, "Failed to delete from container_item_persons with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }
          }
          uint64_t v64 = v13;
          id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
          id v49 = v16;
          char v19 = [v3 executeUpdate:@"DELETE FROM container_item_reaction WHERE container_item_pid IN (SELECT container_item_pid FROM container_item WHERE container_pid = ?)" withParameters:v18 error:&v49];
          id v20 = v49;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v19;
          if ((v19 & 1) == 0)
          {
            uint64_t v21 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v20;
              _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_ERROR, "Failed to delete from container_item with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }
          }
          uint64_t v63 = v13;
          char v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
          id v48 = v20;
          char v23 = [v3 executeUpdate:@"DELETE FROM container_item WHERE container_pid = ?" withParameters:v22 error:&v48];
          id v24 = v48;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v23;
          if ((v23 & 1) == 0)
          {
            uint64_t v25 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v24;
              _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_ERROR, "Failed to delete from container_item with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }
          }
          uint64_t v62 = v13;
          id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
          id v47 = v24;
          char v27 = [v3 executeUpdate:@"DELETE FROM container_author WHERE container_pid = ?" withParameters:v26 error:&v47];
          id v28 = v47;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v27;
          if ((v27 & 1) == 0)
          {
            id v29 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v28;
              _os_log_impl(&dword_1B022D000, v29, OS_LOG_TYPE_ERROR, "Failed to delete from container_author with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }
          }
          v61[0] = v13;
          v61[1] = &unk_1F0911038;
          int64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
          id v46 = v28;
          char v31 = [v3 executeUpdate:@"DELETE FROM artwork_token WHERE entity_pid = ? AND entity_type = ?" withParameters:v30 error:&v46];
          id v32 = v46;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v31;
          if ((v31 & 1) == 0)
          {
            id v33 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v32;
              _os_log_impl(&dword_1B022D000, v33, OS_LOG_TYPE_ERROR, "Failed to delete from artwork_token with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }
          }
          id v45 = v32;
          char v34 = [v3 executeUpdate:@"DELETE FROM best_artwork_token WHERE entity_pid = ? AND entity_type = ?" withParameters:v30 error:&v45];
          id v35 = v45;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v34;
          if ((v34 & 1) == 0)
          {
            id v36 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v35;
              _os_log_impl(&dword_1B022D000, v36, OS_LOG_TYPE_ERROR, "Failed to delete from best_artwork_token with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v66 count:16];
      }
      while (v44);
    }

    BOOL v37 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  }
  else
  {
    BOOL v37 = 0;
  }

  return v37;
}

uint64_t __67__ML3Container_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  uint64_t v3 = *(void *)(*(void *)(result + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *(void *)(v2 + 8 * v4) = a2;
  return result;
}

+ (void)deleteAutoCreatedBuiltInSmartPlaylistsPIDs:(id)a3 inLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke;
    v7[3] = &unk_1E5FB6A58;
    id v8 = v5;
    id v9 = v6;
    [v9 databaseConnectionAllowingWrites:1 withBlock:v7];
  }
}

void __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke_2;
  v4[3] = &unk_1E5FB4A10;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 performTransactionWithBlock:v4];
}

uint64_t __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke_2(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke_3;
  v6[3] = &unk_1E5FB49E8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v6];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = [NSNumber numberWithBool:1];
  [v3 setValue:v4 forDatabaseProperty:@"autoCreatedSmartPlaylistsDeleted"];

  return 1;
}

void __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [ML3Container alloc];
  uint64_t v5 = [v3 longLongValue];

  id v6 = [(ML3Entity *)v4 initWithPersistentID:v5 inLibrary:*(void *)(a1 + 32)];
  [(ML3Entity *)v6 deleteFromLibrary];
}

+ (id)autoCreatedBuiltInSmartPlaylistsPIDs:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 valueForDatabaseProperty:@"createdBuiltInSmartPlaylists"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
    for (uint64_t i = 0; i != 120; i += 24)
    {
      id v9 = +[ML3ComparisonPredicate predicateWithProperty:@"distinguished_kind" equalToInteger:*(unsigned int *)((char *)&builtInCriteriaInfo + i + 20)];
      [v7 addObject:v9];
    }
    uint64_t v10 = +[ML3CompoundPredicate predicateMatchingPredicates:v7];
    uint64_t v11 = +[ML3Entity queryWithLibrary:v3 predicate:v10];
    BOOL v12 = [v3 valueForDatabaseProperty:@"autoCreatedSmartPlaylistsDeleted"];
    char v13 = [v12 BOOLValue];

    if ((v13 & 1) == 0)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __53__ML3Container_autoCreatedBuiltInSmartPlaylistsPIDs___block_invoke;
      v15[3] = &unk_1E5FB7EE0;
      id v16 = v6;
      [v11 enumeratePersistentIDsUsingBlock:v15];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __53__ML3Container_autoCreatedBuiltInSmartPlaylistsPIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

+ (BOOL)updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary:(id)a3
{
  id v11 = a3;
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  for (uint64_t i = 0; i != 120; i += 24)
  {
    int v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:*(void *)((char *)&builtInCriteriaInfo + i) value:&stru_1F08D4D70 table:@"MLLocalizable"];

    id v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&builtInCriteriaInfo + i + 20)];
    [v3 setObject:v6 forKey:v7];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke;
  v12[3] = &unk_1E5FB58B8;
  id v13 = v3;
  id v14 = v11;
  id v8 = v11;
  id v9 = v3;
  [v8 performDatabaseTransactionWithBlock:v12];

  return 1;
}

uint64_t __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke(uint64_t a1, void *a2)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) allKeys];
  char v15 = +[ML3ContainsPredicate predicateWithProperty:@"distinguished_kind" values:v4];

  int v5 = +[ML3ComparisonPredicate predicateWithProperty:@"is_src_remote" value:&unk_1F0911020 comparison:2];
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = *(void *)(a1 + 40);
  v22[0] = v15;
  v22[1] = v5;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v9 = +[ML3CompoundPredicate predicateMatchingPredicates:v8];
  uint64_t v10 = +[ML3Entity queryWithLibrary:v7 predicate:v9];

  uint64_t v21 = @"distinguished_kind";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke_492;
  void v18[3] = &unk_1E5FB4998;
  id v19 = *(id *)(a1 + 32);
  id v20 = v6;
  id v12 = v6;
  [v10 enumeratePersistentIDsAndProperties:v11 ordered:0 usingBlock:v18];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke_2;
  v16[3] = &unk_1E5FB49C0;
  id v17 = v3;
  id v13 = v3;
  [v12 enumerateKeysAndObjectsUsingBlock:v16];

  return 1;
}

void __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke_492(uint64_t a1, uint64_t a2, id *a3)
{
  id v8 = *a3;
  int v5 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v5)
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = [NSNumber numberWithLongLong:a2];
    [v6 setObject:v5 forKey:v7];
  }
}

void __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  v17[0] = v6;
  v17[1] = v5;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v12 = 0;
  char v9 = [v7 executeUpdate:@"UPDATE container SET name = ? WHERE container_pid = ?" withParameters:v8 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0)
  {
    id v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "Failed to update name of built-in smart playlist %{public}@ (%{public}@)", buf, 0x16u);
    }
  }
}

+ (id)predicateForCriteriaList:(SearchCriteriaList *)a3 parentMatchedAny:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  LockSearchCriteriaList();
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v26 = 0;
  GetSearchCriteriaListOptions();
  int v6 = CountSearchCriteria();
  if (v6)
  {
    int v7 = v6;
    int v8 = 0;
    BOOL v9 = a4;
    while (1)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      int SearchCriterionInfo = GetSearchCriterionInfo();
      if (SearchCriterionInfo) {
        break;
      }
      if (BYTE9(v24))
      {
        if (BYTE8(v24))
        {
          uint64_t v16 = [a1 predicateForCriteriaList:(void)v25 parentMatchedAny:v9];
        }
        else
        {
          if (v24 > 0xB8)
          {
            id v12 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 67109120;
              LODWORD(v28) = v24;
              id v13 = v12;
              id v14 = "unhandled match type: unknown type %d";
              uint32_t v15 = 8;
LABEL_6:
              _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_ERROR, v14, buf, v15);
            }
LABEL_12:

            goto LABEL_13;
          }
          id v17 = (void (*)(long long *, void))TrackFieldToML3Info[2 * v24 + 1];
          if (!v17)
          {
            if (v24 == 40) {
              goto LABEL_13;
            }
            id v12 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              id v18 = NSStringFromITDBTrackField(v24);
              *(_DWORD *)long long buf = 138543362;
              id v28 = v18;
              _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEBUG, "unhandled match type: unfilterable type %{public}@", buf, 0xCu);
            }
            goto LABEL_12;
          }
          uint64_t v16 = v17(&v24, TrackFieldToML3Info[2 * v24]);
        }
        id v12 = v16;
        if (v16)
        {
          [v5 addObject:v16];
          goto LABEL_12;
        }
      }
LABEL_13:
      if (v7 == ++v8) {
        goto LABEL_23;
      }
    }
    int v11 = SearchCriterionInfo;
    id v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      id v28 = (void *)v11;
      id v13 = v12;
      id v14 = "Got an error getting search criterion info: %ld";
      uint32_t v15 = 12;
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_23:
  UnlockSearchCriteriaList();
  id v19 = objc_opt_class();
  if ([v5 count])
  {
    id v20 = [v19 predicateMatchingPredicates:v5];
  }
  else
  {
    id v20 = 0;
  }
  if ((v26 & 2) != 0)
  {
    uint64_t v21 = +[ML3UnaryPredicate predicateWithPredicate:v20];

    id v20 = (void *)v21;
  }

  return v20;
}

+ (BOOL)hasCriterionInCriteriaList:(SearchCriteriaList *)a3 forITDBTrackField:(int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  LockSearchCriteriaList();
  GetSearchCriteriaListOptions();
  unsigned int v4 = CountSearchCriteria();
  if (v4)
  {
    unsigned int v5 = v4;
    for (unsigned int i = 1; ; ++i)
    {
      int SearchCriterionInfo = GetSearchCriterionInfo();
      if (SearchCriterionInfo)
      {
        int v8 = SearchCriterionInfo;
        BOOL v9 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v12 = v8;
          _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "Got an error getting search criterion info: %ld", buf, 0xCu);
        }
      }
      if (i >= v5) {
        break;
      }
    }
  }
  UnlockSearchCriteriaList();
  return 0;
}

+ (void)populateSortOrdersOfPropertyValues:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __78__ML3Container_populateSortOrdersOfPropertyValues_inLibrary_cachedNameOrders___block_invoke;
  v14[3] = &unk_1E5FB4910;
  id v15 = v7;
  id v16 = v9;
  id v17 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = v7;
  uint64_t v13 = (void (**)(void, void, void))MEMORY[0x1B3E93EE0](v14);
  ((void (**)(void, __CFString *, __CFString *))v13)[2](v13, @"name_order", @"name");
}

void __78__ML3Container_populateSortOrdersOfPropertyValues_inLibrary_cachedNameOrders___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] objectForKey:v5];

  if (!v7)
  {
    uint64_t v8 = [a1[4] objectForKey:v6];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = [a1[5] objectForKey:v8];
      id v11 = v10;
      if (v10) {
        uint64_t v12 = [v10 ML3NameOrderValue];
      }
      else {
        uint64_t v12 = [a1[6] nameOrderForString:v9];
      }
      uint64_t v14 = v12;
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a1[5])
        {
          id v15 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            id v16 = a1[5];
            int v18 = 138543874;
            id v19 = v5;
            __int16 v20 = 2114;
            uint64_t v21 = v9;
            __int16 v22 = 2114;
            id v23 = v16;
            _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_ERROR, "Could not find sort order for %{public}@ of %{public}@ in %{public}@", (uint8_t *)&v18, 0x20u);
          }
          goto LABEL_12;
        }
        uint64_t v14 = [a1[6] insertStringIntoSortMapNoTransaction:v9];
      }
      id v17 = a1[4];
      id v15 = [NSNumber numberWithLongLong:v14];
      [v17 setObject:v15 forKey:v5];
LABEL_12:
    }
  }
}

+ (BOOL)smartCriteriaCanBeEvaluated:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_8;
  }
  uint64_t v12 = 0;
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  int v7 = MEMORY[0x1B3E92EF0](v5, v6, &v12);
  if (v7)
  {
    int v8 = v7;
    id v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "Could not parse search criteria list for playlist with error %ld", buf, 0xCu);
    }
  }
  if (v12)
  {
    int v10 = [a1 hasCriterionInCriteriaList:v12 forITDBTrackField:40] ^ 1;
    DisposeSearchCriteriaList();
  }
  else
  {
LABEL_8:
    LOBYTE(v10) = 0;
  }
  return v10;
}

+ (id)nextFilepathForPlaylistType:(int)a3 withPersistentID:(unint64_t)a4 inLibrary:(id)a5
{
  id v9 = a5;
  if (!a4)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"ML3Container.m" lineNumber:744 description:@"persistentID must be specified since it is part of the filename format."];
  }
  if (a3 == 3) {
    unsigned int v10 = 6;
  }
  else {
    unsigned int v10 = 7;
  }
  if (a3 == 2) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = +[ML3MusicLibrary pathForResourceFileOrFolder:v11];
  if (v12)
  {
    id v18 = 0;
    uint64_t v13 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, @"%llu", &v18, a4);
    id v14 = v18;
    if (v14)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, a1, @"ML3Container.m", 762, @"Encountered error validating format. pathFormat=%@ error=%@", v12, v14 object file lineNumber description];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3
{
  return [(id)ML3ContainerNoAssistantSyncProperties containsObject:a3] ^ 1;
}

+ (BOOL)libraryDynamicChangeForProperty:(id)a3
{
  return [(id)ML3ContainerContentsUnchangingProperties containsObject:a3];
}

+ (id)persistentIDColumnForTable:(id)a3
{
  return (id)[(id)ML3ContainerPersistentIDForTable objectForKey:a3];
}

+ (id)extraTablesToDelete
{
  return (id)ML3ContainerExtraTablesToDelete;
}

+ (id)foreignColumnForProperty:(id)a3
{
  return (id)[(id)ML3ContainerForeignColumnForProperties objectForKey:a3];
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return (id)[(id)ML3ContainerForeignDatabaseTableForProperties objectForKey:a3];
}

+ (id)sectionPropertyForProperty:(id)a3
{
  return (id)[(id)ML3ContainerSectionPropertyForProperties objectForKey:a3];
}

- (id)protocolItem
{
  id v3 = objc_alloc_init(MIPPlaylist);
  if (protocolItem_onceToken_45[0] != -1) {
    dispatch_once(protocolItem_onceToken_45, &__block_literal_global_47);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = +[ML3ComparisonPredicate predicateWithProperty:@"ROWID" equalToInt64:self->super._persistentID];
  int v7 = [v5 unrestrictedAllItemsQueryWithlibrary:WeakRetained predicate:v6 orderingTerms:0];

  int v8 = [v7 selectPersistentIDsSQLAndProperties:protocolItem___playlistProperties ordered:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __40__ML3Container_MLProtocol__protocolItem__block_invoke_2;
  v15[3] = &unk_1E5FB6CD8;
  id v16 = v8;
  id v17 = self;
  id v18 = WeakRetained;
  id v9 = v3;
  id v19 = v9;
  id v10 = WeakRetained;
  id v11 = v8;
  [v10 databaseConnectionAllowingWrites:0 withBlock:v15];
  uint64_t v12 = v19;
  uint64_t v13 = v9;

  return v13;
}

void __40__ML3Container_MLProtocol__protocolItem__block_invoke_2(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v16[0] = MEMORY[0x1E4F1CC28];
  id v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 16);
  id v6 = a2;
  int v7 = [v3 numberWithLongLong:v5];
  v16[1] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v9 = [v6 executeQuery:v4 withParameters:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __40__ML3Container_MLProtocol__protocolItem__block_invoke_3;
  v12[3] = &unk_1E5FB6A00;
  id v13 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 40);
  id v14 = v10;
  uint64_t v15 = v11;
  [v9 enumerateRowsWithBlock:v12];
}

void __40__ML3Container_MLProtocol__protocolItem__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v68 = a3;
  uint64_t v6 = [v5 int64ForColumnIndex:16];
  uint64_t v64 = [v5 int64ForColumnIndex:2];
  int v7 = [v5 stringForColumnIndex:1];
  int v8 = [v5 intForColumnIndex:3];
  int v71 = [v5 intForColumnIndex:4];
  int v60 = [v5 intForColumnIndex:5];
  id v9 = [v5 dataForColumnIndex:6];
  unsigned int v63 = [v5 intForColumnIndex:18];
  unsigned int v62 = [v5 intForColumnIndex:19];
  int v61 = [v5 intForColumnIndex:20];
  id v10 = [v5 stringForColumnIndex:21];
  uint64_t v11 = [v5 stringForColumnIndex:52];
  int v66 = [v5 intForColumnIndex:53];
  uint64_t v12 = [v5 stringForColumnIndex:54];
  uint64_t v69 = v11;
  uint64_t v70 = (void *)v12;
  if (v6)
  {
    int v59 = v8;
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = +[ML3ComparisonPredicate predicateWithProperty:@"container_pid" equalToInt64:v6];
    uint64_t v15 = +[ML3Entity anyInLibrary:v13 predicate:v14];

    if (v15)
    {
      id v16 = [v15 multiverseIdentifier];
      [*(id *)(a1 + 40) setParentIdentifier:v16];
    }
    uint64_t v11 = v69;
    int v8 = v59;
  }
  if (v64) {
    objc_msgSend(*(id *)(a1 + 40), "setStoreId:");
  }
  if ([v7 length]) {
    [*(id *)(a1 + 40) setName:v7];
  }
  if (v8) {
    [*(id *)(a1 + 40) setHidden:1];
  }
  [*(id *)(a1 + 40) setDistinguishedKind:v63];
  objc_msgSend(*(id *)(a1 + 40), "setSortType:", +[ML3Container protocolSortTypeFromTrackOrder:](ML3Container, "protocolSortTypeFromTrackOrder:", v62));
  [*(id *)(a1 + 40) setReversedSorting:v61 != 0];
  if (v10) {
    [*(id *)(a1 + 40) setCloudGlobalId:v10];
  }
  objc_msgSend(*(id *)(a1 + 40), "setCloudIsSubscribed:", objc_msgSend(v5, "intForColumnIndex:", 22) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setCloudIsCuratorPlaylist:", objc_msgSend(v5, "intForColumnIndex:", 23) != 0);
  id v17 = [v5 stringForColumnIndex:24];
  [*(id *)(a1 + 40) setExternalVendorIdentifier:v17];

  id v18 = [v5 stringForColumnIndex:25];
  [*(id *)(a1 + 40) setExternalVendorDisplayName:v18];

  id v19 = [v5 stringForColumnIndex:26];
  [*(id *)(a1 + 40) setExternalVendorTag:v19];

  objc_msgSend(*(id *)(a1 + 40), "setExternalVendorPlaylist:", objc_msgSend(v5, "intForColumnIndex:", 27) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setCreationDateTime:", objc_msgSend(v5, "int64ForColumnIndex:", 28));
  objc_msgSend(*(id *)(a1 + 40), "setModificationDateTime:", objc_msgSend(v5, "int64ForColumnIndex:", 29));
  objc_msgSend(*(id *)(a1 + 40), "setLastPlayedDateTime:", objc_msgSend(v5, "int64ForColumnIndex:", 30));
  objc_msgSend(*(id *)(a1 + 40), "setCloudIsSharingDisabled:", objc_msgSend(v5, "intForColumnIndex:", 31) != 0);
  __int16 v20 = [v5 stringForColumnIndex:32];
  [*(id *)(a1 + 40) setCloudVersionHash:v20];

  uint64_t v21 = [v5 stringForColumnIndex:33];
  [*(id *)(a1 + 40) setArtworkId:v21];

  objc_msgSend(*(id *)(a1 + 40), "setLikedState:", objc_msgSend(v5, "intForColumnIndex:", 34));
  objc_msgSend(*(id *)(a1 + 40), "setRemoteSourceType:", objc_msgSend(v5, "intForColumnIndex:", 35));
  objc_msgSend(*(id *)(a1 + 40), "setOwner:", objc_msgSend(v5, "intForColumnIndex:", 36) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setEditable:", objc_msgSend(v5, "intForColumnIndex:", 37) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setPlayCount:", objc_msgSend(v5, "intForColumnIndex:", 38));
  objc_msgSend(*(id *)(a1 + 40), "setShared:", objc_msgSend(v5, "intForColumnIndex:", 39) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setVisible:", objc_msgSend(v5, "intForColumnIndex:", 40) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setAuthorStoreId:", (int)objc_msgSend(v5, "intForColumnIndex:", 41));
  __int16 v22 = [v5 stringForColumnIndex:42];
  [*(id *)(a1 + 40) setAuthorDisplayName:v22];

  id v23 = [v5 stringForColumnIndex:43];
  [*(id *)(a1 + 40) setAuthorStoreURL:v23];

  uint64_t v24 = [v5 stringForColumnIndex:44];
  [*(id *)(a1 + 40) setAuthorHandle:v24];

  objc_msgSend(*(id *)(a1 + 40), "setMinRefreshInterval:", objc_msgSend(v5, "int64ForColumnIndex:", 45));
  objc_msgSend(*(id *)(a1 + 40), "setCloudLastUpdateTime:", objc_msgSend(v5, "int64ForColumnIndex:", 46));
  objc_msgSend(*(id *)(a1 + 40), "setSubscriberCount:", objc_msgSend(v5, "intForColumnIndex:", 47));
  objc_msgSend(*(id *)(a1 + 40), "setSubscriberPlayCount:", objc_msgSend(v5, "intForColumnIndex:", 48));
  objc_msgSend(*(id *)(a1 + 40), "setSubscriberLikedCount:", objc_msgSend(v5, "intForColumnIndex:", 49));
  long long v25 = [v5 stringForColumnIndex:50];
  [*(id *)(a1 + 40) setSubscriberURL:v25];

  int v26 = [v5 stringForColumnIndex:51];
  [*(id *)(a1 + 40) setPlaylistDescription:v26];

  objc_msgSend(*(id *)(a1 + 40), "setPlaylistCategoryTypeMask:", objc_msgSend(v5, "intForColumnIndex:", 55));
  char v27 = [v5 stringForColumnIndex:56];
  [*(id *)(a1 + 40) setPlaylistGroupingSortKey:v27];

  objc_msgSend(*(id *)(a1 + 40), "setTraits:", objc_msgSend(v5, "intForColumnIndex:", 57));
  objc_msgSend(*(id *)(a1 + 40), "setLikedStateChangedDate:", (int)objc_msgSend(v5, "intForColumnIndex:", 58));
  id v28 = [v5 stringForColumnIndex:59];
  [*(id *)(a1 + 40) setCoverArtworkRecipe:v28];

  objc_msgSend(*(id *)(a1 + 40), "setIsCollaborative:", objc_msgSend(v5, "intForColumnIndex:", 60) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setCollaborationMode:", objc_msgSend(v5, "intForColumnIndex:", 61));
  uint64_t v29 = [v5 stringForColumnIndex:62];
  [*(id *)(a1 + 40) setCollaborationInvitationURL:v29];

  objc_msgSend(*(id *)(a1 + 40), "setCollaborationInvitationURLExpirationDate:", objc_msgSend(v5, "int64ForColumnIndex:", 63));
  objc_msgSend(*(id *)(a1 + 40), "setCollaborationJoinRequestPending:", objc_msgSend(v5, "intForColumnIndex:", 64) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setCollaboratorStatus:", objc_msgSend(v5, "intForColumnIndex:", 65));
  if (v11) {
    [*(id *)(a1 + 40) setCloudUniversalLibraryId:v11];
  }
  if (v12) {
    [*(id *)(a1 + 40) setSecondaryArtworkId:v12];
  }
  if (v66) {
    objc_msgSend(*(id *)(a1 + 40), "setSecondaryArtworkSourceType:");
  }
  if (v71)
  {
    int64_t v30 = *(void **)(a1 + 40);
    uint64_t v31 = 4;
LABEL_21:
    [v30 setType:v31];
    goto LABEL_22;
  }
  if (!v60)
  {
    uint64_t v58 = [v9 length];
    int64_t v30 = *(void **)(a1 + 40);
    if (v58) {
      uint64_t v31 = 2;
    }
    else {
      uint64_t v31 = 1;
    }
    goto LABEL_21;
  }
  [*(id *)(a1 + 40) setType:3];
  uint64_t v43 = [v5 int64ForColumnIndex:17];
  if (v43)
  {
    uint64_t v44 = *(void *)(a1 + 32);
    id v45 = +[ML3ComparisonPredicate predicateWithProperty:@"ROWID" equalToInt64:v43];
    id v46 = +[ML3Entity anyInLibrary:v44 predicate:v45];

    if (v46)
    {
      id v47 = [v46 multiverseIdentifierLibraryOnly:1];
      [*(id *)(a1 + 40) setGeniusSeedTrackIdentifier:v47];
    }
  }
LABEL_22:
  int v32 = [v5 intForColumnIndex:11];
  if ([v9 length])
  {
    id v33 = objc_alloc_init(MIPSmartPlaylistInfo);
    -[MIPSmartPlaylistInfo setEvaluationOrder:](v33, "setEvaluationOrder:", [v5 intForColumnIndex:7]);
    -[MIPSmartPlaylistInfo setLimitKind:](v33, "setLimitKind:", [v5 intForColumnIndex:8]);
    -[MIPSmartPlaylistInfo setLimitOrder:](v33, "setLimitOrder:", [v5 intForColumnIndex:9]);
    -[MIPSmartPlaylistInfo setLimitValue:](v33, "setLimitValue:", [v5 intForColumnIndex:10]);
    [(MIPSmartPlaylistInfo *)v33 setSmartCriteria:v9];
    [(MIPSmartPlaylistInfo *)v33 setDynamic:v32 != 0];
    -[MIPSmartPlaylistInfo setEnabledItemsOnly:](v33, "setEnabledItemsOnly:", [v5 intForColumnIndex:12] != 0);
    -[MIPSmartPlaylistInfo setFiltered:](v33, "setFiltered:", [v5 intForColumnIndex:13] != 0);
    -[MIPSmartPlaylistInfo setGenius:](v33, "setGenius:", [v5 intForColumnIndex:5] != 0);
    -[MIPSmartPlaylistInfo setLimited:](v33, "setLimited:", [v5 intForColumnIndex:14] != 0);
    -[MIPSmartPlaylistInfo setReverseLimitOrder:](v33, "setReverseLimitOrder:", [v5 intForColumnIndex:15] != 0);
    [*(id *)(a1 + 40) setSmartPlaylistInfo:v33];
  }
  if (v71)
  {
    [*(id *)(a1 + 48) childPlaylistPersistentIds];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = [v34 countByEnumeratingWithState:&v77 objects:v82 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v65 = v10;
      id v67 = v9;
      long long v72 = v7;
      uint64_t v37 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v78 != v37) {
            objc_enumerationMutation(v34);
          }
          unsigned int v39 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          __int16 v40 = (void *)MEMORY[0x1B3E93C70]();
          int v41 = -[ML3Entity initWithPersistentID:inLibrary:]([ML3Container alloc], "initWithPersistentID:inLibrary:", [v39 longLongValue], *(void *)(a1 + 32));
          uint64_t v42 = [(ML3Container *)v41 multiverseIdentifier];

          if (v42) {
            [*(id *)(a1 + 40) addChildIdentifiers:v42];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v77 objects:v82 count:16];
      }
      while (v36);
LABEL_51:
      int v7 = v72;
      id v10 = v65;
      id v9 = v67;
      uint64_t v11 = v69;
      goto LABEL_52;
    }
    goto LABEL_52;
  }
  int v48 = [*(id *)(a1 + 40) type];
  id v49 = v70;
  if (v48 == 1 || !v32)
  {
    [*(id *)(a1 + 48) trackPersistentIds];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = [v34 countByEnumeratingWithState:&v73 objects:v81 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v65 = v10;
      id v67 = v9;
      long long v72 = v7;
      uint64_t v52 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v74 != v52) {
            objc_enumerationMutation(v34);
          }
          long long v54 = *(void **)(*((void *)&v73 + 1) + 8 * j);
          objc_super v55 = (void *)MEMORY[0x1B3E93C70]();
          uint64_t v56 = -[ML3Entity initWithPersistentID:inLibrary:]([ML3Track alloc], "initWithPersistentID:inLibrary:", [v54 longLongValue], *(void *)(a1 + 32));
          uint64_t v57 = [(ML3Track *)v56 multiverseIdentifier];

          if (v57) {
            [*(id *)(a1 + 40) addItems:v57];
          }
        }
        uint64_t v51 = [v34 countByEnumeratingWithState:&v73 objects:v81 count:16];
      }
      while (v51);
      goto LABEL_51;
    }
LABEL_52:

    id v49 = v70;
  }
}

void __40__ML3Container_MLProtocol__protocolItem__block_invoke()
{
  v68[65] = *MEMORY[0x1E4F143B8];
  v0 = @"name";
  v68[0] = @"name";
  v1 = @"store_cloud_id";
  v68[1] = @"store_cloud_id";
  uint64_t v2 = @"is_hidden";
  v68[2] = @"is_hidden";
  id v3 = @"smart_is_folder";
  v68[3] = @"smart_is_folder";
  uint64_t v4 = @"smart_is_genius";
  v68[4] = @"smart_is_genius";
  id v5 = @"smart_criteria";
  v68[5] = @"smart_criteria";
  uint64_t v6 = @"smart_evaluation_order";
  v68[6] = @"smart_evaluation_order";
  int v7 = @"smart_limit_kind";
  v68[7] = @"smart_limit_kind";
  int v8 = @"smart_limit_order";
  v68[8] = @"smart_limit_order";
  id v9 = @"smart_limit_value";
  v68[9] = @"smart_limit_value";
  id v10 = @"smart_is_dynamic";
  v68[10] = @"smart_is_dynamic";
  uint64_t v11 = @"smart_enabled_only";
  v68[11] = @"smart_enabled_only";
  uint64_t v12 = @"smart_is_filtered";
  v68[12] = @"smart_is_filtered";
  uint64_t v13 = @"smart_is_limited";
  v68[13] = @"smart_is_limited";
  id v14 = @"smart_reverse_limit_order";
  v68[14] = @"smart_reverse_limit_order";
  uint64_t v15 = @"parent_pid";
  v68[15] = @"parent_pid";
  id v16 = @"container_seed.item_pid";
  v68[16] = @"container_seed.item_pid";
  id v17 = @"distinguished_kind";
  v68[17] = @"distinguished_kind";
  id v18 = @"play_order";
  v68[18] = @"play_order";
  id v19 = @"is_reversed";
  v68[19] = @"is_reversed";
  __int16 v20 = @"cloud_global_id";
  v68[20] = @"cloud_global_id";
  uint64_t v21 = @"cloud_is_subscribed";
  v68[21] = @"cloud_is_subscribed";
  __int16 v22 = @"cloud_is_curator_playlist";
  v68[22] = @"cloud_is_curator_playlist";
  id v23 = @"external_vendor_identifier";
  v68[23] = @"external_vendor_identifier";
  uint64_t v24 = @"external_vendor_display_name";
  v68[24] = @"external_vendor_display_name";
  long long v25 = @"external_vendor_container_tag";
  v68[25] = @"external_vendor_container_tag";
  int v26 = @"is_external_vendor_playlist";
  v68[26] = @"is_external_vendor_playlist";
  char v27 = @"date_created";
  v68[27] = @"date_created";
  id v28 = @"date_modified";
  v68[28] = @"date_modified";
  uint64_t v29 = @"date_played";
  v68[29] = @"date_played";
  int64_t v30 = @"cloud_is_sharing_disabled";
  v68[30] = @"cloud_is_sharing_disabled";
  uint64_t v31 = @"cloud_version_hash";
  v68[31] = @"cloud_version_hash";
  int v32 = @"best_artwork_token.available_artwork_token AS available_container_artwork_token";
  v68[32] = @"best_artwork_token.available_artwork_token AS available_container_artwork_token";
  id v33 = @"liked_state";
  v68[33] = @"liked_state";
  id v34 = @"is_src_remote";
  v68[34] = @"is_src_remote";
  uint64_t v35 = @"is_owner";
  v68[35] = @"is_owner";
  uint64_t v36 = @"is_editable";
  v68[36] = @"is_editable";
  uint64_t v37 = @"play_count_user";
  v68[37] = @"play_count_user";
  char v38 = @"cloud_is_public";
  v68[38] = @"cloud_is_public";
  unsigned int v39 = @"cloud_is_visible";
  v68[39] = @"cloud_is_visible";
  __int16 v40 = @"cloud_author_store_id";
  v68[40] = @"cloud_author_store_id";
  int v41 = @"cloud_author_display_name";
  v68[41] = @"cloud_author_display_name";
  uint64_t v42 = @"cloud_author_store_url";
  v68[42] = @"cloud_author_store_url";
  uint64_t v43 = @"cloud_author_handle";
  v68[43] = @"cloud_author_handle";
  uint64_t v44 = @"cloud_min_refresh_interval";
  v68[44] = @"cloud_min_refresh_interval";
  id v45 = @"cloud_last_update_time";
  v68[45] = @"cloud_last_update_time";
  id v46 = @"cloud_user_count";
  v68[46] = @"cloud_user_count";
  id v47 = @"cloud_global_play_count";
  v68[47] = @"cloud_global_play_count";
  int v48 = @"cloud_global_like_count";
  v68[48] = @"cloud_global_like_count";
  id v49 = @"cloud_share_url";
  v68[49] = @"cloud_share_url";
  uint64_t v50 = @"description";
  v68[50] = @"description";
  uint64_t v51 = @"cloud_universal_library_id";
  v68[51] = @"cloud_universal_library_id";
  uint64_t v52 = @"best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type";
  v68[52] = @"best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type";
  long long v53 = @"best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token";
  v68[53] = @"best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token";
  long long v54 = @"category_type_mask";
  v68[54] = @"category_type_mask";
  objc_super v55 = @"grouping_sort_key";
  v68[55] = @"grouping_sort_key";
  uint64_t v56 = @"traits";
  v68[56] = @"traits";
  uint64_t v57 = @"liked_state_changed_date";
  v68[57] = @"liked_state_changed_date";
  uint64_t v58 = @"cover_artwork_recipe";
  v68[58] = @"cover_artwork_recipe";
  int v59 = @"is_collaborative";
  v68[59] = @"is_collaborative";
  int v60 = @"collaborator_invite_options";
  v68[60] = @"collaborator_invite_options";
  int v61 = @"collaboration_invitation_link";
  v68[61] = @"collaboration_invitation_link";
  unsigned int v62 = @"collaboration_invitation_url_expiration_date";
  v68[62] = @"collaboration_invitation_url_expiration_date";
  unsigned int v63 = @"collaboration_join_request_pending";
  v68[63] = @"collaboration_join_request_pending";
  uint64_t v64 = @"collaborator_status";
  v68[64] = @"collaborator_status";
  uint64_t v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:65];
  int v66 = (void *)protocolItem___playlistProperties;
  protocolItem___playlistProperties = v65;

  for (uint64_t i = 64; i != -1; --i)
}

- (id)protocolItemForDynamicUpdate
{
  id v3 = objc_alloc_init(MIPPlaylist);
  if (protocolItemForDynamicUpdate_onceToken_44 != -1) {
    dispatch_once(&protocolItemForDynamicUpdate_onceToken_44, &__block_literal_global_19699);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  id v5 = objc_opt_class();
  uint64_t v6 = +[ML3ComparisonPredicate predicateWithProperty:@"ROWID" equalToInt64:self->super._persistentID];
  int v7 = [v5 unrestrictedAllItemsQueryWithlibrary:WeakRetained predicate:v6 orderingTerms:0];

  int v8 = [v7 selectPersistentIDsSQLAndProperties:protocolItemForDynamicUpdate___playlistProperties ordered:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __56__ML3Container_MLProtocol__protocolItemForDynamicUpdate__block_invoke_2;
  v14[3] = &unk_1E5FB6A28;
  id v15 = v8;
  id v16 = self;
  id v9 = v3;
  id v17 = v9;
  id v10 = v8;
  [WeakRetained databaseConnectionAllowingWrites:0 withBlock:v14];
  uint64_t v11 = v17;
  uint64_t v12 = v9;

  return v12;
}

void __56__ML3Container_MLProtocol__protocolItemForDynamicUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  v12[0] = MEMORY[0x1E4F1CC28];
  id v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 16);
  id v6 = a2;
  int v7 = [v3 numberWithLongLong:v5];
  v12[1] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v9 = [v6 executeQuery:v4 withParameters:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__ML3Container_MLProtocol__protocolItemForDynamicUpdate__block_invoke_3;
  v10[3] = &unk_1E5FB83F8;
  id v11 = *(id *)(a1 + 48);
  [v9 enumerateRowsWithBlock:v10];
}

void __56__ML3Container_MLProtocol__protocolItemForDynamicUpdate__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 int64ForColumnIndex:2];
  uint64_t v4 = [v6 stringForColumnIndex:1];
  uint64_t v5 = [v6 stringForColumnIndex:3];
  if (v3) {
    [*(id *)(a1 + 32) setStoreId:v3];
  }
  if ([v4 length]) {
    [*(id *)(a1 + 32) setName:v4];
  }
  if (v5) {
    [*(id *)(a1 + 32) setCloudGlobalId:v5];
  }
  objc_msgSend(*(id *)(a1 + 32), "setLikedState:", objc_msgSend(v6, "intForColumnIndex:", 4));
  objc_msgSend(*(id *)(a1 + 32), "setLikedStateChangedDate:", (int)objc_msgSend(v6, "intForColumnIndex:", 5));
}

void __56__ML3Container_MLProtocol__protocolItemForDynamicUpdate__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v0 = @"name";
  v8[0] = @"name";
  v1 = @"store_cloud_id";
  v8[1] = @"store_cloud_id";
  uint64_t v2 = @"cloud_global_id";
  v8[2] = @"cloud_global_id";
  uint64_t v3 = @"liked_state";
  v8[3] = @"liked_state";
  uint64_t v4 = @"liked_state_changed_date";
  void v8[4] = @"liked_state_changed_date";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
  id v6 = (void *)protocolItemForDynamicUpdate___playlistProperties;
  protocolItemForDynamicUpdate___playlistProperties = v5;

  for (uint64_t i = 4; i != -1; --i)
}

- (id)multiverseIdentifier
{
  uint64_t v3 = objc_alloc_init(MIPMultiverseIdentifier);
  [(MIPMultiverseIdentifier *)v3 setMediaObjectType:7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  uint64_t v5 = objc_alloc_init(MIPLibraryIdentifier);
  [(MIPLibraryIdentifier *)v5 setLibraryId:self->super._persistentID];
  id v6 = [WeakRetained libraryUID];
  [(MIPLibraryIdentifier *)v5 setLibraryName:v6];

  [(MIPMultiverseIdentifier *)v3 addLibraryIdentifiers:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __48__ML3Container_MLProtocol__multiverseIdentifier__block_invoke;
  v11[3] = &unk_1E5FB6A28;
  uint64_t v12 = @"SELECT container.name, container.store_cloud_id, container.cloud_universal_library_id FROM container WHERE container.ROWID = ?";
  uint64_t v13 = self;
  int v7 = v3;
  id v14 = v7;
  [WeakRetained databaseConnectionAllowingWrites:0 withBlock:v11];
  int v8 = v14;
  id v9 = v7;

  return v9;
}

void __48__ML3Container_MLProtocol__multiverseIdentifier__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 16);
  id v6 = a2;
  int v7 = [v3 numberWithLongLong:v5];
  v12[0] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v9 = [v6 executeQuery:v4 withParameters:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__ML3Container_MLProtocol__multiverseIdentifier__block_invoke_2;
  v10[3] = &unk_1E5FB83F8;
  id v11 = *(id *)(a1 + 48);
  [v9 enumerateRowsWithBlock:v10];
}

void __48__ML3Container_MLProtocol__multiverseIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 stringForColumnIndex:0];
  [*(id *)(a1 + 32) setName:v4];

  uint64_t v5 = [v3 int64ForColumnIndex:1];
  id v7 = [v3 stringForColumnIndex:2];

  if (v5 >= 1) {
    [*(id *)(a1 + 32) setStoreId:v5];
  }
  id v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 32) setCloudUniversalLibraryId:v7];
    id v6 = v7;
  }
}

+ (int)protocolSortTypeFromTrackOrder:(unsigned int)a3
{
  if (a3 - 1 > 0x4B) {
    return 0;
  }
  else {
    return dword_1B04DD20C[a3 - 1];
  }
}

+ (unsigned)trackOrderFromProtocolSortType:(int)a3
{
  if ((a3 - 1) > 0x49) {
    return 1;
  }
  else {
    return *(_DWORD *)&asc_1B04DD0E4[4 * (a3 - 1)];
  }
}

- (id)_stringStringForCriteriaInfo:(id *)a3
{
  id v3 = (void *)[[NSString alloc] initWithCharacters:a3->var6.var0.var0 length:(unint64_t)a3->var6.var0.var1 >> 1];

  return v3;
}

- (id)_stringForTrackFieldMediaKind:(int64_t)a3
{
  if (a3 > 4095)
  {
    if (a3 < 0x40000)
    {
      if (a3 >= 0x8000)
      {
        switch(a3)
        {
          case 0x8000:
            return @"rental";
          case 0x10000:
            return @"digital booklet";
          case 0x20000:
            return @"software application";
        }
      }
      else
      {
        switch(a3)
        {
          case 0x1000:
            return @"software package";
          case 0x2000:
            return @"forced music playlist";
          case 0x4000:
            return @"ringtone";
        }
      }
    }
    else if (a3 < 0x200000)
    {
      switch(a3)
      {
        case 0x40000:
          return @"software game";
        case 0x80000:
          return @"audio pass";
        case 0x100000:
          return @"voice memo";
      }
    }
    else if (a3 >= 0x800000)
    {
      if (a3 == 0x800000) {
        return @"PDF book";
      }
      if (a3 == 0x1000000) {
        return @"alert tone";
      }
    }
    else
    {
      if (a3 == 0x200000) {
        return @"iTunes U";
      }
      if (a3 == 0x400000) {
        return @"book";
      }
    }
    return @"invalid";
  }
  if (a3 > 31)
  {
    if (a3 <= 255)
    {
      switch(a3)
      {
        case 32:
          return @"music video";
        case 64:
          return @"TV show";
        case 128:
          return @"interactive booklet";
      }
    }
    else if (a3 > 1023)
    {
      if (a3 == 1024) {
        return @"home video";
      }
      if (a3 == 2048) {
        return @"future video 3";
      }
    }
    else
    {
      if (a3 == 256) {
        return @"coached audio";
      }
      if (a3 == 512) {
        return @"video pass";
      }
    }
    return @"invalid";
  }
  id result = @"unknown";
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      id result = @"music";
      break;
    case 2:
      id result = @"movie";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return @"invalid";
    case 4:
      id result = @"podcast";
      break;
    case 8:
      id result = @"audiobook";
      break;
    default:
      if (a3 != 16) {
        return @"invalid";
      }
      id result = @"PDF booklet";
      break;
  }
  return result;
}

- (id)_stringForTrackFieldCloudStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return @"invalid";
  }
  else {
    return off_1E5FB8160[a3];
  }
}

- (id)_stringForCriterionMatchType:(id *)a3
{
  HIDWORD(v4) = a3->var0 - 29;
  LODWORD(v4) = HIDWORD(v4);
  unsigned int v3 = v4 >> 1;
  if (v3 < 7 && ((0x53u >> v3) & 1) != 0)
  {
    id v7 = @"is equal to";
  }
  else
  {
    unsigned int var1 = a3->var1;
    int v6 = var1 & 0xFFFFFF;
    id v7 = &stru_1F08D4D70;
    if ((var1 & 0xFFFFFF) <= 0x1F)
    {
      switch(v6)
      {
        case 0:
          id v7 = @"invalid";
          goto LABEL_32;
        case 1:
          int v8 = @"is not equal to";
          id v9 = @"is equal to";
          goto LABEL_28;
        case 2:
          int v8 = @"does not contain";
          id v9 = @"contains";
          goto LABEL_28;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_32;
        case 4:
          int v8 = @"does not start with";
          id v9 = @"starts with";
          goto LABEL_28;
        case 8:
          int v8 = @"does not end with";
          id v9 = @"ends with";
          goto LABEL_28;
        default:
          if (v6 != 16) {
            goto LABEL_32;
          }
          int v8 = @"is not greater than";
          id v9 = @"is greater than";
          break;
      }
      goto LABEL_28;
    }
    if ((var1 & 0xFFFFFF) <= 0xFF)
    {
      switch(v6)
      {
        case 32:
          int v8 = @"is not greater than or equal";
          id v9 = @"is greater than or equal";
          goto LABEL_28;
        case 64:
          int v8 = @"is not less than";
          id v9 = @"is less than";
          goto LABEL_28;
        case 128:
          int v8 = @"is not less than or equal";
          id v9 = @"is less than or equal";
          goto LABEL_28;
      }
    }
    else if ((var1 & 0xFFFFFF) > 0x3FF)
    {
      if (v6 == 1024 || v6 == 2048)
      {
        int v8 = @"is not";
        id v9 = @"is";
        goto LABEL_28;
      }
    }
    else
    {
      if (v6 == 256)
      {
        int v8 = @"is not in range";
        id v9 = @"is in range";
        goto LABEL_28;
      }
      if (v6 == 512)
      {
        int v8 = @"is not between";
        id v9 = @"is between";
LABEL_28:
        if ((var1 & 0x2000000) != 0) {
          id v10 = v8;
        }
        else {
          id v10 = v9;
        }
        id v7 = v10;
      }
    }
  }
LABEL_32:

  return v7;
}

- (id)_stringForCriterionMatchKey:(id *)a3
{
  unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"(unsupported: %d)", a3->var0);
  unsigned int var0 = a3->var0;
  int v6 = @"Invalid";
  switch(var0)
  {
    case 0u:
      goto LABEL_136;
    case 1u:
      int v6 = @"Play Status";
      goto LABEL_136;
    case 2u:
      int v6 = @"Name";
      goto LABEL_136;
    case 3u:
      int v6 = @"Album";
      goto LABEL_136;
    case 4u:
      int v6 = @"Artist";
      goto LABEL_136;
    case 5u:
      int v6 = @"Bit Rate";
      goto LABEL_136;
    case 6u:
      int v6 = @"Sample Rate";
      goto LABEL_136;
    case 7u:
      int v6 = @"Year";
      goto LABEL_136;
    case 8u:
      int v6 = @"Genre";
      goto LABEL_136;
    case 9u:
      int v6 = @"Kind";
      goto LABEL_136;
    case 0xAu:
      int v6 = @"Date Modified";
      goto LABEL_136;
    case 0xBu:
      int v6 = @"Track Number";
      goto LABEL_136;
    case 0xCu:
      int v6 = @"Size";
      goto LABEL_136;
    case 0xDu:
      int v6 = @"Total Time";
      goto LABEL_136;
    case 0xEu:
      int v6 = @"Comment";
      goto LABEL_136;
    case 0xFu:
      int v6 = @"Location";
      goto LABEL_136;
    case 0x10u:
      int v6 = @"Date Added";
      goto LABEL_136;
    case 0x11u:
      int v6 = @"EQ Preset";
      goto LABEL_136;
    case 0x12u:
      int v6 = @"Composer";
      goto LABEL_136;
    case 0x13u:
      int v6 = @"Obsolete Display Artist";
      goto LABEL_136;
    case 0x14u:
      int v6 = @"Volume";
      goto LABEL_136;
    case 0x15u:
      int v6 = @"Stream Status";
      goto LABEL_136;
    case 0x16u:
      int v6 = @"User Play Count";
      goto LABEL_136;
    case 0x17u:
      int v6 = @"Play Date";
      goto LABEL_136;
    case 0x18u:
      int v6 = @"Disc Number";
      goto LABEL_136;
    case 0x19u:
      int v6 = @"Track Rating";
      goto LABEL_136;
    case 0x1Au:
      int v6 = @"Price";
      goto LABEL_136;
    case 0x1Bu:
      int v6 = @"Object ID";
      goto LABEL_136;
    case 0x1Cu:
      int v6 = @"Persistent ID";
      goto LABEL_136;
    case 0x1Du:
      int v6 = @"Checked";
      goto LABEL_136;
    case 0x1Eu:
      int v6 = @"Playlist Item ID";
      goto LABEL_136;
    case 0x1Fu:
      int v6 = @"Compilation";
      goto LABEL_136;
    case 0x20u:
      int v6 = @"Purchase Date";
      goto LABEL_136;
    case 0x21u:
      int v6 = @"Relevance";
      goto LABEL_136;
    case 0x22u:
      int v6 = @"Release Date";
      goto LABEL_136;
    case 0x23u:
      int v6 = @"Beat Per Minute";
      goto LABEL_136;
    case 0x24u:
      int v6 = @"Parent Container ID";
      goto LABEL_136;
    case 0x25u:
      int v6 = @"Artwork";
      goto LABEL_136;
    case 0x26u:
      int v6 = @"Popuarity";
      goto LABEL_136;
    case 0x27u:
      int v6 = @"Grouping";
      goto LABEL_136;
    case 0x28u:
      int v6 = @"Playlist";
      goto LABEL_136;
    case 0x29u:
      int v6 = @"Purchased";
      goto LABEL_136;
    case 0x2Au:
      int v6 = @"Artist ID";
      goto LABEL_136;
    case 0x2Bu:
      int v6 = @"Playlist ID";
      goto LABEL_136;
    case 0x2Cu:
      int v6 = @"Composer ID";
      goto LABEL_136;
    case 0x2Du:
      int v6 = @"Genre ID";
      goto LABEL_136;
    case 0x2Eu:
      int v6 = @"Codec Type";
      goto LABEL_136;
    case 0x2Fu:
      int v6 = @"Codec Sub-Type";
      goto LABEL_136;
    case 0x30u:
      int v6 = @"Song Data Kind";
      goto LABEL_136;
    case 0x31u:
      int v6 = @"Disc Count";
      goto LABEL_136;
    case 0x32u:
      int v6 = @"Start Time";
      goto LABEL_136;
    case 0x33u:
      int v6 = @"Stop Time";
      goto LABEL_136;
    case 0x34u:
      int v6 = @"Track Count";
      goto LABEL_136;
    case 0x35u:
      int v6 = @"Store Front ID";
      goto LABEL_136;
    case 0x36u:
      int v6 = @"Description";
      goto LABEL_136;
    case 0x37u:
      int v6 = @"Category";
      goto LABEL_136;
    case 0x38u:
      int v6 = @"Keywords";
      goto LABEL_136;
    case 0x39u:
      int v6 = @"Podcast";
      goto LABEL_136;
    case 0x3Au:
      int v6 = @"Cloud Match State";
      goto LABEL_136;
    case 0x3Bu:
      int v6 = @"Has Lyrics";
      goto LABEL_136;
    case 0x3Cu:
      int v6 = @"Media Kind";
      goto LABEL_136;
    case 0x3Eu:
      int v6 = @"Series Name";
      goto LABEL_136;
    case 0x3Fu:
      int v6 = @"Season Number";
      goto LABEL_136;
    case 0x40u:
      int v6 = @"Epsisode ID";
      goto LABEL_136;
    case 0x41u:
      int v6 = @"Episode Sort ID";
      goto LABEL_136;
    case 0x42u:
      int v6 = @"Network Name";
      goto LABEL_136;
    case 0x43u:
      int v6 = @"Last Backup Date";
      goto LABEL_136;
    case 0x44u:
      int v6 = @"Skips";
      goto LABEL_136;
    case 0x45u:
      int v6 = @"Skip Date";
      goto LABEL_136;
    case 0x46u:
      int v6 = @"Gapless Album";
      goto LABEL_136;
    case 0x47u:
      int v6 = @"Album Artist";
      goto LABEL_136;
    case 0x48u:
      int v6 = @"Shuffle ID";
      goto LABEL_136;
    case 0x49u:
      int v6 = @"Track ID";
      goto LABEL_136;
    case 0x4Au:
      int v6 = @"Relative Volumne";
      goto LABEL_136;
    case 0x4Bu:
      int v6 = @"Attributes";
      goto LABEL_136;
    case 0x4Cu:
    case 0x60u:
      int v6 = @"Private";
      goto LABEL_136;
    case 0x4Du:
      int v6 = @"Album Info";
      goto LABEL_136;
    case 0x4Eu:
      int v6 = @"Sort Name";
      goto LABEL_136;
    case 0x4Fu:
      int v6 = @"Sort Album";
      goto LABEL_136;
    case 0x50u:
      int v6 = @"Sort Artist";
      goto LABEL_136;
    case 0x51u:
      int v6 = @"Sort Album Artist";
      goto LABEL_136;
    case 0x52u:
      int v6 = @"Sort Composer";
      goto LABEL_136;
    case 0x53u:
      int v6 = @"Sort Series Name";
      goto LABEL_136;
    case 0x54u:
      int v6 = @"Moive Info";
      goto LABEL_136;
    case 0x55u:
      int v6 = @"Poscast URL";
      goto LABEL_136;
    case 0x56u:
      int v6 = @"Long Description";
      goto LABEL_136;
    case 0x57u:
      int v6 = @"Exernal GUID";
      goto LABEL_136;
    case 0x58u:
      int v6 = @"Chapter Data";
      goto LABEL_136;
    case 0x59u:
      int v6 = @"Video Rating";
      goto LABEL_136;
    case 0x5Au:
      int v6 = @"Album Rating";
      goto LABEL_136;
    case 0x5Bu:
      int v6 = @"Rental Expiration Date";
      goto LABEL_136;
    case 0x5Cu:
      int v6 = @"Obsolere Ringtone Status";
      goto LABEL_136;
    case 0x5Du:
      int v6 = @"Bookmark Time";
      goto LABEL_136;
    case 0x5Eu:
      int v6 = @"Remember Bookmark";
      goto LABEL_136;
    case 0x5Fu:
      int v6 = @"Has Been Played";
      goto LABEL_136;
    case 0x61u:
      int v6 = @"Has Subtitles";
      goto LABEL_136;
    case 0x62u:
      int v6 = @"Audio Language";
      goto LABEL_136;
    case 0x63u:
      int v6 = @"Audio Track Index";
      goto LABEL_136;
    case 0x64u:
      int v6 = @"Audio Track ID";
      goto LABEL_136;
    case 0x65u:
      int v6 = @"Subtitle Language";
      goto LABEL_136;
    case 0x66u:
      int v6 = @"Subtitle Track Index";
      goto LABEL_136;
    case 0x67u:
      int v6 = @"Subtitle Track ID";
      goto LABEL_136;
    case 0x68u:
      int v6 = @"Studio";
      goto LABEL_136;
    case 0x69u:
      int v6 = @"Reserved 1";
      goto LABEL_136;
    case 0x6Au:
      int v6 = @"Reserved 2";
      goto LABEL_136;
    case 0x6Bu:
      int v6 = @"Reserved 3";
      goto LABEL_136;
    case 0x6Cu:
      int v6 = @"Reserved 4";
      goto LABEL_136;
    case 0x6Du:
      int v6 = @"Reserved 5";
      goto LABEL_136;
    case 0x6Eu:
      int v6 = @"Gpaless Info";
      goto LABEL_136;
    case 0x6Fu:
      int v6 = @"Genius ID";
      goto LABEL_136;
    case 0x70u:
      int v6 = @"Exclude From Shuffle";
      goto LABEL_136;
    case 0x71u:
      int v6 = @"Lyrics";
      goto LABEL_136;
    case 0x72u:
      int v6 = @"Store Persistent ID";
      goto LABEL_136;
    case 0x73u:
      int v6 = @"Jukebox Votes";
      goto LABEL_136;
    case 0x74u:
      int v6 = @"Voice Over Language";
      goto LABEL_136;
    case 0x75u:
      int v6 = @"iTunes U";
      goto LABEL_136;
    case 0x76u:
      int v6 = @"Uncompressed Size";
      goto LABEL_136;
    case 0x77u:
      int v6 = @"XID";
      goto LABEL_136;
    case 0x78u:
      int v6 = @"Game GUID";
      goto LABEL_136;
    case 0x79u:
      int v6 = @"App Identifier";
      goto LABEL_136;
    case 0x7Au:
      int v6 = @"Obsolete Track Kind";
      goto LABEL_136;
    case 0x7Bu:
      int v6 = @"Version";
      goto LABEL_136;
    case 0x7Cu:
      int v6 = @"Copyright";
      goto LABEL_136;
    case 0x7Du:
      int v6 = @"User Disabled";
      goto LABEL_136;
    case 0x7Eu:
      int v6 = @"Album Artwork";
      goto LABEL_136;
    case 0x7Fu:
      int v6 = @"Collection Description";
      goto LABEL_136;
    case 0x80u:
      int v6 = @"Flavor";
      goto LABEL_136;
    case 0x81u:
      int v6 = @"Cloud ID";
      goto LABEL_136;
    case 0x82u:
      int v6 = @"Cloud Download";
      goto LABEL_136;
    case 0x83u:
      int v6 = @"Chosen By Auto Fill";
      goto LABEL_136;
    case 0x84u:
      int v6 = @"Cloud User ID";
      goto LABEL_136;
    case 0x85u:
      int v6 = @"Location (Track Kinds)";
      goto LABEL_136;
    case 0x86u:
      int v6 = @"iCloud Type";
      goto LABEL_136;
    case 0x9Au:
      int v6 = @"Liked State";
      goto LABEL_136;
    case 0xB7u:
      int v6 = @"Liked State Changed Date";
LABEL_136:

      unint64_t v4 = v6;
      break;
    default:
      break;
  }

  return v4;
}

- (id)_stringForCriterionBuffer:(id *)a3
{
  switch(a3->var0)
  {
    case 2u:
    case 3u:
    case 4u:
    case 8u:
    case 9u:
    case 0xEu:
    case 0x11u:
    case 0x12u:
    case 0x27u:
    case 0x36u:
    case 0x37u:
    case 0x3Eu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x47u:
    case 0x4Eu:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x56u:
    case 0x57u:
    case 0x71u:
    case 0x7Cu:
    case 0x7Fu:
    case 0x80u:
      $A480A5A2413FC6D588229CFB6A5B6D7D var6 = a3->var6;
      long long v10 = *(_OWORD *)&a3->var0;
      $A480A5A2413FC6D588229CFB6A5B6D7D v11 = var6;
      unint64_t v4 = [(ML3Container *)self _stringStringForCriteriaInfo:&v10];
      break;
    case 5u:
    case 6u:
    case 7u:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0x14u:
    case 0x16u:
    case 0x18u:
    case 0x19u:
    case 0x1Bu:
    case 0x1Cu:
    case 0x23u:
    case 0x28u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x31u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x3Cu:
    case 0x3Fu:
    case 0x44u:
    case 0x4Au:
    case 0x5Au:
    case 0x5Du:
    case 0x62u:
    case 0x63u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x6Fu:
    case 0x72u:
    case 0x76u:
    case 0x77u:
    case 0x81u:
    case 0x86u:
    case 0x9Au:
      $A480A5A2413FC6D588229CFB6A5B6D7D v3 = a3->var6;
      long long v10 = *(_OWORD *)&a3->var0;
      $A480A5A2413FC6D588229CFB6A5B6D7D v11 = v3;
      unint64_t v4 = [(ML3Container *)self _numericStringForCriteriaInfo:&v10];
      break;
    case 0xAu:
    case 0x10u:
    case 0x17u:
    case 0x22u:
    case 0x45u:
    case 0xB7u:
      $A480A5A2413FC6D588229CFB6A5B6D7D v7 = a3->var6;
      long long v10 = *(_OWORD *)&a3->var0;
      $A480A5A2413FC6D588229CFB6A5B6D7D v11 = v7;
      unint64_t v4 = [(ML3Container *)self _dateStringForCriteriaInfo:&v10];
      break;
    case 0x1Du:
    case 0x1Fu:
    case 0x25u:
    case 0x29u:
    case 0x39u:
    case 0x5Eu:
    case 0x5Fu:
    case 0x60u:
    case 0x61u:
    case 0x70u:
    case 0x75u:
    case 0x7Du:
    case 0x83u:
    case 0x85u:
      $A480A5A2413FC6D588229CFB6A5B6D7D v6 = a3->var6;
      long long v10 = *(_OWORD *)&a3->var0;
      $A480A5A2413FC6D588229CFB6A5B6D7D v11 = v6;
      unint64_t v4 = [(ML3Container *)self _BOOLeanStringForCriteriaInfo:&v10];
      break;
    case 0x7Eu:
      $A480A5A2413FC6D588229CFB6A5B6D7D v9 = a3->var6;
      long long v10 = *(_OWORD *)&a3->var0;
      $A480A5A2413FC6D588229CFB6A5B6D7D v11 = v9;
      unint64_t v4 = [(ML3Container *)self _nonzeroStringForCriteriaInfo:&v10];
      break;
    default:
      unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"(unsupported: %d)", a3->var0);
      break;
  }

  return v4;
}

- (id)_formatTime:(int64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%02lld:%02lld.%03lld", a3 / 60000 % 60, a3 / 1000 % 60, a3 % 1000);
}

- (id)_convertNumericValueFromCriterionMatchKey:(unsigned int)a3 criteriaValue:(int64_t)a4
{
  if (a3 == 13)
  {
    unint64_t v4 = [(ML3Container *)self _formatTime:a4];
  }
  else
  {
    if (a3 == 12) {
      objc_msgSend(NSString, "stringWithFormat:", @"%lld", a4 / 0x100000);
    }
    else {
    unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a4);
    }
  }

  return v4;
}

- (id)_numericStringForCriteriaInfo:(id *)a3
{
  unsigned int var1 = a3->var1;
  LODWORD(v15) = 0;
  GetSearchCriterionInfoValueRange();
  uint64_t ValueRangeCriteriaStartValue = GetValueRangeCriteriaStartValue();
  uint64_t ValueRangeCriteriaEndValue = GetValueRangeCriteriaEndValue();
  uint64_t var0 = a3->var0;
  if ((int)var0 > 89)
  {
    if (var0 != 90)
    {
      if (var0 == 134)
      {
        $A480A5A2413FC6D588229CFB6A5B6D7D v9 = [(ML3Container *)self _stringForTrackFieldCloudStatus:ValueRangeCriteriaStartValue];
        $A480A5A2413FC6D588229CFB6A5B6D7D v11 = 0;
        goto LABEL_11;
      }
      goto LABEL_9;
    }
LABEL_8:
    $A480A5A2413FC6D588229CFB6A5B6D7D v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lld (%d stars)", ValueRangeCriteriaStartValue, ValueRangeCriteriaStartValue / 20, 0, 0, 0, 0, 0, 0, 0, 0, v15);
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lld (%d stars)", ValueRangeCriteriaEndValue, ValueRangeCriteriaEndValue / 20);
    goto LABEL_10;
  }
  if (var0 == 25) {
    goto LABEL_8;
  }
  if (var0 != 60)
  {
LABEL_9:
    $A480A5A2413FC6D588229CFB6A5B6D7D v9 = [(ML3Container *)self _convertNumericValueFromCriterionMatchKey:var0 criteriaValue:ValueRangeCriteriaStartValue];
    uint64_t v10 = [(ML3Container *)self _convertNumericValueFromCriterionMatchKey:a3->var0 criteriaValue:ValueRangeCriteriaEndValue];
    goto LABEL_10;
  }
  $A480A5A2413FC6D588229CFB6A5B6D7D v9 = [(ML3Container *)self _stringForTrackFieldMediaKind:ValueRangeCriteriaStartValue];
  uint64_t v10 = [(ML3Container *)self _stringForTrackFieldMediaKind:ValueRangeCriteriaEndValue];
LABEL_10:
  $A480A5A2413FC6D588229CFB6A5B6D7D v11 = (void *)v10;
LABEL_11:
  if ((var1 & 0x100) != 0)
  {
    [NSString stringWithFormat:@"%@ to %@", v9, v11];
  }
  else if ((var1 & 0x200) != 0)
  {
    [NSString stringWithFormat:@"%@ and %@", v9, v11];
  }
  else
  {
    [NSString stringWithFormat:@"%@", v9, v14];
  uint64_t v12 = };

  return v12;
}

- (id)_nonzeroStringForCriteriaInfo:(id *)a3
{
  $A480A5A2413FC6D588229CFB6A5B6D7D var6 = a3->var6;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = var6;
  unint64_t v4 = [(ML3Container *)self _BOOLeanStringForCriteriaInfo:v6];

  return v4;
}

- (id)_dateStringForCriteriaInfo:(id *)a3
{
  if (_dateStringForCriteriaInfo__onceToken != -1) {
    dispatch_once(&_dateStringForCriteriaInfo__onceToken, &__block_literal_global_26566);
  }
  unsigned int var1 = a3->var1;
  GetSearchCriterionInfoValueRange();
  CFTimeZoneRef v5 = CFTimeZoneCopySystem();
  $A480A5A2413FC6D588229CFB6A5B6D7D v6 = (double *)MEMORY[0x1E4F1CF68];
  CFAbsoluteTime v7 = (double)(GetValueRangeCriteriaStartValue() - (uint64_t)*v6);
  uint64_t v8 = (uint64_t)(v7 - CFTimeZoneGetSecondsFromGMT(v5, v7));
  CFAbsoluteTime v9 = (double)(GetValueRangeCriteriaEndValue() - (uint64_t)*v6);
  CFAbsoluteTime v10 = v9 - CFTimeZoneGetSecondsFromGMT(v5, v9);
  CFRelease(v5);
  $A480A5A2413FC6D588229CFB6A5B6D7D v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v8];
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v10];
  uint64_t v13 = [(id)_dateStringForCriteriaInfo__formatter stringFromDate:v11];
  uint64_t v14 = [(id)_dateStringForCriteriaInfo__formatter stringFromDate:v12];
  if ((var1 & 0x100) != 0)
  {
    [NSString stringWithFormat:@"(%@) to (%@)", v13, v14];
  }
  else if ((var1 & 0x200) != 0)
  {
    [NSString stringWithFormat:@"(%@) and (%@)", v13, v14];
  }
  else
  {
    [NSString stringWithFormat:@"%@", v13, v17];
  uint64_t v15 = };

  return v15;
}

uint64_t __63__ML3Container_SmartPlaylistDebug___dateStringForCriteriaInfo___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_dateStringForCriteriaInfo__formatter;
  _dateStringForCriteriaInfo__formatter = (uint64_t)v0;

  uint64_t v2 = (void *)_dateStringForCriteriaInfo__formatter;

  return [v2 setDateFormat:@"MM/dd/yyyy HH:mm"];
}

- (id)_BOOLeanStringForCriteriaInfo:(id *)a3
{
  HIDWORD(v3) = a3->var0 - 29;
  LODWORD(v3) = HIDWORD(v3);
  switch((v3 >> 1))
  {
    case 0u:
    case 4u:
    case 6u:
      char var1_high = HIBYTE(a3->var1);
      CFTimeZoneRef v5 = @"true";
      $A480A5A2413FC6D588229CFB6A5B6D7D v6 = @"false";
      goto LABEL_4;
    case 1u:
      char var1_high = HIBYTE(a3->var1);
      CFTimeZoneRef v5 = @"false";
      $A480A5A2413FC6D588229CFB6A5B6D7D v6 = @"true";
LABEL_4:
      BOOL v7 = (var1_high & 2) == 0;
      break;
    default:
      if (a3->var0 == 133 && (a3->var1 & 0x400) != 0) {
        GetSearchCriterionInfoNumericValue();
      }
      GetSearchCriterionInfoBooleanValue();
      CFTimeZoneRef v5 = @"true";
      $A480A5A2413FC6D588229CFB6A5B6D7D v6 = @"false";
      BOOL v7 = 1;
      break;
  }
  if (v7) {
    return v6;
  }
  else {
    return v5;
  }
}

- (id)_addUnitesForCriterionInfo:(id *)a3
{
  unint64_t v3 = @"MB";
  unsigned int var0 = a3->var0;
  CFTimeZoneRef v5 = &stru_1F08D4D70;
  if (a3->var0 == 6) {
    CFTimeZoneRef v5 = @"Hz";
  }
  if (var0 != 12) {
    unint64_t v3 = v5;
  }
  if (var0 == 5) {
    return @"kbps";
  }
  else {
    return v3;
  }
}

- (id)_criteriaListDescription:(SearchCriteriaList *)a3 level:(int64_t)a4
{
  int v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  LockSearchCriteriaList();
  CFTimeZoneRef v5 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%*c", (3 * v4), 32);
  GetSearchCriteriaListOptions();
  int v6 = CountSearchCriteria();
  [v5 appendString:@"&&\n"];
  if (v6)
  {
    for (int i = 0; i != v6; ++i)
    {
      int SearchCriterionInfo = GetSearchCriterionInfo();
      if (SearchCriterionInfo)
      {
        int v9 = SearchCriterionInfo;
        CFAbsoluteTime v10 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134217984;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "Got an error getting search criterion info: %ld", buf, 0xCu);
        }
      }
    }
  }
  UnlockSearchCriteriaList();

  return v5;
}

- (id)criteriaListDescription
{
  unint64_t v3 = [(ML3Entity *)self valueForProperty:@"smart_criteria"];
  uint64_t v7 = 0;
  if ([v3 length])
  {
    id v4 = v3;
    MEMORY[0x1B3E92EF0]([v4 bytes], objc_msgSend(v4, "length"), &v7);
    CFTimeZoneRef v5 = [(ML3Container *)self _criteriaListDescription:v7 level:0];
  }
  else
  {
    CFTimeZoneRef v5 = @"No smart playlist criteria";
  }

  return v5;
}

@end