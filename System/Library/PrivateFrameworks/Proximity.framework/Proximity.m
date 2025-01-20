uint64_t _GLOBAL__sub_I_BtProximityFilters_cpp()
{
  uint64_t vars8;

  BtProxMaxFilter::BtProxMaxFilter((BtProxMaxFilter *)&maxFilter);
  __cxa_atexit((void (*)(void *))BtProxMaxFilter::~BtProxMaxFilter, &maxFilter, &dword_19DFF5000);
  BtProxMeanFilter::BtProxMeanFilter((BtProxMeanFilter *)&meanFilter);
  __cxa_atexit((void (*)(void *))BtProxMeanFilter::~BtProxMeanFilter, &meanFilter, &dword_19DFF5000);
  BtProxMedianFilter::BtProxMedianFilter((BtProxMedianFilter *)&medianFilter);
  __cxa_atexit((void (*)(void *))BtProxMedianFilter::~BtProxMedianFilter, &medianFilter, &dword_19DFF5000);
  BtProxMaxOfMeanOfChanFilter::BtProxMaxOfMeanOfChanFilter((BtProxMaxOfMeanOfChanFilter *)&maxOfMeanOfChanFilter);
  __cxa_atexit((void (*)(void *))BtProxMaxOfMeanOfChanFilter::~BtProxMaxOfMeanOfChanFilter, &maxOfMeanOfChanFilter, &dword_19DFF5000);
  BtProxMedianOfMeanOfChanFilter::BtProxMedianOfMeanOfChanFilter((BtProxMedianOfMeanOfChanFilter *)&medianOfMeanOfChanFilter);
  __cxa_atexit((void (*)(void *))BtProxMedianOfMeanOfChanFilter::~BtProxMedianOfMeanOfChanFilter, &medianOfMeanOfChanFilter, &dword_19DFF5000);
  BtProxOlympicFilter::BtProxOlympicFilter((BtProxOlympicFilter *)&olympic1Filter, 1);
  __cxa_atexit((void (*)(void *))BtProxOlympicFilter::~BtProxOlympicFilter, &olympic1Filter, &dword_19DFF5000);
  BtProxOlympicFilter::BtProxOlympicFilter((BtProxOlympicFilter *)&olympic2Filter, 2);
  __cxa_atexit((void (*)(void *))BtProxOlympicFilter::~BtProxOlympicFilter, &olympic2Filter, &dword_19DFF5000);
  BtProxRayleighFilter::BtProxRayleighFilter((BtProxRayleighFilter *)&rayleighFilter);
  return __cxa_atexit((void (*)(void *))BtProxRayleighFilter::~BtProxRayleighFilter, &rayleighFilter, &dword_19DFF5000);
}

void BtProxOlympicFilter::BtProxOlympicFilter(BtProxOlympicFilter *this, int __val)
{
  std::to_string(&v6, __val);
  v4 = std::string::insert(&v6, 0, "OLYMPIC_FILTER");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v6.__r_.__value_.__l.__data_);
  }
  *(void *)this = &unk_1EF08DFD8;
  *((_DWORD *)this + 8) = __val;
}

void sub_19DFF7054(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BtProximityFilterBase::BtProximityFilterBase(uint64_t a1, const std::string *a2)
{
  *(void *)a1 = &unk_1EF08E058;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  std::string::operator=((std::string *)(a1 + 8), a2);
  return a1;
}

void sub_19DFF70E4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void BtProxMedianOfMeanOfChanFilter::BtProxMedianOfMeanOfChanFilter(BtProxMedianOfMeanOfChanFilter *this)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "MEDIAN_OF_MEAN_CHAN_FILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(void *)this = &unk_1EF08DF98;
}

void sub_19DFF7174(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void BtProxMaxOfMeanOfChanFilter::BtProxMaxOfMeanOfChanFilter(BtProxMaxOfMeanOfChanFilter *this)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "MAX_OF_MEAN_CHAN_FILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(void *)this = &unk_1EF08DF58;
}

void sub_19DFF7204(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void BtProxRayleighFilter::BtProxRayleighFilter(BtProxRayleighFilter *this)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "RAYLEIGH_FILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(void *)this = &unk_1EF08E018;
}

void sub_19DFF7294(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    std::string v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void BtProxMedianFilter::BtProxMedianFilter(BtProxMedianFilter *this)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "MEDIAN_FILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(void *)this = &unk_1EF08DF18;
}

void sub_19DFF73D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void BtProxMeanFilter::BtProxMeanFilter(BtProxMeanFilter *this)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "MEAN_FIILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(void *)this = &unk_1EF08DED8;
}

void sub_19DFF7468(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void BtProxMaxFilter::BtProxMaxFilter(BtProxMaxFilter *this)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "MAX_FILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(void *)this = &unk_1EF08DE88;
}

void sub_19DFF74F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _GLOBAL__sub_I_FullSharingImportanceEstimator_cpp()
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  __dst[7] = unk_19E02C990;
  __dst[8] = xmmword_19E02C9A0;
  __dst[9] = unk_19E02C9B0;
  __dst[3] = unk_19E02C950;
  __dst[4] = xmmword_19E02C960;
  __dst[5] = unk_19E02C970;
  __dst[6] = xmmword_19E02C980;
  __dst[0] = xmmword_19E02C920;
  __dst[1] = unk_19E02C930;
  __dst[2] = xmmword_19E02C940;
  std::map<Region,double>::map[abi:ne180100]((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, (int *)__dst, 10);
  __cxa_atexit((void (*)(void *))std::map<Region,double>::~map[abi:ne180100], &FullSharingImportanceEstimator::REGION_SIZE_METERS2, &dword_19DFF5000);
  v0 = operator new(0xCuLL);
  *(void *)v0 = 0x400000001;
  v0[2] = 7;
  LODWORD(__dst[0]) = 0;
  __dst[1] = 0uLL;
  *((void *)&__dst[0] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((void *)__dst + 1, v0, (uint64_t)(v0 + 3), 3uLL);
  uint64_t v1 = operator new(0xCuLL);
  *(void *)uint64_t v1 = 0x200000000;
  v1[2] = 4;
  LODWORD(__dst[2]) = 1;
  __dst[3] = 0uLL;
  *((void *)&__dst[2] + 1) = 0;
  v18 = v1;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((void *)&__dst[2] + 1, v1, (uint64_t)(v1 + 3), 3uLL);
  v2 = operator new(0xCuLL);
  *(void *)v2 = 0x300000001;
  v2[2] = 5;
  LODWORD(__dst[4]) = 2;
  __dst[5] = 0uLL;
  *((void *)&__dst[4] + 1) = 0;
  v17 = v2;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((void *)&__dst[4] + 1, v2, (uint64_t)(v2 + 3), 3uLL);
  v3 = operator new(8uLL);
  void *v3 = 0x600000002;
  LODWORD(__dst[6]) = 3;
  __dst[7] = 0uLL;
  *((void *)&__dst[6] + 1) = 0;
  std::string __p = v3;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((void *)&__dst[6] + 1, v3, (uint64_t)(v3 + 1), 2uLL);
  size_t v4 = operator new(0xCuLL);
  *(void *)size_t v4 = 0x500000000;
  v4[2] = 1;
  LODWORD(__dst[8]) = 4;
  __dst[9] = 0uLL;
  *((void *)&__dst[8] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((void *)&__dst[8] + 1, v4, (uint64_t)(v4 + 3), 3uLL);
  size_t v5 = operator new(0x10uLL);
  *size_t v5 = xmmword_19E02C850;
  LODWORD(__dst[10]) = 5;
  __dst[11] = 0uLL;
  *((void *)&__dst[10] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((void *)&__dst[10] + 1, v5, (uint64_t)(v5 + 1), 4uLL);
  std::string v6 = operator new(0xCuLL);
  *(void *)std::string v6 = 0x300000005;
  v6[2] = 9;
  LODWORD(__dst[12]) = 6;
  __dst[13] = 0uLL;
  *((void *)&__dst[12] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((void *)&__dst[12] + 1, v6, (uint64_t)(v6 + 3), 3uLL);
  uint64_t v7 = operator new(8uLL);
  *uint64_t v7 = 0x800000000;
  LODWORD(__dst[14]) = 7;
  __dst[15] = 0uLL;
  *((void *)&__dst[14] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((void *)&__dst[14] + 1, v7, (uint64_t)(v7 + 1), 2uLL);
  uint64_t v8 = operator new(0xCuLL);
  *(void *)uint64_t v8 = 0x900000007;
  v8[2] = 5;
  LODWORD(__dst[16]) = 8;
  __dst[17] = 0uLL;
  *((void *)&__dst[16] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((void *)&__dst[16] + 1, v8, (uint64_t)(v8 + 3), 3uLL);
  v9 = operator new(8uLL);
  void *v9 = 0x600000008;
  LODWORD(__dst[18]) = 9;
  __dst[19] = 0uLL;
  *((void *)&__dst[18] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((void *)&__dst[18] + 1, v9, (uint64_t)(v9 + 1), 2uLL);
  std::map<Region,std::vector<Region>>::map[abi:ne180100]((uint64_t)&FullSharingImportanceEstimator::ADJACENCY_MAP, (int *)__dst, 10);
  uint64_t v10 = 40;
  do
  {
    v11 = *(void **)&v26[v10 * 8];
    if (v11)
    {
      v27[v10] = v11;
      operator delete(v11);
    }
    v10 -= 4;
  }
  while (v10 * 8);
  operator delete(v9);
  operator delete(v8);
  operator delete(v7);
  operator delete(v6);
  operator delete(v5);
  operator delete(v4);
  operator delete(__p);
  operator delete(v17);
  operator delete(v18);
  operator delete(v0);
  __cxa_atexit((void (*)(void *))std::map<Region,std::vector<Region>>::~map[abi:ne180100], &FullSharingImportanceEstimator::ADJACENCY_MAP, &dword_19DFF5000);
  __dst[7] = unk_19E02CA30;
  __dst[8] = xmmword_19E02CA40;
  __dst[9] = unk_19E02CA50;
  __dst[3] = unk_19E02C9F0;
  __dst[4] = xmmword_19E02CA00;
  __dst[5] = unk_19E02CA10;
  __dst[6] = xmmword_19E02CA20;
  __dst[0] = xmmword_19E02C9C0;
  __dst[1] = unk_19E02C9D0;
  __dst[2] = xmmword_19E02C9E0;
  std::map<Region,double>::map[abi:ne180100]((uint64_t)&FullSharingImportanceEstimator::IMPORTANCE_MAP, (int *)__dst, 10);
  __cxa_atexit((void (*)(void *))std::map<Region,double>::~map[abi:ne180100], &FullSharingImportanceEstimator::IMPORTANCE_MAP, &dword_19DFF5000);
  qword_1EB57DF68 = 0;
  unk_1EB57DF70 = 0;
  FullSharingImportanceEstimator::IN_FOV = 0;
  v12 = operator new(0x18uLL);
  qword_1EB57DF68 = (uint64_t)(v12 + 3);
  unk_1EB57DF70 = v12 + 3;
  v12[2] = 0x600000005;
  *(_OWORD *)v12 = xmmword_19E02CA60;
  FullSharingImportanceEstimator::IN_FOV = (uint64_t)v12;
  __cxa_atexit((void (*)(void *))std::vector<Region>::~vector[abi:ne180100], &FullSharingImportanceEstimator::IN_FOV, &dword_19DFF5000);
  qword_1EB57DEF0 = 0;
  unk_1EB57DEF8 = 0;
  FullSharingImportanceEstimator::NOT_IN_FOV = 0;
  v13 = operator new(0x10uLL);
  FullSharingImportanceEstimator::NOT_IN_FOV = (uint64_t)v13;
  _OWORD *v13 = xmmword_19E02C860;
  qword_1EB57DEF0 = (uint64_t)(v13 + 1);
  unk_1EB57DEF8 = v13 + 1;
  __cxa_atexit((void (*)(void *))std::vector<Region>::~vector[abi:ne180100], &FullSharingImportanceEstimator::NOT_IN_FOV, &dword_19DFF5000);
  memcpy(__dst, &unk_19E02CA78, sizeof(__dst));
  std::map<Region,RegionBoundaries>::map[abi:ne180100]((uint64_t)&FullSharingImportanceEstimator::BOUNDARY_MAP, (int *)__dst, 10);
  __cxa_atexit((void (*)(void *))std::map<Region,RegionBoundaries>::~map[abi:ne180100], &FullSharingImportanceEstimator::BOUNDARY_MAP, &dword_19DFF5000);
  uint64_t v33 = 0x600000003;
  int v34 = 9;
  std::set<Region>::set[abi:ne180100]((uint64_t)v26, (int *)&v33, 3);
  LODWORD(__dst[0]) = 0;
  std::set<Region>::set[abi:ne180100]((uint64_t *)__dst + 1, (uint64_t)v26);
  uint64_t v31 = 0x500000002;
  int v32 = 8;
  std::set<Region>::set[abi:ne180100]((uint64_t)v24, (int *)&v31, 3);
  LODWORD(__dst[2]) = 1;
  std::set<Region>::set[abi:ne180100]((uint64_t *)&__dst[2] + 1, (uint64_t)v24);
  uint64_t v29 = 0x400000001;
  int v30 = 7;
  std::set<Region>::set[abi:ne180100]((uint64_t)v22, (int *)&v29, 3);
  LODWORD(__dst[4]) = 2;
  std::set<Region>::set[abi:ne180100]((uint64_t *)&__dst[4] + 1, (uint64_t)v22);
  int v19 = 0;
  std::set<Region>::set[abi:ne180100]((uint64_t)v20, &v19, 1);
  LODWORD(__dst[6]) = 3;
  std::set<Region>::set[abi:ne180100]((uint64_t *)&__dst[6] + 1, (uint64_t)v20);
  std::map<CoarseRange,std::set<Region>>::map[abi:ne180100]((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, (int *)__dst, 4);
  for (uint64_t i = 0; i != -8; i -= 2)
    std::__tree<Region>::destroy((uint64_t)&__dst[i + 6] + 8, *(void **)&__dst[i + 7]);
  std::__tree<Region>::destroy((uint64_t)v20, v21);
  std::__tree<Region>::destroy((uint64_t)v22, v23);
  std::__tree<Region>::destroy((uint64_t)v24, v25);
  std::__tree<Region>::destroy((uint64_t)v26, v27[0]);
  return __cxa_atexit((void (*)(void *))std::map<CoarseRange,std::set<Region>>::~map[abi:ne180100], &FullSharingImportanceEstimator::REGIONS_BY_RANGE, &dword_19DFF5000);
}

void sub_19DFF7C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *__p, void *a12, void *a13, void *a14, uint64_t a15, char a16, void *a17, uint64_t a18, uint64_t a19, char a20,void *a21,uint64_t a22,uint64_t a23,char a24,void *a25,uint64_t a26,uint64_t a27,char a28,void *a29,uint64_t a30,char a31)
{
  for (uint64_t i = 0; i != -128; i -= 32)
    std::__tree<Region>::destroy(v31 + i + 104, *(void **)(v31 + i + 112));
  std::__tree<Region>::destroy((uint64_t)&a16, a17);
  std::__tree<Region>::destroy((uint64_t)&a20, a21);
  std::__tree<Region>::destroy((uint64_t)&a24, a25);
  std::__tree<Region>::destroy((uint64_t)&a28, a29);
  _Unwind_Resume(a1);
}

void std::__tree<Region>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<Region>::destroy(a1, *a2);
    std::__tree<Region>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void *std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    std::string v6 = result;
    result = std::vector<Region>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_19DFF7F70(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<Region>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Region>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Region>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

uint64_t *std::set<Region>::set[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::set<Region>::insert[abi:ne180100]<std::__tree_const_iterator<Region,std::__tree_node<Region,void *> *,long>>(a1, *(int **)a2, (int *)(a2 + 8));
  return a1;
}

void sub_19DFF8048(_Unwind_Exception *a1)
{
  std::__tree<Region>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t std::set<Region>::set[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 4 * a3;
    do
    {
      std::__tree<Region>::__emplace_hint_unique_key_args<Region,Region const&>((uint64_t **)a1, v4, a2, a2);
      ++a2;
      v6 -= 4;
    }
    while (v6);
  }
  return a1;
}

void sub_19DFF80C8(_Unwind_Exception *a1)
{
  std::__tree<Region>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t std::map<Region,std::vector<Region>>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,std::vector<Region>> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 8;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_19DFF8148(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,std::vector<Region>> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__find_equal<Region>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::__construct_node<std::pair<Region const,std::vector<Region>> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

void *std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::__construct_node<std::pair<Region const,std::vector<Region>> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  v6[8] = *(_DWORD *)a2;
  *((void *)v6 + 6) = 0;
  *((void *)v6 + 7) = 0;
  *((void *)v6 + 5) = 0;
  result = std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((void *)v6 + 5, *(const void **)(a2 + 8), *(void *)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_19DFF8260(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<Region,std::vector<Region>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::map<Region,RegionBoundaries>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 40 * a3;
    do
    {
      std::__tree<std::__value_type<Region,RegionBoundaries>,std::__map_value_compare<Region,std::__value_type<Region,RegionBoundaries>,std::less<Region>,true>,std::allocator<std::__value_type<Region,RegionBoundaries>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,RegionBoundaries> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 10;
      v6 -= 40;
    }
    while (v6);
  }
  return a1;
}

void sub_19DFF82E8(_Unwind_Exception *a1)
{
  std::__tree<Region>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

_OWORD *std::__tree<std::__value_type<Region,RegionBoundaries>,std::__map_value_compare<Region,std::__value_type<Region,RegionBoundaries>,std::less<Region>,true>,std::allocator<std::__value_type<Region,RegionBoundaries>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,RegionBoundaries> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t v6 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__find_equal<Region>(a1, a2, &v12, &v11, a3);
  uint64_t v7 = (_OWORD *)*v6;
  if (!*v6)
  {
    size_t v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x48uLL);
    long long v9 = *(_OWORD *)(a4 + 16);
    v7[2] = *(_OWORD *)a4;
    v7[3] = v9;
    *((void *)v7 + 8) = *(void *)(a4 + 32);
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v12, v8, (uint64_t *)v7);
  }
  return v7;
}

uint64_t std::map<Region,double>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 16 * a3;
    do
    {
      std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,double> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 4;
      v6 -= 16;
    }
    while (v6);
  }
  return a1;
}

void sub_19DFF83F8(_Unwind_Exception *a1)
{
  std::__tree<Region>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,double> const&>(uint64_t **a1, uint64_t *a2, int *a3, _OWORD *a4)
{
  uint64_t v6 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__find_equal<Region>(a1, a2, &v11, &v10, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    size_t v8 = (uint64_t **)v6;
    uint64_t v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__find_equal<Region>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (int v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    size_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      long long v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        long long v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        v13 = v10;
      }
      while (v14);
    }
    int v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    int v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      int v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t *std::set<Region>::insert[abi:ne180100]<std::__tree_const_iterator<Region,std::__tree_node<Region,void *> *,long>>(uint64_t *result, int *a2, int *a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    int v6 = result + 1;
    do
    {
      result = std::__tree<Region>::__emplace_hint_unique_key_args<Region,Region const&>(v5, v6, v4 + 7, v4 + 7);
      int v7 = (int *)*((void *)v4 + 1);
      if (v7)
      {
        do
        {
          size_t v8 = v7;
          int v7 = *(int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          size_t v8 = (int *)*((void *)v4 + 2);
          BOOL v9 = *(void *)v8 == (void)v4;
          uint64_t v4 = v8;
        }
        while (!v9);
      }
      uint64_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<Region>::__emplace_hint_unique_key_args<Region,Region const&>(uint64_t **a1, uint64_t *a2, int *a3, _DWORD *a4)
{
  int v6 = std::__tree<Region>::__find_equal<Region>(a1, a2, &v11, &v10, a3);
  int v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    size_t v8 = (uint64_t **)v6;
    int v7 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v7 + 7) = *a4;
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<Region>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            BOOL v9 = (uint64_t **)a2[2];
          }
          else
          {
            BOOL v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            uint64_t *v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t *std::__tree<Region>::__find_equal<Region>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (int v6 = *a5, v7 = *((_DWORD *)a2 + 7), *a5 < v7))
  {
    int v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      BOOL v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        BOOL v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      uint64_t v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        uint64_t v13 = v10;
      }
      while (v14);
    }
    int v15 = *a5;
    if (*((_DWORD *)v10 + 7) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 28);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    uint64_t v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      uint64_t v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    int v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      int v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 7))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 28);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t std::map<CoarseRange,std::set<Region>>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::__emplace_hint_unique_key_args<CoarseRange,std::pair<CoarseRange const,std::set<Region>> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 8;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_19DFF8B54(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::__emplace_hint_unique_key_args<CoarseRange,std::pair<CoarseRange const,std::set<Region>> const&>(uint64_t **a1, uint64_t *a2, int *a3, _DWORD *a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__find_equal<Region>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::__construct_node<std::pair<CoarseRange const,std::set<Region>> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::__construct_node<std::pair<CoarseRange const,std::set<Region>> const&>@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = operator new(0x40uLL);
  *(void *)(a3 + 8) = v5;
  *(void *)a3 = v6;
  *(unsigned char *)(a3 + 16) = 0;
  *((_DWORD *)v6 + 8) = *a2;
  result = std::set<Region>::set[abi:ne180100]((uint64_t *)v6 + 5, (uint64_t)(a2 + 2));
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_19DFF8C60(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<CoarseRange,std::set<Region>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *rose::rangingTriggerTypeToString@<X0>(int a1@<W0>, void *a2@<X8>)
{
  if (a1) {
    v2 = "TriggerRequired";
  }
  else {
    v2 = "NoTriggerRequired";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void *rose::rangingAcquisitionTypeToString@<X0>(int a1@<W0>, void *a2@<X8>)
{
  if (a1) {
    v2 = "BTAidedAcquisition";
  }
  else {
    v2 = "DirectAcquisition";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void *rose::serviceattributes::attributeToString@<X0>(int a1@<W0>, void *a2@<X8>)
{
  if (a1 == 100)
  {
    v2 = "Unspecified";
  }
  else if (a1 == 1)
  {
    v2 = "Responder";
  }
  else
  {
    v2 = "Initiator";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  return std::string::basic_string[abi:ne180100]<0>(a2, off_1E5999B00[a1]);
}

{
  return std::string::basic_string[abi:ne180100]<0>(a2, off_1E5999B58[a1]);
}

{
  return std::string::basic_string[abi:ne180100]<0>(a2, off_1E5999BA0[a1]);
}

void *rose::serviceattributes::attributeToString@<X0>(rose::serviceattributes *this@<X0>, void *a2@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a2, off_1E5999BC0[(int)this]);
}

void sub_19DFF8EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19DFF8FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19DFF9200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19DFF92F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19DFF95B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void Rose::HelloResponse::AdditionalInfo::~AdditionalInfo(void **this)
{
  if (*((char *)this + 63) < 0) {
    operator delete(this[5]);
  }
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

void sub_19DFF98FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19DFF9A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19DFF9B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19DFFA068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, int a13, char a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  if (a14)
  {
  }
  if (!a18) {

  }
  _Unwind_Resume(a1);
}

void sub_19DFFA6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_19DFFA864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19DFFAB84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19DFFACA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    int v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5999AA0, MEMORY[0x1E4FBA1C8]);
}

void sub_19DFFAE40(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void *std::vector<Rose::ResponderSuperframeRxPacketInfo>::__init_with_size[abi:ne180100]<Rose::ResponderSuperframeRxPacketInfo*,Rose::ResponderSuperframeRxPacketInfo*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    std::string::size_type v6 = result;
    result = std::vector<Rose::ResponderSuperframeRxPacketInfo>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_19DFFAF1C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<Rose::ResponderSuperframeRxPacketInfo>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Rose::ResponderSuperframeRxPacketInfo>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Rose::ResponderSuperframeRxPacketInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::allocate_shared[abi:ne180100]<rose::ResponderSuperframeStats,std::allocator<rose::ResponderSuperframeStats>,rose::ResponderSuperframeStats const&,void>@<X0>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = (char *)operator new(0x88uLL);
  uint64_t result = std::__shared_ptr_emplace<rose::ResponderSuperframeStats>::__shared_ptr_emplace[abi:ne180100]<rose::ResponderSuperframeStats const&,std::allocator<rose::ResponderSuperframeStats>,0>((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_19DFFB014(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<rose::ResponderSuperframeStats>::__shared_ptr_emplace[abi:ne180100]<rose::ResponderSuperframeStats const&,std::allocator<rose::ResponderSuperframeStats>,0>(uint64_t a1, uint64_t *a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = &unk_1EF08D958;
  uint64_t v4 = *a2;
  *(_WORD *)(a1 + 32) = *((_WORD *)a2 + 4);
  *(void *)(a1 + 24) = v4;
  long long v5 = *((_OWORD *)a2 + 1);
  long long v6 = *((_OWORD *)a2 + 2);
  long long v7 = *((_OWORD *)a2 + 3);
  LODWORD(v4) = *((_DWORD *)a2 + 16);
  *(void *)(a1 + 96) = 0;
  uint64_t v8 = a1 + 96;
  *(_DWORD *)(v8 - 8) = v4;
  *(_OWORD *)(v8 - 24) = v7;
  *(_OWORD *)(v8 - 40) = v6;
  *(_OWORD *)(v8 - 56) = v5;
  *(_OWORD *)(v8 + 8) = 0u;
  std::vector<Rose::ResponderSuperframeRxPacketInfo>::__init_with_size[abi:ne180100]<Rose::ResponderSuperframeRxPacketInfo*,Rose::ResponderSuperframeRxPacketInfo*>((void *)v8, (const void *)a2[9], a2[10], (a2[10] - a2[9]) >> 4);
  *(_OWORD *)(a1 + 120) = *((_OWORD *)a2 + 6);
  return a1;
}

void sub_19DFFB0C4(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<rose::ResponderSuperframeStats>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF08D958;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<rose::ResponderSuperframeStats>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF08D958;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x19F3B95D0);
}

void std::__shared_ptr_emplace<rose::ResponderSuperframeStats>::__on_zero_shared(uint64_t a1)
{
  v2 = *(void **)(a1 + 96);
  if (v2)
  {
    *(void *)(a1 + 104) = v2;
    operator delete(v2);
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void MagicHeadTieHysteresis::MagicHeadTieHysteresis(MagicHeadTieHysteresis *this)
{
}

uint64_t std::map<Region,double>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

uint64_t std::vector<Region>::~vector[abi:ne180100](uint64_t a1)
{
  v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t std::map<Region,std::vector<Region>>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

uint64_t std::map<Region,RegionBoundaries>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

uint64_t std::map<CoarseRange,std::set<Region>>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

void FullSharingImportanceEstimator::FullSharingImportanceEstimator(FullSharingImportanceEstimator *this)
{
  *(void *)this = &unk_1EF08D9A8;
  *(_OWORD *)((char *)this + 8) = xmmword_19E02C830;
  *((_DWORD *)this + 6) = 0;
  *((unsigned char *)this + 28) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 4) = (char *)this + 40;
  *((void *)this + 6) = 0;
  FullSharingImportanceEstimator::initializeToUnknown((uint64_t **)this);
}

void sub_19DFFB348(_Unwind_Exception *a1)
{
  std::__tree<Region>::destroy(v1, *v2);
  _Unwind_Resume(a1);
}

uint64_t **FullSharingImportanceEstimator::initializeToUnknown(uint64_t **this)
{
  uint64_t v1 = this + 4;
  int v13 = 0;
  BOOL v14 = &v13;
  std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(this + 4, &v13, (uint64_t)&std::piecewise_construct, &v14)[5] = (uint64_t *)0x3FE0000000000000;
  int v13 = 1;
  double v2 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  int v12 = 1;
  BOOL v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v2;
  int v13 = 2;
  double v3 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  int v12 = 2;
  BOOL v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v3;
  int v13 = 3;
  double v4 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  int v12 = 3;
  BOOL v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v4;
  int v13 = 4;
  double v5 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  int v12 = 4;
  BOOL v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v5;
  int v13 = 5;
  double v6 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  int v12 = 5;
  BOOL v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v6;
  int v13 = 6;
  double v7 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  int v12 = 6;
  BOOL v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v7;
  int v13 = 7;
  double v8 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  int v12 = 7;
  BOOL v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v8;
  int v13 = 8;
  double v9 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  int v12 = 8;
  BOOL v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v9;
  int v13 = 9;
  double v10 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
      * 0.5
      / 452.389342;
  int v12 = 9;
  BOOL v14 = &v12;
  uint64_t result = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14);
  *((double *)result + 5) = v10;
  return result;
}

uint64_t *std::map<Region,double>::at(uint64_t a1, int *a2)
{
  double v2 = *(uint64_t **)(a1 + 8);
  if (!v2) {
LABEL_8:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  int v3 = *a2;
  while (1)
  {
    while (1)
    {
      int v4 = *((_DWORD *)v2 + 8);
      if (v3 >= v4) {
        break;
      }
      double v2 = (uint64_t *)*v2;
      if (!v2) {
        goto LABEL_8;
      }
    }
    if (v4 >= v3) {
      return v2 + 5;
    }
    double v2 = (uint64_t *)v2[1];
    if (!v2) {
      goto LABEL_8;
    }
  }
}

double FullSharingImportanceEstimator::getTime(FullSharingImportanceEstimator *this)
{
  return *((double *)this + 2);
}

uint64_t FullSharingImportanceEstimator::normalizeLikelihoods(uint64_t this)
{
  uint64_t v1 = *(double **)(this + 32);
  double v2 = (double *)(this + 40);
  if (v1 != (double *)(this + 40))
  {
    double v3 = 0.0;
    int v4 = *(double **)(this + 32);
    do
    {
      double v5 = (double *)*((void *)v4 + 1);
      double v6 = v4;
      if (v5)
      {
        do
        {
          double v7 = v5;
          double v5 = *(double **)v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          double v7 = (double *)*((void *)v6 + 2);
          BOOL v8 = *(void *)v7 == (void)v6;
          double v6 = v7;
        }
        while (!v8);
      }
      double v3 = v3 + v4[5];
      int v4 = v7;
    }
    while (v7 != v2);
    if (v1 != v2)
    {
      do
      {
        v1[5] = v1[5] / v3;
        double v9 = (double *)*((void *)v1 + 1);
        if (v9)
        {
          do
          {
            double v10 = v9;
            double v9 = *(double **)v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            double v10 = (double *)*((void *)v1 + 2);
            BOOL v8 = *(void *)v10 == (void)v1;
            uint64_t v1 = v10;
          }
          while (!v8);
        }
        uint64_t v1 = v10;
      }
      while (v10 != v2);
    }
  }
  return this;
}

double FullSharingImportanceEstimator::timeUpdateInRegionLikelihoods(FullSharingImportanceEstimator *this, double a2, int a3)
{
  int v4 = this;
  double v5 = *((double *)this + 2);
  double v6 = a2 - v5;
  double v7 = vabdd_f64(a2, v5);
  if (a3) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  if (v8 <= 5.0)
  {
    if (v8 > 0.0)
    {
      double v9 = v8 * 0.1;
      double v10 = (uint64_t **)((char *)this + 32);
      std::map<Region,double>::map[abi:ne180100]((uint64_t *)&v29, (uint64_t)this + 32);
      uint64_t v11 = v29;
      if (v29 != (uint64_t *)v30)
      {
        do
        {
          *((double *)v11 + 5) = (1.0 - v9) * *((double *)v11 + 5);
          int v12 = (uint64_t *)v11[1];
          if (v12)
          {
            do
            {
              int v13 = v12;
              int v12 = (uint64_t *)*v12;
            }
            while (v12);
          }
          else
          {
            do
            {
              int v13 = (uint64_t *)v11[2];
              BOOL v14 = *v13 == (void)v11;
              uint64_t v11 = v13;
            }
            while (!v14);
          }
          uint64_t v11 = v13;
        }
        while (v13 != (uint64_t *)v30);
      }
      v28 = v4;
      int v15 = (int *)*((void *)v4 + 4);
      uint64_t v16 = (int *)((char *)v4 + 40);
      if (v15 != (int *)((char *)v4 + 40))
      {
        do
        {
          v17 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::ADJACENCY_MAP, v15 + 8);
          int v19 = (_DWORD *)*v17;
          int v18 = (_DWORD *)v17[1];
          while (v19 != v18)
          {
            uint64_t v31 = v15 + 8;
            double v20 = *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v10, v15 + 8, (uint64_t)&std::piecewise_construct, &v31)+ 5);
            uint64_t v22 = *v17;
            uint64_t v21 = v17[1];
            uint64_t v31 = v19;
            v23 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(&v29, v19, (uint64_t)&std::piecewise_construct, &v31);
            *((double *)v23 + 5) = v9 * v20 / (double)(unint64_t)((v21 - v22) >> 2) + *((double *)v23 + 5);
            ++v19;
          }
          v24 = (int *)*((void *)v15 + 1);
          if (v24)
          {
            do
            {
              v25 = v24;
              v24 = *(int **)v24;
            }
            while (v24);
          }
          else
          {
            do
            {
              v25 = (int *)*((void *)v15 + 2);
              BOOL v14 = *(void *)v25 == (void)v15;
              int v15 = v25;
            }
            while (!v14);
          }
          int v15 = v25;
        }
        while (v25 != v16);
      }
      if (v10 != &v29) {
        std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<Region,double>,std::__tree_node<std::__value_type<Region,double>,void *> *,long>>(v10, v29, v30);
      }
      int v4 = v28;
      FullSharingImportanceEstimator::normalizeLikelihoods((uint64_t)v28);
      *((double *)v28 + 2) = a2;
      std::__tree<Region>::destroy((uint64_t)&v29, v30[0]);
    }
  }
  else
  {
    FullSharingImportanceEstimator::initializeToUnknown((uint64_t **)this);
    *((double *)v4 + 2) = a2;
  }
  BOOL v26 = *((int *)v4 + 6) >= 6 && *((double *)v4 + 2) > *((double *)v4 + 1) + 1.0;
  *((unsigned char *)v4 + 28) = v26;
  return v8;
}

void sub_19DFFB9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, void *a13)
{
}

long double FullSharingImportanceEstimator::computeFractionAboveSigma(FullSharingImportanceEstimator *this, double a2)
{
  return (1.0 - erf(a2 * 0.707106781)) * 0.5;
}

uint64_t **FullSharingImportanceEstimator::incorporateFovDetector(uint64_t **this, int a2)
{
  uint64_t v2 = (uint64_t)this;
  if (a2) {
    double v3 = 0.05;
  }
  else {
    double v3 = 0.95;
  }
  if (a2) {
    double v4 = 0.95;
  }
  else {
    double v4 = 0.05;
  }
  double v5 = (int *)FullSharingImportanceEstimator::IN_FOV;
  for (uint64_t i = qword_1EB57DF68; v5 != (int *)i; ++v5)
  {
    double v7 = v4
       * *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, v5)
       / 75.3982237;
    int v12 = v5;
    this = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>((uint64_t **)(v2 + 32), v5, (uint64_t)&std::piecewise_construct, &v12);
    *((double *)this + 5) = v7 * *((double *)this + 5);
  }
  double v8 = (int *)FullSharingImportanceEstimator::NOT_IN_FOV;
  uint64_t v9 = qword_1EB57DEF0;
  if (FullSharingImportanceEstimator::NOT_IN_FOV != qword_1EB57DEF0)
  {
    double v10 = (uint64_t **)(v2 + 32);
    do
    {
      double v11 = v3
          * *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, v8)
          / 376.991118;
      int v12 = v8;
      this = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v10, v8, (uint64_t)&std::piecewise_construct, &v12);
      *((double *)this + 5) = v11 * *((double *)this + 5);
      ++v8;
    }
    while (v8 != (int *)v9);
  }
  return this;
}

void FullSharingImportanceEstimator::incorporatePreciseRangeAndAzimuth(FullSharingImportanceEstimator *this, double a2, double a3)
{
  v37[0] = 0;
  v37[1] = 0;
  v36 = (uint64_t *)v37;
  uint64_t v4 = FullSharingImportanceEstimator::BOUNDARY_MAP;
  if ((_UNKNOWN *)FullSharingImportanceEstimator::BOUNDARY_MAP != &unk_1EB57DF08)
  {
    int v6 = 0;
    double v7 = fabs(a3);
    double v8 = 1.0;
    while (1)
    {
      double v9 = *(double *)(v4 + 40);
      if (v9 <= a2)
      {
        double v11 = *(double *)(v4 + 48);
        if (v11 > a2)
        {
          char v12 = 0;
          double v13 = 0.0;
          goto LABEL_9;
        }
        double v10 = a2 - v11;
      }
      else
      {
        double v10 = v9 - a2;
      }
      char v12 = 1;
      double v13 = v10 / 0.2;
LABEL_9:
      BOOL v14 = (int *)(v4 + 32);
      double v15 = *(double *)(v4 + 56);
      if (v7 < v15)
      {
        double v16 = v15 - v7;
LABEL_15:
        double v18 = v16 / 0.261799388;
LABEL_16:
        v38 = (_DWORD *)(v4 + 32);
        int v19 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(&v36, v14, (uint64_t)&std::piecewise_construct, &v38);
        long double v20 = (1.0 - erf(v18 * 0.707106781)) * 0.5;
        long double v21 = v20 * ((1.0 - erf(v13 * 0.707106781)) * 0.5);
        *((long double *)v19 + 5) = v21;
        double v8 = v8 - v21;
        goto LABEL_17;
      }
      double v17 = *(double *)(v4 + 64);
      if (v7 >= v17)
      {
        double v16 = v7 - v17;
        goto LABEL_15;
      }
      double v18 = 0.0;
      if (v12) {
        goto LABEL_16;
      }
      int v6 = *v14;
LABEL_17:
      uint64_t v22 = *(void **)(v4 + 8);
      if (v22)
      {
        do
        {
          v23 = v22;
          uint64_t v22 = (void *)*v22;
        }
        while (v22);
      }
      else
      {
        do
        {
          v23 = *(void **)(v4 + 16);
          BOOL v24 = *v23 == v4;
          uint64_t v4 = (uint64_t)v23;
        }
        while (!v24);
      }
      uint64_t v4 = (uint64_t)v23;
      if (v23 == (void *)&unk_1EB57DF08) {
        goto LABEL_25;
      }
    }
  }
  int v6 = 0;
  double v8 = 1.0;
LABEL_25:
  v25 = (FullSharingImportanceEstimator *)*((void *)this + 4);
  if (v25 != (FullSharingImportanceEstimator *)((char *)this + 40))
  {
    do
    {
      int v26 = *((_DWORD *)v25 + 8);
      double v27 = v8;
      if (v26 != v6)
      {
        v28 = v37[0];
        double v27 = 1.0;
        if (v37[0])
        {
          uint64_t v29 = v37;
          do
          {
            int v30 = v28;
            uint64_t v31 = v29;
            int v32 = *((_DWORD *)v28 + 8);
            uint64_t v33 = v28 + 1;
            if (v32 >= v26)
            {
              uint64_t v33 = v30;
              uint64_t v29 = (void **)v30;
            }
            v28 = (void *)*v33;
          }
          while (v28);
          if (v29 != v37)
          {
            if (v32 < v26) {
              int v30 = v31;
            }
            if (v26 >= *((_DWORD *)v30 + 8))
            {
              v38 = (_DWORD *)((char *)v25 + 32);
              double v27 = *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(&v36, (int *)v25 + 8, (uint64_t)&std::piecewise_construct, &v38)+ 5);
            }
          }
        }
      }
      if (v27 < 0.001) {
        double v27 = 0.001;
      }
      *((double *)v25 + 5) = *((double *)v25 + 5) * v27;
      int v34 = (FullSharingImportanceEstimator *)*((void *)v25 + 1);
      if (v34)
      {
        do
        {
          uint64_t v35 = v34;
          int v34 = *(FullSharingImportanceEstimator **)v34;
        }
        while (v34);
      }
      else
      {
        do
        {
          uint64_t v35 = (FullSharingImportanceEstimator *)*((void *)v25 + 2);
          BOOL v24 = *(void *)v35 == (void)v25;
          v25 = v35;
        }
        while (!v24);
      }
      v25 = v35;
    }
    while (v35 != (FullSharingImportanceEstimator *)((char *)this + 40));
  }
  std::__tree<Region>::destroy((uint64_t)&v36, v37[0]);
}

void sub_19DFFBE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, void *a13)
{
}

double FullSharingImportanceEstimator::incorporatePreciseRangeOnly(uint64_t **this, double a2)
{
  double v4 = 1.0 - (1.0 - erf(a2 / -0.2 * 0.707106781)) * 0.5;
  double v42 = 1.0 - (1.0 - erf((1.0 - a2) / 0.2 * 0.707106781)) * 0.5;
  double v41 = (1.0 - erf((5.0 - a2) / 0.2 * 0.707106781)) * 0.5;
  double v5 = 1.0 - erf((12.0 - a2) / 0.2 * 0.707106781);
  double v6 = 1.0 - v4;
  LODWORD(v44) = 0;
  double v7 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, (int *)&v44);
  double v8 = v7 + 1;
  double v9 = (int *)*v7;
  if ((uint64_t *)*v7 != v7 + 1)
  {
    double v10 = (v42 - v4) / v6;
    do
    {
      double v11 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, v9 + 7);
      if (v10 * *(double *)v11 / 6.28318531 >= 0.001) {
        double v12 = v10 * *(double *)v11 / 6.28318531;
      }
      else {
        double v12 = 0.001;
      }
      v44 = v9 + 7;
      double v13 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(this + 4, v9 + 7, (uint64_t)&std::piecewise_construct, &v44);
      *((double *)v13 + 5) = v12 * *((double *)v13 + 5);
      BOOL v14 = (uint64_t *)*((void *)v9 + 1);
      if (v14)
      {
        do
        {
          double v15 = v14;
          BOOL v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          double v15 = (uint64_t *)*((void *)v9 + 2);
          BOOL v16 = *v15 == (void)v9;
          double v9 = (int *)v15;
        }
        while (!v16);
      }
      double v9 = (int *)v15;
    }
    while (v15 != v8);
  }
  double v17 = v5 * 0.5;
  double v18 = 1.0 - v41;
  LODWORD(v44) = 1;
  int v19 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, (int *)&v44);
  long double v20 = v19 + 1;
  long double v21 = (int *)*v19;
  double v22 = 1.0 - v4;
  if ((uint64_t *)*v19 != v19 + 1)
  {
    double v23 = (v18 - v42) / v6;
    do
    {
      BOOL v24 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, v21 + 7);
      if (v23 * *(double *)v24 / 150.796447 >= 0.001) {
        double v25 = v23 * *(double *)v24 / 150.796447;
      }
      else {
        double v25 = 0.001;
      }
      v44 = v21 + 7;
      int v26 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(this + 4, v21 + 7, (uint64_t)&std::piecewise_construct, &v44);
      *((double *)v26 + 5) = v25 * *((double *)v26 + 5);
      double v27 = (uint64_t *)*((void *)v21 + 1);
      if (v27)
      {
        do
        {
          v28 = v27;
          double v27 = (uint64_t *)*v27;
        }
        while (v27);
      }
      else
      {
        do
        {
          v28 = (uint64_t *)*((void *)v21 + 2);
          BOOL v16 = *v28 == (void)v21;
          long double v21 = (int *)v28;
        }
        while (!v16);
      }
      long double v21 = (int *)v28;
    }
    while (v28 != v20);
  }
  double v29 = 1.0 - v17;
  LODWORD(v44) = 2;
  int v30 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, (int *)&v44);
  uint64_t v31 = v30 + 1;
  int v32 = (int *)*v30;
  if ((uint64_t *)*v30 != v30 + 1)
  {
    double v33 = (v29 - v18) / v6;
    do
    {
      int v34 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, v32 + 7);
      if (v33 * *(double *)v34 / 747.699052 >= 0.001) {
        double v35 = v33 * *(double *)v34 / 747.699052;
      }
      else {
        double v35 = 0.001;
      }
      v44 = v32 + 7;
      v36 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(this + 4, v32 + 7, (uint64_t)&std::piecewise_construct, &v44);
      *((double *)v36 + 5) = v35 * *((double *)v36 + 5);
      v37 = (uint64_t *)*((void *)v32 + 1);
      if (v37)
      {
        do
        {
          v38 = v37;
          v37 = (uint64_t *)*v37;
        }
        while (v37);
      }
      else
      {
        do
        {
          v38 = (uint64_t *)*((void *)v32 + 2);
          BOOL v16 = *v38 == (void)v32;
          int v32 = (int *)v38;
        }
        while (!v16);
      }
      int v32 = (int *)v38;
    }
    while (v38 != v31);
  }
  int v43 = 0;
  v44 = &v43;
  v39 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(this + 4, &v43, (uint64_t)&std::piecewise_construct, &v44);
  double result = (1.0 - v29) / v22 * *((double *)v39 + 5);
  *((double *)v39 + 5) = result;
  return result;
}

uint64_t *FullSharingImportanceEstimator::incorporateCoarseRange(uint64_t *result, int a2)
{
  uint64_t v2 = result;
  int v34 = a2;
  uint64_t v3 = FullSharingImportanceEstimator::REGION_SIZE_METERS2;
  if ((_UNKNOWN *)FullSharingImportanceEstimator::REGION_SIZE_METERS2 == &unk_1EB57DF80)
  {
    double v5 = 0.0;
    double v4 = 0.0;
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
    do
    {
      double v6 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, &v34);
      uint64_t v9 = v6[1];
      double v7 = v6 + 1;
      uint64_t v8 = v9;
      if (!v9) {
        goto LABEL_13;
      }
      int v10 = *(_DWORD *)(v3 + 32);
      double v11 = v7;
      do
      {
        int v12 = *(_DWORD *)(v8 + 28);
        BOOL v13 = v12 < v10;
        if (v12 >= v10) {
          BOOL v14 = (uint64_t *)v8;
        }
        else {
          BOOL v14 = (uint64_t *)(v8 + 8);
        }
        if (!v13) {
          double v11 = (uint64_t *)v8;
        }
        uint64_t v8 = *v14;
      }
      while (*v14);
      if (v11 == v7 || v10 < *((_DWORD *)v11 + 7)) {
LABEL_13:
      }
        double v11 = v7;
      double result = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, &v34);
      double v15 = *(double *)(v3 + 40);
      if (v11 == result + 1) {
        double v16 = *(double *)(v3 + 40);
      }
      else {
        double v16 = -0.0;
      }
      if (v11 == result + 1) {
        double v15 = -0.0;
      }
      double v17 = *(void **)(v3 + 8);
      if (v17)
      {
        do
        {
          double v18 = v17;
          double v17 = (void *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          double v18 = *(void **)(v3 + 16);
          BOOL v19 = *v18 == v3;
          uint64_t v3 = (uint64_t)v18;
        }
        while (!v19);
      }
      double v5 = v5 + v16;
      double v4 = v4 + v15;
      uint64_t v3 = (uint64_t)v18;
    }
    while (v18 != (void *)&unk_1EB57DF80);
  }
  long double v20 = (uint64_t *)v2[4];
  if (v20 != v2 + 5)
  {
    do
    {
      long double v21 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, &v34);
      uint64_t v24 = v21[1];
      double v22 = v21 + 1;
      uint64_t v23 = v24;
      if (!v24) {
        goto LABEL_38;
      }
      int v25 = *((_DWORD *)v20 + 8);
      int v26 = v22;
      do
      {
        int v27 = *(_DWORD *)(v23 + 28);
        BOOL v28 = v27 < v25;
        if (v27 >= v25) {
          double v29 = (uint64_t *)v23;
        }
        else {
          double v29 = (uint64_t *)(v23 + 8);
        }
        if (!v28) {
          int v26 = (uint64_t *)v23;
        }
        uint64_t v23 = *v29;
      }
      while (*v29);
      if (v26 == v22 || v25 < *((_DWORD *)v26 + 7)) {
LABEL_38:
      }
        int v26 = v22;
      int v30 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, &v34) + 1;
      double result = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, (int *)v20 + 8);
      if (v26 == v30) {
        double v31 = v5;
      }
      else {
        double v31 = v4;
      }
      *((double *)v20 + 5) = *((double *)v20 + 5) * (*(double *)result * dbl_19E02C840[v26 == v30] / v31);
      int v32 = (uint64_t *)v20[1];
      if (v32)
      {
        do
        {
          double v33 = v32;
          int v32 = (uint64_t *)*v32;
        }
        while (v32);
      }
      else
      {
        do
        {
          double v33 = (uint64_t *)v20[2];
          BOOL v19 = *v33 == (void)v20;
          long double v20 = v33;
        }
        while (!v19);
      }
      long double v20 = v33;
    }
    while (v33 != v2 + 5);
  }
  return result;
}

