@interface WBSHistorySessionIntervalCache
- (WBSHistorySessionIntervalCache)init;
- (WBSHistorySessionIntervalCache)initWithCalendar:(id)a3;
- (double)_beginningOfSessionContainingTime:(double)a3;
- (double)beginningOfSessionContainingTime:(double)a3;
- (id).cxx_construct;
- (void)_getSessionIntervalForTime:(double)a3 beginningOfDay:(double *)a4 beginningOfNextDay:(double *)a5;
@end

@implementation WBSHistorySessionIntervalCache

- (WBSHistorySessionIntervalCache)init
{
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v4 = [(WBSHistorySessionIntervalCache *)self initWithCalendar:v3];

  return v4;
}

- (WBSHistorySessionIntervalCache)initWithCalendar:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSHistorySessionIntervalCache;
  v6 = [(WBSHistorySessionIntervalCache *)&v11 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.SafariShared.WBSHistorySessionIntervalCache", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_calendar, a3);
    v9 = v6;
  }

  return v6;
}

- (double)beginningOfSessionContainingTime:(double)a3
{
  uint64_t v7 = 0;
  v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WBSHistorySessionIntervalCache_beginningOfSessionContainingTime___block_invoke;
  block[3] = &unk_1E5C9C820;
  block[4] = self;
  block[5] = &v7;
  *(double *)&block[6] = a3;
  dispatch_sync(queue, block);
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __67__WBSHistorySessionIntervalCache_beginningOfSessionContainingTime___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _beginningOfSessionContainingTime:*(double *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)_beginningOfSessionContainingTime:(double)a3
{
  double v21 = a3;
  p_intervalCache = &self->_intervalCache;
  id v5 = std::__equal_range[abi:sn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,double *,double *,double,std::__identity>(self->_intervalCache.m_buffer, &self->_intervalCache.m_buffer[self->_intervalCache.m_size], &v21);
  if (v6 - (void)v5 == 16) {
    return v21;
  }
  uint64_t v7 = v5;
  int64_t v8 = (char *)v5 - (char *)p_intervalCache->m_buffer;
  if (v6 - (void)v5 == 8)
  {
    if ((v8 & 8) == 0) {
      return v21;
    }
    uint64_t v7 = v5 + 1;
  }
  else if ((v8 & 8) != 0)
  {
    return *(v5 - 1);
  }
  uint64_t v19 = 0;
  double v20 = 0.0;
  uint64_t v10 = &v20;
  [(WBSHistorySessionIntervalCache *)self _getSessionIntervalForTime:&v20 beginningOfDay:&v19 beginningOfNextDay:v21];
  m_buffer = self->_intervalCache.m_buffer;
  uint64_t v12 = v7 - m_buffer;
  uint64_t m_size = self->_intervalCache.m_size;
  if (m_size == self->_intervalCache.m_capacity)
  {
    uint64_t v10 = (double *)WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)p_intervalCache, m_size + 1, (unint64_t)&v20);
    LODWORD(m_size) = self->_intervalCache.m_size;
    m_buffer = self->_intervalCache.m_buffer;
  }
  v14 = &m_buffer[v12];
  memmove(v14 + 1, v14, 8 * m_size - 8 * v12);
  double *v14 = *v10;
  unsigned int m_capacity = self->_intervalCache.m_capacity;
  uint64_t v16 = self->_intervalCache.m_size + 1;
  self->_intervalCache.uint64_t m_size = v16;
  if (v16 == m_capacity)
  {
    v17 = (double *)WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)p_intervalCache, v16 + 1, (unint64_t)&v19);
    LODWORD(v16) = self->_intervalCache.m_size;
  }
  else
  {
    v17 = (double *)&v19;
  }
  v18 = &self->_intervalCache.m_buffer[v12 + 1];
  memmove(v18 + 1, v18, 8 * v16 - 8 * (v12 + 1));
  double *v18 = *v17;
  ++self->_intervalCache.m_size;
  return v20;
}

- (void)_getSessionIntervalForTime:(double)a3 beginningOfDay:(double *)a4 beginningOfNextDay:(double *)a5
{
  int64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  id v11 = 0;
  double v12 = 0.0;
  [(NSCalendar *)self->_calendar rangeOfUnit:16 startDate:&v11 interval:&v12 forDate:v8];
  id v9 = v11;
  [v9 timeIntervalSinceReferenceDate];
  *a4 = v10;
  *a5 = v10 + v12;
}

- (void).cxx_destruct
{
  m_buffer = self->_intervalCache.m_buffer;
  if (m_buffer)
  {
    self->_intervalCache.m_buffer = 0;
    self->_intervalCache.unsigned int m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end