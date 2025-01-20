@interface MXMSampleTimeSeries
- (MXMSampleTimeSeries)init;
- (MXMSampleTimeSeries)initWithAbsoluteTimeSeries:(unint64_t *)a3 length:(unint64_t)a4;
- (MXMSampleTimeSeries)initWithContinuousTimeSeries:(unint64_t *)a3 length:(unint64_t)a4;
- (MXMSampleTimeSeries)initWithTimeSeries:(double *)a3 tag:(id)a4 unit:(id)a5 length:(unint64_t)a6;
- (id)timeIndex;
- (void)_appendAbsoluteTime:(unint64_t)a3;
@end

@implementation MXMSampleTimeSeries

- (id)timeIndex
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_time);
  return WeakRetained;
}

- (MXMSampleTimeSeries)init
{
  return [(MXMSampleTimeSeries *)self initWithAbsoluteTimeSeries:0 length:0];
}

- (MXMSampleTimeSeries)initWithAbsoluteTimeSeries:(unint64_t *)a3 length:(unint64_t)a4
{
  v7 = malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  v8 = v7;
  if (a4)
  {
    v9 = v7;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = *a3++;
      +[MXMMachUtils _nanosecondsWithAbsoluteTime:v11];
      *v9++ = v12;
      --v10;
    }
    while (v10);
  }
  objc_initWeak(&location, self);
  v13 = +[MXMClockSampleTag absoluteTime];
  v14 = [MEMORY[0x263F08C98] nanoseconds];
  v15 = [(MXMSampleTimeSeries *)self initWithTimeSeries:v8 tag:v13 unit:v14 length:a4];

  if (v15)
  {
    id v16 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v15->_time, v16);
  }
  free(v8);
  objc_destroyWeak(&location);
  return v15;
}

- (MXMSampleTimeSeries)initWithContinuousTimeSeries:(unint64_t *)a3 length:(unint64_t)a4
{
  if (initWithContinuousTimeSeries_length__onceToken != -1) {
    dispatch_once(&initWithContinuousTimeSeries_length__onceToken, &__block_literal_global_2);
  }
  v7 = malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  v8 = v7;
  if (a4)
  {
    v9 = v7;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = *a3++;
      +[MXMMachUtils _nanosecondsWithContinuousTime:v11];
      *v9++ = v12;
      --v10;
    }
    while (v10);
  }
  objc_initWeak(&location, self);
  v13 = +[MXMClockSampleTag continuousTime];
  v14 = [MEMORY[0x263F08C98] nanoseconds];
  v15 = [(MXMSampleTimeSeries *)self initWithTimeSeries:v8 tag:v13 unit:v14 length:a4];

  if (v15)
  {
    id v16 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v15->_time, v16);
  }
  free(v8);
  objc_destroyWeak(&location);
  return v15;
}

uint64_t __59__MXMSampleTimeSeries_initWithContinuousTimeSeries_length___block_invoke()
{
  initWithContinuousTimeSeries_length__transl = (uint64_t)objc_alloc_init(MEMORY[0x263F6C598]);
  return MEMORY[0x270F9A758]();
}

- (MXMSampleTimeSeries)initWithTimeSeries:(double *)a3 tag:(id)a4 unit:(id)a5 length:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  v15.receiver = self;
  v15.super_class = (Class)MXMSampleTimeSeries;
  uint64_t v12 = [(MXMSampleSet *)&v15 initWithTime:0 tag:v10 unit:v11 attributes:0 doubleValues:a3 length:a6];
  if (v12)
  {
    id v13 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v12->_time, v13);
  }
  objc_destroyWeak(&location);

  return v12;
}

- (void)_appendAbsoluteTime:(unint64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  [(MXMSampleSet *)v4 _prepareUnderlyingBufferSizeWithAdditionalBytes:8];
  +[MXMMachUtils _nanosecondsWithAbsoluteTime:a3];
  uint64_t v6 = v5;
  uint64_t v7 = [(MXMSampleSet *)v4 underlyingBuffer];
  *(void *)(v7 + 8 * (void)[(MXMSampleSet *)v4 index][8]) = v6;
  uint64_t v8 = [(MXMSampleSet *)v4 index];
  ++*(void *)(v8 + 8);
  objc_sync_exit(v4);

  [(MXMSampleSet *)v4 setCachedSamples:0];
}

- (void).cxx_destruct
{
}

@end