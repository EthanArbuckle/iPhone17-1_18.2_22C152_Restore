@interface PHAWallpaperSuggestionAnalyticsSender
+ ($1A9BA35ACF7822FDDDE3BD6714E1EA81)wallpaperSuggestionStatisticsFromSuggestions:(SEL)a3;
+ ($A3B2E143E1A03423F9FC703C010436DC)ambientSuggestionStatisticsFromSuggestions:(id)a3;
+ (id)analyticsPayloadForLibraryAnalysisSummary:(id)a3;
- (PHAWallpaperSuggestionAnalyticsSender)initWithGraphManager:(id)a3 libraryAnalysisSummary:(id)a4;
- (id)ambientGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:(id)a3;
- (id)ambientPeoplePetSummary;
- (id)existingAmbientSuggestionSummary;
- (id)existingWallpaperSuggestionSummary;
- (id)suggestionFetchOptionsWithLocalIdentifiers:(id)a3;
- (id)wallpaperGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:(id)a3;
- (id)wallpaperPeoplePetSummary;
- (int64_t)shufflePickerVisiblePeopleCount;
- (void)sendAmbientGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:(id)a3;
- (void)sendRefreshSummaryEventWithPosterConfiguration:(id)a3;
- (void)sendWallpaperGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:(id)a3;
@end

@implementation PHAWallpaperSuggestionAnalyticsSender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_shufflePeopleLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_topPeopleLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_informer, 0);
  objc_storeStrong((id *)&self->_libraryAnalysisSummary, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (id)ambientPeoplePetSummary
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"eligible_pets_count";
  v3 = [NSNumber numberWithInteger:self->_eligiblePetsCount];
  v7[1] = @"eligible_people_count";
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSSet count](self->_shufflePeopleLocalIdentifiers, "count"));
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)existingAmbientSuggestionSummary
{
  v28[2] = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)self->_loggingConnection);
  v4 = self->_loggingConnection;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "fetchExistingAmbientSuggesstionSummary", "", buf, 2u);
  }

  v6 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v7 = (void *)MEMORY[0x1E4F28BA0];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v28[0] = v8;
  v9 = [MEMORY[0x1E4F39310] predicateForAllAmbientSuggestions];
  v28[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v11 = [v7 andPredicateWithSubpredicates:v10];
  [v6 setPredicate:v11];

  v12 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v6];
  unint64_t v13 = [(id)objc_opt_class() ambientSuggestionStatisticsFromSuggestions:v12];
  unint64_t v15 = v14;
  unint64_t v16 = HIDWORD(v13);
  v26[0] = @"nature_suggestion_count";
  v17 = [NSNumber numberWithInt:v13];
  v27[0] = v17;
  v26[1] = @"city_suggestion_count";
  v18 = [NSNumber numberWithInt:v16];
  v27[1] = v18;
  v26[2] = @"people_suggestion_count";
  v19 = [NSNumber numberWithInt:HIDWORD(v15)];
  v27[2] = v19;
  v26[3] = @"pet_suggestion_count";
  v20 = [NSNumber numberWithInt:v15];
  v27[3] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  v22 = self->_loggingConnection;
  v23 = v22;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v23, OS_SIGNPOST_INTERVAL_END, v3, "fetchExistingAmbientSuggesstionSummary", "", buf, 2u);
  }

  return v21;
}

