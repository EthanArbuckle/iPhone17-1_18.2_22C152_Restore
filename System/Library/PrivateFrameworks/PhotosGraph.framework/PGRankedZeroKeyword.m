@interface PGRankedZeroKeyword
- (BOOL)isEqual:(id)a3;
- (NSDictionary)zeroKeyword;
- (PGRankedZeroKeyword)initWithKeyword:(id)a3 score:(double)a4;
- (double)score;
@end

@implementation PGRankedZeroKeyword

- (void).cxx_destruct
{
}

- (double)score
{
  return self->_score;
}

- (NSDictionary)zeroKeyword
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(PGRankedZeroKeyword *)self zeroKeyword];
  v6 = [v4 zeroKeyword];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (PGRankedZeroKeyword)initWithKeyword:(id)a3 score:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGRankedZeroKeyword;
  v8 = [(PGRankedZeroKeyword *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_zeroKeyword, a3);
    v9->_score = a4;
  }

  return v9;
}

@end