void FullSharingImportanceEstimator::handleMeasurements(uint64_t **this, const NeighborMeasurements *a2)
{
  if (FullSharingImportanceEstimator::timeUpdateInRegionLikelihoods((FullSharingImportanceEstimator *)this, *(double *)a2->var0.var0.var1.var0, 0) >= -0.5)
  {
    if (LOBYTE(a2[1].var0.var0.var1.var0[1])) {
      FullSharingImportanceEstimator::incorporateFovDetector(this, BYTE1(a2[1].var0.var0.var1.var0[1]));
    }
    if (LOBYTE(a2->var0.var0.var1.var0[1]) && BYTE1(a2->var0.var0.var1.var0[1]))
    {
      FullSharingImportanceEstimator::incorporatePreciseRangeAndAzimuth((FullSharingImportanceEstimator *)this, *(double *)&a2->var0.var0.var1.var0[2], *(double *)&a2[1].var0.var0.var0.var0.var1.var0);
    }
    else if (LOBYTE(a2->var0.var0.var1.var0[1]))
    {
      FullSharingImportanceEstimator::incorporatePreciseRangeOnly(this, *(double *)&a2->var0.var0.var1.var0[2]);
    }
    else if (a2[1].var0.var0.var0.var0.var0.var0[8])
    {
      FullSharingImportanceEstimator::incorporateCoarseRange((uint64_t *)this, HIDWORD(a2[1].var0.var0.var0.var0.var1.var1));
    }
    FullSharingImportanceEstimator::normalizeLikelihoods((uint64_t)this);
    int v4 = *((_DWORD *)this + 6);
    if (!v4) {
      this[1] = (uint64_t *)a2->var0.var0.var1.var0[0];
    }
    *((_DWORD *)this + 6) = v4 + 1;
  }
}

void FullSharingImportanceEstimator::getImportanceEstimate(uint64_t a1, uint64_t a2, double a3)
{
  double v18 = &unk_1EF08D9A8;
  *(_OWORD *)BOOL v19 = *(_OWORD *)(a1 + 8);
  *(void *)&v19[13] = *(void *)(a1 + 21);
  std::map<Region,double>::map[abi:ne180100]((uint64_t *)&v20, a1 + 32);
  FullSharingImportanceEstimator::timeUpdateInRegionLikelihoods((FullSharingImportanceEstimator *)&v18, a3, 1);
  double v5 = v20;
  if (v20 == (int *)v21)
  {
    *(void *)a2 = 0;
    double v6 = 0.0;
  }
  else
  {
    double v6 = 0.0;
    double v7 = (double *)v20;
    do
    {
      uint64_t v8 = (double *)*((void *)v7 + 1);
      uint64_t v9 = v7;
      if (v8)
      {
        do
        {
          int v10 = v8;
          uint64_t v8 = *(double **)v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          int v10 = (double *)*((void *)v9 + 2);
          BOOL v11 = *(void *)v10 == (void)v9;
          uint64_t v9 = v10;
        }
        while (!v11);
      }
      double v6 = v6 + v7[5];
      double v7 = v10;
    }
    while (v10 != (double *)v21);
    *(void *)a2 = 0;
    if (v5 != (int *)v21)
    {
      do
      {
        *(double *)a2 = *(double *)a2
                      + *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::IMPORTANCE_MAP, v5 + 8)* *((double *)v5 + 5)/ v6;
        int v12 = (int *)*((void *)v5 + 1);
        if (v12)
        {
          do
          {
            BOOL v13 = v12;
            int v12 = *(int **)v12;
          }
          while (v12);
        }
        else
        {
          do
          {
            BOOL v13 = (int *)*((void *)v5 + 2);
            BOOL v11 = *(void *)v13 == (void)v5;
            double v5 = v13;
          }
          while (!v11);
        }
        double v5 = v13;
      }
      while (v13 != (int *)v21);
      double v5 = v20;
    }
  }
  *(void *)(a2 + 8) = 0;
  if (v5 == (int *)v21)
  {
    double v15 = 0.0;
  }
  else
  {
    do
    {
      BOOL v14 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::IMPORTANCE_MAP, v5 + 8);
      double v15 = *(double *)(a2 + 8)
          + (*(double *)v14 - *(double *)a2) * (*(double *)v14 - *(double *)a2) * (*((double *)v5 + 5) / v6);
      *(double *)(a2 + 8) = v15;
      double v16 = (int *)*((void *)v5 + 1);
      if (v16)
      {
        do
        {
          double v17 = v16;
          double v16 = *(int **)v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          double v17 = (int *)*((void *)v5 + 2);
          BOOL v11 = *(void *)v17 == (void)v5;
          double v5 = v17;
        }
        while (!v11);
      }
      double v5 = v17;
    }
    while (v17 != (int *)v21);
  }
  *(double *)(a2 + 8) = sqrt(v15);
  *(unsigned char *)(a2 + 16) = v19[20];
  double v18 = &unk_1EF08D9A8;
  std::__tree<Region>::destroy((uint64_t)&v20, v21[0]);
}

void sub_19DFFC734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  std::__tree<Region>::destroy(v15, a15);
  _Unwind_Resume(a1);
}

void FullSharingImportanceEstimator::~FullSharingImportanceEstimator(FullSharingImportanceEstimator *this)
{
  *(void *)this = &unk_1EF08D9A8;
  std::__tree<Region>::destroy((uint64_t)this + 32, *((void **)this + 5));
}

{
  uint64_t vars8;

  *(void *)this = &unk_1EF08D9A8;
  std::__tree<Region>::destroy((uint64_t)this + 32, *((void **)this + 5));
  JUMPOUT(0x19F3B95D0);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<Region,std::vector<Region>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v3 = (void *)__p[5];
    if (v3)
    {
      __p[6] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::destroy(a1, a2[1]);
    int v4 = (void *)a2[5];
    if (v4)
    {
      a2[6] = v4;
      operator delete(v4);
    }
    operator delete(a2);
  }
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<CoarseRange,std::set<Region>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
    std::__tree<Region>::destroy((uint64_t)(a2 + 5), a2[6]);
  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

void std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::destroy(a1, a2[1]);
    std::__tree<Region>::destroy((uint64_t)(a2 + 5), (void *)a2[6]);
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  double v7 = a1 + 1;
  double v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        double v6 = *v9;
        double v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      double v6 = v9[1];
      if (!v6)
      {
        double v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    BOOL v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((void *)v11 + 5) = 0;
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5999AA8, MEMORY[0x1E4FBA1D0]);
}

void sub_19DFFCA94(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

uint64_t *std::map<Region,double>::map[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<Region,double>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Region,double>,std::__tree_node<std::__value_type<Region,double>,void *> *,long>>>(a1, *(int **)a2, (int *)(a2 + 8));
  return a1;
}

void sub_19DFFCB1C(_Unwind_Exception *a1)
{
  std::__tree<Region>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<Region,double>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Region,double>,std::__tree_node<std::__value_type<Region,double>,void *> *,long>>>(uint64_t *result, int *a2, int *a3)
{
  if (a2 != a3)
  {
    int v4 = a2;
    double v5 = (uint64_t **)result;
    double v6 = result + 1;
    do
    {
      double result = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,double> const&>(v5, v6, v4 + 8, (_OWORD *)v4 + 2);
      double v7 = (int *)*((void *)v4 + 1);
      if (v7)
      {
        do
        {
          int v8 = v7;
          double v7 = *(int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (int *)*((void *)v4 + 2);
          BOOL v9 = *(void *)v8 == (void)v4;
          int v4 = v8;
        }
        while (!v9);
      }
      int v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<Region,double>,std::__tree_node<std::__value_type<Region,double>,void *> *,long>>(uint64_t **result, void *a2, void *a3)
{
  double v5 = result;
  if (result[2])
  {
    double v6 = *result;
    double v7 = result[1];
    std::logic_error *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      int v8 = (uint64_t *)v6[1];
    }
    else {
      int v8 = v6;
    }
    BOOL v14 = result;
    uint64_t v15 = v8;
    double v16 = v8;
    if (v8)
    {
      uint64_t v15 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        BOOL v9 = a2;
        do
        {
          *((_DWORD *)v8 + 8) = *((_DWORD *)v9 + 8);
          v8[5] = v9[5];
          std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__node_insert_multi(v5, (uint64_t)v8);
          int v8 = v15;
          double v16 = v15;
          if (v15) {
            uint64_t v15 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::__detach_next((uint64_t)v15);
          }
          int v10 = (void *)v9[1];
          if (v10)
          {
            do
            {
              a2 = v10;
              int v10 = (void *)*v10;
            }
            while (v10);
          }
          else
          {
            do
            {
              a2 = (void *)v9[2];
              BOOL v11 = *a2 == (void)v9;
              BOOL v9 = a2;
            }
            while (!v11);
          }
          if (!v8) {
            break;
          }
          BOOL v9 = a2;
        }
        while (a2 != a3);
      }
    }
    double result = (uint64_t **)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v14);
  }
  if (a2 != a3)
  {
    do
    {
      double result = (uint64_t **)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_multi<std::pair<Region const,double> const&>(v5, (_OWORD *)a2 + 2);
      int v12 = (void *)a2[1];
      if (v12)
      {
        do
        {
          BOOL v13 = v12;
          int v12 = (void *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          BOOL v13 = (void *)a2[2];
          BOOL v11 = *v13 == (void)a2;
          a2 = v13;
        }
        while (!v11);
      }
      a2 = v13;
    }
    while (v13 != a3);
  }
  return result;
}

void sub_19DFFCD18(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__node_insert_multi(uint64_t **a1, uint64_t a2)
{
  uint64_t v3 = a1 + 1;
  int v4 = a1[1];
  if (v4)
  {
    do
    {
      while (1)
      {
        uint64_t v3 = (uint64_t **)v4;
        if (*(_DWORD *)(a2 + 32) >= *((_DWORD *)v4 + 8)) {
          break;
        }
        int v4 = (uint64_t *)*v4;
        double v5 = v3;
        if (!*v3) {
          goto LABEL_8;
        }
      }
      int v4 = (uint64_t *)v4[1];
    }
    while (v4);
    double v5 = v3 + 1;
  }
  else
  {
    double v5 = a1 + 1;
  }
LABEL_8:
  std::__tree<Region>::__insert_node_at(a1, (uint64_t)v3, v5, (uint64_t *)a2);
  return a2;
}

void *std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  double result = *(void **)(a1 + 16);
  if (result)
  {
    uint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      void *result = 0;
      while (1)
      {
        int v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          double result = v4;
          int v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; uint64_t v3 = (void *)result[1])
      {
        do
        {
          double result = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<Region>::destroy(*(void *)a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<Region>::destroy(*(void *)a1, v2);
  }
  return a1;
}

_OWORD *std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_multi<std::pair<Region const,double> const&>(uint64_t **a1, _OWORD *a2)
{
  int v4 = operator new(0x30uLL);
  double v5 = v4;
  v4[2] = *a2;
  double v6 = a1 + 1;
  double v7 = a1[1];
  if (v7)
  {
    do
    {
      while (1)
      {
        double v6 = (uint64_t **)v7;
        if (*((_DWORD *)v4 + 8) >= *((_DWORD *)v7 + 8)) {
          break;
        }
        double v7 = (uint64_t *)*v7;
        int v8 = v6;
        if (!*v6) {
          goto LABEL_8;
        }
      }
      double v7 = (uint64_t *)v7[1];
    }
    while (v7);
    int v8 = v6 + 1;
  }
  else
  {
    int v8 = a1 + 1;
  }
LABEL_8:
  std::__tree<Region>::__insert_node_at(a1, (uint64_t)v6, v8, (uint64_t *)v4);
  return v5;
}

void SharingImportanceManager::SharingImportanceManager(SharingImportanceManager *this, char a2, char a3)
{
  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  *((_WORD *)this + 12) = 0;
  SharingHysteresis::SharingHysteresis((SharingHysteresis *)((char *)this + 32));
  MagicHeadTieHysteresis::MagicHeadTieHysteresis((MagicHeadTieHysteresis *)((char *)this + 96));
  BigHeadTieHysteresis::BigHeadTieHysteresis((BigHeadTieHysteresis *)((char *)this + 184));
  *((unsigned char *)this + 24) = a2;
  *((unsigned char *)this + 25) = a3;
}

void sub_19DFFCF58(_Unwind_Exception *a1)
{
  MagicHeadTieHysteresis::~MagicHeadTieHysteresis(v3);
  SharingHysteresis::~SharingHysteresis(v2);
  std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

void MagicHeadTieHysteresis::~MagicHeadTieHysteresis(MagicHeadTieHysteresis *this)
{
}

void SharingHysteresis::~SharingHysteresis(SharingHysteresis *this)
{
  uint64_t v2 = (void **)((char *)this + 40);
  std::vector<SharingHysteresis::DeviceScore>::__destroy_vector::operator()[abi:ne180100](&v2);
  uint64_t v2 = (void **)((char *)this + 16);
  std::vector<SharingHysteresis::DeviceScore>::__destroy_vector::operator()[abi:ne180100](&v2);
}

SharingImportanceManager *SharingImportanceManager::handleMeasurements(SharingImportanceManager *this, const SharingImportanceMeasurements *a2)
{
  begin = a2->userSharingInput.__begin_;
  end = a2->userSharingInput.__end_;
  if (a2->userSharingInput.__begin_ != end)
  {
    int v4 = this;
    double v5 = (char *)this + 8;
    do
    {
      if (v5 == (char *)std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::find<std::string>((uint64_t)v4, (const void **)begin))
      {
        if (*((unsigned char *)v4 + 24)) {
          operator new();
        }
        operator new();
      }
      double v7 = begin;
      double v6 = std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)v4, (const void **)begin, (uint64_t)&std::piecewise_construct, (long long **)&v7);
      this = (SharingImportanceManager *)(*(uint64_t (**)(uint64_t, NeighborMeasurements *))(*(void *)v6[7] + 8))(v6[7], begin);
      begin = (NeighborMeasurements *)((char *)begin + 88);
    }
    while (begin != end);
  }
  return this;
}

void sub_19DFFD190(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 32))(v1);
  _Unwind_Resume(a1);
}

void SharingImportanceManager::getImportanceEstimates(uint64_t a1, uint64_t a2, double a3)
{
  int v25 = 0;
  int v26 = 0;
  unint64_t v27 = 0;
  double v6 = (void *)(a2 + 8);
  std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy(a2, *(char **)(a2 + 8));
  *(void *)a2 = v6;
  *(void *)(a2 + 16) = 0;
  *double v6 = 0;
  double v7 = *(uint64_t **)a1;
  if (*(void *)a1 != a1 + 8)
  {
    int64x2_t v20 = vdupq_n_s64(0x7FF4000000000000uLL);
    do
    {
      if ((**(double (***)(uint64_t))v7[7])(v7[7]) >= a3 + -10.0)
      {
        int64x2_t v21 = v20;
        LOWORD(v22) = 0;
        *((void *)&v22 + 1) = 0x7FF4000000000000;
        LOWORD(v23) = 0;
        *((void *)&v23 + 1) = 0x7FF4000000000000;
        LODWORD(v24) = 3;
        *((void *)&v24 + 1) = 0x7FF4000000000000;
        (*(void (**)(uint64_t, int64x2_t *, double))(*(void *)v7[7] + 16))(v7[7], &v21, a3);
        BOOL v28 = (long long *)(v7 + 4);
        int v10 = std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a2, (const void **)v7 + 4, (uint64_t)&std::piecewise_construct, &v28);
        long long v11 = v22;
        long long v13 = v23;
        long long v12 = v24;
        *(int64x2_t *)(v10 + 7) = v21;
        *(_OWORD *)(v10 + 9) = v11;
        *(_OWORD *)(v10 + 11) = v13;
        *(_OWORD *)(v10 + 13) = v12;
      }
      else
      {
        int v8 = v26;
        if ((unint64_t)v26 >= v27)
        {
          BOOL v14 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v25, (long long *)v7 + 2);
        }
        else
        {
          if (*((char *)v7 + 55) < 0)
          {
            std::string::__init_copy_ctor_external(v26, (const std::string::value_type *)v7[4], v7[5]);
          }
          else
          {
            long long v9 = *((_OWORD *)v7 + 2);
            v26->__r_.__value_.__r.__words[2] = v7[6];
            *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
          }
          BOOL v14 = v8 + 1;
        }
        int v26 = v14;
      }
      uint64_t v15 = (uint64_t *)v7[1];
      if (v15)
      {
        do
        {
          double v16 = v15;
          uint64_t v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          double v16 = (uint64_t *)v7[2];
          BOOL v17 = *v16 == (void)v7;
          double v7 = v16;
        }
        while (!v17);
      }
      double v7 = v16;
    }
    while (v16 != (uint64_t *)(a1 + 8));
    double v18 = v25;
    BOOL v19 = v26;
    while (v18 != (const void **)v19)
    {
      std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__erase_unique<std::string>((uint64_t **)a1, v18);
      v18 += 3;
    }
  }
  SharingHysteresis::mitigateBackForthIssuesIfPossible(a1 + 32, (void *)a2, a3);
  MagicHeadTieHysteresis::mitigateMagicHeadBackForthIssuesIfPossible(a1 + 96, a2, a3);
  BigHeadTieHysteresis::mitigateBigHeadBackForthIssuesIfPossible((os_log_t *)(a1 + 184), (uint64_t **)a2, a3);
  SharingImportanceManager::quantizeOutputScores(a1, (void *)a2);
  v21.i64[0] = (uint64_t)&v25;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
}

void sub_19DFFD454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void **a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  a11 = (void **)&a20;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a11);
  _Unwind_Resume(a1);
}

void SharingImportanceManager::quantizeOutputScores(uint64_t a1, void *a2)
{
  MagicHeadTieHysteresis::getMagicHeadScore((MagicHeadTieHysteresis *)(a1 + 96));
  double v5 = v4;
  double BigHeadScore = BigHeadTieHysteresis::getBigHeadScore((BigHeadTieHysteresis *)(a1 + 184));
  long long v9 = (double *)*a2;
  int v8 = (double *)(a2 + 1);
  double v7 = v9;
  if (v9 != v8)
  {
    while (1)
    {
      double v10 = v7[7];
      if (v5 != BigHeadScore) {
        break;
      }
      double v11 = v10 / 0.01;
      if (v10 == v5) {
        goto LABEL_7;
      }
      double v12 = floor(v11);
LABEL_8:
      double v13 = v12 * 0.01;
LABEL_9:
      v7[7] = v13;
      BOOL v14 = (double *)*((void *)v7 + 1);
      if (v14)
      {
        do
        {
          uint64_t v15 = v14;
          BOOL v14 = *(double **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          uint64_t v15 = (double *)*((void *)v7 + 2);
          BOOL v16 = *(void *)v15 == (void)v7;
          double v7 = v15;
        }
        while (!v16);
      }
      double v7 = v15;
      if (v15 == v8) {
        return;
      }
    }
    if (v10 != v5)
    {
      double v13 = floor(v10 / 0.01) * 0.01;
      if (v10 != BigHeadScore) {
        double v13 = fmax(v13 + -0.01, 0.0);
      }
      goto LABEL_9;
    }
    double v11 = v10 / 0.01;
LABEL_7:
    double v12 = ceil(v11);
    goto LABEL_8;
  }
}

void std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void __clang_call_terminate(void *a1)
{
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void std::vector<SharingHysteresis::DeviceScore>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<SharingHysteresis::DeviceScore>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<SharingHysteresis::DeviceScore>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 56)
  {
    if (*(char *)(i - 33) < 0) {
      operator delete(*(void **)(i - 56));
    }
  }
  a1[1] = v2;
}

void std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<SharingImportanceEstimator>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<SharingImportanceEstimator>>,0>(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v3 = *(void **)a1;
    operator delete(v3);
  }
}

uint64_t std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    int v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      int v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    int v8 = a3;
  }
  else {
    int v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

uint64_t *std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__find_equal<std::string>((uint64_t)a1, &v11, a2);
  size_t v7 = *v6;
  if (!*v6)
  {
    int v8 = v6;
    std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<Region>::__insert_node_at(a1, v11, v8, v10[0]);
    size_t v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

void *std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        int v8 = (void *)v4;
        size_t v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    int v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 32);
  int v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  *((void *)v6 + 7) = 0;
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_19DFFDA80(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<SharingImportanceEstimator>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    int v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    int v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    int v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_19DFFDD08(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t *std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  double result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<Region>::__insert_node_at(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

std::string *std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<X0>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x78uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  double result = std::pair<std::string const,NeighborImportanceEstimate>::pair[abi:ne180100]<std::string const&>((std::string *)(v6 + 32), *a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_19DFFE08C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,NeighborImportanceEstimate>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,NeighborImportanceEstimate>::pair[abi:ne180100]<std::string const&>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  *(_OWORD *)&this[1].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&this[2].__r_.__value_.__r.__words[1] = 0u;
  *(int64x2_t *)&this[1].__r_.__value_.__l.__data_ = vdupq_n_s64(0x7FF4000000000000uLL);
  this[2].__r_.__value_.__r.__words[0] = 0x7FF4000000000000;
  this[2].__r_.__value_.__r.__words[2] = 0x7FF4000000000000;
  this[3].__r_.__value_.__r.__words[0] = 0;
  LODWORD(this[3].__r_.__value_.__l.__data_) = 3;
  this[3].__r_.__value_.__l.__size_ = 0x7FF4000000000000;
  return this;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,NeighborImportanceEstimate>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__erase_unique<std::string>(uint64_t **a1, const void **a2)
{
  long long v3 = (uint64_t *)std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::find<std::string>((uint64_t)a1, a2);
  if (a1 + 1 == (uint64_t **)v3) {
    return 0;
  }
  unint64_t v4 = v3;
  std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__remove_node_pointer(a1, v3);
  std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<SharingImportanceEstimator>>,0>((uint64_t)(v4 + 4));
  operator delete(v4);
  return 1;
}

uint64_t *std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      long long v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    unint64_t v4 = a2;
    do
    {
      long long v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      unint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  long long v3 = a2;
  if (*a2)
  {
    unint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      long long v3 = a2;
      goto LABEL_7;
    }
    do
    {
      long long v3 = v4;
      unint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *uint64_t v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      double result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      double result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      char v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        double result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    long long v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      BOOL v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *uint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        BOOL v16 = v7;
      }
      else
      {
        long long v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      long long v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    BOOL v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    BOOL v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      BOOL v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      double result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  BOOL v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  int64x2_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    BOOL v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    int64x2_t v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *int64x2_t v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    BOOL v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  long long v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void SimpleSharingImportanceEstimator::SimpleSharingImportanceEstimator(SimpleSharingImportanceEstimator *this)
{
  *(void *)this = &unk_1EF08DA28;
  *((unsigned char *)this + 8) = 0;
  *((void *)this + 2) = 0;
}

double SimpleSharingImportanceEstimator::getTime(SimpleSharingImportanceEstimator *this)
{
  return *((double *)this + 2);
}

uint64_t SimpleSharingImportanceEstimator::handleMeasurements(uint64_t this, const NeighborMeasurements *a2)
{
  *(void *)(this + 16) = a2->var0.var0.var1.var0[0];
  if (LOBYTE(a2->var0.var0.var1.var0[1])) {
    BOOL v2 = *(double *)&a2->var0.var0.var1.var0[2] < 1.0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = a2[1].var0.var0.var0.var0.var0.var0[8];
    if (v3) {
      char v3 = HIDWORD(a2[1].var0.var0.var0.var0.var1.var1) == 0;
    }
  }
  *(unsigned char *)(this + 8) = v3;
  return this;
}

uint64_t SimpleSharingImportanceEstimator::getImportanceEstimate(uint64_t result, uint64_t a2)
{
  double v2 = 1.0;
  if (!*(unsigned char *)(result + 8)) {
    double v2 = 0.0;
  }
  *(double *)a2 = v2;
  *(unsigned char *)(a2 + 16) = 1;
  return result;
}

void SimpleSharingImportanceEstimator::~SimpleSharingImportanceEstimator(SimpleSharingImportanceEstimator *this)
{
}

void SharingHysteresis::SharingHysteresis(SharingHysteresis *this)
{
  *(void *)this = 0x7FF4000000000000;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0u;
  *((void *)this + 7) = 0;
}

void SharingHysteresis::populateCurrentDeviceScores(uint64_t *a1, void *a2)
{
  unint64_t v4 = a1 + 2;
  std::vector<SharingHysteresis::DeviceScore>::__clear[abi:ne180100](a1 + 2);
  int v8 = (void *)*a2;
  uint64_t v6 = a2 + 1;
  uint64_t v7 = v8;
  if (v8 != v6)
  {
    int64x2_t v18 = vdupq_n_s64(0x7FF4000000000000uLL);
    do
    {
      memset(&v19, 0, sizeof(v19));
      int64x2_t v20 = v18;
      int64x2_t v21 = v18;
      std::string::operator=(&v19, (const std::string *)(v7 + 4));
      v5.n128_u64[0] = v7[7];
      v20.i64[0] = v5.n128_u64[0];
      v20.i64[1] = v5.n128_u64[0];
      int64x2_t v21 = 0uLL;
      if (*((unsigned char *)v7 + 72))
      {
        unint64_t v9 = a1[3];
        if (v9 >= a1[4])
        {
          uint64_t v10 = std::vector<SharingHysteresis::DeviceScore>::__push_back_slow_path<SharingHysteresis::DeviceScore const&>(v4, (long long *)&v19);
        }
        else
        {
          __n128 v5 = std::vector<SharingHysteresis::DeviceScore>::__construct_one_at_end[abi:ne180100]<SharingHysteresis::DeviceScore const&>((uint64_t)v4, (long long *)&v19);
          uint64_t v10 = v9 + 56;
        }
        a1[3] = v10;
      }
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v19.__r_.__value_.__l.__data_);
      }
      uint64_t v11 = (void *)v7[1];
      if (v11)
      {
        do
        {
          uint64_t v12 = v11;
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          uint64_t v12 = (void *)v7[2];
          BOOL v13 = *v12 == (void)v7;
          uint64_t v7 = v12;
        }
        while (!v13);
      }
      uint64_t v7 = v12;
    }
    while (v12 != v6);
  }
  uint64_t v14 = (uint64_t *)a1[2];
  unint64_t v15 = a1[3];
  unint64_t v16 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v15 - (void)v14) >> 3));
  v19.__r_.__value_.__r.__words[0] = (std::string::size_type)compareByScore;
  if ((uint64_t *)v15 == v14) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v16;
  }
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*,false>(v14, v15, (unsigned int (**)(uint64_t *, uint64_t *, __n128))&v19, v17, 1, v5);
}

void sub_19DFFF564(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL compareByScore(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 24) > *(double *)(a2 + 24);
}

unint64_t SharingHysteresis::getCurrentRank(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = (*(void *)(a1 + 24) - v2) / 56;
  if (*(void *)(a1 + 24) != v2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a2[23];
    int v8 = *(const void **)a2;
    size_t v7 = *((void *)a2 + 1);
    if ((v6 & 0x80u) == 0) {
      unint64_t v9 = (unsigned __int8 *)a2[23];
    }
    else {
      unint64_t v9 = (unsigned __int8 *)*((void *)a2 + 1);
    }
    if (v3 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = (*(void *)(a1 + 24) - v2) / 56;
    }
    do
    {
      uint64_t v11 = (unsigned __int8 **)(v2 + 56 * v5);
      uint64_t v12 = (unsigned __int8 *)*((unsigned __int8 *)v11 + 23);
      int v13 = (char)v12;
      if ((char)v12 < 0) {
        uint64_t v12 = v11[1];
      }
      if (v9 == v12)
      {
        if (v13 >= 0) {
          uint64_t v14 = (unsigned __int8 *)(v2 + 56 * v5);
        }
        else {
          uint64_t v14 = *v11;
        }
        if ((v6 & 0x80) != 0)
        {
          if (!memcmp(v8, v14, v7)) {
            return v5;
          }
        }
        else
        {
          if (!v6) {
            return v5;
          }
          unint64_t v15 = a2;
          uint64_t v16 = v6;
          while (*v15 == *v14)
          {
            ++v15;
            ++v14;
            if (!--v16) {
              return v5;
            }
          }
        }
      }
      ++v5;
    }
    while (v5 != v10);
  }
  return v3;
}

double SharingHysteresis::getScoreDelta(SharingHysteresis *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((*((void *)this + 3) - v2) >> 3) <= a2) {
    SharingHysteresis::getScoreDelta();
  }
  return vabdd_f64(*(double *)(v2 + 56 * a2 + 24), *(double *)(v2 + 56 * a2 + 32));
}

