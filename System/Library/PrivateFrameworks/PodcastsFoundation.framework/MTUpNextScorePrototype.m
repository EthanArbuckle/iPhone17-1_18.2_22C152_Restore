@interface MTUpNextScorePrototype
- (double)allPlayedEpisodesCount;
- (double)allPlayedEpisodesFromThisShowCount;
- (double)allPlayedEpsPercent;
- (double)allPlayedEpsWeight;
- (double)combinedScore;
- (double)episodesFromShowPlayedCount;
- (double)episodesFromShowPlayedPercent;
- (double)episodesFromShowTotalCount;
- (double)episodesFromShowWeight;
- (double)modifiedDateScore;
- (double)modifiedWeight;
- (void)setAllPlayedEpisodesCount:(double)a3;
- (void)setAllPlayedEpisodesFromThisShowCount:(double)a3;
- (void)setAllPlayedEpsPercent:(double)a3;
- (void)setAllPlayedEpsWeight:(double)a3;
- (void)setCombinedScore:(double)a3;
- (void)setEpisodesFromShowPlayedCount:(double)a3;
- (void)setEpisodesFromShowPlayedPercent:(double)a3;
- (void)setEpisodesFromShowTotalCount:(double)a3;
- (void)setEpisodesFromShowWeight:(double)a3;
- (void)setModifiedDateScore:(double)a3;
- (void)setModifiedWeight:(double)a3;
@end

@implementation MTUpNextScorePrototype

- (double)modifiedDateScore
{
  return self->_modifiedDateScore;
}

- (void)setModifiedDateScore:(double)a3
{
  self->_modifiedDateScore = a3;
}

- (double)modifiedWeight
{
  return self->_modifiedWeight;
}

- (void)setModifiedWeight:(double)a3
{
  self->_modifiedWeight = a3;
}

- (double)episodesFromShowPlayedCount
{
  return self->_episodesFromShowPlayedCount;
}

- (void)setEpisodesFromShowPlayedCount:(double)a3
{
  self->_episodesFromShowPlayedCount = a3;
}

- (double)episodesFromShowPlayedPercent
{
  return self->_episodesFromShowPlayedPercent;
}

- (void)setEpisodesFromShowPlayedPercent:(double)a3
{
  self->_episodesFromShowPlayedPercent = a3;
}

- (double)episodesFromShowTotalCount
{
  return self->_episodesFromShowTotalCount;
}

- (void)setEpisodesFromShowTotalCount:(double)a3
{
  self->_episodesFromShowTotalCount = a3;
}

- (double)episodesFromShowWeight
{
  return self->_episodesFromShowWeight;
}

- (void)setEpisodesFromShowWeight:(double)a3
{
  self->_episodesFromShowWeight = a3;
}

- (double)allPlayedEpisodesCount
{
  return self->_allPlayedEpisodesCount;
}

- (void)setAllPlayedEpisodesCount:(double)a3
{
  self->_allPlayedEpisodesCount = a3;
}

- (double)allPlayedEpisodesFromThisShowCount
{
  return self->_allPlayedEpisodesFromThisShowCount;
}

- (void)setAllPlayedEpisodesFromThisShowCount:(double)a3
{
  self->_allPlayedEpisodesFromThisShowCount = a3;
}

- (double)allPlayedEpsPercent
{
  return self->_allPlayedEpsPercent;
}

- (void)setAllPlayedEpsPercent:(double)a3
{
  self->_allPlayedEpsPercent = a3;
}

- (double)allPlayedEpsWeight
{
  return self->_allPlayedEpsWeight;
}

- (void)setAllPlayedEpsWeight:(double)a3
{
  self->_allPlayedEpsWeight = a3;
}

- (double)combinedScore
{
  return self->_combinedScore;
}

- (void)setCombinedScore:(double)a3
{
  self->_combinedScore = a3;
}

@end