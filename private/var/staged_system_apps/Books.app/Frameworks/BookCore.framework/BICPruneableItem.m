@interface BICPruneableItem
+ (id)pruneableItemFromEntryLocation:(id)a3 cost:(unint64_t)a4 pruneScore:(unint64_t)a5;
+ (unint64_t)pruneScoreFrom:(CGSize)a3 lastUsedDate:(id)a4 oldVersion:(BOOL)a5 expired:(BOOL)a6 processed:(BOOL)a7;
+ (void)_setTimeBuckets:(id)a3;
- (NSString)entryLocation;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)cost;
- (unint64_t)pruneScore;
- (void)setCost:(unint64_t)a3;
- (void)setEntryLocation:(id)a3;
- (void)setPruneScore:(unint64_t)a3;
@end

@implementation BICPruneableItem

+ (void)_setTimeBuckets:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectAtIndexedSubscript:0];
  [v4 doubleValue];
  qword_341D30 = v5;

  v6 = [v3 objectAtIndexedSubscript:1];
  [v6 doubleValue];
  qword_341D38 = v7;

  v8 = [v3 objectAtIndexedSubscript:2];
  [v8 doubleValue];
  qword_341D40 = v9;

  id v11 = [v3 objectAtIndexedSubscript:3];

  [v11 doubleValue];
  qword_341D48 = v10;
}

+ (unint64_t)pruneScoreFrom:(CGSize)a3 lastUsedDate:(id)a4 oldVersion:(BOOL)a5 expired:(BOOL)a6 processed:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a3.height;
  double width = a3.width;
  [a4 timeIntervalSinceNow];
  double v13 = -v12;
  uint64_t v14 = 16000000;
  if (v7) {
    uint64_t v14 = 0;
  }
  if (*(double *)&qword_341D30 >= v13) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 32000000;
  }
  if (*(double *)&qword_341D38 < v13) {
    v15 += 32000000;
  }
  if (*(double *)&qword_341D40 < v13) {
    v15 += 32000000;
  }
  uint64_t v16 = v15 + 32000000;
  if (*(double *)&qword_341D48 >= v13) {
    uint64_t v16 = v15;
  }
  unint64_t result = 0xFFFFFFFFLL;
  if (!a5 && !a6)
  {
    if (v12 <= 0.0) {
      return v14 + (unint64_t)(width * height) + v16;
    }
    else {
      return -1;
    }
  }
  return result;
}

+ (id)pruneableItemFromEntryLocation:(id)a3 cost:(unint64_t)a4 pruneScore:(unint64_t)a5
{
  id v7 = a3;
  v8 = objc_alloc_init(BICPruneableItem);
  [(BICPruneableItem *)v8 setEntryLocation:v7];

  [(BICPruneableItem *)v8 setCost:a4];
  [(BICPruneableItem *)v8 setPruneScore:a5];

  return v8;
}

- (id)description
{
  unint64_t v3 = [(BICPruneableItem *)self cost];
  unint64_t v4 = [(BICPruneableItem *)self pruneScore];
  uint64_t v5 = [(BICPruneableItem *)self entryLocation];
  v6 = +[NSString stringWithFormat:@"cost: %-10ld pruneScore: %-10ld Loc: %@", v3, v4, v5];

  return v6;
}

- (int64_t)compare:(id)a3
{
  unint64_t v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 pruneScore]);
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:[(BICPruneableItem *)self pruneScore]];
  id v6 = [v4 compare:v5];

  return (int64_t)v6;
}

- (NSString)entryLocation
{
  return self->_entryLocation;
}

- (void)setEntryLocation:(id)a3
{
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void)setCost:(unint64_t)a3
{
  self->_cost = a3;
}

- (unint64_t)pruneScore
{
  return self->_pruneScore;
}

- (void)setPruneScore:(unint64_t)a3
{
  self->_pruneScore = a3;
}

- (void).cxx_destruct
{
}

@end