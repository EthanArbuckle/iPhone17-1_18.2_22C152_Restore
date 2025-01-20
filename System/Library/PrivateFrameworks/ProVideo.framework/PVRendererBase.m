@interface PVRendererBase
- (BOOL)immediatelyCancelPendingRequests;
- (HGRef<PVRenderJob>)startJobForDelegate:(id)a3 time:(id *)a4 playback:(BOOL)a5;
- (NSString)name;
- (PVRendererBase)init;
- (PVRendererBase)initWithOptions:(id)a3;
- (PVVideoCompositingContext)compositingContext;
- (double)averageStat:(int)a3;
- (double)getLastStat:(int)a3;
- (double)numFrames;
- (double)windowedFPS;
- (id).cxx_construct;
- (id)_outputColorSpace:(id)a3 renderingIntent:(int)a4;
- (id)_workingColorSpace:(id)a3 outputColorSpace:(id)a4;
- (id)description;
- (unint64_t)taskResidentSize;
- (unsigned)frameCount;
- (void)addFrameStats:(const void *)a3;
- (void)addRenderJobInFlight:(HGRef<PVRenderJob>)a3;
- (void)cancelAllPendingRequests;
- (void)cleanupMemoryCaches;
- (void)dealloc;
- (void)printAndClearStats;
- (void)printAndClearStats:(BOOL)a3;
- (void)renderJobFinished:(HGRef<PVRenderJob>)a3;
- (void)setCompositingContext:(id)a3;
- (void)setImmediatelyCancelPendingRequests:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOutputColorSpace:(id)a3;
- (void)trackStats:(BOOL)a3;
@end

@implementation PVRendererBase

- (PVRendererBase)init
{
  return [(PVRendererBase *)self initWithOptions:0];
}

- (PVRendererBase)initWithOptions:(id)a3
{
  id v4 = a3;
  if (-[PVRendererBase initWithOptions:]::onceToken != -1) {
    dispatch_once(&-[PVRendererBase initWithOptions:]::onceToken, &__block_literal_global_5);
  }
  v15.receiver = self;
  v15.super_class = (Class)PVRendererBase;
  v5 = [(PVRendererBase *)&v15 init];
  v6 = v5;
  if (v5)
  {
    atomic_store(0, (unsigned __int8 *)&v5->_hasRendered);
    v7 = [v4 objectForKeyedSubscript:@"kPVRendererBase_RenderingIntent"];
    if (v7) {
      uint64_t v8 = [v7 intValue];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = [(PVRendererBase *)v6 _outputColorSpace:v4 renderingIntent:v8];
    v10 = [(PVRendererBase *)v6 _workingColorSpace:v4 outputColorSpace:v9];
    compositingContext = v6->_compositingContext;
    v6->_compositingContext = v10;

    [(PVRendererBase *)v6 updateDestinationFormatForOutputColorSpace];
    v6->_immediatelyCancelPendingRequests = 0;
    v12 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    inFlightRenderJobsLock = v6->_inFlightRenderJobsLock;
    v6->_inFlightRenderJobsLock = v12;

    operator new();
  }

  return 0;
}

- (id)_outputColorSpace:(id)a3 renderingIntent:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"kPVRendererBase_OutputColorSpace"];

    if (v8)
    {
      uint64_t v8 = [v7 objectForKeyedSubscript:@"kPVRendererBase_OutputColorSpace"];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v10 = [v9 stringForKey:@"PVRendererColorSpaceOverride"];
  v11 = [v10 lowercaseString];

  if ([v11 isEqualToString:@"p3"])
  {
    uint64_t v12 = +[PVColorSpace p3d65GammaColorSpace];
  }
  else if ([v11 isEqualToString:@"srgb"])
  {
    uint64_t v12 = +[PVColorSpace sRGBColorSpace];
  }
  else
  {
    if (![v11 isEqualToString:@"709"]) {
      goto LABEL_13;
    }
    uint64_t v12 = +[PVColorSpace rec709GammaColorSpace];
  }
  v13 = (void *)v12;
  if (v12)
  {
    NSLog(&cfstr_OverridingColo.isa, self, v8, v12);
    id v14 = v13;

    uint64_t v8 = v14;
    goto LABEL_16;
  }
LABEL_13:
  if (v8)
  {
    id v14 = 0;
  }
  else
  {
    +[PVVideoCompositingContext defaultOutputColorSpaceWithRenderingIntent:v4];
    uint64_t v8 = v14 = 0;
  }
LABEL_16:

  return v8;
}

