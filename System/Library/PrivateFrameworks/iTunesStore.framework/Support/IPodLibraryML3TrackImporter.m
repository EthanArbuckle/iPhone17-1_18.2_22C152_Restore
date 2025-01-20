@interface IPodLibraryML3TrackImporter
- (BOOL)importLibraryItems:(id)a3 toMusicLibrary:(id)a4 importedItemPids:(id)a5;
- (id)_absoluteTimeValueForDateValue:(id)a3;
- (id)_currentTrackChapterDataForTrackPid:(int64_t)a3 libraryItem:(id)a4 usingLibrary:(id)a5;
- (id)_currentTrackMovieInfoFromMetadata:(id)a3;
- (id)_extendedContentRatingStringForLibraryItem:(id)a3;
- (id)_importPropertiesFromLibraryItem:(id)a3 fromAccount:(id)a4 usingLibrary:(id)a5;
- (id)_storeArtworkTokenFromLibraryItem:(id)a3 metadata:(id)a4;
- (id)_stringValueForURLValue:(id)a3;
@end

@implementation IPodLibraryML3TrackImporter

- (BOOL)importLibraryItems:(id)a3 toMusicLibrary:(id)a4 importedItemPids:(id)a5
{
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  id v9 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
  if ([a3 count])
  {
    v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
    long long v32 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
    id v11 = [a3 countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v30;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(a3);
          }
          [(NSMutableArray *)v10 addObject:[(IPodLibraryML3TrackImporter *)self _importPropertiesFromLibraryItem:*(void *)(*((void *)&v29 + 1) + 8 * i) fromAccount:v9 usingLibrary:a4]];
        }
        id v11 = [a3 countByEnumeratingWithState:&v29 objects:v43 count:16];
      }
      while (v11);
    }
    CFStringRef v41 = @"track_items";
    v42 = v10;
    uint64_t v28 = 0;
    v14 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1], 1, &v28);
    if (v28)
    {
      id v15 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig];
      }
      unsigned int v16 = [v15 shouldLog];
      unsigned int v17 = [v15 shouldLogToDisk];
      v18 = [v15 OSLogObject];
      if (v17) {
        v16 |= 2u;
      }
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        v16 &= 2u;
      }
      if (v16)
      {
        uint64_t v19 = objc_opt_class();
        int v37 = 138543618;
        uint64_t v38 = v19;
        __int16 v39 = 2114;
        uint64_t v40 = v28;
        LODWORD(v26) = 22;
        uint64_t v20 = _os_log_send_and_compose_impl();
        if (v20)
        {
          v21 = (void *)v20;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v37, v26);
          free(v21);
          SSFileLog();
        }
      }
    }
    v22 = dispatch_semaphore_create(0);
    global_queue = dispatch_get_global_queue(-32768, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B4EB0;
    block[3] = &unk_1003A9250;
    block[4] = v14;
    block[5] = self;
    block[6] = a5;
    block[7] = a3;
    block[8] = v22;
    block[9] = &v33;
    dispatch_async(global_queue, block);
    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v22);
  }
  char v24 = *((unsigned char *)v34 + 24);
  _Block_object_dispose(&v33, 8);
  return v24;
}