BOOL SharingHysteresis::belowTimeDeltaThreshold1(SharingHysteresis *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((*((void *)this + 3) - v2) >> 3) <= a2) {
    SharingHysteresis::belowTimeDeltaThreshold1();
  }
  unint64_t v4 = (long long *)(v2 + 56 * a2);
  if (*((char *)v4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v4, *((void *)v4 + 1));
  }
  else
  {
    long long v5 = *v4;
    __p.__r_.__value_.__r.__words[2] = *((void *)v4 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v5;
  }
  double PreviousSticknessDuration1 = SharingHysteresis::getPreviousSticknessDuration1((uint64_t)this, (unsigned __int8 *)&__p);
  double v7 = *(double *)this;
  double v8 = *((double *)this + 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return PreviousSticknessDuration1 + v7 - v8 < 4.5;
}

void sub_19DFFF7C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double SharingHysteresis::getPreviousSticknessDuration1(uint64_t a1, unsigned __int8 *a2)
{
  unint64_t v3 = *(long long **)(a1 + 40);
  unint64_t v4 = *(long long **)(a1 + 48);
  double v5 = 0.0;
  while (v3 != v4)
  {
    if (*((char *)v3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *((void *)v3 + 1));
    }
    else
    {
      long long v7 = *v3;
      __p.__r_.__value_.__r.__words[2] = *((void *)v3 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v7;
    }
    long long v8 = *(long long *)((char *)v3 + 40);
    long long v18 = *(long long *)((char *)v3 + 24);
    *(_OWORD *)std::string v19 = v8;
    uint64_t v9 = a2[23];
    if ((v9 & 0x80u) == 0) {
      uint64_t v10 = a2[23];
    }
    else {
      uint64_t v10 = *((void *)a2 + 1);
    }
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    int v12 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    if (v10 != size) {
      goto LABEL_21;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((v9 & 0x80) != 0)
    {
      if (memcmp(*(const void **)a2, p_p, *((void *)a2 + 1))) {
        goto LABEL_21;
      }
    }
    else if (a2[23])
    {
      uint64_t v14 = a2;
      while (*v14 == p_p->__r_.__value_.__s.__data_[0])
      {
        ++v14;
        p_p = (std::string *)((char *)p_p + 1);
        if (!--v9) {
          goto LABEL_26;
        }
      }
LABEL_21:
      int v15 = 0;
      if ((v12 & 0x80000000) == 0) {
        goto LABEL_23;
      }
LABEL_22:
      operator delete(__p.__r_.__value_.__l.__data_);
      goto LABEL_23;
    }
LABEL_26:
    double v2 = v19[0];
    int v15 = 1;
    if (v12 < 0) {
      goto LABEL_22;
    }
LABEL_23:
    if (v15) {
      return v2;
    }
    unint64_t v3 = (long long *)((char *)v3 + 56);
  }
  return v5;
}

BOOL SharingHysteresis::belowTimeDeltaThreshold2(SharingHysteresis *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((*((void *)this + 3) - v2) >> 3) <= a2) {
    SharingHysteresis::belowTimeDeltaThreshold2();
  }
  unint64_t v4 = (long long *)(v2 + 56 * a2);
  if (*((char *)v4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v4, *((void *)v4 + 1));
  }
  else
  {
    long long v5 = *v4;
    __p.__r_.__value_.__r.__words[2] = *((void *)v4 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v5;
  }
  double PreviousSticknessDuration2 = SharingHysteresis::getPreviousSticknessDuration2((uint64_t)this, (unsigned __int8 *)&__p);
  double v7 = *(double *)this;
  double v8 = *((double *)this + 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return PreviousSticknessDuration2 + v7 - v8 < 1.5;
}

void sub_19DFFF9F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double SharingHysteresis::getPreviousSticknessDuration2(uint64_t a1, unsigned __int8 *a2)
{
  unint64_t v3 = *(long long **)(a1 + 40);
  unint64_t v4 = *(long long **)(a1 + 48);
  double v5 = 0.0;
  while (v3 != v4)
  {
    if (*((char *)v3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *((void *)v3 + 1));
    }
    else
    {
      long long v7 = *v3;
      __p.__r_.__value_.__r.__words[2] = *((void *)v3 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v7;
    }
    long long v8 = *(long long *)((char *)v3 + 40);
    long long v18 = *(long long *)((char *)v3 + 24);
    long long v19 = v8;
    uint64_t v9 = a2[23];
    if ((v9 & 0x80u) == 0) {
      uint64_t v10 = a2[23];
    }
    else {
      uint64_t v10 = *((void *)a2 + 1);
    }
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    int v12 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    if (v10 != size) {
      goto LABEL_21;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((v9 & 0x80) != 0)
    {
      if (memcmp(*(const void **)a2, p_p, *((void *)a2 + 1))) {
        goto LABEL_21;
      }
    }
    else if (a2[23])
    {
      uint64_t v14 = a2;
      while (*v14 == p_p->__r_.__value_.__s.__data_[0])
      {
        ++v14;
        p_p = (std::string *)((char *)p_p + 1);
        if (!--v9) {
          goto LABEL_26;
        }
      }
LABEL_21:
      int v15 = 0;
      if ((v12 & 0x80000000) == 0) {
        goto LABEL_23;
      }
LABEL_22:
      operator delete(__p.__r_.__value_.__l.__data_);
      goto LABEL_23;
    }
LABEL_26:
    double v2 = *((double *)&v19 + 1);
    int v15 = 1;
    if (v12 < 0) {
      goto LABEL_22;
    }
LABEL_23:
    if (v15) {
      return v2;
    }
    unint64_t v3 = (long long *)((char *)v3 + 56);
  }
  return v5;
}

void SharingHysteresis::setStickinessDuration1(SharingHysteresis *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((*((void *)this + 3) - v2) >> 3) <= a2) {
    SharingHysteresis::setStickinessDuration1();
  }
  double v5 = (long long *)(v2 + 56 * a2);
  if (*((char *)v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *((void *)v5 + 1));
  }
  else
  {
    long long v6 = *v5;
    __p.__r_.__value_.__r.__words[2] = *((void *)v5 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v6;
  }
  double v7 = SharingHysteresis::getPreviousSticknessDuration1((uint64_t)this, (unsigned __int8 *)&__p)
     + *(double *)this
     - *((double *)this + 1);
  if (v7 >= 4.5) {
    __assert_rtn("setStickinessDuration1", "SharingHysteresis.cpp", 106, "curSticknessDuration1 < TIME_DELTA_THRESHOLD_1");
  }
  *(double *)(*((void *)this + 2) + 56 * a2 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_19DFFFC48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SharingHysteresis::setStickinessDuration2(SharingHysteresis *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((*((void *)this + 3) - v2) >> 3) <= a2) {
    SharingHysteresis::setStickinessDuration2();
  }
  double v5 = (long long *)(v2 + 56 * a2);
  if (*((char *)v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *((void *)v5 + 1));
  }
  else
  {
    long long v6 = *v5;
    __p.__r_.__value_.__r.__words[2] = *((void *)v5 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v6;
  }
  double v7 = SharingHysteresis::getPreviousSticknessDuration2((uint64_t)this, (unsigned __int8 *)&__p)
     + *(double *)this
     - *((double *)this + 1);
  if (v7 >= 1.5) {
    __assert_rtn("setStickinessDuration2", "SharingHysteresis.cpp", 115, "curSticknessDuration2 < TIME_DELTA_THRESHOLD_2");
  }
  *(double *)(*((void *)this + 2) + 56 * a2 + 48) = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_19DFFFD58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SharingHysteresis::setStickinessDuration(SharingHysteresis *this, unint64_t a2)
{
  double ScoreDelta = SharingHysteresis::getScoreDelta(this, a2);
  if (ScoreDelta >= 0.02) {
    SharingHysteresis::setStickinessDuration();
  }
  SharingHysteresis::setStickinessDuration1(this, a2);
  if (ScoreDelta >= 0.01)
  {
    SharingHysteresis::setStickinessDuration2(this, a2);
  }
}

uint64_t SharingHysteresis::canSwap(SharingHysteresis *this, unint64_t a2)
{
  double ScoreDelta = SharingHysteresis::getScoreDelta(this, a2);
  if (ScoreDelta >= 0.02) {
    return 0;
  }
  LODWORD(result) = SharingHysteresis::belowTimeDeltaThreshold1(this, a2);
  int v6 = result;
  if (ScoreDelta < 0.01) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 0;
  }
  if (ScoreDelta >= 0.01 && v6 != 0)
  {
    return SharingHysteresis::belowTimeDeltaThreshold2(this, a2);
  }
  return result;
}

double SharingHysteresis::swapScore(SharingHysteresis *this, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = v3 + 56 * a3;
  double result = *(double *)(v4 + 32);
  uint64_t v6 = v3 + 56 * a2;
  *(void *)(v4 + 32) = *(void *)(v6 + 32);
  *(double *)(v6 + 32) = result;
  return result;
}

void SharingHysteresis::swapDeviceInfo(SharingHysteresis *this, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *((void *)this + 2);
  double v7 = (long long *)(v6 + 56 * a2);
  if (*((char *)v7 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *((void *)v7 + 1));
    uint64_t v9 = *((void *)this + 2);
  }
  else
  {
    long long v8 = *v7;
    __p.__r_.__value_.__r.__words[2] = *((void *)v7 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v8;
    uint64_t v9 = v6;
  }
  uint64_t v10 = 56 * a2;
  uint64_t v11 = v6 + 56 * a2;
  long long v12 = *(_OWORD *)(v11 + 24);
  long long v28 = *(_OWORD *)(v11 + 40);
  long long v27 = v12;
  std::string::operator=((std::string *)(v9 + 56 * a2), (const std::string *)(v9 + 56 * a3));
  uint64_t v13 = v9 + 56 * a2;
  uint64_t v14 = v9 + 56 * a3;
  long long v15 = *(_OWORD *)(v14 + 24);
  *(_OWORD *)(v13 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(_OWORD *)(v14 + 40);
  *(_OWORD *)(v13 + 24) = v15;
  uint64_t v16 = *((void *)this + 2);
  std::string::operator=((std::string *)(v16 + 56 * a3), &__p);
  uint64_t v17 = v16 + 56 * a3;
  long long v18 = v27;
  *(_OWORD *)(v17 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = v28;
  *(_OWORD *)(v17 + 24) = v18;
  long long v19 = (unsigned __int8 *)(*((void *)this + 2) + v10);
  int64x2_t v20 = (unsigned __int8 **)(*((void *)this + 5) + v10);
  uint64_t v21 = v19[23];
  if ((v21 & 0x80u) == 0) {
    uint64_t v22 = (unsigned __int8 *)v19[23];
  }
  else {
    uint64_t v22 = (unsigned __int8 *)*((void *)v19 + 1);
  }
  uint64_t v23 = (unsigned __int8 *)*((unsigned __int8 *)v20 + 23);
  int v24 = (char)v23;
  if ((char)v23 < 0) {
    uint64_t v23 = v20[1];
  }
  if (v22 != v23) {
    goto LABEL_22;
  }
  if (v24 >= 0) {
    uint64_t v25 = (unsigned __int8 *)(*((void *)this + 5) + v10);
  }
  else {
    uint64_t v25 = *v20;
  }
  if ((v21 & 0x80) != 0)
  {
    if (memcmp(*(const void **)v19, v25, *((void *)v19 + 1))) {
      goto LABEL_22;
    }
  }
  else if (v19[23])
  {
    while (*v19 == *v25)
    {
      ++v19;
      ++v25;
      if (!--v21) {
        goto LABEL_19;
      }
    }
LABEL_22:
    __assert_rtn("swapDeviceInfo", "SharingHysteresis.cpp", 155, "currentDeviceScores[previousRank].deviceID == previousDeviceScores[previousRank].deviceID");
  }
LABEL_19:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_19E000070(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SharingHysteresis::overwriteOutputScores(uint64_t a1, void *a2)
{
  uint64_t v2 = *(long long **)(a1 + 16);
  uint64_t v3 = *(long long **)(a1 + 24);
  if (v2 != v3)
  {
    uint64_t v4 = a2 + 1;
    while (1)
    {
      if (*((char *)v2 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v22, *(const std::string::value_type **)v2, *((void *)v2 + 1));
      }
      else
      {
        long long v5 = *v2;
        v22.__r_.__value_.__r.__words[2] = *((void *)v2 + 2);
        *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v5;
      }
      long long v6 = *(long long *)((char *)v2 + 40);
      long long v23 = *(long long *)((char *)v2 + 24);
      long long v24 = v6;
      uint64_t v7 = *((void *)&v23 + 1);
      if (vabdd_f64(*(double *)&v23, *((double *)&v23 + 1)) >= 0.000001) {
        break;
      }
      LOBYTE(v8) = *((unsigned char *)&v22.__r_.__value_.__s + 23);
LABEL_32:
      if ((v8 & 0x80) != 0) {
        operator delete(v22.__r_.__value_.__l.__data_);
      }
      uint64_t v2 = (long long *)((char *)v2 + 56);
      if (v2 == v3) {
        return;
      }
    }
    uint64_t v9 = (void *)*a2;
    uint64_t v10 = HIBYTE(v22.__r_.__value_.__r.__words[2]);
    int v8 = SHIBYTE(v22.__r_.__value_.__r.__words[2]);
    if ((void *)*a2 == v4) {
      goto LABEL_32;
    }
    long long v11 = *(_OWORD *)&v22.__r_.__value_.__l.__data_;
    if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v22.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v22.__r_.__value_.__l.__size_;
    }
    while (1)
    {
      uint64_t v13 = *((unsigned __int8 *)v9 + 55);
      int v14 = (char)v13;
      if ((v13 & 0x80u) != 0) {
        uint64_t v13 = v9[5];
      }
      if (size != v13) {
        goto LABEL_26;
      }
      long long v15 = v14 >= 0 ? (unsigned __int8 *)(v9 + 4) : (unsigned __int8 *)v9[4];
      if ((v8 & 0x80000000) == 0) {
        break;
      }
      if (!memcmp((const void *)v11, v15, *((size_t *)&v11 + 1))) {
        goto LABEL_25;
      }
LABEL_26:
      long long v18 = (void *)v9[1];
      if (v18)
      {
        do
        {
          long long v19 = v18;
          long long v18 = (void *)*v18;
        }
        while (v18);
      }
      else
      {
        do
        {
          long long v19 = (void *)v9[2];
          BOOL v20 = *v19 == (void)v9;
          uint64_t v9 = v19;
        }
        while (!v20);
      }
      uint64_t v9 = v19;
      if (v19 == v4) {
        goto LABEL_32;
      }
    }
    if (v8)
    {
      uint64_t v16 = &v22;
      uint64_t v17 = v10;
      while (v16->__r_.__value_.__s.__data_[0] == *v15)
      {
        uint64_t v16 = (std::string *)((char *)v16 + 1);
        ++v15;
        if (!--v17) {
          goto LABEL_25;
        }
      }
      goto LABEL_26;
    }
LABEL_25:
    v9[7] = v7;
    goto LABEL_26;
  }
}

uint64_t SharingHysteresis::sanityCheckSwappedScores(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 16);
  unint64_t v2 = 0x6DB6DB6DB6DB6DB7 * ((*(void *)(this + 24) - v1) >> 3);
  if (v2 >= 2)
  {
    double v3 = *(double *)(v1 + 32);
    unint64_t v4 = v2 - 1;
    long long v5 = (double *)(v1 + 88);
    do
    {
      double v6 = v3;
      double v3 = *v5;
      if (v6 < *v5) {
        SharingHysteresis::sanityCheckSwappedScores();
      }
      v5 += 7;
      --v4;
    }
    while (v4);
  }
  return this;
}

void SharingHysteresis::mitigateBackForthIssuesIfPossible(uint64_t a1, void *a2, double a3)
{
  *(double *)a1 = a3;
  if (*(double *)(a1 + 8) <= a3)
  {
    SharingHysteresis::populateCurrentDeviceScores((uint64_t *)a1, a2);
    if (*(void *)(a1 + 16) == *(void *)(a1 + 24))
    {
      std::vector<SharingHysteresis::DeviceScore>::__clear[abi:ne180100]((uint64_t *)(a1 + 40));
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 40);
      if (*(void *)(a1 + 48) != v5)
      {
        uint64_t v6 = 0;
        unint64_t v7 = 0;
        while (1)
        {
          uint64_t v8 = *(void *)(a1 + 16);
          unint64_t v9 = 0x6DB6DB6DB6DB6DB7 * ((*(void *)(a1 + 24) - v8) >> 3);
          if (v7 >= v9) {
            break;
          }
          uint64_t v10 = (long long *)(v5 + v6);
          if (*((char *)v10 + 23) < 0)
          {
            std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v10, *((void *)v10 + 1));
            uint64_t v8 = *(void *)(a1 + 16);
            unint64_t v9 = 0x6DB6DB6DB6DB6DB7 * ((*(void *)(a1 + 24) - v8) >> 3);
          }
          else
          {
            long long v11 = *v10;
            __p.__r_.__value_.__r.__words[2] = *((void *)v10 + 2);
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v11;
          }
          unint64_t CurrentRank = SharingHysteresis::getCurrentRank(a1, (unsigned __int8 *)&__p);
          if (CurrentRank == v9) {
            goto LABEL_18;
          }
          unint64_t v13 = CurrentRank;
          if (v7 > CurrentRank) {
            __assert_rtn("mitigateBackForthIssuesIfPossible", "SharingHysteresis.cpp", 238, "previousRank <= currentRank");
          }
          if (v7 == CurrentRank)
          {
            int v14 = 4;
          }
          else
          {
            uint64_t v15 = *(void *)(v8 + v6 + 32);
            uint64_t v16 = v8 + 56 * CurrentRank;
            *(void *)(v8 + v6 + 32) = *(void *)(v16 + 32);
            *(void *)(v16 + 32) = v15;
            int canSwap = SharingHysteresis::canSwap((SharingHysteresis *)a1, v7);
            if (!canSwap || !SharingHysteresis::canSwap((SharingHysteresis *)a1, v13))
            {
              uint64_t v18 = *(void *)(a1 + 16);
              uint64_t v19 = v18 + 56 * v13;
              uint64_t v20 = *(void *)(v19 + 32);
              uint64_t v21 = v18 + v6;
              *(void *)(v19 + 32) = *(void *)(v21 + 32);
              *(void *)(v21 + 32) = v20;
LABEL_18:
              int v14 = 2;
              goto LABEL_19;
            }
            SharingHysteresis::swapDeviceInfo((SharingHysteresis *)a1, v7, v13);
            SharingHysteresis::setStickinessDuration((SharingHysteresis *)a1, v7);
            SharingHysteresis::setStickinessDuration((SharingHysteresis *)a1, v13);
            int v14 = 0;
          }
LABEL_19:
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          if ((v14 | 4) == 4)
          {
            ++v7;
            uint64_t v5 = *(void *)(a1 + 40);
            v6 += 56;
            if (v7 < 0x6DB6DB6DB6DB6DB7 * ((*(void *)(a1 + 48) - v5) >> 3)) {
              continue;
            }
          }
          break;
        }
      }
      SharingHysteresis::sanityCheckSwappedScores(a1);
      SharingHysteresis::overwriteOutputScores(a1, a2);
      std::vector<SharingHysteresis::DeviceScore>::__assign_with_size[abi:ne180100]<SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(a1 + 40, *(std::string **)(a1 + 16), *(long long **)(a1 + 24), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3));
      *(void *)(a1 + 8) = *(void *)a1;
    }
  }
}

void sub_19E000514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::vector<SharingHysteresis::DeviceScore>::__construct_one_at_end[abi:ne180100]<SharingHysteresis::DeviceScore const&>(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    *(void *)(v4 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v5;
  }
  __n128 result = *(__n128 *)((char *)a2 + 24);
  *(_OWORD *)(v4 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(long long *)((char *)a2 + 40);
  *(__n128 *)(v4 + 24) = result;
  *(void *)(a1 + 8) = v4 + 56;
  return result;
}

void sub_19E0005A4(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<SharingHysteresis::DeviceScore>::__push_back_slow_path<SharingHysteresis::DeviceScore const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x492492492492492) {
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x249249249249249) {
    unint64_t v9 = 0x492492492492492;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v20 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  long long v11 = (std::string *)&v10[56 * v4];
  v17[0] = v10;
  v17[1] = v11;
  uint64_t v18 = v11;
  uint64_t v19 = &v10[56 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    long long v11 = v18;
  }
  else
  {
    long long v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  unint64_t v13 = &v10[56 * v4];
  long long v14 = *(long long *)((char *)a2 + 24);
  *(_OWORD *)(v13 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(long long *)((char *)a2 + 40);
  *(_OWORD *)(v13 + 24) = v14;
  uint64_t v18 = (std::string *)((char *)v11 + 56);
  std::vector<SharingHysteresis::DeviceScore>::__swap_out_circular_buffer(a1, v17);
  uint64_t v15 = a1[1];
  std::__split_buffer<SharingHysteresis::DeviceScore>::~__split_buffer((uint64_t)v17);
  return v15;
}

void sub_19E0006EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<SharingHysteresis::DeviceScore>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<SharingHysteresis::DeviceScore>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>,std::reverse_iterator<SharingHysteresis::DeviceScore*>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(56 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>,std::reverse_iterator<SharingHysteresis::DeviceScore*>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 56);
      *(void *)(v9 - 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(void *)(a3 - 40);
      *(_OWORD *)(v9 - 56) = v10;
      *(void *)(a3 - 48) = 0;
      *(void *)(a3 - 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
      *(void *)(a3 - 56) = 0;
      long long v11 = *(_OWORD *)(a3 - 16);
      *(_OWORD *)(v9 - 32) = *(_OWORD *)(a3 - 32);
      *(_OWORD *)(v9 - 16) = v11;
      v9 -= 56;
      v7 -= 56;
      a3 -= 56;
    }
    while (a3 != a5);
    *((void *)&v16 + 1) = v9;
  }
  char v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 56;
  }
}

uint64_t std::__split_buffer<SharingHysteresis::DeviceScore>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<SharingHysteresis::DeviceScore>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 7;
      *(void *)(a1 + 16) = v2 - 7;
      if (*((char *)v2 - 33) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*,false>(uint64_t *a1, unint64_t a2, unsigned int (**a3)(uint64_t *, uint64_t *, __n128), uint64_t a4, char a5, __n128 a6)
{
  long long v10 = (long long *)a2;
  long long v11 = a1;
  unint64_t v27 = a2;
  long long v28 = a1;
LABEL_2:
  for (uint64_t i = 1 - a4; ; ++i)
  {
    uint64_t v13 = (char *)v10 - (char *)v11;
    unint64_t v14 = 0x6DB6DB6DB6DB6DB7 * (((char *)v10 - (char *)v11) >> 3);
    if (!(!v7 & v6))
    {
      switch(v14)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          uint64_t v25 = *a3;
          unint64_t v27 = (unint64_t)v10 - 56;
          if (((unsigned int (*)(void))v25)()) {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v28, (uint64_t *)&v27);
          }
          break;
        case 3uLL:
          unint64_t v27 = (unint64_t)v10 - 56;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v11, v11 + 7, (uint64_t)v10 - 56, a3);
          break;
        case 4uLL:
          unint64_t v27 = (unint64_t)v10 - 56;
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v11, v11 + 7, v11 + 14, (uint64_t)v10 - 56, a3);
          break;
        case 5uLL:
          unint64_t v27 = (unint64_t)v10 - 56;
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v11, v11 + 7, v11 + 14, v11 + 21, (uint64_t)v10 - 56, a3);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v13 <= 1343)
    {
      if (a5) {
        std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((uint64_t)v11, v10, (uint64_t (**)(long long *, uint64_t))a3);
      }
      else {
        std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((long long *)v11, v10, (uint64_t (**)(long long *, uint64_t))a3);
      }
      return;
    }
    if (i == 1) {
      break;
    }
    unint64_t v15 = v14 >> 1;
    uint64_t v16 = (uint64_t)v10 - 56;
    if ((unint64_t)v13 >= 0x1C01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v11, &v11[7 * (v14 >> 1)], v16, a3);
      uint64_t v17 = 7 * v15;
      uint64_t v18 = 56 * v15 - 56;
      unint64_t v19 = v27;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v28 + 7, (uint64_t *)((char *)v28 + v18), v27 - 112, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v28 + 14, &v28[v17 + 7], v19 - 168, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((uint64_t *)((char *)v28 + v18), &v28[v17], (uint64_t)&v28[v17 + 7], a3);
      uint64_t v26 = &v28[v17];
      __n128 v21 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v28, (uint64_t *)&v26);
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(&v11[7 * (v14 >> 1)], v11, v16, a3);
      if (a5)
      {
LABEL_13:
        long long v10 = (long long *)v27;
        goto LABEL_14;
      }
    }
    char v20 = ((uint64_t (*)(uint64_t *, __n128))*a3)(v28 - 7, v21);
    long long v10 = (long long *)v27;
    if ((v20 & 1) == 0)
    {
      long long v11 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,SharingHysteresis::DeviceScore *,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&)>((uint64_t)v28, v27, (unsigned int (**)(void **, __n128))a3);
LABEL_22:
      a5 = 0;
      long long v28 = v11;
      a4 = -i;
      goto LABEL_2;
    }
LABEL_14:
    std::string v22 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,SharingHysteresis::DeviceScore *,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&)>((uint64_t)v28, (unint64_t)v10, (uint64_t (**)(void))a3);
    if ((v23 & 1) == 0) {
      goto LABEL_21;
    }
    BOOL v24 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v28, (uint64_t)v22, a3);
    long long v11 = v22 + 7;
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v22 + 7, (uint64_t)v10, a3))
    {
      if (v24) {
        return;
      }
      unint64_t v27 = (unint64_t)v22;
      long long v11 = v28;
      long long v10 = (long long *)v22;
    }
    else
    {
      if (!v24)
      {
LABEL_21:
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*,false>(v28, v22, a3, -i, a5 & 1);
        long long v11 = v22 + 7;
        goto LABEL_22;
      }
      long long v28 = v22 + 7;
    }
  }
  if (v11 != (uint64_t *)v10) {
    std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>((long long *)v11, (uint64_t *)v10, (uint64_t *)v10, (unsigned int (**)(int64_t, uint64_t))a3, a6);
  }
}

__n128 std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = **a1;
  *(void *)long long v11 = (*a1)[1];
  *(void *)&v11[7] = *(uint64_t *)((char *)*a1 + 15);
  char v5 = *((unsigned char *)*a1 + 23);
  v2[1] = 0;
  v2[2] = 0;
  uint64_t *v2 = 0;
  __n128 v9 = *(__n128 *)(v2 + 3);
  long long v10 = *(_OWORD *)(v2 + 5);
  uint64_t v6 = *(void *)(v3 + 16);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)v3;
  v2[2] = v6;
  *(unsigned char *)(v3 + 23) = 0;
  *(unsigned char *)uint64_t v3 = 0;
  long long v7 = *(_OWORD *)(v3 + 40);
  *(_OWORD *)(v2 + 3) = *(_OWORD *)(v3 + 24);
  *(_OWORD *)(v2 + 5) = v7;
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  *(void *)uint64_t v3 = v4;
  *(void *)(v3 + 8) = *(void *)v11;
  *(void *)(v3 + 15) = *(void *)&v11[7];
  *(unsigned char *)(v3 + 23) = v5;
  __n128 result = v9;
  *(__n128 *)(v3 + 24) = v9;
  *(_OWORD *)(v3 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = v10;
  return result;
}

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t a1, long long *a2, uint64_t (**a3)(long long *, uint64_t))
{
  if ((long long *)a1 != a2)
  {
    char v5 = (long long *)(a1 + 56);
    if ((long long *)(a1 + 56) != a2)
    {
      uint64_t v7 = 0;
      uint64_t v8 = a1;
      do
      {
        __n128 v9 = v5;
        if ((*a3)(v5, v8))
        {
          long long v20 = *v9;
          uint64_t v21 = *((void *)v9 + 2);
          *((void *)v9 + 1) = 0;
          *((void *)v9 + 2) = 0;
          *(void *)__n128 v9 = 0;
          long long v10 = *(_OWORD *)(v8 + 96);
          long long v22 = *(_OWORD *)(v8 + 80);
          long long v23 = v10;
          uint64_t v11 = v7;
          while (1)
          {
            uint64_t v12 = v11;
            uint64_t v13 = a1 + v11;
            uint64_t v14 = a1 + v11 + 56;
            if (*(char *)(a1 + v11 + 79) < 0) {
              operator delete(*(void **)v14);
            }
            *(_OWORD *)uint64_t v14 = *(_OWORD *)v13;
            *(void *)(v14 + 16) = *(void *)(v13 + 16);
            *(unsigned char *)(v13 + 23) = 0;
            *(unsigned char *)uint64_t v13 = 0;
            long long v15 = *(_OWORD *)(v13 + 40);
            *(_OWORD *)(v13 + 8TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(_OWORD *)(v13 + 24);
            *(_OWORD *)(v13 + 96) = v15;
            if (!v12) {
              break;
            }
            char v16 = (*a3)(&v20, a1 + v12 - 56);
            uint64_t v11 = v12 - 56;
            if ((v16 & 1) == 0)
            {
              uint64_t v17 = a1 + v12;
              goto LABEL_12;
            }
          }
          uint64_t v17 = a1;
LABEL_12:
          if (*(char *)(v17 + 23) < 0) {
            operator delete(*(void **)v17);
          }
          uint64_t v18 = (_OWORD *)(a1 + v12 + 24);
          *(_OWORD *)uint64_t v17 = v20;
          *(void *)(v17 + 16) = v21;
          long long v19 = v23;
          _OWORD *v18 = v22;
          v18[1] = v19;
        }
        char v5 = (long long *)((char *)v9 + 56);
        v7 += 56;
        uint64_t v8 = (uint64_t)v9;
      }
      while ((long long *)((char *)v9 + 56) != a2);
    }
  }
}

void sub_19E000ED4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(long long *a1, long long *a2, uint64_t (**a3)(long long *, uint64_t))
{
  if (a1 != a2)
  {
    uint64_t v4 = a1;
    char v5 = (long long *)((char *)a1 + 56);
    if ((long long *)((char *)a1 + 56) != a2)
    {
      uint64_t v7 = (uint64_t)a1 - 56;
      do
      {
        uint64_t v8 = v5;
        if ((*a3)(v5, (uint64_t)v4))
        {
          long long v16 = *v8;
          uint64_t v17 = *((void *)v8 + 2);
          *((void *)v8 + 1) = 0;
          *((void *)v8 + 2) = 0;
          *(void *)uint64_t v8 = 0;
          long long v9 = v4[6];
          long long v18 = v4[5];
          long long v19 = v9;
          uint64_t v10 = v7;
          do
          {
            uint64_t v11 = (void **)(v10 + 112);
            if (*(char *)(v10 + 135) < 0) {
              operator delete(*v11);
            }
            *(_OWORD *)uint64_t v11 = *(_OWORD *)(v10 + 56);
            *(void *)(v10 + 128) = *(void *)(v10 + 72);
            *(unsigned char *)(v10 + 79) = 0;
            *(unsigned char *)(v10 + 56) = 0;
            long long v12 = *(_OWORD *)(v10 + 96);
            *(_OWORD *)(v10 + 136) = *(_OWORD *)(v10 + 80);
            *(_OWORD *)(v10 + 152) = v12;
            char v13 = (*a3)(&v16, v10);
            v10 -= 56;
          }
          while ((v13 & 1) != 0);
          uint64_t v14 = (void **)(v10 + 112);
          if (*(char *)(v10 + 135) < 0) {
            operator delete(*v14);
          }
          *(_OWORD *)uint64_t v14 = v16;
          *(void *)(v10 + 128) = v17;
          long long v15 = v19;
          *(_OWORD *)(v10 + 136) = v18;
          *(_OWORD *)(v10 + 152) = v15;
        }
        char v5 = (long long *)((char *)v8 + 56);
        v7 += 56;
        uint64_t v4 = v8;
      }
      while ((long long *)((char *)v8 + 56) != a2);
    }
  }
}

void sub_19E00102C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t *a1, uint64_t *a2, uint64_t a3, unsigned int (**a4)(uint64_t *, uint64_t *, __n128))
{
  uint64_t v14 = a2;
  long long v15 = a1;
  char v13 = (uint64_t *)a3;
  char v7 = ((uint64_t (*)(uint64_t *, uint64_t *))*a4)(a2, a1);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t *))*a4)(a3, a2);
  if ((v7 & 1) == 0)
  {
    if (!result) {
      return result;
    }
    __n128 v9 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v14, (uint64_t *)&v13);
    if (!(*a4)(v14, v15, v9)) {
      return 1;
    }
    uint64_t v10 = &v15;
    uint64_t v11 = (uint64_t *)&v14;
    goto LABEL_9;
  }
  if (!result)
  {
    __n128 v12 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v15, (uint64_t *)&v14);
    if (!(*a4)(v13, v14, v12)) {
      return 1;
    }
    uint64_t v10 = &v14;
    uint64_t v11 = (uint64_t *)&v13;
LABEL_9:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(v10, v11);
    return 2;
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v15, (uint64_t *)&v13);
  return 1;
}

uint64_t *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,SharingHysteresis::DeviceScore *,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&)>(uint64_t a1, unint64_t a2, unsigned int (**a3)(void **, __n128))
{
  long long v22 = (uint64_t *)a1;
  unint64_t v21 = a2;
  *(_OWORD *)std::string __p = *(_OWORD *)a1;
  uint64_t v18 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  long long v19 = *(_OWORD *)(a1 + 24);
  long long v20 = *(_OWORD *)(a1 + 40);
  if (((uint64_t (*)(void **, unint64_t))*a3)(__p, a2 - 56))
  {
    char v5 = (uint64_t *)a1;
    do
    {
      v5 += 7;
      long long v22 = v5;
    }
    while ((((uint64_t (*)(void **, uint64_t *))*a3)(__p, v5) & 1) == 0);
  }
  else
  {
    uint64_t v6 = (uint64_t *)(a1 + 56);
    do
    {
      char v5 = v6;
      long long v22 = v6;
      if ((unint64_t)v6 >= v21) {
        break;
      }
      int v7 = ((uint64_t (*)(void **, uint64_t *))*a3)(__p, v6);
      uint64_t v6 = v5 + 7;
    }
    while (!v7);
  }
  unint64_t v8 = v21;
  if ((unint64_t)v5 < v21)
  {
    do
    {
      v8 -= 56;
      unint64_t v21 = v8;
    }
    while ((((uint64_t (*)(void **, unint64_t))*a3)(__p, v8) & 1) != 0);
    char v5 = v22;
  }
  if ((unint64_t)v5 < v8)
  {
    do
    {
      __n128 v9 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v22, (uint64_t *)&v21);
      do
        v22 += 7;
      while (!(*a3)(__p, v9));
      do
        v21 -= 56;
      while ((((uint64_t (*)(void **))*a3)(__p) & 1) != 0);
      char v5 = v22;
    }
    while ((unint64_t)v22 < v21);
  }
  uint64_t v10 = (void **)(v5 - 7);
  if (v5 - 7 != (uint64_t *)a1)
  {
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v11 = *(_OWORD *)v10;
    *(void *)(a1 + 16) = *(v5 - 5);
    *(_OWORD *)a1 = v11;
    *((unsigned char *)v5 - 33) = 0;
    *((unsigned char *)v5 - 56) = 0;
    long long v12 = *((_OWORD *)v5 - 1);
    *(_OWORD *)(a1 + 24) = *((_OWORD *)v5 - 2);
    *(_OWORD *)(a1 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = v12;
  }
  if (*((char *)v5 - 33) < 0) {
    operator delete(*v10);
  }
  long long v13 = *(_OWORD *)__p;
  *(v5 - 5) = v18;
  *(_OWORD *)uint64_t v10 = v13;
  HIBYTE(v18) = 0;
  LOBYTE(__p[0]) = 0;
  long long v14 = v20;
  *((_OWORD *)v5 - 2) = v19;
  *((_OWORD *)v5 - 1) = v14;
  long long v15 = v22;
  if (SHIBYTE(v18) < 0) {
    operator delete(__p[0]);
  }
  return v15;
}

void sub_19E001310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,SharingHysteresis::DeviceScore *,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&)>(uint64_t a1, unint64_t a2, uint64_t (**a3)(void))
{
  uint64_t v5 = 0;
  unint64_t v24 = a2;
  *(_OWORD *)std::string __p = *(_OWORD *)a1;
  uint64_t v21 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  uint64_t v6 = (_OWORD *)(a1 + 24);
  long long v22 = *(_OWORD *)(a1 + 24);
  long long v23 = *(_OWORD *)(a1 + 40);
  do
  {
    uint64_t v25 = (uint64_t *)(a1 + v5 + 56);
    v5 += 56;
  }
  while (((*a3)() & 1) != 0);
  unint64_t v7 = v24;
  if (v5 == 56)
  {
    uint64_t v10 = (uint64_t *)(a1 + 56);
    do
    {
      if ((unint64_t)v10 >= v7) {
        break;
      }
      long long v11 = *a3;
      v7 -= 56;
      unint64_t v24 = v7;
    }
    while ((((uint64_t (*)(unint64_t, void **))v11)(v7, __p) & 1) == 0);
  }
  else
  {
    unint64_t v8 = v24 - 56;
    do
    {
      unint64_t v24 = v8;
      int v9 = ((uint64_t (*)(unint64_t, void **))*a3)(v8, __p);
      v8 -= 56;
    }
    while (!v9);
    uint64_t v10 = v25;
  }
  long long v12 = v10;
  if ((unint64_t)v10 < v24)
  {
    do
    {
      __n128 v13 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v25, (uint64_t *)&v24);
      do
        v25 += 7;
      while ((((uint64_t (*)(__n128))*a3)(v13) & 1) != 0);
      do
        v24 -= 56;
      while (!(*a3)());
      long long v12 = v25;
    }
    while ((unint64_t)v25 < v24);
  }
  long long v14 = (void **)(v12 - 7);
  if (v12 - 7 != (uint64_t *)a1)
  {
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v15 = *(_OWORD *)v14;
    *(void *)(a1 + 16) = *(v12 - 5);
    *(_OWORD *)a1 = v15;
    *((unsigned char *)v12 - 33) = 0;
    *((unsigned char *)v12 - 56) = 0;
    long long v16 = *((_OWORD *)v12 - 1);
    *uint64_t v6 = *((_OWORD *)v12 - 2);
    v6[1] = v16;
  }
  if (*((char *)v12 - 33) < 0) {
    operator delete(*v14);
  }
  long long v17 = *(_OWORD *)__p;
  *(v12 - 5) = v21;
  *(_OWORD *)long long v14 = v17;
  HIBYTE(v21) = 0;
  LOBYTE(__p[0]) = 0;
  long long v18 = v23;
  *((_OWORD *)v12 - 2) = v22;
  *((_OWORD *)v12 - 1) = v18;
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
  return v12 - 7;
}

void sub_19E001524(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t *a1, uint64_t a2, unsigned int (**a3)(uint64_t *, uint64_t *, __n128))
{
  long long v23 = a1;
  long long v22 = (uint64_t *)a2;
  uint64_t v6 = (a2 - (uint64_t)a1) >> 3;
  BOOL result = 1;
  switch(0x6DB6DB6DB6DB6DB7 * v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unint64_t v8 = *a3;
      long long v22 = (uint64_t *)(a2 - 56);
      if (((unsigned int (*)(void))v8)()) {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v23, (uint64_t *)&v22);
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a1 + 7, a2 - 56, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a1 + 7, a1 + 14, a2 - 56, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a1 + 7, a1 + 14, a1 + 21, a2 - 56, a3);
      return 1;
    default:
      int v9 = a1 + 14;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a1 + 7, (uint64_t)(a1 + 14), a3);
      uint64_t v10 = a1 + 21;
      if (v10 == (uint64_t *)a2) {
        return 1;
      }
      int v11 = 0;
      break;
  }
  while (1)
  {
    if (((unsigned int (*)(uint64_t *, uint64_t *))*a3)(v10, v9))
    {
      long long v18 = *(_OWORD *)v10;
      uint64_t v19 = v10[2];
      v10[1] = 0;
      v10[2] = 0;
      *uint64_t v10 = 0;
      long long v12 = *(_OWORD *)(v10 + 5);
      long long v20 = *(_OWORD *)(v10 + 3);
      long long v21 = v12;
      do
      {
        __n128 v13 = v9;
        long long v14 = v9 + 7;
        if (*((char *)v13 + 79) < 0) {
          operator delete((void *)*v14);
        }
        *(_OWORD *)long long v14 = *(_OWORD *)v13;
        v14[2] = v13[2];
        *((unsigned char *)v13 + 23) = 0;
        *(unsigned char *)__n128 v13 = 0;
        long long v15 = *(_OWORD *)(v13 + 5);
        *((_OWORD *)v13 + 5) = *(_OWORD *)(v13 + 3);
        *((_OWORD *)v13 + 6) = v15;
        if (v13 == v23) {
          break;
        }
        int v9 = v13 - 7;
      }
      while ((((uint64_t (*)(long long *, uint64_t *))*a3)(&v18, v13 - 7) & 1) != 0);
      if (*((char *)v13 + 23) < 0) {
        operator delete((void *)*v13);
      }
      long long v16 = v18;
      v13[2] = v19;
      *(_OWORD *)__n128 v13 = v16;
      long long v17 = v21;
      *(_OWORD *)(v13 + 3) = v20;
      *(_OWORD *)(v13 + 5) = v17;
      if (++v11 == 8) {
        break;
      }
    }
    int v9 = v10;
    v10 += 7;
    if (v10 == v22) {
      return 1;
    }
  }
  return v10 + 7 == v22;
}