- (id)_workingColorSpace:(id)a3 outputColorSpace:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5
    || ([v5 objectForKeyedSubscript:@"kPVRendererBase_WorkingColorSpace"],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7)
    || ([v5 objectForKeyedSubscript:@"kPVRendererBase_WorkingColorSpace"],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v8 = +[PVVideoCompositingContext defaultWorkingColorSpaceWithOutputColorSpace:v6];
  }

  return v8;
}

- (void)dealloc
{
  [(PVRendererBase *)self cancelAllPendingRequests];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43670] object:0];

  [(PVRendererBase *)self printAndClearStats:1];
  perfStatsLock = self->_perfStatsLock;
  if (perfStatsLock) {
    (*((void (**)(HGSynchronizable *))perfStatsLock->var0 + 1))(perfStatsLock);
  }
  perfStats = (PVPerfStats *)self->_perfStats;
  if (perfStats)
  {
    PVPerfStats::~PVPerfStats(perfStats);
    MEMORY[0x1BA9BFBA0]();
  }
  v6.receiver = self;
  v6.super_class = (Class)PVRendererBase;
  [(PVRendererBase *)&v6 dealloc];
}

- (void)cancelAllPendingRequests
{
  [(NSLock *)self->_inFlightRenderJobsLock lock];
  objc_super v6 = 0;
  v7 = 0;
  uint64_t v8 = 0;
  std::vector<HGRef<PVRenderJob>>::__init_with_size[abi:ne180100]<HGRef<PVRenderJob>*,HGRef<PVRenderJob>*>((uint64_t *)&v6, (uint64_t *)self->_inFlightRenderJobs.__begin_, (uint64_t *)self->_inFlightRenderJobs.__end_, ((char *)self->_inFlightRenderJobs.__end_ - (char *)self->_inFlightRenderJobs.__begin_) >> 3);
  [(NSLock *)self->_inFlightRenderJobsLock unlock];
  BOOL v3 = [(PVRendererBase *)self immediatelyCancelPendingRequests];
  uint64_t v4 = v6;
  if (v6 != v7)
  {
    int v5 = v3;
    do
      PVRenderJob::CancelJob(*v4++, v5);
    while (v4 != v7);
  }
  uint64_t v9 = &v6;
  std::vector<HGRef<PVRenderJob>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);
}

- (HGRef<PVRenderJob>)startJobForDelegate:(id)a3 time:(id *)a4 playback:(BOOL)a5
{
  uint64_t v9 = v5;
  id v10 = a3;
  atomic_store(1u, (unsigned __int8 *)&self->_hasRendered);
  v11 = (PVRenderJob *)HGObject::operator new(0x118uLL);
  PVRenderJob::PVRenderJob(v11, v10);
  *uint64_t v9 = v11;
  int add = atomic_fetch_add((atomic_uint *volatile)&self->_frameCount, 1u);
  CMTime v16 = *(CMTime *)a4;
  PVRenderJob::InitFrameStats(v11, add, &v16, a5);
  v13 = *v9;
  objc_super v15 = v13;
  if (v13) {
    (*(void (**)(PVRenderJob *))(*(void *)v13 + 16))(v13);
  }
  [(PVRendererBase *)self addRenderJobInFlight:&v15];
  if (v15) {
    (*(void (**)(PVRenderJob *))(*(void *)v15 + 24))(v15);
  }
  PVRenderJob::StartHandlingRequest(v13);

  return v14;
}

- (void)addRenderJobInFlight:(HGRef<PVRenderJob>)a3
{
  [(NSLock *)self->_inFlightRenderJobsLock lock];
  end = self->_inFlightRenderJobs.__end_;
  if (end >= self->_inFlightRenderJobs.__end_cap_.__value_)
  {
    v7 = (void *)std::vector<HGRef<PVRenderJob>>::__push_back_slow_path<HGRef<PVRenderJob> const&>((uint64_t *)&self->_inFlightRenderJobs, (uint64_t *)a3.var0);
  }
  else
  {
    uint64_t v6 = *(void *)a3.var0;
    void *end = *(void *)a3.var0;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
    }
    v7 = end + 1;
    self->_inFlightRenderJobs.__end_ = end + 1;
  }
  self->_inFlightRenderJobs.__end_ = v7;
  inFlightRenderJobsLock = self->_inFlightRenderJobsLock;

  [(NSLock *)inFlightRenderJobsLock unlock];
}

