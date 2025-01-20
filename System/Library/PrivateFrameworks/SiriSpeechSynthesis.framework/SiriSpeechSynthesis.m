void sub_22B57888C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x230F4BDC0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_22B5790E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5793C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B579884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_22B57A0AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B57A390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B57A4F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B57A67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  v20 = v19;

  _Unwind_Resume(a1);
}

void sub_22B57A860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B57AB3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B57AD5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B57B030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B57B118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B57CBE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__353(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x230F4BDC0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__354(uint64_t a1)
{
}

void sub_22B57ED14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__493(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__494(uint64_t a1)
{
}

void _audioPlaybackServiceAudioQueueCallback(uint64_t a1, AudioQueueRef inAQ, AudioQueueBuffer *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  memset(&v11, 0, sizeof(v11));
  AudioQueueGetCurrentTime(inAQ, 0, &v11, 0);
  v6 = SFSSGetLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t mAudioDataByteSize = a3->mAudioDataByteSize;
    *(_DWORD *)buf = 134218496;
    uint64_t v13 = a1;
    __int16 v14 = 2048;
    Float64 mSampleTime = v11.mSampleTime;
    __int16 v16 = 2048;
    uint64_t v17 = mAudioDataByteSize;
    _os_log_debug_impl(&dword_22B575000, v6, OS_LOG_TYPE_DEBUG, "AudioPlaybackServices %p played audio buffer at sample time: %f, size: %ld", buf, 0x20u);
  }

  OSStatus v7 = AudioQueueFreeBuffer(inAQ, a3);
  if (v7)
  {
    OSStatus v8 = v7;
    v9 = SFSSGetLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = v8;
      _os_log_error_impl(&dword_22B575000, v9, OS_LOG_TYPE_ERROR, "Error AudioQueueFreeBuffer %d", buf, 8u);
    }
  }
}

void sub_22B580590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

uint64_t flatbuffers::FlatBufferBuilder::Finish(flatbuffers::FlatBufferBuilder *this, unsigned int a2, const char *a3)
{
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)this);
  *((void *)this + 7) = *((void *)this + 5);
  flatbuffers::FlatBufferBuilder::PreAlign(this, 4, *((void *)this + 9));
  int v5 = flatbuffers::FlatBufferBuilder::ReferTo(this, a2);
  uint64_t result = flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)this, v5);
  *((unsigned char *)this + 71) = 1;
  return result;
}

double flatbuffers::FlatBufferBuilder::Release(flatbuffers::FlatBufferBuilder *this, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 71)) {
    __assert_rtn("Finished", "flatbuffers.h", 1226, "finished");
  }
  int v2 = *(unsigned __int8 *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)this = *(void *)a2;
  *((unsigned char *)this + 8) = v2;
  *((void *)this + 2) = v4;
  *((void *)this + 3) = v3;
  *((void *)this + 4) = v5;
  *((void *)this + 5) = (v3 + v4 - v5);
  if (v2)
  {
    *(void *)a2 = 0;
    *(unsigned char *)(a2 + 8) = 0;
  }
  double result = 0.0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  return result;
}

void flatbuffers::FlatBufferBuilder::~FlatBufferBuilder(flatbuffers::FlatBufferBuilder *this)
{
  uint64_t v2 = *((void *)this + 11);
  if (v2)
  {
    std::__tree<flatbuffers::Offset<flatbuffers::String>,flatbuffers::FlatBufferBuilder::StringOffsetCompare,std::allocator<flatbuffers::Offset<flatbuffers::String>>>::destroy(*(void **)(v2 + 8));
    MEMORY[0x230F4BA00](v2, 0x1060C40C2B13FB5);
  }
  uint64_t v3 = *((void *)this + 5);
  if (v3)
  {
    if (*(void *)this) {
      (*(void (**)(void))(**(void **)this + 24))(*(void *)this);
    }
    else {
      MEMORY[0x230F4B9E0](v3, 0x1000C8077774924);
    }
  }
  *((void *)this + 5) = 0;
  if (*((unsigned char *)this + 8) && *(void *)this) {
    (*(void (**)(void))(**(void **)this + 8))(*(void *)this);
  }
  *(void *)this = 0;
  *((unsigned char *)this + 8) = 0;
}

void std::__tree<flatbuffers::Offset<flatbuffers::String>,flatbuffers::FlatBufferBuilder::StringOffsetCompare,std::allocator<flatbuffers::Offset<flatbuffers::String>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<flatbuffers::Offset<flatbuffers::String>,flatbuffers::FlatBufferBuilder::StringOffsetCompare,std::allocator<flatbuffers::Offset<flatbuffers::String>>>::destroy(*a1);
    std::__tree<flatbuffers::Offset<flatbuffers::String>,flatbuffers::FlatBufferBuilder::StringOffsetCompare,std::allocator<flatbuffers::Offset<flatbuffers::String>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void __clang_call_terminate(void *a1)
{
}

char *flatbuffers::Allocator::reallocate_downward(flatbuffers::Allocator *this, unsigned __int8 *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  if (a4 <= a3) {
    __assert_rtn("reallocate_downward", "flatbuffers.h", 604, "new_size > old_size");
  }
  v12 = (char *)(*(uint64_t (**)(flatbuffers::Allocator *, unint64_t))(*(void *)this + 16))(this, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(flatbuffers::Allocator *, unsigned __int8 *, unint64_t))(*(void *)this + 24))(this, a2, a3);
  return v12;
}

void flatbuffers::DefaultAllocator::deallocate(flatbuffers::DefaultAllocator *this, unsigned __int8 *a2)
{
  if (a2) {
    JUMPOUT(0x230F4B9E0);
  }
}

void flatbuffers::DefaultAllocator::allocate(flatbuffers::DefaultAllocator *this)
{
}

void flatbuffers::DefaultAllocator::~DefaultAllocator(flatbuffers::DefaultAllocator *this)
{
}

void flatbuffers::DetachedBuffer::~DetachedBuffer(flatbuffers::DetachedBuffer *this)
{
  uint64_t v3 = (_OWORD *)((char *)this + 16);
  uint64_t v2 = *((void *)this + 2);
  if (v2)
  {
    uint64_t v4 = *(void *)this;
    if (*(void *)this) {
      (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
    }
    else {
      MEMORY[0x230F4B9E0](v2, 0x1000C8077774924);
    }
  }
  if (*((unsigned char *)this + 8) && *(void *)this) {
    (*(void (**)(void))(**(void **)this + 8))(*(void *)this);
  }
  *(void *)this = 0;
  *((unsigned char *)this + 8) = 0;
  _OWORD *v3 = 0u;
  v3[1] = 0u;
}

uint64_t flatbuffers::FlatBufferBuilder::NotNested(uint64_t this)
{
  if (*(unsigned char *)(this + 70)) {
    __assert_rtn("NotNested", "flatbuffers.h", 1334, "!nested");
  }
  if (*(_DWORD *)(this + 64)) {
    __assert_rtn("NotNested", "flatbuffers.h", 1336, "!num_field_loc");
  }
  return this;
}

unint64_t flatbuffers::FlatBufferBuilder::PreAlign(flatbuffers::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  if (*((void *)this + 9) < a3) {
    *((void *)this + 9) = a3;
  }
  return flatbuffers::vector_downward::fill(this, (a3 - 1) & (-a2 - (*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10))));
}

unint64_t flatbuffers::vector_downward::ensure_space(flatbuffers::vector_downward *this, unint64_t a2)
{
  uint64_t v2 = (char *)*((void *)this + 6);
  unint64_t v3 = *((void *)this + 7);
  if ((unint64_t)v2 < v3
    || (v6 = (unsigned __int8 *)*((void *)this + 5), int v7 = v3 - v6, v3 < (unint64_t)v6))
  {
    __assert_rtn("ensure_space", "flatbuffers.h", 905, "cur_ >= scratch_ && scratch_ >= buf_");
  }
  unint64_t v8 = *((void *)this + 4);
  if ((unint64_t)&v2[-v3] < a2)
  {
    unsigned int v9 = v8 - v2 + v6;
    if (v8) {
      unint64_t v10 = v8 >> 1;
    }
    else {
      unint64_t v10 = *((void *)this + 2);
    }
    if (v10 <= a2) {
      unint64_t v10 = a2;
    }
    unint64_t v11 = (*((void *)this + 3) + v8 + v10 - 1) & -*((void *)this + 3);
    *((void *)this + 4) = v11;
    uint64_t v12 = *(void *)this;
    if (v6)
    {
      if (v12)
      {
        uint64_t v13 = (char *)(*(uint64_t (**)(uint64_t))(*(void *)v12 + 32))(v12);
      }
      else
      {
        v15 = &unk_26DEBF7D8;
        uint64_t v13 = flatbuffers::Allocator::reallocate_downward((flatbuffers::Allocator *)&v15, v6, v8, v11, v9, (v3 - v6));
      }
    }
    else
    {
      if (!v12)
      {
        v15 = &unk_26DEBF7D8;
        operator new[]();
      }
      uint64_t v13 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v12 + 16))(v12, v11);
    }
    LODWORD(v6) = v13;
    unint64_t v8 = *((void *)this + 4);
    uint64_t v2 = &v13[v8 - v9];
    *((void *)this + 5) = v13;
    *((void *)this + 6) = v2;
    *((void *)this + 7) = &v13[v7];
  }
  if ((v8 - v2 + v6) >= 0x7FFFFFFF) {
    __assert_rtn("ensure_space", "flatbuffers.h", 909, "size() < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  return a2;
}

uint64_t flatbuffers::FlatBufferBuilder::ReferTo(flatbuffers::FlatBufferBuilder *this, unsigned int a2)
{
  flatbuffers::FlatBufferBuilder::Align(this, 4uLL);
  if (!a2
    || (v4 = *((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10), BOOL v5 = v4 >= a2, v6 = v4 - a2, !v5))
  {
    __assert_rtn("ReferTo", "flatbuffers.h", 1321, "off && off <= GetSize()");
  }
  return v6 + 4;
}

uint64_t flatbuffers::FlatBufferBuilder::PushElement<unsigned int>(uint64_t a1, int a2)
{
  flatbuffers::FlatBufferBuilder::Align((flatbuffers::FlatBufferBuilder *)a1, 4uLL);
  flatbuffers::vector_downward::ensure_space((flatbuffers::vector_downward *)a1, 4uLL);
  uint64_t v4 = *(void *)(a1 + 48);
  *(_DWORD *)(v4 - 4) = a2;
  v4 -= 4;
  *(void *)(a1 + 48) = v4;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

unint64_t flatbuffers::FlatBufferBuilder::Align(flatbuffers::FlatBufferBuilder *this, unint64_t a2)
{
  if (*((void *)this + 9) < a2) {
    *((void *)this + 9) = a2;
  }
  return flatbuffers::vector_downward::fill(this, (a2 - 1) & -(uint64_t)(*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10)));
}

unint64_t flatbuffers::vector_downward::fill(flatbuffers::vector_downward *this, unint64_t a2)
{
  unint64_t result = flatbuffers::vector_downward::ensure_space(this, a2);
  *((void *)this + 6) -= a2;
  if (a2)
  {
    uint64_t v5 = 0;
    do
      *(unsigned char *)(*((void *)this + 6) + v5++) = 0;
    while (a2 != v5);
  }
  return result;
}

void sub_22B58101C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__645(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 48) = *(_DWORD *)(a2 + 48);
  return result;
}

uint64_t flatbuffers::FlatBufferBuilder::CreateString(flatbuffers::FlatBufferBuilder *this, const char *a2, unint64_t a3)
{
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)this);
  flatbuffers::FlatBufferBuilder::PreAlign(this, a3 + 1, 4uLL);
  flatbuffers::vector_downward::ensure_space(this, 1uLL);
  unsigned int v6 = (unsigned char *)(*((void *)this + 6) - 1);
  *((void *)this + 6) = v6;
  unsigned char *v6 = 0;
  if (a3)
  {
    flatbuffers::vector_downward::ensure_space(this, a3);
    int v7 = (void *)(*((void *)this + 6) - a3);
    *((void *)this + 6) = v7;
    memcpy(v7, a2, a3);
  }
  flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)this, a3);
  return (*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10));
}

flatbuffers::FlatBufferBuilder *flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(flatbuffers::FlatBufferBuilder *result, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    unint64_t v4 = (unint64_t)result;
    int v5 = flatbuffers::FlatBufferBuilder::ReferTo(result, a3);
    return (flatbuffers::FlatBufferBuilder *)flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v4, a2, v5);
  }
  return result;
}

uint64_t flatbuffers::FlatBufferBuilder::EndTable(flatbuffers::FlatBufferBuilder *this, int a2)
{
  if (!*((unsigned char *)this + 70)) {
    __assert_rtn("EndTable", "flatbuffers.h", 1352, "nested");
  }
  uint64_t v4 = flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)this, 0);
  if ((unsigned __int16)(*((_WORD *)this + 34) + 2) <= 4u) {
    unint64_t v5 = 4;
  }
  else {
    unint64_t v5 = (unsigned __int16)(*((_WORD *)this + 34) + 2);
  }
  *((_WORD *)this + 34) = v5;
  flatbuffers::vector_downward::ensure_space(this, v5);
  unsigned int v6 = (void *)(*((void *)this + 6) - v5);
  *((void *)this + 6) = v6;
  bzero(v6, v5);
  unsigned __int16 v7 = v4 - a2;
  if ((v4 - a2) >= 0x10000) {
    __assert_rtn("EndTable", "flatbuffers.h", 1367, "table_object_size < 0x10000");
  }
  unint64_t v8 = (unsigned __int16 *)*((void *)this + 6);
  if (!v8) {
    __assert_rtn("data", "flatbuffers.h", 933, "cur_");
  }
  v8[1] = v7;
  *unint64_t v8 = *((_WORD *)this + 34);
  unint64_t v9 = *((void *)this + 7);
  if (!v9) {
    __assert_rtn("scratch_end", "flatbuffers.h", 943, "scratch_");
  }
  uint64_t v10 = *((unsigned int *)this + 16);
  unint64_t v11 = v9 - 8 * v10;
  if (v10)
  {
    uint64_t v12 = (int *)(v9 - 8 * v10);
    do
    {
      uint64_t v13 = *((unsigned __int16 *)v12 + 2);
      if (*(unsigned __int16 *)((char *)v8 + v13)) {
        __assert_rtn("EndTable", "flatbuffers.h", 1378, "!ReadScalar<voffset_t>(buf_.data() + field_location->id)");
      }
      int v14 = *v12;
      v12 += 2;
      *(unsigned __int16 *)((char *)v8 + v13) = v4 - v14;
    }
    while ((unint64_t)v12 < v9);
  }
  *((void *)this + 7) = v11;
  *((_DWORD *)this + 16) = 0;
  *((_WORD *)this + 34) = 0;
  uint64_t v16 = *((void *)this + 4);
  unint64_t v15 = *((void *)this + 5);
  int v17 = v16 - v8 + v15;
  if (*((unsigned char *)this + 81))
  {
    if (!v15) {
      __assert_rtn("scratch_data", "flatbuffers.h", 938, "buf_");
    }
    if (v15 < v11)
    {
      size_t v18 = *v8;
      uint64_t v19 = v15 + v16;
      v20 = (unsigned int *)*((void *)this + 5);
      while (1)
      {
        uint64_t v21 = *v20;
        if (v18 == *(unsigned __int16 *)(v19 - v21) && !memcmp((const void *)(v19 - v21), v8, v18)) {
          break;
        }
        if ((unint64_t)++v20 >= v11)
        {
          int v17 = v16 - v8 + v15;
          goto LABEL_21;
        }
      }
      unint64_t v8 = (unsigned __int16 *)((char *)v8 + (v16 - v8 + v15 - v4));
      *((void *)this + 6) = v8;
      int v17 = v21;
    }
  }
LABEL_21:
  if (v17 == v16 + v15 - v8)
  {
    flatbuffers::vector_downward::ensure_space(this, 4uLL);
    v22 = (_DWORD *)*((void *)this + 7);
    _DWORD *v22 = v17;
    *((void *)this + 7) = v22 + 1;
    uint64_t v16 = *((void *)this + 4);
    unint64_t v15 = *((void *)this + 5);
  }
  *(_DWORD *)(v15 + v16 - v4) = v17 - v4;
  *((unsigned char *)this + 70) = 0;
  return v4;
}

unint64_t flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(unint64_t result, uint64_t a2, int a3)
{
  unint64_t v4 = result;
  if (a3 || *(unsigned char *)(result + 80))
  {
    unsigned int v5 = flatbuffers::FlatBufferBuilder::PushElement<unsigned int>(result, a3);
    unint64_t result = flatbuffers::vector_downward::ensure_space((flatbuffers::vector_downward *)v4, 8uLL);
    **(void **)(v4 + 56) = v5 | (unint64_t)(a2 << 32);
    *(void *)(v4 + 56) += 8;
    ++*(_DWORD *)(v4 + 64);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 68);
    if (v6 <= a2) {
      LOWORD(v6) = a2;
    }
    *(_WORD *)(v4 + 68) = v6;
  }
  return result;
}

uint64_t flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>(flatbuffers::FlatBufferBuilder *a1, const void *a2, unint64_t a3)
{
  flatbuffers::FlatBufferBuilder::StartVector(a1, a3, 1uLL);
  if (a3)
  {
    flatbuffers::vector_downward::ensure_space(a1, a3);
    unsigned int v6 = (void *)(*((void *)a1 + 6) - a3);
    *((void *)a1 + 6) = v6;
    memcpy(v6, a2, a3);
  }
  return flatbuffers::FlatBufferBuilder::EndVector(a1, a3);
}

unint64_t flatbuffers::FlatBufferBuilder::StartVector(flatbuffers::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)this);
  *((unsigned char *)this + 70) = 1;
  uint64_t v6 = a3 * a2;
  flatbuffers::FlatBufferBuilder::PreAlign(this, v6, 4uLL);
  return flatbuffers::FlatBufferBuilder::PreAlign(this, v6, a3);
}

uint64_t flatbuffers::FlatBufferBuilder::EndVector(flatbuffers::FlatBufferBuilder *this, int a2)
{
  if (!*((unsigned char *)this + 70)) {
    __assert_rtn("EndVector", "flatbuffers.h", 1562, "nested");
  }
  *((unsigned char *)this + 70) = 0;
  return flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)this, a2);
}

