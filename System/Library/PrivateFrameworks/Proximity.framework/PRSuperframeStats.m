@interface PRSuperframeStats
- (PRSuperframeStats)initWithStats:(const void *)a3;
- (ResponderSuperframeStats)stats;
- (id).cxx_construct;
@end

@implementation PRSuperframeStats

- (PRSuperframeStats)initWithStats:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PRSuperframeStats;
  v4 = [(PRSuperframeStats *)&v9 init];
  if (v4)
  {
    std::allocate_shared[abi:ne180100]<rose::ResponderSuperframeStats,std::allocator<rose::ResponderSuperframeStats>,rose::ResponderSuperframeStats const&,void>((uint64_t *)a3, &v8);
    long long v5 = v8;
    long long v8 = 0uLL;
    v6 = (std::__shared_weak_count *)*((void *)v4 + 2);
    *(_OWORD *)(v4 + 8) = v5;
    if (v6)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      if (*((void *)&v8 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
      }
    }
  }
  return (PRSuperframeStats *)v4;
}

- (ResponderSuperframeStats)stats
{
  ptr = self->_stats.__ptr_;
  unsigned __int16 var1 = ptr->var1;
  retstr->var0 = ptr->var0;
  retstr->unsigned __int16 var1 = var1;
  int var0_low = LODWORD(ptr[2].var0);
  long long v8 = *(_OWORD *)&ptr[1].var0;
  ResponderSuperframeCompleteEvent var2 = ptr[1].var2;
  ResponderSuperframeCompleteEvent v9 = ptr->var2;
  *(void *)&retstr[2].unsigned __int16 var1 = 0;
  retstr = (ResponderSuperframeStats *)((char *)retstr + 72);
  *(ResponderSuperframeCompleteEvent *)&retstr[-2].unsigned __int16 var1 = v9;
  *(_OWORD *)&retstr[-2].var2.var3 = v8;
  *(ResponderSuperframeCompleteEvent *)&retstr[-1].unsigned __int16 var1 = var2;
  LODWORD(retstr[-1].var2.var3) = var0_low;
  *(void *)&retstr->unsigned __int16 var1 = 0;
  *(void *)&retstr->var2.var0 = 0;
  result = (ResponderSuperframeStats *)std::vector<Rose::ResponderSuperframeRxPacketInfo>::__init_with_size[abi:ne180100]<Rose::ResponderSuperframeRxPacketInfo*,Rose::ResponderSuperframeRxPacketInfo*>(retstr, *(const void **)&ptr[2].var1, *(void *)&ptr[2].var2.var0, (uint64_t)(*(void *)&ptr[2].var2.var0 - *(void *)&ptr[2].var1) >> 4);
  *(_OWORD *)&retstr->var2.var3 = *(_OWORD *)&ptr[3].var0;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_stats.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end