- (void)renderJobFinished:(HGRef<PVRenderJob>)a3
{
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", a2) >= 1) {
    kdebug_trace();
  }
  [(NSLock *)self->_inFlightRenderJobsLock lock];
  begin = (PVRenderJob **)self->_inFlightRenderJobs.__begin_;
  end = (PVRenderJob **)self->_inFlightRenderJobs.__end_;
  if (begin != end)
  {
    v7 = *(PVRenderJob **)a3.var0;
    uint64_t v8 = -(uint64_t)begin;
    while (*begin != v7)
    {
      ++begin;
      v8 -= 8;
      if (begin == end) {
        goto LABEL_15;
      }
    }
    if (PVRenderJob::State(v7) == 4) {
      [(PVRendererBase *)self addFrameStats:PVRenderJob::GetFrameStats(*begin)];
    }
    if (*begin) {
      (*(void (**)(void))(*(void *)*begin + 24))(*begin);
    }
    *begin = 0;
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<HGRef<PVRenderJob> *,HGRef<PVRenderJob> *,HGRef<PVRenderJob> *>((uint64_t)&v13, (uint64_t *)(8 - v8), (uint64_t *)self->_inFlightRenderJobs.__end_, (uint64_t *)-v8);
    id v10 = v9;
    v11 = (uint64_t *)self->_inFlightRenderJobs.__end_;
    if (v11 != v9)
    {
      do
        std::allocator<HGRef<PVRenderJob>>::destroy[abi:ne180100]((uint64_t)&self->_inFlightRenderJobs.__end_cap_, --v11);
      while (v11 != v10);
    }
    self->_inFlightRenderJobs.__end_ = v10;
  }
LABEL_15:
  [(NSLock *)self->_inFlightRenderJobsLock unlock];
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v12) >= 1) {
    kdebug_trace();
  }
}

- (void)setOutputColorSpace:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_hasRendered);
  if (v4)
  {
    NSLog(&cfstr_WarningCannotC.isa, self);
  }
  else
  {
    int v5 = [(PVRendererBase *)self compositingContext];
    uint64_t v6 = [v5 outputColorSpace];
    char v7 = [v6 isEqual:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = [(PVRendererBase *)self compositingContext];
      [v8 setOutputColorSpace:v9];

      [(PVRendererBase *)self updateDestinationFormatForOutputColorSpace];
    }
  }
}

- (void)cleanupMemoryCaches
{
}

- (unsigned)frameCount
{
  return atomic_load(&self->_frameCount.__a_.__a_value);
}

- (void)setName:(id)a3
{
  unsigned __int8 v4 = (__CFString *)a3;
  int v5 = v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = &stru_1F119C770;
  }
  objc_storeStrong((id *)&self->_name, v6);
  perfStatsLock = self->_perfStatsLock;
  char v8 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  PVPerfStats::SetName((PVPerfStats *)self->_perfStats, (__CFString *)self->_name);
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);
}

- (void)addFrameStats:(const void *)a3
{
  if (PVPerfStats::FrameStats::GetSize((PVPerfStats::FrameStats *)a3))
  {
    perfStatsLock = self->_perfStatsLock;
    char v6 = 0;
    HGSynchronizable::Lock(perfStatsLock);
    if (self->_trackStats) {
      PVPerfStats::AddFrameStats((PVPerfStats *)self->_perfStats, (const PVPerfStats::FrameStats *)a3);
    }
    HGSynchronizer::~HGSynchronizer(&perfStatsLock);
  }
}

- (void)trackStats:(BOOL)a3
{
  perfStatsLock = self->_perfStatsLock;
  char v6 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  self->_trackStats = a3;
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);
}

- (void)printAndClearStats
{
}

- (void)printAndClearStats:(BOOL)a3
{
  if (-[PVRendererBase printAndClearStats:]::onceToken != -1) {
    dispatch_once(&-[PVRendererBase printAndClearStats:]::onceToken, &__block_literal_global_40);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __37__PVRendererBase_printAndClearStats___block_invoke_2;
  v5[3] = &unk_1E61692B0;
  v5[4] = self;
  BOOL v6 = a3;
  dispatch_sync((dispatch_queue_t)-[PVRendererBase printAndClearStats:]::sSerialLogger, v5);
}

void __37__PVRendererBase_printAndClearStats___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.ProVideo.RenderLogQ", 0);
  v1 = (void *)-[PVRendererBase printAndClearStats:]::sSerialLogger;
  -[PVRendererBase printAndClearStats:]::sSerialLogger = (uint64_t)v0;
}

void __37__PVRendererBase_printAndClearStats___block_invoke_2(uint64_t a1)
{
  v2 = *(HGSynchronizable **)(*(void *)(a1 + 32) + 48);
  char v3 = 0;
  HGSynchronizable::Lock(v2);
  PVPerfStats::Print(*(PVPerfStats **)(*(void *)(a1 + 32) + 56), 0, 1);
  if (*(unsigned char *)(a1 + 40)) {
    PVPerfStats::Reset(*(PVPerfStats **)(*(void *)(a1 + 32) + 56));
  }
  HGSynchronizer::~HGSynchronizer(&v2);
}

