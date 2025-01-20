@interface _UICollectionViewTrackedValue
- (BOOL)isAccumulating;
- (_UICollectionViewTrackedValue)init;
- (double)speed;
- (double)trackedValue;
- (void)addValue:(double)a3;
- (void)setIsAccumulating:(BOOL)a3;
- (void)setTrackedValue:(double)a3;
@end

@implementation _UICollectionViewTrackedValue

- (_UICollectionViewTrackedValue)init
{
  v13.receiver = self;
  v13.super_class = (Class)_UICollectionViewTrackedValue;
  v2 = [(_UICollectionViewTrackedValue *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_isAccumulating = 1;
    v2->_trackedValue = 0.0;
    *(_OWORD *)&v2->_valuesCount = xmmword_186B93FE0;
    v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSince1970];
    double v6 = v5;

    if (v3->_valuesCount >= 1)
    {
      int64_t v7 = 0;
      do
      {
        v8 = objc_alloc_init(_UICollectionViewTrackedValueItem);
        [(_UICollectionViewTrackedValueItem *)v8 setValue:0.0];
        [(_UICollectionViewTrackedValueItem *)v8 setTimeStamp:v6];
        values = v3->_values;
        if (values) {
          [(NSArray *)values arrayByAddingObject:v8];
        }
        else {
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObject:v8];
        }
        v11 = v3->_values;
        v3->_values = (NSArray *)v10;

        ++v7;
      }
      while (v7 < v3->_valuesCount);
    }
  }
  return v3;
}

- (void)addValue:(double)a3
{
  if (self->_isAccumulating)
  {
    int64_t valuesCount = self->_valuesCount;
    int64_t v6 = self->_currentIndex + 1;
    values = self->_values;
    self->_currentIndex = v6 % valuesCount;
    -[NSArray objectAtIndex:](values, "objectAtIndex:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    self->_trackedValue = a3;
    [v9 setValue:a3];
    v8 = [MEMORY[0x1E4F1C9C8] date];
    [v8 timeIntervalSince1970];
    objc_msgSend(v9, "setTimeStamp:");
  }
}

- (double)speed
{
  int64_t currentIndex = self->_currentIndex;
  if (currentIndex <= 0) {
    int64_t currentIndex = self->_valuesCount;
  }
  int64_t v4 = currentIndex - 1;
  double v5 = -[NSArray objectAtIndex:](self->_values, "objectAtIndex:");
  int64_t v6 = [(NSArray *)self->_values objectAtIndex:v4];
  [v5 timeStamp];
  double v8 = v7;
  [v6 timeStamp];
  double v9 = 0.0;
  if (v8 != v10)
  {
    [v5 value];
    double v12 = v11;
    [v6 value];
    double v14 = v12 - v13;
    [v5 timeStamp];
    double v16 = v15;
    [v6 timeStamp];
    double v9 = v14 / (v16 / v17);
  }

  return v9;
}

- (double)trackedValue
{
  return self->_trackedValue;
}

- (BOOL)isAccumulating
{
  return self->_isAccumulating;
}

- (void)setIsAccumulating:(BOOL)a3
{
  self->_isAccumulating = a3;
}

- (void)setTrackedValue:(double)a3
{
  self->_trackedValue = a3;
}

- (void).cxx_destruct
{
}

@end