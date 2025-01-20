@interface FCPromoteOneHeadline
@end

@implementation FCPromoteOneHeadline

uint64_t ____FCPromoteOneHeadline_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  v6 = objc_msgSend(v4, "numberWithDouble:", FCScoreForHeadline(a3, 1));
  v7 = NSNumber;
  double v8 = FCScoreForHeadline(v5, 1);

  v9 = [v7 numberWithDouble:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t ___FCPromoteOneHeadline_block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasThumbnail];
}

@end