- (double)windowedFPS
{
  perfStatsLock = self->_perfStatsLock;
  char v6 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  double v3 = PVPerfStats::WindowedFPS((PVPerfStats *)self->_perfStats);
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);
  return v3;
}

- (double)numFrames
{
  perfStatsLock = self->_perfStatsLock;
  char v6 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  double v3 = PVPerfStats::NumFrames((PVPerfStats *)self->_perfStats);
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);
  return v3;
}

- (double)averageStat:(int)a3
{
  perfStatsLock = self->_perfStatsLock;
  char v17 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  uint64_t v5 = PVPerfStats::AverageFrameStats((PVPerfStats *)self->_perfStats);
  long long v6 = *(_OWORD *)v5;
  long long v7 = *(_OWORD *)(v5 + 16);
  long long v8 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&v12[10] = *(_OWORD *)(v5 + 42);
  v11[1] = v7;
  *(_OWORD *)uint64_t v12 = v8;
  v11[0] = v6;
  HGRef<PVRenderJob> v14 = 0;
  uint64_t v15 = 0;
  __p = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)(v5 + 64), *(void *)(v5 + 72), (uint64_t)(*(void *)(v5 + 72) - *(void *)(v5 + 64)) >> 3);
  double ValueForIndex = PVPerfStats::FrameStats::GetValueForIndex((PVPerfStats::FrameStats *)v11, a3);
  if (__p)
  {
    HGRef<PVRenderJob> v14 = __p;
    operator delete(__p);
  }
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);
  return ValueForIndex;
}

- (double)getLastStat:(int)a3
{
  perfStatsLock = self->_perfStatsLock;
  char v17 = 0;
  HGSynchronizable::Lock(perfStatsLock);
  uint64_t FrameStats = PVPerfStats::LastFrameStats((PVPerfStats *)self->_perfStats);
  long long v6 = *(_OWORD *)FrameStats;
  long long v7 = *(_OWORD *)(FrameStats + 16);
  long long v8 = *(_OWORD *)(FrameStats + 32);
  *(_OWORD *)&v12[10] = *(_OWORD *)(FrameStats + 42);
  v11[1] = v7;
  *(_OWORD *)uint64_t v12 = v8;
  v11[0] = v6;
  HGRef<PVRenderJob> v14 = 0;
  uint64_t v15 = 0;
  __p = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)(FrameStats + 64), *(void *)(FrameStats + 72), (uint64_t)(*(void *)(FrameStats + 72) - *(void *)(FrameStats + 64)) >> 3);
  double ValueForIndex = PVPerfStats::FrameStats::GetValueForIndex((PVPerfStats::FrameStats *)v11, a3);
  if (__p)
  {
    HGRef<PVRenderJob> v14 = __p;
    operator delete(__p);
  }
  HGSynchronizer::~HGSynchronizer(&perfStatsLock);
  return ValueForIndex;
}

- (unint64_t)taskResidentSize
{
  memset(v3, 0, sizeof(v3));
  PVGetMemUsageStats((uint64_t)v3);
  return *((void *)&v3[0] + 1);
}

- (id)description
{
  double v3 = [NSString stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  unsigned __int8 v4 = [(PVRendererBase *)self name];
  if (v4)
  {
    uint64_t v5 = [(PVRendererBase *)self name];
    char v6 = [v5 isEqual:&stru_1F119C770];

    if ((v6 & 1) == 0)
    {
      long long v7 = [(PVRendererBase *)self name];
      uint64_t v8 = [v3 stringByAppendingFormat:@" %@", v7];

      double v3 = (void *)v8;
    }
  }
  id v9 = [v3 stringByAppendingString:@">"];

  return v9;
}

- (PVVideoCompositingContext)compositingContext
{
  return self->_compositingContext;
}

- (void)setCompositingContext:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)immediatelyCancelPendingRequests
{
  return self->_immediatelyCancelPendingRequests;
}

- (void)setImmediatelyCancelPendingRequests:(BOOL)a3
{
  self->_immediatelyCancelPendingRequests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_compositingContext, 0);
  objc_storeStrong((id *)&self->_inFlightRenderJobsLock, 0);
  p_inFlightRenderJobs = &self->_inFlightRenderJobs;
  std::vector<HGRef<PVRenderJob>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_inFlightRenderJobs);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end