void sub_19E00178C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, unsigned int (**a5)(uint64_t *, uint64_t *, __n128))
{
  long long v15 = a2;
  long long v16 = a1;
  uint64_t v13 = a4;
  long long v14 = a3;
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a2, (uint64_t)a3, a5);
  if (((unsigned int (*)(uint64_t, uint64_t *))*a5)(a4, a3))
  {
    __n128 v11 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v14, &v13);
    if ((*a5)(v14, a2, v11))
    {
      __n128 v12 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v15, (uint64_t *)&v14);
      if ((*a5)(v15, a1, v12)) {
        *(void *)&double result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v16, (uint64_t *)&v15).n128_u64[0];
      }
    }
  }
  return result;
}

double std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5, unsigned int (**a6)(uint64_t *, uint64_t *, __n128))
{
  long long v20 = a2;
  long long v21 = a1;
  long long v18 = a4;
  uint64_t v19 = a3;
  uint64_t v17 = a5;
  double v12 = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a2, a3, (uint64_t)a4, a6);
  if (((unsigned int (*)(uint64_t, uint64_t *, double))*a6)(a5, a4, v12))
  {
    __n128 v14 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v18, &v17);
    if ((*a6)(v18, a3, v14))
    {
      __n128 v15 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v19, (uint64_t *)&v18);
      if ((*a6)(v19, a2, v15))
      {
        __n128 v16 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v20, (uint64_t *)&v19);
        if ((*a6)(v20, a1, v16)) {
          *(void *)&double result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v21, (uint64_t *)&v20).n128_u64[0];
        }
      }
    }
  }
  return result;
}

uint64_t *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(long long *a1, uint64_t *a2, uint64_t *a3, unsigned int (**a4)(int64_t, uint64_t), __n128 a5)
{
  uint64_t v19 = a1;
  if (a1 != (long long *)a2)
  {
    unint64_t v7 = a2;
    unint64_t v8 = a1;
    uint64_t v9 = (char *)a2 - (char *)a1;
    uint64_t v10 = ((char *)a2 - (char *)a1) / 56;
    if ((char *)a2 - (char *)a1 >= 57)
    {
      unint64_t v11 = (unint64_t)(v10 - 2) >> 1;
      unint64_t v12 = v11 + 1;
      uint64_t v13 = (long long *)((char *)a1 + 56 * v11);
      do
      {
        a5 = std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((uint64_t)v8, a4, v10, v13);
        uint64_t v13 = (long long *)((char *)v13 - 56);
        --v12;
      }
      while (v12);
    }
    long long v18 = v7;
    if (v7 == a3)
    {
      a3 = v7;
    }
    else
    {
      __n128 v14 = v7;
      do
      {
        if (((unsigned int (*)(uint64_t *, long long *, __n128))*a4)(v14, v19, a5))
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v18, (uint64_t *)&v19);
          a5 = std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((uint64_t)v19, a4, v10, v19);
        }
        __n128 v14 = v18 + 7;
        long long v18 = v14;
      }
      while (v14 != a3);
      unint64_t v8 = v19;
      uint64_t v9 = (char *)v7 - (char *)v19;
    }
    if (v9 >= 57)
    {
      unint64_t v15 = v9 / 0x38uLL;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((uint64_t)v8, (uint64_t)v7, a4, v15);
        v7 -= 7;
      }
      while (v15-- > 2);
      return v18;
    }
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t a1, unsigned int (**a2)(int64_t, uint64_t), uint64_t a3, long long *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v5 = a4;
    int64_t v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= 0x6DB6DB6DB6DB6DB7 * (((uint64_t)a4 - a1) >> 3))
    {
      int64_t v10 = (0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - a1) >> 3)) | 1;
      unint64_t v11 = (long long *)(a1 + 56 * v10);
      int64_t v12 = 0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - a1) >> 3) + 2;
      if (v12 < a3 && (*a2)(a1 + 56 * v10, (uint64_t)v11 + 56))
      {
        unint64_t v11 = (long long *)((char *)v11 + 56);
        int64_t v10 = v12;
      }
      if ((((uint64_t (*)(long long *, long long *))*a2)(v11, v5) & 1) == 0)
      {
        long long v20 = *v5;
        uint64_t v21 = *((void *)v5 + 2);
        *((void *)v5 + 1) = 0;
        *((void *)v5 + 2) = 0;
        *(void *)uint64_t v5 = 0;
        __n128 v22 = *(__n128 *)((char *)v5 + 24);
        long long v23 = *(long long *)((char *)v5 + 40);
        do
        {
          __n128 v14 = v11;
          if (*((char *)v5 + 23) < 0) {
            operator delete(*(void **)v5);
          }
          long long v15 = *v11;
          *((void *)v5 + 2) = *((void *)v11 + 2);
          *uint64_t v5 = v15;
          *((unsigned char *)v11 + 23) = 0;
          *(unsigned char *)unint64_t v11 = 0;
          long long v16 = *(long long *)((char *)v11 + 24);
          *(long long *)((char *)v5 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(long long *)((char *)v11 + 40);
          *(long long *)((char *)v5 + 24) = v16;
          if (v7 < v10) {
            break;
          }
          uint64_t v17 = (2 * v10) | 1;
          unint64_t v11 = (long long *)(a1 + 56 * v17);
          int64_t v10 = 2 * v10 + 2;
          if (v10 >= a3)
          {
            int64_t v10 = v17;
          }
          else if ((*a2)(a1 + 56 * v17, (uint64_t)v11 + 56))
          {
            unint64_t v11 = (long long *)((char *)v11 + 56);
          }
          else
          {
            int64_t v10 = v17;
          }
          uint64_t v5 = v14;
        }
        while (!(*a2)((int64_t)v11, (uint64_t)&v20));
        if (*((char *)v14 + 23) < 0) {
          operator delete(*(void **)v14);
        }
        long long v18 = v20;
        *((void *)v14 + 2) = v21;
        *__n128 v14 = v18;
        __n128 result = v22;
        long long v19 = v23;
        *(long long *)((char *)v14 + 24) = (__int128)v22;
        *(long long *)((char *)v14 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = v19;
      }
    }
  }
  return result;
}

void sub_19E001CA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t a1, uint64_t a2, unsigned int (**a3)(uint64_t, uint64_t), uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v7 = *(void *)a1;
    *(void *)long long v18 = *(void *)(a1 + 8);
    *(void *)&v18[7] = *(void *)(a1 + 15);
    char v8 = *(unsigned char *)(a1 + 23);
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    long long v16 = *(_OWORD *)(a1 + 24);
    long long v17 = *(_OWORD *)(a1 + 40);
    uint64_t v9 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a3, a4);
    uint64_t v10 = v9;
    unint64_t v11 = (void **)(a2 - 56);
    int v12 = *(char *)(v9 + 23);
    if (v9 == a2 - 56)
    {
      if (v12 < 0) {
        operator delete(*(void **)v9);
      }
      *(void *)uint64_t v10 = v7;
      *(void *)(v10 + 8) = *(void *)v18;
      *(void *)(v10 + 15) = *(void *)&v18[7];
      *(unsigned char *)(v10 + 23) = v8;
      *(_OWORD *)(v10 + 24) = v16;
      *(_OWORD *)(v10 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = v17;
    }
    else
    {
      if (v12 < 0) {
        operator delete(*(void **)v9);
      }
      long long v13 = *(_OWORD *)v11;
      *(void *)(v10 + 16) = *(void *)(a2 - 40);
      *(_OWORD *)uint64_t v10 = v13;
      *(unsigned char *)(a2 - 33) = 0;
      *(unsigned char *)(a2 - 56) = 0;
      long long v14 = *(_OWORD *)(a2 - 32);
      *(_OWORD *)(v10 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(_OWORD *)(a2 - 16);
      *(_OWORD *)(v10 + 24) = v14;
      uint64_t v15 = v10 + 56;
      if (*(char *)(a2 - 33) < 0) {
        operator delete(*v11);
      }
      *(void *)(a2 - 56) = v7;
      *(void *)(a2 - 48) = *(void *)v18;
      *(void *)(a2 - 41) = *(void *)&v18[7];
      *(unsigned char *)(a2 - 33) = v8;
      *(_OWORD *)(a2 - 32) = v16;
      *(_OWORD *)(a2 - 16) = v17;
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, v15, (uint64_t (**)(long long *, long long *))a3, 0x6DB6DB6DB6DB6DB7 * ((v15 - a1) >> 3));
    }
  }
}

void sub_19E001E40(_Unwind_Exception *exception_object)
{
  if (v2 < 0) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t a1, unsigned int (**a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = a1 + 56 * v6 + 56;
    uint64_t v10 = 2 * v6;
    uint64_t v6 = (2 * v6) | 1;
    uint64_t v11 = v10 + 2;
    if (v10 + 2 < a3 && (*a2)(v9, v9 + 56))
    {
      v9 += 56;
      uint64_t v6 = v11;
    }
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v12 = *(_OWORD *)v9;
    *(void *)(a1 + 16) = *(void *)(v9 + 16);
    *(_OWORD *)a1 = v12;
    *(unsigned char *)(v9 + 23) = 0;
    *(unsigned char *)uint64_t v9 = 0;
    long long v13 = *(_OWORD *)(v9 + 24);
    *(_OWORD *)(a1 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(_OWORD *)(v9 + 40);
    *(_OWORD *)(a1 + 24) = v13;
    a1 = v9;
  }
  while (v6 <= v8);
  return v9;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(long long *, long long *), uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v8 = v4 >> 1;
    uint64_t v9 = (long long *)(a1 + 56 * (v4 >> 1));
    uint64_t v10 = (long long *)(a2 - 56);
    if ((*a3)(v9, (long long *)(a2 - 56)))
    {
      long long v17 = *v10;
      uint64_t v18 = *((void *)v10 + 2);
      *((void *)v10 + 1) = 0;
      *((void *)v10 + 2) = 0;
      *(void *)uint64_t v10 = 0;
      long long v12 = *(_OWORD *)(a2 - 16);
      long long v19 = *(_OWORD *)(a2 - 32);
      long long v20 = v12;
      do
      {
        long long v13 = v9;
        if (*((char *)v10 + 23) < 0) {
          operator delete(*(void **)v10);
        }
        long long v14 = *v9;
        *((void *)v10 + 2) = *((void *)v9 + 2);
        *uint64_t v10 = v14;
        *((unsigned char *)v9 + 23) = 0;
        *(unsigned char *)uint64_t v9 = 0;
        long long v15 = *(long long *)((char *)v9 + 24);
        *(long long *)((char *)v10 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(long long *)((char *)v9 + 40);
        *(long long *)((char *)v10 + 24) = v15;
        if (!v8) {
          break;
        }
        unint64_t v8 = (v8 - 1) >> 1;
        uint64_t v9 = (long long *)(a1 + 56 * v8);
        uint64_t v10 = v13;
      }
      while (((*a3)(v9, &v17) & 1) != 0);
      if (*((char *)v13 + 23) < 0) {
        operator delete(*(void **)v13);
      }
      long long *v13 = v17;
      *((void *)v13 + 2) = v18;
      double result = *(double *)&v19;
      long long v16 = v20;
      *(long long *)((char *)v13 + 24) = v19;
      *(long long *)((char *)v13 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = v16;
    }
  }
  return result;
}

void sub_19E002078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<SharingHysteresis::DeviceScore>::__assign_with_size[abi:ne180100]<SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(uint64_t a1, std::string *__str, long long *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  uint64_t v9 = *(std::string **)a1;
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) < a4)
  {
    std::vector<SharingHysteresis::DeviceScore>::__vdeallocate((uint64_t *)a1);
    if (a4 > 0x492492492492492) {
      std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3)) >= 0x249249249249249) {
      unint64_t v11 = 0x492492492492492;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<SharingHysteresis::DeviceScore>::__vallocate[abi:ne180100]((void *)a1, v11);
    long long v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(v8, (long long *)__str, a3, *(std::string **)(a1 + 8));
    goto LABEL_11;
  }
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3) < a4)
  {
    long long v13 = (std::string *)((char *)__str + 8 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3));
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,0>(__str, v13, v9);
    long long v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(v8, (long long *)v13, a3, *(std::string **)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v12;
    return;
  }
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,0>(__str, (std::string *)a3, v9);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      if (*(char *)(v16 - 33) < 0) {
        operator delete(*(void **)(v16 - 56));
      }
      v16 -= 56;
    }
    while (v16 != v15);
  }
  *(void *)(a1 + 8) = v15;
}

void sub_19E00221C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_19E002224(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<SharingHysteresis::DeviceScore>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<SharingHysteresis::DeviceScore>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *std::vector<SharingHysteresis::DeviceScore>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  long long v13 = this;
  uint64_t v14 = this;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  char v12 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v8 = v14;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
        uint64_t v8 = v4;
      }
      long long v9 = *(long long *)((char *)v6 + 24);
      *(_OWORD *)&v4[1].__r_.__value_.__r.__words[2] = *(long long *)((char *)v6 + 40);
      *(_OWORD *)&v4[1].__r_.__value_.__l.__data_ = v9;
      uint64_t v6 = (long long *)((char *)v6 + 56);
      uint64_t v4 = (std::string *)((char *)v8 + 56);
      uint64_t v14 = (std::string *)((char *)v8 + 56);
    }
    while (v6 != a3);
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v4;
}

void sub_19E002380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 33) < 0) {
      operator delete(*(void **)(v1 - 56));
    }
    v1 -= 56;
  }
}

std::string *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,0>(std::string *__str, std::string *a2, std::string *this)
{
  uint64_t v4 = __str;
  if (__str == a2) {
    return __str;
  }
  uint64_t v5 = a2;
  do
  {
    std::string::operator=(this, v4);
    long long v6 = *(_OWORD *)&v4[1].__r_.__value_.__r.__words[2];
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = *(_OWORD *)&v4[1].__r_.__value_.__l.__data_;
    *(_OWORD *)&this[1].__r_.__value_.__r.__words[2] = v6;
    this = (std::string *)((char *)this + 56);
    uint64_t v4 = (std::string *)((char *)v4 + 56);
  }
  while (v4 != v5);
  return v5;
}

id PRGetDeviceModelName()
{
  if (PRGetDeviceModelName::onceToken != -1) {
    dispatch_once(&PRGetDeviceModelName::onceToken, &__block_literal_global_0);
  }
  v0 = (void *)PRGetDeviceModelName::result;
  return v0;
}

void __PRGetDeviceModelName_block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    uint64_t v1 = (uint64_t)v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 != CFStringGetTypeID()) {
      __PRGetDeviceModelName_block_invoke_cold_1();
    }
    uint64_t v3 = (void *)PRGetDeviceModelName::result;
    PRGetDeviceModelName::double result = v1;
  }
}

id PRGetDeviceName()
{
  v0 = (void *)MGCopyAnswerWithError();
  return v0;
}

id PRGetDeviceSerialNumber()
{
  v0 = (void *)MGCopyAnswerWithError();
  return v0;
}

id PRGetBuildVersion()
{
  if (PRGetBuildVersion::onceToken != -1) {
    dispatch_once(&PRGetBuildVersion::onceToken, &__block_literal_global_14);
  }
  v0 = (void *)PRGetBuildVersion::result;
  return v0;
}

void __PRGetBuildVersion_block_invoke()
{
  uint64_t v0 = MGCopyAnswerWithError();
  uint64_t v1 = (void *)PRGetBuildVersion::result;
  PRGetBuildVersion::double result = v0;
}

id PRGetDeviceWifiChipset()
{
  if (PRGetDeviceWifiChipset::onceToken != -1) {
    dispatch_once(&PRGetDeviceWifiChipset::onceToken, &__block_literal_global_19);
  }
  uint64_t v0 = (void *)PRGetDeviceWifiChipset::result;
  return v0;
}

void __PRGetDeviceWifiChipset_block_invoke()
{
  uint64_t v0 = MGCopyAnswerWithError();
  uint64_t v1 = (void *)PRGetDeviceWifiChipset::result;
  PRGetDeviceWifiChipset::double result = v0;
}

id PRGetDeviceWifiSKU()
{
  if (PRGetDeviceWifiSKU::onceToken != -1) {
    dispatch_once(&PRGetDeviceWifiSKU::onceToken, &__block_literal_global_24);
  }
  uint64_t v0 = (void *)PRGetDeviceWifiSKU::result;
  return v0;
}

void __PRGetDeviceWifiSKU_block_invoke()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  uint64_t v1 = [v0 length];
  CFTypeID v2 = [MEMORY[0x1E4F28E78] stringWithCapacity:2 * v1];
  id v6 = v0;
  uint64_t v3 = [v6 bytes];
  for (unint64_t i = 0; i < [v6 length]; ++i)
    objc_msgSend(v2, "appendFormat:", @"%02lX", *(unsigned __int8 *)(v3 + i));
  if (!v2) {
    __assert_rtn("PRGetDeviceWifiSKU_block_invoke", "PRUtilities.m", 104, "mutableString");
  }
  uint64_t v5 = (void *)PRGetDeviceWifiSKU::result;
  PRGetDeviceWifiSKU::double result = (uint64_t)v2;
}

void sub_19E002858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t PRIsSupportedPlatform()
{
  if (PRIsSupportedPlatform::onceToken != -1) {
    dispatch_once(&PRIsSupportedPlatform::onceToken, &__block_literal_global_33);
  }
  return PRIsSupportedPlatform::supported;
}

void __PRIsSupportedPlatform_block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  PRIsSupportedPlatform::supported = [v0 BOOLValue];
}

void sub_19E002918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t PRIsInternalBuild()
{
  if (PRIsInternalBuild::once != -1) {
    dispatch_once(&PRIsInternalBuild::once, &__block_literal_global_38);
  }
  return PRIsInternalBuild::result;
}

void __PRIsInternalBuild_block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  PRIsInternalBuild::double result = [v0 BOOLValue];
}

void sub_19E0029C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t PRIsNonUIInstall()
{
  if (PRIsNonUIInstall::once != -1) {
    dispatch_once(&PRIsNonUIInstall::once, &__block_literal_global_43);
  }
  return PRIsNonUIInstall::isNonUIInstall;
}

void __PRIsNonUIInstall_block_invoke()
{
  id v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    uint64_t v1 = v0;
    PRIsNonUIInstall::isNonUIInstall = CFEqual(v0, @"NonUI") != 0;
    CFRelease(v1);
  }
  else
  {
    PRIsNonUIInstall::isNonUIInstall = 0;
  }
}

id PRBluetoothAddressToString(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = v1;
  if (v1 && [v1 length] == 6)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E78] string];
    id v4 = v2;
    uint64_t v5 = [v4 bytes];
    for (unint64_t i = 0; [v4 length] > i; ++i)
    {
      objc_msgSend(v3, "appendFormat:", @"%02lX", *(unsigned __int8 *)(v5 + i));
      if ([v4 length] - 1 > i) {
        [v3 appendString:@":"];
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_19E002B94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double combinedQuaternionFromAoA(float a1, float a2)
{
  __float2 v3 = __sincosf_stret(a1 * 0.5);
  float32x4_t v10 = vmulq_n_f32((float32x4_t)xmmword_19E02CCB0, v3.__sinval);
  __float2 v4 = __sincosf_stret(a2 * 0.5);
  float32x4_t v5 = vmulq_n_f32((float32x4_t)xmmword_19E02CCC0, v4.__sinval);
  v6.i32[0] = LODWORD(v4.__cosval);
  v6.f32[1] = -v5.f32[2];
  v6.i32[2] = v5.i32[1];
  *(float32x2_t *)v7.f32 = vneg_f32(*(float32x2_t *)v5.f32);
  v6.i32[3] = v7.i32[0];
  v8.i32[0] = vdupq_laneq_s32((int32x4_t)v5, 2).u32[0];
  v8.i32[1] = LODWORD(v4.__cosval);
  v8.i64[1] = v7.i64[0];
  v7.i32[0] = vdup_lane_s32(*(int32x2_t *)v7.f32, 1).u32[0];
  v7.i32[1] = v5.i32[0];
  v7.i32[2] = LODWORD(v4.__cosval);
  v7.f32[3] = -v5.f32[2];
  v5.i32[3] = LODWORD(v4.__cosval);
  *(void *)&double result = vmlaq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, v10.f32[0]), v8, *(float32x2_t *)v10.f32, 1), v7, v10, 2), v5, v3.__cosval).u64[0];
  return result;
}

__n64 unitVectorForAoAInNearbydCoordinates(float *a1)
{
  __float2 v2 = __sincosf_stret(*a1);
  float cosval = __sincosf_stret(a1[4]).__cosval;
  result.n64_u32[0] = LODWORD(v2.__sinval);
  result.n64_f32[1] = v2.__cosval * cosval;
  return result;
}

double unitVectorForAoAInSpatialCoordinates(float *a1)
{
  __float2 v2 = __sincosf_stret(*a1);
  return COERCE_DOUBLE(__PAIR64__(v2.__cosval * __sincosf_stret(a1[1]).__sinval, LODWORD(v2.__sinval)));
}

float convertAoAFromNearbydCoordinatesToSpatialCoordinates(float *a1)
{
  float v2 = *a1;
  float v3 = cosf(*a1);
  __float2 v4 = __sincosf_stret(a1[1]);
  atan2f(v3 * v4.__cosval, -(float)(v3 * v4.__sinval));
  return v2;
}

float calculateAoAFromUnitVectorInSpatialCoordinates(float a1, float a2, float a3)
{
  float v3 = a3;
  float v4 = a2;
  float v5 = sqrtf((float)((float)(a2 * a2) + (float)(a1 * a1)) + (float)(a3 * a3));
  if (v5 >= 0.000001)
  {
    a1 = a1 / v5;
    float v4 = v4 / v5;
    float v3 = a3 / v5;
  }
  float v6 = asinf(a1);
  atan2f(v4, -v3);
  return v6;
}

double PRCommonConvertTicksToSeconds(unint64_t a1)
{
  double v2 = *(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds;
  if (*(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds == 0.0)
  {
    if (mach_timebase_info(&info)) {
      PRCommonConvertTicksToSeconds();
    }
    if (info.denom)
    {
      uint32_t denom = info.denom;
      uint32_t numer = info.numer;
      do
      {
        uint32_t v5 = denom;
        uint32_t denom = numer % denom;
        uint32_t numer = v5;
      }
      while (denom);
    }
    else
    {
      uint32_t v5 = info.numer;
    }
    unsigned int v6 = 1000000000;
    uint32_t v7 = info.numer / v5;
    do
    {
      uint32_t v8 = v7;
      uint32_t v7 = v6;
      unsigned int v6 = v8 % v6;
    }
    while (v6);
    double v2 = (double)(info.numer / v5 / v7) / (double)(0x3B9ACA00 / v7 * (unint64_t)(info.denom / v5));
    *(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds = v2;
  }
  return v2 * (double)a1;
}

double PRCommonGetMachTimeSeconds(void)
{
  uint64_t v0 = mach_absolute_time();
  return PRCommonConvertTicksToSeconds(v0);
}

double PRCommonGetMachContinuousTimeSeconds(void)
{
  uint64_t v0 = mach_continuous_time();
  return PRCommonConvertTicksToSeconds(v0);
}

BOOL PRCommonGetAllTimes(double *a1, double *a2, double *a3)
{
  int times = mach_get_times();
  if (!times)
  {
    if (a1) {
      *a1 = (double)v9 / 1000000000.0 + (double)v8 - *MEMORY[0x1E4F1CF78];
    }
    if (a2) {
      *a2 = PRCommonConvertTicksToSeconds(0);
    }
    if (a3) {
      *a3 = PRCommonConvertTicksToSeconds(0);
    }
  }
  return times == 0;
}

id PRCommonConvertNSDataToHexNSString(NSData *a1, int a2)
{
  float v3 = a1;
  memset(&v16, 0, sizeof(v16));
  std::vector<unsigned char>::vector(&v14, [(NSData *)v3 length]);
  [(NSData *)v3 getBytes:v14 length:[(NSData *)v3 length]];
  float v4 = (unsigned __int8 *)v14;
  uint32_t v5 = v15;
  if (v14 == v15)
  {
    uint64_t v9 = &v16;
  }
  else
  {
    do
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%02X", *v4);
      id v6 = objc_claimAutoreleasedReturnValue();
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);

      if ((v13 & 0x80u) == 0) {
        uint32_t v7 = __p;
      }
      else {
        uint32_t v7 = (void **)__p[0];
      }
      if ((v13 & 0x80u) == 0) {
        std::string::size_type v8 = v13;
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      if (a2) {
        std::string::insert(&v16, 0, (const std::string::value_type *)v7, v8);
      }
      else {
        std::string::append(&v16, (const std::string::value_type *)v7, v8);
      }
      if ((char)v13 < 0) {
        operator delete(__p[0]);
      }
      ++v4;
    }
    while (v4 != v5);
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v9 = &v16;
    }
    else {
      uint64_t v9 = (std::string *)v16.__r_.__value_.__r.__words[0];
    }
  }
  float32x4_t v10 = [NSString stringWithUTF8String:v9];
  if (v14)
  {
    uint64_t v15 = (unsigned __int8 *)v14;
    operator delete(v14);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }

  return v10;
}

void sub_19E003148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id PRCommonConvertHexNSStringToNSData(NSString *a1)
{
  id v1 = a1;
  if ([(NSString *)v1 length])
  {
    double v2 = 0;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[(NSString *)v1 UTF8String]);
    double v2 = objc_opt_new();
    __int16 v11 = 0;
    BOOL v3 = (v14 & 0x80u) != 0;
    unint64_t v4 = v14;
    if ((v14 & 0x80u) != 0) {
      unint64_t v4 = v13;
    }
    if (v4 >= 2)
    {
      uint64_t v5 = 0;
      do
      {
        if (v3) {
          p_p = (char *)__p;
        }
        else {
          p_p = (char *)&__p;
        }
        *(_WORD *)__str = *(_WORD *)&p_p[v5];
        HIBYTE(v11) = strtol(__str, 0, 16);
        [v2 appendBytes:(char *)&v11 + 1 length:1];
        unint64_t v7 = v5 + 3;
        v5 += 2;
        BOOL v3 = (v14 & 0x80u) != 0;
        unint64_t v8 = v14;
        if ((v14 & 0x80u) != 0) {
          unint64_t v8 = v13;
        }
      }
      while (v8 > v7);
    }
    if ((char)v14 < 0) {
      operator delete(__p);
    }
  }

  return v2;
}

void sub_19E0032C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

char *PRCommonSerializePrintableState(void *a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x19F3B9910]();
  id v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:0];
  if ((unint64_t)[v6 length] > 0x8000)
  {
    unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"WARNING: statedump too big (%d > %d)", objc_msgSend(v6, "length"), 0x8000);
    unint64_t v8 = (void *)MEMORY[0x1E4F28F98];
    id v15 = v3;
    v16[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v10 = [v8 dataWithPropertyList:v9 format:200 options:0 error:0];

    id v6 = (void *)v10;
  }
  __int16 v11 = (char *)malloc_type_calloc(1uLL, [v6 length] + 200, 0x7E1CA1B2uLL);
  *(_DWORD *)__int16 v11 = 1;
  *((_DWORD *)v11 + 1) = [v6 length];
  id v12 = [NSString stringWithFormat:@"[nearbyd] %@", v3];
  strlcpy(v11 + 136, (const char *)[v12 UTF8String], 0x40uLL);

  id v13 = v6;
  memcpy(v11 + 200, (const void *)[v13 bytes], objc_msgSend(v13, "length"));

  return v11;
}

{
  id v3;
  id v4;
  void *v5;
  char *v6;
  id v8;
  void v9[2];

  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  unint64_t v8 = v3;
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = PRCommonSerializePrintableState(v3, v5);

  return v6;
}

void sub_19E0034EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E0035F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    id v4 = (char *)a1[1];
    uint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_19E003674(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  }
  __n64 result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void sub_19E003FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E0045E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_19E005110(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double degToRad(double a1)
{
  return a1 / 180.0 * 3.14159265;
}

double radToDeg(double a1)
{
  return a1 * 180.0 / 3.14159265;
}

double picosecsToMeters(double a1)
{
  return a1 / 1.0e12 * 299792458.0;
}

double metersToPicosecs(double a1)
{
  return a1 / 299792458.0 * 1.0e12;
}

double secsToMeters(double a1)
{
  return a1 * 299792458.0;
}

double metersToSecs(double a1)
{
  return a1 / 299792458.0;
}

double secsToPicosecs(double a1)
{
  return a1 * 1.0e12;
}

double picosecsToSecs(double a1)
{
  return a1 / 1.0e12;
}

double pptToPpb(double a1)
{
  return a1 / 1000.0;
}

double ppbToPpt(double a1)
{
  return a1 * 1000.0;
}

double ppbToPpu(double a1)
{
  return a1 / 1000000000.0;
}

double ppuToPpb(double a1)
{
  return a1 * 1000000000.0;
}

long double coordinate_transform_from_R1_to_nearbyD(double a1, double a2, double *a3, long double *a4)
{
  double v6 = a2 / 180.0 * 3.14159265;
  __double2 v7 = __sincos_stret(a1 / 180.0 * 3.14159265);
  __double2 v8 = __sincos_stret(v6);
  *a3 = asin(v7.__cosval * v8.__sinval) * 180.0 / 3.14159265;
  long double result = atan2(-(v7.__sinval * v8.__sinval), v8.__cosval) * 180.0 / 3.14159265;
  *a4 = result;
  return result;
}

void coordinate_transform_from_nearbyD_to_R1(double a1, double a2, double *a3, double *a4)
{
  __double2 v7 = __sincos_stret(a1 / 180.0 * 3.14159265);
  __double2 v8 = __sincos_stret(a2 / 180.0 * 3.14159265);
  *a4 = acos(v7.__cosval * v8.__cosval) * 180.0 / 3.14159265;
  double v9 = atan2(-(v7.__cosval * v8.__sinval), v7.__sinval) * 180.0 / 3.14159265;
  if (v9 < 0.0) {
    double v9 = v9 + 360.0;
  }
  *a3 = v9;
}

void sub_19E006358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E00640C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E00649C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t TopScoreTieHysteresis::TopScoreTieHysteresis(uint64_t a1, int a2, char a3)
{
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 12) = 0;
  *(void *)(a1 + 16) = 0x7FF4000000000000;
  *(int64x2_t *)(a1 + 24) = vdupq_n_s64(0x7FF4000000000000uLL);
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = a1 + 48;
  *(void *)(a1 + 8TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = a1 + 72;
  *(void *)a1 = os_log_create("com.apple.proximity.sharingchoice", "TopScoreTieHysteresis");
  *(_DWORD *)(a1 + 8) = a2;
  *(unsigned char *)(a1 + 12) = a3;
  *(_OWORD *)(a1 + 24) = xmmword_19E02CD20;
  return a1;
}

void TopScoreTieHysteresis::clearDeviceScores(TopScoreTieHysteresis *this)
{
  uint64_t v1 = (void *)((char *)this + 48);
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 40, *((void **)this + 6));
  *uint64_t v1 = 0;
  v1[1] = 0;
  *(v1 - 2) = 0x7FF4000000000000;
  *(v1 - 1) = v1;
  *((unsigned char *)v1 - 35) = 0;
}

void TopScoreTieHysteresis::addDeviceScore(uint64_t a1, std::string *a2, int a3, double a4)
{
  memset(&__str, 0, sizeof(__str));
  double v10 = NAN;
  __int16 v11 = 0;
  std::string::operator=(&__str, a2);
  double v10 = a4;
  __int16 v11 = a3;
  if (a3 && !*(_DWORD *)(a1 + 8)) {
    *(unsigned char *)(a1 + 13) = 1;
  }
  id v12 = a2;
  __double2 v8 = std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(a1 + 40), (const void **)&a2->__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (long long **)&v12);
  std::string::operator=((std::string *)(v8 + 7), &__str);
  *((double *)v8 + 1TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = v10;
  *((_WORD *)v8 + 44) = v11;
  if (*(double *)(a1 + 32) < v10) {
    *(double *)(a1 + 32) = v10;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

void sub_19E0066CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void TopScoreTieHysteresis::populateDeviceScores(uint64_t a1, void *a2)
{
  id v4 = (void *)(a1 + 48);
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(a1 + 40, *(void **)(a1 + 48));
  void *v4 = 0;
  v4[1] = 0;
  *(v4 - 2) = 0x7FF4000000000000;
  *(v4 - 1) = v4;
  *((unsigned char *)v4 - 35) = 0;
  __double2 v7 = (void *)*a2;
  uint64_t v5 = a2 + 1;
  double v6 = v7;
  if (v7 != v5)
  {
    while (1)
    {
      BOOL v8 = *(unsigned char *)(a1 + 12) && *((unsigned char *)v6 + 73) == 0;
      if (!v8) {
        break;
      }
LABEL_21:
      id v12 = (void *)v6[1];
      if (v12)
      {
        do
        {
          id v13 = v12;
          id v12 = (void *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          id v13 = (void *)v6[2];
          BOOL v8 = *v13 == (void)v6;
          double v6 = v13;
        }
        while (!v8);
      }
      double v6 = v13;
      if (v13 == v5) {
        return;
      }
    }
    if (*((char *)v6 + 55) < 0) {
      std::string::__init_copy_ctor_external(&v15, (const std::string::value_type *)v6[4], v6[5]);
    }
    else {
      std::string v15 = *(std::string *)(v6 + 4);
    }
    int v9 = *(_DWORD *)(a1 + 8);
    if (v9 == 1)
    {
      __int16 v11 = (double *)(v6 + 14);
    }
    else
    {
      double v10 = 0.0;
      if (v9)
      {
LABEL_14:
        if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&__p, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
        }
        else {
          std::string __p = v15;
        }
        TopScoreTieHysteresis::addDeviceScore(a1, &__p, *((unsigned __int8 *)v6 + 89), v10);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v15.__r_.__value_.__l.__data_);
        }
        goto LABEL_21;
      }
      __int16 v11 = (double *)(v6 + 7);
    }
    double v10 = *v11;
    goto LABEL_14;
  }
}

void sub_19E006848(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL TopScoreTieHysteresis::isInTopScoreLayerPreviously(uint64_t a1, const void **a2)
{
  uint64_t v3 = (uint64_t **)(a1 + 64);
  if (a1 + 72 == std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::find<std::string>(a1 + 64, a2))return 0; {
  uint64_t v5 = a2;
  }
  return *((unsigned char *)std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v3, a2, (uint64_t)&std::piecewise_construct, (long long **)&v5)+ 89) != 0;
}

BOOL TopScoreTieHysteresis::isInTopScoreLayer(TopScoreTieHysteresis *this, double a2, double a3)
{
  double v3 = *((double *)this + 4);
  if (v3 < a2) {
    TopScoreTieHysteresis::isInTopScoreLayer();
  }
  return v3 - a2 <= a3;
}

uint64_t TopScoreTieHysteresis::isInTopScoreLayerWithHysteresis(uint64_t a1, uint64_t a2, double a3)
{
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  BOOL v5 = TopScoreTieHysteresis::isInTopScoreLayerPreviously(a1, (const void **)&__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  char v6 = *(unsigned char *)(a1 + 13);
  if (v5)
  {
    if (*(unsigned char *)(a1 + 13))
    {
      double v7 = *(double *)(a1 + 32);
      if (v7 < a3) {
        TopScoreTieHysteresis::isInTopScoreLayer();
      }
      double v8 = v7 - a3;
      double v9 = 0.015;
    }
    else
    {
      int v12 = *(_DWORD *)(a1 + 8);
      if (v12 == 1)
      {
        double v16 = *(double *)(a1 + 32);
        if (v16 < a3) {
          TopScoreTieHysteresis::isInTopScoreLayer();
        }
        double v8 = v16 - a3;
        double v9 = 11.5;
      }
      else
      {
        if (v12) {
          return v6 & 1;
        }
        double v13 = *(double *)(a1 + 32);
        if (v13 < a3) {
          TopScoreTieHysteresis::isInTopScoreLayer();
        }
        double v8 = v13 - a3;
        double v9 = 0.03;
      }
    }
  }
  else if (*(unsigned char *)(a1 + 13))
  {
    double v10 = *(double *)(a1 + 32);
    if (v10 < a3) {
      TopScoreTieHysteresis::isInTopScoreLayer();
    }
    double v8 = v10 - a3;
    double v9 = 0.005;
  }
  else
  {
    int v14 = *(_DWORD *)(a1 + 8);
    if (v14 == 1)
    {
      double v17 = *(double *)(a1 + 32);
      if (v17 < a3) {
        TopScoreTieHysteresis::isInTopScoreLayer();
      }
      double v8 = v17 - a3;
      double v9 = 6.5;
    }
    else
    {
      if (v14) {
        return v6 & 1;
      }
      double v15 = *(double *)(a1 + 32);
      if (v15 < a3) {
        TopScoreTieHysteresis::isInTopScoreLayer();
      }
      double v8 = v15 - a3;
      double v9 = 0.01;
    }
  }
  char v6 = v8 <= v9;
  return v6 & 1;
}

void sub_19E006A9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void TopScoreTieHysteresis::mitigateTopScoreBackForthIssuesIfPossible(uint64_t a1, uint64_t **a2, double a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  TopScoreTieHysteresis::populateDeviceScores(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(__p, "before");
  TopScoreTieHysteresis::logDeviceScores(a1, (uint64_t)__p);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  *(double *)(a1 + 16) = a3;
  double v6 = *(double *)(a1 + 24);
  if (v6 - a3 <= 0.5)
  {
    double v8 = *(void **)(a1 + 40);
    if (v8 != (void *)(a1 + 48))
    {
      do
      {
        if (*(unsigned char *)(a1 + 13)) {
          BOOL v9 = *((unsigned char *)v8 + 88) == 0;
        }
        else {
          BOOL v9 = 0;
        }
        if (v9)
        {
          *((unsigned char *)v8 + 89) = 0;
        }
        else
        {
          if (*((char *)v8 + 55) < 0) {
            std::string::__init_copy_ctor_external(&v18, (const std::string::value_type *)v8[4], v8[5]);
          }
          else {
            std::string v18 = *(std::string *)(v8 + 4);
          }
          *((unsigned char *)v8 + 89) = TopScoreTieHysteresis::isInTopScoreLayerWithHysteresis(a1, (uint64_t)&v18, *((double *)v8 + 10));
          if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v18.__r_.__value_.__l.__data_);
          }
        }
        double v10 = (void *)v8[1];
        if (v10)
        {
          do
          {
            __int16 v11 = v10;
            double v10 = (void *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            __int16 v11 = (void *)v8[2];
            BOOL v9 = *v11 == (void)v8;
            double v8 = v11;
          }
          while (!v9);
        }
        double v8 = v11;
      }
      while (v11 != (void *)(a1 + 48));
    }
    TopScoreTieHysteresis::getTopScoreDevices((TopScoreTieHysteresis *)a1, (uint64_t *)buf);
    int v12 = *(long long **)buf;
    double v13 = *(long long **)&buf[8];
    while (v12 != v13)
    {
      if (*((char *)v12 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v17, *(const std::string::value_type **)v12, *((void *)v12 + 1));
      }
      else
      {
        long long v14 = *v12;
        v17.__r_.__value_.__r.__words[2] = *((void *)v12 + 2);
        *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v14;
      }
      TopScoreTieHysteresis::overwriteOutputScores(a1, a2, (uint64_t)&v17);
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v17.__r_.__value_.__l.__data_);
      }
      int v12 = (long long *)((char *)v12 + 24);
    }
    uint64_t v21 = (void **)buf;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v21);
    std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *> *,long>>((uint64_t **)(a1 + 64), *(long long **)(a1 + 40), (long long *)(a1 + 48));
    *(void *)(a1 + 24) = *(void *)(a1 + 16);
    std::string::basic_string[abi:ne180100]<0>(v15, "after");
    TopScoreTieHysteresis::logDeviceScores(a1, (uint64_t)v15);
    if (v16 < 0) {
      operator delete(v15[0]);
    }
  }
  else
  {
    double v7 = *(NSObject **)a1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      *(double *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a3;
      __int16 v23 = 2048;
      uint64_t v24 = 0x3FE0000000000000;
      _os_log_impl(&dword_19DFF5000, v7, OS_LOG_TYPE_INFO, "Timestamp out of order too much! P:%f;C:%f;T:%f",
        buf,
        0x20u);
    }
  }
}

