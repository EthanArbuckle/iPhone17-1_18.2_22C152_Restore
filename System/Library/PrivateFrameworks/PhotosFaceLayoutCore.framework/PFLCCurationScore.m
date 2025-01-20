@interface PFLCCurationScore
- (NSDictionary)positionScores;
- (PFLCCurationScore)initWithPositionScores:(id)a3 preferredPosition:(unint64_t)a4;
- (id)description;
- (unint64_t)preferredPosition;
@end

@implementation PFLCCurationScore

- (PFLCCurationScore)initWithPositionScores:(id)a3 preferredPosition:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PFLCCurationScore;
  v7 = [(PFLCCurationScore *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    positionScores = v7->_positionScores;
    v7->_positionScores = (NSDictionary *)v8;

    v7->_preferredPosition = a4;
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CurationScore[ positionScores=\n%@\n, preferred=%ld ]", self->_positionScores, self->_preferredPosition];
}

- (NSDictionary)positionScores
{
  return self->_positionScores;
}

- (unint64_t)preferredPosition
{
  return self->_preferredPosition;
}

- (void).cxx_destruct
{
}

@end