@interface PGSuggestionOptions
- (BOOL)allowNotification;
- (BOOL)clearFeaturedSuggestions;
- (BOOL)computeReasons;
- (BOOL)discardGeneratedSuggestions;
- (BOOL)generateInvalidSuggestions;
- (BOOL)ignoreCollisionsWithExistingSuggestions;
- (BOOL)ignoreCollisionsWithSameBatchSuggestions;
- (BOOL)noLimitPerFeature;
- (BOOL)shouldProcessExistingSuggestions;
- (NSDate)localToday;
- (NSDate)universalEndDate;
- (NSDate)universalEndDateForWholeLibrarySuggestions;
- (NSDate)universalStartDate;
- (NSDictionary)additionalOptions;
- (NSIndexSet)suggestionSubtypeBlocklist;
- (NSIndexSet)suggestionSubtypeWhitelist;
- (NSIndexSet)suggestionTypeBlocklist;
- (NSIndexSet)suggestionTypeWhitelist;
- (PGSuggestionOptions)init;
- (PGSuggestionOptions)initWithOptionsDictionary:(id)a3;
- (unint64_t)maximumNumberOfSuggestions;
- (void)setAdditionalOptions:(id)a3;
- (void)setAllowNotification:(BOOL)a3;
- (void)setClearFeaturedSuggestions:(BOOL)a3;
- (void)setComputeReasons:(BOOL)a3;
- (void)setDefaultStartAndEndDatesIfNeeded;
- (void)setDefaultStartAndEndDatesIfNeededWithNumberOfDays:(int64_t)a3;
- (void)setDiscardGeneratedSuggestions:(BOOL)a3;
- (void)setGenerateInvalidSuggestions:(BOOL)a3;
- (void)setIgnoreCollisionsWithExistingSuggestions:(BOOL)a3;
- (void)setIgnoreCollisionsWithSameBatchSuggestions:(BOOL)a3;
- (void)setLocalToday:(id)a3;
- (void)setMaximumNumberOfSuggestions:(unint64_t)a3;
- (void)setNoLimitPerFeature:(BOOL)a3;
- (void)setShouldProcessExistingSuggestions:(BOOL)a3;
- (void)setSuggestionSubtypeBlocklist:(id)a3;
- (void)setSuggestionSubtypeWhitelist:(id)a3;
- (void)setSuggestionTypeBlocklist:(id)a3;
- (void)setSuggestionTypeWhitelist:(id)a3;
- (void)setUniversalEndDate:(id)a3;
- (void)setUniversalEndDateForWholeLibrarySuggestions:(id)a3;
- (void)setUniversalStartDate:(id)a3;
@end

@implementation PGSuggestionOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalOptions, 0);
  objc_storeStrong((id *)&self->_suggestionSubtypeBlocklist, 0);
  objc_storeStrong((id *)&self->_suggestionTypeBlocklist, 0);
  objc_storeStrong((id *)&self->_suggestionSubtypeWhitelist, 0);
  objc_storeStrong((id *)&self->_suggestionTypeWhitelist, 0);
  objc_storeStrong((id *)&self->_universalEndDateForWholeLibrarySuggestions, 0);
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
  objc_storeStrong((id *)&self->_localToday, 0);
}

- (void)setNoLimitPerFeature:(BOOL)a3
{
  self->_noLimitPerFeature = a3;
}

- (BOOL)noLimitPerFeature
{
  return self->_noLimitPerFeature;
}

- (void)setClearFeaturedSuggestions:(BOOL)a3
{
  self->_clearFeaturedSuggestions = a3;
}

- (BOOL)clearFeaturedSuggestions
{
  return self->_clearFeaturedSuggestions;
}