void sub_19E006D48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void TopScoreTieHysteresis::logDeviceScores(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 8)) {
    id v4 = "soi_rssi";
  }
  else {
    id v4 = "score";
  }
  std::string::basic_string[abi:ne180100]<0>(v29, v4);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v26);
  int v5 = *(char *)(a2 + 23);
  if (v5 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *(void *)a2;
  }
  if (v5 >= 0) {
    uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v7 = *(void *)(a2 + 8);
  }
  double v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)";", 1);
  if ((v30 & 0x80u) == 0) {
    BOOL v9 = v29;
  }
  else {
    BOOL v9 = (void **)v29[0];
  }
  if ((v30 & 0x80u) == 0) {
    uint64_t v10 = v30;
  }
  else {
    uint64_t v10 = (uint64_t)v29[1];
  }
  __int16 v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)v9, v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)";", 1);
  int v12 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)";", 1);
  double v13 = *(void **)(a1 + 40);
  if (v13 != (void *)(a1 + 48))
  {
    do
    {
      int v14 = *((char *)v13 + 55);
      if (v14 >= 0) {
        uint64_t v15 = (uint64_t)(v13 + 4);
      }
      else {
        uint64_t v15 = v13[4];
      }
      if (v14 >= 0) {
        uint64_t v16 = *((unsigned __int8 *)v13 + 55);
      }
      else {
        uint64_t v16 = v13[5];
      }
      std::string v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, v15, v16);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)",", 1);
      std::string v18 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)";", 1);
      long long v19 = (void *)v13[1];
      if (v19)
      {
        do
        {
          char v20 = v19;
          long long v19 = (void *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          char v20 = (void *)v13[2];
          BOOL v21 = *v20 == (void)v13;
          double v13 = v20;
        }
        while (!v21);
      }
      double v13 = v20;
    }
    while (v20 != (void *)(a1 + 48));
  }
  std::stringbuf::str();
  __n128 v22 = *(NSObject **)a1;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    p_p = &__p;
    if (v25 < 0) {
      p_p = __p;
    }
    *(_DWORD *)buf = 136315138;
    int v32 = p_p;
    _os_log_impl(&dword_19DFF5000, v22, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  if (v25 < 0) {
    operator delete(__p);
  }
  v26[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v26 + *(void *)(v26[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v26[1] = MEMORY[0x1E4FBA470] + 16;
  if (v27 < 0) {
    operator delete((void *)v26[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x19F3B9590](&v28);
  if ((char)v30 < 0) {
    operator delete(v29[0]);
  }
}

void sub_19E0070E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  if (*(char *)(v5 - 81) < 0) {
    operator delete(*(void **)(v5 - 104));
  }
  _Unwind_Resume(a1);
}

void TopScoreTieHysteresis::getTopScoreDevices(TopScoreTieHysteresis *this@<X0>, uint64_t *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  double v2 = (char *)*((void *)this + 5);
  double v3 = (char *)this + 48;
  if (v2 != (char *)this + 48)
  {
    unint64_t v5 = 0;
    do
    {
      if (v2[89])
      {
        uint64_t v6 = (long long *)(v2 + 32);
        if (v5 >= a2[2])
        {
          unint64_t v5 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a2, v6);
        }
        else
        {
          std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)a2, v6);
          v5 += 24;
        }
        a2[1] = v5;
      }
      uint64_t v7 = (char *)*((void *)v2 + 1);
      if (v7)
      {
        do
        {
          double v8 = v7;
          uint64_t v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          double v8 = (char *)*((void *)v2 + 2);
          BOOL v9 = *(void *)v8 == (void)v2;
          double v2 = v8;
        }
        while (!v9);
      }
      double v2 = v8;
    }
    while (v8 != v3);
  }
}

void sub_19E0071DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t TopScoreTieHysteresis::overwriteOutputScores(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t result = std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::find<std::string>((uint64_t)a2, (const void **)a3);
  if (a2 + 1 != (uint64_t **)result)
  {
    int v7 = *(_DWORD *)(a1 + 8);
    if (v7 != 1)
    {
      if (!v7)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(void *)buf = a3;
        uint64_t result = (uint64_t)std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a2, (const void **)a3, (uint64_t)&std::piecewise_construct, (long long **)buf);
        *(void *)(result + 56) = v8;
      }
      return result;
    }
    *(void *)buf = a3;
    double v9 = *((double *)std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a2, (const void **)a3, (uint64_t)&std::piecewise_construct, (long long **)buf)+ 14);
    double v10 = *(double *)(a1 + 32);
    os_log_t v11 = *(os_log_t *)a1;
    BOOL v12 = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_INFO);
    if (v10 <= v9)
    {
      if (v12)
      {
        std::string v17 = (const void *)a3;
        if (*(char *)(a3 + 23) < 0) {
          std::string v17 = *(const void **)a3;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v17;
        __int16 v20 = 2048;
        double v21 = v10;
        int v14 = "deviceID %s has highest normalized soi rssi %f";
        uint64_t v15 = v11;
        uint32_t v16 = 22;
        goto LABEL_14;
      }
    }
    else if (v12)
    {
      double v13 = (const void *)a3;
      if (*(char *)(a3 + 23) < 0) {
        double v13 = *(const void **)a3;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v13;
      __int16 v20 = 2048;
      double v21 = v9;
      __int16 v22 = 2048;
      double v23 = v10 - v9;
      int v14 = "deviceID %s has normalized soi rssi %f, difference with top soi rssi is %f";
      uint64_t v15 = v11;
      uint32_t v16 = 32;
LABEL_14:
      _os_log_impl(&dword_19DFF5000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
    }
    uint64_t v18 = *(void *)(a1 + 32);
    *(void *)buf = a3;
    uint64_t result = (uint64_t)std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a2, (const void **)a3, (uint64_t)&std::piecewise_construct, (long long **)buf);
    *(void *)(result + 112) = v18;
  }
  return result;
}

uint64_t TopScoreTieHysteresis::getNumDevices(TopScoreTieHysteresis *this)
{
  return *((unsigned int *)this + 14);
}

double TopScoreTieHysteresis::getTopScore(TopScoreTieHysteresis *this)
{
  return *((double *)this + 4);
}

void *TopScoreTieHysteresis::getAttributeName@<X0>(TopScoreTieHysteresis *this@<X0>, void *a2@<X8>)
{
  if (*((_DWORD *)this + 2)) {
    double v2 = "soi_rssi";
  }
  else {
    double v2 = "score";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA498] + 64;
  *(void *)(a1 + 112) = MEMORY[0x1E4FBA498] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x1E4FBA418] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x1E4FBA418] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  unint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x1E4FBA498] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_19E007574(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x19F3B9590](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA418];
  uint64_t v3 = *MEMORY[0x1E4FBA418];
  *(void *)a1 = *MEMORY[0x1E4FBA418];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x19F3B9590](a1 + 112);
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__find_equal<std::string>((uint64_t)a1, &v11, a2);
  int v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = v6;
    std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<Region>::__insert_node_at(a1, v11, v8, v10[0]);
    int v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

double std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<D0>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x60uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  int v7 = (std::string *)(v6 + 32);
  uint64_t v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  double result = 0.0;
  *(_OWORD *)(v6 + 72) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  *((void *)v6 + 1TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0x7FF4000000000000;
  *((void *)v6 + 11) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_19E0077D8(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

uint64_t **std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *> *,long>>(uint64_t **result, long long *a2, long long *a3)
{
  uint64_t v5 = result;
  if (result[2])
  {
    uint64_t v6 = *result;
    int v7 = result[1];
    char *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    uint32_t v16 = result;
    std::string v17 = v8;
    uint64_t v18 = (const void **)v8;
    if (v8)
    {
      std::string v17 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        long long v9 = a2;
        do
        {
          std::string::operator=((std::string *)(v8 + 4), (const std::string *)(v9 + 2));
          std::string::operator=((std::string *)(v8 + 7), (const std::string *)((char *)v9 + 56));
          uint64_t v10 = *((void *)v9 + 10);
          *((_WORD *)v8 + 44) = *((_WORD *)v9 + 44);
          v8[10] = v10;
          leaf_high = (uint64_t **)std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__find_leaf_high((uint64_t)v5, &v19, v18 + 4);
          std::__tree<Region>::__insert_node_at(v5, v19, leaf_high, (uint64_t *)v18);
          uint64_t v18 = (const void **)v17;
          if (v17) {
            std::string v17 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::__detach_next((uint64_t)v17);
          }
          BOOL v12 = (long long *)*((void *)v9 + 1);
          if (v12)
          {
            do
            {
              a2 = v12;
              BOOL v12 = *(long long **)v12;
            }
            while (v12);
          }
          else
          {
            do
            {
              a2 = (long long *)*((void *)v9 + 2);
              BOOL v13 = *(void *)a2 == (void)v9;
              long long v9 = a2;
            }
            while (!v13);
          }
          uint64_t v8 = (uint64_t *)v18;
          if (v18) {
            BOOL v13 = a2 == a3;
          }
          else {
            BOOL v13 = 1;
          }
          long long v9 = a2;
        }
        while (!v13);
      }
    }
    double result = (uint64_t **)std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v16);
  }
  if (a2 != a3)
  {
    do
    {
      double result = (uint64_t **)std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__emplace_multi<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore> const&>(v5, a2 + 2);
      int v14 = (long long *)*((void *)a2 + 1);
      if (v14)
      {
        do
        {
          uint64_t v15 = v14;
          int v14 = *(long long **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          uint64_t v15 = (long long *)*((void *)a2 + 2);
          BOOL v13 = *(void *)v15 == (void)a2;
          a2 = v15;
        }
        while (!v13);
      }
      a2 = v15;
    }
    while (v15 != a3);
  }
  return result;
}

void sub_19E0079D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__find_leaf_high(uint64_t a1, void *a2, const void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v5 = (void *)v4;
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v5;
        double result = v5;
        if (!*v5) {
          goto LABEL_9;
        }
      }
      uint64_t v4 = v5[1];
    }
    while (v4);
    double result = v5 + 1;
  }
  else
  {
    double result = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v5;
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(*(void *)a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(*(void *)a1, v2);
  }
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__emplace_multi<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore> const&>(uint64_t **a1, long long *a2)
{
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__construct_node<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore> const&>((uint64_t)a1, a2, (uint64_t)v7);
  leaf_high = (uint64_t **)std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__find_leaf_high((uint64_t)a1, &v6, (const void **)v7[0] + 4);
  std::__tree<Region>::__insert_node_at(a1, v6, leaf_high, v7[0]);
  uint64_t v4 = v7[0];
  v7[0] = 0;
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100]((uint64_t)v7, 0);
  return v4;
}

void sub_19E007B28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__construct_node<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore> const&>@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x60uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  double result = std::pair<std::string const,TopScoreTieHysteresis::DeviceScore>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_19E007B94(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,TopScoreTieHysteresis::DeviceScore>::pair[abi:ne180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  uint64_t v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  std::string::size_type v7 = *((void *)a2 + 6);
  LOWORD(this[2].__r_.__value_.__r.__words[1]) = *((_WORD *)a2 + 28);
  this[2].__r_.__value_.__r.__words[0] = v7;
  return this;
}

void sub_19E007C38(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  *(void *)(a1 + 8) = v3 + 24;
}

void sub_19E007CAC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x19F3B9470](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x19F3B9480](v13);
  return a1;
}

void sub_19E007DF0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x19F3B9480](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x19E007DD0);
}

void sub_19E007E44(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      BOOL v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_19E007FC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void sub_19E00818C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E0082CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E0083C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E0084BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E00874C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  if (*(char *)(v5 + 23) < 0) {
    operator delete(*(void **)v5);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA488] + 104;
  *(void *)(a1 + 128) = MEMORY[0x1E4FBA488] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x1E4FBA488] + 64;
  *(void *)(a1 + 16) = MEMORY[0x1E4FBA488] + 64;
  uint64_t v5 = (void *)MEMORY[0x1E4FBA408];
  uint64_t v6 = *(void *)(MEMORY[0x1E4FBA408] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x1E4FBA408] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  size_t v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x1E4FBA488] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 12TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 24;
  return a1;
}

void sub_19E008A30(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x19F3B9590](v1);
  _Unwind_Resume(a1);
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char *a2)
{
  uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24);
  int v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    uint64_t v5 = std::locale::use_facet(&v8, MEMORY[0x1E4FBA258]);
    int v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_19E008B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA408];
  uint64_t v3 = *MEMORY[0x1E4FBA408];
  *(void *)a1 = *MEMORY[0x1E4FBA408];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x19F3B9590](a1 + 128);
  return a1;
}

void sub_19E008D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E008EB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E0091F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x19F3B9AF0](*(void *)(a2 + 40));
  *(void *)(a1 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_19E0093D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E0095E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E0098B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  uint64_t v24 = v23;

  _Unwind_Resume(a1);
}

void sub_19E009964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E0099C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E009E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E00A138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E00A398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_19E00A760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E00AADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (v33 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_19E00ABF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E00AEDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E00AF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E00B010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19E00B07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E00B17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_19E00B214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E00B290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_19E00B3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E00B484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E00B534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E00E1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  _Unwind_Resume(a1);
}

void sub_19E00F7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_19E00FAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E00FAF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E00FEC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_19E0107C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E0109C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_19E010BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void BigHeadTieHysteresis::BigHeadTieHysteresis(BigHeadTieHysteresis *this)
{
  *(void *)this = os_log_create("com.apple.proximity.sharingchoice", "BigHeadTieHysteresis");
}

void sub_19E010FC4(_Unwind_Exception *a1)
{
  MagicHeadTieHysteresis::~MagicHeadTieHysteresis(v1);
  _Unwind_Resume(a1);
}

void BigHeadTieHysteresis::mitigateBigHeadBackForthIssuesIfPossible(os_log_t *a1, uint64_t **a2, double a3)
{
  std::string::basic_string[abi:ne180100]<0>(v28, "A");
  BigHeadTieHysteresis::logBigHeadCandidates((uint64_t)a1, (uint64_t)v28, a2, 1);
  if (v29 < 0) {
    operator delete(v28[0]);
  }
  BigHeadTieHysteresis::selectBigHeadCandidates(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(__p, "B");
  BigHeadTieHysteresis::logBigHeadCandidates((uint64_t)a1, (uint64_t)__p, a2, 0);
  if (v27 < 0) {
    operator delete(__p[0]);
  }
  TopScoreTieHysteresis::mitigateTopScoreBackForthIssuesIfPossible((uint64_t)(a1 + 1), a2, a3);
  std::string::basic_string[abi:ne180100]<0>(v24, "C");
  BigHeadTieHysteresis::logBigHeadCandidates((uint64_t)a1, (uint64_t)v24, a2, 0);
  if (v25 < 0) {
    operator delete(v24[0]);
  }
  int NumDevices = TopScoreTieHysteresis::getNumDevices((TopScoreTieHysteresis *)(a1 + 1));
  std::locale v8 = (uint64_t *)(a2 + 1);
  uint64_t v7 = *a2;
  if (*a2 == (uint64_t *)(a2 + 1))
  {
    int v9 = 0;
  }
  else
  {
    int v9 = 0;
    do
    {
      uint64_t v10 = (uint64_t *)v7[1];
      uint64_t v11 = v7;
      if (v10)
      {
        do
        {
          uint64_t v12 = v10;
          uint64_t v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          uint64_t v12 = (uint64_t *)v11[2];
          BOOL v13 = *v12 == (void)v11;
          uint64_t v11 = v12;
        }
        while (!v13);
      }
      v9 += *((unsigned __int8 *)v7 + 73);
      uint64_t v7 = v12;
    }
    while (v12 != v8);
  }
  if (NumDevices != v9) {
    BigHeadTieHysteresis::mitigateBigHeadBackForthIssuesIfPossible();
  }
  TopScoreTieHysteresis::mitigateTopScoreBackForthIssuesIfPossible((uint64_t)(a1 + 12), a2, a3);
  std::string::basic_string[abi:ne180100]<0>(v22, "D");
  BigHeadTieHysteresis::logBigHeadCandidates((uint64_t)a1, (uint64_t)v22, a2, 0);
  if (v23 < 0) {
    operator delete(v22[0]);
  }
  int v14 = TopScoreTieHysteresis::getNumDevices((TopScoreTieHysteresis *)(a1 + 12));
  uint64_t v15 = *a2;
  if (*a2 == v8)
  {
    int v16 = 0;
  }
  else
  {
    int v16 = 0;
    do
    {
      std::string v17 = (uint64_t *)v15[1];
      char v18 = v15;
      if (v17)
      {
        do
        {
          uint64_t v19 = v17;
          std::string v17 = (uint64_t *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          uint64_t v19 = (uint64_t *)v18[2];
          BOOL v13 = *v19 == (void)v18;
          char v18 = v19;
        }
        while (!v13);
      }
      v16 += *((unsigned __int8 *)v15 + 73);
      uint64_t v15 = v19;
    }
    while (v19 != v8);
  }
  if (v14 != v16) {
    BigHeadTieHysteresis::mitigateBigHeadBackForthIssuesIfPossible();
  }
  BigHeadTieHysteresis::selectTheWinningBigHeadIfPossible(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v20, "E");
  BigHeadTieHysteresis::logBigHeadCandidates((uint64_t)a1, (uint64_t)v20, a2, 0);
  if (v21 < 0) {
    operator delete(v20[0]);
  }
}

void sub_19E011244(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BigHeadTieHysteresis::logBigHeadCandidates(uint64_t result, uint64_t a2, void *a3, int a4)
{
  int v6 = (NSObject **)result;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  std::locale v8 = a3 + 1;
  uint64_t v7 = (void *)*a3;
  if ((void *)*a3 != a3 + 1)
  {
    int v9 = 0;
    do
    {
      uint64_t v10 = (void *)v7[1];
      uint64_t v11 = v7;
      if (v10)
      {
        do
        {
          uint64_t v12 = v10;
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          uint64_t v12 = (void *)v11[2];
          BOOL v13 = *v12 == (void)v11;
          uint64_t v11 = v12;
        }
        while (!v13);
      }
      v9 += *((unsigned __int8 *)v7 + 73);
      uint64_t v7 = v12;
    }
    while (v12 != v8);
    if (v9) {
      goto LABEL_11;
    }
  }
  if (a4)
  {
LABEL_11:
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v33);
    int v14 = *(char *)(a2 + 23);
    if (v14 >= 0) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = *(void *)a2;
    }
    if (v14 >= 0) {
      uint64_t v16 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v16 = *(void *)(a2 + 8);
    }
    std::string v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, v15, v16);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)";", 1);
    char v18 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)";", 1);
    uint64_t v19 = (void *)*a3;
    if ((void *)*a3 != v8)
    {
      do
      {
        if (*((unsigned char *)v19 + 73))
        {
          int v20 = *((char *)v19 + 55);
          if (v20 >= 0) {
            uint64_t v21 = (uint64_t)(v19 + 4);
          }
          else {
            uint64_t v21 = v19[4];
          }
          if (v20 >= 0) {
            uint64_t v22 = *((unsigned __int8 *)v19 + 55);
          }
          else {
            uint64_t v22 = v19[5];
          }
          char v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, v21, v22);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)",", 1);
          uint64_t v24 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)",", 1);
          char v25 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)",", 1);
          uint64_t v26 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)";", 1);
        }
        char v27 = (void *)v19[1];
        if (v27)
        {
          do
          {
            uint64_t v28 = v27;
            char v27 = (void *)*v27;
          }
          while (v27);
        }
        else
        {
          do
          {
            uint64_t v28 = (void *)v19[2];
            BOOL v13 = *v28 == (void)v19;
            uint64_t v19 = v28;
          }
          while (!v13);
        }
        uint64_t v19 = v28;
      }
      while (v28 != v8);
    }
    std::stringbuf::str();
    char v29 = *v6;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      p_p = &__p;
      if (v32 < 0) {
        p_p = __p;
      }
      *(_DWORD *)buf = 136315138;
      v37 = p_p;
      _os_log_impl(&dword_19DFF5000, v29, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
    if (v32 < 0) {
      operator delete(__p);
    }
    v33[0] = *MEMORY[0x1E4FBA418];
    *(void *)((char *)v33 + *(void *)(v33[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
    v33[1] = MEMORY[0x1E4FBA470] + 16;
    if (v34 < 0) {
      operator delete((void *)v33[9]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    return MEMORY[0x19F3B9590](&v35);
  }
  return result;
}

void sub_19E011604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void BigHeadTieHysteresis::selectBigHeadCandidates(os_log_t *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2 + 1;
  uint64_t v2 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    int v6 = 0;
    do
    {
      uint64_t v7 = (void *)v2[1];
      std::locale v8 = v2;
      if (v7)
      {
        do
        {
          int v9 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v9 = (void *)v8[2];
          BOOL v10 = *v9 == (void)v8;
          std::locale v8 = v9;
        }
        while (!v10);
      }
      v6 += *((unsigned __int8 *)v2 + 73);
      uint64_t v2 = v9;
    }
    while (v9 != v3);
    if (v6)
    {
      std::string::basic_string[abi:ne180100]<0>(&v31, "NA");
      uint64_t v11 = (void *)*a2;
      double v12 = NAN;
      if ((void *)*a2 != v3)
      {
        double v13 = 181.0;
        do
        {
          if (*((unsigned char *)v11 + 73))
          {
            double v14 = *((double *)v11 + 10);
            double v15 = fabs(v14);
            if (v13 > v15)
            {
              std::string::operator=(&v31, (const std::string *)(v11 + 4));
              double v12 = v14;
              double v13 = v15;
            }
          }
          uint64_t v16 = (void *)v11[1];
          if (v16)
          {
            do
            {
              std::string v17 = v16;
              uint64_t v16 = (void *)*v16;
            }
            while (v16);
          }
          else
          {
            do
            {
              std::string v17 = (void *)v11[2];
              BOOL v10 = *v17 == (void)v11;
              uint64_t v11 = v17;
            }
            while (!v10);
          }
          uint64_t v11 = v17;
        }
        while (v17 != v3);
      }
      char v18 = *a1;
      if (os_log_type_enabled(*a1, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = &v31;
        if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          uint64_t v19 = (std::string *)v31.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)buf = 136315394;
        double v33 = *(double *)&v19;
        __int16 v34 = 2048;
        double v35 = v12;
        _os_log_impl(&dword_19DFF5000, v18, OS_LOG_TYPE_INFO, "Big Head Selection: device %s, minAbsoluteAngleDegreesSigned: %f", buf, 0x16u);
      }
      int v20 = (void *)*a2;
      if ((void *)*a2 == v3) {
        goto LABEL_48;
      }
      do
      {
        if (*((unsigned char *)v20 + 73))
        {
          double v21 = *((double *)v20 + 10);
          if (vabdd_f64(v21, v12) > 5.0)
          {
            uint64_t v22 = *a1;
            if (os_log_type_enabled(*a1, OS_LOG_TYPE_INFO))
            {
              char v23 = v20 + 4;
              if (*((char *)v20 + 55) < 0) {
                char v23 = (void *)*v23;
              }
              *(_DWORD *)buf = 134218498;
              double v33 = v21;
              __int16 v34 = 2080;
              double v35 = *(double *)&v23;
              __int16 v36 = 2048;
              uint64_t v37 = 0x4014000000000000;
              _os_log_impl(&dword_19DFF5000, v22, OS_LOG_TYPE_INFO, "Big Head Selection: nil out angle %f for device %s as angle diff greater than %f degrees!", buf, 0x20u);
            }
            *((unsigned char *)v20 + 73) = 0;
            v20[10] = 0x7FF4000000000000;
            --v6;
          }
        }
        uint64_t v24 = (void *)v20[1];
        if (v24)
        {
          do
          {
            char v25 = v24;
            uint64_t v24 = (void *)*v24;
          }
          while (v24);
        }
        else
        {
          do
          {
            char v25 = (void *)v20[2];
            BOOL v10 = *v25 == (void)v20;
            int v20 = v25;
          }
          while (!v10);
        }
        int v20 = v25;
      }
      while (v25 != v3);
      uint64_t v26 = (void *)*a2;
      if ((void *)*a2 == v3)
      {
LABEL_48:
        int v27 = 0;
      }
      else
      {
        int v27 = 0;
        do
        {
          uint64_t v28 = (void *)v26[1];
          char v29 = v26;
          if (v28)
          {
            do
            {
              unsigned __int8 v30 = v28;
              uint64_t v28 = (void *)*v28;
            }
            while (v28);
          }
          else
          {
            do
            {
              unsigned __int8 v30 = (void *)v29[2];
              BOOL v10 = *v30 == (void)v29;
              char v29 = v30;
            }
            while (!v10);
          }
          v27 += *((unsigned __int8 *)v26 + 73);
          uint64_t v26 = v30;
        }
        while (v30 != v3);
      }
      if (v6 != v27) {
        __assert_rtn("selectBigHeadCandidates", "BigHeadTieHysteresis.cpp", 105, "numBigHeadCandidates == getNumberOfBigHeadCandidates(output)");
      }
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v31.__r_.__value_.__l.__data_);
      }
    }
  }
}

void sub_19E011990(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
}

uint64_t BigHeadTieHysteresis::getNumberOfBigHeadCandidates(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)*a2;
  uint64_t v2 = a2 + 1;
  uint64_t v3 = v4;
  if (v4 == v2) {
    return 0;
  }
  LODWORD(result) = 0;
  do
  {
    int v6 = (void *)v3[1];
    uint64_t v7 = v3;
    if (v6)
    {
      do
      {
        std::locale v8 = v6;
        int v6 = (void *)*v6;
      }
      while (v6);
    }
    else
    {
      do
      {
        std::locale v8 = (void *)v7[2];
        BOOL v9 = *v8 == (void)v7;
        uint64_t v7 = v8;
      }
      while (!v9);
    }
    uint64_t result = result + *((unsigned __int8 *)v3 + 73);
    uint64_t v3 = v8;
  }
  while (v8 != v2);
  return result;
}

void BigHeadTieHysteresis::selectTheWinningBigHeadIfPossible(os_log_t *a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (TopScoreTieHysteresis *)(a1 + 12);
  TopScoreTieHysteresis::getTopScoreDevices((TopScoreTieHysteresis *)(a1 + 12), (uint64_t *)&v35);
  if (v35 == v36) {
    goto LABEL_64;
  }
  double TopScore = TopScoreTieHysteresis::getTopScore(v4);
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v36 - (char *)v35) >> 3) >= 2)
  {
    int v6 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = TopScore;
      _os_log_impl(&dword_19DFF5000, v6, OS_LOG_TYPE_INFO, "Big Head Selection: Multiple devices with normalized SOI RSSI %f", buf, 0xCu);
    }
    goto LABEL_64;
  }
  if (*((char *)v35 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v34, *(const std::string::value_type **)v35, *((void *)v35 + 1));
  }
  else
  {
    long long v7 = *v35;
    v34.__r_.__value_.__r.__words[2] = *((void *)v35 + 2);
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v7;
  }
  std::locale v8 = *a1;
  if (os_log_type_enabled(*a1, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = &v34;
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      BOOL v9 = (std::string *)v34.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = v9;
    __int16 v38 = 2048;
    double v39 = TopScore;
    _os_log_impl(&dword_19DFF5000, v8, OS_LOG_TYPE_INFO, "Big Head Selection: selected big head %s with normalized SOI RSSI %f", buf, 0x16u);
  }
  BOOL v10 = a2 + 1;
  uint64_t v11 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    int v12 = 0;
    double v13 = (void *)*a2;
    do
    {
      double v14 = (void *)v13[1];
      double v15 = v13;
      if (v14)
      {
        do
        {
          uint64_t v16 = v14;
          double v14 = (void *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          uint64_t v16 = (void *)v15[2];
          BOOL v17 = *v16 == (void)v15;
          double v15 = v16;
        }
        while (!v17);
      }
      v12 += *((unsigned __int8 *)v13 + 73);
      double v13 = v16;
    }
    while (v16 != v10);
    if (v11 == v10) {
      goto LABEL_51;
    }
    while (1)
    {
      char v18 = (const void **)(v11 + 4);
      char v19 = *((unsigned char *)v11 + 55);
      if (v19 >= 0) {
        uint64_t v20 = *((unsigned __int8 *)v11 + 55);
      }
      else {
        uint64_t v20 = v11[5];
      }
      std::string::size_type size = HIBYTE(v34.__r_.__value_.__r.__words[2]);
      if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = v34.__r_.__value_.__l.__size_;
      }
      if (v20 != size) {
        goto LABEL_37;
      }
      if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v22 = &v34;
      }
      else {
        uint64_t v22 = (std::string *)v34.__r_.__value_.__r.__words[0];
      }
      if ((*((unsigned char *)v11 + 55) & 0x80) != 0)
      {
        if (memcmp(*v18, v22, v11[5])) {
          goto LABEL_37;
        }
      }
      else if (*((unsigned char *)v11 + 55))
      {
        char v23 = (unsigned __int8 *)(v11 + 4);
        uint64_t v24 = *((unsigned __int8 *)v11 + 55);
        while (*v23 == v22->__r_.__value_.__s.__data_[0])
        {
          ++v23;
          uint64_t v22 = (std::string *)((char *)v22 + 1);
          if (!--v24) {
            goto LABEL_43;
          }
        }
LABEL_37:
        if (*((unsigned char *)v11 + 73))
        {
          char v25 = *a1;
          if (os_log_type_enabled(*a1, OS_LOG_TYPE_INFO))
          {
            if (v19 < 0) {
              char v18 = (const void **)*v18;
            }
            uint64_t v26 = v11[14];
            uint64_t v27 = v11[10];
            *(_DWORD *)buf = 134218498;
            *(void *)&uint8_t buf[4] = v27;
            __int16 v38 = 2080;
            double v39 = *(double *)&v18;
            __int16 v40 = 2048;
            uint64_t v41 = v26;
            _os_log_impl(&dword_19DFF5000, v25, OS_LOG_TYPE_INFO, "Big Head Selection: nil out angle %f for device %s with normalized SOI RSSI %f", buf, 0x20u);
          }
          v11[10] = 0x7FF4000000000000;
          *((unsigned char *)v11 + 73) = 0;
          --v12;
        }
      }
LABEL_43:
      uint64_t v28 = (void *)v11[1];
      if (v28)
      {
        do
        {
          char v29 = v28;
          uint64_t v28 = (void *)*v28;
        }
        while (v28);
      }
      else
      {
        do
        {
          char v29 = (void *)v11[2];
          BOOL v17 = *v29 == (void)v11;
          uint64_t v11 = v29;
        }
        while (!v17);
      }
      uint64_t v11 = v29;
      if (v29 == v10)
      {
        uint64_t v11 = (void *)*a2;
        goto LABEL_51;
      }
    }
  }
  int v12 = 0;
LABEL_51:
  if (v11 == v10)
  {
    int v30 = 0;
  }
  else
  {
    int v30 = 0;
    do
    {
      std::string v31 = (void *)v11[1];
      char v32 = v11;
      if (v31)
      {
        do
        {
          double v33 = v31;
          std::string v31 = (void *)*v31;
        }
        while (v31);
      }
      else
      {
        do
        {
          double v33 = (void *)v32[2];
          BOOL v17 = *v33 == (void)v32;
          char v32 = v33;
        }
        while (!v17);
      }
      v30 += *((unsigned __int8 *)v11 + 73);
      uint64_t v11 = v33;
    }
    while (v33 != v10);
  }
  if (v12 != v30) {
    __assert_rtn("selectTheWinningBigHeadIfPossible", "BigHeadTieHysteresis.cpp", 139, "numBigHeadCandidates == getNumberOfBigHeadCandidates(output)");
  }
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v34.__r_.__value_.__l.__data_);
  }
LABEL_64:
  *(void *)buf = &v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
}

void sub_19E011E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, char *a20)
{
  a20 = &a17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a20);
  _Unwind_Resume(a1);
}

double BigHeadTieHysteresis::getBigHeadScore(BigHeadTieHysteresis *this)
{
  return TopScoreTieHysteresis::getTopScore((BigHeadTieHysteresis *)((char *)this + 8));
}

void sub_19E011F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01202C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E012124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01221C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E012310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01245C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E012500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E012574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01266C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E0127D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PRErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = v4;
  if (a1 > 199)
  {
    if (a1 > 998)
    {
      switch(a1)
      {
        case 999:
          long long v7 = @"Internal Error";
          goto LABEL_30;
        case 2000:
          long long v7 = @"Unsupported global parameters combination.";
          goto LABEL_30;
        case 2002:
          long long v7 = @"Time conversion failed.";
          goto LABEL_30;
      }
    }
    else
    {
      switch(a1)
      {
        case 200:
          long long v7 = @"Failed to start estimating proximity to peer.";
          goto LABEL_30;
        case 201:
          long long v7 = @"Failed to stop estimating proximity to peer.";
          goto LABEL_30;
        case 202:
          long long v7 = @"Failed to consume RSSI sample.";
LABEL_30:
          int v6 = (void *)MEMORY[0x1E4F28568];
          goto LABEL_31;
      }
    }
LABEL_15:
    long long v7 = @"Undefined Error";
    goto LABEL_30;
  }
  int v6 = (void *)MEMORY[0x1E4F28568];
  long long v7 = @"Failed to place service request.";
  switch(a1)
  {
    case 'd':
      [v4 setObject:@"Unsupported ranging configuration." forKeyedSubscript:*MEMORY[0x1E4F28568]];
      [v5 setObject:@"Missing parameters or invalid values provided." forKeyedSubscript:*MEMORY[0x1E4F28588]];
      long long v7 = @"Make sure that the values provided are supported in this version.";
      int v6 = (void *)MEMORY[0x1E4F285A0];
      break;
    case 'e':
      break;
    case 'f':
      long long v7 = @"Failed to initiate a ranging session.";
      break;
    case 'g':
      long long v7 = @"Failed to stop a ranging session.";
      break;
    case 'h':
      long long v7 = @"Failed to set Rose config.";
      break;
    case 'i':
    case 'k':
      goto LABEL_15;
    case 'j':
      long long v7 = @"Invalid peer information.";
      break;
    case 'l':
      long long v7 = @"Invalid ticket id.";
      break;
    case 'm':
      long long v7 = @"Rose Provider not ready.";
      break;
    case 'n':
      long long v7 = @"Timeout.";
      break;
    case 'o':
      long long v7 = @"Unexpected service state.";
      break;
    case 'p':
      long long v7 = @"Not user triggered request.";
      break;
    case 'q':
      long long v7 = @"Client has no registered request.";
      break;
    default:
      if (a1 != 10) {
        goto LABEL_15;
      }
      [v4 setObject:@"Unsupported operation." forKeyedSubscript:*MEMORY[0x1E4F28568]];
      long long v7 = @"This platform does not support the operation requested.";
      int v6 = (void *)MEMORY[0x1E4F28588];
      break;
  }
LABEL_31:
  [v5 setObject:v7 forKeyedSubscript:*v6];
  if (v3) {
    [v5 addEntriesFromDictionary:v3];
  }
  std::locale v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:a1 userInfo:v5];

  return v8;
}

