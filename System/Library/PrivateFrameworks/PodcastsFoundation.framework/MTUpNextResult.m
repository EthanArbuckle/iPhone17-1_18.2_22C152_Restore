@interface MTUpNextResult
- (BOOL)needsUpdate;
- (MTUpNextScorePrototype)upNextScore;
- (NSString)episodeUuid;
- (double)modifiedDate;
- (double)modifiedDateScore;
- (void)setEpisodeUuid:(id)a3;
- (void)setModifiedDate:(double)a3;
- (void)setModifiedDateScore:(double)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setUpNextScore:(id)a3;
- (void)updateFor:(id)a3;
@end

@implementation MTUpNextResult

- (void)updateFor:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  [(MTUpNextResult *)self setEpisodeUuid:v5];

  int v6 = [v4 listenNowEpisode];
  [(MTUpNextResult *)self setNeedsUpdate:v6 ^ 1u];
}

- (void)setModifiedDate:(double)a3
{
  id v6 = +[FutureDateChecker lenientSharedInstance];
  [v6 timestampBoundByNow:a3];
  self->_modifiedDate = v5;
}

- (NSString)episodeUuid
{
  return self->_episodeUuid;
}

- (void)setEpisodeUuid:(id)a3
{
}

- (double)modifiedDate
{
  return self->_modifiedDate;
}

- (double)modifiedDateScore
{
  return self->_modifiedDateScore;
}

- (void)setModifiedDateScore:(double)a3
{
  self->_modifiedDateScore = a3;
}

- (MTUpNextScorePrototype)upNextScore
{
  return self->_upNextScore;
}

- (void)setUpNextScore:(id)a3
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upNextScore, 0);
  objc_storeStrong((id *)&self->_episodeUuid, 0);
}

@end