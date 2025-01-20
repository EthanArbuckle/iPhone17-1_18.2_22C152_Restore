@interface CMIMotionSampleRingBufferV1
+ (BOOL)isUnitQuaternion:(id *)a3;
- ($01BB1521EC52D44A8E7628F5261DCEC8)computeQuaternionForTimeStamp:(double)a3;
- ($3620120AE50D801D7923C2E7F4B06548)lastSample;
- (CMIMotionSampleRingBufferV1)initWithMaxCount:(double)a3;
- (unint64_t)count;
- (void)addMotionDataToRingBuffer:(id *)a3 withSampleCount:(int)a4;
- (void)dealloc;
@end

@implementation CMIMotionSampleRingBufferV1

- (CMIMotionSampleRingBufferV1)initWithMaxCount:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CMIMotionSampleRingBufferV1;
  v4 = [(CMIMotionSampleRingBufferV1 *)&v10 init];
  v5 = v4;
  if (v4
    && (v4->_maxCount = (int)a3,
        v6 = [[RingBuffer alloc] initWithLength:v4->_maxCount dataTypeSize:48], ringBuffer = v5->_ringBuffer, v5->_ringBuffer = v6, ringBuffer, !v5->_ringBuffer))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMIMotionSampleRingBufferV1;
  [(CMIMotionSampleRingBufferV1 *)&v2 dealloc];
}

+ (BOOL)isUnitQuaternion:(id *)a3
{
  return a3->var0 == 1.0 && a3->var1 == 0.0 && a3->var2 == 0.0 && a3->var3 == 0.0;
}

- (void)addMotionDataToRingBuffer:(id *)a3 withSampleCount:(int)a4
{
  if (a4 >= 1)
  {
    uint64_t v18 = v11;
    uint64_t v19 = v10;
    uint64_t v20 = v7;
    uint64_t v21 = v6;
    uint64_t v22 = v5;
    uint64_t v23 = v4;
    uint64_t v24 = v8;
    uint64_t v25 = v9;
    uint64_t v14 = a4;
    while (1)
    {
      double var1 = a3->var1;
      unsigned int v16 = [(RingBuffer *)self->_ringBuffer count];
      ringBuffer = self->_ringBuffer;
      if (!v16) {
        goto LABEL_6;
      }
      if (var1 > *((double *)[(RingBuffer *)ringBuffer lastElement] + 1)) {
        break;
      }
LABEL_7:
      ++a3;
      if (!--v14) {
        return;
      }
    }
    ringBuffer = self->_ringBuffer;
LABEL_6:
    [(RingBuffer *)ringBuffer appendElement:a3];
    goto LABEL_7;
  }
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)computeQuaternionForTimeStamp:(double)a3
{
  long long v31 = 0u;
  long long v32 = 0u;
  sub_F730(&v31);
  if ([(RingBuffer *)self->_ringBuffer count] >= 1)
  {
    double v5 = *((double *)[(RingBuffer *)self->_ringBuffer lastElement] + 1);
    ringBuffer = self->_ringBuffer;
    if (v5 < a3)
    {
      id v7 = [(RingBuffer *)ringBuffer lastElement];
LABEL_6:
      long long v10 = *((_OWORD *)v7 + 2);
      long long v31 = *((_OWORD *)v7 + 1);
      long long v32 = v10;
      goto LABEL_7;
    }
    double v8 = *((double *)[(RingBuffer *)ringBuffer firstElement] + 1);
    uint64_t v9 = self->_ringBuffer;
    if (v8 > a3)
    {
      id v7 = [(RingBuffer *)v9 firstElement];
      goto LABEL_6;
    }
    signed int v15 = [(RingBuffer *)v9 lastElementIndex];
    signed int v16 = [(RingBuffer *)self->_ringBuffer firstElementIndex];
    signed int v17 = [(RingBuffer *)self->_ringBuffer maxSize];
    if (v15 >= v16) {
      signed int v18 = 0;
    }
    else {
      signed int v18 = v17;
    }
    signed int v19 = v18 + v15;
    if (v18 + v15 >= v16)
    {
      signed int v20 = v17;
      uint64_t v21 = (v19 % v17);
      if (*((double *)[(RingBuffer *)self->_ringBuffer elementAtIndex:v21] + 1) <= a3)
      {
        uint64_t v22 = 0xFFFFFFFFLL;
LABEL_17:
        if (v22 != -1 && v21 != -1)
        {
          uint64_t v23 = [(RingBuffer *)self->_ringBuffer elementAtIndex:v22];
          id v7 = [(RingBuffer *)self->_ringBuffer elementAtIndex:v21];
          double v24 = *((double *)v7 + 1);
          double v25 = v23[1] - v24;
          if (v25 > 0.000001)
          {
            float v26 = (a3 - v24) / v25;
            sub_F7B0((uint64_t)v7 + 16, v23 + 2, v26);
            *(void *)&long long v31 = v27;
            *((void *)&v31 + 1) = v28;
            *(void *)&long long v32 = v29;
            *((void *)&v32 + 1) = v30;
            goto LABEL_7;
          }
          goto LABEL_6;
        }
      }
      else
      {
        while (v19 > v16)
        {
          uint64_t v22 = v21;
          uint64_t v21 = (--v19 % v20);
          if (*((double *)[(RingBuffer *)self->_ringBuffer elementAtIndex:v21] + 1) <= a3) {
            goto LABEL_17;
          }
        }
      }
    }
  }
LABEL_7:
  double v12 = *((double *)&v31 + 1);
  double v11 = *(double *)&v31;
  double v14 = *((double *)&v32 + 1);
  double v13 = *(double *)&v32;
  result.var3 = v14;
  result.var2 = v13;
  result.double var1 = v12;
  result.var0 = v11;
  return result;
}

- ($3620120AE50D801D7923C2E7F4B06548)lastSample
{
  return ($3620120AE50D801D7923C2E7F4B06548 *)[(RingBuffer *)self->_ringBuffer lastElement];
}

- (unint64_t)count
{
  return [(RingBuffer *)self->_ringBuffer count];
}

- (void).cxx_destruct
{
}

@end