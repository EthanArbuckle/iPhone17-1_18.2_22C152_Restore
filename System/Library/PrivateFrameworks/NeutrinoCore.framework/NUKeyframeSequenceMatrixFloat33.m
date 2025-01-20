@interface NUKeyframeSequenceMatrixFloat33
- (NUKeyframeSequenceMatrixFloat33)initWithCount:(unint64_t)a3 times:(id *)a4 values:(id *)a5;
- (__n128)valueOfKeyframeAtIndex:(uint64_t)a3;
- (uint64_t)sampleAtTime:(long long *)a3;
- (void)dealloc;
@end

@implementation NUKeyframeSequenceMatrixFloat33

- (uint64_t)sampleAtTime:(long long *)a3
{
  v3 = a1;
  if (*((unsigned char *)a3 + 12))
  {
    long long v9 = *a3;
    uint64_t v10 = *((void *)a3 + 2);
    uint64_t v6 = [a1 indexOfKeyframeAtOrBeforeTime:&v9];
    if ([v3 interpolation])
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:v3 file:@"NUKeyframeSequence.m" lineNumber:799 description:@"Don't know how to interpolate transforms"];
    }
    a1 = v3;
    uint64_t v4 = v6;
  }
  else
  {
    uint64_t v4 = 0;
  }
  return [a1 valueOfKeyframeAtIndex:v4];
}

- (__n128)valueOfKeyframeAtIndex:(uint64_t)a3
{
  if (a1[5])
  {
    uint64_t v5 = [a1 count] - 1;
    if (v5 >= a3) {
      uint64_t v5 = a3;
    }
    uint64_t v6 = a1[5] + 48 * (v5 & ~(v5 >> 63));
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F14998];
  }
  return *(__n128 *)v6;
}

- (void)dealloc
{
  values = self->_values;
  if (values) {
    free(values);
  }
  v4.receiver = self;
  v4.super_class = (Class)NUKeyframeSequenceMatrixFloat33;
  [(NUKeyframeSequence *)&v4 dealloc];
}

- (NUKeyframeSequenceMatrixFloat33)initWithCount:(unint64_t)a3 times:(id *)a4 values:(id *)a5
{
  v17.receiver = self;
  v17.super_class = (Class)NUKeyframeSequenceMatrixFloat33;
  v7 = [(NUKeyframeSequence *)&v17 initWithInterpolation:0 count:a3 times:a4];
  if (a3)
  {
    v8 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(a3, 0x30uLL, 0x1000040EED21634uLL);
    unint64_t v9 = 0;
    v7->_values = v8;
    unsigned int v10 = 1;
    do
    {
      uint64_t v11 = 3 * v9;
      v12 = (_OWORD *)((char *)v7->_values + 16 * v11);
      v13 = (long long *)((char *)a5 + 16 * v11);
      long long v14 = *v13;
      long long v15 = v13[2];
      v12[1] = v13[1];
      v12[2] = v15;
      _OWORD *v12 = v14;
      unint64_t v9 = v10++;
    }
    while (v9 < a3);
  }
  return v7;
}

@end