- (id)_importPropertiesFromLibraryItem:(id)a3 fromAccount:(id)a4 usingLibrary:(id)a5
{
  v8 = +[NSMutableDictionary dictionaryWithCapacity:100];
  id v9 = [a3 itemMetadata];
  uint64_t v10 = +[IPodLibraryItem mediaTypeForStoreDownload:v9];
  if ([a3 libraryPersistentIdentifier])
  {
    id v11 = [a3 libraryPersistentIdentifier];
LABEL_6:
    [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithLongLong:v11] forKey:&off_1003C9540];
    goto LABEL_7;
  }
  if ([a3 itemDownloadIdentifier])
  {
    id v12 = +[ML3Track anyInLibrary:predicate:](ML3Track, "anyInLibrary:predicate:", a5, +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", ML3TrackPropertyDownloadIdentifier, [a3 itemDownloadIdentifier]));
    if (v12)
    {
      id v11 = [v12 persistentID];
      goto LABEL_6;
    }
  }
LABEL_7:
  [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithUnsignedInt:v10] forKey:&off_1003C9558];
  if ([v9 collectionIndexInCollectionGroup]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 collectionIndexInCollectionGroup], &off_1003C9570);
  }
  if ([v9 indexInCollection]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 indexInCollection], &off_1003C9588);
  }
  if ([v9 episodeSortIdentifier]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 episodeSortIdentifier], &off_1003C95A0);
  }
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C95D0];
  [(NSMutableDictionary *)v8 setObject:&__kCFBooleanFalse forKey:&off_1003C95E8];
  if ([v9 artistName]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 artistName], &off_1003C9600);
  }
  if ([v9 seriesName]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 seriesName], &off_1003C9618);
  }
  if ([v9 collectionArtistName]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 collectionArtistName], &off_1003C9630);
  }
  if ([v9 genre]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 genre], &off_1003C9648);
  }
  if ([a3 itemMediaPath]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [a3 itemMediaPath], &off_1003C9660);
  }
  if ([v9 collectionName]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 collectionName], &off_1003C9678);
  }
  if ([v9 composerName]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 composerName], &off_1003C9690);
  }
  if ([v9 showComposer]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 showComposer], &off_1003C96A8);
  }
  if ([v9 isMusicShow]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isMusicShow]), &off_1003C96C0);
  }
  if ([v9 title]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 title], &off_1003C96D8);
  }
  if ([v9 numberOfCollectionsInCollectionGroup]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 numberOfCollectionsInCollectionGroup], &off_1003C96F0);
  }
  if ([v9 numberOfItemsInCollection]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 numberOfItemsInCollection], &off_1003C9708);
  }
  if ([v9 releaseYear]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 releaseYear], &off_1003C9720);
  }
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9738];
  [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithBool:(v10 >> 1) & 1] forKey:&off_1003C9750];
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isCompilation]), &off_1003C9768);
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", -[IPodLibraryML3TrackImporter _absoluteTimeValueForDateValue:](self, "_absoluteTimeValueForDateValue:", [v9 purchaseDate]), &off_1003C9780);
  [(NSMutableDictionary *)v8 setObject:&off_1003C9FD0 forKey:&off_1003C9798];
  if ([v9 isExplicitContent]) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = (uint64_t)objc_msgSend(objc_msgSend(v9, "contentRating"), "rank");
  }
  [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithInteger:v13] forKey:&off_1003C97B0];
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(objc_msgSend(v9, "contentRating"), "rank")), &off_1003C97C8);
  [(NSMutableDictionary *)v8 setObject:&__kCFBooleanFalse forKey:&off_1003C97E0];
  if ([v9 durationInMilliseconds]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 durationInMilliseconds], &off_1003C97F8);
  }
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9810];
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9828];
  if ([v9 shortDescription]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 shortDescription], &off_1003C9840);
  }
  if ([v9 longDescription]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 longDescription], &off_1003C9858);
  }
  if ([v9 longSeasonDescription]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 longSeasonDescription], &off_1003C9870);
  }
  if ([v9 copyright]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 copyright], &off_1003C9888);
  }
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C98A0];
  [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithUnsignedInt:v10] forKey:&off_1003C98B8];
  if ([v9 workName]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 workName], &off_1003C98D0);
  }
  if ([v9 movementName]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 movementName], &off_1003C98E8);
  }
  if ([v9 movementNumber]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 movementNumber], &off_1003C9900);
  }
  if ([v9 movementCount]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 movementCount], &off_1003C9918);
  }
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9930];
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9948];
  [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithBool:(v10 & 0xFF00) != 0] forKey:&off_1003C9960];
  [(NSMutableDictionary *)v8 setObject:&off_1003C9FE0 forKey:&off_1003C9978];
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9990];
  if ([v9 durationInMilliseconds]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 durationInMilliseconds], &off_1003C99A8);
  }
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C99C0];
  if ([a3 itemDownloadIdentifier]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [a3 itemDownloadIdentifier], &off_1003C99D8);
  }
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C99F0];
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9A08];
  [(NSMutableDictionary *)v8 setObject:&__kCFBooleanFalse forKey:&off_1003C9A20];
  +[NSDate timeIntervalSinceReferenceDate];
  [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKey:&off_1003C9A38];
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9A50];
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9A68];
  [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithBool:ML3ImportDefaultRememberBookmarkTime()] forKey:&off_1003C9A80];
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9A98];
  [(NSMutableDictionary *)v8 setObject:&__kCFBooleanFalse forKey:&off_1003C9AB0];
  if ([v9 itemIdentifier]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 itemIdentifier]), &off_1003C9AC8);
  }
  if ([v9 composerIdentifier]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 composerIdentifier]), &off_1003C9AE0);
  }
  if ([v9 genreIdentifier]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 genreIdentifier]), &off_1003C9AF8);
  }
  if ([v9 collectionIdentifier]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 collectionIdentifier]), &off_1003C9B10);
  }
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9B28];
  if ([v9 redownloadActionParameters]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 redownloadActionParameters], &off_1003C9B40);
  }
  [v9 cloudIdentifier];
  [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithUnsignedLongLong:SSGetItemIdentifierFromValue()] forKey:&off_1003C9B58];
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9B70];
  if ([a3 protectionType] != (id)2) {
    [(NSMutableDictionary *)v8 setObject:&__kCFBooleanTrue forKey:&off_1003C9B88];
  }
  [(NSMutableDictionary *)v8 setObject:&off_1003C95B8 forKey:&off_1003C9BA0];
  id v14 = [v9 purchaserAccountIdentifier];
  if (v14 || (id v14 = [a4 uniqueIdentifier]) != 0) {
    [(NSMutableDictionary *)v8 setObject:v14 forKey:&off_1003C9BB8];
  }
  id v15 = objc_msgSend(v9, "downloaderAccountIdentifier", v14);
  if (v15 || (id v15 = [a4 uniqueIdentifier]) != 0) {
    [(NSMutableDictionary *)v8 setObject:v15 forKey:&off_1003C9BD0];
  }
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", -[IPodLibraryML3TrackImporter _absoluteTimeValueForDateValue:](self, "_absoluteTimeValueForDateValue:", objc_msgSend(v9, "purchaseDate", v15)), &off_1003C9BE8);
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", -[IPodLibraryML3TrackImporter _absoluteTimeValueForDateValue:](self, "_absoluteTimeValueForDateValue:", [v9 releaseDate]), &off_1003C9C00);
  if ([v9 podcastEpisodeGUID]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 podcastEpisodeGUID], &off_1003C9C18);
  }
  if (-[IPodLibraryML3TrackImporter _stringValueForURLValue:](self, "_stringValueForURLValue:", [v9 podcastFeedURL]))
  {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", -[IPodLibraryML3TrackImporter _stringValueForURLValue:](self, "_stringValueForURLValue:", [v9 podcastFeedURL]), &off_1003C9C30);
  }
  if (-[IPodLibraryML3TrackImporter _stringValueForURLValue:](self, "_stringValueForURLValue:", [v9 viewStoreItemURL]))
  {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", -[IPodLibraryML3TrackImporter _stringValueForURLValue:](self, "_stringValueForURLValue:", [v9 viewStoreItemURL]), &off_1003C9C48);
  }
  uint64_t v16 = SSDownloadMetadataKeyXID;
  if ([v9 valueForMetadataKey:SSDownloadMetadataKeyXID]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 valueForMetadataKey:v16], &off_1003C9C60);
  }
  uint64_t v17 = SSDownloadMetadataKeyAssetFlavor;
  if ([v9 valueForMetadataKey:SSDownloadMetadataKeyAssetFlavor]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 valueForMetadataKey:v17], &off_1003C9C78);
  }
  if ([v9 matchedStatus]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 matchedStatus], &off_1003C9C90);
  }
  if ([v9 redownloadedStatus]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 redownloadedStatus], &off_1003C9CA8);
  }
  if ([v9 launchExtrasUrl]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 launchExtrasUrl], &off_1003C9CC0);
  }
  if ([v9 rentalID]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 rentalID], &off_1003C9CD8);
  }
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isHighDefinition]), &off_1003C9CF0);
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isRental]), &off_1003C9D08);
  if (a3) {
    BOOL v18 = [a3 chapters] != 0;
  }
  else {
    BOOL v18 = 0;
  }
  [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithBool:v18] forKey:&off_1003C9D20];
  if ([v9 seasonNumber]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 seasonNumber], &off_1003C9D38);
  }
  if ([v9 episodeIdentifier]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 episodeIdentifier], &off_1003C9D50);
  }
  if ([v9 networkName]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v9 networkName], &off_1003C9D68);
  }
  if ([(IPodLibraryML3TrackImporter *)self _currentTrackMovieInfoFromMetadata:v9])
  {
    [(NSMutableDictionary *)v8 setObject:[(IPodLibraryML3TrackImporter *)self _currentTrackMovieInfoFromMetadata:v9] forKey:&off_1003C9D80];
  }
  id v19 = [(IPodLibraryML3TrackImporter *)self _extendedContentRatingStringForLibraryItem:a3];
  if ([v19 length]) {
    [(NSMutableDictionary *)v8 setObject:v19 forKey:&off_1003C9D98];
  }
  if ([v9 hlsPlaylistURL]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", objc_msgSend(objc_msgSend(v9, "hlsPlaylistURL"), "absoluteString"), &off_1003C9DB0);
  }
  id v20 = [v9 valueForMetadataKey:SSDownloadMetadataKeyIsHLS];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v20 BOOLValue]) {
    [(NSMutableDictionary *)v8 setObject:&__kCFBooleanTrue forKey:&off_1003C9DC8];
  }
  id v21 = [v9 valueForMetadataKey:SSDownloadMetadataKeyHasHDR];
  if (objc_opt_respondsToSelector()) {
    unsigned int v22 = [v21 BOOLValue];
  }
  else {
    unsigned int v22 = 0;
  }
  id v23 = [v9 valueForMetadataKey:SSDownloadMetadataKeyHasDolbyVision];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((v22 & 1) == 0) {
      goto LABEL_130;
    }
    uint64_t v25 = 1;