- (id)ambientGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:(id)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  id v5 = a3;
  os_signpost_id_t v6 = os_signpost_id_generate(loggingConnection);
  v7 = self->_loggingConnection;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "fetchAmbientGenerationSummary", "", v23, 2u);
  }

  v9 = [(PHAWallpaperSuggestionAnalyticsSender *)self suggestionFetchOptionsWithLocalIdentifiers:v5];

  v10 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v9];
  unint64_t v11 = [(id)objc_opt_class() ambientSuggestionStatisticsFromSuggestions:v10];
  unint64_t v13 = v12;
  unint64_t v14 = HIDWORD(v11);
  v24[0] = @"nature_suggestions_generated";
  unint64_t v15 = [NSNumber numberWithInt:v11];
  v25[0] = v15;
  v24[1] = @"city_suggestions_generated";
  unint64_t v16 = [NSNumber numberWithInt:v14];
  v25[1] = v16;
  v24[2] = @"people_suggestions_generated";
  v17 = [NSNumber numberWithInt:HIDWORD(v13)];
  v25[2] = v17;
  v24[3] = @"pet_suggestions_generated";
  v18 = [NSNumber numberWithInt:v13];
  v25[3] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];

  v20 = self->_loggingConnection;
  v21 = v20;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v20))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v21, OS_SIGNPOST_INTERVAL_END, v6, "fetchAmbientGenerationSummary", "", v23, 2u);
  }

  return v19;
}

- (int64_t)shufflePickerVisiblePeopleCount
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F39338]) initWithPhotoLibrary:self->_photoLibrary];
  v4 = [v3 personUUIDsWithNegativeFeedback];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = objc_msgSend(MEMORY[0x1E4F391F0], "localIdentifierWithUUID:", *(void *)(*((void *)&v16 + 1) + 8 * v10), (void)v16);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  unint64_t v12 = [MEMORY[0x1E4F8E858] fetchPersonLocalIdentifiersForSuggestionSubtype:652 photoLibrary:self->_photoLibrary];
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v12];
  [v13 minusSet:v5];
  int64_t v14 = [v13 count];

  return v14;
}

- (id)wallpaperPeoplePetSummary
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"eligible_pets_count";
  os_signpost_id_t v3 = [NSNumber numberWithInteger:self->_eligiblePetsCount];
  v10[0] = v3;
  v9[1] = @"gallery_eligible_people_count";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSSet count](self->_topPeopleLocalIdentifiers, "count"));
  v10[1] = v4;
  v9[2] = @"shuffle_eligible_people_count";
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSSet count](self->_shufflePeopleLocalIdentifiers, "count"));
  v10[2] = v5;
  v9[3] = @"shuffle_picker_people_count";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHAWallpaperSuggestionAnalyticsSender shufflePickerVisiblePeopleCount](self, "shufflePickerVisiblePeopleCount"));
  v10[3] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (id)existingWallpaperSuggestionSummary
{
  v51[2] = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)self->_loggingConnection);
  v4 = self->_loggingConnection;
  id v5 = v4;
  unint64_t v43 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "fetchExistingSuggesstionSummary", "", buf, 2u);
  }
  os_signpost_id_t spid = v3;

  id v6 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v51[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F39310] predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper];
  v51[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  unint64_t v11 = [v7 andPredicateWithSubpredicates:v10];
  [v6 setPredicate:v11];

  v42 = v6;
  uint64_t v12 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v6];
  unsigned int v48 = 0;
  *(_OWORD *)buf = 0u;
  long long v47 = 0u;
  unint64_t v13 = objc_opt_class();
  v44 = self;
  v41 = (void *)v12;
  if (v13)
  {
    [v13 wallpaperSuggestionStatisticsFromSuggestions:v12];
    uint64_t v14 = *(int *)&buf[12];
    uint64_t v15 = SDWORD1(v47);
    uint64_t v16 = SHIDWORD(v47);
    uint64_t v17 = *(unsigned int *)buf;
    uint64_t v18 = *(int *)&buf[4];
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
    uint64_t v15 = 0;
    uint64_t v14 = 0;
    uint64_t v18 = 0;
    unsigned int v48 = 0;
    *(_OWORD *)buf = 0u;
    long long v47 = 0u;
  }
  BOOL v19 = *MEMORY[0x1E4F8EAE0] <= v18;
  BOOL v20 = *MEMORY[0x1E4F8EAE0] <= v14;
  BOOL v35 = *MEMORY[0x1E4F8EAE0] <= v15;
  BOOL v36 = *MEMORY[0x1E4F8EAE0] <= v16;
  v49[0] = @"top_people_suggestion_count";
  v40 = [NSNumber numberWithInt:v17];
  v50[0] = v40;
  v49[1] = @"people_suggestion_count";
  v39 = [NSNumber numberWithInt:*(unsigned int *)&buf[4]];
  v50[1] = v39;
  v49[2] = @"top_pet_suggestion_count";
  v38 = [NSNumber numberWithInt:*(unsigned int *)&buf[8]];
  v50[2] = v38;
  v49[3] = @"pet_suggestion_count";
  uint64_t v21 = [NSNumber numberWithInt:*(unsigned int *)&buf[12]];
  v50[3] = v21;
  v49[4] = @"top_nature_suggestion_count";
  v22 = [NSNumber numberWithInt:v47];
  v50[4] = v22;
  v49[5] = @"nature_suggestion_count";
  v23 = [NSNumber numberWithInt:DWORD1(v47)];
  v50[5] = v23;
  v49[6] = @"top_urban_suggestion_count";
  v24 = [NSNumber numberWithInt:DWORD2(v47)];
  v50[6] = v24;
  v49[7] = @"urban_suggestion_count";
  v25 = [NSNumber numberWithInt:HIDWORD(v47)];
  v50[7] = v25;
  v49[8] = @"me_suggestion_count";
  v26 = [NSNumber numberWithInt:v48];
  v50[8] = v26;
  v49[9] = @"found_min_shuffle_people_suggestion";
  v27 = [NSNumber numberWithBool:v19];
  v50[9] = v27;
  v49[10] = @"found_min_shuffle_pet_suggestion";
  v28 = [NSNumber numberWithBool:v20];
  v50[10] = v28;
  v49[11] = @"found_min_shuffle_nature_suggestion";
  v29 = [NSNumber numberWithBool:v35];
  v50[11] = v29;
  v49[12] = @"found_min_shuffle_city_suggestion";
  v30 = [NSNumber numberWithBool:v36];
  v50[12] = v30;
  id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:13];

  v31 = v44->_loggingConnection;
  v32 = v31;
  if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)v45 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v32, OS_SIGNPOST_INTERVAL_END, spid, "fetchExistingSuggesstionSummary", "", v45, 2u);
  }

  return v37;
}

