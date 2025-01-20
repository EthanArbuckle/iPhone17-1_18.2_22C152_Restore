@interface TSFrequencyAnalysis
- (TSFrequencyAnalysis)initWithTimeErrorValues:(id)a3;
- (double)averageFrequency;
- (double)averagePeriod;
- (double)averageTimeError;
- (double)highestFrequency;
- (double)lowestFrequency;
- (void)setAverageFrequency:(double)a3;
- (void)setAveragePeriod:(double)a3;
- (void)setAverageTimeError:(double)a3;
- (void)setHighestFrequency:(double)a3;
- (void)setLowestFrequency:(double)a3;
@end

@implementation TSFrequencyAnalysis

- (TSFrequencyAnalysis)initWithTimeErrorValues:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TSFrequencyAnalysis;
  v5 = [(TSFrequencyAnalysis *)&v36 init];
  if (v5)
  {
    int64_t v6 = [v4 count];
    int64_t v7 = v6 - 1;
    if (v6 < 1)
    {

      v5 = 0;
    }
    else
    {
      size_t v8 = v6;
      v9 = (double *)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
      v31 = (double *)malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
      v10 = (double *)malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
      v11 = v10;
      if (v10 && v9 && v31)
      {
        int64_t v28 = v7;
        v29 = v10;
        v12 = [v4 objectAtIndexedSubscript:0];
        uint64_t v13 = [v12 timestamp];

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v30 = v4;
        id v14 = v4;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = 0;
          uint64_t v18 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v33 != v18) {
                objc_enumerationMutation(v14);
              }
              v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              v9[v17 + i] = (double)(unint64_t)([v20 timestamp] - v13);
              v31[v17 + i] = (double)[v20 error];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
            v17 += i;
          }
          while (v16);
        }

        v11 = v29;
        vDSP_vsubD(v9, 1, v9 + 1, 1, v29, 1, v28);
        vDSP_meanvD(v29, 1, &v5->_averagePeriod, v28);
        double averagePeriod = v5->_averagePeriod;
        v5->_averageFrequency = 1000000000.0 / averagePeriod;
        __asm { FMOV            V2.2D, #2.0 }
        _Q2.f64[0] = (double)v28;
        *(float64x2_t *)&v5->_lowestFrequency = vdivq_f64((float64x2_t)vdupq_n_s64(0x41CDCD6500000000uLL), vmulq_n_f64(_Q2, averagePeriod));
        id v4 = v30;
      }
      else
      {

        v5 = 0;
      }
      free(v9);
      free(v31);
      free(v11);
    }
  }

  return v5;
}

- (double)averagePeriod
{
  return self->_averagePeriod;
}

- (void)setAveragePeriod:(double)a3
{
  self->_double averagePeriod = a3;
}

- (double)averageFrequency
{
  return self->_averageFrequency;
}

- (void)setAverageFrequency:(double)a3
{
  self->_averageFrequency = a3;
}

- (double)averageTimeError
{
  return self->_averageTimeError;
}

- (void)setAverageTimeError:(double)a3
{
  self->_averageTimeError = a3;
}

- (double)lowestFrequency
{
  return self->_lowestFrequency;
}

- (void)setLowestFrequency:(double)a3
{
  self->_lowestFrequency = a3;
}

- (double)highestFrequency
{
  return self->_highestFrequency;
}

- (void)setHighestFrequency:(double)a3
{
  self->_highestFrequency = a3;
}

@end