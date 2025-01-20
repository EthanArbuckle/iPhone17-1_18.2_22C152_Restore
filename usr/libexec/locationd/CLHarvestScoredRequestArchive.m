@interface CLHarvestScoredRequestArchive
- (CLHRequestArchive)archive;
- (CLHarvestScoredRequestArchive)initWithArchive:(id)a3 index:(unsigned int)a4;
- (float)score;
- (unsigned)index;
- (void)dealloc;
- (void)setArchive:(id)a3;
- (void)setScore:(float)a3;
@end

@implementation CLHarvestScoredRequestArchive

- (CLHarvestScoredRequestArchive)initWithArchive:(id)a3 index:(unsigned int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLHarvestScoredRequestArchive;
  v6 = [(CLHarvestScoredRequestArchive *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CLHarvestScoredRequestArchive *)v6 setArchive:a3];
    [(CLHarvestScoredRequestArchive *)v7 setScore:0.0];
    v7->_index = a4;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHarvestScoredRequestArchive;
  [(CLHarvestScoredRequestArchive *)&v3 dealloc];
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (CLHRequestArchive)archive
{
  return self->_archive;
}

- (void)setArchive:(id)a3
{
}

- (unsigned)index
{
  return self->_index;
}

@end