- (id)wallpaperGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:(id)a3
{
  v35[9] = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  id v5 = a3;
  os_signpost_id_t v6 = os_signpost_id_generate(loggingConnection);
  uint64_t v7 = self->_loggingConnection;
  uint64_t v8 = v7;
  unint64_t v29 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "fetchGeneratedSuggesstionSummary", "", buf, 2u);
  }

  uint64_t v9 = [(PHAWallpaperSuggestionAnalyticsSender *)self suggestionFetchOptionsWithLocalIdentifiers:v5];

  v28 = (void *)v9;
  uint64_t v10 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v9];
  unsigned int v33 = 0;
  *(_OWORD *)buf = 0u;
  long long v32 = 0u;
  unint64_t v11 = objc_opt_class();
  os_signpost_id_t spid = v6;
  v27 = (void *)v10;
  if (v11)
  {
    [v11 wallpaperSuggestionStatisticsFromSuggestions:v10];
    uint64_t v12 = *(unsigned int *)buf;
  }
  else
  {
    uint64_t v12 = 0;
    unsigned int v33 = 0;
    *(_OWORD *)buf = 0u;
    long long v32 = 0u;
  }
  v34[0] = @"top_people_suggestions_generated";
  unint64_t v13 = [NSNumber numberWithInt:v12];
  v35[0] = v13;
  v34[1] = @"people_suggestions_generated";
  uint64_t v14 = [NSNumber numberWithInt:*(unsigned int *)&buf[4]];
  v35[1] = v14;
  v34[2] = @"top_pet_suggestions_generated";
  uint64_t v15 = [NSNumber numberWithInt:*(unsigned int *)&buf[8]];
  v35[2] = v15;
  v34[3] = @"pet_suggestions_generated";
  uint64_t v16 = [NSNumber numberWithInt:*(unsigned int *)&buf[12]];
  v35[3] = v16;
  v34[4] = @"top_nature_suggestions_generated";
  uint64_t v17 = [NSNumber numberWithInt:v32];
  v35[4] = v17;
  v34[5] = @"nature_suggestions_generated";
  uint64_t v18 = [NSNumber numberWithInt:DWORD1(v32)];
  v35[5] = v18;
  v34[6] = @"top_urban_suggestions_generated";
  BOOL v19 = [NSNumber numberWithInt:DWORD2(v32)];
  v35[6] = v19;
  v34[7] = @"urban_suggestions_generated";
  BOOL v20 = [NSNumber numberWithInt:HIDWORD(v32)];
  v35[7] = v20;
  v34[8] = @"me_suggestions_generated";
  uint64_t v21 = [NSNumber numberWithInt:v33];
  v35[8] = v21;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:9];

  v22 = self->_loggingConnection;
  v23 = v22;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v22))
  {
    *(_WORD *)v30 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v23, OS_SIGNPOST_INTERVAL_END, spid, "fetchGeneratedSuggesstionSummary", "", v30, 2u);
  }

  return v26;
}