void sub_22B581768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B581950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::UserLanguageProfile::Verify(siri::speech::schema_fb::UserLanguageProfile *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      unsigned int v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6), 1uLL, 0)))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unsigned __int16 v7 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v7 >= 7u && (uint64_t v8 = v7[3]) != 0) {
            unint64_t v9 = (const unsigned __int8 *)this + v8 + *(unsigned int *)((char *)this + v8);
          }
          else {
            unint64_t v9 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v9);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              uint64_t v10 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v10 >= 9u && (uint64_t v11 = v10[4]) != 0) {
                uint64_t v12 = (const unsigned __int8 *)this + v11 + *(unsigned int *)((char *)this + v11);
              }
              else {
                uint64_t v12 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v12);
              if (result)
              {
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyTableStart(flatbuffers::Verifier *this, const unsigned __int8 *a2)
{
  uint64_t v2 = *(void *)this;
  unint64_t v3 = (unint64_t)&a2[-*(void *)this];
  if ((v3 & 3) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  unint64_t v4 = *((void *)this + 1);
  BOOL v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *(int *)a2;
  unsigned int v7 = *((_DWORD *)this + 5);
  unsigned int v8 = *((_DWORD *)this + 4) + 1;
  *((_DWORD *)this + 4) = v8;
  unsigned int v9 = *((_DWORD *)this + 6) + 1;
  *((_DWORD *)this + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)this + 7)) {
    return 0;
  }
  unint64_t v10 = v3 - v6;
  if (v10)
  {
    uint64_t v11 = 0;
    if (*((unsigned char *)this + 40) || v4 - 2 < v10) {
      return v11;
    }
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  unint64_t v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  BOOL v5 = v4 >= v12;
  unint64_t v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL flatbuffers::Table::VerifyOffset(flatbuffers::Table *this, const flatbuffers::Verifier *a2, unsigned int a3)
{
  unint64_t v3 = (unsigned __int16 *)((char *)this - *(int *)this);
  if (*v3 <= a3) {
    return 1;
  }
  uint64_t v4 = *(unsigned __int16 *)((char *)v3 + a3);
  if (!v4) {
    return 1;
  }
  unint64_t v5 = (unint64_t)this + v4 - *(void *)a2;
  if ((v5 & 3) != 0 && *((unsigned char *)a2 + 40) != 0) {
    return 0;
  }
  BOOL result = 0;
  unint64_t v8 = *((void *)a2 + 1);
  if (v8 >= 5 && v8 - 4 >= v5)
  {
    uint64_t v9 = *(unsigned int *)(*(void *)a2 + v5);
    if ((int)v9 >= 1) {
      return v8 - 1 >= v5 + v9;
    }
    return 0;
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOrString(flatbuffers::Verifier *this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4)
{
  unint64_t v4 = (unint64_t)&a2[-*(void *)this];
  if ((v4 & 3) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  unint64_t v5 = *((void *)this + 1);
  if (v5 < 5 || v5 - 4 < v4) {
    return 0;
  }
  unint64_t v7 = *(unsigned int *)a2;
  if (0x7FFFFFFF / a3 <= v7) {
    return 0;
  }
  unint64_t v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    unint64_t v5 = *((void *)this + 1);
  }
  BOOL v9 = v5 > v8;
  unint64_t v10 = v5 - v8;
  return v9 && v10 >= v4;
}

BOOL flatbuffers::Verifier::VerifyString(flatbuffers::Verifier *a1, const unsigned __int8 *a2)
{
  if (!a2) {
    return 1;
  }
  unint64_t v6 = 0;
  BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a1, a2, 1uLL, &v6);
  if (result)
  {
    unint64_t v4 = *((void *)a1 + 1);
    return v4 >= 2 && v4 - 1 >= v6 && *(unsigned char *)(*(void *)a1 + v6) == 0;
  }
  return result;
}

void sub_22B581E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B582090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B582210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B58247C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::UserAcousticProfile::Verify(siri::speech::schema_fb::UserAcousticProfile *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 < 7u
            || (uint64_t v9 = v8[3]) == 0
            || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9), 1uLL, 0)))
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v10 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v10 >= 9u && (uint64_t v11 = v10[4]) != 0) {
                unint64_t v12 = (const unsigned __int8 *)this + v11 + *(unsigned int *)((char *)this + v11);
              }
              else {
                unint64_t v12 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v12);
              if (result)
              {
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B582740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5829C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

flatbuffers::vector_downward *flatbuffers::FlatBufferBuilder::AddElement<unsigned char>(flatbuffers::vector_downward *this, uint64_t a2, int a3)
{
  char v3 = a3;
  unint64_t v5 = this;
  if (a3 || *((unsigned char *)this + 80))
  {
    flatbuffers::FlatBufferBuilder::Align(this, 1uLL);
    flatbuffers::vector_downward::ensure_space(v5, 1uLL);
    uint64_t v6 = (unsigned char *)(*((void *)v5 + 6) - 1);
    *((void *)v5 + 6) = v6;
    unsigned char *v6 = v3;
    uint64_t v7 = (*((_DWORD *)v5 + 8) - *((_DWORD *)v5 + 12) + *((_DWORD *)v5 + 10));
    this = (flatbuffers::vector_downward *)flatbuffers::vector_downward::ensure_space(v5, 8uLL);
    **((void **)v5 + 7) = v7 | (a2 << 32);
    *((void *)v5 + 7) += 8;
    ++*((_DWORD *)v5 + 16);
    unsigned int v8 = *((unsigned __int16 *)v5 + 34);
    if (v8 <= a2) {
      LOWORD(v8) = a2;
    }
    *((_WORD *)v5 + 34) = v8;
  }
  return this;
}

void sub_22B582EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RecognitionToken::Verify(siri::speech::schema_fb::RecognitionToken *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        unsigned int v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        unsigned int v9 = *v8;
        if (v9 < 7) {
          goto LABEL_43;
        }
        if (!v8[3]
          || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
          && v10 - 4 >= (unint64_t)this + v8[3] - *(void *)a2)
        {
          if (v9 < 9) {
            goto LABEL_43;
          }
          if (!v8[4]
            || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
            && v11 - 4 >= (unint64_t)this + v8[4] - *(void *)a2)
          {
            if (v9 < 0xB
              || (!v8[5]
               || (BOOL result = 0, v12 = *((void *)a2 + 1), v12 >= 5)
               && v12 - 4 >= (unint64_t)this + v8[5] - *(void *)a2)
              && (v9 < 0xD
               || (!v8[6]
                || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
                && v13 - 4 >= (unint64_t)this + v8[6] - *(void *)a2)
               && (v9 < 0xF
                || !v8[7]
                || (BOOL result = 0, v14 = *((void *)a2 + 1), v14 >= 2)
                && v14 - 1 >= (unint64_t)this + v8[7] - *(void *)a2)))
            {
LABEL_43:
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
              if (result)
              {
                unint64_t v15 = v9 >= 0x11 && v8[8]
                    ? (const unsigned __int8 *)this + v8[8] + *(unsigned int *)((char *)this + v8[8])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v15);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                  if (result)
                  {
                    uint64_t v16 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v16 >= 0x13u && (uint64_t v17 = v16[9]) != 0) {
                      size_t v18 = (const unsigned __int8 *)this + v17 + *(unsigned int *)((char *)this + v17);
                    }
                    else {
                      size_t v18 = 0;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v18);
                    if (result)
                    {
                      --*((_DWORD *)a2 + 4);
                      return 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B58328C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B583578(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(std::vector<int> *this, std::vector<int>::size_type __n)
{
  if (__n > this->__end_cap_.__value_ - this->__begin_)
  {
    if (__n >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v3 = (char *)this->__end_ - (char *)this->__begin_;
    unint64_t v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(__n);
    unint64_t v5 = (int *)&v4[v3 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v7 = (int *)&v4[4 * v6];
    std::vector<int>::pointer begin = this->__begin_;
    end = this->__end_;
    unint64_t v10 = v5;
    if (end != this->__begin_)
    {
      unint64_t v10 = v5;
      do
      {
        int v11 = *--end;
        *--unint64_t v10 = v11;
      }
      while (end != begin);
    }
    this->__begin_ = v10;
    this->__end_ = v5;
    this->__end_cap_.__value_ = v7;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

void std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

uint64_t flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>(flatbuffers::FlatBufferBuilder *a1, uint64_t a2, uint64_t a3)
{
  flatbuffers::FlatBufferBuilder::StartVector(a1, a3, 4uLL);
  if (a3)
  {
    uint64_t v6 = a2 - 4;
    uint64_t v7 = a3;
    do
    {
      uint64_t v8 = v7 - 1;
      int v9 = flatbuffers::FlatBufferBuilder::ReferTo(a1, *(_DWORD *)(v6 + 4 * v7));
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a1, v9);
      uint64_t v7 = v8;
    }
    while (v8);
  }
  return flatbuffers::FlatBufferBuilder::EndVector(a1, a3);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26489E5B0, MEMORY[0x263F8C060]);
}

void sub_22B5837D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_22B58392C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B583AD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RecognitionPhraseTokens::Verify(siri::speech::schema_fb::RecognitionPhraseTokens *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      unint64_t v5 = 0;
      uint64_t v6 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
      {
        if (!*(_WORD *)((char *)this - v6 + 4)) {
          goto LABEL_7;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v6 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v6 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        unint64_t v5 = 0;
        uint64_t v6 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
        {
LABEL_7:
          uint64_t v7 = *(unsigned __int16 *)((char *)this - v6 + 4);
          if (v7) {
            unint64_t v5 = (_DWORD *)((char *)this + v7 + *(unsigned int *)((char *)this + v7));
          }
          else {
            unint64_t v5 = 0;
          }
        }
      }
      BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionToken>(a2, v5);
      if (result)
      {
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionToken>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::RecognitionToken::Verify((siri::speech::schema_fb::RecognitionToken *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B583DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5840D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B58427C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B584424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RecognitionPhraseTokensAlternatives::Verify(siri::speech::schema_fb::RecognitionPhraseTokensAlternatives *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      unint64_t v5 = 0;
      uint64_t v6 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
      {
        if (!*(_WORD *)((char *)this - v6 + 4)) {
          goto LABEL_7;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v6 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v6 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        unint64_t v5 = 0;
        uint64_t v6 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
        {
LABEL_7:
          uint64_t v7 = *(unsigned __int16 *)((char *)this - v6 + 4);
          if (v7) {
            unint64_t v5 = (_DWORD *)((char *)this + v7 + *(unsigned int *)((char *)this + v7));
          }
          else {
            unint64_t v5 = 0;
          }
        }
      }
      BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionPhraseTokens>(a2, v5);
      if (result)
      {
        uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        if (*v8 < 7u
          || (uint64_t v9 = v8[3]) == 0
          || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 2)
          && v10 - 1 >= (unint64_t)this + v9 - *(void *)a2)
        {
          --*((_DWORD *)a2 + 4);
          return 1;
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionPhraseTokens>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::RecognitionPhraseTokens::Verify((siri::speech::schema_fb::RecognitionPhraseTokens *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B584754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B584A3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

flatbuffers::FlatBufferBuilder *flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives>>>(flatbuffers::FlatBufferBuilder *result, unsigned int a2)
{
  if (a2)
  {
    unint64_t v2 = (unint64_t)result;
    int v3 = flatbuffers::FlatBufferBuilder::ReferTo(result, a2);
    return (flatbuffers::FlatBufferBuilder *)flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v2, 4, v3);
  }
  return result;
}

void sub_22B584BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B584DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RecognitionSausage::Verify(siri::speech::schema_fb::RecognitionSausage *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      unint64_t v5 = 0;
      uint64_t v6 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
      {
        if (!*(_WORD *)((char *)this - v6 + 4)) {
          goto LABEL_7;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v6 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v6 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        unint64_t v5 = 0;
        uint64_t v6 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
        {
LABEL_7:
          uint64_t v7 = *(unsigned __int16 *)((char *)this - v6 + 4);
          if (v7) {
            unint64_t v5 = (_DWORD *)((char *)this + v7 + *(unsigned int *)((char *)this + v7));
          }
          else {
            unint64_t v5 = 0;
          }
        }
      }
      BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives>(a2, v5);
      if (result)
      {
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::RecognitionPhraseTokensAlternatives::Verify((siri::speech::schema_fb::RecognitionPhraseTokensAlternatives *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B58508C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B585374(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5854E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B585690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B585820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B585B28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t flatbuffers::FlatBufferBuilder::CreateVector<int>(flatbuffers::FlatBufferBuilder *a1, const void *a2, uint64_t a3)
{
  flatbuffers::FlatBufferBuilder::StartVector(a1, a3, 4uLL);
  if (a3)
  {
    flatbuffers::vector_downward::ensure_space(a1, 4 * a3);
    uint64_t v6 = (void *)(*((void *)a1 + 6) - 4 * a3);
    *((void *)a1 + 6) = v6;
    memcpy(v6, a2, 4 * a3);
  }
  return flatbuffers::FlatBufferBuilder::EndVector(a1, a3);
}

void sub_22B585D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B585EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RecognitionChoice::Verify(siri::speech::schema_fb::RecognitionChoice *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      unsigned int v6 = *(unsigned __int16 *)((char *)this - v5);
      if (v6 < 5) {
        goto LABEL_12;
      }
      if (*(_WORD *)((char *)this - v5 + 4))
      {
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v5 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v7 = *(int *)this;
        uint64_t v8 = -v7;
        unsigned int v6 = *(unsigned __int16 *)((char *)this - v7);
      }
      else
      {
        uint64_t v8 = -v5;
      }
      if (v6 < 7
        || (uint64_t v9 = *(unsigned __int16 *)((char *)this + v8 + 6), !*(_WORD *)((char *)this + v8 + 6))
        || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5) && v10 - 4 >= (unint64_t)this + v9 - *(void *)a2)
      {
LABEL_12:
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B586158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B586444(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5865B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B586724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B586ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::ItnAlignment::Verify(siri::speech::schema_fb::ItnAlignment *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5) {
      goto LABEL_18;
    }
    if (!v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      if (v6 < 7
        || (!v5[3]
         || (BOOL result = 0, v8 = *((void *)a2 + 1), v8 >= 5)
         && v8 - 4 >= (unint64_t)this + v5[3] - *(void *)a2)
        && (v6 < 9
         || (!v5[4]
          || (BOOL result = 0, v9 = *((void *)a2 + 1), v9 >= 5)
          && v9 - 4 >= (unint64_t)this + v5[4] - *(void *)a2)
         && (v6 < 0xB
          || (uint64_t v10 = v5[5]) == 0
          || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
          && v11 - 4 >= (unint64_t)this + v10 - *(void *)a2)))
      {
LABEL_18:
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B586DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RepeatedItnAlignment::Verify(siri::speech::schema_fb::RepeatedItnAlignment *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = 0;
      uint64_t v6 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
      {
        if (!*(_WORD *)((char *)this - v6 + 4)) {
          goto LABEL_7;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v6 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v6 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = 0;
        uint64_t v6 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
        {
LABEL_7:
          uint64_t v7 = *(unsigned __int16 *)((char *)this - v6 + 4);
          if (v7) {
            uint64_t v5 = (_DWORD *)((char *)this + v7 + *(unsigned int *)((char *)this + v7));
          }
          else {
            uint64_t v5 = 0;
          }
        }
      }
      BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::ItnAlignment>(a2, v5);
      if (result)
      {
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::ItnAlignment>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::ItnAlignment::Verify((siri::speech::schema_fb::ItnAlignment *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5870B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5875C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p)
{
  if (v30) {
    operator delete(v30);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_22B587774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B587894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B587A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::ChoiceAlignment::Verify(siri::speech::schema_fb::ChoiceAlignment *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6), 4uLL, 0)))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v7 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v7) < 7u) {
            goto LABEL_16;
          }
          if (*(_WORD *)((char *)this - v7 + 6))
          {
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v7 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v7 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v7 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v7) < 7u) {
              goto LABEL_16;
            }
          }
          uint64_t v8 = *(unsigned __int16 *)((char *)this - v7 + 6);
          if (v8 && (unint64_t v9 = (_DWORD *)((char *)this + v8 + *(unsigned int *)((char *)this + v8)), *v9))
          {
            unint64_t v10 = 0;
            unint64_t v11 = v9 + 1;
            while (siri::speech::schema_fb::RepeatedItnAlignment::Verify((siri::speech::schema_fb::RepeatedItnAlignment *)((char *)v11 + *v11), a2))
            {
              ++v10;
              ++v11;
              if (v10 >= *v9) {
                goto LABEL_16;
              }
            }
            return 0;
          }
          else
          {
LABEL_16:
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B587D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B588630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56)
{
  if (v56) {
    operator delete(v56);
  }
  if (__p) {
    operator delete(__p);
  }
  if (a44) {
    operator delete(a44);
  }
  if (a56) {
    operator delete(a56);
  }
  _Unwind_Resume(a1);
}

void sub_22B5888A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5889D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B588B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B588C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B588D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B588DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B588F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RecognitionResult::Verify(siri::speech::schema_fb::RecognitionResult *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = siri::speech::schema_fb::RecognitionSausage::Verify((siri::speech::schema_fb::RecognitionResult *)((char *)this+ v6+ *(unsigned int *)((char *)this + v6)), a2)))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v7 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v7 < 7u
            || (uint64_t v8 = v7[3]) == 0
            || (BOOL result = siri::speech::schema_fb::RecognitionSausage::Verify((siri::speech::schema_fb::RecognitionResult *)((char *)this+ v8+ *(unsigned int *)((char *)this + v8)), a2)))
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v9 = 0;
              uint64_t v10 = *(int *)this;
              if (*(unsigned __int16 *)((char *)this - v10) >= 9u)
              {
                if (!*(_WORD *)((char *)this - v10 + 8)) {
                  goto LABEL_15;
                }
                BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v10 + 8)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v10 + 8)), 4uLL, 0);
                if (!result) {
                  return result;
                }
                unint64_t v9 = 0;
                uint64_t v10 = *(int *)this;
                if (*(unsigned __int16 *)((char *)this - v10) >= 9u)
                {
LABEL_15:
                  uint64_t v11 = *(unsigned __int16 *)((char *)this - v10 + 8);
                  if (v11) {
                    unint64_t v9 = (_DWORD *)((char *)this + v11 + *(unsigned int *)((char *)this + v11));
                  }
                  else {
                    unint64_t v9 = 0;
                  }
                }
              }
              BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionChoice>(a2, v9);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  unint64_t v12 = 0;
                  uint64_t v13 = *(int *)this;
                  if (*(unsigned __int16 *)((char *)this - v13) >= 0xBu)
                  {
                    if (!*(_WORD *)((char *)this - v13 + 10)) {
                      goto LABEL_24;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v13 + 10)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v13 + 10)), 4uLL, 0);
                    if (!result) {
                      return result;
                    }
                    unint64_t v12 = 0;
                    uint64_t v13 = *(int *)this;
                    if (*(unsigned __int16 *)((char *)this - v13) >= 0xBu)
                    {
LABEL_24:
                      uint64_t v14 = *(unsigned __int16 *)((char *)this - v13 + 10);
                      if (v14) {
                        unint64_t v12 = (_DWORD *)((char *)this + v14 + *(unsigned int *)((char *)this + v14));
                      }
                      else {
                        unint64_t v12 = 0;
                      }
                    }
                  }
                  BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionChoice>(a2, v12);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      unint64_t v15 = 0;
                      uint64_t v16 = *(int *)this;
                      if (*(unsigned __int16 *)((char *)this - v16) >= 0xDu)
                      {
                        if (!*(_WORD *)((char *)this - v16 + 12)) {
                          goto LABEL_33;
                        }
                        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v16 + 12)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v16 + 12)), 4uLL, 0);
                        if (!result) {
                          return result;
                        }
                        unint64_t v15 = 0;
                        uint64_t v16 = *(int *)this;
                        if (*(unsigned __int16 *)((char *)this - v16) >= 0xDu)
                        {
LABEL_33:
                          uint64_t v17 = *(unsigned __int16 *)((char *)this - v16 + 12);
                          if (v17) {
                            unint64_t v15 = (_DWORD *)((char *)this + v17 + *(unsigned int *)((char *)this + v17));
                          }
                          else {
                            unint64_t v15 = 0;
                          }
                        }
                      }
                      BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::ItnAlignment>(a2, v15);
                      if (result)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                        if (result)
                        {
                          size_t v18 = 0;
                          uint64_t v19 = *(int *)this;
                          if (*(unsigned __int16 *)((char *)this - v19) >= 0xFu)
                          {
                            if (!*(_WORD *)((char *)this - v19 + 14)) {
                              goto LABEL_42;
                            }
                            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v19 + 14)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v19 + 14)), 4uLL, 0);
                            if (!result) {
                              return result;
                            }
                            size_t v18 = 0;
                            uint64_t v19 = *(int *)this;
                            if (*(unsigned __int16 *)((char *)this - v19) >= 0xFu)
                            {
LABEL_42:
                              uint64_t v20 = *(unsigned __int16 *)((char *)this - v19 + 14);
                              if (v20) {
                                size_t v18 = (_DWORD *)((char *)this + v20 + *(unsigned int *)((char *)this + v20));
                              }
                              else {
                                size_t v18 = 0;
                              }
                            }
                          }
                          BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::ChoiceAlignment>(a2, v18);
                          if (result)
                          {
                            --*((_DWORD *)a2 + 4);
                            return 1;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionChoice>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::RecognitionChoice::Verify((siri::speech::schema_fb::RecognitionChoice *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::ChoiceAlignment>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::ChoiceAlignment::Verify((siri::speech::schema_fb::ChoiceAlignment *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B58954C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B589DF8(_Unwind_Exception *exception_object)
{
  if (v3) {
    operator delete(v3);
  }
  if (v2) {
    operator delete(v2);
  }
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B58A1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58A318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B58A478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

flatbuffers::vector_downward *flatbuffers::FlatBufferBuilder::AddElement<double>(flatbuffers::vector_downward *this, uint64_t a2, double a3)
{
  uint64_t v5 = this;
  if (a3 != 0.0 || *((unsigned char *)this + 80))
  {
    flatbuffers::FlatBufferBuilder::Align(this, 8uLL);
    flatbuffers::vector_downward::ensure_space(v5, 8uLL);
    uint64_t v6 = *((void *)v5 + 6);
    *(double *)(v6 - 8) = a3;
    v6 -= 8;
    *((void *)v5 + 6) = v6;
    uint64_t v7 = (*((_DWORD *)v5 + 8) - v6 + *((_DWORD *)v5 + 10));
    this = (flatbuffers::vector_downward *)flatbuffers::vector_downward::ensure_space(v5, 8uLL);
    **((void **)v5 + 7) = v7 | (a2 << 32);
    *((void *)v5 + 7) += 8;
    ++*((_DWORD *)v5 + 16);
    unsigned int v8 = *((unsigned __int16 *)v5 + 34);
    if (v8 <= a2) {
      LOWORD(v8) = a2;
    }
    *((_WORD *)v5 + 34) = v8;
  }
  return this;
}

void sub_22B58A780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RequestStatsResponse_::DoubleStat::Verify(siri::speech::schema_fb::RequestStatsResponse_::DoubleStat *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        unsigned int v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        if (*v8 < 7u
          || (uint64_t v9 = v8[3]) == 0
          || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 9)
          && v10 - 8 >= (unint64_t)this + v9 - *(void *)a2)
        {
          --*((_DWORD *)a2 + 4);
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_22B58A9AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58AB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B58AC70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58AEC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RequestStatsResponse_::Int32Stat::Verify(siri::speech::schema_fb::RequestStatsResponse_::Int32Stat *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        unsigned int v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        if (*v8 < 7u
          || (uint64_t v9 = v8[3]) == 0
          || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
          && v10 - 4 >= (unint64_t)this + v9 - *(void *)a2)
        {
          --*((_DWORD *)a2 + 4);
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_22B58B0EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58B258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B58B3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58B608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RequestStatsResponse_::BoolStat::Verify(siri::speech::schema_fb::RequestStatsResponse_::BoolStat *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        unsigned int v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        if (*v8 < 7u
          || (uint64_t v9 = v8[3]) == 0
          || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 2)
          && v10 - 1 >= (unint64_t)this + v9 - *(void *)a2)
        {
          --*((_DWORD *)a2 + 4);
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_22B58B8AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RequestStatsResponse::Verify(siri::speech::schema_fb::RequestStatsResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v5) >= 5u)
      {
        if (!*(_WORD *)((char *)this - v5 + 4)) {
          goto LABEL_53;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v5 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v5) >= 5u)
        {
LABEL_53:
          uint64_t v6 = *(unsigned __int16 *)((char *)this - v5 + 4);
          if (v6)
          {
            uint64_t v7 = (_DWORD *)((char *)this + v6 + *(unsigned int *)((char *)this + v6));
            if (*v7)
            {
              unint64_t v8 = 0;
              uint64_t v9 = v7 + 1;
              while (siri::speech::schema_fb::RequestStatsResponse_::BoolStat::Verify((siri::speech::schema_fb::RequestStatsResponse_::BoolStat *)((char *)v9 + *v9), a2))
              {
                ++v8;
                ++v9;
                if (v8 >= *v7) {
                  goto LABEL_12;
                }
              }
              return 0;
            }
          }
        }
      }
LABEL_12:
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
      if (!result) {
        return result;
      }
      uint64_t v10 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v10) >= 7u)
      {
        if (!*(_WORD *)((char *)this - v10 + 6)) {
          goto LABEL_54;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v10 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v10 + 6)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v10 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v10) >= 7u)
        {
LABEL_54:
          uint64_t v11 = *(unsigned __int16 *)((char *)this - v10 + 6);
          if (v11)
          {
            unint64_t v12 = (_DWORD *)((char *)this + v11 + *(unsigned int *)((char *)this + v11));
            if (*v12)
            {
              unint64_t v13 = 0;
              uint64_t v14 = v12 + 1;
              while (siri::speech::schema_fb::RequestStatsResponse_::Int32Stat::Verify((siri::speech::schema_fb::RequestStatsResponse_::Int32Stat *)((char *)v14 + *v14), a2))
              {
                ++v13;
                ++v14;
                if (v13 >= *v12) {
                  goto LABEL_22;
                }
              }
              return 0;
            }
          }
        }
      }
LABEL_22:
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
      if (!result) {
        return result;
      }
      unint64_t v15 = 0;
      uint64_t v16 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v16) >= 9u)
      {
        if (!*(_WORD *)((char *)this - v16 + 8)) {
          goto LABEL_27;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v16 + 8)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v16 + 8)), 4uLL, 0);
        if (!result) {
          return result;
        }
        unint64_t v15 = 0;
        uint64_t v16 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v16) >= 9u)
        {
LABEL_27:
          uint64_t v17 = *(unsigned __int16 *)((char *)this - v16 + 8);
          if (v17) {
            unint64_t v15 = (_DWORD *)((char *)this + v17 + *(unsigned int *)((char *)this + v17));
          }
          else {
            unint64_t v15 = 0;
          }
        }
      }
      BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>(a2, v15);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
        if (result)
        {
          size_t v18 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v18 >= 0xBu && (uint64_t v19 = v18[5]) != 0) {
            uint64_t v20 = (const unsigned __int8 *)this + v19 + *(unsigned int *)((char *)this + v19);
          }
          else {
            uint64_t v20 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v20);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
            if (result)
            {
              uint64_t v21 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v21 >= 0xDu && (uint64_t v22 = v21[6]) != 0) {
                v23 = (const unsigned __int8 *)this + v22 + *(unsigned int *)((char *)this + v22);
              }
              else {
                v23 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v23);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                if (result)
                {
                  v24 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v24 >= 0xFu && (uint64_t v25 = v24[7]) != 0) {
                    v26 = (const unsigned __int8 *)this + v25 + *(unsigned int *)((char *)this + v25);
                  }
                  else {
                    v26 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v26);
                  if (result)
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::RequestStatsResponse_::DoubleStat::Verify((siri::speech::schema_fb::RequestStatsResponse_::DoubleStat *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B58BE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B58C120(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::reserve(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    unint64_t v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(a2);
    uint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v7 = &v4[4 * v6];
    unint64_t v8 = (char *)*a1;
    uint64_t v9 = (char *)a1[1];
    uint64_t v10 = v5;
    if (v9 != *a1)
    {
      uint64_t v10 = v5;
      do
      {
        int v11 = *((_DWORD *)v9 - 1);
        v9 -= 4;
        *((_DWORD *)v10 - 1) = v11;
        v10 -= 4;
      }
      while (v9 != v8);
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

flatbuffers::vector_downward *flatbuffers::FlatBufferBuilder::AddElement<float>(flatbuffers::vector_downward *this, uint64_t a2, float a3)
{
  uint64_t v5 = this;
  if (a3 != 0.0 || *((unsigned char *)this + 80))
  {
    flatbuffers::FlatBufferBuilder::Align(this, 4uLL);
    flatbuffers::vector_downward::ensure_space(v5, 4uLL);
    uint64_t v6 = *((void *)v5 + 6);
    *(float *)(v6 - 4) = a3;
    v6 -= 4;
    *((void *)v5 + 6) = v6;
    uint64_t v7 = (*((_DWORD *)v5 + 8) - v6 + *((_DWORD *)v5 + 10));
    this = (flatbuffers::vector_downward *)flatbuffers::vector_downward::ensure_space(v5, 8uLL);
    **((void **)v5 + 7) = v7 | (a2 << 32);
    *((void *)v5 + 7) += 8;
    ++*((_DWORD *)v5 + 16);
    unsigned int v8 = *((unsigned __int16 *)v5 + 34);
    if (v8 <= a2) {
      LOWORD(v8) = a2;
    }
    *((_WORD *)v5 + 34) = v8;
  }
  return this;
}

void sub_22B58C410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58C5B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58C748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B58CCBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (v12) {
    operator delete(v12);
  }
  if (v11) {
    operator delete(v11);
  }
  _Unwind_Resume(a1);
}

void sub_22B58CE70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58CFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B58D158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58D230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58D450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry::Verify(siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unsigned int v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 < 7u
            || (uint64_t v9 = v8[3]) == 0
            || (BOOL result = siri::speech::schema_fb::RecognitionChoice::Verify((siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry *)((char *)this+ v9+ *(unsigned int *)((char *)this + v9)), a2)))
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B58D680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58D7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B58D94C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58DB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58DD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::AudioAnalytics::Verify(siri::speech::schema_fb::AudioAnalytics *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v5) >= 5u)
      {
        if (!*(_WORD *)((char *)this - v5 + 4)) {
          goto LABEL_7;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v5 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v5) >= 5u)
        {
LABEL_7:
          uint64_t v6 = *(unsigned __int16 *)((char *)this - v5 + 4);
          if (v6)
          {
            uint64_t v7 = (_DWORD *)((char *)this + v6 + *(unsigned int *)((char *)this + v6));
            if (*v7)
            {
              unint64_t v8 = 0;
              uint64_t v9 = v7 + 1;
              while (siri::speech::schema_fb::RequestStatsResponse_::Int32Stat::Verify((siri::speech::schema_fb::RequestStatsResponse_::Int32Stat *)((char *)v9 + *v9), a2))
              {
                ++v8;
                ++v9;
                if (v8 >= *v7) {
                  goto LABEL_12;
                }
              }
              return 0;
            }
          }
        }
      }
LABEL_12:
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
      if (result)
      {
        uint64_t v10 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v10) >= 7u)
        {
          if (!*(_WORD *)((char *)this - v10 + 6)) {
            goto LABEL_17;
          }
          BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v10 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v10 + 6)), 4uLL, 0);
          if (!result) {
            return result;
          }
          uint64_t v10 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v10) >= 7u)
          {
LABEL_17:
            uint64_t v11 = *(unsigned __int16 *)((char *)this - v10 + 6);
            if (v11)
            {
              unint64_t v12 = (_DWORD *)((char *)this + v11 + *(unsigned int *)((char *)this + v11));
              if (*v12)
              {
                unint64_t v13 = 0;
                uint64_t v14 = v12 + 1;
                while (siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry::Verify((siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry *)((char *)v14 + *v14), a2))
                {
                  ++v13;
                  ++v14;
                  if (v13 >= *v12) {
                    goto LABEL_22;
                  }
                }
                return 0;
              }
            }
          }
        }
LABEL_22:
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B58E0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B58E498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58E644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58E7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B58E944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58EBF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::LatnnMitigatorResult::Verify(siri::speech::schema_fb::LatnnMitigatorResult *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || !v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 2) && v7 - 1 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
      if (result)
      {
        if (v6 >= 7 && v5[3]) {
          unint64_t v8 = (const unsigned __int8 *)this + v5[3] + *(unsigned int *)((char *)this + v5[3]);
        }
        else {
          unint64_t v8 = 0;
        }
        BOOL result = flatbuffers::Verifier::VerifyString(a2, v8);
        if (result)
        {
          uint64_t v9 = (unsigned __int16 *)((char *)this - *(int *)this);
          unsigned int v10 = *v9;
          if (v10 < 9
            || (!v9[4]
             || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 9)
             && v11 - 8 >= (unint64_t)this + v9[4] - *(void *)a2)
            && (v10 < 0xB
             || (uint64_t v12 = v9[5]) == 0
             || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 9)
             && v13 - 8 >= (unint64_t)this + v12 - *(void *)a2))
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B58EF28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58F02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B58F384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::FinalSpeechRecognitionResponse::Verify(siri::speech::schema_fb::FinalSpeechRecognitionResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unsigned int v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unsigned int v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                uint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    uint64_t v15 = *(int *)this;
                    unsigned int v16 = *(unsigned __int16 *)((char *)this - v15);
                    if (v16 < 0xD) {
                      goto LABEL_34;
                    }
                    if (*(_WORD *)((char *)this - v15 + 12))
                    {
                      BOOL result = siri::speech::schema_fb::RecognitionResult::Verify((siri::speech::schema_fb::FinalSpeechRecognitionResponse *)((char *)this+ *(unsigned __int16 *)((char *)this - v15 + 12)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v15 + 12))), a2);
                      if (!result) {
                        return result;
                      }
                      uint64_t v15 = *(int *)this;
                      uint64_t v17 = -v15;
                      unsigned int v16 = *(unsigned __int16 *)((char *)this - v15);
                    }
                    else
                    {
                      uint64_t v17 = -v15;
                    }
                    if (v16 < 0xF
                      || (uint64_t v18 = *(unsigned __int16 *)((char *)this + v17 + 14), !*(_WORD *)((char *)this + v17 + 14))
                      || (BOOL result = 0, v19 = *((void *)a2 + 1), v19 >= 5)
                      && v19 - 4 >= (unint64_t)this + v18 - *(void *)a2)
                    {
LABEL_34:
                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                      if (result)
                      {
                        uint64_t v20 = (unsigned __int16 *)((char *)this - (int)v15);
                        unsigned int v21 = *v20;
                        if (v21 < 0x11) {
                          goto LABEL_48;
                        }
                        uint64_t v22 = v20[8];
                        if (v22)
                        {
                          BOOL result = siri::speech::schema_fb::AudioAnalytics::Verify((siri::speech::schema_fb::FinalSpeechRecognitionResponse *)((char *)this+ v22+ *(unsigned int *)((char *)this + v22)), a2);
                          if (!result) {
                            return result;
                          }
                          uint64_t v15 = *(int *)this;
                          uint64_t v23 = -v15;
                          unsigned int v21 = *(unsigned __int16 *)((char *)this - v15);
                        }
                        else
                        {
                          uint64_t v23 = -(uint64_t)(int)v15;
                        }
                        if (v21 < 0x13
                          || ((v24 = (char *)this + v23, !*((_WORD *)v24 + 9))
                           || (BOOL result = 0, v25 = *((void *)a2 + 1), v25 >= 5)
                           && v25 - 4 >= (unint64_t)this + *((unsigned __int16 *)v24 + 9) - *(void *)a2)
                          && (v21 < 0x15
                           || (uint64_t v26 = *((unsigned __int16 *)v24 + 10), !*((_WORD *)v24 + 10))
                           || (BOOL result = 0, v27 = *((void *)a2 + 1), v27 >= 9)
                           && v27 - 8 >= (unint64_t)this + v26 - *(void *)a2))
                        {
LABEL_48:
                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x16u);
                          if (result)
                          {
                            v28 = (unsigned __int16 *)((char *)this - (int)v15);
                            if (*v28 >= 0x17u && (uint64_t v29 = v28[11]) != 0) {
                              v30 = (const unsigned __int8 *)this + v29 + *(unsigned int *)((char *)this + v29);
                            }
                            else {
                              v30 = 0;
                            }
                            BOOL result = flatbuffers::Verifier::VerifyString(a2, v30);
                            if (result)
                            {
                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x18u);
                              if (result)
                              {
                                v31 = (unsigned __int16 *)((char *)this - *(int *)this);
                                if (*v31 < 0x19u
                                  || (uint64_t v32 = v31[12]) == 0
                                  || (BOOL result = siri::speech::schema_fb::LatnnMitigatorResult::Verify((siri::speech::schema_fb::FinalSpeechRecognitionResponse *)((char *)this + v32 + *(unsigned int *)((char *)this + v32)), a2)))
                                {
                                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Au);
                                  if (result)
                                  {
                                    v33 = (unsigned __int16 *)((char *)this - *(int *)this);
                                    if (*v33 >= 0x1Bu && (uint64_t v34 = v33[13]) != 0) {
                                      v35 = (const unsigned __int8 *)this + v34 + *(unsigned int *)((char *)this + v34);
                                    }
                                    else {
                                      v35 = 0;
                                    }
                                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v35);
                                    if (result)
                                    {
                                      v36 = (unsigned __int16 *)((char *)this - *(int *)this);
                                      if (*v36 < 0x1Du
                                        || (uint64_t v37 = v36[14]) == 0
                                        || (BOOL result = 0, v38 = *((void *)a2 + 1), v38 >= 2)
                                        && v38 - 1 >= (unint64_t)this + v37 - *(void *)a2)
                                      {
                                        --*((_DWORD *)a2 + 4);
                                        return 1;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B58F91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B58FC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B590218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::PartialSpeechRecognitionResponse::Verify(siri::speech::schema_fb::PartialSpeechRecognitionResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unsigned int v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unsigned int v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                uint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 >= 0xDu && (uint64_t v16 = v15[6]) != 0) {
                      uint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                    }
                    else {
                      uint64_t v17 = 0;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                    if (result)
                    {
                      uint64_t v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                      unsigned int v19 = *v18;
                      if (v19 < 0xF
                        || (!v18[7]
                         || (BOOL result = 0, v20 = *((void *)a2 + 1), v20 >= 2)
                         && v20 - 1 >= (unint64_t)this + v18[7] - *(void *)a2)
                        && (v19 < 0x11
                         || (!v18[8]
                          || (BOOL result = 0, v21 = *((void *)a2 + 1), v21 >= 5)
                          && v21 - 4 >= (unint64_t)this + v18[8] - *(void *)a2)
                         && (v19 < 0x13
                          || !v18[9]
                          || (BOOL result = 0, v22 = *((void *)a2 + 1), v22 >= 5)
                          && v22 - 4 >= (unint64_t)this + v18[9] - *(void *)a2)))
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                        if (result)
                        {
                          uint64_t v23 = v19 >= 0x15 && v18[10]
                              ? (const unsigned __int8 *)this + v18[10] + *(unsigned int *)((char *)this + v18[10])
                              : 0;
                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v23);
                          if (result)
                          {
                            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x16u);
                            if (result)
                            {
                              v24 = (unsigned __int16 *)((char *)this - *(int *)this);
                              if (*v24 >= 0x17u && (uint64_t v25 = v24[11]) != 0) {
                                uint64_t v26 = (const unsigned __int8 *)this + v25 + *(unsigned int *)((char *)this + v25);
                              }
                              else {
                                uint64_t v26 = 0;
                              }
                              BOOL result = flatbuffers::Verifier::VerifyString(a2, v26);
                              if (result)
                              {
                                --*((_DWORD *)a2 + 4);
                                return 1;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5906B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B590F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

flatbuffers::vector_downward *flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>(flatbuffers::vector_downward *this, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = this;
  if (a3 || *((unsigned char *)this + 80))
  {
    flatbuffers::FlatBufferBuilder::Align(this, 8uLL);
    flatbuffers::vector_downward::ensure_space(v5, 8uLL);
    uint64_t v6 = *((void *)v5 + 6);
    *(void *)(v6 - 8) = a3;
    v6 -= 8;
    *((void *)v5 + 6) = v6;
    uint64_t v7 = (*((_DWORD *)v5 + 8) - v6 + *((_DWORD *)v5 + 10));
    this = (flatbuffers::vector_downward *)flatbuffers::vector_downward::ensure_space(v5, 8uLL);
    **((void **)v5 + 7) = v7 | (a2 << 32);
    *((void *)v5 + 7) += 8;
    ++*((_DWORD *)v5 + 16);
    unsigned int v8 = *((unsigned __int16 *)v5 + 34);
    if (v8 <= a2) {
      LOWORD(v8) = a2;
    }
    *((_WORD *)v5 + 34) = v8;
  }
  return this;
}

void sub_22B591DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::StartSpeechRequest::Verify(siri::speech::schema_fb::StartSpeechRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unsigned int v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unsigned int v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unsigned int v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                unint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                unint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  uint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 >= 0xBu && (uint64_t v15 = v14[5]) != 0) {
                    uint64_t v16 = (const unsigned __int8 *)this + v15 + *(unsigned int *)((char *)this + v15);
                  }
                  else {
                    uint64_t v16 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v16);
                  if (result)
                  {
                    uint64_t v17 = (unsigned __int16 *)((char *)this - *(int *)this);
                    unsigned int v18 = *v17;
                    if (v18 < 0xD
                      || (!v17[6]
                       || (BOOL result = 0, v19 = *((void *)a2 + 1), v19 >= 5)
                       && v19 - 4 >= (unint64_t)this + v17[6] - *(void *)a2)
                      && (v18 < 0xF
                       || (!v17[7]
                        || (BOOL result = 0, v20 = *((void *)a2 + 1), v20 >= 2)
                        && v20 - 1 >= (unint64_t)this + v17[7] - *(void *)a2)
                       && (v18 < 0x11
                        || !v17[8]
                        || (BOOL result = 0, v21 = *((void *)a2 + 1), v21 >= 2)
                        && v21 - 1 >= (unint64_t)this + v17[8] - *(void *)a2)))
                    {
                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                      if (result)
                      {
                        unint64_t v22 = v18 >= 0x13 && v17[9]
                            ? (const unsigned __int8 *)this + v17[9] + *(unsigned int *)((char *)this + v17[9])
                            : 0;
                        BOOL result = flatbuffers::Verifier::VerifyString(a2, v22);
                        if (result)
                        {
                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                          if (result)
                          {
                            uint64_t v23 = (unsigned __int16 *)((char *)this - *(int *)this);
                            if (*v23 >= 0x15u && (uint64_t v24 = v23[10]) != 0) {
                              uint64_t v25 = (const unsigned __int8 *)this + v24 + *(unsigned int *)((char *)this + v24);
                            }
                            else {
                              uint64_t v25 = 0;
                            }
                            BOOL result = flatbuffers::Verifier::VerifyString(a2, v25);
                            if (result)
                            {
                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x16u);
                              if (result)
                              {
                                uint64_t v26 = (unsigned __int16 *)((char *)this - *(int *)this);
                                if (*v26 >= 0x17u && (uint64_t v27 = v26[11]) != 0) {
                                  v28 = (const unsigned __int8 *)this + v27 + *(unsigned int *)((char *)this + v27);
                                }
                                else {
                                  v28 = 0;
                                }
                                BOOL result = flatbuffers::Verifier::VerifyString(a2, v28);
                                if (result)
                                {
                                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x18u);
                                  if (result)
                                  {
                                    uint64_t v29 = (unsigned __int16 *)((char *)this - *(int *)this);
                                    if (*v29 >= 0x19u && (uint64_t v30 = v29[12]) != 0) {
                                      v31 = (const unsigned __int8 *)this + v30 + *(unsigned int *)((char *)this + v30);
                                    }
                                    else {
                                      v31 = 0;
                                    }
                                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v31);
                                    if (result)
                                    {
                                      uint64_t v32 = (unsigned __int16 *)((char *)this - *(int *)this);
                                      unsigned int v33 = *v32;
                                      if (v33 < 0x1B) {
                                        goto LABEL_177;
                                      }
                                      if (!v32[13]
                                        || (BOOL result = 0, v34 = *((void *)a2 + 1), v34 >= 5)
                                        && v34 - 4 >= (unint64_t)this + v32[13] - *(void *)a2)
                                      {
                                        if (v33 < 0x1D
                                          || (!v32[14]
                                           || (BOOL result = 0, v35 = *((void *)a2 + 1), v35 >= 2)
                                           && v35 - 1 >= (unint64_t)this + v32[14] - *(void *)a2)
                                          && (v33 < 0x1F
                                           || (!v32[15]
                                            || (BOOL result = 0, v36 = *((void *)a2 + 1), v36 >= 2)
                                            && v36 - 1 >= (unint64_t)this + v32[15] - *(void *)a2)
                                           && (v33 < 0x21
                                            || !v32[16]
                                            || (BOOL result = 0, v37 = *((void *)a2 + 1), v37 >= 2)
                                            && v37 - 1 >= (unint64_t)this + v32[16] - *(void *)a2)))
                                        {
LABEL_177:
                                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x22u);
                                          if (result)
                                          {
                                            unint64_t v38 = v33 >= 0x23 && v32[17]
                                                ? (const unsigned __int8 *)this
                                                + v32[17]
                                                + *(unsigned int *)((char *)this + v32[17])
                                                : 0;
                                            BOOL result = flatbuffers::Verifier::VerifyString(a2, v38);
                                            if (result)
                                            {
                                              v39 = (unsigned __int16 *)((char *)this - *(int *)this);
                                              unsigned int v40 = *v39;
                                              if (v40 < 0x25) {
                                                goto LABEL_178;
                                              }
                                              if (!v39[18]
                                                || (BOOL result = 0, v41 = *((void *)a2 + 1), v41 >= 5)
                                                && v41 - 4 >= (unint64_t)this + v39[18] - *(void *)a2)
                                              {
                                                if (v40 < 0x27) {
                                                  goto LABEL_178;
                                                }
                                                if (!v39[19]
                                                  || (BOOL result = 0, v42 = *((void *)a2 + 1), v42 >= 5)
                                                  && v42 - 4 >= (unint64_t)this + v39[19] - *(void *)a2)
                                                {
                                                  if (v40 < 0x29) {
                                                    goto LABEL_178;
                                                  }
                                                  if (!v39[20]
                                                    || (BOOL result = 0, v43 = *((void *)a2 + 1), v43 >= 2)
                                                    && v43 - 1 >= (unint64_t)this + v39[20] - *(void *)a2)
                                                  {
                                                    if (v40 < 0x2B) {
                                                      goto LABEL_178;
                                                    }
                                                    if (!v39[21]
                                                      || (BOOL result = 0, v44 = *((void *)a2 + 1), v44 >= 2)
                                                      && v44 - 1 >= (unint64_t)this + v39[21] - *(void *)a2)
                                                    {
                                                      if (v40 < 0x2D) {
                                                        goto LABEL_178;
                                                      }
                                                      if (!v39[22]
                                                        || (BOOL result = 0, v45 = *((void *)a2 + 1), v45 >= 2)
                                                        && v45 - 1 >= (unint64_t)this + v39[22] - *(void *)a2)
                                                      {
                                                        if (v40 < 0x2F
                                                          || (!v39[23]
                                                           || (BOOL result = 0, v46 = *((void *)a2 + 1), v46 >= 9)
                                                           && v46 - 8 >= (unint64_t)this
                                                                       + v39[23]
                                                                       - *(void *)a2)
                                                          && (v40 < 0x31
                                                           || (!v39[24]
                                                            || (BOOL result = 0, v47 = *((void *)a2 + 1), v47 >= 9)
                                                            && v47 - 8 >= (unint64_t)this
                                                                        + v39[24]
                                                                        - *(void *)a2)
                                                           && (v40 < 0x33
                                                            || !v39[25]
                                                            || (BOOL result = 0, v48 = *((void *)a2 + 1), v48 >= 2)
                                                            && v48 - 1 >= (unint64_t)this
                                                                        + v39[25]
                                                                        - *(void *)a2)))
                                                        {
LABEL_178:
                                                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x34u);
                                                          if (result)
                                                          {
                                                            v49 = v40 >= 0x35 && v39[26]
                                                                ? (const unsigned __int8 *)this
                                                                + v39[26]
                                                                + *(unsigned int *)((char *)this + v39[26])
                                                                : 0;
                                                            BOOL result = flatbuffers::Verifier::VerifyString(a2, v49);
                                                            if (result)
                                                            {
                                                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x36u);
                                                              if (result)
                                                              {
                                                                v50 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                                if (*v50 >= 0x37u && (uint64_t v51 = v50[27]) != 0) {
                                                                  v52 = (const unsigned __int8 *)this
                                                                }
                                                                      + v51
                                                                      + *(unsigned int *)((char *)this + v51);
                                                                else {
                                                                  v52 = 0;
                                                                }
                                                                BOOL result = flatbuffers::Verifier::VerifyString(a2, v52);
                                                                if (result)
                                                                {
                                                                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x38u);
                                                                  if (result)
                                                                  {
                                                                    v53 = (unsigned __int16 *)((char *)this
                                                                                             - *(int *)this);
                                                                    if (*v53 >= 0x39u && (uint64_t v54 = v53[28]) != 0) {
                                                                      v55 = (const unsigned __int8 *)this
                                                                    }
                                                                          + v54
                                                                          + *(unsigned int *)((char *)this + v54);
                                                                    else {
                                                                      v55 = 0;
                                                                    }
                                                                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v55);
                                                                    if (result)
                                                                    {
                                                                      v56 = (unsigned __int16 *)((char *)this
                                                                                               - *(int *)this);
                                                                      unsigned int v57 = *v56;
                                                                      if (v57 < 0x3B
                                                                        || (!v56[29]
                                                                         || (BOOL result = 0,
                                                                             unint64_t v58 = *((void *)a2 + 1),
                                                                             v58 >= 5)
                                                                         && v58 - 4 >= (unint64_t)this
                                                                                     + v56[29]
                                                                                     - *(void *)a2)
                                                                        && (v57 < 0x3D
                                                                         || (!v56[30]
                                                                          || (BOOL result = 0,
                                                                              unint64_t v59 = *((void *)a2 + 1),
                                                                              v59 >= 2)
                                                                          && v59 - 1 >= (unint64_t)this
                                                                                      + v56[30]
                                                                                      - *(void *)a2)
                                                                         && (v57 < 0x3F
                                                                          || !v56[31]
                                                                          || (BOOL result = 0,
                                                                              unint64_t v60 = *((void *)a2 + 1),
                                                                              v60 >= 2)
                                                                          && v60 - 1 >= (unint64_t)this
                                                                                      + v56[31]
                                                                                      - *(void *)a2)))
                                                                      {
                                                                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x40u);
                                                                        if (result)
                                                                        {
                                                                          v61 = v57 >= 0x41 && v56[32]
                                                                              ? (const unsigned __int8 *)this
                                                                              + v56[32]
                                                                              + *(unsigned int *)((char *)this + v56[32])
                                                                              : 0;
                                                                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v61);
                                                                          if (result)
                                                                          {
                                                                            v62 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                                            unsigned int v63 = *v62;
                                                                            if (v63 < 0x43
                                                                              || !v62[33]
                                                                              || (BOOL result = 0,
                                                                                  unint64_t v64 = *((void *)a2 + 1),
                                                                                  v64 >= 5)
                                                                              && v64 - 4 >= (unint64_t)this
                                                                                          + v62[33]
                                                                                          - *(void *)a2)
                                                                            {
                                                                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x44u);
                                                                              if (result)
                                                                              {
                                                                                v65 = v63 >= 0x45 && v62[34]
                                                                                    ? (const unsigned __int8 *)this
                                                                                    + v62[34]
                                                                                    + *(unsigned int *)((char *)this + v62[34])
                                                                                    : 0;
                                                                                BOOL result = flatbuffers::Verifier::VerifyString(a2, v65);
                                                                                if (result)
                                                                                {
                                                                                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x46u);
                                                                                  if (result)
                                                                                  {
                                                                                    v66 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                                                    if (*v66 >= 0x47u
                                                                                      && (uint64_t v67 = v66[35]) != 0)
                                                                                    {
                                                                                      v68 = (const unsigned __int8 *)this
                                                                                          + v67
                                                                                          + *(unsigned int *)((char *)this + v67);
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v68 = 0;
                                                                                    }
                                                                                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v68);
                                                                                    if (result)
                                                                                    {
                                                                                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x48u);
                                                                                      if (result)
                                                                                      {
                                                                                        v69 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                                                        if (*v69 >= 0x49u
                                                                                          && (uint64_t v70 = v69[36]) != 0)
                                                                                        {
                                                                                          v71 = (const unsigned __int8 *)this
                                                                                              + v70
                                                                                              + *(unsigned int *)((char *)this + v70);
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v71 = 0;
                                                                                        }
                                                                                        BOOL result = flatbuffers::Verifier::VerifyString(a2, v71);
                                                                                        if (result)
                                                                                        {
                                                                                          --*((_DWORD *)a2 + 4);
                                                                                          return 1;
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5928BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B592A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B592CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::UserParameters::Verify(siri::speech::schema_fb::UserParameters *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unsigned int v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unsigned int v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unsigned int v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B592F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B593344(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B593544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B593624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5937C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::MultiUserStartSpeechRequest::Verify(siri::speech::schema_fb::MultiUserStartSpeechRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = siri::speech::schema_fb::StartSpeechRequest::Verify((siri::speech::schema_fb::MultiUserStartSpeechRequest *)((char *)this+ v6+ *(unsigned int *)((char *)this + v6)), a2)))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v7 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v7) < 7u) {
            goto LABEL_16;
          }
          if (*(_WORD *)((char *)this - v7 + 6))
          {
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v7 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v7 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v7 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v7) < 7u) {
              goto LABEL_16;
            }
          }
          uint64_t v8 = *(unsigned __int16 *)((char *)this - v7 + 6);
          if (v8 && (uint64_t v9 = (_DWORD *)((char *)this + v8 + *(unsigned int *)((char *)this + v8)), *v9))
          {
            unint64_t v10 = 0;
            unint64_t v11 = v9 + 1;
            while (siri::speech::schema_fb::UserParameters::Verify((siri::speech::schema_fb::UserParameters *)((char *)v11 + *v11), a2))
            {
              ++v10;
              ++v11;
              if (v10 >= *v9) {
                goto LABEL_16;
              }
            }
            return 0;
          }
          else
          {
LABEL_16:
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              uint64_t v12 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v12 >= 9u && (uint64_t v13 = v12[4]) != 0) {
                uint64_t v14 = (const unsigned __int8 *)this + v13 + *(unsigned int *)((char *)this + v13);
              }
              else {
                uint64_t v14 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
              if (result)
              {
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B593AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B593C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B593F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5940C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B594438(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5945C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5947F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::ContextWithPronHints::Verify(siri::speech::schema_fb::ContextWithPronHints *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = 0;
          uint64_t v9 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v9) >= 7u)
          {
            if (!*(_WORD *)((char *)this - v9 + 6)) {
              goto LABEL_13;
            }
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v9 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v9 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v8 = 0;
            uint64_t v9 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v9) >= 7u)
            {
LABEL_13:
              uint64_t v10 = *(unsigned __int16 *)((char *)this - v9 + 6);
              if (v10) {
                uint64_t v8 = (_DWORD *)((char *)this + v10 + *(unsigned int *)((char *)this + v10));
              }
              else {
                uint64_t v8 = 0;
              }
            }
          }
          BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v8);
          if (result)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfStrings(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = (const unsigned __int8 *)(a2 + 1);
  do
  {
    BOOL result = flatbuffers::Verifier::VerifyString(a1, &v5[*(unsigned int *)v5]);
    if (!result) {
      break;
    }
    ++v4;
    v5 += 4;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B594B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B595104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p)
{
  if (v31) {
    operator delete(v31);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_22B5952E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B595520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5956C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SetSpeechContext::Verify(siri::speech::schema_fb::SetSpeechContext *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = 0;
      uint64_t v6 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
      {
        if (!*(_WORD *)((char *)this - v6 + 4)) {
          goto LABEL_7;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v6 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v6 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = 0;
        uint64_t v6 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
        {
LABEL_7:
          uint64_t v7 = *(unsigned __int16 *)((char *)this - v6 + 4);
          if (v7) {
            uint64_t v5 = (_DWORD *)((char *)this + v7 + *(unsigned int *)((char *)this + v7));
          }
          else {
            uint64_t v5 = 0;
          }
        }
      }
      BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v5);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                uint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                uint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  uint64_t v14 = 0;
                  uint64_t v15 = *(int *)this;
                  if (*(unsigned __int16 *)((char *)this - v15) >= 0xBu)
                  {
                    if (!*(_WORD *)((char *)this - v15 + 10)) {
                      goto LABEL_28;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v15 + 10)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v15 + 10)), 4uLL, 0);
                    if (!result) {
                      return result;
                    }
                    uint64_t v14 = 0;
                    uint64_t v15 = *(int *)this;
                    if (*(unsigned __int16 *)((char *)this - v15) >= 0xBu)
                    {
LABEL_28:
                      uint64_t v16 = *(unsigned __int16 *)((char *)this - v15 + 10);
                      if (v16) {
                        uint64_t v14 = (_DWORD *)((char *)this + v16 + *(unsigned int *)((char *)this + v16));
                      }
                      else {
                        uint64_t v14 = 0;
                      }
                    }
                  }
                  BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::ContextWithPronHints>(a2, v14);
                  if (result)
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::ContextWithPronHints>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::ContextWithPronHints::Verify((siri::speech::schema_fb::ContextWithPronHints *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B595AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B595D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B595EA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B595F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59621C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SetSpeechProfile::Verify(siri::speech::schema_fb::SetSpeechProfile *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 < 9u
                || (uint64_t v12 = v11[4]) == 0
                || (BOOL result = siri::speech::schema_fb::UserLanguageProfile::Verify((siri::speech::schema_fb::SetSpeechProfile *)((char *)this+ v12+ *(unsigned int *)((char *)this + v12)), a2)))
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  uint64_t v13 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v13 < 0xBu
                    || (uint64_t v14 = v13[5]) == 0
                    || (BOOL result = siri::speech::schema_fb::UserAcousticProfile::Verify((siri::speech::schema_fb::SetSpeechProfile *)((char *)this+ v14+ *(unsigned int *)((char *)this + v14)), a2)))
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v15 >= 0xDu && (uint64_t v16 = v15[6]) != 0) {
                        uint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                      }
                      else {
                        uint64_t v17 = 0;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                      if (result)
                      {
                        --*((_DWORD *)a2 + 4);
                        return 1;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B596570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B596830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SetEndpointerState::Verify(siri::speech::schema_fb::SetEndpointerState *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    if (*v5 < 5u
      || (uint64_t v6 = v5[2]) == 0
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 2) && v7 - 1 >= (unint64_t)this + v6 - *(void *)a2)
    {
      --*((_DWORD *)a2 + 4);
      return 1;
    }
  }
  return result;
}

void sub_22B596A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B596BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B596CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B596EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::AudioPacket::Verify(siri::speech::schema_fb::AudioPacket *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = 0;
      uint64_t v6 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
      {
        if (!*(_WORD *)((char *)this - v6 + 4)) {
          goto LABEL_7;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v6 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v6 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = 0;
        uint64_t v6 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
        {
LABEL_7:
          uint64_t v7 = *(unsigned __int16 *)((char *)this - v6 + 4);
          if (v7) {
            uint64_t v5 = (_DWORD *)((char *)this + v7 + *(unsigned int *)((char *)this + v7));
          }
          else {
            uint64_t v5 = 0;
          }
        }
      }
      BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v5);
      if (result)
      {
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B597118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B59766C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p)
{
  if (v28) {
    operator delete(v28);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_22B597820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59798C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B597AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B597D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B597E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B598080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::FinishAudio::Verify(siri::speech::schema_fb::FinishAudio *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
      && (v6 < 7
       || !v5[3]
       || (BOOL result = 0, v8 = *((void *)a2 + 1), v8 >= 5) && v8 - 4 >= (unint64_t)this + v5[3] - *(void *)a2))
    {
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
      if (result
        && (v6 < 9
         || !v5[4]
         || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v5[4] + *(unsigned int *)((char *)this + v5[4]), 4uLL, 0))))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
        if (result)
        {
          uint64_t v9 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v9) < 0xBu) {
            goto LABEL_24;
          }
          if (*(_WORD *)((char *)this - v9 + 10))
          {
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v9 + 10)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v9 + 10)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v9 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v9) < 0xBu) {
              goto LABEL_24;
            }
          }
          uint64_t v10 = *(unsigned __int16 *)((char *)this - v9 + 10);
          if (v10 && (unint64_t v11 = (_DWORD *)((char *)this + v10 + *(unsigned int *)((char *)this + v10)), *v11))
          {
            unint64_t v12 = 0;
            uint64_t v13 = v11 + 1;
            while (siri::speech::schema_fb::RequestStatsResponse_::Int32Stat::Verify((siri::speech::schema_fb::RequestStatsResponse_::Int32Stat *)((char *)v13 + *v13), a2))
            {
              ++v12;
              ++v13;
              if (v12 >= *v11) {
                goto LABEL_24;
              }
            }
            return 0;
          }
          else
          {
LABEL_24:
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5983DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B598614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5986F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B598A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::UpdatedAcousticProfile::Verify(siri::speech::schema_fb::UpdatedAcousticProfile *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                if (v12 >= 0xB && v11[5]) {
                  uint64_t v14 = (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5]);
                }
                else {
                  uint64_t v14 = 0;
                }
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 < 0xDu
                      || (uint64_t v16 = v15[6]) == 0
                      || (BOOL result = siri::speech::schema_fb::UserAcousticProfile::Verify((siri::speech::schema_fb::UpdatedAcousticProfile *)((char *)this+ v16+ *(unsigned int *)((char *)this + v16)), a2)))
                    {
                      --*((_DWORD *)a2 + 4);
                      return 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B598D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B59900C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B5991C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B59942C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::Word::Verify(siri::speech::schema_fb::Word *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = 0;
          uint64_t v9 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v9) >= 7u)
          {
            if (!*(_WORD *)((char *)this - v9 + 6)) {
              goto LABEL_13;
            }
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v9 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v9 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            unint64_t v8 = 0;
            uint64_t v9 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v9) >= 7u)
            {
LABEL_13:
              uint64_t v10 = *(unsigned __int16 *)((char *)this - v9 + 6);
              if (v10) {
                unint64_t v8 = (_DWORD *)((char *)this + v10 + *(unsigned int *)((char *)this + v10));
              }
              else {
                unint64_t v8 = 0;
              }
            }
          }
          BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v8);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                if (v12 >= 0xB && v11[5]) {
                  uint64_t v14 = (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5]);
                }
                else {
                  uint64_t v14 = 0;
                }
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  --*((_DWORD *)a2 + 4);
                  return 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B59977C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B599ABC(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

void sub_22B599C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B599DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::UserDataEntity::Verify(siri::speech::schema_fb::UserDataEntity *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
        goto LABEL_12;
      }
      if (*(_WORD *)((char *)this - v5 + 4))
      {
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v5 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
          goto LABEL_12;
        }
      }
      uint64_t v6 = *(unsigned __int16 *)((char *)this - v5 + 4);
      if (v6 && (uint64_t v7 = (_DWORD *)((char *)this + v6 + *(unsigned int *)((char *)this + v6)), *v7))
      {
        unint64_t v8 = 0;
        uint64_t v9 = v7 + 1;
        while (siri::speech::schema_fb::Word::Verify((siri::speech::schema_fb::Word *)((char *)v9 + *v9), a2))
        {
          ++v8;
          ++v9;
          if (v8 >= *v7) {
            goto LABEL_12;
          }
        }
        return 0;
      }
      else
      {
LABEL_12:
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B59A068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B59A408(_Unwind_Exception *a1)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

void sub_22B59A57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59A7A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::CategoryData::Verify(siri::speech::schema_fb::CategoryData *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v8) < 7u) {
            goto LABEL_18;
          }
          if (*(_WORD *)((char *)this - v8 + 6))
          {
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v8 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v8 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v8 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v8) < 7u) {
              goto LABEL_18;
            }
          }
          uint64_t v9 = *(unsigned __int16 *)((char *)this - v8 + 6);
          if (v9 && (uint64_t v10 = (_DWORD *)((char *)this + v9 + *(unsigned int *)((char *)this + v9)), *v10))
          {
            unint64_t v11 = 0;
            unsigned int v12 = v10 + 1;
            while (siri::speech::schema_fb::UserDataEntity::Verify((siri::speech::schema_fb::UserDataEntity *)((char *)v12 + *v12), a2))
            {
              ++v11;
              ++v12;
              if (v11 >= *v10) {
                goto LABEL_18;
              }
            }
            return 0;
          }
          else
          {
LABEL_18:
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B59AA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B59AF20(_Unwind_Exception *a1)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

void sub_22B59B05C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59B180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59B68C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::CategoryData>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::CategoryData::Verify((siri::speech::schema_fb::CategoryData *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B59B898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B59BB10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59BC60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59C1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59C33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B59C594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59C97C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::StartPronGuessRequest::Verify(siri::speech::schema_fb::StartPronGuessRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                unint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                unint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  uint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 >= 0xBu && (uint64_t v15 = v14[5]) != 0) {
                    uint64_t v16 = (const unsigned __int8 *)this + v15 + *(unsigned int *)((char *)this + v15);
                  }
                  else {
                    uint64_t v16 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v16);
                  if (result)
                  {
                    uint64_t v17 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v17 < 0xDu
                      || (uint64_t v18 = v17[6]) == 0
                      || (BOOL result = 0, v19 = *((void *)a2 + 1), v19 >= 5)
                      && v19 - 4 >= (unint64_t)this + v18 - *(void *)a2)
                    {
                      --*((_DWORD *)a2 + 4);
                      return 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B59CCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B59CEB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59D1E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::CancelRequest::Verify(siri::speech::schema_fb::CancelRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                unint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                unint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B59D4AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B59D5E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59D804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::Pronunciation::Verify(siri::speech::schema_fb::Pronunciation *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B59DA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B59DC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B59DD14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B59DF80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::VocToken::Verify(siri::speech::schema_fb::VocToken *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 < 7u
            || (uint64_t v9 = v8[3]) == 0
            || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9), 1uLL, 0)))
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B59E1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B59E8DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26)
{
  if (__p) {
    operator delete(__p);
  }
  if (v26) {
    operator delete(v26);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B59EABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59EBEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59ECCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B59F0A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::PronGuessResponse::Verify(siri::speech::schema_fb::PronGuessResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                uint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 >= 0xDu && (uint64_t v16 = v15[6]) != 0) {
                      uint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                    }
                    else {
                      uint64_t v17 = 0;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                    if (result)
                    {
                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                      if (result)
                      {
                        uint64_t v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                        if (*v18 < 0xFu
                          || (uint64_t v19 = v18[7]) == 0
                          || (BOOL result = siri::speech::schema_fb::VocToken::Verify((siri::speech::schema_fb::PronGuessResponse *)((char *)this+ v19+ *(unsigned int *)((char *)this + v19)), a2)))
                        {
                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                          if (result)
                          {
                            unint64_t v20 = 0;
                            uint64_t v21 = *(int *)this;
                            if (*(unsigned __int16 *)((char *)this - v21) >= 0x11u)
                            {
                              if (!*(_WORD *)((char *)this - v21 + 16)) {
                                goto LABEL_39;
                              }
                              BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v21 + 16)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v21 + 16)), 4uLL, 0);
                              if (!result) {
                                return result;
                              }
                              unint64_t v20 = 0;
                              uint64_t v21 = *(int *)this;
                              if (*(unsigned __int16 *)((char *)this - v21) >= 0x11u)
                              {
LABEL_39:
                                uint64_t v22 = *(unsigned __int16 *)((char *)this - v21 + 16);
                                if (v22) {
                                  unint64_t v20 = (_DWORD *)((char *)this + v22 + *(unsigned int *)((char *)this + v22));
                                }
                                else {
                                  unint64_t v20 = 0;
                                }
                              }
                            }
                            BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::Pronunciation>(a2, v20);
                            if (result)
                            {
                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                              if (result)
                              {
                                uint64_t v23 = 0;
                                uint64_t v24 = *(int *)this;
                                if (*(unsigned __int16 *)((char *)this - v24) >= 0x13u)
                                {
                                  if (!*(_WORD *)((char *)this - v24 + 18)) {
                                    goto LABEL_48;
                                  }
                                  BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v24 + 18)+ *(unsigned int *)((char *)this+ *(unsigned __int16 *)((char *)this - v24 + 18)), 4uLL, 0);
                                  if (!result) {
                                    return result;
                                  }
                                  uint64_t v23 = 0;
                                  uint64_t v24 = *(int *)this;
                                  if (*(unsigned __int16 *)((char *)this - v24) >= 0x13u)
                                  {
LABEL_48:
                                    uint64_t v25 = *(unsigned __int16 *)((char *)this - v24 + 18);
                                    if (v25) {
                                      uint64_t v23 = (_DWORD *)((char *)this + v25 + *(unsigned int *)((char *)this + v25));
                                    }
                                    else {
                                      uint64_t v23 = 0;
                                    }
                                  }
                                }
                                BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v23);
                                if (result)
                                {
                                  --*((_DWORD *)a2 + 4);
                                  return 1;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::Pronunciation>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::Pronunciation::Verify((siri::speech::schema_fb::Pronunciation *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B59F5F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B59FA10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B59FBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A0070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A0200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A083C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p)
{
  if (v32) {
    operator delete(v32);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_22B5A0A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A0B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A10A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::VocToken>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::VocToken::Verify((siri::speech::schema_fb::VocToken *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5A12B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A16CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5A1868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A1B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::StartBatchRecoverRequest::Verify(siri::speech::schema_fb::StartBatchRecoverRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                unint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                unint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  uint64_t v14 = 0;
                  uint64_t v15 = *(int *)this;
                  if (*(unsigned __int16 *)((char *)this - v15) >= 0xBu)
                  {
                    if (!*(_WORD *)((char *)this - v15 + 10)) {
                      goto LABEL_25;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v15 + 10)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v15 + 10)), 4uLL, 0);
                    if (!result) {
                      return result;
                    }
                    uint64_t v14 = 0;
                    uint64_t v15 = *(int *)this;
                    if (*(unsigned __int16 *)((char *)this - v15) >= 0xBu)
                    {
LABEL_25:
                      uint64_t v16 = *(unsigned __int16 *)((char *)this - v15 + 10);
                      if (v16) {
                        uint64_t v14 = (_DWORD *)((char *)this + v16 + *(unsigned int *)((char *)this + v16));
                      }
                      else {
                        uint64_t v14 = 0;
                      }
                    }
                  }
                  BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v14);
                  if (result)
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5A1EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A2160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A2550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::BatchRecoverFinalResponse::Verify(siri::speech::schema_fb::BatchRecoverFinalResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                if (v12 >= 0xB && v11[5]) {
                  uint64_t v14 = (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5]);
                }
                else {
                  uint64_t v14 = 0;
                }
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                  unsigned int v16 = *v15;
                  if (v16 < 0xD
                    || (!v15[6]
                     || (BOOL result = 0, v17 = *((void *)a2 + 1), v17 >= 5)
                     && v17 - 4 >= (unint64_t)this + v15[6] - *(void *)a2)
                    && (v16 < 0xF
                     || (!v15[7]
                      || (BOOL result = 0, v18 = *((void *)a2 + 1), v18 >= 5)
                      && v18 - 4 >= (unint64_t)this + v15[7] - *(void *)a2)
                     && (v16 < 0x11
                      || (uint64_t v19 = v15[8]) == 0
                      || (BOOL result = 0, v20 = *((void *)a2 + 1), v20 >= 5)
                      && v20 - 4 >= (unint64_t)this + v19 - *(void *)a2)))
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5A2908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A2CFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5A2E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A3358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A34E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A3954(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5A3AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A40E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A4278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A46C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5A4868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A4E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A4F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A53FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5A5594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A5B90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A5D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A5F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A64E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A6674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A697C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5A6AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A6CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A6E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A71D0(_Unwind_Exception *a1)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

void sub_22B5A7344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A7570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::NormalizedToken::Verify(siri::speech::schema_fb::NormalizedToken *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v8) < 7u) {
            goto LABEL_18;
          }
          if (*(_WORD *)((char *)this - v8 + 6))
          {
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v8 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v8 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v8 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v8) < 7u) {
              goto LABEL_18;
            }
          }
          uint64_t v9 = *(unsigned __int16 *)((char *)this - v8 + 6);
          if (v9 && (uint64_t v10 = (_DWORD *)((char *)this + v9 + *(unsigned int *)((char *)this + v9)), *v10))
          {
            unint64_t v11 = 0;
            unsigned int v12 = v10 + 1;
            while (siri::speech::schema_fb::AudioPacket::Verify((siri::speech::schema_fb::AudioPacket *)((char *)v12 + *v12), a2))
            {
              ++v11;
              ++v12;
              if (v11 >= *v10) {
                goto LABEL_18;
              }
            }
            return 0;
          }
          else
          {
LABEL_18:
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5A785C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A7CD4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5A7F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A8388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::NormalizedToken>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::NormalizedToken::Verify((siri::speech::schema_fb::NormalizedToken *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5A8594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A86F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A8940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A8AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A8C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A8F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A909C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5A97F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38)
{
  if (__p) {
    operator delete(__p);
  }
  if (a36) {
    operator delete(a36);
  }
  if (v38) {
    operator delete(v38);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5A9A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A9B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A9C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5A9DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5AA118(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

void sub_22B5AA280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AA428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TokenProns_::SanitizedSequence::Verify(siri::speech::schema_fb::TokenProns_::SanitizedSequence *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
        goto LABEL_12;
      }
      if (*(_WORD *)((char *)this - v5 + 4))
      {
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v5 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
          goto LABEL_12;
        }
      }
      uint64_t v6 = *(unsigned __int16 *)((char *)this - v5 + 4);
      if (v6 && (uint64_t v7 = (_DWORD *)((char *)this + v6 + *(unsigned int *)((char *)this + v6)), *v7))
      {
        unint64_t v8 = 0;
        uint64_t v9 = v7 + 1;
        while (siri::speech::schema_fb::UserParameters::Verify((siri::speech::schema_fb::UserParameters *)((char *)v9 + *v9), a2))
        {
          ++v8;
          ++v9;
          if (v8 >= *v7) {
            goto LABEL_12;
          }
        }
        return 0;
      }
      else
      {
LABEL_12:
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B5AA784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TokenProns::Verify(siri::speech::schema_fb::TokenProns *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v8) < 7u) {
            goto LABEL_18;
          }
          if (*(_WORD *)((char *)this - v8 + 6))
          {
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v8 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v8 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v8 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v8) < 7u) {
              goto LABEL_18;
            }
          }
          uint64_t v9 = *(unsigned __int16 *)((char *)this - v8 + 6);
          if (v9 && (uint64_t v10 = (_DWORD *)((char *)this + v9 + *(unsigned int *)((char *)this + v9)), *v10))
          {
            unint64_t v11 = 0;
            unsigned int v12 = v10 + 1;
            while (siri::speech::schema_fb::TokenProns_::SanitizedSequence::Verify((siri::speech::schema_fb::TokenProns_::SanitizedSequence *)((char *)v12 + *v12), a2))
            {
              ++v11;
              ++v12;
              if (v11 >= *v10) {
                goto LABEL_18;
              }
            }
            return 0;
          }
          else
          {
LABEL_18:
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (!result) {
              return result;
            }
            unint64_t v13 = 0;
            uint64_t v14 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v14) >= 9u)
            {
              if (!*(_WORD *)((char *)this - v14 + 8)) {
                goto LABEL_23;
              }
              BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v14 + 8)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v14 + 8)), 4uLL, 0);
              if (!result) {
                return result;
              }
              unint64_t v13 = 0;
              uint64_t v14 = *(int *)this;
              if (*(unsigned __int16 *)((char *)this - v14) >= 9u)
              {
LABEL_23:
                uint64_t v15 = *(unsigned __int16 *)((char *)this - v14 + 8);
                if (v15) {
                  unint64_t v13 = (_DWORD *)((char *)this + v15 + *(unsigned int *)((char *)this + v15));
                }
                else {
                  unint64_t v13 = 0;
                }
              }
            }
            BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::PronChoice>(a2, v13);
            if (result)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                unsigned int v16 = 0;
                uint64_t v17 = *(int *)this;
                if (*(unsigned __int16 *)((char *)this - v17) >= 0xBu)
                {
                  if (!*(_WORD *)((char *)this - v17 + 10)) {
                    goto LABEL_33;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v17 + 10)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v17 + 10)), 4uLL, 0);
                  if (!result) {
                    return result;
                  }
                  unsigned int v16 = 0;
                  uint64_t v17 = *(int *)this;
                  if (*(unsigned __int16 *)((char *)this - v17) >= 0xBu)
                  {
LABEL_33:
                    uint64_t v18 = *(unsigned __int16 *)((char *)this - v17 + 10);
                    if (v18) {
                      unsigned int v16 = (_DWORD *)((char *)this + v18 + *(unsigned int *)((char *)this + v18));
                    }
                    else {
                      unsigned int v16 = 0;
                    }
                  }
                }
                BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::PronChoice>(a2, v16);
                if (result)
                {
                  --*((_DWORD *)a2 + 4);
                  return 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::PronChoice>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::RequestStatsResponse_::Int32Stat::Verify((siri::speech::schema_fb::RequestStatsResponse_::Int32Stat *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5AAC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5AAE50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AAF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AB394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AB524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5ABDC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *a50)
{
  if (__p) {
    operator delete(__p);
  }
  if (a38) {
    operator delete(a38);
  }
  if (a50) {
    operator delete(a50);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5AC018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AC148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AC444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5ACAF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TokenProns>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::TokenProns::Verify((siri::speech::schema_fb::TokenProns *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5ACD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5ACFE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5AD144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AD2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::Alignment::Verify(siri::speech::schema_fb::Alignment *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6), 4uLL, 0)))
      {
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B5AD510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5AD6A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AD960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::Span::Verify(siri::speech::schema_fb::Span *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
      && (v6 < 7
       || (!v5[3]
        || (BOOL result = 0, v8 = *((void *)a2 + 1), v8 >= 5) && v8 - 4 >= (unint64_t)this + v5[3] - *(void *)a2)
       && (v6 < 9
        || !v5[4]
        || (BOOL result = 0, v9 = *((void *)a2 + 1), v9 >= 2) && v9 - 1 >= (unint64_t)this + v5[4] - *(void *)a2)))
    {
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
      if (result)
      {
        if (v6 >= 0xB && v5[5]) {
          uint64_t v10 = (const unsigned __int8 *)this + v5[5] + *(unsigned int *)((char *)this + v5[5]);
        }
        else {
          uint64_t v10 = 0;
        }
        BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
        if (result)
        {
          --*((_DWORD *)a2 + 4);
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_22B5ADC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5ADF20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5AE094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AE23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RepeatedSpan::Verify(siri::speech::schema_fb::RepeatedSpan *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = 0;
      uint64_t v6 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
      {
        if (!*(_WORD *)((char *)this - v6 + 4)) {
          goto LABEL_7;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v6 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v6 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = 0;
        uint64_t v6 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
        {
LABEL_7:
          uint64_t v7 = *(unsigned __int16 *)((char *)this - v6 + 4);
          if (v7) {
            uint64_t v5 = (_DWORD *)((char *)this + v7 + *(unsigned int *)((char *)this + v7));
          }
          else {
            uint64_t v5 = 0;
          }
        }
      }
      BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::Span>(a2, v5);
      if (result)
      {
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::Span>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::Span::Verify((siri::speech::schema_fb::Span *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5AE528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5AE850(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5AE9CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AEAAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AEC48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SpeechTranslationInfo::Verify(siri::speech::schema_fb::SpeechTranslationInfo *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = siri::speech::schema_fb::RecognitionSausage::Verify((siri::speech::schema_fb::SpeechTranslationInfo *)((char *)this+ v6+ *(unsigned int *)((char *)this + v6)), a2)))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v7 = 0;
          uint64_t v8 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v8) >= 7u)
          {
            if (!*(_WORD *)((char *)this - v8 + 6)) {
              goto LABEL_11;
            }
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v8 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v8 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v7 = 0;
            uint64_t v8 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v8) >= 7u)
            {
LABEL_11:
              uint64_t v9 = *(unsigned __int16 *)((char *)this - v8 + 6);
              if (v9) {
                uint64_t v7 = (_DWORD *)((char *)this + v9 + *(unsigned int *)((char *)this + v9));
              }
              else {
                uint64_t v7 = 0;
              }
            }
          }
          BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionChoice>(a2, v7);
          if (result)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5AEF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5AF7F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *a58)
{
  if (__p) {
    operator delete(__p);
  }
  if (a34) {
    operator delete(a34);
  }
  if (a46) {
    operator delete(a46);
  }
  if (a58) {
    operator delete(a58);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5AFA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AFBA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AFD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AFE94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5AFF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B0110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SiriTranslationInfo::Verify(siri::speech::schema_fb::SiriTranslationInfo *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = siri::speech::schema_fb::RecognitionSausage::Verify((siri::speech::schema_fb::SiriTranslationInfo *)((char *)this+ v6+ *(unsigned int *)((char *)this + v6)), a2)))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v7 = 0;
          uint64_t v8 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v8) >= 7u)
          {
            if (!*(_WORD *)((char *)this - v8 + 6)) {
              goto LABEL_11;
            }
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v8 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v8 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v7 = 0;
            uint64_t v8 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v8) >= 7u)
            {
LABEL_11:
              uint64_t v9 = *(unsigned __int16 *)((char *)this - v8 + 6);
              if (v9) {
                uint64_t v7 = (_DWORD *)((char *)this + v9 + *(unsigned int *)((char *)this + v9));
              }
              else {
                uint64_t v7 = 0;
              }
            }
          }
          BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionChoice>(a2, v7);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              uint64_t v10 = 0;
              uint64_t v11 = *(int *)this;
              if (*(unsigned __int16 *)((char *)this - v11) >= 9u)
              {
                if (!*(_WORD *)((char *)this - v11 + 8)) {
                  goto LABEL_20;
                }
                BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v11 + 8)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v11 + 8)), 4uLL, 0);
                if (!result) {
                  return result;
                }
                uint64_t v10 = 0;
                uint64_t v11 = *(int *)this;
                if (*(unsigned __int16 *)((char *)this - v11) >= 9u)
                {
LABEL_20:
                  uint64_t v12 = *(unsigned __int16 *)((char *)this - v11 + 8);
                  if (v12) {
                    uint64_t v10 = (_DWORD *)((char *)this + v12 + *(unsigned int *)((char *)this + v12));
                  }
                  else {
                    uint64_t v10 = 0;
                  }
                }
              }
              BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v10);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  unint64_t v13 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v13 >= 0xBu && (uint64_t v14 = v13[5]) != 0) {
                    uint64_t v15 = (const unsigned __int8 *)this + v14 + *(unsigned int *)((char *)this + v14);
                  }
                  else {
                    uint64_t v15 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v15);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      unsigned int v16 = 0;
                      uint64_t v17 = *(int *)this;
                      if (*(unsigned __int16 *)((char *)this - v17) >= 0xDu)
                      {
                        if (!*(_WORD *)((char *)this - v17 + 12)) {
                          goto LABEL_35;
                        }
                        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v17 + 12)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v17 + 12)), 4uLL, 0);
                        if (!result) {
                          return result;
                        }
                        unsigned int v16 = 0;
                        uint64_t v17 = *(int *)this;
                        if (*(unsigned __int16 *)((char *)this - v17) >= 0xDu)
                        {
LABEL_35:
                          uint64_t v18 = *(unsigned __int16 *)((char *)this - v17 + 12);
                          if (v18) {
                            unsigned int v16 = (_DWORD *)((char *)this + v18 + *(unsigned int *)((char *)this + v18));
                          }
                          else {
                            unsigned int v16 = 0;
                          }
                        }
                      }
                      BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::ItnAlignment>(a2, v16);
                      if (result)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                        if (result)
                        {
                          uint64_t v19 = 0;
                          uint64_t v20 = *(int *)this;
                          if (*(unsigned __int16 *)((char *)this - v20) >= 0xFu)
                          {
                            if (!*(_WORD *)((char *)this - v20 + 14)) {
                              goto LABEL_44;
                            }
                            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v20 + 14)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v20 + 14)), 4uLL, 0);
                            if (!result) {
                              return result;
                            }
                            uint64_t v19 = 0;
                            uint64_t v20 = *(int *)this;
                            if (*(unsigned __int16 *)((char *)this - v20) >= 0xFu)
                            {
LABEL_44:
                              uint64_t v21 = *(unsigned __int16 *)((char *)this - v20 + 14);
                              if (v21) {
                                uint64_t v19 = (_DWORD *)((char *)this + v21 + *(unsigned int *)((char *)this + v21));
                              }
                              else {
                                uint64_t v19 = 0;
                              }
                            }
                          }
                          BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::Span>(a2, v19);
                          if (result)
                          {
                            --*((_DWORD *)a2 + 4);
                            return 1;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5B05EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B07B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B088C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B0B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SiriPayloadTranslationInfo::Verify(siri::speech::schema_fb::SiriPayloadTranslationInfo *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 < 9u
                || (uint64_t v12 = v11[4]) == 0
                || (BOOL result = siri::speech::schema_fb::RecognitionSausage::Verify((siri::speech::schema_fb::SiriPayloadTranslationInfo *)((char *)this+ v12+ *(unsigned int *)((char *)this + v12)), a2)))
              {
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5B0DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B113C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5B12B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B14E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::WebTranslationInfo::Verify(siri::speech::schema_fb::WebTranslationInfo *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = 0;
          uint64_t v9 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v9) >= 7u)
          {
            if (!*(_WORD *)((char *)this - v9 + 6)) {
              goto LABEL_13;
            }
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v9 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v9 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v8 = 0;
            uint64_t v9 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v9) >= 7u)
            {
LABEL_13:
              uint64_t v10 = *(unsigned __int16 *)((char *)this - v9 + 6);
              if (v10) {
                uint64_t v8 = (_DWORD *)((char *)this + v10 + *(unsigned int *)((char *)this + v10));
              }
              else {
                uint64_t v8 = 0;
              }
            }
          }
          BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::Span>(a2, v8);
          if (result)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5B17A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B1EE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5B2208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B2360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B2434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B2508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B2634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B2A70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TranslationRequest::Verify(siri::speech::schema_fb::TranslationRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                unint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                unint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  uint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 >= 0xBu && (uint64_t v15 = v14[5]) != 0) {
                    unsigned int v16 = (const unsigned __int8 *)this + v15 + *(unsigned int *)((char *)this + v15);
                  }
                  else {
                    unsigned int v16 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v16);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      uint64_t v17 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v17 >= 0xDu && (uint64_t v18 = v17[6]) != 0) {
                        uint64_t v19 = (const unsigned __int8 *)this + v18 + *(unsigned int *)((char *)this + v18);
                      }
                      else {
                        uint64_t v19 = 0;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v19);
                      if (result)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                        if (result)
                        {
                          uint64_t v20 = 0;
                          uint64_t v21 = *(int *)this;
                          if (*(unsigned __int16 *)((char *)this - v21) >= 0xFu)
                          {
                            if (!*(_WORD *)((char *)this - v21 + 14)) {
                              goto LABEL_37;
                            }
                            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v21 + 14)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v21 + 14)), 4uLL, 0);
                            if (!result) {
                              return result;
                            }
                            uint64_t v20 = 0;
                            uint64_t v21 = *(int *)this;
                            if (*(unsigned __int16 *)((char *)this - v21) >= 0xFu)
                            {
LABEL_37:
                              uint64_t v22 = *(unsigned __int16 *)((char *)this - v21 + 14);
                              if (v22) {
                                uint64_t v20 = (_DWORD *)((char *)this + v22 + *(unsigned int *)((char *)this + v22));
                              }
                              else {
                                uint64_t v20 = 0;
                              }
                            }
                          }
                          BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v20);
                          if (result)
                          {
                            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                            if (result)
                            {
                              uint64_t v23 = (unsigned __int16 *)((char *)this - *(int *)this);
                              if (*v23 < 0x11u
                                || (uint64_t v24 = v23[8]) == 0
                                || (BOOL result = siri::speech::schema_fb::SiriTranslationInfo::Verify((siri::speech::schema_fb::TranslationRequest *)((char *)this+ v24+ *(unsigned int *)((char *)this + v24)), a2)))
                              {
                                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                                if (result)
                                {
                                  uint64_t v25 = (unsigned __int16 *)((char *)this - *(int *)this);
                                  if (*v25 < 0x13u
                                    || (uint64_t v26 = v25[9]) == 0
                                    || (BOOL result = siri::speech::schema_fb::SpeechTranslationInfo::Verify((siri::speech::schema_fb::TranslationRequest *)((char *)this+ v26+ *(unsigned int *)((char *)this + v26)), a2)))
                                  {
                                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                                    if (result)
                                    {
                                      uint64_t v27 = (unsigned __int16 *)((char *)this - *(int *)this);
                                      if (*v27 < 0x15u
                                        || (uint64_t v28 = v27[10]) == 0
                                        || (BOOL result = siri::speech::schema_fb::SiriPayloadTranslationInfo::Verify((siri::speech::schema_fb::TranslationRequest *)((char *)this + v28 + *(unsigned int *)((char *)this + v28)), a2)))
                                      {
                                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x16u);
                                        if (result)
                                        {
                                          uint64_t v29 = (unsigned __int16 *)((char *)this - *(int *)this);
                                          if (*v29 >= 0x17u && (uint64_t v30 = v29[11]) != 0) {
                                            v31 = (const unsigned __int8 *)this
                                          }
                                                + v30
                                                + *(unsigned int *)((char *)this + v30);
                                          else {
                                            v31 = 0;
                                          }
                                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v31);
                                          if (result)
                                          {
                                            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x18u);
                                            if (result)
                                            {
                                              uint64_t v32 = *(int *)this;
                                              unsigned int v33 = *(unsigned __int16 *)((char *)this - v32);
                                              if (v33 < 0x19) {
                                                goto LABEL_73;
                                              }
                                              if (*(_WORD *)((char *)this - v32 + 24))
                                              {
                                                BOOL result = siri::speech::schema_fb::WebTranslationInfo::Verify((siri::speech::schema_fb::TranslationRequest *)((char *)this + *(unsigned __int16 *)((char *)this - v32 + 24) + *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v32 + 24))), a2);
                                                if (!result) {
                                                  return result;
                                                }
                                                uint64_t v32 = *(int *)this;
                                                uint64_t v34 = -v32;
                                                unsigned int v33 = *(unsigned __int16 *)((char *)this - v32);
                                              }
                                              else
                                              {
                                                uint64_t v34 = -v32;
                                              }
                                              if (v33 < 0x1B
                                                || ((unint64_t v35 = (char *)this + v34, !*((_WORD *)v35 + 13))
                                                 || (BOOL result = 0, v36 = *((void *)a2 + 1), v36 >= 2)
                                                 && v36 - 1 >= (unint64_t)this
                                                             + *((unsigned __int16 *)v35 + 13)
                                                             - *(void *)a2)
                                                && (v33 < 0x1D
                                                 || (uint64_t v37 = *((unsigned __int16 *)v35 + 14), !*((_WORD *)v35 + 14))
                                                 || (BOOL result = 0, v38 = *((void *)a2 + 1), v38 >= 5)
                                                 && v38 - 4 >= (unint64_t)this + v37 - *(void *)a2))
                                              {
LABEL_73:
                                                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Eu);
                                                if (result)
                                                {
                                                  v39 = (unsigned __int16 *)((char *)this - (int)v32);
                                                  if (*v39 >= 0x1Fu && (uint64_t v40 = v39[15]) != 0) {
                                                    unint64_t v41 = (const unsigned __int8 *)this
                                                  }
                                                        + v40
                                                        + *(unsigned int *)((char *)this + v40);
                                                  else {
                                                    unint64_t v41 = 0;
                                                  }
                                                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v41);
                                                  if (result)
                                                  {
                                                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x20u);
                                                    if (result)
                                                    {
                                                      unint64_t v42 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                      if (*v42 >= 0x21u && (uint64_t v43 = v42[16]) != 0) {
                                                        unint64_t v44 = (const unsigned __int8 *)this
                                                      }
                                                            + v43
                                                            + *(unsigned int *)((char *)this + v43);
                                                      else {
                                                        unint64_t v44 = 0;
                                                      }
                                                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v44);
                                                      if (result)
                                                      {
                                                        --*((_DWORD *)a2 + 4);
                                                        return 1;
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5B3110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B3504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B3B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::StreamingTranslationRequest::Verify(siri::speech::schema_fb::StreamingTranslationRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                unint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                unint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  uint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 >= 0xBu && (uint64_t v15 = v14[5]) != 0) {
                    unsigned int v16 = (const unsigned __int8 *)this + v15 + *(unsigned int *)((char *)this + v15);
                  }
                  else {
                    unsigned int v16 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v16);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      uint64_t v17 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v17 >= 0xDu && (uint64_t v18 = v17[6]) != 0) {
                        uint64_t v19 = (const unsigned __int8 *)this + v18 + *(unsigned int *)((char *)this + v18);
                      }
                      else {
                        uint64_t v19 = 0;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v19);
                      if (result)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                        if (result)
                        {
                          uint64_t v20 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v20 >= 0xFu && (uint64_t v21 = v20[7]) != 0) {
                            uint64_t v22 = (const unsigned __int8 *)this + v21 + *(unsigned int *)((char *)this + v21);
                          }
                          else {
                            uint64_t v22 = 0;
                          }
                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v22);
                          if (result)
                          {
                            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                            if (result)
                            {
                              uint64_t v23 = (unsigned __int16 *)((char *)this - *(int *)this);
                              if (*v23 >= 0x11u && (uint64_t v24 = v23[8]) != 0) {
                                uint64_t v25 = (const unsigned __int8 *)this + v24 + *(unsigned int *)((char *)this + v24);
                              }
                              else {
                                uint64_t v25 = 0;
                              }
                              BOOL result = flatbuffers::Verifier::VerifyString(a2, v25);
                              if (result)
                              {
                                uint64_t v26 = (unsigned __int16 *)((char *)this - *(int *)this);
                                unsigned int v27 = *v26;
                                if (v27 < 0x13
                                  || (!v26[9]
                                   || (BOOL result = 0, v28 = *((void *)a2 + 1), v28 >= 2)
                                   && v28 - 1 >= (unint64_t)this + v26[9] - *(void *)a2)
                                  && (v27 < 0x15
                                   || !v26[10]
                                   || (BOOL result = 0, v29 = *((void *)a2 + 1), v29 >= 5)
                                   && v29 - 4 >= (unint64_t)this + v26[10] - *(void *)a2))
                                {
                                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x16u);
                                  if (result)
                                  {
                                    if (v27 >= 0x17 && v26[11]) {
                                      uint64_t v30 = (const unsigned __int8 *)this
                                    }
                                          + v26[11]
                                          + *(unsigned int *)((char *)this + v26[11]);
                                    else {
                                      uint64_t v30 = 0;
                                    }
                                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v30);
                                    if (result)
                                    {
                                      v31 = (unsigned __int16 *)((char *)this - *(int *)this);
                                      if (*v31 < 0x19u
                                        || (uint64_t v32 = v31[12]) == 0
                                        || (BOOL result = 0, v33 = *((void *)a2 + 1), v33 >= 2)
                                        && v33 - 1 >= (unint64_t)this + v32 - *(void *)a2)
                                      {
                                        --*((_DWORD *)a2 + 4);
                                        return 1;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5B408C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B474C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36)
{
  if (__p) {
    operator delete(__p);
  }
  if (a36) {
    operator delete(a36);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5B49FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B4B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B5124(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,uint64_t a24)
{
  if (__p) {
    operator delete(__p);
  }
  if (v24) {
    operator delete(v24);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5B5328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B54DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B5648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B5810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B5920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B5B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TranslationResponse_::TranslationToken::Verify(siri::speech::schema_fb::TranslationResponse_::TranslationToken *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        uint64_t v8 = *(int *)this;
        uint64_t v9 = (char *)this - v8;
        unsigned int v10 = *(unsigned __int16 *)((char *)this - v8);
        if (v10 < 7
          || !*((_WORD *)v9 + 3)
          || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
          && v11 - 4 >= (unint64_t)this + *((unsigned __int16 *)v9 + 3) - *(void *)a2)
        {
          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
          if (result)
          {
            if (v10 < 9) {
              goto LABEL_22;
            }
            if (*((_WORD *)v9 + 4))
            {
              BOOL result = siri::speech::schema_fb::Alignment::Verify((siri::speech::schema_fb::TranslationResponse_::TranslationToken *)((char *)this+ *((unsigned __int16 *)v9 + 4)+ *(unsigned int *)((char *)this + *((unsigned __int16 *)v9 + 4))), a2);
              if (!result) {
                return result;
              }
              uint64_t v12 = *(int *)this;
              uint64_t v13 = -v12;
              unsigned int v10 = *(unsigned __int16 *)((char *)this - v12);
            }
            else
            {
              uint64_t v13 = -v8;
            }
            if (v10 < 0xB
              || (uint64_t v14 = *(unsigned __int16 *)((char *)this + v13 + 10)) == 0
              || (BOOL result = 0, v15 = *((void *)a2 + 1), v15 >= 2)
              && v15 - 1 >= (unint64_t)this + v14 - *(void *)a2)
            {
LABEL_22:
              --*((_DWORD *)a2 + 4);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5B5EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TranslationResponse_::TranslationPhrase::Verify(siri::speech::schema_fb::TranslationResponse_::TranslationPhrase *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (!result) {
    return result;
  }
  uint64_t v5 = *(int *)this;
  uint64_t v6 = (char *)this - v5;
  unsigned int v7 = *(unsigned __int16 *)((char *)this - v5);
  if (v7 >= 5)
  {
    if (*((_WORD *)v6 + 2))
    {
      BOOL result = 0;
      unint64_t v8 = *((void *)a2 + 1);
      if (v8 < 5 || v8 - 4 < (unint64_t)this + *((unsigned __int16 *)v6 + 2) - *(void *)a2) {
        return result;
      }
    }
  }
  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
  if (!result) {
    return result;
  }
  if (v7 < 7) {
    goto LABEL_18;
  }
  if (*((_WORD *)v6 + 3))
  {
    BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *((unsigned __int16 *)v6 + 3)+ *(unsigned int *)((char *)this + *((unsigned __int16 *)v6 + 3)), 4uLL, 0);
    if (!result) {
      return result;
    }
    uint64_t v9 = *(int *)this;
    if (*(unsigned __int16 *)((char *)this - v9) < 7u) {
      goto LABEL_18;
    }
    uint64_t v10 = -v9;
  }
  else
  {
    uint64_t v10 = -v5;
  }
  uint64_t v11 = *(unsigned __int16 *)((char *)this + v10 + 6);
  if (v11)
  {
    uint64_t v12 = (_DWORD *)((char *)this + v11 + *(unsigned int *)((char *)this + v11));
    if (*v12)
    {
      unint64_t v13 = 0;
      uint64_t v14 = v12 + 1;
      while (siri::speech::schema_fb::TranslationResponse_::TranslationToken::Verify((siri::speech::schema_fb::TranslationResponse_::TranslationToken *)((char *)v14 + *v14), a2))
      {
        ++v13;
        ++v14;
        if (v13 >= *v12) {
          goto LABEL_18;
        }
      }
      return 0;
    }
  }
LABEL_18:
  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
  if (result)
  {
    unint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
    if (*v15 >= 9u && (uint64_t v16 = v15[4]) != 0) {
      uint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
    }
    else {
      uint64_t v17 = 0;
    }
    BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
    if (result)
    {
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
      if (result)
      {
        uint64_t v18 = 0;
        uint64_t v19 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v19) >= 0xBu)
        {
          if (!*(_WORD *)((char *)this - v19 + 10)) {
            goto LABEL_29;
          }
          BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v19 + 10)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v19 + 10)), 4uLL, 0);
          if (!result) {
            return result;
          }
          uint64_t v18 = 0;
          uint64_t v19 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v19) >= 0xBu)
          {
LABEL_29:
            uint64_t v20 = *(unsigned __int16 *)((char *)this - v19 + 10);
            if (v20) {
              uint64_t v18 = (_DWORD *)((char *)this + v20 + *(unsigned int *)((char *)this + v20));
            }
            else {
              uint64_t v18 = 0;
            }
          }
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RepeatedSpan>(a2, v18);
        if (result)
        {
          uint64_t v21 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v21 < 0xDu
            || (uint64_t v22 = v21[6]) == 0
            || (BOOL result = 0, v23 = *((void *)a2 + 1), v23 >= 2)
            && v23 - 1 >= (unint64_t)this + v22 - *(void *)a2)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RepeatedSpan>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::RepeatedSpan::Verify((siri::speech::schema_fb::RepeatedSpan *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5B63B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B6718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TranslationResponse::Verify(siri::speech::schema_fb::TranslationResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unsigned int v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        unsigned int v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                uint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    unint64_t v15 = 0;
                    uint64_t v16 = *(int *)this;
                    if (*(unsigned __int16 *)((char *)this - v16) >= 0xDu)
                    {
                      if (!*(_WORD *)((char *)this - v16 + 12)) {
                        goto LABEL_29;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v16 + 12)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v16 + 12)), 4uLL, 0);
                      if (!result) {
                        return result;
                      }
                      unint64_t v15 = 0;
                      uint64_t v16 = *(int *)this;
                      if (*(unsigned __int16 *)((char *)this - v16) >= 0xDu)
                      {
LABEL_29:
                        uint64_t v17 = *(unsigned __int16 *)((char *)this - v16 + 12);
                        if (v17) {
                          unint64_t v15 = (_DWORD *)((char *)this + v17 + *(unsigned int *)((char *)this + v17));
                        }
                        else {
                          unint64_t v15 = 0;
                        }
                      }
                    }
                    BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>(a2, v15);
                    if (result)
                    {
                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                      if (result)
                      {
                        uint64_t v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                        if (*v18 >= 0xFu && (uint64_t v19 = v18[7]) != 0) {
                          uint64_t v20 = (const unsigned __int8 *)this + v19 + *(unsigned int *)((char *)this + v19);
                        }
                        else {
                          uint64_t v20 = 0;
                        }
                        BOOL result = flatbuffers::Verifier::VerifyString(a2, v20);
                        if (result)
                        {
                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                          if (result)
                          {
                            uint64_t v21 = 0;
                            uint64_t v22 = *(int *)this;
                            if (*(unsigned __int16 *)((char *)this - v22) >= 0x11u)
                            {
                              if (!*(_WORD *)((char *)this - v22 + 16)) {
                                goto LABEL_44;
                              }
                              BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v22 + 16)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v22 + 16)), 4uLL, 0);
                              if (!result) {
                                return result;
                              }
                              uint64_t v21 = 0;
                              uint64_t v22 = *(int *)this;
                              if (*(unsigned __int16 *)((char *)this - v22) >= 0x11u)
                              {
LABEL_44:
                                uint64_t v23 = *(unsigned __int16 *)((char *)this - v22 + 16);
                                if (v23) {
                                  uint64_t v21 = (_DWORD *)((char *)this + v23 + *(unsigned int *)((char *)this + v23));
                                }
                                else {
                                  uint64_t v21 = 0;
                                }
                              }
                            }
                            BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>(a2, v21);
                            if (result)
                            {
                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                              if (result)
                              {
                                uint64_t v24 = (unsigned __int16 *)((char *)this - *(int *)this);
                                if (*v24 >= 0x13u && (uint64_t v25 = v24[9]) != 0) {
                                  uint64_t v26 = (const unsigned __int8 *)this + v25 + *(unsigned int *)((char *)this + v25);
                                }
                                else {
                                  uint64_t v26 = 0;
                                }
                                BOOL result = flatbuffers::Verifier::VerifyString(a2, v26);
                                if (result)
                                {
                                  unsigned int v27 = (unsigned __int16 *)((char *)this - *(int *)this);
                                  if (*v27 < 0x15u
                                    || (uint64_t v28 = v27[10]) == 0
                                    || (BOOL result = 0, v29 = *((void *)a2 + 1), v29 >= 2)
                                    && v29 - 1 >= (unint64_t)this + v28 - *(void *)a2)
                                  {
                                    --*((_DWORD *)a2 + 4);
                                    return 1;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::TranslationResponse_::TranslationPhrase::Verify((siri::speech::schema_fb::TranslationResponse_::TranslationPhrase *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5B6CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B6ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B7268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::EndPointLikelihood::Verify(siri::speech::schema_fb::EndPointLikelihood *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                if (v12 >= 0xB && v11[5]) {
                  uint64_t v14 = (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5]);
                }
                else {
                  uint64_t v14 = 0;
                }
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  unint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v15 < 0xDu
                    || (uint64_t v16 = v15[6]) == 0
                    || (BOOL result = 0, v17 = *((void *)a2 + 1), v17 >= 5)
                    && v17 - 4 >= (unint64_t)this + v16 - *(void *)a2)
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5B75B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B77F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B7BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::EndPointCandidate::Verify(siri::speech::schema_fb::EndPointCandidate *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                if (v12 >= 0xB && v11[5]) {
                  uint64_t v14 = (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5]);
                }
                else {
                  uint64_t v14 = 0;
                }
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  unint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                  unsigned int v16 = *v15;
                  if (v16 < 0xD
                    || (!v15[6]
                     || (BOOL result = 0, v17 = *((void *)a2 + 1), v17 >= 5)
                     && v17 - 4 >= (unint64_t)this + v15[6] - *(void *)a2)
                    && (v16 < 0xF
                     || (uint64_t v18 = v15[7]) == 0
                     || (BOOL result = 0, v19 = *((void *)a2 + 1), v19 >= 5)
                     && v19 - 4 >= (unint64_t)this + v18 - *(void *)a2))
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5B7F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B828C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SetRequestOrigin::Verify(siri::speech::schema_fb::SetRequestOrigin *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 9) && v7 - 8 >= (unint64_t)this + v5[2] - *(void *)a2)
      && (v6 < 7
       || (!v5[3]
        || (BOOL result = 0, v8 = *((void *)a2 + 1), v8 >= 9) && v8 - 8 >= (unint64_t)this + v5[3] - *(void *)a2)
       && (v6 < 9
        || (uint64_t v9 = v5[4]) == 0
        || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 2) && v10 - 1 >= (unint64_t)this + v9 - *(void *)a2)))
    {
      --*((_DWORD *)a2 + 4);
      return 1;
    }
  }
  return result;
}

void sub_22B5B8514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B866C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B88BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RecognitionProgress::Verify(siri::speech::schema_fb::RecognitionProgress *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || !v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
      if (result)
      {
        if (v6 >= 7 && v5[3]) {
          unint64_t v8 = (const unsigned __int8 *)this + v5[3] + *(unsigned int *)((char *)this + v5[3]);
        }
        else {
          unint64_t v8 = 0;
        }
        BOOL result = flatbuffers::Verifier::VerifyString(a2, v8);
        if (result)
        {
          --*((_DWORD *)a2 + 4);
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_22B5B8B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B8DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::ResetServerEndpointer::Verify(siri::speech::schema_fb::ResetServerEndpointer *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    if (*v5 < 5u
      || (uint64_t v6 = v5[2]) == 0
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 9) && v7 - 8 >= (unint64_t)this + v6 - *(void *)a2)
    {
      --*((_DWORD *)a2 + 4);
      return 1;
    }
  }
  return result;
}

void sub_22B5B8FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5B9418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B9590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B9744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B98F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5B9C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::RecognitionCandidate::Verify(siri::speech::schema_fb::RecognitionCandidate *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                uint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    unint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 < 0xDu
                      || (uint64_t v16 = v15[6]) == 0
                      || (BOOL result = siri::speech::schema_fb::RecognitionResult::Verify((siri::speech::schema_fb::RecognitionCandidate *)((char *)this+ v16+ *(unsigned int *)((char *)this + v16)), a2)))
                    {
                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                      if (result)
                      {
                        unint64_t v17 = (unsigned __int16 *)((char *)this - *(int *)this);
                        if (*v17 >= 0xFu && (uint64_t v18 = v17[7]) != 0) {
                          unint64_t v19 = (const unsigned __int8 *)this + v18 + *(unsigned int *)((char *)this + v18);
                        }
                        else {
                          unint64_t v19 = 0;
                        }
                        BOOL result = flatbuffers::Verifier::VerifyString(a2, v19);
                        if (result)
                        {
                          uint64_t v20 = *(int *)this;
                          uint64_t v21 = (_WORD *)((char *)this - v20);
                          unsigned int v22 = *(unsigned __int16 *)((char *)this - v20);
                          if (v22 < 0x11
                            || (!v21[8]
                             || (BOOL result = 0, v23 = *((void *)a2 + 1), v23 >= 9)
                             && v23 - 8 >= (unint64_t)this + (unsigned __int16)v21[8] - *(void *)a2)
                            && (v22 < 0x13
                             || !v21[9]
                             || (BOOL result = 0, v24 = *((void *)a2 + 1), v24 >= 5)
                             && v24 - 4 >= (unint64_t)this + (unsigned __int16)v21[9] - *(void *)a2))
                          {
                            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                            if (result)
                            {
                              if (v22 < 0x15) {
                                goto LABEL_56;
                              }
                              if (v21[10])
                              {
                                BOOL result = siri::speech::schema_fb::AudioAnalytics::Verify((siri::speech::schema_fb::RecognitionCandidate *)((char *)this+ (unsigned __int16)v21[10]+ *(unsigned int *)((char *)this + (unsigned __int16)v21[10])), a2);
                                if (!result) {
                                  return result;
                                }
                                uint64_t v20 = *(int *)this;
                                uint64_t v25 = -v20;
                                unsigned int v22 = *(unsigned __int16 *)((char *)this - v20);
                              }
                              else
                              {
                                uint64_t v25 = -v20;
                              }
                              if (v22 < 0x17
                                || ((uint64_t v26 = (char *)this + v25, !*((_WORD *)v26 + 11))
                                 || (BOOL result = 0, v27 = *((void *)a2 + 1), v27 >= 5)
                                 && v27 - 4 >= (unint64_t)this + *((unsigned __int16 *)v26 + 11) - *(void *)a2)
                                && (v22 < 0x19
                                 || (uint64_t v28 = *((unsigned __int16 *)v26 + 12)) == 0
                                 || (BOOL result = 0, v29 = *((void *)a2 + 1), v29 >= 9)
                                 && v29 - 8 >= (unint64_t)this + v28 - *(void *)a2))
                              {
LABEL_56:
                                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Au);
                                if (result)
                                {
                                  uint64_t v30 = (unsigned __int16 *)((char *)this - (int)v20);
                                  if (*v30 >= 0x1Bu && (uint64_t v31 = v30[13]) != 0) {
                                    uint64_t v32 = (const unsigned __int8 *)this + v31 + *(unsigned int *)((char *)this + v31);
                                  }
                                  else {
                                    uint64_t v32 = 0;
                                  }
                                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v32);
                                  if (result)
                                  {
                                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Cu);
                                    if (result)
                                    {
                                      unint64_t v33 = (unsigned __int16 *)((char *)this - *(int *)this);
                                      if (*v33 < 0x1Du
                                        || (uint64_t v34 = v33[14]) == 0
                                        || (BOOL result = siri::speech::schema_fb::LatnnMitigatorResult::Verify((siri::speech::schema_fb::RecognitionCandidate *)((char *)this + v34 + *(unsigned int *)((char *)this + v34)), a2)))
                                      {
                                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Eu);
                                        if (result)
                                        {
                                          unint64_t v35 = (unsigned __int16 *)((char *)this - *(int *)this);
                                          if (*v35 >= 0x1Fu && (uint64_t v36 = v35[15]) != 0) {
                                            uint64_t v37 = (const unsigned __int8 *)this
                                          }
                                                + v36
                                                + *(unsigned int *)((char *)this + v36);
                                          else {
                                            uint64_t v37 = 0;
                                          }
                                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v37);
                                          if (result)
                                          {
                                            --*((_DWORD *)a2 + 4);
                                            return 1;
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5BA21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5BA524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::CheckForSpeechRequest::Verify(siri::speech::schema_fb::CheckForSpeechRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 9) && v7 - 8 >= (unint64_t)this + v5[2] - *(void *)a2)
      && (v6 < 7
       || (uint64_t v8 = v5[3]) == 0
       || (BOOL result = 0, v9 = *((void *)a2 + 1), v9 >= 9) && v9 - 8 >= (unint64_t)this + v8 - *(void *)a2))
    {
      --*((_DWORD *)a2 + 4);
      return 1;
    }
  }
  return result;
}

void sub_22B5BA774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5BAA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BABC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5BB2D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p)
{
  if (v32) {
    operator delete(v32);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5BB57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BB6B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BB788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BB9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BBA9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BBFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::AudioPacket>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::AudioPacket::Verify((siri::speech::schema_fb::AudioPacket *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5BC1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5BC380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BC730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BC8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5BCA3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BCCB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::LmScorerToken::Verify(siri::speech::schema_fb::LmScorerToken *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        unsigned int v9 = *v8;
        if (v9 < 7
          || (!v8[3]
           || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 9)
           && v10 - 8 >= (unint64_t)this + v8[3] - *(void *)a2)
          && (v9 < 9
           || (uint64_t v11 = v8[4]) == 0
           || (BOOL result = 0, v12 = *((void *)a2 + 1), v12 >= 5)
           && v12 - 4 >= (unint64_t)this + v11 - *(void *)a2))
        {
          --*((_DWORD *)a2 + 4);
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_22B5BCF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5BD13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BD560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BD6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5BDAE4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5BDC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BE070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BE200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5BE360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BE5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BE73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5BEBE4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5BED5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BEE80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BF3DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BF56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5BFA0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5BFB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5BFC78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C02B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C0440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C0868(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5C0B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C0D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::ServerEndpointFeatures::Verify(siri::speech::schema_fb::ServerEndpointFeatures *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = *(int *)this;
    uint64_t v6 = (_WORD *)((char *)this - v5);
    unsigned int v7 = *(unsigned __int16 *)((char *)this - v5);
    if (v7 < 5) {
      goto LABEL_18;
    }
    if (!v6[2]
      || (BOOL result = 0, v8 = *((void *)a2 + 1), v8 >= 5)
      && v8 - 4 >= (unint64_t)this + (unsigned __int16)v6[2] - *(void *)a2)
    {
      if (v7 < 7
        || (!v6[3]
         || (BOOL result = 0, v9 = *((void *)a2 + 1), v9 >= 5)
         && v9 - 4 >= (unint64_t)this + (unsigned __int16)v6[3] - *(void *)a2)
        && (v7 < 9
         || (!v6[4]
          || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
          && v10 - 4 >= (unint64_t)this + (unsigned __int16)v6[4] - *(void *)a2)
         && (v7 < 0xB
          || !v6[5]
          || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 9)
          && v11 - 8 >= (unint64_t)this + (unsigned __int16)v6[5] - *(void *)a2)))
      {
LABEL_18:
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
        if (result)
        {
          if (v7 < 0xD) {
            goto LABEL_28;
          }
          if (v6[6])
          {
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ (unsigned __int16)v6[6]+ *(unsigned int *)((char *)this + (unsigned __int16)v6[6]), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v5 = *(int *)this;
            uint64_t v12 = -v5;
            unsigned int v7 = *(unsigned __int16 *)((char *)this - v5);
          }
          else
          {
            uint64_t v12 = -v5;
          }
          if (v7 < 0xF
            || (uint64_t v13 = *(unsigned __int16 *)((char *)this + v12 + 14)) == 0
            || (BOOL result = 0, v14 = *((void *)a2 + 1), v14 >= 9)
            && v14 - 8 >= (unint64_t)this + v13 - *(void *)a2)
          {
LABEL_28:
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
            if (result)
            {
              unint64_t v15 = (unsigned __int16 *)((char *)this - (int)v5);
              if (*v15 >= 0x11u && (uint64_t v16 = v15[8]) != 0) {
                unint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
              }
              else {
                unint64_t v17 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                if (result)
                {
                  uint64_t v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v18 >= 0x13u && (uint64_t v19 = v18[9]) != 0) {
                    uint64_t v20 = (const unsigned __int8 *)this + v19 + *(unsigned int *)((char *)this + v19);
                  }
                  else {
                    uint64_t v20 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v20);
                  if (result)
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5C1184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C1448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C1638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C1B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C1CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C1E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C2108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C2298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C275C(_Unwind_Exception *a1)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

void sub_22B5C28DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C2ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::CorrectionsAlignment>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::UserParameters::Verify((siri::speech::schema_fb::UserParameters *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5C30E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C3500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TTSRequestFeatureFlags::Verify(siri::speech::schema_fb::TTSRequestFeatureFlags *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5) {
      goto LABEL_22;
    }
    if (!v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 2) && v7 - 1 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      if (v6 < 7) {
        goto LABEL_22;
      }
      if (!v5[3]
        || (BOOL result = 0, v8 = *((void *)a2 + 1), v8 >= 2) && v8 - 1 >= (unint64_t)this + v5[3] - *(void *)a2)
      {
        if (v6 < 9
          || (!v5[4]
           || (BOOL result = 0, v9 = *((void *)a2 + 1), v9 >= 2)
           && v9 - 1 >= (unint64_t)this + v5[4] - *(void *)a2)
          && (v6 < 0xB
           || (!v5[5]
            || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 2)
            && v10 - 1 >= (unint64_t)this + v5[5] - *(void *)a2)
           && (v6 < 0xD
            || (uint64_t v11 = v5[6]) == 0
            || (BOOL result = 0, v12 = *((void *)a2 + 1), v12 >= 5)
            && v12 - 4 >= (unint64_t)this + v11 - *(void *)a2)))
        {
LABEL_22:
          --*((_DWORD *)a2 + 4);
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_22B5C37F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C3ADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C3FA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechVoice::Verify(siri::speech::schema_fb::TextToSpeechVoice *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                uint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                uint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  unint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 >= 0xBu && (uint64_t v15 = v14[5]) != 0) {
                    uint64_t v16 = (const unsigned __int8 *)this + v15 + *(unsigned int *)((char *)this + v15);
                  }
                  else {
                    uint64_t v16 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v16);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      unint64_t v17 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v17 >= 0xDu && (uint64_t v18 = v17[6]) != 0) {
                        uint64_t v19 = (const unsigned __int8 *)this + v18 + *(unsigned int *)((char *)this + v18);
                      }
                      else {
                        uint64_t v19 = 0;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v19);
                      if (result)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                        if (result)
                        {
                          uint64_t v20 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v20 >= 0xFu && (uint64_t v21 = v20[7]) != 0) {
                            unsigned int v22 = (const unsigned __int8 *)this + v21 + *(unsigned int *)((char *)this + v21);
                          }
                          else {
                            unsigned int v22 = 0;
                          }
                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v22);
                          if (result)
                          {
                            --*((_DWORD *)a2 + 4);
                            return 1;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5C4358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C44EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C4794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C4924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C4A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C4B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C4C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C4DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechMeta::Verify(siri::speech::schema_fb::TextToSpeechMeta *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = siri::speech::schema_fb::TextToSpeechVoice::Verify((siri::speech::schema_fb::TextToSpeechMeta *)((char *)this+ v6+ *(unsigned int *)((char *)this + v6)), a2)))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v7 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v7 < 7u
            || (uint64_t v8 = v7[3]) == 0
            || (BOOL result = siri::speech::schema_fb::UserParameters::Verify((siri::speech::schema_fb::TextToSpeechMeta *)((char *)this+ v8+ *(unsigned int *)((char *)this + v8)), a2)))
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5C5034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C51B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C5438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechRequestMeta::Verify(siri::speech::schema_fb::TextToSpeechRequestMeta *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || !v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
      if (result)
      {
        if (v6 >= 7 && v5[3]) {
          uint64_t v8 = (const unsigned __int8 *)this + v5[3] + *(unsigned int *)((char *)this + v5[3]);
        }
        else {
          uint64_t v8 = 0;
        }
        BOOL result = flatbuffers::Verifier::VerifyString(a2, v8);
        if (result)
        {
          uint64_t v9 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v9 < 9u
            || (uint64_t v10 = v9[4]) == 0
            || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 2)
            && v11 - 1 >= (unint64_t)this + v10 - *(void *)a2)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5C56E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C5A84(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5C5C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C5DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C5F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C6228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C63F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechRequestContext::Verify(siri::speech::schema_fb::TextToSpeechRequestContext *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
        goto LABEL_12;
      }
      if (*(_WORD *)((char *)this - v5 + 4))
      {
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v5 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
          goto LABEL_12;
        }
      }
      uint64_t v6 = *(unsigned __int16 *)((char *)this - v5 + 4);
      if (v6 && (uint64_t v7 = (_DWORD *)((char *)this + v6 + *(unsigned int *)((char *)this + v6)), *v7))
      {
        unint64_t v8 = 0;
        uint64_t v9 = v7 + 1;
        while (siri::speech::schema_fb::UserParameters::Verify((siri::speech::schema_fb::UserParameters *)((char *)v9 + *v9), a2))
        {
          ++v8;
          ++v9;
          if (v8 >= *v7) {
            goto LABEL_12;
          }
        }
        return 0;
      }
      else
      {
LABEL_12:
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v10 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v10 >= 7u && (uint64_t v11 = v10[3]) != 0) {
            uint64_t v12 = (const unsigned __int8 *)this + v11 + *(unsigned int *)((char *)this + v11);
          }
          else {
            uint64_t v12 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v12);
          if (result)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5C66E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C6820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C6A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C6BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C6ED8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5C7054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C71FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C738C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C76CC(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

void sub_22B5C7834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C79DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TTSPhonemeSequence::Verify(siri::speech::schema_fb::TTSPhonemeSequence *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
        goto LABEL_12;
      }
      if (*(_WORD *)((char *)this - v5 + 4))
      {
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v5 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
          goto LABEL_12;
        }
      }
      uint64_t v6 = *(unsigned __int16 *)((char *)this - v5 + 4);
      if (v6 && (uint64_t v7 = (_DWORD *)((char *)this + v6 + *(unsigned int *)((char *)this + v6)), *v7))
      {
        unint64_t v8 = 0;
        uint64_t v9 = v7 + 1;
        while (siri::speech::schema_fb::AudioPacket::Verify((siri::speech::schema_fb::AudioPacket *)((char *)v9 + *v9), a2))
        {
          ++v8;
          ++v9;
          if (v8 >= *v7) {
            goto LABEL_12;
          }
        }
        return 0;
      }
      else
      {
LABEL_12:
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B5C7C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C7F80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5C80FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C82A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C8434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C8800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_22B5C8938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B5C8AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C8C58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TTSPrompts::Verify(siri::speech::schema_fb::TTSPrompts *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = 0;
      uint64_t v6 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
      {
        if (!*(_WORD *)((char *)this - v6 + 4)) {
          goto LABEL_7;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v6 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v6 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = 0;
        uint64_t v6 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v6) >= 5u)
        {
LABEL_7:
          uint64_t v7 = *(unsigned __int16 *)((char *)this - v6 + 4);
          if (v7) {
            uint64_t v5 = (_DWORD *)((char *)this + v7 + *(unsigned int *)((char *)this + v7));
          }
          else {
            uint64_t v5 = 0;
          }
        }
      }
      BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v5);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = 0;
          uint64_t v9 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v9) >= 7u)
          {
            if (!*(_WORD *)((char *)this - v9 + 6)) {
              goto LABEL_16;
            }
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v9 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v9 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            unint64_t v8 = 0;
            uint64_t v9 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v9) >= 7u)
            {
LABEL_16:
              uint64_t v10 = *(unsigned __int16 *)((char *)this - v9 + 6);
              if (v10) {
                unint64_t v8 = (_DWORD *)((char *)this + v10 + *(unsigned int *)((char *)this + v10));
              }
              else {
                unint64_t v8 = 0;
              }
            }
          }
          BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v8);
          if (result)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5C8F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C90F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C93A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C9530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5C9668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C9888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5C9A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5CA630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, void *a15)
{
  if (v17) {
    operator delete(v17);
  }
  if (v18) {
    operator delete(v18);
  }
  if (v15) {
    operator delete(v15);
  }
  if (__p) {
    operator delete(__p);
  }
  if (a15) {
    operator delete(a15);
  }
  _Unwind_Resume(a1);
}

void sub_22B5CA8B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CA9E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CAB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CAC48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CAD78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CAF20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechFeature::Verify(siri::speech::schema_fb::TextToSpeechFeature *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v5) >= 5u)
      {
        if (!*(_WORD *)((char *)this - v5 + 4)) {
          goto LABEL_53;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v5 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v5) >= 5u)
        {
LABEL_53:
          uint64_t v6 = *(unsigned __int16 *)((char *)this - v5 + 4);
          if (v6)
          {
            uint64_t v7 = (_DWORD *)((char *)this + v6 + *(unsigned int *)((char *)this + v6));
            if (*v7)
            {
              unint64_t v8 = 0;
              uint64_t v9 = v7 + 1;
              while (siri::speech::schema_fb::Pronunciation::Verify((siri::speech::schema_fb::Pronunciation *)((char *)v9 + *v9), a2))
              {
                ++v8;
                ++v9;
                if (v8 >= *v7) {
                  goto LABEL_12;
                }
              }
              return 0;
            }
          }
        }
      }
LABEL_12:
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
      if (!result) {
        return result;
      }
      uint64_t v10 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v10) >= 7u)
      {
        if (!*(_WORD *)((char *)this - v10 + 6)) {
          goto LABEL_54;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v10 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v10 + 6)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v10 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v10) >= 7u)
        {
LABEL_54:
          uint64_t v11 = *(unsigned __int16 *)((char *)this - v10 + 6);
          if (v11)
          {
            uint64_t v12 = (_DWORD *)((char *)this + v11 + *(unsigned int *)((char *)this + v11));
            if (*v12)
            {
              unint64_t v13 = 0;
              unint64_t v14 = v12 + 1;
              while (siri::speech::schema_fb::TTSPhonemeSequence::Verify((siri::speech::schema_fb::TTSPhonemeSequence *)((char *)v14 + *v14), a2))
              {
                ++v13;
                ++v14;
                if (v13 >= *v12) {
                  goto LABEL_22;
                }
              }
              return 0;
            }
          }
        }
      }
LABEL_22:
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
      if (!result) {
        return result;
      }
      uint64_t v15 = 0;
      uint64_t v16 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v16) >= 9u)
      {
        if (!*(_WORD *)((char *)this - v16 + 8)) {
          goto LABEL_27;
        }
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v16 + 8)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v16 + 8)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v15 = 0;
        uint64_t v16 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v16) >= 9u)
        {
LABEL_27:
          uint64_t v17 = *(unsigned __int16 *)((char *)this - v16 + 8);
          if (v17) {
            uint64_t v15 = (_DWORD *)((char *)this + v17 + *(unsigned int *)((char *)this + v17));
          }
          else {
            uint64_t v15 = 0;
          }
        }
      }
      BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TTSPrompts>(a2, v15);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
        if (result)
        {
          uint64_t v18 = 0;
          uint64_t v19 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v19) >= 0xBu)
          {
            if (!*(_WORD *)((char *)this - v19 + 10)) {
              goto LABEL_37;
            }
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v19 + 10)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v19 + 10)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v18 = 0;
            uint64_t v19 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v19) >= 0xBu)
            {
LABEL_37:
              uint64_t v20 = *(unsigned __int16 *)((char *)this - v19 + 10);
              if (v20) {
                uint64_t v18 = (_DWORD *)((char *)this + v20 + *(unsigned int *)((char *)this + v20));
              }
              else {
                uint64_t v18 = 0;
              }
            }
          }
          BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::CorrectionsAlignment>(a2, v18);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
            if (result)
            {
              uint64_t v21 = 0;
              uint64_t v22 = *(int *)this;
              if (*(unsigned __int16 *)((char *)this - v22) >= 0xDu)
              {
                if (!*(_WORD *)((char *)this - v22 + 12)) {
                  goto LABEL_46;
                }
                BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v22 + 12)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v22 + 12)), 4uLL, 0);
                if (!result) {
                  return result;
                }
                uint64_t v21 = 0;
                uint64_t v22 = *(int *)this;
                if (*(unsigned __int16 *)((char *)this - v22) >= 0xDu)
                {
LABEL_46:
                  uint64_t v23 = *(unsigned __int16 *)((char *)this - v22 + 12);
                  if (v23) {
                    uint64_t v21 = (_DWORD *)((char *)this + v23 + *(unsigned int *)((char *)this + v23));
                  }
                  else {
                    uint64_t v21 = 0;
                  }
                }
              }
              BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::AudioPacket>(a2, v21);
              if (result)
              {
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TTSPrompts>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::TTSPrompts::Verify((siri::speech::schema_fb::TTSPrompts *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5CB4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5CB7E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechRequestDebug::Verify(siri::speech::schema_fb::TextToSpeechRequestDebug *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 2) && v7 - 1 >= (unint64_t)this + v5[2] - *(void *)a2)
      && (v6 < 7
       || (uint64_t v8 = v5[3]) == 0
       || (BOOL result = 0, v9 = *((void *)a2 + 1), v9 >= 2) && v9 - 1 >= (unint64_t)this + v8 - *(void *)a2))
    {
      --*((_DWORD *)a2 + 4);
      return 1;
    }
  }
  return result;
}

void sub_22B5CBA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5CBBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B5CBCD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B5CBEF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechVoiceResource::Verify(siri::speech::schema_fb::TextToSpeechVoiceResource *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || !v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
      if (result
        && (v6 < 7
         || !v5[3]
         || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v5[3] + *(unsigned int *)((char *)this + v5[3]), 1uLL, 0))))
      {
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B5CC154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5CC494(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

void sub_22B5CC5FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CC7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechUserProfile::Verify(siri::speech::schema_fb::TextToSpeechUserProfile *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
        goto LABEL_12;
      }
      if (*(_WORD *)((char *)this - v5 + 4))
      {
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v5 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
          goto LABEL_12;
        }
      }
      uint64_t v6 = *(unsigned __int16 *)((char *)this - v5 + 4);
      if (v6 && (uint64_t v7 = (_DWORD *)((char *)this + v6 + *(unsigned int *)((char *)this + v6)), *v7))
      {
        unint64_t v8 = 0;
        unint64_t v9 = v7 + 1;
        while (siri::speech::schema_fb::TextToSpeechVoiceResource::Verify((siri::speech::schema_fb::TextToSpeechVoiceResource *)((char *)v9 + *v9), a2))
        {
          ++v8;
          ++v9;
          if (v8 >= *v7) {
            goto LABEL_12;
          }
        }
        return 0;
      }
      else
      {
LABEL_12:
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B5CCA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5CCC0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CCF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechRequestDevConfig::Verify(siri::speech::schema_fb::TextToSpeechRequestDevConfig *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || !v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 2) && v7 - 1 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
      if (result)
      {
        unint64_t v8 = v6 >= 7 && v5[3] ? (const unsigned __int8 *)this + v5[3] + *(unsigned int *)((char *)this + v5[3]) : 0;
        BOOL result = flatbuffers::Verifier::VerifyString(a2, v8);
        if (result)
        {
          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
          if (result)
          {
            unint64_t v9 = (unsigned __int16 *)((char *)this - *(int *)this);
            if (*v9 >= 9u && (uint64_t v10 = v9[4]) != 0) {
              uint64_t v11 = (const unsigned __int8 *)this + v10 + *(unsigned int *)((char *)this + v10);
            }
            else {
              uint64_t v11 = 0;
            }
            BOOL result = flatbuffers::Verifier::VerifyString(a2, v11);
            if (result)
            {
              uint64_t v12 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v12 < 0xBu
                || (uint64_t v13 = v12[5]) == 0
                || (BOOL result = 0, v14 = *((void *)a2 + 1), v14 >= 2)
                && v14 - 1 >= (unint64_t)this + v13 - *(void *)a2)
              {
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5CD21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5CD410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CD5A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CD708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5CD944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CDCFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::QSSVersionInfo::Verify(siri::speech::schema_fb::QSSVersionInfo *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                uint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                uint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  unint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 >= 0xBu && (uint64_t v15 = v14[5]) != 0) {
                    uint64_t v16 = (const unsigned __int8 *)this + v15 + *(unsigned int *)((char *)this + v15);
                  }
                  else {
                    uint64_t v16 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v16);
                  if (result)
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5CE0D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechResponseDevData::Verify(siri::speech::schema_fb::TextToSpeechResponseDevData *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = *(int *)this;
          unsigned int v9 = *(unsigned __int16 *)((char *)this - v8);
          if (v9 < 7) {
            goto LABEL_18;
          }
          if (*(_WORD *)((char *)this - v8 + 6))
          {
            BOOL result = siri::speech::schema_fb::QSSVersionInfo::Verify((siri::speech::schema_fb::TextToSpeechResponseDevData *)((char *)this+ *(unsigned __int16 *)((char *)this - v8 + 6)+ *(unsigned int *)((char *)this+ *(unsigned __int16 *)((char *)this - v8 + 6))), a2);
            if (!result) {
              return result;
            }
            uint64_t v8 = *(int *)this;
            uint64_t v10 = -v8;
            unsigned int v9 = *(unsigned __int16 *)((char *)this - v8);
          }
          else
          {
            uint64_t v10 = -v8;
          }
          if (v9 < 9
            || (uint64_t v11 = *(unsigned __int16 *)((char *)this + v10 + 8), !*(_WORD *)((char *)this + v10 + 8))
            || (BOOL result = 0, v12 = *((void *)a2 + 1), v12 >= 2)
            && v12 - 1 >= (unint64_t)this + v11 - *(void *)a2)
          {
LABEL_18:
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
            if (result)
            {
              uint64_t v13 = (unsigned __int16 *)((char *)this - (int)v8);
              if (*v13 >= 0xBu && (uint64_t v14 = v13[5]) != 0) {
                uint64_t v15 = (const unsigned __int8 *)this + v14 + *(unsigned int *)((char *)this + v14);
              }
              else {
                uint64_t v15 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v15);
              if (result)
              {
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5CE3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5CE8AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechRequestProsodyControlConfig::Verify(siri::speech::schema_fb::TextToSpeechRequestProsodyControlConfig *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5) {
      goto LABEL_34;
    }
    if (!v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      if (v6 < 7) {
        goto LABEL_34;
      }
      if (!v5[3]
        || (BOOL result = 0, v8 = *((void *)a2 + 1), v8 >= 5) && v8 - 4 >= (unint64_t)this + v5[3] - *(void *)a2)
      {
        if (v6 < 9) {
          goto LABEL_34;
        }
        if (!v5[4]
          || (BOOL result = 0, v9 = *((void *)a2 + 1), v9 >= 5)
          && v9 - 4 >= (unint64_t)this + v5[4] - *(void *)a2)
        {
          if (v6 < 0xB) {
            goto LABEL_34;
          }
          if (!v5[5]
            || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
            && v10 - 4 >= (unint64_t)this + v5[5] - *(void *)a2)
          {
            if (v6 < 0xD) {
              goto LABEL_34;
            }
            if (!v5[6]
              || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
              && v11 - 4 >= (unint64_t)this + v5[6] - *(void *)a2)
            {
              if (v6 < 0xF
                || (!v5[7]
                 || (BOOL result = 0, v12 = *((void *)a2 + 1), v12 >= 5)
                 && v12 - 4 >= (unint64_t)this + v5[7] - *(void *)a2)
                && (v6 < 0x11
                 || (!v5[8]
                  || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
                  && v13 - 4 >= (unint64_t)this + v5[8] - *(void *)a2)
                 && (v6 < 0x13
                  || (uint64_t v14 = v5[9]) == 0
                  || (BOOL result = 0, v15 = *((void *)a2 + 1), v15 >= 5)
                  && v15 - 4 >= (unint64_t)this + v14 - *(void *)a2)))
              {
LABEL_34:
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5CEC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5CF3C4(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

void sub_22B5CF590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CF664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CF7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5CF97C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CFADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5CFC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5D006C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechUserVoiceProfile::Verify(siri::speech::schema_fb::TextToSpeechUserVoiceProfile *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5) {
      goto LABEL_26;
    }
    if (!v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      if (v6 < 7) {
        goto LABEL_26;
      }
      if (!v5[3]
        || (BOOL result = 0, v8 = *((void *)a2 + 1), v8 >= 5) && v8 - 4 >= (unint64_t)this + v5[3] - *(void *)a2)
      {
        if (v6 < 9) {
          goto LABEL_26;
        }
        if (!v5[4]
          || (BOOL result = 0, v9 = *((void *)a2 + 1), v9 >= 5)
          && v9 - 4 >= (unint64_t)this + v5[4] - *(void *)a2)
        {
          if (v6 < 0xB
            || (!v5[5]
             || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
             && v10 - 4 >= (unint64_t)this + v5[5] - *(void *)a2)
            && (v6 < 0xD
             || (!v5[6]
              || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
              && v11 - 4 >= (unint64_t)this + v5[6] - *(void *)a2)
             && (v6 < 0xF
              || (uint64_t v12 = v5[7]) == 0
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v12 - *(void *)a2)))
          {
LABEL_26:
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5D0310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D0470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5D0634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B5D0714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B5D092C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D0AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig::Verify(siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = siri::speech::schema_fb::TextToSpeechVoiceResource::Verify((siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig *)((char *)this+ v6+ *(unsigned int *)((char *)this + v6)), a2)))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v7 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v7 < 7u
            || (uint64_t v8 = v7[3]) == 0
            || (BOOL result = siri::speech::schema_fb::TextToSpeechUserVoiceProfile::Verify((siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig *)((char *)this+ v8+ *(unsigned int *)((char *)this + v8)), a2)))
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v9 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v9 >= 9u && (uint64_t v10 = v9[4]) != 0) {
                unint64_t v11 = (const unsigned __int8 *)this + v10 + *(unsigned int *)((char *)this + v10);
              }
              else {
                unint64_t v11 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v11);
              if (result)
              {
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5D0D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D0DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D0EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D0F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D1070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D1144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D1218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D136C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D14D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5D166C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D1914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D1E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechRequest::Verify(siri::speech::schema_fb::TextToSpeechRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                unint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                unint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  uint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 >= 0xBu && (uint64_t v15 = v14[5]) != 0) {
                    uint64_t v16 = (const unsigned __int8 *)this + v15 + *(unsigned int *)((char *)this + v15);
                  }
                  else {
                    uint64_t v16 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v16);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      uint64_t v17 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v17 >= 0xDu && (uint64_t v18 = v17[6]) != 0) {
                        uint64_t v19 = (const unsigned __int8 *)this + v18 + *(unsigned int *)((char *)this + v18);
                      }
                      else {
                        uint64_t v19 = 0;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v19);
                      if (result)
                      {
                        uint64_t v20 = (unsigned __int16 *)((char *)this - *(int *)this);
                        unsigned int v21 = *v20;
                        if (v21 < 0xF
                          || (!v20[7]
                           || (BOOL result = 0, v22 = *((void *)a2 + 1), v22 >= 5)
                           && v22 - 4 >= (unint64_t)this + v20[7] - *(void *)a2)
                          && (v21 < 0x11
                           || !v20[8]
                           || (BOOL result = 0, v23 = *((void *)a2 + 1), v23 >= 2)
                           && v23 - 1 >= (unint64_t)this + v20[8] - *(void *)a2))
                        {
                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                          if (result)
                          {
                            unint64_t v24 = v21 >= 0x13 && v20[9]
                                ? (const unsigned __int8 *)this + v20[9] + *(unsigned int *)((char *)this + v20[9])
                                : 0;
                            BOOL result = flatbuffers::Verifier::VerifyString(a2, v24);
                            if (result)
                            {
                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                              if (result)
                              {
                                uint64_t v25 = 0;
                                uint64_t v26 = *(int *)this;
                                if (*(unsigned __int16 *)((char *)this - v26) >= 0x15u)
                                {
                                  if (!*(_WORD *)((char *)this - v26 + 20)) {
                                    goto LABEL_51;
                                  }
                                  BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v26 + 20)+ *(unsigned int *)((char *)this+ *(unsigned __int16 *)((char *)this - v26 + 20)), 4uLL, 0);
                                  if (!result) {
                                    return result;
                                  }
                                  uint64_t v25 = 0;
                                  uint64_t v26 = *(int *)this;
                                  if (*(unsigned __int16 *)((char *)this - v26) >= 0x15u)
                                  {
LABEL_51:
                                    uint64_t v27 = *(unsigned __int16 *)((char *)this - v26 + 20);
                                    if (v27) {
                                      uint64_t v25 = (_DWORD *)((char *)this + v27 + *(unsigned int *)((char *)this + v27));
                                    }
                                    else {
                                      uint64_t v25 = 0;
                                    }
                                  }
                                }
                                BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::CorrectionsAlignment>(a2, v25);
                                if (result)
                                {
                                  uint64_t v28 = (unsigned __int16 *)((char *)this - *(int *)this);
                                  unsigned int v29 = *v28;
                                  if (v29 < 0x17
                                    || !v28[11]
                                    || (BOOL result = 0, v30 = *((void *)a2 + 1), v30 >= 5)
                                    && v30 - 4 >= (unint64_t)this + v28[11] - *(void *)a2)
                                  {
                                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x18u);
                                    if (result
                                      && (v29 < 0x19
                                       || !v28[12]
                                       || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestMeta::Verify((siri::speech::schema_fb::TextToSpeechRequest *)((char *)this + v28[12] + *(unsigned int *)((char *)this + v28[12])), a2))))
                                    {
                                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Au);
                                      if (result)
                                      {
                                        uint64_t v31 = (unsigned __int16 *)((char *)this - *(int *)this);
                                        if (*v31 < 0x1Bu
                                          || (uint64_t v32 = v31[13]) == 0
                                          || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestContext::Verify((siri::speech::schema_fb::TextToSpeechRequest *)((char *)this + v32 + *(unsigned int *)((char *)this + v32)), a2)))
                                        {
                                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Cu);
                                          if (result)
                                          {
                                            unint64_t v33 = (unsigned __int16 *)((char *)this - *(int *)this);
                                            if (*v33 < 0x1Du
                                              || (uint64_t v34 = v33[14]) == 0
                                              || (BOOL result = siri::speech::schema_fb::Pronunciation::Verify((siri::speech::schema_fb::TextToSpeechRequest *)((char *)this + v34 + *(unsigned int *)((char *)this + v34)), a2)))
                                            {
                                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Eu);
                                              if (result)
                                              {
                                                unint64_t v35 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                if (*v35 < 0x1Fu
                                                  || (uint64_t v36 = v35[15]) == 0
                                                  || (BOOL result = siri::speech::schema_fb::TTSRequestFeatureFlags::Verify((siri::speech::schema_fb::TextToSpeechRequest *)((char *)this + v36 + *(unsigned int *)((char *)this + v36)), a2)))
                                                {
                                                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x20u);
                                                  if (result)
                                                  {
                                                    uint64_t v37 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                    if (*v37 < 0x21u
                                                      || (uint64_t v38 = v37[16]) == 0
                                                      || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestDebug::Verify((siri::speech::schema_fb::TextToSpeechRequest *)((char *)this + v38 + *(unsigned int *)((char *)this + v38)), a2)))
                                                    {
                                                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x22u);
                                                      if (result)
                                                      {
                                                        v39 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                        if (*v39 < 0x23u
                                                          || (uint64_t v40 = v39[17]) == 0
                                                          || (BOOL result = siri::speech::schema_fb::TextToSpeechUserProfile::Verify((siri::speech::schema_fb::TextToSpeechRequest *)((char *)this + v40 + *(unsigned int *)((char *)this + v40)), a2)))
                                                        {
                                                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x24u);
                                                          if (result)
                                                          {
                                                            unint64_t v41 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                            if (*v41 < 0x25u
                                                              || (uint64_t v42 = v41[18]) == 0
                                                              || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestDevConfig::Verify((siri::speech::schema_fb::TextToSpeechRequest *)((char *)this + v42 + *(unsigned int *)((char *)this + v42)), a2)))
                                                            {
                                                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x26u);
                                                              if (result)
                                                              {
                                                                uint64_t v43 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                                if (*v43 < 0x27u
                                                                  || (uint64_t v44 = v43[19]) == 0
                                                                  || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig::Verify((siri::speech::schema_fb::TextToSpeechRequest *)((char *)this + v44 + *(unsigned int *)((char *)this + v44)), a2)))
                                                                {
                                                                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x28u);
                                                                  if (result)
                                                                  {
                                                                    unint64_t v45 = (unsigned __int16 *)((char *)this
                                                                                             - *(int *)this);
                                                                    if (*v45 < 0x29u
                                                                      || (uint64_t v46 = v45[20]) == 0
                                                                      || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestProsodyControlConfig::Verify((siri::speech::schema_fb::TextToSpeechRequest *)((char *)this + v46 + *(unsigned int *)((char *)this + v46)), a2)))
                                                                    {
                                                                      --*((_DWORD *)a2 + 4);
                                                                      return 1;
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5D25E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5D2B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::AudioDescription::Verify(siri::speech::schema_fb::AudioDescription *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5) {
      goto LABEL_38;
    }
    if (!v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 9) && v7 - 8 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      if (v6 < 7) {
        goto LABEL_38;
      }
      if (!v5[3]
        || (BOOL result = 0, v8 = *((void *)a2 + 1), v8 >= 5) && v8 - 4 >= (unint64_t)this + v5[3] - *(void *)a2)
      {
        if (v6 < 9) {
          goto LABEL_38;
        }
        if (!v5[4]
          || (BOOL result = 0, v9 = *((void *)a2 + 1), v9 >= 5)
          && v9 - 4 >= (unint64_t)this + v5[4] - *(void *)a2)
        {
          if (v6 < 0xB) {
            goto LABEL_38;
          }
          if (!v5[5]
            || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
            && v10 - 4 >= (unint64_t)this + v5[5] - *(void *)a2)
          {
            if (v6 < 0xD) {
              goto LABEL_38;
            }
            if (!v5[6]
              || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
              && v11 - 4 >= (unint64_t)this + v5[6] - *(void *)a2)
            {
              if (v6 < 0xF) {
                goto LABEL_38;
              }
              if (!v5[7]
                || (BOOL result = 0, v12 = *((void *)a2 + 1), v12 >= 5)
                && v12 - 4 >= (unint64_t)this + v5[7] - *(void *)a2)
              {
                if (v6 < 0x11
                  || (!v5[8]
                   || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
                   && v13 - 4 >= (unint64_t)this + v5[8] - *(void *)a2)
                  && (v6 < 0x13
                   || (!v5[9]
                    || (BOOL result = 0, v14 = *((void *)a2 + 1), v14 >= 5)
                    && v14 - 4 >= (unint64_t)this + v5[9] - *(void *)a2)
                   && (v6 < 0x15
                    || (uint64_t v15 = v5[10]) == 0
                    || (BOOL result = 0, v16 = *((void *)a2 + 1), v16 >= 5)
                    && v16 - 4 >= (unint64_t)this + v15 - *(void *)a2)))
                {
LABEL_38:
                  --*((_DWORD *)a2 + 4);
                  return 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5D2EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5D30B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D3390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::WordTimingInfo::Verify(siri::speech::schema_fb::WordTimingInfo *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        unsigned int v9 = *v8;
        if (v9 < 7) {
          goto LABEL_24;
        }
        if (!v8[3]
          || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
          && v10 - 4 >= (unint64_t)this + v8[3] - *(void *)a2)
        {
          if (v9 < 9
            || (!v8[4]
             || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
             && v11 - 4 >= (unint64_t)this + v8[4] - *(void *)a2)
            && (v9 < 0xB
             || (!v8[5]
              || (BOOL result = 0, v12 = *((void *)a2 + 1), v12 >= 5)
              && v12 - 4 >= (unint64_t)this + v8[5] - *(void *)a2)
             && (v9 < 0xD
              || (uint64_t v13 = v8[6]) == 0
              || (BOOL result = 0, v14 = *((void *)a2 + 1), v14 >= 5)
              && v14 - 4 >= (unint64_t)this + v13 - *(void *)a2)))
          {
LABEL_24:
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5D36A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5D3CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  if (__p) {
    operator delete(__p);
  }
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_22B5D3E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D3F50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D4024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D4148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D4228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D42FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D4398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B5D479C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechResponse::Verify(siri::speech::schema_fb::TextToSpeechResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                unint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                  unsigned int v16 = *v15;
                  if (v16 < 0xD
                    || (!v15[6]
                     || (BOOL result = 0, v17 = *((void *)a2 + 1), v17 >= 5)
                     && v17 - 4 >= (unint64_t)this + v15[6] - *(void *)a2)
                    && (v16 < 0xF
                     || !v15[7]
                     || (BOOL result = 0, v18 = *((void *)a2 + 1), v18 >= 5)
                     && v18 - 4 >= (unint64_t)this + v15[7] - *(void *)a2))
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                    if (result
                      && (v16 < 0x11
                       || !v15[8]
                       || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v15[8] + *(unsigned int *)((char *)this + v15[8]), 1uLL, 0))))
                    {
                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                      if (result)
                      {
                        uint64_t v19 = (unsigned __int16 *)((char *)this - *(int *)this);
                        if (*v19 < 0x13u
                          || (uint64_t v20 = v19[9]) == 0
                          || (BOOL result = siri::speech::schema_fb::AudioDescription::Verify((siri::speech::schema_fb::TextToSpeechResponse *)((char *)this+ v20+ *(unsigned int *)((char *)this + v20)), a2)))
                        {
                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                          if (result)
                          {
                            unsigned int v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                            if (*v21 < 0x15u
                              || (uint64_t v22 = v21[10]) == 0
                              || (BOOL result = siri::speech::schema_fb::AudioDescription::Verify((siri::speech::schema_fb::TextToSpeechResponse *)((char *)this+ v22+ *(unsigned int *)((char *)this + v22)), a2)))
                            {
                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x16u);
                              if (result)
                              {
                                unint64_t v23 = 0;
                                uint64_t v24 = *(int *)this;
                                if (*(unsigned __int16 *)((char *)this - v24) >= 0x17u)
                                {
                                  if (!*(_WORD *)((char *)this - v24 + 22)) {
                                    goto LABEL_49;
                                  }
                                  BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v24 + 22)+ *(unsigned int *)((char *)this+ *(unsigned __int16 *)((char *)this - v24 + 22)), 4uLL, 0);
                                  if (!result) {
                                    return result;
                                  }
                                  unint64_t v23 = 0;
                                  uint64_t v24 = *(int *)this;
                                  if (*(unsigned __int16 *)((char *)this - v24) >= 0x17u)
                                  {
LABEL_49:
                                    uint64_t v25 = *(unsigned __int16 *)((char *)this - v24 + 22);
                                    if (v25) {
                                      unint64_t v23 = (_DWORD *)((char *)this + v25 + *(unsigned int *)((char *)this + v25));
                                    }
                                    else {
                                      unint64_t v23 = 0;
                                    }
                                  }
                                }
                                BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::WordTimingInfo>(a2, v23);
                                if (result)
                                {
                                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x18u);
                                  if (result)
                                  {
                                    uint64_t v26 = (unsigned __int16 *)((char *)this - *(int *)this);
                                    if (*v26 < 0x19u
                                      || (uint64_t v27 = v26[12]) == 0
                                      || (BOOL result = siri::speech::schema_fb::TextToSpeechMeta::Verify((siri::speech::schema_fb::TextToSpeechResponse *)((char *)this + v27 + *(unsigned int *)((char *)this + v27)), a2)))
                                    {
                                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Au);
                                      if (result)
                                      {
                                        uint64_t v28 = (unsigned __int16 *)((char *)this - *(int *)this);
                                        if (*v28 < 0x1Bu
                                          || (uint64_t v29 = v28[13]) == 0
                                          || (BOOL result = siri::speech::schema_fb::TextToSpeechFeature::Verify((siri::speech::schema_fb::TextToSpeechResponse *)((char *)this + v29 + *(unsigned int *)((char *)this + v29)), a2)))
                                        {
                                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Cu);
                                          if (result)
                                          {
                                            unint64_t v30 = (unsigned __int16 *)((char *)this - *(int *)this);
                                            if (*v30 < 0x1Du
                                              || (uint64_t v31 = v30[14]) == 0
                                              || (BOOL result = siri::speech::schema_fb::TextToSpeechResponseDevData::Verify((siri::speech::schema_fb::TextToSpeechResponse *)((char *)this + v31 + *(unsigned int *)((char *)this + v31)), a2)))
                                            {
                                              --*((_DWORD *)a2 + 4);
                                              return 1;
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::WordTimingInfo>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::WordTimingInfo::Verify((siri::speech::schema_fb::WordTimingInfo *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5D4DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5D55B0(_Unwind_Exception *a1)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

void sub_22B5D5780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D5854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D5928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D59FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D5AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D5BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D5C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D5D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D5E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D5F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D60E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5D6274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D651C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D6AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::StartTextToSpeechStreamingRequest::Verify(siri::speech::schema_fb::StartTextToSpeechStreamingRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                unint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                unint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  unint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 >= 0xBu && (uint64_t v15 = v14[5]) != 0) {
                    unsigned int v16 = (const unsigned __int8 *)this + v15 + *(unsigned int *)((char *)this + v15);
                  }
                  else {
                    unsigned int v16 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v16);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      unint64_t v17 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v17 >= 0xDu && (uint64_t v18 = v17[6]) != 0) {
                        uint64_t v19 = (const unsigned __int8 *)this + v18 + *(unsigned int *)((char *)this + v18);
                      }
                      else {
                        uint64_t v19 = 0;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v19);
                      if (result)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                        if (result)
                        {
                          uint64_t v20 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v20 >= 0xFu && (uint64_t v21 = v20[7]) != 0) {
                            uint64_t v22 = (const unsigned __int8 *)this + v21 + *(unsigned int *)((char *)this + v21);
                          }
                          else {
                            uint64_t v22 = 0;
                          }
                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v22);
                          if (result)
                          {
                            unint64_t v23 = (unsigned __int16 *)((char *)this - *(int *)this);
                            unsigned int v24 = *v23;
                            if (v24 < 0x11
                              || (!v23[8]
                               || (BOOL result = 0, v25 = *((void *)a2 + 1), v25 >= 5)
                               && v25 - 4 >= (unint64_t)this + v23[8] - *(void *)a2)
                              && (v24 < 0x13
                               || !v23[9]
                               || (BOOL result = 0, v26 = *((void *)a2 + 1), v26 >= 2)
                               && v26 - 1 >= (unint64_t)this + v23[9] - *(void *)a2))
                            {
                              uint64_t v27 = (char *)this - *(int *)this;
                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                              if (result)
                              {
                                uint64_t v28 = v24 >= 0x15 && *((_WORD *)v27 + 10)
                                    ? (const unsigned __int8 *)this
                                    + *((unsigned __int16 *)v27 + 10)
                                    + *(unsigned int *)((char *)this + *((unsigned __int16 *)v27 + 10))
                                    : 0;
                                BOOL result = flatbuffers::Verifier::VerifyString(a2, v28);
                                if (result)
                                {
                                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x16u);
                                  if (result)
                                  {
                                    uint64_t v29 = 0;
                                    uint64_t v30 = *(int *)this;
                                    if (*(unsigned __int16 *)((char *)this - v30) >= 0x17u)
                                    {
                                      if (!*(_WORD *)((char *)this - v30 + 22)) {
                                        goto LABEL_57;
                                      }
                                      BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v30 + 22)+ *(unsigned int *)((char *)this+ *(unsigned __int16 *)((char *)this - v30 + 22)), 4uLL, 0);
                                      if (!result) {
                                        return result;
                                      }
                                      uint64_t v29 = 0;
                                      uint64_t v30 = *(int *)this;
                                      if (*(unsigned __int16 *)((char *)this - v30) >= 0x17u)
                                      {
LABEL_57:
                                        uint64_t v31 = *(unsigned __int16 *)((char *)this - v30 + 22);
                                        if (v31) {
                                          uint64_t v29 = (_DWORD *)((char *)this + v31 + *(unsigned int *)((char *)this + v31));
                                        }
                                        else {
                                          uint64_t v29 = 0;
                                        }
                                      }
                                    }
                                    BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::CorrectionsAlignment>(a2, v29);
                                    if (result)
                                    {
                                      uint64_t v32 = (unsigned __int16 *)((char *)this - *(int *)this);
                                      unsigned int v33 = *v32;
                                      if (v33 < 0x19
                                        || !v32[12]
                                        || (BOOL result = 0, v34 = *((void *)a2 + 1), v34 >= 5)
                                        && v34 - 4 >= (unint64_t)this + v32[12] - *(void *)a2)
                                      {
                                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Au);
                                        if (result
                                          && (v33 < 0x1B
                                           || !v32[13]
                                           || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestMeta::Verify((siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)((char *)this + v32[13] + *(unsigned int *)((char *)this + v32[13])), a2))))
                                        {
                                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Cu);
                                          if (result)
                                          {
                                            unint64_t v35 = (unsigned __int16 *)((char *)this - *(int *)this);
                                            if (*v35 < 0x1Du
                                              || (uint64_t v36 = v35[14]) == 0
                                              || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestContext::Verify((siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)((char *)this + v36 + *(unsigned int *)((char *)this + v36)), a2)))
                                            {
                                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x1Eu);
                                              if (result)
                                              {
                                                uint64_t v37 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                if (*v37 < 0x1Fu
                                                  || (uint64_t v38 = v37[15]) == 0
                                                  || (BOOL result = siri::speech::schema_fb::Pronunciation::Verify((siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)((char *)this + v38 + *(unsigned int *)((char *)this + v38)), a2)))
                                                {
                                                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x20u);
                                                  if (result)
                                                  {
                                                    v39 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                    if (*v39 < 0x21u
                                                      || (uint64_t v40 = v39[16]) == 0
                                                      || (BOOL result = siri::speech::schema_fb::TTSRequestFeatureFlags::Verify((siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)((char *)this + v40 + *(unsigned int *)((char *)this + v40)), a2)))
                                                    {
                                                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x22u);
                                                      if (result)
                                                      {
                                                        unint64_t v41 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                        if (*v41 < 0x23u
                                                          || (uint64_t v42 = v41[17]) == 0
                                                          || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestDebug::Verify((siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)((char *)this + v42 + *(unsigned int *)((char *)this + v42)), a2)))
                                                        {
                                                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x24u);
                                                          if (result)
                                                          {
                                                            uint64_t v43 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                            if (*v43 < 0x25u
                                                              || (uint64_t v44 = v43[18]) == 0
                                                              || (BOOL result = siri::speech::schema_fb::TextToSpeechUserProfile::Verify((siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)((char *)this + v44 + *(unsigned int *)((char *)this + v44)), a2)))
                                                            {
                                                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x26u);
                                                              if (result)
                                                              {
                                                                unint64_t v45 = (unsigned __int16 *)((char *)this - *(int *)this);
                                                                if (*v45 < 0x27u
                                                                  || (uint64_t v46 = v45[19]) == 0
                                                                  || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestDevConfig::Verify((siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)((char *)this + v46 + *(unsigned int *)((char *)this + v46)), a2)))
                                                                {
                                                                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x28u);
                                                                  if (result)
                                                                  {
                                                                    unint64_t v47 = (unsigned __int16 *)((char *)this
                                                                                             - *(int *)this);
                                                                    if (*v47 < 0x29u
                                                                      || (uint64_t v48 = v47[20]) == 0
                                                                      || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig::Verify((siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)((char *)this + v48 + *(unsigned int *)((char *)this + v48)), a2)))
                                                                    {
                                                                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x2Au);
                                                                      if (result)
                                                                      {
                                                                        v49 = (unsigned __int16 *)((char *)this
                                                                                                 - *(int *)this);
                                                                        if (*v49 < 0x2Bu
                                                                          || (uint64_t v50 = v49[21]) == 0
                                                                          || (BOOL result = siri::speech::schema_fb::TextToSpeechRequestProsodyControlConfig::Verify((siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)((char *)this + v50 + *(unsigned int *)((char *)this + v50)), a2)))
                                                                        {
                                                                          --*((_DWORD *)a2 + 4);
                                                                          return 1;
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5D72C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5D760C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D7724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D77F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D78CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D7CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::BeginTextToSpeechStreamingResponse::Verify(siri::speech::schema_fb::BeginTextToSpeechStreamingResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                unint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 >= 0xDu && (uint64_t v16 = v15[6]) != 0) {
                      unint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                    }
                    else {
                      unint64_t v17 = 0;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                    if (result)
                    {
                      uint64_t v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                      unsigned int v19 = *v18;
                      if (v19 < 0xF
                        || !v18[7]
                        || (BOOL result = 0, v20 = *((void *)a2 + 1), v20 >= 5)
                        && v20 - 4 >= (unint64_t)this + v18[7] - *(void *)a2)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                        if (result
                          && (v19 < 0x11
                           || !v18[8]
                           || (BOOL result = siri::speech::schema_fb::AudioDescription::Verify((siri::speech::schema_fb::BeginTextToSpeechStreamingResponse *)((char *)this + v18[8] + *(unsigned int *)((char *)this + v18[8])), a2))))
                        {
                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                          if (result)
                          {
                            uint64_t v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                            if (*v21 < 0x13u
                              || (uint64_t v22 = v21[9]) == 0
                              || (BOOL result = siri::speech::schema_fb::AudioDescription::Verify((siri::speech::schema_fb::BeginTextToSpeechStreamingResponse *)((char *)this + v22 + *(unsigned int *)((char *)this + v22)), a2)))
                            {
                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                              if (result)
                              {
                                uint64_t v23 = *(int *)this;
                                unsigned int v24 = *(unsigned __int16 *)((char *)this - v23);
                                if (v24 < 0x15) {
                                  goto LABEL_52;
                                }
                                if (*(_WORD *)((char *)this - v23 + 20))
                                {
                                  BOOL result = siri::speech::schema_fb::TextToSpeechMeta::Verify((siri::speech::schema_fb::BeginTextToSpeechStreamingResponse *)((char *)this + *(unsigned __int16 *)((char *)this - v23 + 20) + *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v23 + 20))), a2);
                                  if (!result) {
                                    return result;
                                  }
                                  uint64_t v25 = *(int *)this;
                                  uint64_t v26 = -v25;
                                  unsigned int v24 = *(unsigned __int16 *)((char *)this - v25);
                                }
                                else
                                {
                                  uint64_t v26 = -v23;
                                }
                                if (v24 < 0x17
                                  || (uint64_t v27 = *(unsigned __int16 *)((char *)this + v26 + 22),
                                      !*(_WORD *)((char *)this + v26 + 22))
                                  || (BOOL result = 0, v28 = *((void *)a2 + 1), v28 >= 5)
                                  && v28 - 4 >= (unint64_t)this + v27 - *(void *)a2)
                                {
LABEL_52:
                                  --*((_DWORD *)a2 + 4);
                                  return 1;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5D8190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5D870C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  if (__p) {
    operator delete(__p);
  }
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void sub_22B5D88A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D89C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D8A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B5D8EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::PartialTextToSpeechStreamingResponse::Verify(siri::speech::schema_fb::PartialTextToSpeechStreamingResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                unint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 >= 0xDu && (uint64_t v16 = v15[6]) != 0) {
                      unint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                    }
                    else {
                      unint64_t v17 = 0;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                    if (result)
                    {
                      uint64_t v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                      unsigned int v19 = *v18;
                      if (v19 < 0xF
                        || !v18[7]
                        || (BOOL result = 0, v20 = *((void *)a2 + 1), v20 >= 5)
                        && v20 - 4 >= (unint64_t)this + v18[7] - *(void *)a2)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                        if (result
                          && (v19 < 0x11
                           || !v18[8]
                           || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ v18[8]+ *(unsigned int *)((char *)this + v18[8]), 1uLL, 0))))
                        {
                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                          if (result)
                          {
                            uint64_t v21 = 0;
                            uint64_t v22 = *(int *)this;
                            if (*(unsigned __int16 *)((char *)this - v22) >= 0x13u)
                            {
                              if (!*(_WORD *)((char *)this - v22 + 18)) {
                                goto LABEL_43;
                              }
                              BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v22 + 18)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v22 + 18)), 4uLL, 0);
                              if (!result) {
                                return result;
                              }
                              uint64_t v21 = 0;
                              uint64_t v22 = *(int *)this;
                              if (*(unsigned __int16 *)((char *)this - v22) >= 0x13u)
                              {
LABEL_43:
                                uint64_t v23 = *(unsigned __int16 *)((char *)this - v22 + 18);
                                if (v23) {
                                  uint64_t v21 = (_DWORD *)((char *)this + v23 + *(unsigned int *)((char *)this + v23));
                                }
                                else {
                                  uint64_t v21 = 0;
                                }
                              }
                            }
                            BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::WordTimingInfo>(a2, v21);
                            if (result)
                            {
                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                              if (result)
                              {
                                unsigned int v24 = (unsigned __int16 *)((char *)this - *(int *)this);
                                if (*v24 < 0x15u
                                  || (uint64_t v25 = v24[10]) == 0
                                  || (BOOL result = siri::speech::schema_fb::TextToSpeechFeature::Verify((siri::speech::schema_fb::PartialTextToSpeechStreamingResponse *)((char *)this + v25 + *(unsigned int *)((char *)this + v25)), a2)))
                                {
                                  --*((_DWORD *)a2 + 4);
                                  return 1;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5D9388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5D9634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D9718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5D9B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::FinalTextToSpeechStreamingResponse::Verify(siri::speech::schema_fb::FinalTextToSpeechStreamingResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                unint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 >= 0xDu && (uint64_t v16 = v15[6]) != 0) {
                      unint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                    }
                    else {
                      unint64_t v17 = 0;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                    if (result)
                    {
                      uint64_t v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                      unsigned int v19 = *v18;
                      if (v19 < 0xF
                        || !v18[7]
                        || (BOOL result = 0, v20 = *((void *)a2 + 1), v20 >= 5)
                        && v20 - 4 >= (unint64_t)this + v18[7] - *(void *)a2)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                        if (result
                          && (v19 < 0x11
                           || !v18[8]
                           || (BOOL result = siri::speech::schema_fb::TextToSpeechResponseDevData::Verify((siri::speech::schema_fb::FinalTextToSpeechStreamingResponse *)((char *)this + v18[8] + *(unsigned int *)((char *)this + v18[8])), a2))))
                        {
                          --*((_DWORD *)a2 + 4);
                          return 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5D9EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5DA18C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DA3A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DA47C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DA5B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DA754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechCacheMetaInfo::Verify(siri::speech::schema_fb::TextToSpeechCacheMetaInfo *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      unsigned int v6 = *(unsigned __int16 *)((char *)this - v5);
      if (v6 < 5) {
        goto LABEL_16;
      }
      if (*(_WORD *)((char *)this - v5 + 4))
      {
        BOOL result = siri::speech::schema_fb::TextToSpeechMeta::Verify((siri::speech::schema_fb::TextToSpeechCacheMetaInfo *)((char *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this+ *(unsigned __int16 *)((char *)this - v5 + 4))), a2);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(int *)this;
        uint64_t v7 = -v5;
        unsigned int v6 = *(unsigned __int16 *)((char *)this - v5);
      }
      else
      {
        uint64_t v7 = -v5;
      }
      if (v6 < 7
        || ((unint64_t v8 = (char *)this + v7, !*((_WORD *)v8 + 3))
         || (BOOL result = 0, v9 = *((void *)a2 + 1), v9 >= 5)
         && v9 - 4 >= (unint64_t)this + *((unsigned __int16 *)v8 + 3) - *(void *)a2)
        && (v6 < 9
         || (uint64_t v10 = *((unsigned __int16 *)v8 + 4), !*((_WORD *)v8 + 4))
         || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 2)
         && v11 - 1 >= (unint64_t)this + v10 - *(void *)a2))
      {
LABEL_16:
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
        if (result)
        {
          unsigned int v12 = (unsigned __int16 *)((char *)this - (int)v5);
          if (*v12 < 0xBu
            || (uint64_t v13 = v12[5]) == 0
            || (BOOL result = siri::speech::schema_fb::AudioDescription::Verify((siri::speech::schema_fb::TextToSpeechCacheMetaInfo *)((char *)this+ v13+ *(unsigned int *)((char *)this + v13)), a2)))
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
            if (result)
            {
              uint64_t v14 = *(int *)this;
              unsigned int v15 = *(unsigned __int16 *)((char *)this - v14);
              if (v15 < 0xD) {
                goto LABEL_30;
              }
              if (*(_WORD *)((char *)this - v14 + 12))
              {
                BOOL result = siri::speech::schema_fb::AudioDescription::Verify((siri::speech::schema_fb::TextToSpeechCacheMetaInfo *)((char *)this+ *(unsigned __int16 *)((char *)this - v14 + 12)+ *(unsigned int *)((char *)this+ *(unsigned __int16 *)((char *)this - v14 + 12))), a2);
                if (!result) {
                  return result;
                }
                uint64_t v14 = *(int *)this;
                uint64_t v16 = -v14;
                unsigned int v15 = *(unsigned __int16 *)((char *)this - v14);
              }
              else
              {
                uint64_t v16 = -v14;
              }
              if (v15 < 0xF
                || (uint64_t v17 = *(unsigned __int16 *)((char *)this + v16 + 14), !*(_WORD *)((char *)this + v16 + 14))
                || (BOOL result = 0, v18 = *((void *)a2 + 1), v18 >= 5)
                && v18 - 4 >= (unint64_t)this + v17 - *(void *)a2)
              {
LABEL_30:
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                if (result)
                {
                  unsigned int v19 = (unsigned __int16 *)((char *)this - (int)v14);
                  if (*v19 >= 0x11u && (uint64_t v20 = v19[8]) != 0) {
                    uint64_t v21 = (const unsigned __int8 *)this + v20 + *(unsigned int *)((char *)this + v20);
                  }
                  else {
                    uint64_t v21 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v21);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                    if (result)
                    {
                      uint64_t v22 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v22 >= 0x13u && (uint64_t v23 = v22[9]) != 0) {
                        unsigned int v24 = (const unsigned __int8 *)this + v23 + *(unsigned int *)((char *)this + v23);
                      }
                      else {
                        unsigned int v24 = 0;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v24);
                      if (result)
                      {
                        --*((_DWORD *)a2 + 4);
                        return 1;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5DAB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5DAF2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  if (__p) {
    operator delete(__p);
  }
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_22B5DB0E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DB190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B5DB378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechCacheObject::Verify(siri::speech::schema_fb::TextToSpeechCacheObject *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6), 1uLL, 0)))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v7 = 0;
          uint64_t v8 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v8) >= 7u)
          {
            if (!*(_WORD *)((char *)this - v8 + 6)) {
              goto LABEL_11;
            }
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v8 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v8 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v7 = 0;
            uint64_t v8 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v8) >= 7u)
            {
LABEL_11:
              uint64_t v9 = *(unsigned __int16 *)((char *)this - v8 + 6);
              if (v9) {
                uint64_t v7 = (_DWORD *)((char *)this + v9 + *(unsigned int *)((char *)this + v9));
              }
              else {
                uint64_t v7 = 0;
              }
            }
          }
          BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::WordTimingInfo>(a2, v7);
          if (result)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5DB638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5DB9C4(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

void sub_22B5DBB38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DBC18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DBEB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DC048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5DC2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DC43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5DC620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DC950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DCAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5DCE50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5DCFDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DD208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DD398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5DD6D8(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

void sub_22B5DD840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DD9E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechSpeechFeatureInputText::Verify(siri::speech::schema_fb::TextToSpeechSpeechFeatureInputText *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
        goto LABEL_12;
      }
      if (*(_WORD *)((char *)this - v5 + 4))
      {
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v5 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
          goto LABEL_12;
        }
      }
      uint64_t v6 = *(unsigned __int16 *)((char *)this - v5 + 4);
      if (v6 && (uint64_t v7 = (_DWORD *)((char *)this + v6 + *(unsigned int *)((char *)this + v6)), *v7))
      {
        unint64_t v8 = 0;
        uint64_t v9 = v7 + 1;
        while (siri::speech::schema_fb::ContextWithPronHints::Verify((siri::speech::schema_fb::ContextWithPronHints *)((char *)v9 + *v9), a2))
        {
          ++v8;
          ++v9;
          if (v8 >= *v7) {
            goto LABEL_12;
          }
        }
        return 0;
      }
      else
      {
LABEL_12:
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B5DDC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5DDE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DE160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature::Verify(siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        unsigned int v9 = *v8;
        if (v9 < 7) {
          goto LABEL_28;
        }
        if (!v8[3]
          || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
          && v10 - 4 >= (unint64_t)this + v8[3] - *(void *)a2)
        {
          if (v9 < 9) {
            goto LABEL_28;
          }
          if (!v8[4]
            || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
            && v11 - 4 >= (unint64_t)this + v8[4] - *(void *)a2)
          {
            if (v9 < 0xB
              || (!v8[5]
               || (BOOL result = 0, v12 = *((void *)a2 + 1), v12 >= 5)
               && v12 - 4 >= (unint64_t)this + v8[5] - *(void *)a2)
              && (v9 < 0xD
               || (!v8[6]
                || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
                && v13 - 4 >= (unint64_t)this + v8[6] - *(void *)a2)
               && (v9 < 0xF
                || (uint64_t v14 = v8[7]) == 0
                || (BOOL result = 0, v15 = *((void *)a2 + 1), v15 >= 5)
                && v15 - 4 >= (unint64_t)this + v14 - *(void *)a2)))
            {
LABEL_28:
              --*((_DWORD *)a2 + 4);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5DE4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5DE6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DE7DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DE8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DE984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DEDA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DEF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5DF3A0(_Unwind_Exception *a1)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

void sub_22B5DF51C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5DFA44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature::Verify((siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5DFC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5DFDCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E0050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::ClientSetupInfo::Verify(siri::speech::schema_fb::ClientSetupInfo *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
      && (v6 < 7
       || !v5[3]
       || (BOOL result = 0, v8 = *((void *)a2 + 1), v8 >= 2) && v8 - 1 >= (unint64_t)this + v5[3] - *(void *)a2))
    {
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
      if (result)
      {
        if (v6 >= 9 && v5[4]) {
          unsigned int v9 = (const unsigned __int8 *)this + v5[4] + *(unsigned int *)((char *)this + v5[4]);
        }
        else {
          unsigned int v9 = 0;
        }
        BOOL result = flatbuffers::Verifier::VerifyString(a2, v9);
        if (result)
        {
          --*((_DWORD *)a2 + 4);
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_22B5E02EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E0550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E06E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E08C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E0CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E0E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E1250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5E13E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E1834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E19C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E1B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B5E1C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B5E1E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::AudioFrame::Verify(siri::speech::schema_fb::AudioFrame *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6), 1uLL, 0)))
      {
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B5E2048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E2388(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

void sub_22B5E24F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E2698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SpeechTranslationAudioPacket::Verify(siri::speech::schema_fb::SpeechTranslationAudioPacket *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = *(int *)this;
      if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
        goto LABEL_12;
      }
      if (*(_WORD *)((char *)this - v5 + 4))
      {
        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v5 + 4)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v5 + 4)), 4uLL, 0);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(int *)this;
        if (*(unsigned __int16 *)((char *)this - v5) < 5u) {
          goto LABEL_12;
        }
      }
      uint64_t v6 = *(unsigned __int16 *)((char *)this - v5 + 4);
      if (v6 && (uint64_t v7 = (_DWORD *)((char *)this + v6 + *(unsigned int *)((char *)this + v6)), *v7))
      {
        unint64_t v8 = 0;
        unsigned int v9 = v7 + 1;
        while (siri::speech::schema_fb::AudioFrame::Verify((siri::speech::schema_fb::AudioFrame *)((char *)v9 + *v9), a2))
        {
          ++v8;
          ++v9;
          if (v8 >= *v7) {
            goto LABEL_12;
          }
        }
        return 0;
      }
      else
      {
LABEL_12:
        --*((_DWORD *)a2 + 4);
        return 1;
      }
    }
  }
  return result;
}

void sub_22B5E2934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E2AC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E2D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E2F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E3668(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (v14) {
    operator delete(v14);
  }
  if (v13) {
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5E398C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E3A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E3B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E3C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E3F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::StartSpeechTranslationRequest::Verify(siri::speech::schema_fb::StartSpeechTranslationRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = 0;
              uint64_t v12 = *(int *)this;
              if (*(unsigned __int16 *)((char *)this - v12) >= 9u)
              {
                if (!*(_WORD *)((char *)this - v12 + 8)) {
                  goto LABEL_19;
                }
                BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v12 + 8)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v12 + 8)), 4uLL, 0);
                if (!result) {
                  return result;
                }
                unint64_t v11 = 0;
                uint64_t v12 = *(int *)this;
                if (*(unsigned __int16 *)((char *)this - v12) >= 9u)
                {
LABEL_19:
                  uint64_t v13 = *(unsigned __int16 *)((char *)this - v12 + 8);
                  if (v13) {
                    unint64_t v11 = (_DWORD *)((char *)this + v13 + *(unsigned int *)((char *)this + v13));
                  }
                  else {
                    unint64_t v11 = 0;
                  }
                }
              }
              BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::CorrectionsAlignment>(a2, v11);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  uint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 < 0xBu
                    || (uint64_t v15 = v14[5]) == 0
                    || (BOOL result = siri::speech::schema_fb::StartSpeechRequest::Verify((siri::speech::schema_fb::StartSpeechTranslationRequest *)((char *)this+ v15+ *(unsigned int *)((char *)this + v15)), a2)))
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      uint64_t v16 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v16 < 0xDu
                        || (uint64_t v17 = v16[6]) == 0
                        || (BOOL result = siri::speech::schema_fb::TranslationRequest::Verify((siri::speech::schema_fb::StartSpeechTranslationRequest *)((char *)this+ v17+ *(unsigned int *)((char *)this + v17)), a2)))
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                        if (result)
                        {
                          unint64_t v18 = 0;
                          uint64_t v19 = *(int *)this;
                          if (*(unsigned __int16 *)((char *)this - v19) >= 0xFu)
                          {
                            if (!*(_WORD *)((char *)this - v19 + 14)) {
                              goto LABEL_36;
                            }
                            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v19 + 14)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v19 + 14)), 4uLL, 0);
                            if (!result) {
                              return result;
                            }
                            unint64_t v18 = 0;
                            uint64_t v19 = *(int *)this;
                            if (*(unsigned __int16 *)((char *)this - v19) >= 0xFu)
                            {
LABEL_36:
                              uint64_t v20 = *(unsigned __int16 *)((char *)this - v19 + 14);
                              if (v20) {
                                unint64_t v18 = (_DWORD *)((char *)this + v20 + *(unsigned int *)((char *)this + v20));
                              }
                              else {
                                unint64_t v18 = 0;
                              }
                            }
                          }
                          BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TextToSpeechRequest>(a2, v18);
                          if (result)
                          {
                            uint64_t v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                            unsigned int v22 = *v21;
                            if (v22 < 0x11
                              || !v21[8]
                              || (BOOL result = 0, v23 = *((void *)a2 + 1), v23 >= 2)
                              && v23 - 1 >= (unint64_t)this + v21[8] - *(void *)a2)
                            {
                              uint64_t v30 = (char *)this - *(int *)this;
                              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                              if (result)
                              {
                                if (v22 >= 0x13 && *((_WORD *)v30 + 9)) {
                                  unsigned int v24 = (const unsigned __int8 *)this
                                }
                                      + *((unsigned __int16 *)v30 + 9)
                                      + *(unsigned int *)((char *)this + *((unsigned __int16 *)v30 + 9));
                                else {
                                  unsigned int v24 = 0;
                                }
                                BOOL result = flatbuffers::Verifier::VerifyString(a2, v24);
                                if (result)
                                {
                                  uint64_t v25 = (unsigned __int16 *)((char *)this - *(int *)this);
                                  unsigned int v26 = *v25;
                                  if (v26 < 0x15
                                    || (!v25[10]
                                     || (BOOL result = 0, v27 = *((void *)a2 + 1), v27 >= 5)
                                     && v27 - 4 >= (unint64_t)this + v25[10] - *(void *)a2)
                                    && (v26 < 0x17
                                     || (uint64_t v28 = v25[11]) == 0
                                     || (BOOL result = 0, v29 = *((void *)a2 + 1), v29 >= 2)
                                     && v29 - 1 >= (unint64_t)this + v28 - *(void *)a2))
                                  {
                                    --*((_DWORD *)a2 + 4);
                                    return 1;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TextToSpeechRequest>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::TextToSpeechRequest::Verify((siri::speech::schema_fb::TextToSpeechRequest *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5E44E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E4BC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36)
{
  if (__p) {
    operator delete(__p);
  }
  if (a36) {
    operator delete(a36);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5E4DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E4F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E50D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E5230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E5580(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5E56FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E5868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E5A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E5CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::LanguageDetectionPrediction::Verify(siri::speech::schema_fb::LanguageDetectionPrediction *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        unsigned int v9 = *v8;
        if (v9 < 7
          || (!v8[3]
           || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
           && v10 - 4 >= (unint64_t)this + v8[3] - *(void *)a2)
          && (v9 < 9
           || (!v8[4]
            || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
            && v11 - 4 >= (unint64_t)this + v8[4] - *(void *)a2)
           && (v9 < 0xB
            || (uint64_t v12 = v8[5]) == 0
            || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 2)
            && v13 - 1 >= (unint64_t)this + v12 - *(void *)a2)))
        {
          --*((_DWORD *)a2 + 4);
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_22B5E6048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::LanguageDetected::Verify(siri::speech::schema_fb::LanguageDetected *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = 0;
          uint64_t v9 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v9) >= 7u)
          {
            if (!*(_WORD *)((char *)this - v9 + 6)) {
              goto LABEL_13;
            }
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v9 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v9 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            unint64_t v8 = 0;
            uint64_t v9 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v9) >= 7u)
            {
LABEL_13:
              uint64_t v10 = *(unsigned __int16 *)((char *)this - v9 + 6);
              if (v10) {
                unint64_t v8 = (_DWORD *)((char *)this + v10 + *(unsigned int *)((char *)this + v10));
              }
              else {
                unint64_t v8 = 0;
              }
            }
          }
          BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::LanguageDetectionPrediction>(a2, v8);
          if (result)
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::LanguageDetectionPrediction>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::LanguageDetectionPrediction::Verify((siri::speech::schema_fb::LanguageDetectionPrediction *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5E62F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E659C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::StartSpeechTranslationLoggingRequest::Verify(siri::speech::schema_fb::StartSpeechTranslationLoggingRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 < 9u
                || (uint64_t v12 = v11[4]) == 0
                || (BOOL result = siri::speech::schema_fb::UserParameters::Verify((siri::speech::schema_fb::StartSpeechTranslationLoggingRequest *)((char *)this+ v12+ *(unsigned int *)((char *)this + v12)), a2)))
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  unint64_t v13 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v13 < 0xBu
                    || (uint64_t v14 = v13[5]) == 0
                    || (BOOL result = siri::speech::schema_fb::LanguageDetected::Verify((siri::speech::schema_fb::StartSpeechTranslationLoggingRequest *)((char *)this + v14 + *(unsigned int *)((char *)this + v14)), a2)))
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v15 >= 0xDu && (uint64_t v16 = v15[6]) != 0) {
                        uint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                      }
                      else {
                        uint64_t v17 = 0;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                      if (result)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                        if (result)
                        {
                          unint64_t v18 = 0;
                          uint64_t v19 = *(int *)this;
                          if (*(unsigned __int16 *)((char *)this - v19) >= 0xFu)
                          {
                            if (!*(_WORD *)((char *)this - v19 + 14)) {
                              goto LABEL_33;
                            }
                            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v19 + 14)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v19 + 14)), 4uLL, 0);
                            if (!result) {
                              return result;
                            }
                            unint64_t v18 = 0;
                            uint64_t v19 = *(int *)this;
                            if (*(unsigned __int16 *)((char *)this - v19) >= 0xFu)
                            {
LABEL_33:
                              uint64_t v20 = *(unsigned __int16 *)((char *)this - v19 + 14);
                              if (v20) {
                                unint64_t v18 = (_DWORD *)((char *)this + v20 + *(unsigned int *)((char *)this + v20));
                              }
                              else {
                                unint64_t v18 = 0;
                              }
                            }
                          }
                          BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v18);
                          if (result)
                          {
                            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                            if (result)
                            {
                              uint64_t v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                              if (*v21 >= 0x11u && (uint64_t v22 = v21[8]) != 0) {
                                unint64_t v23 = (const unsigned __int8 *)this + v22 + *(unsigned int *)((char *)this + v22);
                              }
                              else {
                                unint64_t v23 = 0;
                              }
                              BOOL result = flatbuffers::Verifier::VerifyString(a2, v23);
                              if (result)
                              {
                                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                                if (result)
                                {
                                  unsigned int v24 = 0;
                                  uint64_t v25 = *(int *)this;
                                  if (*(unsigned __int16 *)((char *)this - v25) >= 0x13u)
                                  {
                                    if (!*(_WORD *)((char *)this - v25 + 18)) {
                                      goto LABEL_48;
                                    }
                                    BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v25 + 18)+ *(unsigned int *)((char *)this+ *(unsigned __int16 *)((char *)this - v25 + 18)), 4uLL, 0);
                                    if (!result) {
                                      return result;
                                    }
                                    unsigned int v24 = 0;
                                    uint64_t v25 = *(int *)this;
                                    if (*(unsigned __int16 *)((char *)this - v25) >= 0x13u)
                                    {
LABEL_48:
                                      uint64_t v26 = *(unsigned __int16 *)((char *)this - v25 + 18);
                                      if (v26) {
                                        unsigned int v24 = (_DWORD *)((char *)this + v26 + *(unsigned int *)((char *)this + v26));
                                      }
                                      else {
                                        unsigned int v24 = 0;
                                      }
                                    }
                                  }
                                  BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v24);
                                  if (result)
                                  {
                                    --*((_DWORD *)a2 + 4);
                                    return 1;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5E6A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E6D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E7238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SpeechTranslationPartialRecognitionResponse::Verify(siri::speech::schema_fb::SpeechTranslationPartialRecognitionResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                uint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 >= 0xDu && (uint64_t v16 = v15[6]) != 0) {
                      uint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                    }
                    else {
                      uint64_t v17 = 0;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                    if (result)
                    {
                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                      if (result)
                      {
                        unint64_t v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                        if (*v18 >= 0xFu && (uint64_t v19 = v18[7]) != 0) {
                          uint64_t v20 = (const unsigned __int8 *)this + v19 + *(unsigned int *)((char *)this + v19);
                        }
                        else {
                          uint64_t v20 = 0;
                        }
                        BOOL result = flatbuffers::Verifier::VerifyString(a2, v20);
                        if (result)
                        {
                          uint64_t v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                          unsigned int v22 = *v21;
                          if (v22 < 0x11
                            || (!v21[8]
                             || (BOOL result = 0, v23 = *((void *)a2 + 1), v23 >= 5)
                             && v23 - 4 >= (unint64_t)this + v21[8] - *(void *)a2)
                            && (v22 < 0x13
                             || (uint64_t v24 = v21[9]) == 0
                             || (BOOL result = 0, v25 = *((void *)a2 + 1), v25 >= 2)
                             && v25 - 1 >= (unint64_t)this + v24 - *(void *)a2))
                          {
                            --*((_DWORD *)a2 + 4);
                            return 1;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5E7658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E7938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E7A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E7E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SpeechTranslationFinalRecognitionResponse::Verify(siri::speech::schema_fb::SpeechTranslationFinalRecognitionResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                uint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 >= 0xDu && (uint64_t v16 = v15[6]) != 0) {
                      uint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                    }
                    else {
                      uint64_t v17 = 0;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                    if (result)
                    {
                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                      if (result)
                      {
                        unint64_t v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                        if (*v18 >= 0xFu && (uint64_t v19 = v18[7]) != 0) {
                          uint64_t v20 = (const unsigned __int8 *)this + v19 + *(unsigned int *)((char *)this + v19);
                        }
                        else {
                          uint64_t v20 = 0;
                        }
                        BOOL result = flatbuffers::Verifier::VerifyString(a2, v20);
                        if (result)
                        {
                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                          if (result)
                          {
                            uint64_t v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                            if (*v21 < 0x11u
                              || (uint64_t v22 = v21[8]) == 0
                              || (BOOL result = siri::speech::schema_fb::RecognitionResult::Verify((siri::speech::schema_fb::SpeechTranslationFinalRecognitionResponse *)((char *)this + v22 + *(unsigned int *)((char *)this + v22)), a2)))
                            {
                              --*((_DWORD *)a2 + 4);
                              return 1;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5E826C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E872C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5E88E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E8A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E8C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E8F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase::Verify(siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || !v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
      if (result)
      {
        unint64_t v8 = v6 >= 7 && v5[3] ? (const unsigned __int8 *)this + v5[3] + *(unsigned int *)((char *)this + v5[3]) : 0;
        BOOL result = flatbuffers::Verifier::VerifyString(a2, v8);
        if (result)
        {
          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
          if (result)
          {
            uint64_t v9 = (unsigned __int16 *)((char *)this - *(int *)this);
            if (*v9 >= 9u && (uint64_t v10 = v9[4]) != 0) {
              unint64_t v11 = (const unsigned __int8 *)this + v10 + *(unsigned int *)((char *)this + v10);
            }
            else {
              unint64_t v11 = 0;
            }
            BOOL result = flatbuffers::Verifier::VerifyString(a2, v11);
            if (result)
            {
              unsigned int v12 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v12 < 0xBu
                || (uint64_t v13 = v12[5]) == 0
                || (BOOL result = 0, v14 = *((void *)a2 + 1), v14 >= 2)
                && v14 - 1 >= (unint64_t)this + v13 - *(void *)a2)
              {
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5E91A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E94F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SpeechTranslationMtResponse::Verify(siri::speech::schema_fb::SpeechTranslationMtResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                unint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 < 0xDu
                      || (uint64_t v16 = v15[6]) == 0
                      || (BOOL result = siri::speech::schema_fb::UserParameters::Verify((siri::speech::schema_fb::SpeechTranslationMtResponse *)((char *)this+ v16+ *(unsigned int *)((char *)this + v16)), a2)))
                    {
                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                      if (result)
                      {
                        uint64_t v17 = 0;
                        uint64_t v18 = *(int *)this;
                        if (*(unsigned __int16 *)((char *)this - v18) >= 0xFu)
                        {
                          if (!*(_WORD *)((char *)this - v18 + 14)) {
                            goto LABEL_33;
                          }
                          BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v18 + 14)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v18 + 14)), 4uLL, 0);
                          if (!result) {
                            return result;
                          }
                          uint64_t v17 = 0;
                          uint64_t v18 = *(int *)this;
                          if (*(unsigned __int16 *)((char *)this - v18) >= 0xFu)
                          {
LABEL_33:
                            uint64_t v19 = *(unsigned __int16 *)((char *)this - v18 + 14);
                            if (v19) {
                              uint64_t v17 = (_DWORD *)((char *)this + v19 + *(unsigned int *)((char *)this + v19));
                            }
                            else {
                              uint64_t v17 = 0;
                            }
                          }
                        }
                        BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>(a2, v17);
                        if (result)
                        {
                          uint64_t v20 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v20 < 0x11u
                            || (uint64_t v21 = v20[8]) == 0
                            || (BOOL result = 0, v22 = *((void *)a2 + 1), v22 >= 2)
                            && v22 - 1 >= (unint64_t)this + v21 - *(void *)a2)
                          {
                            --*((_DWORD *)a2 + 4);
                            return 1;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase::Verify((siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5E99A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5E9BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E9CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5E9FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SpeechTranslationTextToSpeechResponse::Verify(siri::speech::schema_fb::SpeechTranslationTextToSpeechResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                unint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                unint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  unint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 < 0xBu
                    || (uint64_t v15 = v14[5]) == 0
                    || (BOOL result = siri::speech::schema_fb::TextToSpeechResponse::Verify((siri::speech::schema_fb::SpeechTranslationTextToSpeechResponse *)((char *)this + v15 + *(unsigned int *)((char *)this + v15)), a2)))
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5EA2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5EA4FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EA5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EA904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::SpeechTranslationServerEndpointFeatures::Verify(siri::speech::schema_fb::SpeechTranslationServerEndpointFeatures *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            uint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            uint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                unint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                unint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  unint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 < 0xBu
                    || (uint64_t v15 = v14[5]) == 0
                    || (BOOL result = siri::speech::schema_fb::ServerEndpointFeatures::Verify((siri::speech::schema_fb::SpeechTranslationServerEndpointFeatures *)((char *)this + v15 + *(unsigned int *)((char *)this + v15)), a2)))
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5EAC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5EB19C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5EB688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EB7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5EBB64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5EBCF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EBF1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EC020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EC4A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EC630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5EC9F4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5ECB9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5ECD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5ECE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5ED0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5ED45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5ED5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5ED7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EDB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EDC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5EE008(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

void sub_22B5EE17C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EE25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EE3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::StartMultilingualSpeechRequest::Verify(siri::speech::schema_fb::StartMultilingualSpeechRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = siri::speech::schema_fb::StartSpeechRequest::Verify((siri::speech::schema_fb::StartMultilingualSpeechRequest *)((char *)this+ v6+ *(unsigned int *)((char *)this + v6)), a2)))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v7 = *(int *)this;
          if (*(unsigned __int16 *)((char *)this - v7) < 7u) {
            goto LABEL_16;
          }
          if (*(_WORD *)((char *)this - v7 + 6))
          {
            BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v7 + 6)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v7 + 6)), 4uLL, 0);
            if (!result) {
              return result;
            }
            uint64_t v7 = *(int *)this;
            if (*(unsigned __int16 *)((char *)this - v7) < 7u) {
              goto LABEL_16;
            }
          }
          uint64_t v8 = *(unsigned __int16 *)((char *)this - v7 + 6);
          if (v8 && (uint64_t v9 = (_DWORD *)((char *)this + v8 + *(unsigned int *)((char *)this + v8)), *v9))
          {
            unint64_t v10 = 0;
            unint64_t v11 = v9 + 1;
            while (siri::speech::schema_fb::CancelRequest::Verify((siri::speech::schema_fb::CancelRequest *)((char *)v11 + *v11), a2))
            {
              ++v10;
              ++v11;
              if (v10 >= *v9) {
                goto LABEL_16;
              }
            }
            return 0;
          }
          else
          {
LABEL_16:
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5EE6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5EE834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EEA84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EEC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5EF1D4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5EF544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EF6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5EFA50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5EFBDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5EFE8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::BatchTranslationRequest_::Paragraph::Verify(siri::speech::schema_fb::BatchTranslationRequest_::Paragraph *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = 0;
              uint64_t v12 = *(int *)this;
              if (*(unsigned __int16 *)((char *)this - v12) >= 9u)
              {
                if (!*(_WORD *)((char *)this - v12 + 8)) {
                  goto LABEL_19;
                }
                BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v12 + 8)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v12 + 8)), 4uLL, 0);
                if (!result) {
                  return result;
                }
                unint64_t v11 = 0;
                uint64_t v12 = *(int *)this;
                if (*(unsigned __int16 *)((char *)this - v12) >= 9u)
                {
LABEL_19:
                  uint64_t v13 = *(unsigned __int16 *)((char *)this - v12 + 8);
                  if (v13) {
                    unint64_t v11 = (_DWORD *)((char *)this + v13 + *(unsigned int *)((char *)this + v13));
                  }
                  else {
                    unint64_t v11 = 0;
                  }
                }
              }
              BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::Span>(a2, v11);
              if (result)
              {
                --*((_DWORD *)a2 + 4);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5F03E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::BatchTranslationRequest::Verify(siri::speech::schema_fb::BatchTranslationRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                uint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                uint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  unint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 >= 0xBu && (uint64_t v15 = v14[5]) != 0) {
                    uint64_t v16 = (const unsigned __int8 *)this + v15 + *(unsigned int *)((char *)this + v15);
                  }
                  else {
                    uint64_t v16 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v16);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      uint64_t v17 = 0;
                      uint64_t v18 = *(int *)this;
                      if (*(unsigned __int16 *)((char *)this - v18) >= 0xDu)
                      {
                        if (!*(_WORD *)((char *)this - v18 + 12)) {
                          goto LABEL_31;
                        }
                        BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v18 + 12)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v18 + 12)), 4uLL, 0);
                        if (!result) {
                          return result;
                        }
                        uint64_t v17 = 0;
                        uint64_t v18 = *(int *)this;
                        if (*(unsigned __int16 *)((char *)this - v18) >= 0xDu)
                        {
LABEL_31:
                          uint64_t v19 = *(unsigned __int16 *)((char *)this - v18 + 12);
                          if (v19) {
                            uint64_t v17 = (_DWORD *)((char *)this + v19 + *(unsigned int *)((char *)this + v19));
                          }
                          else {
                            uint64_t v17 = 0;
                          }
                        }
                      }
                      BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>(a2, v17);
                      if (result)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                        if (result)
                        {
                          uint64_t v20 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v20 >= 0xFu && (uint64_t v21 = v20[7]) != 0) {
                            unint64_t v22 = (const unsigned __int8 *)this + v21 + *(unsigned int *)((char *)this + v21);
                          }
                          else {
                            unint64_t v22 = 0;
                          }
                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v22);
                          if (result)
                          {
                            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                            if (result)
                            {
                              unint64_t v23 = (unsigned __int16 *)((char *)this - *(int *)this);
                              if (*v23 >= 0x11u && (uint64_t v24 = v23[8]) != 0) {
                                unint64_t v25 = (const unsigned __int8 *)this + v24 + *(unsigned int *)((char *)this + v24);
                              }
                              else {
                                unint64_t v25 = 0;
                              }
                              BOOL result = flatbuffers::Verifier::VerifyString(a2, v25);
                              if (result)
                              {
                                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                                if (result)
                                {
                                  uint64_t v26 = (unsigned __int16 *)((char *)this - *(int *)this);
                                  if (*v26 >= 0x13u && (uint64_t v27 = v26[9]) != 0) {
                                    uint64_t v28 = (const unsigned __int8 *)this + v27 + *(unsigned int *)((char *)this + v27);
                                  }
                                  else {
                                    uint64_t v28 = 0;
                                  }
                                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v28);
                                  if (result)
                                  {
                                    unint64_t v29 = (unsigned __int16 *)((char *)this - *(int *)this);
                                    if (*v29 < 0x15u
                                      || (uint64_t v30 = v29[10]) == 0
                                      || (BOOL result = 0, v31 = *((void *)a2 + 1), v31 >= 5)
                                      && v31 - 4 >= (unint64_t)this + v30 - *(void *)a2)
                                    {
                                      --*((_DWORD *)a2 + 4);
                                      return 1;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::BatchTranslationRequest_::Paragraph::Verify((siri::speech::schema_fb::BatchTranslationRequest_::Paragraph *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5F0948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F0DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F1558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::BatchTranslationFeedbackRequest::Verify(siri::speech::schema_fb::BatchTranslationFeedbackRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              unint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v11 >= 9u && (uint64_t v12 = v11[4]) != 0) {
                uint64_t v13 = (const unsigned __int8 *)this + v12 + *(unsigned int *)((char *)this + v12);
              }
              else {
                uint64_t v13 = 0;
              }
              BOOL result = flatbuffers::Verifier::VerifyString(a2, v13);
              if (result)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  unint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v14 >= 0xBu && (uint64_t v15 = v14[5]) != 0) {
                    uint64_t v16 = (const unsigned __int8 *)this + v15 + *(unsigned int *)((char *)this + v15);
                  }
                  else {
                    uint64_t v16 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v16);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                    if (result)
                    {
                      uint64_t v17 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v17 >= 0xDu && (uint64_t v18 = v17[6]) != 0) {
                        uint64_t v19 = (const unsigned __int8 *)this + v18 + *(unsigned int *)((char *)this + v18);
                      }
                      else {
                        uint64_t v19 = 0;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v19);
                      if (result)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                        if (result)
                        {
                          uint64_t v20 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v20 >= 0xFu && (uint64_t v21 = v20[7]) != 0) {
                            unint64_t v22 = (const unsigned __int8 *)this + v21 + *(unsigned int *)((char *)this + v21);
                          }
                          else {
                            unint64_t v22 = 0;
                          }
                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v22);
                          if (result)
                          {
                            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                            if (result)
                            {
                              unint64_t v23 = (unsigned __int16 *)((char *)this - *(int *)this);
                              if (*v23 >= 0x11u && (uint64_t v24 = v23[8]) != 0) {
                                unint64_t v25 = (const unsigned __int8 *)this + v24 + *(unsigned int *)((char *)this + v24);
                              }
                              else {
                                unint64_t v25 = 0;
                              }
                              BOOL result = flatbuffers::Verifier::VerifyString(a2, v25);
                              if (result)
                              {
                                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                                if (result)
                                {
                                  uint64_t v26 = (unsigned __int16 *)((char *)this - *(int *)this);
                                  if (*v26 >= 0x13u && (uint64_t v27 = v26[9]) != 0) {
                                    uint64_t v28 = (const unsigned __int8 *)this + v27 + *(unsigned int *)((char *)this + v27);
                                  }
                                  else {
                                    uint64_t v28 = 0;
                                  }
                                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v28);
                                  if (result)
                                  {
                                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                                    if (result)
                                    {
                                      unint64_t v29 = (unsigned __int16 *)((char *)this - *(int *)this);
                                      if (*v29 >= 0x15u && (uint64_t v30 = v29[10]) != 0) {
                                        unint64_t v31 = (const unsigned __int8 *)this
                                      }
                                            + v30
                                            + *(unsigned int *)((char *)this + v30);
                                      else {
                                        unint64_t v31 = 0;
                                      }
                                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v31);
                                      if (result)
                                      {
                                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x16u);
                                        if (result)
                                        {
                                          uint64_t v32 = (unsigned __int16 *)((char *)this - *(int *)this);
                                          if (*v32 >= 0x17u && (uint64_t v33 = v32[11]) != 0) {
                                            unint64_t v34 = (const unsigned __int8 *)this
                                          }
                                                + v33
                                                + *(unsigned int *)((char *)this + v33);
                                          else {
                                            unint64_t v34 = 0;
                                          }
                                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v34);
                                          if (result)
                                          {
                                            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x18u);
                                            if (result)
                                            {
                                              unint64_t v35 = (unsigned __int16 *)((char *)this - *(int *)this);
                                              if (*v35 >= 0x19u && (uint64_t v36 = v35[12]) != 0) {
                                                uint64_t v37 = (const unsigned __int8 *)this
                                              }
                                                    + v36
                                                    + *(unsigned int *)((char *)this + v36);
                                              else {
                                                uint64_t v37 = 0;
                                              }
                                              BOOL result = flatbuffers::Verifier::VerifyString(a2, v37);
                                              if (result)
                                              {
                                                --*((_DWORD *)a2 + 4);
                                                return 1;
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5F1A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F1C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F1EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::BatchTranslationLoggingRequest::Verify(siri::speech::schema_fb::BatchTranslationLoggingRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        unsigned int v9 = *v8;
        if (v9 < 7
          || (!v8[3]
           || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
           && v10 - 4 >= (unint64_t)this + v8[3] - *(void *)a2)
          && (v9 < 9
           || (!v8[4]
            || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
            && v11 - 4 >= (unint64_t)this + v8[4] - *(void *)a2)
           && (v9 < 0xB
            || (uint64_t v12 = v8[5]) == 0
            || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
            && v13 - 4 >= (unint64_t)this + v12 - *(void *)a2)))
        {
          --*((_DWORD *)a2 + 4);
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_22B5F21BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F2844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p)
{
  if (v32) {
    operator delete(v32);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_22B5F2A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F2B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F2F94(_Unwind_Exception *a1)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

void sub_22B5F3110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F327C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F3670(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5F37F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F3B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase::Verify(siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || !v5[2]
      || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
      if (result)
      {
        uint64_t v8 = v6 >= 7 && v5[3] ? (const unsigned __int8 *)this + v5[3] + *(unsigned int *)((char *)this + v5[3]) : 0;
        BOOL result = flatbuffers::Verifier::VerifyString(a2, v8);
        if (result)
        {
          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
          if (result)
          {
            unsigned int v9 = (unsigned __int16 *)((char *)this - *(int *)this);
            if (*v9 >= 9u && (uint64_t v10 = v9[4]) != 0) {
              unint64_t v11 = (const unsigned __int8 *)this + v10 + *(unsigned int *)((char *)this + v10);
            }
            else {
              unint64_t v11 = 0;
            }
            BOOL result = flatbuffers::Verifier::VerifyString(a2, v11);
            if (result)
            {
              uint64_t v12 = *(int *)this;
              unint64_t v13 = (char *)this - v12;
              unsigned int v14 = *(unsigned __int16 *)((char *)this - v12);
              if (v14 < 0xB
                || !*((_WORD *)v13 + 5)
                || (BOOL result = 0, v15 = *((void *)a2 + 1), v15 >= 2)
                && v15 - 1 >= (unint64_t)this + *((unsigned __int16 *)v13 + 5) - *(void *)a2)
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                if (result)
                {
                  if (v14 < 0xD) {
                    goto LABEL_31;
                  }
                  if (*((_WORD *)v13 + 6))
                  {
                    BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *((unsigned __int16 *)v13 + 6)+ *(unsigned int *)((char *)this + *((unsigned __int16 *)v13 + 6)), 4uLL, 0);
                    if (!result) {
                      return result;
                    }
                    uint64_t v16 = 0;
                    uint64_t v17 = *(int *)this;
                    if (*(unsigned __int16 *)((char *)this - v17) < 0xDu) {
                      goto LABEL_32;
                    }
                    uint64_t v18 = -v17;
                  }
                  else
                  {
                    uint64_t v18 = -v12;
                  }
                  uint64_t v19 = *(unsigned __int16 *)((char *)this + v18 + 12);
                  if (v19) {
                    uint64_t v16 = (_DWORD *)((char *)this + v19 + *(unsigned int *)((char *)this + v19));
                  }
                  else {
LABEL_31:
                  }
                    uint64_t v16 = 0;
LABEL_32:
                  BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RepeatedSpan>(a2, v16);
                  if (result)
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5F3E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F3F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F4100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence::Verify(siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 < 5u
        || (uint64_t v6 = v5[2]) == 0
        || (BOOL result = siri::speech::schema_fb::Span::Verify((siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence *)((char *)this+ v6+ *(unsigned int *)((char *)this + v6)), a2)))
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v7 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v7 >= 7u && (uint64_t v8 = v7[3]) != 0) {
            unsigned int v9 = (const unsigned __int8 *)this + v8 + *(unsigned int *)((char *)this + v8);
          }
          else {
            unsigned int v9 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v9);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              uint64_t v10 = (unsigned __int16 *)((char *)this - *(int *)this);
              if (*v10 < 9u
                || (uint64_t v11 = v10[4]) == 0
                || (BOOL result = siri::speech::schema_fb::Span::Verify((siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence *)((char *)this + v11 + *(unsigned int *)((char *)this + v11)), a2)))
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
                if (result)
                {
                  uint64_t v12 = 0;
                  uint64_t v13 = *(int *)this;
                  if (*(unsigned __int16 *)((char *)this - v13) >= 0xBu)
                  {
                    if (!*(_WORD *)((char *)this - v13 + 10)) {
                      goto LABEL_21;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v13 + 10)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v13 + 10)), 4uLL, 0);
                    if (!result) {
                      return result;
                    }
                    uint64_t v12 = 0;
                    uint64_t v13 = *(int *)this;
                    if (*(unsigned __int16 *)((char *)this - v13) >= 0xBu)
                    {
LABEL_21:
                      uint64_t v14 = *(unsigned __int16 *)((char *)this - v13 + 10);
                      if (v14) {
                        uint64_t v12 = (_DWORD *)((char *)this + v14 + *(unsigned int *)((char *)this + v14));
                      }
                      else {
                        uint64_t v12 = 0;
                      }
                    }
                  }
                  BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>(a2, v12);
                  if (result)
                  {
                    --*((_DWORD *)a2 + 4);
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase::Verify((siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5F4490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F4878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::BatchTranslationResponse::Verify(siri::speech::schema_fb::BatchTranslationResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        unsigned int v9 = *v8;
        if (v9 < 7
          || !v8[3]
          || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
          && v10 - 4 >= (unint64_t)this + v8[3] - *(void *)a2)
        {
          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
          if (result)
          {
            uint64_t v11 = v9 >= 9 && v8[4]
                ? (const unsigned __int8 *)this + v8[4] + *(unsigned int *)((char *)this + v8[4])
                : 0;
            BOOL result = flatbuffers::Verifier::VerifyString(a2, v11);
            if (result)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                uint64_t v12 = (unsigned __int16 *)((char *)this - *(int *)this);
                if (*v12 >= 0xBu && (uint64_t v13 = v12[5]) != 0) {
                  uint64_t v14 = (const unsigned __int8 *)this + v13 + *(unsigned int *)((char *)this + v13);
                }
                else {
                  uint64_t v14 = 0;
                }
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    unint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 >= 0xDu && (uint64_t v16 = v15[6]) != 0) {
                      uint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                    }
                    else {
                      uint64_t v17 = 0;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                    if (result)
                    {
                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                      if (result)
                      {
                        uint64_t v18 = 0;
                        uint64_t v19 = *(int *)this;
                        if (*(unsigned __int16 *)((char *)this - v19) >= 0xFu)
                        {
                          if (!*(_WORD *)((char *)this - v19 + 14)) {
                            goto LABEL_35;
                          }
                          BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v19 + 14)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v19 + 14)), 4uLL, 0);
                          if (!result) {
                            return result;
                          }
                          uint64_t v18 = 0;
                          uint64_t v19 = *(int *)this;
                          if (*(unsigned __int16 *)((char *)this - v19) >= 0xFu)
                          {
LABEL_35:
                            uint64_t v20 = *(unsigned __int16 *)((char *)this - v19 + 14);
                            if (v20) {
                              uint64_t v18 = (_DWORD *)((char *)this + v20 + *(unsigned int *)((char *)this + v20));
                            }
                            else {
                              uint64_t v18 = 0;
                            }
                          }
                        }
                        BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RepeatedSpan>(a2, v18);
                        if (result)
                        {
                          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                          if (result)
                          {
                            uint64_t v21 = 0;
                            uint64_t v22 = *(int *)this;
                            if (*(unsigned __int16 *)((char *)this - v22) >= 0x11u)
                            {
                              if (!*(_WORD *)((char *)this - v22 + 16)) {
                                goto LABEL_44;
                              }
                              BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v22 + 16)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v22 + 16)), 4uLL, 0);
                              if (!result) {
                                return result;
                              }
                              uint64_t v21 = 0;
                              uint64_t v22 = *(int *)this;
                              if (*(unsigned __int16 *)((char *)this - v22) >= 0x11u)
                              {
LABEL_44:
                                uint64_t v23 = *(unsigned __int16 *)((char *)this - v22 + 16);
                                if (v23) {
                                  uint64_t v21 = (_DWORD *)((char *)this + v23 + *(unsigned int *)((char *)this + v23));
                                }
                                else {
                                  uint64_t v21 = 0;
                                }
                              }
                            }
                            BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>(a2, v21);
                            if (result)
                            {
                              --*((_DWORD *)a2 + 4);
                              return 1;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence::Verify((siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

void sub_22B5F4D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F5148(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5F5304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F5734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F58C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F5A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F5D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F5E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F62A0(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

void sub_22B5F6418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F6584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F6718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F69C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F6CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::TranslationSupportedLanguagesResponse::Verify(siri::speech::schema_fb::TranslationSupportedLanguagesResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        unsigned int v9 = *v8;
        if (v9 < 7
          || !v8[3]
          || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
          && v10 - 4 >= (unint64_t)this + v8[3] - *(void *)a2)
        {
          BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
          if (result)
          {
            uint64_t v11 = v9 >= 9 && v8[4]
                ? (const unsigned __int8 *)this + v8[4] + *(unsigned int *)((char *)this + v8[4])
                : 0;
            BOOL result = flatbuffers::Verifier::VerifyString(a2, v11);
            if (result)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                uint64_t v12 = 0;
                uint64_t v13 = *(int *)this;
                if (*(unsigned __int16 *)((char *)this - v13) >= 0xBu)
                {
                  if (!*(_WORD *)((char *)this - v13 + 10)) {
                    goto LABEL_23;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v13 + 10)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v13 + 10)), 4uLL, 0);
                  if (!result) {
                    return result;
                  }
                  uint64_t v12 = 0;
                  uint64_t v13 = *(int *)this;
                  if (*(unsigned __int16 *)((char *)this - v13) >= 0xBu)
                  {
LABEL_23:
                    uint64_t v14 = *(unsigned __int16 *)((char *)this - v13 + 10);
                    if (v14) {
                      uint64_t v12 = (_DWORD *)((char *)this + v14 + *(unsigned int *)((char *)this + v14));
                    }
                    else {
                      uint64_t v12 = 0;
                    }
                  }
                }
                BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::CorrectionsAlignment>(a2, v12);
                if (result)
                {
                  --*((_DWORD *)a2 + 4);
                  return 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5F7014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F73EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5F75B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F7860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::StartLanguageDetectionRequest::Verify(siri::speech::schema_fb::StartLanguageDetectionRequest *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
            if (result)
            {
              uint64_t v11 = 0;
              uint64_t v12 = *(int *)this;
              if (*(unsigned __int16 *)((char *)this - v12) >= 9u)
              {
                if (!*(_WORD *)((char *)this - v12 + 8)) {
                  goto LABEL_19;
                }
                BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v12 + 8)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v12 + 8)), 4uLL, 0);
                if (!result) {
                  return result;
                }
                uint64_t v11 = 0;
                uint64_t v12 = *(int *)this;
                if (*(unsigned __int16 *)((char *)this - v12) >= 9u)
                {
LABEL_19:
                  uint64_t v13 = *(unsigned __int16 *)((char *)this - v12 + 8);
                  if (v13) {
                    uint64_t v11 = (_DWORD *)((char *)this + v13 + *(unsigned int *)((char *)this + v13));
                  }
                  else {
                    uint64_t v11 = 0;
                  }
                }
              }
              BOOL result = flatbuffers::Verifier::VerifyVectorOfStrings(a2, v11);
              if (result)
              {
                uint64_t v14 = (unsigned __int16 *)((char *)this - *(int *)this);
                if (*v14 < 0xBu
                  || (uint64_t v15 = v14[5]) == 0
                  || (BOOL result = 0, v16 = *((void *)a2 + 1), v16 >= 5)
                  && v16 - 4 >= (unint64_t)this + v15 - *(void *)a2)
                {
                  --*((_DWORD *)a2 + 4);
                  return 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5F7BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F8020(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B5F81B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F85A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL siri::speech::schema_fb::LanguageDetectionResponse::Verify(siri::speech::schema_fb::LanguageDetectionResponse *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || !v11[4]
              || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 5)
              && v13 - 4 >= (unint64_t)this + v11[4] - *(void *)a2)
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
              if (result)
              {
                uint64_t v14 = v12 >= 0xB && v11[5]
                    ? (const unsigned __int8 *)this + v11[5] + *(unsigned int *)((char *)this + v11[5])
                    : 0;
                BOOL result = flatbuffers::Verifier::VerifyString(a2, v14);
                if (result)
                {
                  BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
                  if (result)
                  {
                    uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v15 >= 0xDu && (uint64_t v16 = v15[6]) != 0) {
                      uint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                    }
                    else {
                      uint64_t v17 = 0;
                    }
                    BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                    if (result)
                    {
                      BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                      if (result)
                      {
                        uint64_t v18 = 0;
                        uint64_t v19 = *(int *)this;
                        if (*(unsigned __int16 *)((char *)this - v19) >= 0xFu)
                        {
                          if (!*(_WORD *)((char *)this - v19 + 14)) {
                            goto LABEL_35;
                          }
                          BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v19 + 14)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v19 + 14)), 4uLL, 0);
                          if (!result) {
                            return result;
                          }
                          uint64_t v18 = 0;
                          uint64_t v19 = *(int *)this;
                          if (*(unsigned __int16 *)((char *)this - v19) >= 0xFu)
                          {
LABEL_35:
                            uint64_t v20 = *(unsigned __int16 *)((char *)this - v19 + 14);
                            if (v20) {
                              uint64_t v18 = (_DWORD *)((char *)this + v20 + *(unsigned int *)((char *)this + v20));
                            }
                            else {
                              uint64_t v18 = 0;
                            }
                          }
                        }
                        BOOL result = flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::LanguageDetectionPrediction>(a2, v18);
                        if (result)
                        {
                          --*((_DWORD *)a2 + 4);
                          return 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_22B5F8990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F8C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

flatbuffers::FlatBufferBuilder *flatbuffers::FlatBufferBuilder::AddOffset<void>(flatbuffers::FlatBufferBuilder *result, unsigned int a2)
{
  if (a2)
  {
    unint64_t v2 = (unint64_t)result;
    int v3 = flatbuffers::FlatBufferBuilder::ReferTo(result, a2);
    return (flatbuffers::FlatBufferBuilder *)flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v2, 6, v3);
  }
  return result;
}

void sub_22B5F8D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F8E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F8F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F8FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F92C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F9468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F95C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F96B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F9928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F9AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5F9C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F9D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5F9F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FA108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5FA2C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FA3AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FA494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FA728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FA8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5FAD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FAEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FAF94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FB07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FB164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FB24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FB334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FB41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FB504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FB5EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FB6D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FB7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FBB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FBCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5FC214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FC328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FC410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FC4F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FC5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FC6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FC7B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FC898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FC980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FCA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FCB50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FCC38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FCD20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FD0C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FD284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5FD710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FD81C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FD904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FD9EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FDAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FDBBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FDCA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FDD8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FDE74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FDF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FE044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FE38C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FE548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5FE978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FEA80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FEB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FEC50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FED38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FEE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FEF08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FEFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FF0D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FF1C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FF518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FF6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B5FFAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FFBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FFC94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FFD7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FFE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B5FFF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B600034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60011C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B600204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B600524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6006D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B600A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B600B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B600BF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B600CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B600DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B600EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B600F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6012A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B601450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B601828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60192C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B601A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B601AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B601BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B601CCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B601DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B601E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B601F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6022A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B602458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B602994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B602AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B602B90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B602C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B602D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B602E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B602F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B603018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B603100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6031E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6032D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6033B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6034A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B603840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B603A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B603C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B603D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B603E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B603F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B604020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6042F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B604494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B6046AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60479C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B604884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60496C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B604C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B604DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B604F28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B605010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B605288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B605418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B605630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B605720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B605808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6058F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B605BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B605D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B605EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B605F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60620C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60639C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B6064FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6065E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60685C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6069EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B606B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B606C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B606EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60703C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B6072AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6073A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B607488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B607570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B607658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B607938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B607ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B607CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B607DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B607ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B607FB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B608270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B608410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x230F4BA00](v7, 0x1030C40E9F947FBLL);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_22B608570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B608658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6088D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B608D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B608DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B608E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B608EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B608F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B608FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60904C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60910C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B609194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B609214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B609288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6093F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B609484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6094DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6095B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60962C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B609684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B609758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6097D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60982C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60990C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60998C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6099F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B609A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B609BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B609CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B609E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B609F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B609FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60A05C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60A0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60A120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60A194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60A214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60A280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60A2F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60A374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60A3E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60A460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60A4D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60A554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60A5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60A640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60A6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60A740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60A7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60A840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60A8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60A934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60A9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60AA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60AAA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60AB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60ABA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60AC20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60AC94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60AD14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60AD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60ADE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60AE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60AEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60AF48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60AFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60B01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60B0FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B17C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60B260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60B340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B3C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60B494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60B568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60B63C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60B710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B7F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60B8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60B940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60B9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60BA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60BAA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60BB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60BB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60BC14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60BC98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60BCF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60BD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60BDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60BE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60BEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60BF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60BFB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60C038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60C0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C10C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60C178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C1F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60C3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60C4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60C604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C76C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60C7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60C8CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60C94C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60C9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60CA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60CAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60CB20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60CB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60CBF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60CC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60CCC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60CD34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60CDB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60CE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60CE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60CF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60CF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60CFFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60D07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60D0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D1E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60D33C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D3CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60D4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D4F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60D574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D5CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60D638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D7C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60D89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D8F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60D970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60D9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60DA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60DA9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60DB18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60DB70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60DBEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60DC44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60DCC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60DD18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60DD94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60DDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60DE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60DEE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60DF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60DFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60E090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E0E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60E164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E1BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60E228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E2A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E3A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60E50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60E5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60E6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60E898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60E918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60E984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60EA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60EA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60EAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60EB64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60EBE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60EC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60ECD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60ED58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60EDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60EE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60EEB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60EF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60EFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60F118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60F184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60F3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60F464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F6D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60F758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60F7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60F82C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60F88C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60F90C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60F9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60FA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60FAB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60FB34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60FBA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60FC20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60FCB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60FD18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60FD94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60FDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60FE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60FECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B60FF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B60FFB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61001C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B610090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B610110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61017C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6101FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61028C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6102E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B610350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6103D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B610444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6104C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B610530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6105C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B610618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6106C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61074C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6107CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B610840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6108C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61092C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6109A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B610A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B610A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B610B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B610B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B610C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B610C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B610CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B610D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B610DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B610E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B610EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B610F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B610FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B611034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6110B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B611108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B611174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6111F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B611284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6112DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B611348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6113C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61143C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6114BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B611538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B611590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6115FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61167C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6116FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61177C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6117F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B611870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6118DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61195C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6119DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B611A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B611AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B611B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B611BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B611C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B611CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B611D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B611DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B611E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B611ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B611F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B611FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6120C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6121D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61222C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B612298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61238C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61240C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B612478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6124F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6125F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61266C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6126EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B612758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6127D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6128E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6129AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612AA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B612B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B612B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B612E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B612E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B612F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B612FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B613024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61307C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6130E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6131D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61323C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6132BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6133B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61341C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61349C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61351C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61359C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B613690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6136FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61377C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61380C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6138D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6139D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B613AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B613B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B613E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B613E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B613FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B614064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6140E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6141D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B614258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6142D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61432C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B614398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61458C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61460C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B614678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6146EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61476C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6147D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6148CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61494C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6149B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614AA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B614B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B614D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B614D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B614E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B614EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B614F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B614FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6150A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B615124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B615190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B615404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B615470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6154E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B615564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6155D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6156D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6157C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B615844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6158B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6159B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B615C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B615DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B615ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B615F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B615FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61602C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6161FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6162D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6164E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6165D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6166C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6167B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6168B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6169B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B616EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B616FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6170E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61713C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6171B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61727C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6172FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61737C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6173FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61747C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6174FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61757C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6175FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61767C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6176FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61777C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6177F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B617870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6178EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6179B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B617B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B617BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B617F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B617FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B618048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6180A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61810C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61818C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61820C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61828C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61830C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61839C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6183F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B618460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6184E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B618554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6185D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B618650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6186A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B618714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6187AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61880C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B618878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6188EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61896C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6189E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B618A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B618AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B618B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B618BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B618C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B618CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B618D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B618D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B618E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B618E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B618EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B618F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B618FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61910C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61918C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6192DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6193A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6194F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6195E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6196E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61973C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6197C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6198A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6199E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619B38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B619F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B619F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61A000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A0E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61A148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61A1C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61A234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A3CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A42C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61A4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61A56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A5FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61A6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61A7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61A98C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61A9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61AA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61AAEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61AB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61ABE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61AC40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61ACBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61AD14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61AD74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61ADF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61AE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61AEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61AF28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61AFA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61B014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B18C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61B210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61B2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B3DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B4DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B5D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61B650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61B6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61B884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61B904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61B980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61B9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61BA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61BABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61BB28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61BB9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61BC1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61BC88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61BD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61BD88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61BDFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61BE7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61BF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61BF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61BFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C04C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C0DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61C194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61C214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61C298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C2F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61C364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C3D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61C458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61C4D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C52C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61C598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C80C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61C88C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61C8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61C9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61CA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61CAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61CB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61CBCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61CC4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61CCC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61CD40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61CDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61CE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61CEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61CF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61CF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61D104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D15C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61D1D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61D2AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61D364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61D3E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61D450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61D7C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61D830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61D924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61D9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61DA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61DA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61DB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61DB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61DBE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61DC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61DCE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61DD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61DDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61DE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61DEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61DF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61DF80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61DFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61E0D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61E1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E1FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61E25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61E2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61E348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E3C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E63C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61E6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61E728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E7A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E81C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61E89C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61E908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61E9FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61EA7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61EAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61EB50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61EBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61EC4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61ECA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61ED04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61ED84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61EDF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61EE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61EEE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61EF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61EFD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61F050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61F0C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61F224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F2A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61F384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61F4E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61F644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F6C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61F7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61F878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61F8EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61F9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61FA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61FACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61FB4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61FBB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61FC2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61FCAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B61FD18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61FD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61FE18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61FE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61FF18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B61FF8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62000C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6200E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62015C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6201B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6203C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B620458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6204B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6205FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B620670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6206F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62076C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6207C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6208B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B620940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B620998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6209F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B620B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B620BCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B620CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B620D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B620E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B620F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B620FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6210DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62113C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6211C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6212A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B621388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6213E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62146C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6214CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62152C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6215AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B621618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B621B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621CD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B621D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B621E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B621F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6221F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6222E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62236C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6223CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6224B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6226FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62275C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6227E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6228A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62298C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B622F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B622FA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B623020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6230F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62314C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6231C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6232A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B623364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6233E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B623468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6234C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B623544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62359C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B623618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6236EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6237B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6238A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B623910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B623E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B623F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B623FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B624054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6240D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6241C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B624234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6242B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6243B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6244B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6245B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6246C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62471C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B624788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6248F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62496C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6249C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B624A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B624DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B624E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B624F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B624F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B625008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6250D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6251D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6252BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B625328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6253A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6254FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62557C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6255F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B625670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6256DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62575C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62581C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6258A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62598C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6259F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B625BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625CC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B625D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B625DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B625F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B625F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6260D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6261C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6262B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6263C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62641C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6265F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62666C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6266C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6267A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6269D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B626F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B626FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6270D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62714C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6271CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6272AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62732C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6273D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B627460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6274F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B627548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6275A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6276AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62770C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6277F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6278D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6279B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B627A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B627B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B627CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B627D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B627DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B627E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B627EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B627FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6280D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62819C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62821C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B628310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62837C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62840C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6284E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6285A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B628628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B628688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B628708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B628774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6287F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6288E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B628968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6289D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B628BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B628C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B628D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B628EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B628F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B628FA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B629024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B629090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B629204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B629280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6292D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B629354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6293AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B629418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6294A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62956C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6295EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62966C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6296EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62976C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6297EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6298E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62994C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6299CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B629DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B629E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B629F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B629F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B629FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A1BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62A228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A2A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A31C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62A39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62A408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62A6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62A850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62A8CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62A924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62A990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62AA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62AA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62AB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62AB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62ABE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62AC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62ACD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62AD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62ADD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62AE2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62AE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62AF18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62AFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62B070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62B0F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62B15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B25C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62B3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62B43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62B6B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62B71C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B79C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B91C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62B99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62BA1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62BA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62BB10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62BB90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62BBFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62BC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62BCF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62BD70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62BDEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62BE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62BEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62BF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62BFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C0A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62C108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62C1E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C2D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62C354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62C3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62C448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C4C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62C5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62C628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C6A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62C77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62C860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62C944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62C9B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62CA24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62CAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62CB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62CB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62CC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62CC84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62CCF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62CD80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62CDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62CE38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62CEB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62CF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62CF8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62CFF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D1F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D2F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D3EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62D46C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62D4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D5D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D64C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62D6CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62D738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D7B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D8B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62D9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62DA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62DAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62DB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62DBB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62DC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62DCAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62DD2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62DDA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62DE00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62DE7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62DED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62DF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62DFA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62E014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62E108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62E174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62E4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E53C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62E5BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62E628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62E77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E7FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62E8F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62E954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62E9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62EA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62EAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62EB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62EBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62EC34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62ECB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62ED30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62ED88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62EDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62EE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62EEF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62EF68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62EFE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62F054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62F1C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62F234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62F408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F47C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62F4FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62F568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F5E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F65C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62F6DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62F758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F7B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62F81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F91C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62F990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62FA10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62FA7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62FAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62FB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62FC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62FC64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62FCD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62FD50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62FDC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62FE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B62FEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62FF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B62FFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B630030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6300A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B630124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6301A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B630294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B630380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63046C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B630550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6305A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B630608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B630688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B63070C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6307F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B630848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6308A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B630928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6309AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B630A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B630AE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B630B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B630BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B630C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B630D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B630E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B630E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B630ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B630F54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B630FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6310C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6311B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63129C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B631388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B631474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B631560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63164C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B631738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B631824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B631910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6319F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B631A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B631AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B631B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B631BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B631C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B631D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B631E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B631F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63204C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6323FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6324E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6325D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6326B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B632770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6327F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B632874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B632FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6330C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6331A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6331FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B63325C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6332DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B633360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63344C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B633538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B633624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B633710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6337FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6338E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6339D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B633AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B633BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B633BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B633C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B633CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B633D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B633E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B633F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B634024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B634110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6341FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6342E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6343D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6344B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B634510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B634570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6345F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B634674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B634760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63484C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B634938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B634A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B634B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B634BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B634C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B634CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B634D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B634DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B634E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B634F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63524C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6355C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B635640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6356C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6357B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63589C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B635FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6360E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6361CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B636224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B636284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B636304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B636388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B636474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B636560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63664C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B636730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B636788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6367E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B636868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6368EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6369D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B636AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B636BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B636C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B636C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B636CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B636D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B636E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B636EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B636F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B636F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B637004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6370F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6371DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6372C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B637318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B637378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6373F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B63747C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B637560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6375B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B637618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B637698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B63771C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B637800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B637858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6378B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B637938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6379BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B637AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B637AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B637B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B637BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B637C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B637D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B637E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B637F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B638004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63805C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6380BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B63813C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6381C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6382AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B638398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63847C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B6384D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B638534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6385B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B638638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63871C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B638774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6387D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B638854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B6398E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SFSSGetLogObject()
{
  if (SFSSGetLogObject_onceToken != -1) {
    dispatch_once(&SFSSGetLogObject_onceToken, &__block_literal_global_1635);
  }
  v0 = (void *)SFSSGetLogObject___log_default;
  return v0;
}

uint64_t __SFSSGetLogObject_block_invoke()
{
  SFSSGetLogObject___log_default = (uint64_t)os_log_create("com.apple.speech.speechsynthesis.logging", "default");
  return MEMORY[0x270F9A758]();
}

uint64_t AudioConverterFillComplexBuffer_Callback(uint64_t a1, _DWORD *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a5;
  unint64_t v9 = [v8 index];
  unint64_t v10 = [v8 audioChunks];
  unint64_t v11 = [v10 count];

  if (v9 >= v11)
  {
    *a2 = 0;
    *(void *)(a3 + 16) = 0;
    *(_DWORD *)(a3 + 12) = 0;
    if (a4) {
      *a4 = &v18;
    }
  }
  else
  {
    unsigned int v12 = [v8 audioChunks];
    unint64_t v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "index"));

    id v14 = [v13 packetDescriptions];
    *a4 = [v14 bytes];

    *a2 = [v13 packetCount];
    id v15 = [v13 audioData];
    *(void *)(a3 + 16) = [v15 bytes];

    uint64_t v16 = [v13 audioData];
    *(_DWORD *)(a3 + 12) = [v16 length];

    objc_msgSend(v8, "setIndex:", objc_msgSend(v8, "index") + 1);
  }

  return 0;
}

void sub_22B63B15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63B1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B63B31C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

TTSSynthesizer *std::unique_ptr<TTSSynthesizer>::reset[abi:ne180100](TTSSynthesizer **a1, TTSSynthesizer *a2)
{
  BOOL result = *a1;
  *a1 = a2;
  if (result)
  {
    TTSSynthesizer::~TTSSynthesizer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

void sub_22B63B528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B63B8E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100]((void *)(v19 - 120));
  _Unwind_Resume(a1);
}

void sub_22B63B998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
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
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100](void *a1)
{
  unint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void *std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::target_type()
{
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::target(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000022B64D2A0
    || ((v3 & 0x800000022B64D2A0 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000022B64D2A0)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000022B64D2A0 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::destroy(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  return MEMORY[0x270F9A758]();
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26DEBF918;
  uint64_t result = MEMORY[0x230F4BDC0](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::__clone()
{
  return 0;
}

void std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::~__func(uint64_t a1)
{
  JUMPOUT(0x230F4BA00);
}

uint64_t std::__function::__func<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage),std::allocator<int({block_pointer} {__strong})(TTSSynthesizer::CallbackMessage)>,int ()(TTSSynthesizer::CallbackMessage)>::~__func(uint64_t a1)
{
  return a1;
}

void sub_22B63BF14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B63C0BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  _Unwind_Resume(a1);
}

void sub_22B63C39C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11, long long a12, long long a13, long long a14, long long a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,char a30)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (*(char *)(v34 - 121) < 0) {
    operator delete(*(void **)(v34 - 144));
  }
  if (a2 == 1)
  {
    uint64_t v37 = __cxa_begin_catch(a1);
    uint64_t v38 = SFSSGetLogObject();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v47 = (*(uint64_t (**)(void *))(*(void *)v37 + 16))(v37);
      *(_DWORD *)(v34 - 144) = 136315138;
      *(void *)(v33 + 4) = v47;
      _os_log_error_impl(&dword_22B575000, v38, OS_LOG_TYPE_ERROR, "Exception: %s\n", (uint8_t *)(v34 - 144), 0xCu);
    }

    v39 = SFSSGetLogObject();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)(v34 - 144) = 138412546;
      *(void *)(v33 + 4) = v30;
      *(_WORD *)(v34 - 132) = 2112;
      *(void *)(v33 + 14) = v32;
      _os_log_error_impl(&dword_22B575000, v39, OS_LOG_TYPE_ERROR, "voice path '%@', resource path '%@'\n", (uint8_t *)(v34 - 144), 0x16u);
    }

    uint64_t v50 = [MEMORY[0x263F08850] defaultManager];
    v49 = [v50 contentsOfDirectoryAtPath:v30 error:0];
    uint64_t v40 = SFSSGetLogObject();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      int v48 = [v49 count];
      *(_DWORD *)(v34 - 144) = 67109120;
      *(_DWORD *)(v34 - 140) = v48;
      _os_log_error_impl(&dword_22B575000, v40, OS_LOG_TYPE_ERROR, "%d files under voice path", (uint8_t *)(v34 - 144), 8u);
    }

    a14 = 0u;
    a15 = 0u;
    a12 = 0u;
    a13 = 0u;
    id v41 = v49;
    uint64_t v42 = [v41 countByEnumeratingWithState:&a12 objects:&a30 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)a13;
      do
      {
        uint64_t v44 = 0;
        do
        {
          if (*(void *)a13 != v43) {
            objc_enumerationMutation(v41);
          }
          uint64_t v45 = *(void *)(*((void *)&a12 + 1) + 8 * v44);
          uint64_t v46 = SFSSGetLogObject();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)(v34 - 144) = 138412290;
            *(void *)(v33 + 4) = v45;
            _os_log_error_impl(&dword_22B575000, v46, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)(v34 - 144), 0xCu);
          }

          ++v44;
        }
        while (v42 != v44);
        uint64_t v42 = [v41 countByEnumeratingWithState:&a12 objects:&a30 count:16];
      }
      while (v42);
    }

    __cxa_end_catch();
    JUMPOUT(0x22B63C27CLL);
  }

  _Unwind_Resume(a1);
}

void sub_22B63C77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22B63C840(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x270EE2090](inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return MEMORY[0x270EE2098](inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x270EE20B8](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioConverterReset(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x270EE20C0](inAudioConverter);
}

OSStatus AudioQueueAddPropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x270EE2168](inAQ, *(void *)&inID, inProc, inUserData);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x270EE2170](inAQ, *(void *)&inBufferByteSize, outBuffer);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return MEMORY[0x270EE2180](inAQ, inBuffer, *(void *)&inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueFlush(AudioQueueRef inAQ)
{
  return MEMORY[0x270EE2190](inAQ);
}

OSStatus AudioQueueFreeBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer)
{
  return MEMORY[0x270EE2198](inAQ, inBuffer);
}

OSStatus AudioQueueGetCurrentTime(AudioQueueRef inAQ, AudioQueueTimelineRef inTimeline, AudioTimeStamp *outTimeStamp, Boolean *outTimelineDiscontinuity)
{
  return MEMORY[0x270EE21A0](inAQ, inTimeline, outTimeStamp, outTimelineDiscontinuity);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x270EE21A8](inAQ, *(void *)&inID, outData, ioDataSize);
}

uint64_t AudioQueueNewOutputWithAudioSession()
{
  return MEMORY[0x270EE21B8]();
}

OSStatus AudioQueuePause(AudioQueueRef inAQ)
{
  return MEMORY[0x270EE21C0](inAQ);
}

OSStatus AudioQueueRemovePropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x270EE21C8](inAQ, *(void *)&inID, inProc, inUserData);
}

OSStatus AudioQueueReset(AudioQueueRef inAQ)
{
  return MEMORY[0x270EE21D0](inAQ);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x270EE21E0](inAQ, *(void *)&inID, inData, *(void *)&inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return MEMORY[0x270EE21E8](inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x270EE21F0](inAQ, inImmediate);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t TTSSynthesizer::initialize()
{
  return MEMORY[0x270F71E88]();
}

uint64_t TTSSynthesizer::load_resource()
{
  return MEMORY[0x270F71E98]();
}

uint64_t TTSSynthesizer::stop_synthesis(TTSSynthesizer *this)
{
  return MEMORY[0x270F71EA8](this);
}

uint64_t TTSSynthesizer::get_voice_description(TTSSynthesizer *this)
{
  return MEMORY[0x270F71F00](this);
}

uint64_t TTSSynthesizer::synthesize_text_with_markers_async()
{
  return MEMORY[0x270F71F20]();
}

uint64_t TTSSynthesizer::preheat(TTSSynthesizer *this)
{
  return MEMORY[0x270F71F28](this);
}

void TTSSynthesizer::TTSSynthesizer(TTSSynthesizer *this)
{
}

void TTSSynthesizer::~TTSSynthesizer(TTSSynthesizer *this)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}