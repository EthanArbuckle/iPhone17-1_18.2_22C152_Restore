@interface PTCinematographyFocusSmoother
- (BOOL)didEndSamples;
- (BOOL)isEndOfSmoothedSamples;
- (BOOL)isSmoothedSampleAvailable;
- (MutableFloatArray)cachedSamples;
- (PTCinematographyFocusSmoother)init;
- (PTCinematographyFocusSmoother)lastFocusSmoother;
- (PTCinematographyFocusSmoother)nextFocusSmoother;
- (float)_getSmoothedSample;
- (float)_lastAddedSample;
- (float)nextSmoothedSample;
- (unint64_t)minSamplesNeeded;
- (unint64_t)unprocessedSampleCount;
- (void)_advanceToNextSmoothedSample;
- (void)_padByCount:(unint64_t)a3;
- (void)_padToFill;
- (void)addSample:(float)a3;
- (void)endSamples;
- (void)setCachedSamples:(id)a3;
- (void)setNextFocusSmoother:(id)a3;
- (void)setUnprocessedSampleCount:(unint64_t)a3;
@end

@implementation PTCinematographyFocusSmoother

- (PTCinematographyFocusSmoother)init
{
  v3.receiver = self;
  v3.super_class = (Class)PTCinematographyFocusSmoother;
  result = [(PTCinematographyFocusSmoother *)&v3 init];
  if (result) {
    result->_minSamplesNeeded = 30;
  }
  return result;
}

- (void)addSample:(float)a3
{
  if (self->_didEndSamples || (v9 = self->_cachedSamples) == 0)
  {
    unint64_t v5 = 60 - self->_minSamplesNeeded;
    v6 = [[MutableFloatArray alloc] initWithCount:v5 capacity:118];
    cachedSamples = self->_cachedSamples;
    self->_cachedSamples = v6;

    *(float *)&double v8 = a3;
    -[MutableFloatArray setFloat:inRange:](self->_cachedSamples, "setFloat:inRange:", 0, v5, v8);
    self->_unprocessedSampleCount = 1;
    self->_didEndSamples = 0;
  }
  else
  {
    [(MutableFloatArray *)v9 appendFloat:*(double *)&a3];
    ++self->_unprocessedSampleCount;
  }
}

- (void)endSamples
{
  self->_didEndSamples = 1;
}

- (BOOL)isEndOfSmoothedSamples
{
  if (self->_didEndSamples) {
    return ![(PTCinematographyFocusSmoother *)self isSmoothedSampleAvailable];
  }
  else {
    return 0;
  }
}

- (BOOL)isSmoothedSampleAvailable
{
  return self->_unprocessedSampleCount && [(FloatArray *)self->_cachedSamples count] > 0x3A;
}

- (float)nextSmoothedSample
{
  if (![(PTCinematographyFocusSmoother *)self isSmoothedSampleAvailable]) {
    return 0.0;
  }
  [(PTCinematographyFocusSmoother *)self _getSmoothedSample];
  float v4 = v3;
  [(PTCinematographyFocusSmoother *)self _advanceToNextSmoothedSample];
  return v4;
}

- (PTCinematographyFocusSmoother)lastFocusSmoother
{
  v2 = self;
  float v3 = [(PTCinematographyFocusSmoother *)v2 nextFocusSmoother];

  if (v3)
  {
    do
    {
      float v4 = [(PTCinematographyFocusSmoother *)v2 nextFocusSmoother];

      unint64_t v5 = [(PTCinematographyFocusSmoother *)v4 nextFocusSmoother];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    float v4 = v2;
  }

  return v4;
}

- (float)_getSmoothedSample
{
  float v2 = 0.0;
  if (self->_unprocessedSampleCount)
  {
    if ([(FloatArray *)self->_cachedSamples count] >= 0x1E)
    {
      [(MutableFloatArray *)self->_cachedSamples floatAtIndex:29];
      float v2 = v4;
      float __C = v4;
      if ([(FloatArray *)self->_cachedSamples count] >= 0x3B)
      {
        vDSP_dotpr(kCoefficients, 1, [(MutableFloatArray *)self->_cachedSamples floats], 1, &__C, 0x3BuLL);
        return __C;
      }
    }
  }
  return v2;
}

- (void)_advanceToNextSmoothedSample
{
  if (self->_unprocessedSampleCount)
  {
    [(MutableFloatArray *)self->_cachedSamples removeFromStart:1];
    --self->_unprocessedSampleCount;
    if (self->_didEndSamples)
    {
      [(PTCinematographyFocusSmoother *)self _padToFill];
    }
  }
}

- (void)_padToFill
{
  if ([(FloatArray *)self->_cachedSamples count] <= 0x3A)
  {
    unint64_t v3 = 59 - [(FloatArray *)self->_cachedSamples count];
    [(PTCinematographyFocusSmoother *)self _padByCount:v3];
  }
}

- (void)_padByCount:(unint64_t)a3
{
  [(PTCinematographyFocusSmoother *)self _lastAddedSample];
  if (a3)
  {
    int v6 = LODWORD(v5);
    do
    {
      LODWORD(v5) = v6;
      [(MutableFloatArray *)self->_cachedSamples appendFloat:v5];
      --a3;
    }
    while (a3);
  }
}

- (float)_lastAddedSample
{
  if (![(FloatArray *)self->_cachedSamples count]) {
    return 0.0;
  }
  cachedSamples = self->_cachedSamples;
  uint64_t v4 = [(FloatArray *)cachedSamples count] - 1;

  [(MutableFloatArray *)cachedSamples floatAtIndex:v4];
  return result;
}

- (unint64_t)minSamplesNeeded
{
  return self->_minSamplesNeeded;
}

- (BOOL)didEndSamples
{
  return self->_didEndSamples;
}

- (PTCinematographyFocusSmoother)nextFocusSmoother
{
  return (PTCinematographyFocusSmoother *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNextFocusSmoother:(id)a3
{
}

- (MutableFloatArray)cachedSamples
{
  return (MutableFloatArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedSamples:(id)a3
{
}

- (unint64_t)unprocessedSampleCount
{
  return self->_unprocessedSampleCount;
}

- (void)setUnprocessedSampleCount:(unint64_t)a3
{
  self->_unprocessedSampleCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSamples, 0);

  objc_storeStrong((id *)&self->_nextFocusSmoother, 0);
}

@end