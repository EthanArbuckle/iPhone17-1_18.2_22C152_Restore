@interface PAEKeyerHistogram
+ (BOOL)supportsSecureCoding;
- (PAEKeyerHistogram)init;
- (PAEKeyerHistogram)initWithCoder:(id)a3;
- (float)getHistogramScale;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getHistogram;
- (void)setHistogram:(void *)a3;
- (void)setHistogramArray:(id)a3;
- (void)setHistogramScale:(float)a3;
@end

@implementation PAEKeyerHistogram

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEKeyerHistogram)init
{
  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerHistogram;
  if ([(PAEKeyerHistogram *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)setHistogram:(void *)a3
{
  histogram = (void **)self->_histogram;
  if (histogram)
  {
    v4 = *histogram;
    if (*histogram)
    {
      histogram[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1BA9BFBA0](histogram, 0x1010C404946846FLL, a3);
  }
  operator new();
}

- (void)getHistogram
{
  return self->_histogram;
}

- (void)setHistogramScale:(float)a3
{
  self->_scale = a3;
}

- (float)getHistogramScale
{
  return self->_scale;
}

- (void)setHistogramArray:(id)a3
{
  histogram = (void **)self->_histogram;
  if (histogram)
  {
    v4 = *histogram;
    if (*histogram)
    {
      histogram[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1BA9BFBA0](histogram, 0x1010C404946846FLL, a3);
  }
  operator new();
}

- (PAEKeyerHistogram)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PAEKeyerHistogram;
  v4 = [(PAEKeyerHistogram *)&v10 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    -[PAEKeyerHistogram setHistogramArray:](v4, "setHistogramArray:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"Histogram"));
    v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"HistogramScale"];
    if (v7) {
      [v7 floatValue];
    }
    else {
      LODWORD(v8) = 1.0;
    }
    [(PAEKeyerHistogram *)v4 setHistogramScale:v8];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v5 = *((void *)self->_histogram + 1) - *(void *)self->_histogram;
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ((int)(v5 >> 2) >= 1)
  {
    uint64_t v7 = 0;
    histogram = self->_histogram;
    uint64_t v9 = (v5 >> 2);
    do
    {
      uint64_t v10 = *(unsigned int *)(*histogram + 4 * v7);
      if ((int)v10 >= 1)
      {
        objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v7));
        objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v10));
      }
      ++v7;
    }
    while (v9 != v7);
  }
  [a3 encodeObject:v6 forKey:@"Histogram"];
  v11 = NSNumber;
  [(PAEKeyerHistogram *)self getHistogramScale];
  uint64_t v12 = objc_msgSend(v11, "numberWithFloat:");

  [a3 encodeObject:v12 forKey:@"HistogramScale"];
}

- (void)dealloc
{
  histogram = (void **)self->_histogram;
  if (histogram)
  {
    v4 = *histogram;
    if (*histogram)
    {
      histogram[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1BA9BFBA0](histogram, 0x1010C404946846FLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)PAEKeyerHistogram;
  [(PAEKeyerHistogram *)&v5 dealloc];
}

@end