- (id)suggestionFetchOptionsWithLocalIdentifiers:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  photoLibrary = self->_photoLibrary;
  id v4 = a3;
  id v5 = [(PHPhotoLibrary *)photoLibrary librarySpecificFetchOptions];
  os_signpost_id_t v6 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v12[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"localIdentifier", v4];

  v12[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v10 = [v6 andPredicateWithSubpredicates:v9];
  [v5 setPredicate:v10];

  return v5;
}

- (void)sendAmbientGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:(id)a3
{
  loggingConnection = self->_loggingConnection;
  id v5 = a3;
  os_signpost_id_t v6 = os_signpost_id_generate(loggingConnection);
  uint64_t v7 = self->_loggingConnection;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "sendAmbientGenerationSummary", "", buf, 2u);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = [(PHAWallpaperSuggestionAnalyticsSender *)self ambientGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:v5];

  [v9 addEntriesFromDictionary:v10];
  unint64_t v11 = [(PHAWallpaperSuggestionAnalyticsSender *)self existingAmbientSuggestionSummary];
  [v9 addEntriesFromDictionary:v11];

  uint64_t v12 = [(PHAWallpaperSuggestionAnalyticsSender *)self ambientPeoplePetSummary];
  [v9 addEntriesFromDictionary:v12];

  unint64_t v13 = [(id)objc_opt_class() analyticsPayloadForLibraryAnalysisSummary:self->_libraryAnalysisSummary];
  [v9 addEntriesFromDictionary:v13];

  [(CPAnalytics *)self->_analytics sendEvent:@"com.apple.photos.ambient.generationSummary" withPayload:v9];
  uint64_t v14 = self->_loggingConnection;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionAnalyticsSender] Sent Ambient Generation Summary Event", v18, 2u);
    uint64_t v14 = self->_loggingConnection;
  }
  uint64_t v15 = v14;
  uint64_t v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v16, OS_SIGNPOST_INTERVAL_END, v6, "sendAmbientGenerationSummary", "", v17, 2u);
  }
}

