@interface FinishArtistHeroUpdateOperation
- (int64_t)currentDatabaseRevision;
- (void)main;
- (void)setCurrentDatabaseRevision:(int64_t)a3;
@end

@implementation FinishArtistHeroUpdateOperation

- (void)setCurrentDatabaseRevision:(int64_t)a3
{
  self->_currentDatabaseRevision = a3;
}

- (int64_t)currentDatabaseRevision
{
  return self->_currentDatabaseRevision;
}

- (void)main
{
  if (![(QueueAwareOperation *)self shouldProcessSpecificArtists])
  {
    v3 = [(QueueAwareOperation *)self musicLibrary];
    v4 = +[NSDate date];
    id v5 = v3;
    [v4 timeIntervalSinceReferenceDate];
    v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 setValue:v6 forDatabaseProperty:@"MLArtistHeroImageImportDate"];
  }
  v7 = [(QueueAwareOperation *)self musicLibrary];
  sub_10006FDB8(v7, [(FinishArtistHeroUpdateOperation *)self currentDatabaseRevision]);

  v8 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating artist hero images complete.", v9, 2u);
  }
}

@end