void RangeAngleSharingImportanceEstimator::RangeAngleSharingImportanceEstimator(RangeAngleSharingImportanceEstimator *this, char a2)
{
  *(void *)this = &unk_1EF08DB78;
  *((unsigned char *)this + 8) = 0;
  *((void *)this + 2) = 0x7FF4000000000000;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  int64x2_t v4 = vdupq_n_s64(0x7FF4000000000000uLL);
  *(int64x2_t *)((char *)this + 72) = v4;
  *((_WORD *)this + 44) = 0;
  *((unsigned char *)this + 9TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
  *((int64x2_t *)this + 6) = v4;
  *((_WORD *)this + 56) = 0;
  *((void *)this + 15) = 0x7FF4000000000000;
  *((_WORD *)this + 64) = 0;
  *((void *)this + 17) = 0x7FF4000000000000;
  *((_DWORD *)this + 36) = 3;
  *(int64x2_t *)((char *)this + 152) = v4;
  *((unsigned char *)this + 168) = 0;
  *((int64x2_t *)this + 1TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v4;
  *((void *)this + 24) = os_log_create("com.apple.proximity.sharingchoice", "RangeAngleSharingImportanceEstimator");
  *((unsigned char *)this + 8) = a2;
  *((void *)this + 2) = 0;
  *((_WORD *)this + 44) = 257;
  *((unsigned char *)this + 9TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
  *((_OWORD *)this + 1TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = xmmword_19E02CE00;
}

double RangeAngleSharingImportanceEstimator::getTime(RangeAngleSharingImportanceEstimator *this)
{
  return *((double *)this + 2);
}

double RangeAngleSharingImportanceEstimator::getRangeTimeHistoryDelta(RangeAngleSharingImportanceEstimator *this)
{
  double result = 3.0;
  if (!*((unsigned char *)this + 89)) {
    return 1.0;
  }
  return result;
}

uint64_t RangeAngleSharingImportanceEstimator::removeOutOfDateMeasurements(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 64);
  if (v1)
  {
    uint64_t v2 = this;
    uint64_t v3 = this + 24;
    do
    {
      unint64_t v4 = *(void *)(v2 + 56);
      if (*(unsigned char *)(v2 + 89)) {
        double v5 = 3.0;
      }
      else {
        double v5 = 1.0;
      }
      if (*(double *)(v2 + 16) - *(double *)(*(void *)(*(void *)(v2 + 32) + 8 * (v4 / 0x49)) + 56 * (v4 % 0x49)) <= v5) {
        break;
      }
      *(void *)(v2 + 56) = v4 + 1;
      *(void *)(v2 + 64) = v1 - 1;
      this = std::deque<RangeAngleSharingImportanceEstimator::Measurement>::__maybe_remove_front_spare[abi:ne180100](v3, 1);
      uint64_t v1 = *(void *)(v2 + 64);
    }
    while (v1);
  }
  return this;
}

uint64_t RangeAngleSharingImportanceEstimator::updateRecentMeasurements(uint64_t a1, uint64_t a2)
{
  std::deque<RangeAngleSharingImportanceEstimator::Measurement>::push_back((void *)(a1 + 24), a2);
  return RangeAngleSharingImportanceEstimator::removeOutOfDateMeasurements(a1);
}

__n128 std::deque<RangeAngleSharingImportanceEstimator::Measurement>::push_back(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 73 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<RangeAngleSharingImportanceEstimator::Measurement>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  unint64_t v8 = *(void *)(v5 + 8 * (v7 / 0x49)) + 56 * (v7 % 0x49);
  __n128 result = *(__n128 *)a2;
  long long v10 = *(_OWORD *)(a2 + 16);
  long long v11 = *(_OWORD *)(a2 + 32);
  *(void *)(v8 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(v8 + 16) = v10;
  *(_OWORD *)(v8 + 32) = v11;
  *(__n128 *)unint64_t v8 = result;
  ++a1[5];
  return result;
}

uint64_t RangeAngleSharingImportanceEstimator::handleMeasurements(uint64_t this, const NeighborMeasurements *a2)
{
  int v2 = LOBYTE(a2->var0.var0.var1.var0[1]);
  int v3 = a2[1].var0.var0.var0.var0.var0.var0[8];
  if (LOBYTE(a2->var0.var0.var1.var0[1])) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (!v4)
  {
    uint64_t v5 = this;
    double v6 = *(double *)&a2->var0.var0.var1.var0[2];
    if (!LOBYTE(a2->var0.var0.var1.var0[1]) || v6 >= -0.4)
    {
      double v7 = *(double *)a2->var0.var0.var1.var0;
      double v8 = *(double *)(this + 16);
      if (v7 - v8 >= -0.5)
      {
        if (v7 - v8 >= 0.0)
        {
          *(double *)(this + 16) = v7;
          double v8 = *(double *)a2->var0.var0.var1.var0;
        }
        if (BYTE1(a2->var0.var0.var1.var0[1]))
        {
          double v9 = *(double *)&a2[1].var0.var0.var0.var0.var1.var0 * 180.0 / 3.14159265;
          if (v2)
          {
LABEL_12:
            LOBYTE(v3) = 0;
            *(unsigned char *)(this + 89) = 0;
            uint64_t v10 = 0x4058FFFFFFFFFFFFLL;
LABEL_20:
            double v12 = *(double *)a2[1].var0.var0.var1.var0;
            if (!a2[1].var0.var0.var0.var0.var0.var0[16]) {
              double v12 = NAN;
            }
            int var1_high = HIDWORD(a2[1].var0.var0.var0.var0.var1.var1);
            *(double *)double v14 = v8;
            *(double *)&v14[1] = v6;
            *(double *)&v14[2] = v9;
            int v15 = var1_high;
            double v16 = v12;
            uint64_t v17 = v10;
            char v18 = v3;
            std::deque<RangeAngleSharingImportanceEstimator::Measurement>::push_back((void *)(this + 24), (uint64_t)v14);
            return RangeAngleSharingImportanceEstimator::removeOutOfDateMeasurements(v5);
          }
        }
        else
        {
          double v9 = NAN;
          if (v2) {
            goto LABEL_12;
          }
        }
        uint64_t v10 = 0;
        if (v3)
        {
          uint64_t v11 = SHIDWORD(a2[1].var0.var0.var0.var0.var1.var1);
          if (v11 > 2)
          {
            double v6 = 15.0;
          }
          else
          {
            uint64_t v10 = qword_19E02CE48[v11];
            double v6 = dbl_19E02CE60[v11];
          }
          LOBYTE(v3) = 1;
        }
        else
        {
          double v6 = NAN;
        }
        goto LABEL_20;
      }
    }
  }
  return this;
}

double RangeAngleSharingImportanceEstimator::getAverageRangeMeters(RangeAngleSharingImportanceEstimator *this, double a2, double a3, int a4)
{
  uint64_t v4 = *((void *)this + 4);
  if (*((void *)this + 5) == v4) {
    return NAN;
  }
  unint64_t v5 = *((void *)this + 7);
  double v6 = (void *)(v4 + 8 * (v5 / 0x49));
  unint64_t v7 = *v6 + 56 * (v5 % 0x49);
  unint64_t v8 = *(void *)(v4 + 8 * ((*((void *)this + 8) + v5) / 0x49)) + 56 * ((*((void *)this + 8) + v5) % 0x49);
  if (v7 == v8) {
    return NAN;
  }
  double v9 = 0.0;
  double v10 = 0.0;
  do
  {
    double v11 = *(double *)(v7 + 40);
    if (!a4 || (*(unsigned char *)(v7 + 48) & 1) == 0)
    {
      double v12 = a2 - *(double *)v7;
      BOOL v13 = v12 < 0.0;
      if (v12 > a3) {
        BOOL v13 = 1;
      }
      double v14 = v9 + *(double *)(v7 + 8) * v11;
      if (v13) {
        double v11 = -0.0;
      }
      double v10 = v10 + v11;
      if (!v13) {
        double v9 = v14;
      }
    }
    v7 += 56;
    if (v7 - *v6 == 4088)
    {
      unint64_t v15 = v6[1];
      ++v6;
      unint64_t v7 = v15;
    }
  }
  while (v7 != v8);
  if (v10 <= 0.0) {
    return NAN;
  }
  else {
    return fmax(v9 / v10, 0.0);
  }
}

double RangeAngleSharingImportanceEstimator::getAverageRangeMeters(RangeAngleSharingImportanceEstimator *this, double a2, int a3)
{
  double v3 = 3.0;
  if (!*((unsigned char *)this + 89)) {
    double v3 = 1.0;
  }
  return RangeAngleSharingImportanceEstimator::getAverageRangeMeters(this, a2, v3, a3);
}

double RangeAngleSharingImportanceEstimator::getMedianSoiRssiDbm(RangeAngleSharingImportanceEstimator *this, double a2)
{
  std::string __p = 0;
  char v25 = 0;
  uint64_t v26 = 0;
  uint64_t v2 = *((void *)this + 4);
  if (*((void *)this + 5) == v2) {
    return -INFINITY;
  }
  unint64_t v3 = *((void *)this + 7);
  unint64_t v4 = *(void *)(v2 + 8 * (v3 / 0x49)) + 56 * (v3 % 0x49);
  unint64_t v5 = *(void *)(v2 + 8 * ((*((void *)this + 8) + v3) / 0x49)) + 56 * ((*((void *)this + 8) + v3) % 0x49);
  if (v4 == v5) {
    return -INFINITY;
  }
  unint64_t v7 = 0;
  unint64_t v8 = (void *)(v2 + 8 * (v3 / 0x49));
  do
  {
    uint64_t v9 = *(void *)(v4 + 32);
    double v10 = a2 - *(double *)v4;
    if (v10 >= 0.0 && v10 <= 1.0)
    {
      if (v7 >= v26)
      {
        BOOL v13 = __p;
        uint64_t v14 = (v7 - __p) >> 3;
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 61) {
          std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v16 = v26 - __p;
        if ((v26 - __p) >> 2 > v15) {
          unint64_t v15 = v16 >> 2;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          char v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v26, v17);
          BOOL v13 = __p;
          unint64_t v7 = v25;
        }
        else
        {
          char v18 = 0;
        }
        char v19 = &v18[8 * v14];
        *(void *)char v19 = v9;
        double v12 = v19 + 8;
        while (v7 != v13)
        {
          uint64_t v20 = *((void *)v7 - 1);
          v7 -= 8;
          *((void *)v19 - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v20;
          v19 -= 8;
        }
        std::string __p = v19;
        uint64_t v26 = &v18[8 * v17];
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        *(void *)unint64_t v7 = v9;
        double v12 = v7 + 8;
      }
      char v25 = v12;
      unint64_t v7 = v12;
    }
    v4 += 56;
    if (v4 - *v8 == 4088)
    {
      unint64_t v21 = v8[1];
      ++v8;
      unint64_t v4 = v21;
    }
  }
  while (v4 != v5);
  if (__p != v7)
  {
    std::__sort<std::__less<double,double> &,double *>();
    unint64_t v7 = __p;
    double v22 = *(double *)&__p[((v25 - __p) >> 1) & 0xFFFFFFFFFFFFFFF8];
LABEL_32:
    operator delete(v7);
    return v22;
  }
  double v22 = -INFINITY;
  if (v7) {
    goto LABEL_32;
  }
  return v22;
}

void sub_19E013588(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double RangeAngleSharingImportanceEstimator::getMedianAngleDegrees(RangeAngleSharingImportanceEstimator *this, double a2)
{
  if (!*((unsigned char *)this + 8)) {
    return NAN;
  }
  if (*((unsigned char *)this + 89)) {
    return NAN;
  }
  std::string __p = 0;
  char v25 = 0;
  uint64_t v26 = 0;
  uint64_t v4 = *((void *)this + 4);
  if (*((void *)this + 5) == v4) {
    return NAN;
  }
  unint64_t v5 = *((void *)this + 7);
  unint64_t v6 = *(void *)(v4 + 8 * (v5 / 0x49)) + 56 * (v5 % 0x49);
  unint64_t v7 = *(void *)(v4 + 8 * ((*((void *)this + 8) + v5) / 0x49)) + 56 * ((*((void *)this + 8) + v5) % 0x49);
  if (v6 == v7) {
    return NAN;
  }
  uint64_t v9 = 0;
  double v10 = (void *)(v4 + 8 * (v5 / 0x49));
  do
  {
    uint64_t v11 = *(void *)(v6 + 16);
    double v12 = a2 - *(double *)v6;
    if (v12 >= 0.0 && v12 <= 0.5)
    {
      if (v9 >= v26)
      {
        unint64_t v15 = __p;
        uint64_t v16 = (v9 - __p) >> 3;
        unint64_t v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 61) {
          std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v18 = v26 - __p;
        if ((v26 - __p) >> 2 > v17) {
          unint64_t v17 = v18 >> 2;
        }
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v17;
        }
        if (v19)
        {
          uint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v26, v19);
          unint64_t v15 = __p;
          uint64_t v9 = v25;
        }
        else
        {
          uint64_t v20 = 0;
        }
        unint64_t v21 = &v20[8 * v16];
        *(void *)unint64_t v21 = v11;
        uint64_t v14 = v21 + 8;
        while (v9 != v15)
        {
          uint64_t v22 = *((void *)v9 - 1);
          v9 -= 8;
          *((void *)v21 - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v22;
          v21 -= 8;
        }
        std::string __p = v21;
        uint64_t v26 = &v20[8 * v19];
        if (v15) {
          operator delete(v15);
        }
      }
      else
      {
        *(void *)uint64_t v9 = v11;
        uint64_t v14 = v9 + 8;
      }
      char v25 = v14;
      uint64_t v9 = v14;
    }
    v6 += 56;
    if (v6 - *v10 == 4088)
    {
      unint64_t v23 = v10[1];
      ++v10;
      unint64_t v6 = v23;
    }
  }
  while (v6 != v7);
  if (__p != v9)
  {
    std::__sort<std::__less<double,double> &,double *>();
    uint64_t v9 = __p;
    double v2 = *(double *)&__p[((v25 - __p) >> 1) & 0xFFFFFFFFFFFFFFF8];
LABEL_35:
    operator delete(v9);
    return v2;
  }
  double v2 = NAN;
  if (v9) {
    goto LABEL_35;
  }
  return v2;
}

void sub_19E0137D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RangeAngleSharingImportanceEstimator::getPreviousBTCoarseRange(RangeAngleSharingImportanceEstimator *this, double a2)
{
  uint64_t v2 = *((unsigned int *)this + 16);
  while ((int)v2 >= 1)
  {
    uint64_t v3 = v2 + *((void *)this + 7);
    --v2;
    uint64_t v4 = v3 - 1;
    unint64_t v5 = (v3 - 1) / 0x49uLL;
    uint64_t v6 = *(void *)(*((void *)this + 4) + 8 * v5);
    uint64_t v7 = v4 - 73 * v5;
    if (*(double *)(v6 + 56 * v7) <= a2) {
      return *(unsigned int *)(v6 + 56 * v7 + 24);
    }
  }
  return 3;
}

BOOL RangeAngleSharingImportanceEstimator::isOutsideFOVRegionWithHysteresis(RangeAngleSharingImportanceEstimator *this, double a2, double a3)
{
  double v3 = fabs(a3);
  if (*((unsigned char *)this + 88))
  {
    BOOL v4 = a2 + 0.25 > 4.0;
    BOOL v5 = v3 + 5.0 <= 20.0;
  }
  else
  {
    BOOL v4 = a2 + -0.25 > 4.0;
    BOOL v5 = fabs(v3 + -5.0) <= 20.0;
  }
  return !v5 || v4;
}

BOOL RangeAngleSharingImportanceEstimator::isSuperCloseWithHysteresis(RangeAngleSharingImportanceEstimator *this, double a2)
{
  if (*((unsigned char *)this + 89)) {
    return 0;
  }
  if (*((unsigned char *)this + 90)) {
    return a2 <= 0.35;
  }
  return a2 <= 0.25;
}

void RangeAngleSharingImportanceEstimator::getScoreEstimate(uint64_t a1, uint64_t a2, double a3)
{
  int v6 = *(unsigned __int8 *)(a1 + 89);
  if (*(unsigned char *)(a1 + 89)) {
    double v7 = 3.0;
  }
  else {
    double v7 = 1.0;
  }
  double AverageRangeMeters = RangeAngleSharingImportanceEstimator::getAverageRangeMeters((RangeAngleSharingImportanceEstimator *)a1, a3, v7, 1);
  *(double *)(a1 + 72) = AverageRangeMeters;
  *(unsigned char *)(a2 + 8) = 1;
  double v9 = 0.0;
  if (AverageRangeMeters >= 0.0 && AverageRangeMeters <= 10.0) {
    double v9 = AverageRangeMeters / -10.0 + 1.0;
  }
  *(double *)a2 = v9;
  double v11 = RangeAngleSharingImportanceEstimator::getAverageRangeMeters((RangeAngleSharingImportanceEstimator *)a1, a3, v7, 1);
  if (v6 || (*(unsigned char *)(a1 + 90) ? (BOOL v12 = v11 <= 0.35) : (BOOL v12 = v11 <= 0.25), !v12))
  {
    double MedianAngleDegrees = RangeAngleSharingImportanceEstimator::getMedianAngleDegrees((RangeAngleSharingImportanceEstimator *)a1, a3);
    *(double *)(a1 + 8TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = MedianAngleDegrees;
    double v16 = *(double *)(a1 + 72);
    double v17 = fabs(MedianAngleDegrees);
    if (*(unsigned char *)(a1 + 88))
    {
      double v18 = v16 + 0.25;
      if (v17 + 5.0 > 20.0 || v18 > 4.0)
      {
LABEL_20:
        char v14 = 0;
        *(void *)(a1 + 8TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0x7FF4000000000000;
        char v13 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      double v20 = fabs(v17 + -5.0);
      if (v16 + -0.25 > 4.0 || v20 > 20.0) {
        goto LABEL_20;
      }
    }
    char v14 = 0;
    char v13 = 0;
    goto LABEL_27;
  }
  char v13 = 0;
  *(void *)(a1 + 8TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
  char v14 = 1;
LABEL_27:
  *(unsigned char *)(a1 + 9TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = v14;
  *(unsigned char *)(a1 + 88) = v13;
}

void RangeAngleSharingImportanceEstimator::computeNormalizedSoiRssiDbm(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v6 = *(double *)(a2 + 40);
  double MedianSoiRssiDbm = RangeAngleSharingImportanceEstimator::getMedianSoiRssiDbm((RangeAngleSharingImportanceEstimator *)a1, a3);
  if (v6 > 0.0) {
    double MedianSoiRssiDbm = MedianSoiRssiDbm + log10(*(long double *)(a2 + 40)) * 20.0;
  }
  *(double *)(a2 + 56) = MedianSoiRssiDbm;
  if (fabs(MedianSoiRssiDbm) == INFINITY)
  {
    unint64_t v8 = *(NSObject **)(a1 + 192);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 176);
      double v10 = a3 - *(double *)(a1 + 184);
      int v11 = 134218496;
      double v12 = MedianSoiRssiDbm;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      double v16 = v10;
      _os_log_impl(&dword_19DFF5000, v8, OS_LOG_TYPE_INFO, "normalizedSoiRssiDbm %f, use %f computed %f(s) ago instead", (uint8_t *)&v11, 0x20u);
    }
    *(void *)(a2 + 56) = *(void *)(a1 + 176);
  }
  else
  {
    *(double *)(a1 + 176) = MedianSoiRssiDbm;
    *(double *)(a1 + 184) = a3;
  }
  if (*(unsigned char *)(a2 + 33)) {
    *(void *)(a2 + 56) = 0x7FF0000000000000;
  }
}

void RangeAngleSharingImportanceEstimator::getImportanceEstimate(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v6 = *(double *)(a1 + 16);
  if (a3 - v6 <= 3.0)
  {
    if (*(unsigned char *)(a1 + 168) && (v6 < a3 || *(double *)(a1 + 160) == a3))
    {
      long long v8 = *(_OWORD *)(a1 + 96);
      long long v9 = *(_OWORD *)(a1 + 112);
      long long v10 = *(_OWORD *)(a1 + 144);
      *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 128);
      *(_OWORD *)(a2 + 48) = v10;
      *(_OWORD *)a2 = v8;
      *(_OWORD *)(a2 + 16) = v9;
      if (a3 - *(double *)(a1 + 160) > 0.5 && !*(unsigned char *)(a1 + 90))
      {
        *(void *)(a2 + 24) = 0x7FF4000000000000;
        *(unsigned char *)(a2 + 17) = 0;
      }
    }
    else
    {
      *(void *)uint64_t v22 = 0x7FF4000000000000;
      unsigned char v22[8] = 0;
      RangeAngleSharingImportanceEstimator::getScoreEstimate(a1, (uint64_t)v22, a3);
      *(void *)a2 = *(void *)v22;
      *(unsigned char *)(a2 + 16) = v22[8];
      double v11 = 1.0;
      if (*(unsigned char *)(a1 + 89)) {
        double v11 = 3.0;
      }
      *(double *)(a2 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = RangeAngleSharingImportanceEstimator::getAverageRangeMeters((RangeAngleSharingImportanceEstimator *)a1, a3, v11, 1);
      *(void *)(a2 + 24) = *(void *)(a1 + 80);
      *(unsigned char *)(a2 + 32) = 1;
      *(unsigned char *)(a2 + 17) = 1;
      uint64_t v12 = *(unsigned int *)(a1 + 64);
      while ((int)v12 >= 1)
      {
        uint64_t v13 = v12 + *(void *)(a1 + 56);
        --v12;
        uint64_t v14 = v13 - 1;
        unint64_t v15 = (v13 - 1) / 0x49uLL;
        uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8 * v15);
        uint64_t v17 = v14 - 73 * v15;
        if (*(double *)(v16 + 56 * v17) <= a3)
        {
          int v18 = *(_DWORD *)(v16 + 56 * v17 + 24);
          goto LABEL_17;
        }
      }
      int v18 = 3;
LABEL_17:
      *(_DWORD *)(a2 + 48) = v18;
      *(unsigned char *)(a2 + 33) = *(unsigned char *)(a1 + 90);
      RangeAngleSharingImportanceEstimator::computeNormalizedSoiRssiDbm(a1, a2, a3);
      if (*(double *)(a1 + 16) == a3)
      {
        long long v19 = *(_OWORD *)a2;
        long long v20 = *(_OWORD *)(a2 + 16);
        long long v21 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 144) = v21;
        *(_OWORD *)(a1 + 96) = v19;
        *(_OWORD *)(a1 + 112) = v20;
        *(double *)(a1 + 16TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = a3;
        *(unsigned char *)(a1 + 168) = 1;
      }
    }
  }
  else
  {
    *(_WORD *)(a2 + 16) = 0;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 24) = 0x7FF4000000000000;
    *(_WORD *)(a2 + 32) = 0;
    *(void *)(a2 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0x7FF4000000000000;
    *(_DWORD *)(a2 + 48) = 3;
    *(void *)(a2 + 56) = 0xFFF0000000000000;
    double v7 = *(NSObject **)(a1 + 192);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v22 = 134217984;
      *(void *)&v22[4] = 0x4008000000000000;
      _os_log_impl(&dword_19DFF5000, v7, OS_LOG_TYPE_INFO, "[WARNING] Measurement gap more than %f(s)", v22, 0xCu);
    }
  }
}

void RangeAngleSharingImportanceEstimator::~RangeAngleSharingImportanceEstimator(RangeAngleSharingImportanceEstimator *this)
{
  *(void *)this = &unk_1EF08DB78;
  std::deque<RangeAngleSharingImportanceEstimator::Measurement>::~deque[abi:ne180100]((void *)this + 3);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1EF08DB78;
  std::deque<RangeAngleSharingImportanceEstimator::Measurement>::~deque[abi:ne180100]((void *)this + 3);
  JUMPOUT(0x19F3B95D0);
}

uint64_t std::deque<RangeAngleSharingImportanceEstimator::Measurement>::~deque[abi:ne180100](void *a1)
{
  uint64_t v2 = (void **)a1[1];
  double v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      double v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 36;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 73;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    double v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

uint64_t std::deque<RangeAngleSharingImportanceEstimator::Measurement>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x49) {
    a2 = 1;
  }
  if (v2 < 0x92) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 73;
  }
  return v4 ^ 1u;
}

void std::deque<RangeAngleSharingImportanceEstimator::Measurement>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x49;
  unint64_t v4 = v2 - 73;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    double v7 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    long long v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)long long v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      std::string v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(v5, v33);
      double v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      __int16 v38 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        long long v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        uint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)uint64_t v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    long long v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      long long v9 = (char *)a1[1];
    }
    long long v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0xFF8uLL);
      std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0xFF8uLL);
    std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_front((uint64_t)a1, &v54);
    v44 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    long long v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      std::string v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)(a1 + 3), v46);
      double v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        long long v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      int v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        long long v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v54 + 8 * v26;
  v53 = operator new(0xFF8uLL);
  std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_back(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_front((uint64_t)&v54, v27);
  }
  char v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_19E014328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_back(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    double v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      long long v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        int64_t v16 = 1;
      }
      else {
        int64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(a1[4], v16);
      long long v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      double v7 = v6 >> 3;
      uint64_t v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        BOOL v10 = v9;
      }
      else {
        BOOL v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      uint64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    double v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  unsigned char *v6;
  unsigned char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    double v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = (v7 - v4) >> 2;
      }
      unint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      int64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        int64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void sub_19E015024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return v0;
}

__CFString *PRRangingServiceStateToString(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_1E5999FB0[a1];
  }
}

__CFString *PRRangingServiceStateCauseToString(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return off_1E5999FD8[a1];
  }
}

uint64_t PRPingRadio()
{
  NSLog(&cfstr_SendingHelloCo.isa);
  uint64_t v0 = PRSendHelloWithTimeout(10000);
  if (v0)
  {
    NSLog(&cfstr_HelloResponse.isa);
    uint64_t v1 = @"===================================";
    NSLog(&stru_1EF0901D0.isa);
    id v2 = [v0 description];
    NSLog(&cfstr_S.isa, [v2 UTF8String]);

    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v1 = @"Error sending/receving hello";
  }
  NSLog(&v1->isa);

  return v3;
}

id PRSendHelloWithTimeout(uint64_t a1)
{
  id v2 = getDiagnosticsServiceXPCConnection();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__1;
    unint64_t v12 = __Block_byref_object_dispose__1;
    id v13 = 0;
    uint64_t v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_27];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __PRSendHelloWithTimeout_block_invoke_2;
    v7[3] = &unk_1E599A108;
    v7[4] = &v8;
    [v4 sendHelloWithTimeout:a1 reply:v7];

    [v3 invalidate];
    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_19E01589C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PRGetPreflightInfo()
{
  uint64_t v0 = getDiagnosticsServiceXPCConnection();
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v6 = 0;
    double v7 = &v6;
    uint64_t v8 = 0x3032000000;
    uint64_t v9 = __Block_byref_object_copy__1;
    uint64_t v10 = __Block_byref_object_dispose__1;
    id v11 = 0;
    id v2 = [v0 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_2];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __PRGetPreflightInfo_block_invoke_2;
    v5[3] = &unk_1E599A040;
    v5[4] = &v6;
    [v2 getPreflightInfo:v5];

    [v1 invalidate];
    id v3 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_19E0159D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getDiagnosticsServiceXPCConnection()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nearbyd.xpc.diagnostics" options:4096];
  uint64_t v1 = PRMakeDiagnosticsServerXPCInterface();
  [v0 setRemoteObjectInterface:v1];

  [v0 resume];
  return v0;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __PRGetPreflightInfo_block_invoke_2(uint64_t a1, void *a2)
{
}

BOOL PRRoseHasFailedUpdate()
{
  if (!PRIsSupportedPlatform()) {
    return 0;
  }
  uint64_t v0 = getDiagnosticsServiceXPCConnection();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = v0;
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [v0 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_16];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __PRRoseHasFailedUpdate_block_invoke_2;
  v5[3] = &unk_1E599A068;
  v5[4] = &v6;
  [v2 hasFailedRoseUpdate:v5];

  [v1 invalidate];
  BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_19E015B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PRRoseHasFailedUpdate_block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

id PRGetChipInfo()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];
  int v2 = [v1 isEqualToString:@"com.apple.secureelementservice"];

  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    uint64_t v4 = v3;
    if (!v3)
    {
      id v6 = 0;
      goto LABEL_10;
    }
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__1;
    uint64_t v18 = __Block_byref_object_dispose__1;
    id v19 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __PRGetChipInfo_block_invoke;
    void v11[3] = &unk_1E599A090;
    id v13 = &v14;
    uint64_t v4 = v3;
    unint64_t v12 = v4;
    PRGetChipInfoAsync(v11);
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v4, v5);
    id v6 = (id)v15[5];
  }
  else
  {
    if (!PRIsSupportedPlatform()
      || (getDiagnosticsServiceXPCConnection(), (double v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v6 = 0;
      goto LABEL_11;
    }
    uint64_t v4 = v7;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__1;
    uint64_t v18 = __Block_byref_object_dispose__1;
    id v19 = 0;
    uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_23];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __PRGetChipInfo_block_invoke_3;
    v10[3] = &unk_1E599A0B8;
    v10[4] = &v14;
    [v8 getChipInfoSync:1 reply:v10];

    [v4 invalidate];
    id v6 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);

LABEL_10:
LABEL_11:
  return v6;
}

void sub_19E015E10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void PRGetChipInfoAsync(void *a1)
{
  id v1 = a1;
  if ((PRIsSupportedPlatform() & 1) != 0
    && (getDiagnosticsServiceXPCConnection(), (int v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    dispatch_semaphore_t v3 = v2;
    uint64_t v4 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_25];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __PRGetChipInfoAsync_block_invoke_2;
    v6[3] = &unk_1E599A0E0;
    id v7 = v3;
    id v8 = v1;
    id v5 = v3;
    [v4 getChipInfoSync:0 reply:v6];
  }
  else
  {
    (*((void (**)(id, void))v1 + 2))(v1, 0);
  }
}

void __PRGetChipInfo_block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __PRGetChipInfo_block_invoke_3(uint64_t a1, void *a2)
{
}

uint64_t __PRGetChipInfoAsync_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

void __PRSendHelloWithTimeout_block_invoke_2(uint64_t a1, void *a2)
{
}

id PRGetPowerStatsWithTimeout(uint64_t a1)
{
  int v2 = getDiagnosticsServiceXPCConnection();
  dispatch_semaphore_t v3 = v2;
  if (v2)
  {
    uint64_t v8 = 0;
    char v9 = &v8;
    uint64_t v10 = 0x3032000000;
    id v11 = __Block_byref_object_copy__1;
    unint64_t v12 = __Block_byref_object_dispose__1;
    id v13 = 0;
    id v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_30];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __PRGetPowerStatsWithTimeout_block_invoke_2;
    v7[3] = &unk_1E599A130;
    v7[4] = &v8;
    [v4 getPowerStatsWithTimeout:a1 reply:v7];

    [v3 invalidate];
    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_19E01612C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __PRGetPowerStatsWithTimeout_block_invoke_2(uint64_t a1, void *a2)
{
}

BOOL PRSetMcc(void *a1)
{
  id v1 = a1;
  int v2 = getDiagnosticsServiceXPCConnection();
  if (v2)
  {
    uint64_t v8 = 0;
    char v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    id v3 = v1;
    NSLog(&cfstr_PrdiagnosticPr.isa, [v3 UTF8String]);
    id v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_36];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __PRSetMcc_block_invoke_2;
    v7[3] = &unk_1E599A068;
    v7[4] = &v8;
    [v4 setRegulatoryMcc:v3 reply:v7];

    [v2 invalidate];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_19E016280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PRSetMcc_block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

BOOL PRSetIsoCountry(void *a1)
{
  id v1 = a1;
  int v2 = getDiagnosticsServiceXPCConnection();
  id v3 = v2;
  if (v2)
  {
    uint64_t v8 = 0;
    char v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    id v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_38_0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __PRSetIsoCountry_block_invoke_2;
    v7[3] = &unk_1E599A068;
    v7[4] = &v8;
    [v4 setRegulatoryIsoCountry:v1 reply:v7];

    [v3 invalidate];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_19E0163B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PRSetIsoCountry_block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

BOOL PRSetAccessoryState(uint64_t a1)
{
  int v2 = getDiagnosticsServiceXPCConnection();
  if (v2)
  {
    uint64_t v8 = 0;
    char v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    id v3 = (void *)[objc_alloc(NSNumber) initWithInt:a1];
    id v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_41];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __PRSetAccessoryState_block_invoke_2;
    v7[3] = &unk_1E599A068;
    v7[4] = &v8;
    [v4 setRegulatoryAccessoryState:v3 reply:v7];

    [v2 invalidate];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;

    _Block_object_dispose(&v8, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_19E0164F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PRSetAccessoryState_block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

BOOL PRCollectLogs(unint64_t a1)
{
  if (a1 < 5)
  {
    id v3 = getDiagnosticsServiceXPCConnection();
    id v4 = v3;
    if (v3)
    {
      uint64_t v8 = 0;
      char v9 = &v8;
      uint64_t v10 = 0x2020000000;
      char v11 = 0;
      BOOL v5 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_46];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __PRCollectLogs_block_invoke_2;
      v7[3] = &unk_1E599A068;
      v7[4] = &v8;
      [v5 triggerLogCollection:a1 reply:v7];

      [v4 invalidate];
      BOOL v1 = *((unsigned char *)v9 + 24) != 0;
      _Block_object_dispose(&v8, 8);
    }
    else
    {
      BOOL v1 = 0;
    }
  }
  else
  {
    NSLog(&cfstr_PrcollectlogsI.isa);
    return 0;
  }
  return v1;
}

void sub_19E01663C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PRCollectLogs_block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

BOOL PRSetRoseGlobalConfigParams(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    int v2 = getDiagnosticsServiceXPCConnection();
    id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_48];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __PRSetRoseGlobalConfigParams_block_invoke_2;
    v6[3] = &unk_1E599A068;
    void v6[4] = &v7;
    [v3 setRoseGlobalConfigParams:v1 reply:v6];

    [v2 invalidate];
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;

    _Block_object_dispose(&v7, 8);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void sub_19E01676C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PRSetRoseGlobalConfigParams_block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

unint64_t PRGetChipPowerState(unsigned char *a1)
{
  unint64_t v1 = (unint64_t)a1;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (a1)
  {
    int v2 = getDiagnosticsServiceXPCConnection();
    id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_50];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __PRGetChipPowerState_block_invoke_2;
    v5[3] = &unk_1E599A158;
    v5[4] = &v6;
    void v5[5] = &v10;
    [v3 getRoseChipPowerState:v5];

    *(unsigned char *)unint64_t v1 = *((unsigned char *)v11 + 24);
    [v2 invalidate];
    unint64_t v1 = *((unsigned char *)v7 + 24) != 0;
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v1;
}

void sub_19E0168B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __PRGetChipPowerState_block_invoke_2(uint64_t result, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  return result;
}

uint64_t PRRequestPowerChange(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  int v2 = getDiagnosticsServiceXPCConnection();
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_53];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __PRRequestPowerChange_block_invoke_2;
  v6[3] = &unk_1E599A068;
  void v6[4] = &v7;
  [v3 requestPowerChange:a1 reply:v6];

  [v2 invalidate];
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_19E0169E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PRRequestPowerChange_block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t PRGetChipType()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  uint64_t v0 = getDiagnosticsServiceXPCConnection();
  unint64_t v1 = [v0 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_55];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __PRGetChipType_block_invoke_2;
  v4[3] = &unk_1E599A180;
  v4[4] = &v5;
  [v1 getChipType:v4];

  [v0 invalidate];
  uint64_t v2 = v6[3];

  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_19E016AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PRGetChipType_block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

id PRGetChipPublicKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  uint64_t v0 = getDiagnosticsServiceXPCConnection();
  unint64_t v1 = [v0 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_58];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __PRGetChipPublicKey_block_invoke_2;
  v4[3] = &unk_1E599A1A8;
  v4[4] = &v5;
  [v1 getChipPublicKey:v4];

  [v0 invalidate];
  id v2 = (id)v6[5];

  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_19E016C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __PRGetChipPublicKey_block_invoke_2(uint64_t a1, void *a2)
{
}

uint64_t PRSetNarrowbandSARState(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v2 = getDiagnosticsServiceXPCConnection();
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_61];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __PRSetNarrowbandSARState_block_invoke_2;
  v6[3] = &unk_1E599A068;
  void v6[4] = &v7;
  [v3 setNarrowbandSarState:a1 reply:v6];

  [v2 invalidate];
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_19E016D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PRSetNarrowbandSARState_block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t PRGetDeepSleepState()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  uint64_t v0 = getDiagnosticsServiceXPCConnection();
  unint64_t v1 = [v0 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_63];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __PRGetDeepSleepState_block_invoke_2;
  v4[3] = &unk_1E599A180;
  v4[4] = &v5;
  [v1 getDeepSleepState:v4];

  [v0 invalidate];
  uint64_t v2 = v6[3];

  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_19E016E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PRGetDeepSleepState_block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_19E016F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_19E017480(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_19E017764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(location);
  objc_destroyWeak(&a25);

  _Unwind_Resume(a1);
}

void sub_19E01782C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E017888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void DaemonBackedService::connect(id *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, char a10)
{
  id v25 = a2;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  uint64_t v23 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v25 options:a3];
  id v24 = *a1;
  *a1 = (id)v23;

  [*a1 setExportedObject:v17];
  [*a1 setExportedInterface:v18];
  [*a1 setRemoteObjectInterface:v19];
  if (v20) {
    [*a1 _setQueue:v20];
  }
  [*a1 setInterruptionHandler:v22];
  [*a1 setInvalidationHandler:v21];
  if (a10) {
    [*a1 resume];
  }
}

void sub_19E0179E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E017AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id v17 = v16;
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_19E017BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E017CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_19E017D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E017DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  char v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)PRBeacon;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_19E017E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E017F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void dispatchAsyncOnQueue(void *a1, void *a2)
{
  queue = a1;
  id v3 = a2;
  if (queue) {
    dispatch_async(queue, v3);
  }
  else {
    v3[2](v3);
  }
}

void sub_19E017FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01802C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E0180F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E0181AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E018520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(location);
  objc_destroyWeak(&a25);

  _Unwind_Resume(a1);
}

void sub_19E0185E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E018644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E0186E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E018778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E0187EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  char v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)PRBeaconListener;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_19E0188A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E018964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19E0189D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E018A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E018B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E019768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E019A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E019B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_19E019C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E019DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E019E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

__n128 std::deque<BtProxData>::push_back(void *a1, __n128 *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 170 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<BtProxData>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  uint64_t v8 = (__n128 *)(*(void *)(v5 + 8 * (v7 / 0xAA)) + 24 * (v7 % 0xAA));
  __n128 result = *a2;
  v8[1].n128_u64[0] = a2[1].n128_u64[0];
  *uint64_t v8 = result;
  ++a1[5];
  return result;
}

void sub_19E01A29C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

void sub_19E01A3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01A4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01A660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01A920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01AAD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01ACF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01ADCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01AE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void std::default_delete<SingleThresholdProx::Estimator>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a2 + 80);
    if (v2)
    {
      *(void *)(a2 + 88) = v2;
      operator delete(v2);
    }
    JUMPOUT(0x19F3B95D0);
  }
}

uint64_t std::deque<BtProxData>::~deque[abi:ne180100](void *a1)
{
  uint64_t v2 = (void **)a1[1];
  id v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      id v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 85;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 170;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    unint64_t v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::deque<BtProxData>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0xAA) {
    a2 = 1;
  }
  if (v2 < 0x154) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 170;
  }
  return v4 ^ 1u;
}

void std::deque<BtProxData>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0xAA;
  unint64_t v4 = v2 - 170;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)uint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      std::string v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(v5, v33);
      double v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      __int16 v38 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        uint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        uint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)uint64_t v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    id v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    uint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0xFF0uLL);
      std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0xFF0uLL);
    std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_front((uint64_t)a1, &v54);
    v44 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      std::string v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)(a1 + 3), v46);
      double v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        uint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      int v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        uint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v54 + 8 * v26;
  v53 = operator new(0xFF0uLL);
  std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_back(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_front((uint64_t)&v54, v27);
  }
  char v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_19E01B310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::vector<BtProxData>::vector<std::__deque_iterator<BtProxData,BtProxData*,BtProxData&,BtProxData**,long,170l>,0>(uint64_t a1, void *a2, long long *a3, void *a4, long long *a5)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  if (a5 == a3) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = 170 * (a4 - a2)
  }
       - 0x5555555555555555 * (((uint64_t)a5 - *a4) >> 3)
       + 0x5555555555555555 * (((uint64_t)a3 - *a2) >> 3);
  std::vector<BtProxData>::__init_with_size[abi:ne180100]<std::__deque_iterator<BtProxData,BtProxData*,BtProxData&,BtProxData**,long,170l>,std::__deque_iterator<BtProxData,BtProxData*,BtProxData&,BtProxData**,long,170l>>((char *)a1, a2, a3, (uint64_t)a4, a5, v6);
  return a1;
}

char *std::vector<BtProxData>::__init_with_size[abi:ne180100]<std::__deque_iterator<BtProxData,BtProxData*,BtProxData&,BtProxData**,long,170l>,std::__deque_iterator<BtProxData,BtProxData*,BtProxData&,BtProxData**,long,170l>>(char *result, void *a2, long long *a3, uint64_t a4, long long *a5, unint64_t a6)
{
  if (a6)
  {
    uint64_t v9 = result;
    __n128 result = std::vector<BtProxData>::__vallocate[abi:ne180100](result, a6);
    uint64_t v10 = *((void *)v9 + 1);
    while (a3 != a5)
    {
      long long v11 = *a3;
      *(void *)(v10 + 16) = *((void *)a3 + 2);
      *(_OWORD *)uint64_t v10 = v11;
      a3 = (long long *)((char *)a3 + 24);
      if ((long long *)((char *)a3 - *a2) == (long long *)4080)
      {
        uint64_t v12 = (long long *)a2[1];
        ++a2;
        a3 = v12;
      }
      v10 += 24;
    }
    *((void *)v9 + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v10;
  }
  return result;
}

void sub_19E01B45C(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<BtProxData>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_19E01B518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01B604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01B6C4(_Unwind_Exception *a1)
{
  MEMORY[0x19F3B95D0](v1, 0x10A0C404BE6215DLL);
  _Unwind_Resume(a1);
}

void sub_19E01BE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,void *a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  std::__tree<Region>::destroy((uint64_t)&a46, a47);
  _Unwind_Resume(a1);
}

void sub_19E01C8CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01CC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char *a11)
{
  std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

void std::vector<NeighborMeasurements>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  unint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<NeighborMeasurements>::__clear[abi:ne180100]((uint64_t *)v2);
    BOOL v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<NeighborMeasurements>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 88)
  {
    if (*(char *)(i - 65) < 0) {
      operator delete(*(void **)(i - 88));
    }
  }
  a1[1] = v2;
}

