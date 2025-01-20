@interface TLKStars
- (double)starRating;
- (unint64_t)_itemType;
- (void)setStarRating:(double)a3;
@end

@implementation TLKStars

- (void)setStarRating:(double)a3
{
  if (self->_starRating != a3)
  {
    self->_starRating = a3;
    uint64_t v4 = [(TLKObject *)self observer];
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [(TLKObject *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKObject *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (unint64_t)_itemType
{
  return 1;
}

- (double)starRating
{
  return self->_starRating;
}

@end