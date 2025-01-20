@interface PGSharingSuggestionOptions
+ (id)optionsForClient:(unint64_t)a3;
+ (unint64_t)_shareSheetSharingStream;
- (BOOL)debugMode;
- (BOOL)filterLowWeightResults;
- (BOOL)includeUnverified;
- (BOOL)replaceMergeCandidates;
- (BOOL)useContactSuggestion;
- (PGSharingSuggestionOptions)init;
- (id)description;
- (unint64_t)fetchLimit;
- (unint64_t)sharingStream;
- (void)setDebugMode:(BOOL)a3;
- (void)setFetchLimit:(unint64_t)a3;
- (void)setFilterLowWeightResults:(BOOL)a3;
- (void)setIncludeUnverified:(BOOL)a3;
- (void)setReplaceMergeCandidates:(BOOL)a3;
- (void)setSharingStream:(unint64_t)a3;
- (void)setUseContactSuggestion:(BOOL)a3;
@end

@implementation PGSharingSuggestionOptions

- (void)setUseContactSuggestion:(BOOL)a3
{
  self->_useContactSuggestion = a3;
}

- (BOOL)useContactSuggestion
{
  return self->_useContactSuggestion;
}

- (void)setFilterLowWeightResults:(BOOL)a3
{
  self->_filterLowWeightResults = a3;
}

- (BOOL)filterLowWeightResults
{
  return self->_filterLowWeightResults;
}

- (void)setIncludeUnverified:(BOOL)a3
{
  self->_includeUnverified = a3;
}

- (BOOL)includeUnverified
{
  return self->_includeUnverified;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setDebugMode:(BOOL)a3
{
  self->_debugMode = a3;
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (void)setReplaceMergeCandidates:(BOOL)a3
{
  self->_replaceMergeCandidates = a3;
}

- (BOOL)replaceMergeCandidates
{
  return self->_replaceMergeCandidates;
}

- (void)setSharingStream:(unint64_t)a3
{
  self->_sharingStream = a3;
}

- (unint64_t)sharingStream
{
  return self->_sharingStream;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PGSharingSuggestionOptions;
  uint64_t v4 = [(PGSharingSuggestionOptions *)&v10 description];
  v5 = (void *)v4;
  unint64_t v6 = self->_sharingStream - 1;
  if (v6 > 2) {
    v7 = &stru_1F283BC78;
  }
  else {
    v7 = off_1E68EAA28[v6];
  }
  v8 = [v3 stringWithFormat:@"%@ - sharingStream:%@ replaceMergeCandidates:%d debugMode:%d fetchLimit:%lu includeUnverified:%d filterLowWeightResults:%d useContactSuggestion:%d", v4, v7, self->_replaceMergeCandidates, self->_debugMode, self->_fetchLimit, self->_includeUnverified, self->_filterLowWeightResults, self->_useContactSuggestion];

  return v8;
}

- (PGSharingSuggestionOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGSharingSuggestionOptions;
  result = [(PGSharingSuggestionOptions *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_sharingStream = xmmword_1D1F4F250;
    *(_DWORD *)&result->_replaceMergeCandidates = 65537;
    result->_useContactSuggestion = 0;
  }
  return result;
}

+ (unint64_t)_shareSheetSharingStream
{
  return 3;
}

+ (id)optionsForClient:(unint64_t)a3
{
  v5 = objc_opt_new();
  unint64_t v6 = v5;
  if (a3 == 3)
  {
    [v5 setSharingStream:1];
    [v6 setUseContactSuggestion:0];
    [v6 setIncludeUnverified:1];
    [v6 setFetchLimit:30];
  }
  else if (a3 == 2)
  {
    objc_msgSend(v5, "setSharingStream:", objc_msgSend(a1, "_shareSheetSharingStream"));
    [v6 setUseContactSuggestion:1];
    [v6 setIncludeUnverified:0];
    [v6 setFetchLimit:10];
    [v6 setFilterLowWeightResults:1];
  }
  return v6;
}

@end