SharingImportanceManager *std::unique_ptr<SharingImportanceManager>::reset[abi:ne180100](SharingImportanceManager **a1, SharingImportanceManager *a2)
{
  __n128 result = *a1;
  *a1 = a2;
  if (result)
  {
    SharingImportanceManager::~SharingImportanceManager(result);
    JUMPOUT(0x19F3B95D0);
  }
  return result;
}

void SharingImportanceManager::~SharingImportanceManager(SharingImportanceManager *this)
{
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 344, *((void **)this + 44));
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 320, *((void **)this + 41));

  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 256, *((void **)this + 33));
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 232, *((void **)this + 30));

  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 160, *((void **)this + 21));
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 136, *((void **)this + 18));

  uint64_t v2 = (void **)((char *)this + 72);
  std::vector<SharingHysteresis::DeviceScore>::__destroy_vector::operator()[abi:ne180100](&v2);
  uint64_t v2 = (void **)((char *)this + 48);
  std::vector<SharingHysteresis::DeviceScore>::__destroy_vector::operator()[abi:ne180100](&v2);
  std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::destroy((uint64_t)this, *((void **)this + 1));
}

uint64_t **std::__tree<std::__value_type<unsigned long long,BOOL>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,BOOL>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = a1 + 1;
  unint64_t v6 = a1[1];
  if (v6)
  {
    unint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        unint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        unint64_t v6 = *v9;
        unint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      unint64_t v6 = v9[1];
      if (!v6)
      {
        unint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    long long v11 = operator new(0x30uLL);
    void v11[4] = **a4;
    *((unsigned char *)v11 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return (uint64_t **)v11;
  }
  return v9;
}

__n128 std::vector<NeighborMeasurements>::__construct_one_at_end[abi:ne180100]<NeighborMeasurements const&>(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    *(void *)(v4 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v5;
  }
  __n128 result = *(__n128 *)((char *)a2 + 24);
  long long v7 = *(long long *)((char *)a2 + 40);
  long long v8 = *(long long *)((char *)a2 + 56);
  *(_OWORD *)(v4 + 66) = *(long long *)((char *)a2 + 66);
  *(_OWORD *)(v4 + 56) = v8;
  *(_OWORD *)(v4 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = v7;
  *(__n128 *)(v4 + 24) = result;
  *(void *)(a1 + 8) = v4 + 88;
  return result;
}

void sub_19E01D1E0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<NeighborMeasurements>::__push_back_slow_path<NeighborMeasurements const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x2E8BA2E8BA2E8BA3 * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x2E8BA2E8BA2E8BALL) {
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x2E8BA2E8BA2E8BA3 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x1745D1745D1745DLL) {
    unint64_t v9 = 0x2E8BA2E8BA2E8BALL;
  }
  else {
    unint64_t v9 = v5;
  }
  unint64_t v22 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NeighborMeasurements>>(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  long long v11 = (std::string *)&v10[88 * v4];
  v19[0] = v10;
  v19[1] = v11;
  int64_t v20 = v11;
  uint64_t v21 = &v10[88 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    long long v11 = v20;
  }
  else
  {
    long long v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  uint64_t v13 = &v10[88 * v4];
  long long v14 = *(long long *)((char *)a2 + 56);
  long long v15 = *(long long *)((char *)a2 + 66);
  long long v16 = *(long long *)((char *)a2 + 24);
  *(_OWORD *)(v13 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(long long *)((char *)a2 + 40);
  *(_OWORD *)(v13 + 24) = v16;
  *(_OWORD *)(v13 + 66) = v15;
  *(_OWORD *)(v13 + 56) = v14;
  int64_t v20 = (std::string *)((char *)v11 + 88);
  std::vector<NeighborMeasurements>::__swap_out_circular_buffer(a1, v19);
  uint64_t v17 = a1[1];
  std::__split_buffer<NeighborMeasurements>::~__split_buffer((uint64_t)v19);
  return v17;
}

void sub_19E01D338(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<NeighborMeasurements>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<NeighborMeasurements>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>,std::reverse_iterator<NeighborMeasurements*>,std::reverse_iterator<NeighborMeasurements*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<NeighborMeasurements>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2E8BA2E8BA2E8BBLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(88 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>,std::reverse_iterator<NeighborMeasurements*>,std::reverse_iterator<NeighborMeasurements*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v18 = a6;
  *((void *)&v18 + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = a7;
  long long v17 = v18;
  v15[0] = a1;
  v15[1] = &v17;
  v15[2] = &v18;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 88);
      *(void *)(v9 - 72) = *(void *)(a3 - 72);
      *(_OWORD *)(v9 - 88) = v10;
      *(void *)(a3 - 8TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
      *(void *)(a3 - 72) = 0;
      *(void *)(a3 - 88) = 0;
      long long v11 = *(_OWORD *)(a3 - 64);
      long long v12 = *(_OWORD *)(a3 - 48);
      long long v13 = *(_OWORD *)(a3 - 32);
      *(_OWORD *)(v9 - 22) = *(_OWORD *)(a3 - 22);
      *(_OWORD *)(v9 - 48) = v12;
      *(_OWORD *)(v9 - 32) = v13;
      *(_OWORD *)(v9 - 64) = v11;
      v9 -= 88;
      v7 -= 88;
      a3 -= 88;
    }
    while (a3 != a5);
    *((void *)&v18 + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v9;
  }
  char v16 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v15);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 88;
  }
}

uint64_t std::__split_buffer<NeighborMeasurements>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<NeighborMeasurements>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 11;
      *(void *)(a1 + 16) = v2 - 11;
      if (*((char *)v2 - 65) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_19E01D750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01D9B8(_Unwind_Exception *a1)
{
  uint64_t v6 = v1;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v5 - 72));
  _Unwind_Resume(a1);
}

void sub_19E01DA60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01DABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01DC68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01DD88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E01DEF8(_Unwind_Exception *exception_object)
{
}

void sub_19E01E068(_Unwind_Exception *exception_object)
{
}

void sub_19E01E0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01E198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01E238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01E2D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01E370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01E3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01E4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  long long v18 = v17;
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E01E5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01E694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E01E748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01E834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E01E8E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01E9D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E01EA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E01EB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E01EC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id PRMakeRangingServerXPCInterface()
{
  if (PRMakeRangingServerXPCInterface_onceToken != -1) {
    dispatch_once(&PRMakeRangingServerXPCInterface_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)PRMakeRangingServerXPCInterface_interface;
  return v0;
}

void __PRMakeRangingServerXPCInterface_block_invoke()
{
  uint64_t v0 = _PRMakeRangingServerInterfaceWithProtocol((uint64_t)&unk_1EF09C258);
  uint64_t v1 = (void *)PRMakeRangingServerXPCInterface_interface;
  PRMakeRangingServerXPCInterface_interface = v0;

  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  id v9 = (id)objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  [(id)PRMakeRangingServerXPCInterface_interface setClasses:v9 forSelector:sel_configureForP2PRanging_options_reply_ argumentIndex:0 ofReply:0];
  [(id)PRMakeRangingServerXPCInterface_interface setClasses:v8 forSelector:sel_configureForP2PRanging_options_reply_ argumentIndex:1 ofReply:0];
  [(id)PRMakeRangingServerXPCInterface_interface setClasses:v9 forSelector:sel_startP2PRanging_reply_ argumentIndex:0 ofReply:0];
  [(id)PRMakeRangingServerXPCInterface_interface setClasses:v9 forSelector:sel_stopP2PRanging_reply_ argumentIndex:0 ofReply:0];
}

id _PRMakeRangingServerInterfaceWithProtocol(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F29280] interfaceWithProtocol:a1];
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  [v1 setClasses:v5 forSelector:sel_connectWithClientInfo_ argumentIndex:0 ofReply:0];

  return v1;
}

id PRMakeRangingClientXPCInterface()
{
  return _PRMakeRangingClientInterfaceWithProtocol((uint64_t)&unk_1EF0994C8);
}

id _PRMakeRangingClientInterfaceWithProtocol(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F29280] interfaceWithProtocol:a1];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  [v1 setClasses:v4 forSelector:sel_didReceiveNewSolutions_ argumentIndex:0 ofReply:0];
  [v1 setClass:objc_opt_class() forSelector:sel_didFailWithError_ argumentIndex:0 ofReply:0];
  [v1 setClasses:v7 forSelector:sel_remoteDevice_didChangeState_ argumentIndex:0 ofReply:0];

  return v1;
}

id PRMakeAidedRangingClientXPCInterface()
{
  uint64_t v0 = _PRMakeRangingClientInterfaceWithProtocol((uint64_t)&unk_1EF099540);
  [v0 setClass:objc_opt_class() forSelector:sel_sendDataToPeers_ argumentIndex:0 ofReply:0];
  return v0;
}

id PRMakeBTRangingClientXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF09B0B8];
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v1, "initWithObjects:", v2, v3, objc_opt_class(), 0);
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClass:objc_opt_class() forSelector:sel_didFailWithError_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v4 forSelector:sel_didFetchTxPower_fromDevice_withError_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v7 forSelector:sel_didConnectDevice_error_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v7 forSelector:sel_didStartRangingOnDevice_withError_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v7 forSelector:sel_didStopOwnerRangingOnDevice_withError_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v8 forSelector:sel_didReceiveNewBTRSSI_ argumentIndex:0 ofReply:0];

  return v0;
}

id PRMakeDiagnosticsServerXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF09C2B8];
  [v0 setClass:objc_opt_class() forSelector:sel_sendHelloWithTimeout_reply_ argumentIndex:0 ofReply:1];
  [v0 setClass:objc_opt_class() forSelector:sel_getChipInfoSync_reply_ argumentIndex:0 ofReply:1];
  [v0 setClass:objc_opt_class() forSelector:sel_getPowerStatsWithTimeout_reply_ argumentIndex:0 ofReply:1];
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v1, "setWithObjects:", v2, v3, v4, v5, objc_opt_class(), 0);
  [v0 setClasses:v6 forSelector:sel_getPreflightInfo_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v6 forSelector:sel_getChipPublicKey_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v6 forSelector:sel_setRoseGlobalConfigParams_reply_ argumentIndex:0 ofReply:0];

  return v0;
}

id PRMakeProtobufServerXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF09C318];
  [v0 setClass:objc_opt_class() forSelector:sel_startStreamingProtobufDataForClientId_reply_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_stopStreamingProtobufDataForClientId_reply_ argumentIndex:0 ofReply:0];
  return v0;
}

id PRMakeProtobufClientXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF09A838];
  [v0 setClass:objc_opt_class() forSelector:sel_consumeProtobufBytes_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_getUniqueClientIdentifier_ argumentIndex:0 ofReply:1];
  return v0;
}

id PRMakeRegulatoryAssistanceEndpointXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF09C378];
  [v0 setClass:objc_opt_class() forSelector:sel_injectIsoCode_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_prepareForRegulatoryAssistance_ argumentIndex:0 ofReply:1];
  return v0;
}

id PRMakeCompanionRangingServerXPCInterface()
{
  uint64_t v0 = _PRMakeRangingServerInterfaceWithProtocol((uint64_t)&unk_1EF09C3D8);
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v1, "initWithObjects:", v2, objc_opt_class(), 0);
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_configureForCompanionRanging_options_reply_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v8 forSelector:sel_configureForCompanionRanging_options_reply_ argumentIndex:1 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_startCompanionRanging_options_reply_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v8 forSelector:sel_startCompanionRanging_options_reply_ argumentIndex:1 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_stopCompanionRanging_reply_ argumentIndex:0 ofReply:0];

  return v0;
}

id PRMakeBTRangingServerXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF09C438];
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v1, "initWithObjects:", v2, objc_opt_class(), 0);
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "initWithObjects:", v5, v6, objc_opt_class(), 0);
  [v0 setClasses:v7 forSelector:sel_fetchTxPower_isUT_reply_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_startUTRanging_reply_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_stopUTRanging_reply_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_startOwnerRanging_reply_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_stopOwnerRanging_reply_ argumentIndex:0 ofReply:0];

  return v0;
}

id PRMakeBeaconRangingServerXPCInterface()
{
  uint64_t v0 = _PRMakeRangingServerInterfaceWithProtocol((uint64_t)&unk_1EF09C498);
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v1, "initWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_startBeaconing_options_reply_ argumentIndex:1 ofReply:0];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v0 setClasses:v8 forSelector:sel_pushBeaconAllowlist_reply_ argumentIndex:0 ofReply:0];

  return v0;
}

id PRMakeAidedRangingServerXPCInterface()
{
  uint64_t v0 = _PRMakeRangingServerInterfaceWithProtocol((uint64_t)&unk_1EF09C4F8);
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v1, "initWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_runWithConfiguration_reply_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_requestInitialCollaborationDataWithCompletionHandler_ argumentIndex:0 ofReply:1];
  [v0 setClass:objc_opt_class() forSelector:sel_receivedData_fromPeer_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v8 forSelector:sel_receivedData_fromPeer_ argumentIndex:1 ofReply:0];

  return v0;
}

void sub_19E020664(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_19E020EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19E0210CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_19E0212B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void BtProxMaxFilter::~BtProxMaxFilter(void **this)
{
  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
  JUMPOUT(0x19F3B95D0);
}

void BtProxMeanFilter::~BtProxMeanFilter(void **this)
{
  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
  JUMPOUT(0x19F3B95D0);
}

void BtProxMedianFilter::~BtProxMedianFilter(void **this)
{
  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
  JUMPOUT(0x19F3B95D0);
}

void BtProxMaxOfMeanOfChanFilter::~BtProxMaxOfMeanOfChanFilter(void **this)
{
  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
  JUMPOUT(0x19F3B95D0);
}

void BtProxMedianOfMeanOfChanFilter::~BtProxMedianOfMeanOfChanFilter(void **this)
{
  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
  JUMPOUT(0x19F3B95D0);
}

void BtProxOlympicFilter::~BtProxOlympicFilter(void **this)
{
  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
  JUMPOUT(0x19F3B95D0);
}

void BtProxRayleighFilter::~BtProxRayleighFilter(void **this)
{
  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  *this = &unk_1EF08E058;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
  JUMPOUT(0x19F3B95D0);
}

double BtProximityFilterBase::MeanBtProxData(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  double result = 0.0;
  if (v2 != *a2)
  {
    do
    {
      double result = result + *(double *)(v3 + 8);
      v3 += 24;
    }
    while (v3 != v2);
    return result / (double)(0xAAAAAAAAAAAAAAABLL * ((v2 - *a2) >> 3));
  }
  return result;
}

double BtProximityFilterBase::RssiSum(BtProximityFilterBase *this, double a2, BtProxData *a3)
{
  return *((double *)this + 1) + a2;
}

double BtProximityFilterBase::MeanDouble(uint64_t a1, double **a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  if (v2 == *a2) {
    return 0.0;
  }
  double v4 = 0.0;
  do
  {
    double v5 = *v3++;
    double v4 = v4 + v5;
  }
  while (v3 != v2);
  return v4 / (double)(unint64_t)(v2 - *a2);
}

BOOL BtProximityFilterBase::RssiCompare(BtProximityFilterBase *this, BtProxData *a2, BtProxData *a3)
{
  return *((double *)this + 1) < a2->var1;
}

double BtProxMaxFilter::FilterSamples(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  if (v3 == *a2) {
    return 0.0;
  }
  for (uint64_t i = v2 + 24; i != v3; i += 24)
  {
    if (*(double *)(v2 + 8) < *(double *)(i + 8)) {
      uint64_t v2 = i;
    }
  }
  return *(double *)(v2 + 8);
}

double BtProxMeanFilter::FilterSamples(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  if ((const void *)v3 == v2) {
    return 0.0;
  }
  id v9 = 0;
  long long v10 = 0;
  uint64_t v11 = 0;
  std::vector<BtProxData>::__init_with_size[abi:ne180100]<BtProxData*,BtProxData*>(&v9, v2, v3, 0xAAAAAAAAAAAAAAABLL * ((v3 - (uint64_t)v2) >> 3));
  if (v10 == v9)
  {
    double v7 = 0.0;
    if (!v9) {
      return v7;
    }
LABEL_9:
    long long v10 = v9;
    operator delete(v9);
    return v7;
  }
  double v5 = 0.0;
  id v6 = v9;
  do
  {
    double v5 = v5 + v6[1];
    v6 += 3;
  }
  while (v6 != v10);
  double v7 = v5 / (double)(0xAAAAAAAAAAAAAAABLL * (v10 - v9));
  if (v9) {
    goto LABEL_9;
  }
  return v7;
}

double BtProxMedianFilter::FilterSamples(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = (long long *)a2[1];
  uint64_t v4 = *a2;
  if (v3 == (long long *)*a2) {
    return 0.0;
  }
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v3 - *a2) >> 3);
  unint64_t v6 = v5 >> 1;
  uint64_t v8 = BtProximityFilterBase::RssiCompare;
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,false>(v4, v3, (uint64_t (**)(long long *, long long *))&v8, 126 - 2 * __clz(v5), 1);
  double result = *(double *)(*a2 + 24 * v6 + 8);
  if (((*((_DWORD *)a2 + 2) - *a2) & 8) == 0) {
    return (result + *(double *)(*a2 + 24 * v6 - 16)) * 0.5;
  }
  return result;
}

double BtProxMaxOfMeanOfChanFilter::FilterSamples(uint64_t a1, uint64_t *a2)
{
  if (a2[1] == *a2) {
    return -200.0;
  }
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  std::string __p = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  double v5 = -200.0;
  do
  {
    uint64_t v7 = *a2;
    uint64_t v6 = a2[1];
    if (v6 == *a2) {
      goto LABEL_34;
    }
    int v8 = bTAdvChans[v4];
    do
    {
      if (*(_DWORD *)(v7 + 16) == v8)
      {
        if (v3 >= v28)
        {
          long long v10 = (char *)__p;
          uint64_t v11 = (v3 - (unsigned char *)__p) >> 3;
          unint64_t v12 = v11 + 1;
          if ((unint64_t)(v11 + 1) >> 61) {
            std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v13 = v28 - (unsigned char *)__p;
          if ((v28 - (unsigned char *)__p) >> 2 > v12) {
            unint64_t v12 = v13 >> 2;
          }
          if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v14 = v12;
          }
          if (v14)
          {
            long long v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v28, v14);
            long long v10 = (char *)__p;
            uint64_t v3 = v27;
          }
          else
          {
            long long v15 = 0;
          }
          char v16 = &v15[8 * v11];
          *(void *)char v16 = *(void *)(v7 + 8);
          id v9 = v16 + 8;
          while (v3 != v10)
          {
            uint64_t v17 = *((void *)v3 - 1);
            v3 -= 8;
            *((void *)v16 - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v17;
            v16 -= 8;
          }
          std::string __p = v16;
          uint64_t v27 = v9;
          uint64_t v28 = &v15[8 * v14];
          if (v10) {
            operator delete(v10);
          }
        }
        else
        {
          *(void *)uint64_t v3 = *(void *)(v7 + 8);
          id v9 = v3 + 8;
        }
        uint64_t v27 = v9;
        uint64_t v6 = a2[1];
        uint64_t v3 = v9;
      }
      v7 += 24;
    }
    while (v7 != v6);
    if (v3 == __p)
    {
      uint64_t v3 = (char *)__p;
      goto LABEL_34;
    }
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v23, __p, (uint64_t)v3, (v3 - (unsigned char *)__p) >> 3);
    if (v24 == v23)
    {
      double v21 = 0.0;
      if (!v23) {
        goto LABEL_30;
      }
    }
    else
    {
      double v18 = 0.0;
      id v19 = v23;
      do
      {
        double v20 = *v19++;
        double v18 = v18 + v20;
      }
      while (v19 != v24);
      double v21 = v18 / (double)(unint64_t)(v24 - v23);
      if (!v23) {
        goto LABEL_30;
      }
    }
    uint64_t v24 = v23;
    operator delete(v23);
LABEL_30:
    if (v21 > v5) {
      double v5 = v21;
    }
    uint64_t v3 = (char *)__p;
LABEL_34:
    uint64_t v27 = v3;
    ++v4;
  }
  while (v4 != 3);
  if (v3) {
    operator delete(v3);
  }
  return v5;
}

void sub_19E021A7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double BtProxMedianOfMeanOfChanFilter::FilterSamples(uint64_t a1, uint64_t *a2)
{
  if (a2[1] == *a2) {
    return -200.0;
  }
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  std::string __p = 0;
  uint64_t v47 = 0;
  v48 = 0;
  int v43 = 0;
  v44 = 0;
  uint64_t v45 = 0;
  do
  {
    uint64_t v6 = *a2;
    uint64_t v5 = a2[1];
    if (v5 == *a2) {
      goto LABEL_50;
    }
    int v7 = bTAdvChans[v4];
    do
    {
      if (*(_DWORD *)(v6 + 16) == v7)
      {
        if (v3 >= v48)
        {
          id v9 = (char *)__p;
          uint64_t v10 = (v3 - (unsigned char *)__p) >> 3;
          unint64_t v11 = v10 + 1;
          if ((unint64_t)(v10 + 1) >> 61) {
            std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v12 = v48 - (unsigned char *)__p;
          if ((v48 - (unsigned char *)__p) >> 2 > v11) {
            unint64_t v11 = v12 >> 2;
          }
          if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v13 = v11;
          }
          if (v13)
          {
            unint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v48, v13);
            id v9 = (char *)__p;
            uint64_t v3 = v47;
          }
          else
          {
            unint64_t v14 = 0;
          }
          long long v15 = &v14[8 * v10];
          *(void *)long long v15 = *(void *)(v6 + 8);
          int v8 = v15 + 8;
          while (v3 != v9)
          {
            uint64_t v16 = *((void *)v3 - 1);
            v3 -= 8;
            *((void *)v15 - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v16;
            v15 -= 8;
          }
          std::string __p = v15;
          uint64_t v47 = v8;
          v48 = &v14[8 * v13];
          if (v9) {
            operator delete(v9);
          }
        }
        else
        {
          *(void *)uint64_t v3 = *(void *)(v6 + 8);
          int v8 = v3 + 8;
        }
        uint64_t v47 = v8;
        uint64_t v5 = a2[1];
        uint64_t v3 = v8;
      }
      v6 += 24;
    }
    while (v6 != v5);
    if (v3 == __p)
    {
      uint64_t v3 = (char *)__p;
      goto LABEL_50;
    }
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v40, __p, (uint64_t)v3, (v3 - (unsigned char *)__p) >> 3);
    if (v41 == v40)
    {
      double v20 = 0.0;
      if (!v40) {
        goto LABEL_30;
      }
    }
    else
    {
      double v17 = 0.0;
      double v18 = v40;
      do
      {
        double v19 = *v18++;
        double v17 = v17 + v19;
      }
      while (v18 != v41);
      double v20 = v17 / (double)(unint64_t)(v41 - v40);
      if (!v40) {
        goto LABEL_30;
      }
    }
    uint64_t v41 = v40;
    operator delete(v40);
LABEL_30:
    double v21 = v44;
    if (v44 >= v45)
    {
      uint64_t v23 = (double *)v43;
      uint64_t v24 = ((char *)v44 - (unsigned char *)v43) >> 3;
      unint64_t v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) >> 61) {
        std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v26 = (char *)v45 - (unsigned char *)v43;
      if (((char *)v45 - (unsigned char *)v43) >> 2 > v25) {
        unint64_t v25 = v26 >> 2;
      }
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v27 = v25;
      }
      if (v27)
      {
        uint64_t v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v45, v27);
        uint64_t v23 = (double *)v43;
        double v21 = v44;
      }
      else
      {
        uint64_t v28 = 0;
      }
      char v29 = (double *)&v28[8 * v24];
      *char v29 = v20;
      unint64_t v22 = v29 + 1;
      while (v21 != v23)
      {
        uint64_t v30 = *((void *)v21-- - 1);
        *((void *)v29-- - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v30;
      }
      int v43 = v29;
      v44 = v22;
      uint64_t v45 = (double *)&v28[8 * v27];
      if (v23) {
        operator delete(v23);
      }
    }
    else
    {
      double *v44 = v20;
      unint64_t v22 = v21 + 1;
    }
    v44 = v22;
    uint64_t v3 = (char *)__p;
LABEL_50:
    uint64_t v47 = v3;
    ++v4;
  }
  while (v4 != 3);
  uint64_t v31 = ((char *)v44 - (unsigned char *)v43) >> 3;
  switch(v31)
  {
    case 1:
      double v33 = *(double *)v43;
      goto LABEL_75;
    case 2:
      double v33 = (*(double *)v43 + *((double *)v43 + 1)) * 0.5;
      goto LABEL_75;
    case 3:
      double v33 = *(double *)v43;
      double v32 = *((double *)v43 + 1);
      double v34 = *((double *)v43 + 2);
      if ((*(double *)v43 < v32 || v33 > v34) && (v33 > v32 || v33 < v34))
      {
        BOOL v37 = v33 > v32;
        BOOL v38 = v33 < v32;
        if (v32 > v34) {
          BOOL v37 = 1;
        }
        if (v32 < v34) {
          BOOL v38 = 1;
        }
        if (v37 && v38) {
          double v33 = *((double *)v43 + 2);
        }
        else {
          double v33 = *((double *)v43 + 1);
        }
      }
LABEL_75:
      v44 = (double *)v43;
      operator delete(v43);
      uint64_t v3 = (char *)__p;
      break;
    default:
      double v33 = -200.0;
      if (v43) {
        goto LABEL_75;
      }
      break;
  }
  if (v3)
  {
    uint64_t v47 = v3;
    operator delete(v3);
  }
  return v33;
}

void sub_19E021DFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a16) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

double BtProxOlympicFilter::FilterSamples(uint64_t a1, long long **a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)v2 - (char *)*a2) >> 3);
  if (v4 <= 2 * *(int *)(a1 + 32))
  {
    if (v2 == v3) {
      return 0.0;
    }
    uint64_t v16 = 0;
    double v17 = 0;
    uint64_t v18 = 0;
    std::vector<BtProxData>::__init_with_size[abi:ne180100]<BtProxData*,BtProxData*>(&v16, v3, (uint64_t)v2, v4);
    if (v17 == v16)
    {
      double v14 = 0.0;
      if (!v16) {
        return v14;
      }
    }
    else
    {
      double v12 = 0.0;
      unint64_t v13 = v16;
      do
      {
        double v12 = v12 + v13[1];
        v13 += 3;
      }
      while (v13 != v17);
      double v14 = v12 / (double)(0xAAAAAAAAAAAAAAABLL * (v17 - v16));
      if (!v16) {
        return v14;
      }
    }
    double v17 = v16;
    operator delete(v16);
    return v14;
  }
  double v19 = BtProximityFilterBase::RssiCompare;
  unint64_t v7 = 126 - 2 * __clz(v4);
  if (v2 == v3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,false>((uint64_t)v3, v2, (uint64_t (**)(long long *, long long *))&v19, v8, 1);
  uint64_t v9 = *(int *)(a1 + 32);
  uint64_t v10 = (double *)v3 + 3 * (int)v9;
  double v11 = 0.0;
  while (v10 != (double *)((char *)v2 - 24 * v9))
  {
    double v11 = v11 + v10[1];
    v10 += 3;
  }
  return v11 / (double)(0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3) - 2 * v9);
}

double BtProxRayleighFilter::FilterSamples(uint64_t a1, uint64_t *a2)
{
  std::string __p = 0;
  unint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v2 = *a2;
  if (a2[1] == *a2) {
    return 0.0;
  }
  unint64_t v4 = 0;
  do
  {
    double v5 = __exp10(*(double *)(v2 + 24 * v4 + 8) / 10.0);
    double v6 = v5;
    unint64_t v7 = v27;
    if (v27 >= v28)
    {
      uint64_t v9 = (double *)__p;
      uint64_t v10 = ((char *)v27 - (unsigned char *)__p) >> 3;
      unint64_t v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 61) {
        std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = (char *)v28 - (unsigned char *)__p;
      if (((char *)v28 - (unsigned char *)__p) >> 2 > v11) {
        unint64_t v11 = v12 >> 2;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13)
      {
        double v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v28, v13);
        uint64_t v9 = (double *)__p;
        unint64_t v7 = v27;
      }
      else
      {
        double v14 = 0;
      }
      long long v15 = (double *)&v14[8 * v10];
      *long long v15 = v6;
      uint64_t v8 = (uint64_t)(v15 + 1);
      while (v7 != v9)
      {
        uint64_t v16 = *((void *)v7-- - 1);
        *((void *)v15-- - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v16;
      }
      std::string __p = v15;
      unint64_t v27 = (double *)v8;
      uint64_t v28 = (double *)&v14[8 * v13];
      if (v9) {
        operator delete(v9);
      }
    }
    else
    {
      double *v27 = v5;
      uint64_t v8 = (uint64_t)(v7 + 1);
    }
    unint64_t v27 = (double *)v8;
    ++v4;
    uint64_t v2 = *a2;
  }
  while (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) > v4);
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v23 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v23, __p, v8, (v8 - (uint64_t)__p) >> 3);
  if (v24 == v23)
  {
    double v20 = 0.0;
    if (v23)
    {
LABEL_24:
      uint64_t v24 = v23;
      operator delete(v23);
    }
  }
  else
  {
    double v17 = 0.0;
    uint64_t v18 = v23;
    do
    {
      double v19 = *v18++;
      double v17 = v17 + v19;
    }
    while (v18 != v24);
    double v20 = v17 / (double)(unint64_t)(v24 - v23) * 0.797884561;
    if (v23) {
      goto LABEL_24;
    }
  }
  double v21 = log10(v20) * 10.0;
  if (__p)
  {
    unint64_t v27 = (double *)__p;
    operator delete(__p);
  }
  return v21;
}

