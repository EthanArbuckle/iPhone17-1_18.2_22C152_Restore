@interface WFCategoryJudgement
+ (id)categoryJudgementWithCategory:(int64_t)a3 score:(float)a4;
- (float)score;
- (id)description;
- (int64_t)category;
- (int64_t)compareByCategory:(id)a3;
- (int64_t)compareByScore:(id)a3;
- (void)setCategory:(int64_t)a3;
- (void)setScore:(float)a3;
@end

@implementation WFCategoryJudgement

+ (id)categoryJudgementWithCategory:(int64_t)a3 score:(float)a4
{
  id v6 = objc_alloc_init((Class)objc_opt_class());
  *(float *)&double v7 = a4;
  [v6 setScore:v7];
  [v6 setCategory:a3];
  return v6;
}

- (float)score
{
  return self->score;
}

- (void)setScore:(float)a3
{
  self->score = a3;
}

- (int64_t)category
{
  return self->category;
}

- (void)setCategory:(int64_t)a3
{
  self->category = a3;
}

- (int64_t)compareByCategory:(id)a3
{
  int64_t v4 = [(WFCategoryJudgement *)self category];
  uint64_t v5 = [a3 category];
  if (v4 < v5) {
    return -1;
  }
  else {
    return v4 > v5;
  }
}

- (int64_t)compareByScore:(id)a3
{
  [(WFCategoryJudgement *)self score];
  float v5 = v4;
  [a3 score];
  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld:%f", self->category, self->score);
}

@end