@interface NTKMovingMedian
- (NSMutableArray)values;
- (NTKMovingMedian)initWithSampleSize:(unint64_t)a3;
- (double)currentValue;
- (uint64_t)_entryAtIndex:(uint64_t)result;
- (unint64_t)sampleCount;
- (unint64_t)sampleSize;
- (void)addNewValue:(double)a3;
- (void)setCurrentValue:(double)a3;
- (void)setSampleSize:(unint64_t)a3;
- (void)setValues:(id)a3;
@end

@implementation NTKMovingMedian

- (NTKMovingMedian)initWithSampleSize:(unint64_t)a3
{
  v4 = [(NTKMovingMedian *)self init];
  v5 = v4;
  if (v4)
  {
    v4->_sampleSize = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    values = v5->_values;
    v5->_values = (NSMutableArray *)v6;
  }
  return v5;
}

- (uint64_t)_entryAtIndex:(uint64_t)result
{
  if (result)
  {
    v2 = [*(id *)(result + 24) objectAtIndex:a2];
    v3[0] = 0;
    v3[1] = 0;
    [v2 getValue:v3 size:16];

    return v3[0];
  }
  return result;
}

- (void)addNewValue:(double)a3
{
  double v20 = a3;
  __uint64_t v21 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29238]) initWithBytes:&v20 objCType:"{_SortedEntry=dQ}"];
  uint64_t v5 = [(NSMutableArray *)self->_values count];
  unint64_t sampleSize = self->_sampleSize;
  if (v5 == sampleSize && sampleSize != 0)
  {
    if ([(NSMutableArray *)self->_values count])
    {
      unint64_t v8 = 0;
      unint64_t v9 = 0;
      unint64_t v10 = 0;
      do
      {
        -[NTKMovingMedian _entryAtIndex:]((uint64_t)self, v10);
        if (v10) {
          BOOL v12 = v11 >= v8;
        }
        else {
          BOOL v12 = 0;
        }
        if (!v12)
        {
          unint64_t v9 = v10;
          unint64_t v8 = v11;
        }
        ++v10;
      }
      while (v10 < [(NSMutableArray *)self->_values count]);
    }
    else
    {
      unint64_t v9 = 0;
    }
    -[NSMutableArray removeObjectAtIndex:](self->_values, "removeObjectAtIndex:", v9, *(void *)&v20);
  }
  if ([(NSMutableArray *)self->_values count])
  {
    uint64_t v14 = 0;
    while (1)
    {
      double v15 = COERCE_DOUBLE(-[NTKMovingMedian _entryAtIndex:]((uint64_t)self, v14));
      values = self->_values;
      if (v20 < v15) {
        break;
      }
      if (++v14 >= (unint64_t)[(NSMutableArray *)values count]) {
        goto LABEL_23;
      }
    }
    [(NSMutableArray *)values insertObject:v4 atIndex:v14];
  }
  else
  {
LABEL_23:
    [(NSMutableArray *)self->_values addObject:v4];
  }
  unint64_t v17 = (unint64_t)[(NSMutableArray *)self->_values count] >> 1;
  if ([(NSMutableArray *)self->_values count])
  {
    double v19 = COERCE_DOUBLE(-[NTKMovingMedian _entryAtIndex:]((uint64_t)self, v17));
  }
  else
  {
    double v18 = COERCE_DOUBLE(-[NTKMovingMedian _entryAtIndex:]((uint64_t)self, v17 - 1));
    double v19 = (v18 + COERCE_DOUBLE(-[NTKMovingMedian _entryAtIndex:]((uint64_t)self, v17))) * 0.5;
  }
  [(NTKMovingMedian *)self setCurrentValue:v19];
}

- (unint64_t)sampleCount
{
  return [(NSMutableArray *)self->_values count];
}

- (double)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(double)a3
{
  self->_currentValue = a3;
}

- (unint64_t)sampleSize
{
  return self->_sampleSize;
}

- (void)setSampleSize:(unint64_t)a3
{
  self->_unint64_t sampleSize = a3;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end