void sub_19E0221A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<BtProxData>::__init_with_size[abi:ne180100]<BtProxData*,BtProxData*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    double v6 = result;
    double result = std::vector<BtProxData>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_19E022534(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,false>(uint64_t a1, long long *a2, uint64_t (**a3)(long long *, long long *), uint64_t a4, char a5)
{
LABEL_1:
  unint64_t v11 = (long long *)((char *)a2 - 24);
  uint64_t v12 = (long long *)a1;
LABEL_2:
  uint64_t v13 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t)v12;
    uint64_t v14 = v13;
    uint64_t v15 = (char *)a2 - (char *)v12;
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v12) >> 3);
    if (!(!v6 & v5))
    {
      switch(v16)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          double v32 = *a3;
          uint64_t v33 = *((void *)a2 - 1);
          long long v43 = *(long long *)((char *)a2 - 24);
          uint64_t v44 = v33;
          uint64_t v34 = *((void *)v12 + 2);
          long long v41 = *v12;
          uint64_t v42 = v34;
          if (v32(&v43, &v41))
          {
            long long v35 = *v12;
            uint64_t v46 = *((void *)v12 + 2);
            long long v45 = v35;
            long long v36 = *v11;
            *((void *)v12 + 2) = *((void *)a2 - 1);
            long long *v12 = v36;
            long long *v11 = v45;
            *((void *)a2 - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v46;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(v12, (long long *)((char *)v12 + 24), (long long *)((char *)a2 - 24), a3);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)v12, (uint64_t)v12 + 24, (uint64_t)(v12 + 3), (long long *)((char *)a2 - 24), a3);
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)v12, (uint64_t)v12 + 24, (uint64_t)(v12 + 3), (uint64_t)v12 + 72, (long long *)((char *)a2 - 24), a3);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v15 <= 575)
    {
      if (a5) {
        std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)v12, (uint64_t)a2, a3);
      }
      else {
        std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)v12, (uint64_t)a2, a3);
      }
      return;
    }
    if (v14 == 1) {
      break;
    }
    unint64_t v17 = v16 >> 1;
    uint64_t v18 = (long long *)((char *)v12 + 24 * (v16 >> 1));
    if ((unint64_t)v15 >= 0xC01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(v12, (long long *)((char *)v12 + 24 * (v16 >> 1)), (long long *)((char *)a2 - 24), a3);
      uint64_t v19 = 3 * v17;
      double v20 = (long long *)((char *)v12 + 24 * v17 - 24);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((long long *)((char *)v12 + 24), v20, a2 - 3, a3);
      double v21 = v12 + 3;
      unint64_t v22 = (long long *)((char *)v12 + 8 * v19 + 24);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(v21, v22, (long long *)((char *)a2 - 72), a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(v20, v18, v22, a3);
      long long v23 = *(_OWORD *)a1;
      uint64_t v46 = *(void *)(a1 + 16);
      long long v45 = v23;
      long long v24 = *v18;
      *(void *)(a1 + 16) = *((void *)v18 + 2);
      *(_OWORD *)a1 = v24;
      long long v25 = v45;
      *((void *)v18 + 2) = v46;
      long long *v18 = v25;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((long long *)((char *)v12 + 24 * (v16 >> 1)), v12, (long long *)((char *)a2 - 24), a3);
      if (a5) {
        goto LABEL_13;
      }
    }
    uint64_t v26 = *a3;
    uint64_t v27 = *(void *)(a1 - 8);
    long long v39 = *(_OWORD *)(a1 - 24);
    uint64_t v40 = v27;
    uint64_t v28 = *(void *)(a1 + 16);
    long long v37 = *(_OWORD *)a1;
    uint64_t v38 = v28;
    if ((v26(&v39, &v37) & 1) == 0)
    {
      uint64_t v12 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,BtProxData *,BOOL (*&)(BtProxData,BtProxData)>((long long *)a1, a2, a3);
      goto LABEL_18;
    }
LABEL_13:
    uint64_t v29 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,BtProxData *,BOOL (*&)(BtProxData,BtProxData)>((long long *)a1, (unint64_t)a2, a3);
    if ((v30 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v31 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(a1, v29, a3);
    uint64_t v12 = (long long *)(v29 + 24);
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(v29 + 24, (uint64_t)a2, a3))
    {
      a4 = -v14;
      a2 = (long long *)v29;
      if (v31) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v13 = v14 + 1;
    if (!v31)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,false>(a1, v29, a3, -v14, a5 & 1);
      uint64_t v12 = (long long *)(v29 + 24);
LABEL_18:
      a5 = 0;
      a4 = -v14;
      goto LABEL_2;
    }
  }
  if (v12 != a2) {
    std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,BtProxData*>((__n128 *)v12, (__n128 *)a2, (__n128 *)a2, (unsigned int (**)(__n128 *, long long *))a3);
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t result, uint64_t a2, uint64_t (**a3)(long long *, long long *))
{
  if (result != a2)
  {
    uint64_t v28 = v3;
    uint64_t v29 = v4;
    uint64_t v6 = result;
    uint64_t v7 = result + 24;
    if (result + 24 != a2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = result;
      do
      {
        uint64_t v11 = v10;
        uint64_t v10 = v7;
        uint64_t v12 = *a3;
        long long v26 = *(_OWORD *)v10;
        uint64_t v27 = *(void *)(v10 + 16);
        uint64_t v13 = *(void *)(v11 + 16);
        long long v24 = *(_OWORD *)v11;
        uint64_t v25 = v13;
        double result = v12(&v26, &v24);
        if (result)
        {
          long long v22 = *(_OWORD *)v10;
          uint64_t v23 = *(void *)(v10 + 16);
          uint64_t v14 = v9;
          while (1)
          {
            uint64_t v15 = v6 + v14;
            *(_OWORD *)(v15 + 24) = *(_OWORD *)(v6 + v14);
            *(void *)(v15 + 4TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = *(void *)(v6 + v14 + 16);
            if (!v14) {
              break;
            }
            unint64_t v16 = *a3;
            long long v20 = v22;
            uint64_t v21 = v23;
            long long v18 = *(_OWORD *)(v15 - 24);
            uint64_t v19 = *(void *)(v15 - 8);
            double result = v16(&v20, &v18);
            v14 -= 24;
            if ((result & 1) == 0)
            {
              uint64_t v17 = v6 + v14 + 24;
              goto LABEL_10;
            }
          }
          uint64_t v17 = v6;
LABEL_10:
          *(_OWORD *)uint64_t v17 = v22;
          *(void *)(v17 + 16) = v23;
        }
        uint64_t v7 = v10 + 24;
        v9 += 24;
      }
      while (v10 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t result, uint64_t a2, uint64_t (**a3)(long long *, long long *))
{
  if (result != a2)
  {
    uint64_t v25 = v3;
    uint64_t v26 = v4;
    uint64_t v6 = result;
    for (uint64_t i = result + 24; v6 + 24 != a2; uint64_t i = v6 + 24)
    {
      uint64_t v9 = v6;
      uint64_t v6 = i;
      uint64_t v10 = *a3;
      long long v23 = *(_OWORD *)v6;
      uint64_t v24 = *(void *)(v6 + 16);
      uint64_t v11 = *(void *)(v9 + 16);
      long long v21 = *(_OWORD *)v9;
      uint64_t v22 = v11;
      double result = v10(&v23, &v21);
      if (result)
      {
        long long v19 = *(_OWORD *)v6;
        uint64_t v20 = *(void *)(v6 + 16);
        uint64_t v12 = v6;
        do
        {
          uint64_t v13 = v12 - 24;
          *(_OWORD *)uint64_t v12 = *(_OWORD *)(v12 - 24);
          *(void *)(v12 + 16) = *(void *)(v12 - 8);
          uint64_t v14 = *a3;
          long long v17 = v19;
          uint64_t v18 = v20;
          long long v15 = *(_OWORD *)(v12 - 48);
          uint64_t v16 = *(void *)(v12 - 32);
          double result = v14(&v17, &v15);
          uint64_t v12 = v13;
        }
        while ((result & 1) != 0);
        *(_OWORD *)uint64_t v13 = v19;
        *(void *)(v13 + 16) = v20;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(long long *a1, long long *a2, long long *a3, uint64_t (**a4)(long long *, long long *))
{
  size_t v8 = *a4;
  long long v49 = *a2;
  uint64_t v50 = *((void *)a2 + 2);
  long long v47 = *a1;
  uint64_t v48 = *((void *)a1 + 2);
  char v9 = v8(&v49, &v47);
  uint64_t v10 = *a4;
  if ((v9 & 1) == 0)
  {
    long long v45 = *a3;
    uint64_t v46 = *((void *)a3 + 2);
    long long v43 = *a2;
    uint64_t v44 = *((void *)a2 + 2);
    uint64_t result = v10(&v45, &v43);
    if (!result) {
      return result;
    }
    uint64_t v15 = *((void *)a2 + 2);
    long long v16 = *a2;
    uint64_t v17 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v17;
    *a3 = v16;
    *((void *)a3 + 2) = v15;
    uint64_t v18 = *a4;
    uint64_t v42 = *((void *)a2 + 2);
    long long v41 = *a2;
    long long v19 = *a1;
    uint64_t v40 = *((void *)a1 + 2);
    long long v39 = v19;
    if (!v18(&v41, &v39)) {
      return 1;
    }
    uint64_t v20 = *((void *)a1 + 2);
    long long v21 = *a1;
    uint64_t v22 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v22;
    *a2 = v21;
    *((void *)a2 + 2) = v20;
    return 2;
  }
  long long v37 = *a3;
  uint64_t v38 = *((void *)a3 + 2);
  long long v35 = *a2;
  uint64_t v36 = *((void *)a2 + 2);
  if (!v10(&v37, &v35))
  {
    uint64_t v23 = *((void *)a1 + 2);
    long long v24 = *a1;
    uint64_t v25 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v25;
    *a2 = v24;
    *((void *)a2 + 2) = v23;
    uint64_t v26 = *a4;
    uint64_t v34 = *((void *)a3 + 2);
    long long v33 = *a3;
    long long v27 = *a2;
    uint64_t v32 = *((void *)a2 + 2);
    long long v31 = v27;
    if (!v26(&v33, &v31)) {
      return 1;
    }
    uint64_t v28 = *((void *)a2 + 2);
    long long v29 = *a2;
    uint64_t v30 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v30;
    *a3 = v29;
    *((void *)a3 + 2) = v28;
    return 2;
  }
  uint64_t v11 = *((void *)a1 + 2);
  long long v12 = *a1;
  uint64_t v13 = *((void *)a3 + 2);
  *a1 = *a3;
  *((void *)a1 + 2) = v13;
  *a3 = v12;
  *((void *)a3 + 2) = v11;
  return 1;
}

long long *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,BtProxData *,BOOL (*&)(BtProxData,BtProxData)>(long long *a1, long long *a2, uint64_t (**a3)(long long *, long long *))
{
  uint64_t v4 = a2;
  long long v53 = *a1;
  uint64_t v54 = *((void *)a1 + 2);
  uint64_t v6 = *a3;
  long long v51 = v53;
  uint64_t v52 = v54;
  long long v49 = *(long long *)((char *)a2 - 24);
  uint64_t v50 = *((void *)a2 - 1);
  if (v6(&v51, &v49))
  {
    uint64_t v7 = a1;
    do
    {
      size_t v8 = (long long *)((char *)v7 + 24);
      char v9 = *a3;
      long long v47 = v53;
      uint64_t v48 = v54;
      long long v45 = *(long long *)((char *)v7 + 24);
      uint64_t v46 = *((void *)v7 + 5);
      char v10 = v9(&v47, &v45);
      uint64_t v7 = v8;
    }
    while ((v10 & 1) == 0);
  }
  else
  {
    uint64_t v11 = (long long *)((char *)a1 + 24);
    do
    {
      size_t v8 = v11;
      if (v11 >= v4) {
        break;
      }
      long long v12 = *a3;
      long long v43 = v53;
      uint64_t v44 = v54;
      long long v41 = *v8;
      uint64_t v42 = *((void *)v8 + 2);
      int v13 = v12(&v43, &v41);
      uint64_t v11 = (long long *)((char *)v8 + 24);
    }
    while (!v13);
  }
  if (v8 >= v4)
  {
    uint64_t v14 = v4;
  }
  else
  {
    do
    {
      uint64_t v14 = (long long *)((char *)v4 - 24);
      uint64_t v15 = *a3;
      long long v39 = v53;
      uint64_t v40 = v54;
      long long v37 = *(long long *)((char *)v4 - 24);
      uint64_t v38 = *((void *)v4 - 1);
      uint64_t v4 = (long long *)((char *)v4 - 24);
    }
    while ((v15(&v39, &v37) & 1) != 0);
  }
  while (v8 < v14)
  {
    long long v16 = *v8;
    uint64_t v56 = *((void *)v8 + 2);
    long long v55 = v16;
    long long v17 = *v14;
    *((void *)v8 + 2) = *((void *)v14 + 2);
    *size_t v8 = v17;
    long long v18 = v55;
    *((void *)v14 + 2) = v56;
    *uint64_t v14 = v18;
    do
    {
      long long v35 = v53;
      uint64_t v36 = v54;
      uint64_t v19 = *((void *)v8 + 5);
      long long v20 = *(long long *)((char *)v8 + 24);
      size_t v8 = (long long *)((char *)v8 + 24);
      long long v21 = *a3;
      long long v33 = v20;
      uint64_t v34 = v19;
    }
    while (!v21(&v35, &v33));
    do
    {
      long long v31 = v53;
      uint64_t v32 = v54;
      uint64_t v22 = *((void *)v14 - 1);
      long long v23 = *(long long *)((char *)v14 - 24);
      uint64_t v14 = (long long *)((char *)v14 - 24);
      long long v24 = *a3;
      long long v29 = v23;
      uint64_t v30 = v22;
    }
    while ((v24(&v31, &v29) & 1) != 0);
  }
  uint64_t v25 = (long long *)((char *)v8 - 24);
  if ((long long *)((char *)v8 - 24) != a1)
  {
    long long v26 = *v25;
    *((void *)a1 + 2) = *((void *)v8 - 1);
    *a1 = v26;
  }
  long long v27 = v53;
  *((void *)v8 - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v54;
  long long *v25 = v27;
  return v8;
}

uint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,BtProxData *,BOOL (*&)(BtProxData,BtProxData)>(long long *a1, unint64_t a2, uint64_t (**a3)(long long *, long long *))
{
  uint64_t v6 = 0;
  long long v47 = *a1;
  uint64_t v48 = *((void *)a1 + 2);
  do
  {
    uint64_t v7 = *a3;
    long long v45 = *(long long *)((char *)a1 + v6 + 24);
    uint64_t v46 = *(void *)((char *)a1 + v6 + 40);
    long long v43 = v47;
    uint64_t v44 = v48;
    v6 += 24;
  }
  while ((v7(&v45, &v43) & 1) != 0);
  size_t v8 = (long long *)((char *)a1 + v6);
  uint64_t v9 = (uint64_t)a1 + v6 - 24;
  if (v6 == 24)
  {
    while ((unint64_t)v8 < a2)
    {
      long long v12 = *a3;
      unint64_t v10 = a2 - 24;
      long long v41 = *(_OWORD *)(a2 - 24);
      uint64_t v42 = *(void *)(a2 - 8);
      long long v39 = v47;
      uint64_t v40 = v48;
      a2 -= 24;
      if (v12(&v41, &v39)) {
        goto LABEL_9;
      }
    }
    unint64_t v10 = a2;
  }
  else
  {
    do
    {
      unint64_t v10 = a2 - 24;
      uint64_t v11 = *a3;
      long long v37 = *(_OWORD *)(a2 - 24);
      uint64_t v38 = *(void *)(a2 - 8);
      long long v35 = v47;
      uint64_t v36 = v48;
      a2 -= 24;
    }
    while (!v11(&v37, &v35));
  }
LABEL_9:
  if ((unint64_t)v8 < v10)
  {
    int v13 = v8;
    unint64_t v14 = v10;
    do
    {
      long long v49 = *v13;
      long long v15 = v49;
      uint64_t v50 = *((void *)v13 + 2);
      uint64_t v16 = v50;
      uint64_t v17 = *(void *)(v14 + 16);
      long long *v13 = *(_OWORD *)v14;
      *((void *)v13 + 2) = v17;
      *(void *)(v14 + 16) = v16;
      *(_OWORD *)unint64_t v14 = v15;
      do
      {
        uint64_t v18 = *((void *)v13 + 5);
        long long v19 = *(long long *)((char *)v13 + 24);
        int v13 = (long long *)((char *)v13 + 24);
        long long v20 = *a3;
        long long v33 = v19;
        uint64_t v34 = v18;
        long long v31 = v47;
        uint64_t v32 = v48;
      }
      while ((v20(&v33, &v31) & 1) != 0);
      do
      {
        uint64_t v21 = *(void *)(v14 - 8);
        long long v22 = *(_OWORD *)(v14 - 24);
        v14 -= 24;
        long long v23 = *a3;
        long long v29 = v22;
        uint64_t v30 = v21;
        long long v27 = v47;
        uint64_t v28 = v48;
      }
      while (!v23(&v29, &v27));
    }
    while ((unint64_t)v13 < v14);
    uint64_t v9 = (uint64_t)v13 - 24;
  }
  if ((long long *)v9 != a1)
  {
    long long v24 = *(_OWORD *)v9;
    *((void *)a1 + 2) = *(void *)(v9 + 16);
    *a1 = v24;
  }
  long long v25 = v47;
  *(void *)(v9 + 16) = v48;
  *(_OWORD *)uint64_t v9 = v25;
  return v9;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(long long *, long long *))
{
  uint64_t v6 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      size_t v8 = *a3;
      long long v35 = *(_OWORD *)(a2 - 24);
      uint64_t v36 = *(void *)(a2 - 8);
      long long v33 = *(_OWORD *)a1;
      uint64_t v34 = *(void *)(a1 + 16);
      if (v8(&v35, &v33))
      {
        uint64_t v9 = a2 - 24;
        uint64_t v10 = *(void *)(a1 + 16);
        long long v11 = *(_OWORD *)a1;
        uint64_t v12 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 24);
        *(void *)(a1 + 16) = v12;
        *(_OWORD *)uint64_t v9 = v11;
        *(void *)(v9 + 16) = v10;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((long long *)a1, (long long *)(a1 + 24), (long long *)(a2 - 24), a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(a1, a1 + 24, a1 + 48, (long long *)(a2 - 24), a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(a1, a1 + 24, a1 + 48, a1 + 72, (long long *)(a2 - 24), a3);
      return 1;
    default:
      uint64_t v13 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((long long *)a1, (long long *)(a1 + 24), (long long *)(a1 + 48), a3);
      uint64_t v14 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v15 = 0;
      int v16 = 0;
      break;
  }
  while (1)
  {
    uint64_t v17 = *a3;
    long long v31 = *(_OWORD *)v14;
    uint64_t v32 = *(void *)(v14 + 16);
    uint64_t v18 = *(void *)(v13 + 16);
    long long v29 = *(_OWORD *)v13;
    uint64_t v30 = v18;
    if (v17(&v31, &v29))
    {
      long long v27 = *(_OWORD *)v14;
      uint64_t v28 = *(void *)(v14 + 16);
      uint64_t v19 = v15;
      while (1)
      {
        uint64_t v20 = a1 + v19;
        *(_OWORD *)(v20 + 72) = *(_OWORD *)(a1 + v19 + 48);
        *(void *)(v20 + 88) = *(void *)(a1 + v19 + 64);
        if (v19 == -48) {
          break;
        }
        uint64_t v21 = *a3;
        long long v25 = v27;
        uint64_t v26 = v28;
        long long v23 = *(_OWORD *)(v20 + 24);
        uint64_t v24 = *(void *)(v20 + 40);
        v19 -= 24;
        if ((v21(&v25, &v23) & 1) == 0)
        {
          uint64_t v22 = a1 + v19 + 72;
          goto LABEL_12;
        }
      }
      uint64_t v22 = a1;
LABEL_12:
      *(_OWORD *)uint64_t v22 = v27;
      *(void *)(v22 + 16) = v28;
      if (++v16 == 8) {
        return v14 + 24 == a2;
      }
    }
    uint64_t v13 = v14;
    v15 += 24;
    v14 += 24;
    if (v14 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, uint64_t (**a5)(long long *, long long *))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((long long *)a1, (long long *)a2, (long long *)a3, a5);
  uint64_t v10 = *a5;
  long long v34 = *a4;
  uint64_t v35 = *((void *)a4 + 2);
  long long v32 = *(_OWORD *)a3;
  uint64_t v33 = *(void *)(a3 + 16);
  if (v10(&v34, &v32))
  {
    uint64_t v12 = *(void *)(a3 + 16);
    long long v13 = *(_OWORD *)a3;
    uint64_t v14 = *((void *)a4 + 2);
    *(_OWORD *)a3 = *a4;
    *(void *)(a3 + 16) = v14;
    *a4 = v13;
    *((void *)a4 + 2) = v12;
    uint64_t v15 = *a5;
    uint64_t v31 = *(void *)(a3 + 16);
    long long v30 = *(_OWORD *)a3;
    long long v16 = *(_OWORD *)a2;
    uint64_t v29 = *(void *)(a2 + 16);
    long long v28 = v16;
    if (v15(&v30, &v28))
    {
      uint64_t v17 = *(void *)(a2 + 16);
      long long v18 = *(_OWORD *)a2;
      uint64_t v19 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v19;
      *(_OWORD *)a3 = v18;
      *(void *)(a3 + 16) = v17;
      uint64_t v20 = *a5;
      uint64_t v27 = *(void *)(a2 + 16);
      long long v26 = *(_OWORD *)a2;
      long long v21 = *(_OWORD *)a1;
      uint64_t v25 = *(void *)(a1 + 16);
      long long v24 = v21;
      if (v20(&v26, &v24))
      {
        uint64_t v22 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v23 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v23;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v22;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t (**a6)(long long *, long long *))
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(a1, a2, a3, (long long *)a4, a6);
  uint64_t v12 = *a6;
  long long v45 = *a5;
  uint64_t v46 = *((void *)a5 + 2);
  long long v43 = *(_OWORD *)a4;
  uint64_t v44 = *(void *)(a4 + 16);
  if (v12(&v45, &v43))
  {
    uint64_t v14 = *(void *)(a4 + 16);
    long long v15 = *(_OWORD *)a4;
    uint64_t v16 = *((void *)a5 + 2);
    *(_OWORD *)a4 = *a5;
    *(void *)(a4 + 16) = v16;
    *a5 = v15;
    *((void *)a5 + 2) = v14;
    uint64_t v17 = *a6;
    uint64_t v42 = *(void *)(a4 + 16);
    long long v41 = *(_OWORD *)a4;
    long long v18 = *(_OWORD *)a3;
    uint64_t v40 = *(void *)(a3 + 16);
    long long v39 = v18;
    if (v17(&v41, &v39))
    {
      uint64_t v19 = *(void *)(a3 + 16);
      long long v20 = *(_OWORD *)a3;
      uint64_t v21 = *(void *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(void *)(a3 + 16) = v21;
      *(_OWORD *)a4 = v20;
      *(void *)(a4 + 16) = v19;
      uint64_t v22 = *a6;
      uint64_t v38 = *(void *)(a3 + 16);
      long long v37 = *(_OWORD *)a3;
      __n128 v23 = *(__n128 *)a2;
      uint64_t v36 = *(void *)(a2 + 16);
      __n128 v35 = v23;
      if (v22(&v37, (long long *)&v35))
      {
        uint64_t v24 = *(void *)(a2 + 16);
        __n128 v25 = *(__n128 *)a2;
        uint64_t v26 = *(void *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(void *)(a2 + 16) = v26;
        *(__n128 *)a3 = v25;
        *(void *)(a3 + 16) = v24;
        uint64_t v27 = *a6;
        uint64_t v34 = *(void *)(a2 + 16);
        __n128 v33 = *(__n128 *)a2;
        __n128 v28 = *(__n128 *)a1;
        uint64_t v32 = *(void *)(a1 + 16);
        __n128 v31 = v28;
        if (v27((long long *)&v33, (long long *)&v31))
        {
          uint64_t v29 = *(void *)(a1 + 16);
          __n128 result = *(__n128 *)a1;
          uint64_t v30 = *(void *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(void *)(a1 + 16) = v30;
          *(__n128 *)a2 = result;
          *(void *)(a2 + 16) = v29;
        }
      }
    }
  }
  return result;
}

__n128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,BtProxData*>(__n128 *a1, __n128 *a2, __n128 *a3, unsigned int (**a4)(__n128 *, long long *))
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) / 24;
    if ((char *)a2 - (char *)a1 >= 25)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = (__n128 *)((char *)a1 + 24 * v10);
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)a1, a4, v9, v12);
        uint64_t v12 = (__n128 *)((char *)v12 - 24);
        --v11;
      }
      while (v11);
    }
    long long v13 = a2;
    if (a2 != a3)
    {
      uint64_t v14 = a2;
      do
      {
        long long v15 = *a4;
        __n128 v27 = *v14;
        uint64_t v28 = v14[1].n128_i64[0];
        __n128 v25 = *a1;
        unint64_t v26 = a1[1].n128_u64[0];
        if (v15(&v27, (long long *)&v25))
        {
          unint64_t v16 = v14[1].n128_u64[0];
          __n128 v17 = *v14;
          unint64_t v18 = a1[1].n128_u64[0];
          *uint64_t v14 = *a1;
          v14[1].n128_u64[0] = v18;
          *a1 = v17;
          a1[1].n128_u64[0] = v16;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)a1, a4, v9, a1);
        }
        uint64_t v14 = (__n128 *)((char *)v14 + 24);
      }
      while (v14 != a3);
      long long v13 = a3;
    }
    if (v8 >= 25)
    {
      int64_t v19 = v8 / 0x18uLL;
      long long v20 = (__n128 *)((char *)a2 - 24);
      do
      {
        __n128 v29 = *a1;
        unint64_t v30 = a1[1].n128_u64[0];
        uint64_t v21 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)a1, (unsigned int (**)(long long *, long long *))a4, v19);
        if (v20 == (__n128 *)v21)
        {
          *(__n128 *)uint64_t v21 = v29;
          *(void *)(v21 + 16) = v30;
        }
        else
        {
          __n128 v22 = *v20;
          *(void *)(v21 + 16) = v20[1].n128_u64[0];
          *(__n128 *)uint64_t v21 = v22;
          *long long v20 = v29;
          v20[1].n128_u64[0] = v30;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)a1, v21 + 24, (unsigned int (**)(long long *, long long *))a4, 0xAAAAAAAAAAAAAAABLL * ((v21 + 24 - (uint64_t)a1) >> 3));
        }
        long long v20 = (__n128 *)((char *)v20 - 24);
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, unsigned int (**a2)(__n128 *, long long *), uint64_t a3, __n128 *a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v41 = v4;
    uint64_t v42 = v5;
    uint64_t v7 = a4;
    uint64_t v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      uint64_t v12 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
      uint64_t v13 = a1 + 24 * v12;
      uint64_t v14 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
      if (v14 < a3)
      {
        long long v15 = *a2;
        __n128 v39 = *(__n128 *)v13;
        uint64_t v40 = *(void *)(v13 + 16);
        long long v37 = *(_OWORD *)(v13 + 24);
        uint64_t v38 = *(void *)(v13 + 40);
        if (v15(&v39, &v37))
        {
          v13 += 24;
          uint64_t v12 = v14;
        }
      }
      unint64_t v16 = (uint64_t (*)(__n128 *, __n128 *))*a2;
      __n128 v35 = *(__n128 *)v13;
      uint64_t v36 = *(void *)(v13 + 16);
      __n128 v33 = *v7;
      unint64_t v34 = v7[1].n128_u64[0];
      if ((v16(&v35, &v33) & 1) == 0)
      {
        __n128 v31 = *v7;
        unint64_t v32 = v7[1].n128_u64[0];
        do
        {
          unint64_t v18 = (__n128 *)v13;
          __n128 v19 = *(__n128 *)v13;
          v7[1].n128_u64[0] = *(void *)(v13 + 16);
          *uint64_t v7 = v19;
          if (v9 < v12) {
            break;
          }
          uint64_t v20 = (2 * v12) | 1;
          uint64_t v13 = a1 + 24 * v20;
          if (2 * v12 + 2 < a3)
          {
            uint64_t v21 = *a2;
            __n128 v29 = *(__n128 *)v13;
            uint64_t v30 = *(void *)(v13 + 16);
            long long v27 = *(_OWORD *)(v13 + 24);
            uint64_t v28 = *(void *)(v13 + 40);
            if (v21(&v29, &v27))
            {
              v13 += 24;
              uint64_t v20 = 2 * v12 + 2;
            }
          }
          __n128 v22 = *a2;
          __n128 v25 = *(__n128 *)v13;
          uint64_t v26 = *(void *)(v13 + 16);
          __n128 v23 = v31;
          unint64_t v24 = v32;
          uint64_t v7 = v18;
          uint64_t v12 = v20;
        }
        while (!v22(&v25, (long long *)&v23));
        __n128 result = v31;
        v18[1].n128_u64[0] = v32;
        __n128 *v18 = result;
      }
    }
  }
  return result;
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, unsigned int (**a2)(long long *, long long *), uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = a1 + 24 * v6 + 24;
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3)
    {
      uint64_t v12 = *a2;
      uint64_t v13 = *(void *)(v9 + 16);
      long long v19 = *(_OWORD *)v9;
      uint64_t v20 = v13;
      uint64_t v14 = *(void *)(v9 + 40);
      long long v17 = *(_OWORD *)(v9 + 24);
      uint64_t v18 = v14;
      if (v12(&v19, &v17))
      {
        v9 += 24;
        uint64_t v10 = v11;
      }
    }
    long long v15 = *(_OWORD *)v9;
    *(void *)(a1 + 16) = *(void *)(v9 + 16);
    *(_OWORD *)a1 = v15;
    a1 = v9;
    uint64_t v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, uint64_t a2, unsigned int (**a3)(long long *, long long *), uint64_t a4)
{
  unint64_t v6 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v29 = v4;
    uint64_t v30 = v5;
    unint64_t v10 = v6 >> 1;
    uint64_t v11 = (long long *)(a1 + 24 * (v6 >> 1));
    uint64_t v12 = *a3;
    long long v27 = *v11;
    uint64_t v28 = *((void *)v11 + 2);
    long long v25 = *(_OWORD *)(a2 - 24);
    uint64_t v26 = *(void *)(a2 - 8);
    if (v12(&v27, &v25))
    {
      uint64_t v14 = (long long *)(a2 - 24);
      long long v23 = *(_OWORD *)(a2 - 24);
      uint64_t v24 = *(void *)(a2 - 8);
      do
      {
        long long v15 = v11;
        long long v16 = *v11;
        *((void *)v14 + 2) = *((void *)v11 + 2);
        *uint64_t v14 = v16;
        if (!v10) {
          break;
        }
        unint64_t v10 = (v10 - 1) >> 1;
        uint64_t v11 = (long long *)(a1 + 24 * v10);
        long long v17 = *a3;
        long long v21 = *v11;
        uint64_t v22 = *((void *)v11 + 2);
        long long v19 = v23;
        uint64_t v20 = v24;
        char v18 = v17(&v21, &v19);
        uint64_t v14 = v15;
      }
      while ((v18 & 1) != 0);
      double result = *(double *)&v23;
      *long long v15 = v23;
      *((void *)v15 + 2) = v24;
    }
  }
  return result;
}

void *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    double result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_19E023CD0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

double SingleThresholdProx::Estimator::Estimator(SingleThresholdProx::Estimator *this, double a2, char a3)
{
  *(unsigned char *)this = 0;
  *((_DWORD *)this + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = LODWORD(a2);
  *((void *)this + TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = 0x3FE666663F800000;
  *((_WORD *)this + 8) = 156;
  *(_OWORD *)((char *)this + 2TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = xmmword_19E02D000;
  *(_OWORD *)((char *)this + 36) = xmmword_19E02D010;
  *(_OWORD *)((char *)this + 52) = xmmword_19E02D020;
  *(void *)((char *)this + 68) = 0x341200000;
  *((void *)this + 1TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 1TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
  *((float32x2_t *)this + 13) = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&a2, 0), (float32x2_t)0xC1096932411696CDLL);
  *((float *)this + 28) = *(float *)&a2 + -30.262;
  *((void *)this + 15) = 0xBFF0000000000000;
  *((_WORD *)this + 64) = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)((char *)this + 132) = result;
  *((_DWORD *)this + 35) = 0;
  *((unsigned char *)this + 144) = a3;
  return result;
}

float SingleThresholdProx::Estimator::metersToDecibels(SingleThresholdProx::Estimator *this, float a2)
{
  float v2 = *((float *)this + 3) * -10.0;
  return *((float *)this + 1) + (float)(v2 * log10f(a2 / *((float *)this + 2)));
}

void SingleThresholdProx::Estimator::addRSSISample(SingleThresholdProx::Estimator *this, int a2, char a3, double a4)
{
  if (a2 != 127)
  {
    char v5 = a2 - 126;
    if (a2 < 0) {
      char v5 = a2;
    }
    int v6 = (char)(*((unsigned char *)this + 144) + v5);
    if (v6 >= *((char *)this + 16) && v6 <= *((char *)this + 17))
    {
      uint64_t v9 = (char *)this + 96;
      unint64_t v10 = *((void *)this + 12);
      unint64_t v11 = *((void *)this + 11);
      if (v11 >= v10)
      {
        uint64_t v13 = *((void *)this + 10);
        uint64_t v14 = (uint64_t)(v11 - v13) >> 4;
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 60) {
          std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v16 = v10 - v13;
        if (v16 >> 3 > v15) {
          unint64_t v15 = v16 >> 3;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17) {
          char v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Rose::ResponderSuperframeRxPacketInfo>>((uint64_t)v9, v17);
        }
        else {
          char v18 = 0;
        }
        long long v19 = &v18[16 * v14];
        uint64_t v20 = &v18[16 * v17];
        *(double *)long long v19 = a4;
        v19[8] = v6;
        v19[9] = a3;
        uint64_t v12 = v19 + 16;
        uint64_t v22 = (_WORD *)*((void *)this + 10);
        long long v21 = (_WORD *)*((void *)this + 11);
        if (v21 != v22)
        {
          do
          {
            uint64_t v23 = *((void *)v21 - 2);
            v21 -= 8;
            __int16 v24 = v21[4];
            *((void *)v19 - 2) = v23;
            v19 -= 16;
            *((_WORD *)v19 + 4) = v24;
          }
          while (v21 != v22);
          long long v21 = (_WORD *)*((void *)this + 10);
        }
        *((void *)this + 1TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = v19;
        *((void *)this + 1TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v12;
        *((void *)this + 12) = v20;
        if (v21) {
          operator delete(v21);
        }
      }
      else
      {
        *(double *)unint64_t v11 = a4;
        *(unsigned char *)(v11 + 8) = v6;
        uint64_t v12 = (char *)(v11 + 16);
        *(unsigned char *)(v11 + 9) = a3;
      }
      *((void *)this + 1TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v12;
    }
  }
}

uint64_t SingleThresholdProx::Estimator::getRangeMeasurement(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 88);
  v73 = 0;
  v74 = 0;
  uint64_t v75 = 0;
  std::string __p = 0;
  v71 = 0;
  v72 = 0;
  unint64_t v8 = *(char *)(a1 + 17) - (uint64_t)*(char *)(a1 + 16) + 1;
  __int16 v69 = 0;
  std::vector<short>::resize((uint64_t)&v73, v8, &v69);
  if (v6 == v7) {
    goto LABEL_63;
  }
  unint64_t v10 = *(char **)(a1 + 80);
  uint64_t v9 = *(char **)(a1 + 88);
  if (v10 == v9) {
    goto LABEL_63;
  }
  do
  {
    if (a3 - *(double *)v10 <= *(float *)(a1 + 40))
    {
      __int16 v12 = v10[8];
      uint64_t v13 = v10[8] - (uint64_t)*(char *)(a1 + 16);
      ++*((_WORD *)v73 + v13);
      uint64_t v14 = v71;
      if (v71 >= v72)
      {
        uint64_t v16 = (char *)__p;
        uint64_t v17 = v71 - (unsigned char *)__p;
        if (v71 - (unsigned char *)__p <= -3) {
          std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v18 = v17 >> 1;
        if (v72 - (unsigned char *)__p <= (unint64_t)((v17 >> 1) + 1)) {
          uint64_t v19 = v18 + 1;
        }
        else {
          uint64_t v19 = v72 - (unsigned char *)__p;
        }
        if ((unint64_t)(v72 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v20 = v19;
        }
        if (v20)
        {
          long long v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<short>>((uint64_t)&v72, v20);
          uint64_t v16 = (char *)__p;
          uint64_t v14 = v71;
        }
        else
        {
          long long v21 = 0;
        }
        uint64_t v22 = &v21[2 * v18];
        *(_WORD *)uint64_t v22 = v12;
        unint64_t v15 = v22 + 2;
        while (v14 != v16)
        {
          __int16 v23 = *((_WORD *)v14 - 1);
          v14 -= 2;
          *((_WORD *)v22 - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v23;
          v22 -= 2;
        }
        std::string __p = v22;
        v71 = v15;
        v72 = &v21[2 * v20];
        if (v16) {
          operator delete(v16);
        }
      }
      else
      {
        *(_WORD *)v71 = v12;
        unint64_t v15 = v14 + 2;
      }
      v71 = v15;
      v10 += 16;
      uint64_t v9 = *(char **)(a1 + 88);
    }
    else
    {
      int64_t v11 = v9 - (v10 + 16);
      if (v9 != v10 + 16) {
        memmove(v10, v10 + 16, v11 - 6);
      }
      uint64_t v9 = &v10[v11];
      *(void *)(a1 + 88) = &v10[v11];
    }
  }
  while (v10 != v9);
  if (__p == v71) {
    goto LABEL_63;
  }
  std::__sort<std::__less<short,short> &,short *>();
  __int16 v24 = (char *)__p;
  uint64_t v25 = (v71 - (unsigned char *)__p) >> 1;
  signed int v26 = vcvtpd_s64_f64((double)(unint64_t)v25 * 0.1);
  unsigned int v27 = vcvtpd_s64_f64((double)(unint64_t)v25 * 0.4);
  int v28 = v25 - (v27 + v26);
  if (v28 < 1)
  {
    float v30 = 0.0;
    if (__p != v71)
    {
      __n128 v33 = (char *)__p;
      do
      {
        int v34 = *(__int16 *)v33;
        v33 += 2;
        float v30 = v30 + (float)v34;
      }
      while (v33 != v71);
    }
    float v32 = (float)(unint64_t)v25;
  }
  else
  {
    uint64_t v29 = (char *)__p + 2 * (int)v27;
    float v30 = 0.0;
    while (v29 != &v71[-2 * v26])
    {
      int v31 = *(__int16 *)v29;
      v29 += 2;
      float v30 = v30 + (float)v31;
    }
    float v32 = (float)v28;
  }
  int v35 = (int)(float)(v30 / v32);
  double v36 = __exp10((float)((float)v35 - *(float *)(a1 + 4)) / -18.0);
  v71 = v24;
  int v37 = *(char *)(a1 + 16);
  int v38 = *(char *)(a1 + 17) - v37;
  if (v38 < 0)
  {
    int v42 = 0;
    int v41 = 0;
    int v40 = 0;
  }
  else
  {
    __int16 v39 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    do
    {
      float v43 = (float)v39 + (float)(char)v37;
      if (v43 >= *(float *)(a1 + 112))
      {
        if (v43 >= *(float *)(a1 + 108))
        {
          int v44 = *((__int16 *)v73 + v39);
          if (v43 >= *(float *)(a1 + 104)) {
            v40 += v44;
          }
          else {
            v41 += v44;
          }
        }
        else
        {
          v42 += *((__int16 *)v73 + v39);
        }
      }
      ++v39;
    }
    while (v38 >= v39);
  }
  int v45 = v41 + v42 + v40;
  if (!v45) {
    goto LABEL_63;
  }
  float v46 = (float)v40 / (float)v45;
  float v47 = (float)v41 / (float)v45;
  float v48 = (float)v42 / (float)v45;
  float v49 = *(float *)(a1 + 20);
  if (v48 > v49 || v46 > v49 || v47 > v49 || (float)(0.0 / (float)v45) > v49)
  {
    if (v47 <= v49) {
      unsigned int v51 = v46 > v49;
    }
    else {
      unsigned int v51 = 2;
    }
    if (v48 > v49)
    {
      unsigned int v51 = 3;
      goto LABEL_60;
    }
    goto LABEL_59;
  }
  float v50 = *(float *)(a1 + 24);
  unsigned int v51 = (float)(v46 + v47) > v50;
  if ((float)(v47 + v48) <= v50)
  {
LABEL_59:
    if (v51) {
      goto LABEL_60;
    }
LABEL_63:
    int v59 = 0;
    LOBYTE(v35) = 0;
    uint64_t v60 = 0;
    double v36 = -1.0;
    goto LABEL_64;
  }
  unsigned int v51 = 2;
LABEL_60:
  float v52 = *(float *)(a1 + 64);
  double v53 = *(double *)(a1 + 120);
  *(double *)(a1 + 12TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = a3;
  if (v51 == 1 || (double v54 = a3 - v53, v54 > *(float *)(a1 + 68)))
  {
    float v58 = *(float *)(a1 + 44);
    float v57 = (float)v51;
  }
  else
  {
    float v55 = *(float *)(a1 + 132);
    float v56 = v55 / (float)(v55 + *(float *)(a1 + 52));
    float v57 = *(float *)(a1 + 136) + (float)(v56 * (float)((float)v51 - *(float *)(a1 + 136)));
    float v58 = (float)(v55 * (float)(1.0 - v56)) + v54 * v54 * *(float *)(a1 + 48) * 0.5 * (v52 * v52);
  }
  *(float *)(a1 + 132) = v58;
  *(float *)(a1 + 136) = v57;
  if (v57 >= 1.0 && v57 <= 3.0)
  {
    int v59 = llroundf(v57);
    unsigned int v62 = v59 - v51;
    if ((int)(v59 - v51) < 0) {
      unsigned int v62 = v51 - v59;
    }
    if (v62 <= *(unsigned __int16 *)(a1 + 74))
    {
      *(_WORD *)(a1 + 128) = 0;
    }
    else
    {
      unsigned __int16 v63 = *(_WORD *)(a1 + 128) + 1;
      *(_WORD *)(a1 + 128) = v63;
      if (*(unsigned __int16 *)(a1 + 72) < v63)
      {
        *(_DWORD *)(a1 + 132) = *(_DWORD *)(a1 + 44);
        *(float *)(a1 + 136) = (float)v51;
      }
    }
    if (*(unsigned char *)(a1 + 140))
    {
      if (v59 == 1)
      {
        BOOL v64 = 0;
        *(unsigned char *)(a1 + 142) = 0;
        goto LABEL_89;
      }
      if (v59 < 2 || (unsigned int v65 = (*(unsigned char *)(a1 + 142) + 1), ++*(unsigned char *)(a1 + 142), v65 < 2))
      {
        BOOL v64 = 0;
        int v59 = 1;
        goto LABEL_89;
      }
      *(unsigned char *)(a1 + 14TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0;
      *(unsigned char *)(a1 + 142) = 0;
    }
    else if (v59 == 1)
    {
      BOOL v64 = 0;
      *(_DWORD *)(a1 + 14TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 1;
      goto LABEL_89;
    }
    BOOL v64 = 1;
    goto LABEL_89;
  }
  *(void *)(a1 + 12TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0) = 0xBFF0000000000000;
  int v59 = *(unsigned __int8 *)(a1 + 140);
  BOOL v64 = *(unsigned char *)(a1 + 140) == 0;
LABEL_89:
  if (*(unsigned char *)(a1 + 141) && v64)
  {
    v66 = (unsigned char *)(a1 + 143);
    if (v59 != 2)
    {
      unsigned int v67 = ++*v66;
      BOOL v68 = v67 > 1 && v52 == 1.0;
      if (!v68 && v67 < 3)
      {
        uint64_t v60 = 1;
        int v59 = 2;
        goto LABEL_64;
      }
      *(unsigned char *)(a1 + 14TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = 0;
    }
  }
  else
  {
    uint64_t v60 = 1;
    if (v59 != 2) {
      goto LABEL_64;
    }
    *(unsigned char *)(a1 + 14TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = 1;
    v66 = (unsigned char *)(a1 + 143);
  }
  unsigned char *v66 = 0;
  uint64_t v60 = 1;
LABEL_64:
  *(_DWORD *)a2 = v59;
  *(double *)(a2 + 8) = v36;
  *(unsigned char *)(a2 + 16) = v35;
  if (__p)
  {
    v71 = (char *)__p;
    operator delete(__p);
  }
  if (v73)
  {
    v74 = v73;
    operator delete(v73);
  }
  return v60;
}

void sub_19E024540(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  if (a14) {
    operator delete(a14);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<short>::resize(uint64_t a1, unint64_t a2, _WORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 1;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 2 * a2;
    }
  }
  else
  {
    std::vector<short>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<short>::__append(void **a1, unint64_t a2, _WORD *a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  uint64_t v9 = *(_WORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 1)
  {
    if (a2)
    {
      uint64_t v16 = 2 * a2;
      uint64_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 2;
      }
      while (v16);
      uint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    uint64_t v11 = a2 + (v10 >> 1);
    if (v11 < 0) {
      std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v10 >> 1;
    unint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 > v11) {
      uint64_t v11 = v13;
    }
    if (v13 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v14 = v11;
    }
    if (v14) {
      unint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<short>>(v6, v14);
    }
    else {
      unint64_t v15 = 0;
    }
    uint64_t v18 = &v15[2 * v12];
    uint64_t v19 = &v18[2 * a2];
    uint64_t v20 = 2 * a2;
    long long v21 = v18;
    do
    {
      *(_WORD *)long long v21 = *a3;
      v21 += 2;
      v20 -= 2;
    }
    while (v20);
    uint64_t v22 = &v15[2 * v14];
    __int16 v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 2)
    {
      __int16 v25 = *((_WORD *)i - 1);
      *((_WORD *)v18 - TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1) = v25;
      v18 -= 2;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

void SharingHysteresis::getScoreDelta()
{
}

void SharingHysteresis::belowTimeDeltaThreshold1()
{
}

void SharingHysteresis::belowTimeDeltaThreshold2()
{
}

void SharingHysteresis::setStickinessDuration1()
{
}

void SharingHysteresis::setStickinessDuration2()
{
}

void SharingHysteresis::setStickinessDuration()
{
}

void SharingHysteresis::sanityCheckSwappedScores()
{
  __assert_rtn("sanityCheckSwappedScores", "SharingHysteresis.cpp", 176, "currentDeviceScores[i - 1].swappedScore >= currentDeviceScores[i].swappedScore");
}

void __PRGetDeviceModelName_block_invoke_cold_1()
{
  __assert_rtn("PRGetDeviceModelName_block_invoke", "PRUtilities.m", 40, "CFGetTypeID(answer) == CFStringGetTypeID()");
}

void PRCommonConvertTicksToSeconds()
{
  __assert_rtn("PRCommonConvertTicksToSeconds", "PRCommon.mm", 43, "timebaseResult == KERN_SUCCESS");
}

void TopScoreTieHysteresis::isInTopScoreLayer()
{
  __assert_rtn("isInTopScoreLayer", "TopScoreTieHysteresis.cpp", 82, "topScore >= score");
}

void BigHeadTieHysteresis::mitigateBigHeadBackForthIssuesIfPossible()
{
  __assert_rtn("mitigateBigHeadBackForthIssuesIfPossible", "BigHeadTieHysteresis.cpp", 37, "soiRssiTieHysteresis.getNumDevices() == getNumberOfBigHeadCandidates(output)");
}

{
  __assert_rtn("mitigateBigHeadBackForthIssuesIfPossible", "BigHeadTieHysteresis.cpp", 33, "topScoreTieHysteresis.getNumDevices() == getNumberOfBigHeadCandidates(output)");
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1F417CDE8]();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E600](this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1F417E660](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E880]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8D0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x1F417EC38]();
}

uint64_t std::__sort<std::__less<short,short> &,short *>()
{
  return MEMORY[0x1F417EC70]();
}

void std::locale::~locale(std::locale *this)
{
}

unint64_t std::stoull(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1F417ED00](__str, __idx, *(void *)&__base);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__float cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__float cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

long double asin(long double __x)
{
  MEMORY[0x1F40CA3D0](__x);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x1F40CA3D8](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

long double erf(long double __x)
{
  MEMORY[0x1F40CBF50](__x);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}