- (void)setAdditionalOptions:(id)a3
{
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setComputeReasons:(BOOL)a3
{
  self->_computeReasons = a3;
}

- (BOOL)computeReasons
{
  return self->_computeReasons;
}

- (void)setGenerateInvalidSuggestions:(BOOL)a3
{
  self->_generatesInvalidSuggestions = a3;
}

- (BOOL)generateInvalidSuggestions
{
  return self->_generatesInvalidSuggestions;
}

- (void)setSuggestionSubtypeBlocklist:(id)a3
{
}

- (NSIndexSet)suggestionSubtypeBlocklist
{
  return self->_suggestionSubtypeBlocklist;
}

- (void)setSuggestionTypeBlocklist:(id)a3
{
}

- (NSIndexSet)suggestionTypeBlocklist
{
  return self->_suggestionTypeBlocklist;
}

- (void)setSuggestionSubtypeWhitelist:(id)a3
{
}

- (NSIndexSet)suggestionSubtypeWhitelist
{
  return self->_suggestionSubtypeWhitelist;
}

- (void)setSuggestionTypeWhitelist:(id)a3
{
}

- (NSIndexSet)suggestionTypeWhitelist
{
  return self->_suggestionTypeWhitelist;
}

- (void)setIgnoreCollisionsWithSameBatchSuggestions:(BOOL)a3
{
  self->_ignoreCollisionsWithSameBatchSuggestions = a3;
}

- (BOOL)ignoreCollisionsWithSameBatchSuggestions
{
  return self->_ignoreCollisionsWithSameBatchSuggestions;
}

- (void)setIgnoreCollisionsWithExistingSuggestions:(BOOL)a3
{
  self->_ignoreCollisionsWithExistingSuggestions = a3;
}

- (BOOL)ignoreCollisionsWithExistingSuggestions
{
  return self->_ignoreCollisionsWithExistingSuggestions;
}

- (void)setDiscardGeneratedSuggestions:(BOOL)a3
{
  self->_discardGeneratedSuggestions = a3;
}

- (BOOL)discardGeneratedSuggestions
{
  return self->_discardGeneratedSuggestions;
}

- (void)setShouldProcessExistingSuggestions:(BOOL)a3
{
  self->_shouldProcessExistingSuggestions = a3;
}

- (BOOL)shouldProcessExistingSuggestions
{
  return self->_shouldProcessExistingSuggestions;
}

- (void)setAllowNotification:(BOOL)a3
{
  self->_allowNotification = a3;
}

- (BOOL)allowNotification
{
  return self->_allowNotification;
}

- (void)setMaximumNumberOfSuggestions:(unint64_t)a3
{
  self->_maximumNumberOfSuggestions = a3;
}

- (unint64_t)maximumNumberOfSuggestions
{
  return self->_maximumNumberOfSuggestions;
}

- (void)setUniversalEndDateForWholeLibrarySuggestions:(id)a3
{
}

- (NSDate)universalEndDateForWholeLibrarySuggestions
{
  return self->_universalEndDateForWholeLibrarySuggestions;
}

- (void)setUniversalEndDate:(id)a3
{
}

- (NSDate)universalEndDate
{
  return self->_universalEndDate;
}

- (void)setUniversalStartDate:(id)a3
{
}

- (NSDate)universalStartDate
{
  return self->_universalStartDate;
}

- (void)setLocalToday:(id)a3
{
}

- (NSDate)localToday
{
  return self->_localToday;
}

- (void)setDefaultStartAndEndDatesIfNeededWithNumberOfDays:(int64_t)a3
{
  id v13 = [(PGSuggestionOptions *)self universalStartDate];
  v5 = [(PGSuggestionOptions *)self universalEndDate];
  if (v5)
  {
    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v8 = (void *)MEMORY[0x1E4F76C68];
  if (v13)
  {
    v5 = [MEMORY[0x1E4F76C68] dateByAddingDays:a3 toDate:v13];
  }
  else
  {
    v9 = [(PGSuggestionOptions *)self localToday];
    v10 = [v8 startOfDayForDate:v9];

    v11 = (void *)MEMORY[0x1E4F76C68];
    v12 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    v5 = [v11 universalDateFromLocalDate:v10 inTimeZone:v12];
  }
  [(PGSuggestionOptions *)self setUniversalEndDate:v5];
  if (!v13)
  {
LABEL_3:
    id v13 = [MEMORY[0x1E4F76C68] dateByAddingDays:-a3 toDate:v5];
    -[PGSuggestionOptions setUniversalStartDate:](self, "setUniversalStartDate:");
  }
LABEL_4:
  v6 = [(PGSuggestionOptions *)self universalEndDateForWholeLibrarySuggestions];

  if (!v6)
  {
    v7 = [(PGSuggestionOptions *)self universalStartDate];
    [(PGSuggestionOptions *)self setUniversalEndDateForWholeLibrarySuggestions:v7];
  }
}

- (void)setDefaultStartAndEndDatesIfNeeded
{
}

- (PGSuggestionOptions)initWithOptionsDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(PGSuggestionOptions *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B100]];
    if (v6) {
      objc_storeStrong((id *)&v5->_localToday, v6);
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B0F0]];
    universalStartDate = v5->_universalStartDate;
    v5->_universalStartDate = (NSDate *)v7;

    uint64_t v9 = *MEMORY[0x1E4F8B0B8];
    uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B0B8]];
    universalEndDate = v5->_universalEndDate;
    v5->_universalEndDate = (NSDate *)v10;

    v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B0B0]];
    id v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      v14 = [v4 objectForKeyedSubscript:v9];
    }
    universalEndDateForWholeLibrarySuggestions = v5->_universalEndDateForWholeLibrarySuggestions;
    v5->_universalEndDateForWholeLibrarySuggestions = v14;

    v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B098]];
    v17 = v16;
    if (v16) {
      v5->_allowNotification = [v16 BOOLValue];
    }
    v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B0C8]];
    v5->_ignoreCollisionsWithExistingSuggestions = [v18 BOOLValue];

    v19 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B0D0]];
    v5->_ignoreCollisionsWithSameBatchSuggestions = [v19 BOOLValue];

    v20 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B0A0]];
    v5->_computeReasons = [v20 BOOLValue];

    v21 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B0E8]];
    v5->_shouldProcessExistingSuggestions = [v21 BOOLValue];

    v22 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B0A8]];
    v5->_discardGeneratedSuggestions = [v22 BOOLValue];

    v23 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B108]];
    unsigned __int16 v24 = [v23 integerValue];

    v25 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B0F8]];
    unsigned __int16 v26 = [v25 integerValue];

    if (v24)
    {
      uint64_t v27 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v24];
      suggestionTypeWhitelist = v5->_suggestionTypeWhitelist;
      v5->_suggestionTypeWhitelist = (NSIndexSet *)v27;
    }
    if (v26)
    {
      uint64_t v29 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v26];
      suggestionSubtypeWhitelist = v5->_suggestionSubtypeWhitelist;
      v5->_suggestionSubtypeWhitelist = (NSIndexSet *)v29;
    }
    v31 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B0E0]];
    uint64_t v32 = [v31 unsignedIntegerValue];

    if (v32) {
      v5->_maximumNumberOfSuggestions = v32;
    }
    uint64_t v33 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B090]];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = (NSDictionary *)v33;

    v35 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B0D8]];
    v5->_noLimitPerFeature = [v35 BOOLValue];
  }
  return v5;
}

- (PGSuggestionOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)PGSuggestionOptions;
  v2 = [(PGSuggestionOptions *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F76C68] currentLocalDate];
    localToday = v2->_localToday;
    v2->_localToday = (NSDate *)v3;

    v2->_maximumNumberOfSuggestions = -1;
    v2->_shouldProcessExistingSuggestions = 1;
  }
  return v2;
}

@end