@interface SLASRFeatures
- (NSArray)latticePathMaxScores;
- (NSArray)latticePathMeanScores;
- (NSArray)latticePathMinScores;
- (NSArray)latticePathVarScores;
- (NSArray)topLatticePathScores;
- (float)snr;
- (float)trailingSilence;
- (unint64_t)topLatticePathTokenCount;
- (void)setLatticePathMaxScores:(id)a3;
- (void)setLatticePathMeanScores:(id)a3;
- (void)setLatticePathMinScores:(id)a3;
- (void)setLatticePathVarScores:(id)a3;
- (void)setSnr:(float)a3;
- (void)setTopLatticePathScores:(id)a3;
- (void)setTopLatticePathTokenCount:(unint64_t)a3;
- (void)setTrailingSilence:(float)a3;
@end

@implementation SLASRFeatures

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLatticePathScores, 0);
  objc_storeStrong((id *)&self->_latticePathVarScores, 0);
  objc_storeStrong((id *)&self->_latticePathMeanScores, 0);
  objc_storeStrong((id *)&self->_latticePathMinScores, 0);
  objc_storeStrong((id *)&self->_latticePathMaxScores, 0);
}

- (void)setTrailingSilence:(float)a3
{
  self->_trailingSilence = a3;
}

- (float)trailingSilence
{
  return self->_trailingSilence;
}

- (void)setSnr:(float)a3
{
  self->_snr = a3;
}

- (float)snr
{
  return self->_snr;
}

- (void)setTopLatticePathTokenCount:(unint64_t)a3
{
  self->_topLatticePathTokenCount = a3;
}

- (unint64_t)topLatticePathTokenCount
{
  return self->_topLatticePathTokenCount;
}

- (void)setTopLatticePathScores:(id)a3
{
}

- (NSArray)topLatticePathScores
{
  return self->_topLatticePathScores;
}

- (void)setLatticePathVarScores:(id)a3
{
}

- (NSArray)latticePathVarScores
{
  return self->_latticePathVarScores;
}

- (void)setLatticePathMeanScores:(id)a3
{
}

- (NSArray)latticePathMeanScores
{
  return self->_latticePathMeanScores;
}

- (void)setLatticePathMinScores:(id)a3
{
}

- (NSArray)latticePathMinScores
{
  return self->_latticePathMinScores;
}

- (void)setLatticePathMaxScores:(id)a3
{
}

- (NSArray)latticePathMaxScores
{
  return self->_latticePathMaxScores;
}

@end