@interface VUIMPMediaItemEntityTypesOperation
- (BOOL)_canUseCheapEntityCheckWithMediaEntityType:(id)a3;
- (BOOL)_mediaLibraryHasEpisodes;
- (BOOL)_mediaLibraryHasHasHomeVideos;
- (BOOL)_mediaLibraryHasLocalMediaItems;
- (BOOL)_mediaLibraryHasMediaItemsWithQuery:(id)a3;
- (BOOL)_mediaLibraryHasMovieRentals;
- (BOOL)_mediaLibraryHasMovies;
- (MPMediaLibrary)mediaLibrary;
- (NSError)error;
- (VUIMPMediaItemEntityTypesOperation)init;
- (VUIMPMediaItemEntityTypesOperation)initWithMPMediaLibrary:(id)a3;
- (VUIMediaItemEntityTypesFetchResponse)response;
- (void)executionDidBegin;
- (void)setError:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation VUIMPMediaItemEntityTypesOperation

- (VUIMPMediaItemEntityTypesOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMPMediaItemEntityTypesOperation)initWithMPMediaLibrary:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
  }
  v9.receiver = self;
  v9.super_class = (Class)VUIMPMediaItemEntityTypesOperation;
  v6 = [(VUIMPMediaItemEntityTypesOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
  }

  return v7;
}

- (void)executionDidBegin
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  if ([(VUIMPMediaItemEntityTypesOperation *)self _mediaLibraryHasEpisodes])
  {
    v3 = +[VUIMediaEntityType episode];
    [v10 addObject:v3];
  }
  if ([(VUIMPMediaItemEntityTypesOperation *)self _mediaLibraryHasHasHomeVideos])
  {
    uint64_t v4 = +[VUIMediaEntityType homeVideo];
    [v10 addObject:v4];
  }
  if ([(VUIMPMediaItemEntityTypesOperation *)self _mediaLibraryHasMovies])
  {
    id v5 = +[VUIMediaEntityType movie];
    [v10 addObject:v5];
  }
  if ([(VUIMPMediaItemEntityTypesOperation *)self _mediaLibraryHasMovieRentals])
  {
    v6 = +[VUIMediaEntityType movieRental];
    [v10 addObject:v6];
  }
  v7 = +[VUIMediaLibraryUtilities mediaItemEntityTypesSortComparator];
  [v10 sortUsingComparator:v7];

  BOOL v8 = [(VUIMPMediaItemEntityTypesOperation *)self _mediaLibraryHasLocalMediaItems];
  objc_super v9 = objc_alloc_init(VUIMediaItemEntityTypesFetchResponse);
  [(VUIMediaItemEntityTypesFetchResponse *)v9 setMediaItemEntityTypes:v10];
  [(VUIMediaItemEntityTypesFetchResponse *)v9 setLocalMediaItemsAvailable:v8];
  [(VUIMPMediaItemEntityTypesOperation *)self setResponse:v9];
  [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
}

- (BOOL)_mediaLibraryHasMovies
{
  v3 = [(VUIMPMediaItemEntityTypesOperation *)self mediaLibrary];
  uint64_t v4 = +[VUIMediaEntityType movie];
  BOOL v5 = [(VUIMPMediaItemEntityTypesOperation *)self _canUseCheapEntityCheckWithMediaEntityType:v4];

  if (v5)
  {
    char v6 = [v3 hasMovies];
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F31970], "vui_moviesQueryWithMediaLibrary:", v3);
    char v6 = [(VUIMPMediaItemEntityTypesOperation *)self _mediaLibraryHasMediaItemsWithQuery:v7];
  }
  return v6;
}

- (BOOL)_mediaLibraryHasMovieRentals
{
  v3 = [(VUIMPMediaItemEntityTypesOperation *)self mediaLibrary];
  uint64_t v4 = +[VUIMediaEntityType movieRental];
  BOOL v5 = [(VUIMPMediaItemEntityTypesOperation *)self _canUseCheapEntityCheckWithMediaEntityType:v4];

  if (v5)
  {
    char v6 = [v3 hasMovieRentals];
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F31970], "vui_movieRentalsQueryWithMediaLibrary:", v3);
    char v6 = [(VUIMPMediaItemEntityTypesOperation *)self _mediaLibraryHasMediaItemsWithQuery:v7];
  }
  return v6;
}

- (BOOL)_mediaLibraryHasEpisodes
{
  v3 = [(VUIMPMediaItemEntityTypesOperation *)self mediaLibrary];
  uint64_t v4 = +[VUIMediaEntityType episode];
  BOOL v5 = [(VUIMPMediaItemEntityTypesOperation *)self _canUseCheapEntityCheckWithMediaEntityType:v4];

  if (v5)
  {
    char v6 = [v3 hasTVShows];
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F31970], "vui_episodesQueryWithMediaLibrary:", v3);
    char v6 = [(VUIMPMediaItemEntityTypesOperation *)self _mediaLibraryHasMediaItemsWithQuery:v7];
  }
  return v6;
}

- (BOOL)_mediaLibraryHasHasHomeVideos
{
  v3 = [(VUIMPMediaItemEntityTypesOperation *)self mediaLibrary];
  uint64_t v4 = +[VUIMediaEntityType homeVideo];
  BOOL v5 = [(VUIMPMediaItemEntityTypesOperation *)self _canUseCheapEntityCheckWithMediaEntityType:v4];

  if (v5)
  {
    char v6 = [v3 hasHomeVideos];
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F31970], "vui_homeVideosQueryWithMediaLibrary:", v3);
    char v6 = [(VUIMPMediaItemEntityTypesOperation *)self _mediaLibraryHasMediaItemsWithQuery:v7];
  }
  return v6;
}

- (BOOL)_mediaLibraryHasLocalMediaItems
{
  v3 = [(VUIMPMediaItemEntityTypesOperation *)self mediaLibrary];
  int v4 = objc_msgSend(v3, "vui_isDeviceMediaLibrary");

  if (!v4) {
    return 0;
  }
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F31960], "vui_isLocalPredicate:comparison:", 1, 0);
  char v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F31970]) initWithFilterPredicates:v6];
  BOOL v8 = [(VUIMPMediaItemEntityTypesOperation *)self _mediaLibraryHasMediaItemsWithQuery:v7];

  return v8;
}

- (BOOL)_canUseCheapEntityCheckWithMediaEntityType:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VUIMPMediaItemEntityTypesOperation *)self mediaLibrary];
  int v6 = objc_msgSend(v5, "vui_isDeviceMediaLibrary");

  if (v6)
  {
    uint64_t v7 = [v4 mediaCategoryType];
    if (v7 == 1)
    {
      BOOL v8 = [MEMORY[0x1E4FB3D20] sharedInstance];
      char v9 = [v8 allowsShowingUndownloadedTVShows];
    }
    else
    {
      if (v7)
      {
        BOOL v10 = 1;
        goto LABEL_9;
      }
      BOOL v8 = [MEMORY[0x1E4FB3D20] sharedInstance];
      char v9 = [v8 allowsShowingUndownloadedMovies];
    }
    BOOL v10 = v9;
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_9:

  return v10;
}

- (BOOL)_mediaLibraryHasMediaItemsWithQuery:(id)a3
{
  id v3 = a3;
  [v3 setEntityLimit:1];
  id v4 = [v3 items];

  LOBYTE(v3) = [v4 count] != 0;
  return (char)v3;
}

- (VUIMediaItemEntityTypesFetchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end