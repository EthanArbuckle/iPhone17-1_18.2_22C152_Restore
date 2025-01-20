@interface _PIPosterLayoutResult
- (NSDictionary)scores;
- (PFPosterLayout)layout;
- (void)setLayout:(id)a3;
- (void)setScores:(id)a3;
@end

@implementation _PIPosterLayoutResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)setScores:(id)a3
{
}

- (NSDictionary)scores
{
  return self->_scores;
}

- (void)setLayout:(id)a3
{
}

- (PFPosterLayout)layout
{
  return self->_layout;
}

@end