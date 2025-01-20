@interface AppKillsInfo
- (AppKillsInfo)init;
- (NSDate)firstKillEventDate;
- (double)meanJetsamKills;
- (double)meanOtherKills;
- (double)meanRunningBoardKills;
- (double)meanSpringBoardKills;
- (id)description;
- (void)setFirstKillEventDate:(id)a3;
- (void)setMeanJetsamKills:(double)a3;
- (void)setMeanOtherKills:(double)a3;
- (void)setMeanRunningBoardKills:(double)a3;
- (void)setMeanSpringBoardKills:(double)a3;
@end

@implementation AppKillsInfo

- (AppKillsInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)AppKillsInfo;
  v2 = [(AppKillsInfo *)&v6 init];
  v3 = (AppKillsInfo *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = 0;
  }
  return v3;
}

- (id)description
{
  return +[NSString stringWithFormat:@"Means kills because of springboard: %f, runningboard: %f, jetsam: %f, others: %f", *(void *)&self->_meanSpringBoardKills, *(void *)&self->_meanRunningBoardKills, *(void *)&self->_meanJetsamKills, *(void *)&self->_meanOtherKills];
}

- (double)meanSpringBoardKills
{
  return self->_meanSpringBoardKills;
}

- (void)setMeanSpringBoardKills:(double)a3
{
  self->_meanSpringBoardKills = a3;
}

- (double)meanRunningBoardKills
{
  return self->_meanRunningBoardKills;
}

- (void)setMeanRunningBoardKills:(double)a3
{
  self->_meanRunningBoardKills = a3;
}

- (double)meanJetsamKills
{
  return self->_meanJetsamKills;
}

- (void)setMeanJetsamKills:(double)a3
{
  self->_meanJetsamKills = a3;
}

- (double)meanOtherKills
{
  return self->_meanOtherKills;
}

- (void)setMeanOtherKills:(double)a3
{
  self->_meanOtherKills = a3;
}

- (NSDate)firstKillEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFirstKillEventDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end