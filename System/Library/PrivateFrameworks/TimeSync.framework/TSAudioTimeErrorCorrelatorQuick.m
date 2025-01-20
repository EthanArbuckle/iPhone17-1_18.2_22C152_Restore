@interface TSAudioTimeErrorCorrelatorQuick
- (TSAudioTimeErrorCorrelatorQuick)initWithMaxCorrelationLength:(int64_t)a3 andUpscaleFactor:(int64_t)a4 forSamplingRate:(double)a5;
- (void)_makeBlock;
- (void)dealloc;
@end

@implementation TSAudioTimeErrorCorrelatorQuick

- (TSAudioTimeErrorCorrelatorQuick)initWithMaxCorrelationLength:(int64_t)a3 andUpscaleFactor:(int64_t)a4 forSamplingRate:(double)a5
{
  v20.receiver = self;
  v20.super_class = (Class)TSAudioTimeErrorCorrelatorQuick;
  v7 = -[TSAudioTimeErrorCorrelator initWithMaxCorrelationLength:andUpscaleFactor:forSamplingRate:](&v20, sel_initWithMaxCorrelationLength_andUpscaleFactor_forSamplingRate_, a5);
  v8 = v7;
  if (v7)
  {
    v7->_channelABuffer = (float *)malloc_type_calloc(2 * v7->super._maxCorrelationLength, 4uLL, 0x100004052888210uLL);
    v8->_scratchBuffer = (float *)malloc_type_calloc(2 * v8->super._maxCorrelationLength, 4uLL, 0x100004052888210uLL);
    v8->_correlationBuffer = (float *)malloc_type_calloc(v8->super._maxCorrelationLength * v8->super._upscaleFactor, 4uLL, 0x100004052888210uLL);
    v9 = (float *)malloc_type_calloc(v8->super._maxCorrelationLength * v8->super._upscaleFactor, 4uLL, 0x100004052888210uLL);
    v8->_interpollationIndiciesBuffer = v9;
    channelABuffer = v8->_channelABuffer;
    if (channelABuffer && v8->_scratchBuffer && (v8->_correlationBuffer ? (BOOL v11 = v9 == 0) : (BOOL v11 = 1), !v11))
    {
      bzero(channelABuffer, 8 * v8->super._maxCorrelationLength);
      bzero(v8->_scratchBuffer, 8 * v8->super._maxCorrelationLength);
      bzero(v8->_correlationBuffer, 4 * v8->super._upscaleFactor * v8->super._maxCorrelationLength);
      if (a4 * a3 >= 1)
      {
        uint64_t v13 = 0;
        float v14 = (float)a4;
        interpollationIndiciesBuffer = v8->_interpollationIndiciesBuffer;
        int64x2_t v16 = (int64x2_t)xmmword_1BA8E2770;
        uint64x2_t v17 = (uint64x2_t)vdupq_n_s64(a4 * a3 - 1);
        int64x2_t v18 = vdupq_n_s64(2uLL);
        do
        {
          int32x2_t v19 = vmovn_s64((int64x2_t)vcgeq_u64(v17, (uint64x2_t)v16));
          if (v19.i8[0]) {
            interpollationIndiciesBuffer[v13] = (float)v13 / v14;
          }
          if (v19.i8[4]) {
            interpollationIndiciesBuffer[v13 + 1] = (float)(v13 + 1) / v14;
          }
          v13 += 2;
          int64x2_t v16 = vaddq_s64(v16, v18);
        }
        while (((a4 * a3 + 1) & 0xFFFFFFFFFFFFFFFELL) != v13);
      }
      [(TSAudioTimeErrorCorrelatorQuick *)v8 _makeBlock];
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)_makeBlock
{
  channelABuffer = self->_channelABuffer;
  scratchBuffer = self->_scratchBuffer;
  correlationBuffer = self->_correlationBuffer;
  interpollationIndiciesBuffer = self->_interpollationIndiciesBuffer;
  double samplingRate = self->super._samplingRate;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__TSAudioTimeErrorCorrelatorQuick__makeBlock__block_invoke;
  v7[3] = &__block_descriptor_88_e18_d32__0r_f8r_f16q24l;
  long long v8 = *(_OWORD *)&self->super._maxCorrelationLength;
  v9 = channelABuffer;
  v10 = scratchBuffer;
  BOOL v11 = correlationBuffer;
  v12 = interpollationIndiciesBuffer;
  double v13 = samplingRate;
  [(TSAudioTimeErrorCorrelator *)self setCorrelationBlock:v7];
}

void __45__TSAudioTimeErrorCorrelatorQuick__makeBlock__block_invoke(uint64_t a1, const float *__A, const float *a3, int64_t __N)
{
  if (*(void *)(a1 + 32) < __N) {
    __45__TSAudioTimeErrorCorrelatorQuick__makeBlock__block_invoke_cold_1();
  }
  if (__A && a3)
  {
    float __C = 0.0;
    vDSP_Length __I = 0;
    uint64_t v8 = *(void *)(a1 + 40);
    vDSP_vabs(__A, 1, *(float **)(a1 + 48), 1, __N);
    vDSP_maxvi(__A, 1, &__C, &__I, __N);
    if (__C <= 0.05)
    {
      printf("insufficient channel A signal level %f\n", __C);
    }
    else
    {
      vDSP_vabs(a3, 1, *(float **)(a1 + 48), 1, __N);
      vDSP_maxvi(a3, 1, &__C, &__I, __N);
      if (__C <= 0.05)
      {
        printf("insufficient channel B signal level %f\n", __C);
      }
      else
      {
        vDSP_Length v9 = v8 * __N;
        bzero(*(void **)(a1 + 48), 8 * *(void *)(a1 + 32));
        bzero(*(void **)(a1 + 56), 8 * *(void *)(a1 + 32));
        bzero(*(void **)(a1 + 64), 4 * *(void *)(a1 + 40) * *(void *)(a1 + 32));
        if (__N >= 0) {
          unint64_t v10 = __N;
        }
        else {
          unint64_t v10 = __N + 1;
        }
        memcpy((void *)(*(void *)(a1 + 48) + 4 * (v10 >> 1)), __A, 4 * __N);
        vDSP_conv(*(const float **)(a1 + 48), 1, a3, 1, *(float **)(a1 + 56), 1, __N, __N);
        vDSP_vqint(*(const float **)(a1 + 56), *(const float **)(a1 + 72), 1, *(float **)(a1 + 64), 1, v9, __N);
        vDSP_maxvi(*(const float **)(a1 + 64), 1, &__C, &__I, v9);
      }
    }
  }
}

- (void)dealloc
{
  free(self->_channelABuffer);
  free(self->_scratchBuffer);
  free(self->_correlationBuffer);
  free(self->_interpollationIndiciesBuffer);
  v3.receiver = self;
  v3.super_class = (Class)TSAudioTimeErrorCorrelatorQuick;
  [(TSAudioTimeErrorCorrelatorQuick *)&v3 dealloc];
}

void __45__TSAudioTimeErrorCorrelatorQuick__makeBlock__block_invoke_cold_1()
{
  __assert_rtn("-[TSAudioTimeErrorCorrelatorQuick _makeBlock]_block_invoke", "TSAudioTimeErrorCalculator.m", 182, "correlationLength <= maxCorrelationLength");
}

@end