- (void)sendRefreshSummaryEventWithPosterConfiguration:(id)a3
{
  loggingConnection = self->_loggingConnection;
  id v5 = a3;
  os_signpost_id_t v6 = os_signpost_id_generate(loggingConnection);
  uint64_t v7 = self->_loggingConnection;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "sendRefreshSummary", "", buf, 2u);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = [(PHAWallpaperSuggestionAnalyticsSender *)self existingWallpaperSuggestionSummary];
  [v9 addEntriesFromDictionary:v10];

  unint64_t v11 = [(PHAWallpaperSuggestionAnalyticsSender *)self wallpaperPeoplePetSummary];
  [v9 addEntriesFromDictionary:v11];

  uint64_t v12 = [(id)objc_opt_class() analyticsPayloadForLibraryAnalysisSummary:self->_libraryAnalysisSummary];
  [v9 addEntriesFromDictionary:v12];

  unint64_t v13 = [v5 analyticsPayload];

  [v9 addEntriesFromDictionary:v13];
  [(CPAnalytics *)self->_analytics sendEvent:@"com.apple.photos.wallpaper.refreshSummary" withPayload:v9];
  uint64_t v14 = self->_loggingConnection;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionAnalyticsSender] Sent Refresh Summary Event", v18, 2u);
    uint64_t v14 = self->_loggingConnection;
  }
  uint64_t v15 = v14;
  uint64_t v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v16, OS_SIGNPOST_INTERVAL_END, v6, "sendRefreshSummary", "", v17, 2u);
  }
}

- (void)sendWallpaperGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:(id)a3
{
  loggingConnection = self->_loggingConnection;
  id v5 = a3;
  os_signpost_id_t v6 = os_signpost_id_generate(loggingConnection);
  uint64_t v7 = self->_loggingConnection;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "sendGenerationSummary", "", buf, 2u);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = [(PHAWallpaperSuggestionAnalyticsSender *)self wallpaperGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:v5];

  [v9 addEntriesFromDictionary:v10];
  unint64_t v11 = [(PHAWallpaperSuggestionAnalyticsSender *)self existingWallpaperSuggestionSummary];
  [v9 addEntriesFromDictionary:v11];

  uint64_t v12 = [(PHAWallpaperSuggestionAnalyticsSender *)self wallpaperPeoplePetSummary];
  [v9 addEntriesFromDictionary:v12];

  unint64_t v13 = [(id)objc_opt_class() analyticsPayloadForLibraryAnalysisSummary:self->_libraryAnalysisSummary];
  [v9 addEntriesFromDictionary:v13];

  [(CPAnalytics *)self->_analytics sendEvent:@"com.apple.photos.wallpaper.generationSummary" withPayload:v9];
  uint64_t v14 = self->_loggingConnection;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionAnalyticsSender] Sent Wallpaper Generation Summary Event", v18, 2u);
    uint64_t v14 = self->_loggingConnection;
  }
  uint64_t v15 = v14;
  uint64_t v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v16, OS_SIGNPOST_INTERVAL_END, v6, "sendGenerationSummary", "", v17, 2u);
  }
}

- (PHAWallpaperSuggestionAnalyticsSender)initWithGraphManager:(id)a3 libraryAnalysisSummary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PHAWallpaperSuggestionAnalyticsSender;
  uint64_t v8 = [(PHAWallpaperSuggestionAnalyticsSender *)&v28 init];
  if (v8)
  {
    uint64_t v9 = [v6 workingContext];
    workingContext = v8->_workingContext;
    v8->_workingContext = (PGManagerWorkingContext *)v9;

    uint64_t v11 = [v6 photoLibrary];
    photoLibrary = v8->_photoLibrary;
    v8->_photoLibrary = (PHPhotoLibrary *)v11;

    unint64_t v13 = [v6 workingContext];
    uint64_t v14 = [v13 loggingConnection];
    loggingConnection = v8->_loggingConnection;
    v8->_loggingConnection = (OS_os_log *)v14;

    uint64_t v16 = [v6 analytics];
    analytics = v8->_analytics;
    v8->_analytics = (CPAnalytics *)v16;

    objc_storeStrong((id *)&v8->_libraryAnalysisSummary, a4);
    if ([v6 isReady])
    {
      uint64_t v18 = [objc_alloc(MEMORY[0x1E4F8D980]) initWithWorkingContext:v8->_workingContext];
      informer = v8->_informer;
      v8->_informer = (PGWallpaperSuggestionInformer *)v18;

      uint64_t v20 = [(PGWallpaperSuggestionInformer *)v8->_informer personLocalIdentifiersForTopPeople:1];
      topPeopleLocalIdentifiers = v8->_topPeopleLocalIdentifiers;
      v8->_topPeopleLocalIdentifiers = (NSSet *)v20;

      uint64_t v22 = [(PGWallpaperSuggestionInformer *)v8->_informer personLocalIdentifiersForTopPeople:0];
      shufflePeopleLocalIdentifiers = v8->_shufflePeopleLocalIdentifiers;
      v8->_shufflePeopleLocalIdentifiers = (NSSet *)v22;
    }
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v8->_photoLibrary];
    curationContext = v8->_curationContext;
    v8->_curationContext = (CLSCurationContext *)v24;

    id v26 = [MEMORY[0x1E4F8D6C0] fetchInterestingEligiblePetsForWallpaperWithWorkingContext:v8->_workingContext curationContext:v8->_curationContext];
    v8->_eligiblePetsCount = [v26 count];
  }
  return v8;
}

