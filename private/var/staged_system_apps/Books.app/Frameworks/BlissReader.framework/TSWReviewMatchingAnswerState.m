@interface TSWReviewMatchingAnswerState
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUserSelected;
- (NSArray)placardToTargetMap;
- (TSWReviewMatchingAnswerState)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)numSelectedTargets;
- (unint64_t)placardForTarget:(unint64_t)a3;
- (unint64_t)targetForPlacard:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPlacardToTargetMap:(id)a3;
- (void)setTarget:(unint64_t)a3 forPlacard:(unint64_t)a4;
@end

@implementation TSWReviewMatchingAnswerState

- (void)dealloc
{
  self->mPlacardToTargetMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewMatchingAnswerState;
  [(TSWReviewMatchingAnswerState *)&v3 dealloc];
}

- (TSWReviewMatchingAnswerState)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSWReviewMatchingAnswerState;
  v4 = -[TSWReviewAnswerState initWithCoder:](&v7, "initWithCoder:");
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->mPlacardToTargetMap = [a3 decodeObjectOfClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0) forKey:@"TSWReviewAnswerStateChoiceForSource"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWReviewMatchingAnswerState;
  -[TSWReviewAnswerState encodeWithCoder:](&v5, "encodeWithCoder:");
  [a3 encodeObject:self->mPlacardToTargetMap forKey:@"TSWReviewAnswerStateChoiceForSource"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)targetForPlacard:(unint64_t)a3
{
  mPlacardToTargetMap = self->mPlacardToTargetMap;
  if (!mPlacardToTargetMap) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((unint64_t)[(NSMutableArray *)mPlacardToTargetMap count] <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v6 = [(NSMutableArray *)self->mPlacardToTargetMap objectAtIndex:a3];
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return (unint64_t)[v6 unsignedIntegerValue];
}

- (unint64_t)placardForTarget:(unint64_t)a3
{
  mPlacardToTargetMap = self->mPlacardToTargetMap;
  if (!mPlacardToTargetMap || ![(NSMutableArray *)mPlacardToTargetMap count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = 0;
  while (1)
  {
    id v7 = [(NSMutableArray *)self->mPlacardToTargetMap objectAtIndex:v6];
    if (v7)
    {
      if ([v7 unsignedIntegerValue] == (id)a3) {
        break;
      }
    }
    if (++v6 >= (unint64_t)[(NSMutableArray *)self->mPlacardToTargetMap count]) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6;
}

- (void)setTarget:(unint64_t)a3 forPlacard:(unint64_t)a4
{
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    mPlacardToTargetMap = self->mPlacardToTargetMap;
    if (!mPlacardToTargetMap)
    {
      mPlacardToTargetMap = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->mPlacardToTargetMap = mPlacardToTargetMap;
    }
    if ((unint64_t)[(NSMutableArray *)mPlacardToTargetMap count] <= a4)
    {
      id v8 = [(NSMutableArray *)self->mPlacardToTargetMap count];
      if ((id)(a4 + 1) != v8)
      {
        if (a4 + 1 - (unint64_t)v8 <= 1) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = a4 + 1 - (void)v8;
        }
        do
        {
          [(NSMutableArray *)self->mPlacardToTargetMap addObject:+[NSNumber numberWithUnsignedInteger:0x7FFFFFFFFFFFFFFFLL]];
          --v9;
        }
        while (v9);
      }
    }
    unint64_t v10 = [(TSWReviewMatchingAnswerState *)self placardForTarget:a3];
    if (v10 != a4)
    {
      if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
        [(NSMutableArray *)self->mPlacardToTargetMap replaceObjectAtIndex:v10 withObject:+[NSNumber numberWithUnsignedInteger:0x7FFFFFFFFFFFFFFFLL]];
      }
      v11 = +[NSNumber numberWithUnsignedInteger:a3];
      v12 = self->mPlacardToTargetMap;
      [(NSMutableArray *)v12 replaceObjectAtIndex:a4 withObject:v11];
    }
  }
}

- (void)setPlacardToTargetMap:(id)a3
{
  self->mPlacardToTargetMap = 0;
  self->mPlacardToTargetMap = (NSMutableArray *)[a3 mutableCopy];
}

- (unint64_t)numSelectedTargets
{
  mPlacardToTargetMap = self->mPlacardToTargetMap;
  if (!mPlacardToTargetMap) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(NSMutableArray *)mPlacardToTargetMap countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(mPlacardToTargetMap);
      }
      if ([*(id *)(*((void *)&v9 + 1) + 8 * i) unsignedIntegerValue] != (id)0x7FFFFFFFFFFFFFFFLL) {
        ++v5;
      }
    }
    id v4 = [(NSMutableArray *)mPlacardToTargetMap countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (BOOL)hasUserSelected
{
  mPlacardToTargetMap = self->mPlacardToTargetMap;
  if (mPlacardToTargetMap)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [(NSMutableArray *)mPlacardToTargetMap countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(mPlacardToTargetMap);
          }
          if ([*(id *)(*((void *)&v8 + 1) + 8 * i) unsignedIntegerValue] != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            LOBYTE(v3) = 1;
            return (char)v3;
          }
        }
        id v4 = [(NSMutableArray *)mPlacardToTargetMap countByEnumeratingWithState:&v8 objects:v12 count:16];
        LOBYTE(v3) = 0;
        if (v4) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (id)description
{
  mPlacardToTargetMap = self->mPlacardToTargetMap;
  if (mPlacardToTargetMap) {
    return [NSString stringWithFormat:@"matchAnswer<<%@>>" componentsJoinedByString:@", " [mPlacardToTargetMap arrayPiecewiseTransformedBy:&stru_4596F8]];
  }
  else {
    return @"<matchAnswer<>>";
  }
}

- (NSArray)placardToTargetMap
{
  return &self->mPlacardToTargetMap->super;
}

@end