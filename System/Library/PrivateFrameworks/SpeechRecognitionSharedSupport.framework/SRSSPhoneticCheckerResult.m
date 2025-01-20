@interface SRSSPhoneticCheckerResult
- (NSString)text;
- (double)phoneticSimilarity;
- (double)prior;
- (double)score;
- (id)description;
- (void)setPhoneticSimilarity:(double)a3;
- (void)setPrior:(double)a3;
- (void)setScore:(double)a3;
- (void)setText:(id)a3;
@end

@implementation SRSSPhoneticCheckerResult

- (id)description
{
  v3 = NSString;
  v4 = [(SRSSPhoneticCheckerResult *)self text];
  [(SRSSPhoneticCheckerResult *)self score];
  uint64_t v6 = v5;
  [(SRSSPhoneticCheckerResult *)self phoneticSimilarity];
  uint64_t v8 = v7;
  [(SRSSPhoneticCheckerResult *)self prior];
  v10 = [v3 stringWithFormat:@"%@(%f)(%f,%f)\n", v4, v6, v8, v9];

  return v10;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)phoneticSimilarity
{
  return self->_phoneticSimilarity;
}

- (void)setPhoneticSimilarity:(double)a3
{
  self->_phoneticSimilarity = a3;
}

- (double)prior
{
  return self->_prior;
}

- (void)setPrior:(double)a3
{
  self->_prior = a3;
}

- (void).cxx_destruct
{
}

@end