+ ($A3B2E143E1A03423F9FC703C010436DC)ambientSuggestionStatisticsFromSuggestions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    unsigned int v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 subtype] == 801)
        {
          ++v8;
        }
        else if ([v11 subtype] == 802)
        {
          uint64_t v7 = (v7 + 1);
        }
        else if ([v11 subtype] == 803)
        {
          unint64_t v6 = (v6 + 1) | v6 & 0xFFFFFFFF00000000;
        }
        else if ([v11 subtype] == 804)
        {
          v6 += 0x100000000;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    unsigned int v8 = 0;
  }

  unint64_t v12 = v8 | (unint64_t)(v7 << 32);
  unint64_t v13 = v6;
  result.var2 = v13;
  result.var3 = HIDWORD(v13);
  result.var0 = v12;
  result.var1 = HIDWORD(v12);
  return result;
}

+ (id)analyticsPayloadForLibraryAnalysisSummary:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 ratioOfAssetsAtOrAboveSceneAnalysisVersion];
  uint64_t v5 = (uint64_t)(v4 * 100.0);
  [v3 ratioOfAssetsAtOrAboveFaceAnalysisVersion];
  uint64_t v7 = (uint64_t)(v6 * 100.0);
  v15[0] = @"percentage_of_assets_at_or_above_scene_analysis_version";
  unsigned int v8 = [NSNumber numberWithInteger:v5];
  v16[0] = v8;
  v15[1] = @"percentage_of_assets_at_or_above_face_analysis_version";
  uint64_t v9 = [NSNumber numberWithInteger:v7];
  v16[1] = v9;
  v15[2] = @"library_is_processed_enough";
  uint64_t v10 = NSNumber;
  uint64_t v11 = [v3 libraryIsProcessedEnough];

  unint64_t v12 = [v10 numberWithBool:v11];
  v16[2] = v12;
  unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  return v13;
}

+ ($1A9BA35ACF7822FDDDE3BD6714E1EA81)wallpaperSuggestionStatisticsFromSuggestions:(SEL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  retstr->var8 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    int v16 = 0;
    int v11 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v5);
        }
        long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v14 subtype] == 602)
        {
          retstr->var0 = ++v11;
        }
        else if ([v14 subtype] == 652)
        {
          retstr->var1 = ++v8;
        }
        else if ([v14 subtype] == 603)
        {
          retstr->var2 = ++v9;
        }
        else if ([v14 subtype] == 653)
        {
          retstr->var3 = ++v10;
        }
        else if ([v14 subtype] == 604)
        {
          retstr->var4 = ++HIDWORD(v18);
        }
        else if ([v14 subtype] == 654)
        {
          LODWORD(v18) = v18 + 1;
          retstr->var5 = v18;
        }
        else if ([v14 subtype] == 605)
        {
          retstr->var6 = ++HIDWORD(v17);
        }
        else if ([v14 subtype] == 655)
        {
          LODWORD(v17) = v17 + 1;
          retstr->var7 = v17;
        }
        else if ([v14 subtype] == 901)
        {
          retstr->var8 = ++v16;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return result;
}

@end