LABEL_129:
    [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithInteger:v25] forKey:&off_1003C9DE0];
    goto LABEL_130;
  }
  unsigned int v24 = [v23 BOOLValue];
  if (v24) {
    uint64_t v25 = v22 | 2;
  }
  else {
    uint64_t v25 = 1;
  }
  if ((v24 | v22) == 1) {
    goto LABEL_129;
  }
LABEL_130:
  id v26 = [v9 valueForMetadataKey:SSDownloadMetadataKeyHas4K];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v26 BOOLValue]) {
    [(NSMutableDictionary *)v8 setObject:&off_1003C9DF8 forKey:&off_1003C9E10];
  }
  id v27 = [(IPodLibraryML3TrackImporter *)self _storeArtworkTokenFromLibraryItem:a3 metadata:v9];
  if (v27) {
    [(NSMutableDictionary *)v8 setObject:v27 forKey:&off_1003C9E28];
  }
  id v28 = [(NSMutableDictionary *)v8 objectForKey:&off_1003C9540];
  if (v28)
  {
    id v29 = -[IPodLibraryML3TrackImporter _currentTrackChapterDataForTrackPid:libraryItem:usingLibrary:](self, "_currentTrackChapterDataForTrackPid:libraryItem:usingLibrary:", [v28 longLongValue], a3, a5);
    if (v29) {
      [(NSMutableDictionary *)v8 setObject:v29 forKey:&off_1003C9E40];
    }
  }
  if ([v9 artistIdentifier]) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 artistIdentifier]), &off_1003C9E58);
  }
  return v8;
}

