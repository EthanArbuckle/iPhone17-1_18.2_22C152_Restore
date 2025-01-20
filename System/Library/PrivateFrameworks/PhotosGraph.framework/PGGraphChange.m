@interface PGGraphChange
- (id)description;
- (unint64_t)changeCount;
- (unint64_t)type;
@end

@implementation PGGraphChange

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PGGraphChange;
  v4 = [(PGGraphChange *)&v10 description];
  unint64_t v5 = [(PGGraphChange *)self type];
  if (v5 > 0xC) {
    v6 = 0;
  }
  else {
    v6 = off_1E68EB498[v5];
  }
  v7 = v6;
  v8 = [v3 stringWithFormat:@"%@ [type:%@]", v4, v7];

  return v8;
}

- (unint64_t)changeCount
{
  return 1;
}

- (unint64_t)type
{
  return 0;
}

@end