- (id)_absoluteTimeValueForDateValue:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (id)_stringValueForURLValue:(id)a3
{
  return [a3 absoluteString];
}

- (id)_currentTrackMovieInfoFromMetadata:(id)a3
{
  v3 = (NSData *)[a3 videoDetailsDictionary];
  if (v3)
  {
    v3 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:100 options:0 error:0];
    if (v3) {
      v3 = (NSData *)[objc_alloc((Class)NSString) initWithData:v3 encoding:4];
    }
  }

  return v3;
}

- (id)_storeArtworkTokenFromLibraryItem:(id)a3 metadata:(id)a4
{
  if (![a3 hasItemArtwork]) {
    return 0;
  }
  id v5 = [a4 collectionIdentifier];
  if (v5) {
    return +[NSString stringWithFormat:@"store_collection_id=%llu", v5];
  }
  id v7 = [a4 itemIdentifier];
  if (v7) {
    return +[NSString stringWithFormat:@"store_item_id=%llu", v7];
  }
  v8 = +[NSUUID UUID];

  return [(NSUUID *)v8 UUIDString];
}

- (id)_currentTrackChapterDataForTrackPid:(int64_t)a3 libraryItem:(id)a4 usingLibrary:(id)a5
{
  id v7 = (id)a3;
  if (!a3) {
    id v7 = [a4 libraryPersistentIdentifier];
  }
  id v8 = [a4 chapters];

  return +[ML3Track flattenedChapterDataWithImportChapters:v8 library:a5 trackPersistentID:v7];
}

- (id)_extendedContentRatingStringForLibraryItem:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(a3, "itemMetadata"), "contentRating");
  if (!v3) {
    return 0;
  }
  v4 = v3;
  id v5 = [v3 rank];
  id v6 = [v4 ratingLabel];
  id v7 = +[SSItemContentRating stringForRatingSystem:](SSItemContentRating, "stringForRatingSystem:", [v4 ratingSystem]);
  CFStringRef v8 = (const __CFString *)[v4 ratingDescription];
  if (![v7 length] || !objc_msgSend(v6, "length")) {
    return 0;
  }
  CFStringRef v9 = &stru_1003B9B00;
  if (v8) {
    CFStringRef v9 = v8;
  }
  return +[NSString stringWithFormat:@"%@|%@|%ld|%@", v7, v6, v5, v9];
}

@end