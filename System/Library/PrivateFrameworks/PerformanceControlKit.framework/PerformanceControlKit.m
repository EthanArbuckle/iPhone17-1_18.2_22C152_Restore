void sub_258FDE924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_258FDEA48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FDEF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FDF068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_258FDF3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  for (uint64_t i = 56; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

uint64_t ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFRetain(cf);
  v6[0] = &unk_270714E98;
  v6[1] = (id)cf;
  uint64_t v4 = *(void *)(a1 + 56);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, id *))(*(void *)v4 + 48))(v4, v6);
  clpc::user::ioreport::Sample::~Sample(v6);
  return 0;
}

void sub_258FDF514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void sub_258FDFC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  clpc::user::ioreport::Sample::~Sample(&a9);
  _Unwind_Resume(a1);
}

void sub_258FDFDCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void clpc::user::ioreport::Sample::~Sample(id *this)
{
}

{
}

{
  uint64_t vars8;

  JUMPOUT(0x25A2D5640);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::find<unsigned int>(void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *uint64_t i = *v20;
LABEL_38:
    void *v20 = i;
    goto LABEL_39;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v21 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_258FE0100(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_258FE01C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE026C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::~__value_func[abi:ne180100](void *a1)
{
  int8x8_t v2 = (void *)a1[3];
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

void std::array<CLPCReportingRows * {__strong},8ul>::fill[abi:ne180100](uint64_t a1, id *a2)
{
  for (uint64_t i = 0; i != 64; i += 8)
    objc_storeStrong((id *)(a1 + i), *a2);
}

uint64_t std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void sub_258FE050C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void clpc::user::iokit::Object::~Object(clpc::user::iokit::Object *this)
{
  *(void *)this = &unk_270714D70;
  int v1 = *((_DWORD *)this + 2);
  *((_DWORD *)this + 2) = 0;
  if (v1) {
    IOObjectRelease(0);
  }
}

{
  uint64_t vars8;

  clpc::user::iokit::Object::~Object(this);
  JUMPOUT(0x25A2D5640);
}

void clpc::user::iokit::RegistryEntry::~RegistryEntry(clpc::user::iokit::RegistryEntry *this)
{
  clpc::user::iokit::Object::~Object(this);
  JUMPOUT(0x25A2D5640);
}

void clpc::user::iokit::Service::~Service(clpc::user::iokit::Service *this)
{
  *(void *)this = &unk_270714D90;
  io_connect_t v2 = *((_DWORD *)this + 3);
  if (v2) {
    IOServiceClose(v2);
  }
  *((_DWORD *)this + 3) = 0;
  clpc::user::iokit::Object::~Object(this);
}

{
  uint64_t vars8;

  clpc::user::iokit::Service::~Service(this);
  JUMPOUT(0x25A2D5640);
}

void __clang_call_terminate(void *a1)
{
}

void clpc::user::iokit::CLPC::~CLPC(clpc::user::iokit::CLPC *this)
{
  *(void *)this = &unk_270714DB0;
  uint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    MEMORY[0x25A2D5620](v2, 0x1000C8077774924);
  }
  clpc::user::iokit::Service::~Service(this);
}

{
  uint64_t vars8;

  clpc::user::iokit::CLPC::~CLPC(this);
  JUMPOUT(0x25A2D5640);
}

void clpc::user::ioreport::Channel::~Channel(id *this)
{
}

{
}

{
  uint64_t vars8;

  JUMPOUT(0x25A2D5640);
}

void clpc::user::ioreport::Subscription::~Subscription(clpc::user::ioreport::Subscription *this)
{
  *(void *)this = &unk_270714DD0;
  uint64_t v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }
}

{
  uint64_t vars8;

  clpc::user::ioreport::Subscription::~Subscription(this);
  JUMPOUT(0x25A2D5640);
}

void clpc::user::ioreport::ChannelList::withAllChannels(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)IOReportCopyAllChannels();
  if (v2)
  {
    *(void *)a1 = v2;
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
    *(unsigned char *)a1 = 0;
  }
  *(unsigned char *)(a1 + 8) = v3;
}

void clpc::user::ioreport::ChannelList::fromCategories(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)IOReportCopyChannelsInCategories();
  if (v2)
  {
    *(void *)a1 = v2;
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
    *(unsigned char *)a1 = 0;
  }
  *(unsigned char *)(a1 + 8) = v3;
}

void clpc::user::ioreport::ChannelList::fromFormat(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)IOReportCopyChannelsOfFormat();
  if (v2)
  {
    *(void *)a1 = v2;
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
    *(unsigned char *)a1 = 0;
  }
  *(unsigned char *)(a1 + 8) = v3;
}

void clpc::user::ioreport::ChannelList::fromGroup(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = a1;
  if (*((char *)a1 + 23) < 0) {
    unint64_t v4 = (uint64_t *)*a1;
  }
  id v7 = [NSString stringWithUTF8String:v4];
  if (*((char *)a2 + 23) < 0) {
    a2 = (uint64_t *)*a2;
  }
  v6 = [NSString stringWithUTF8String:a2];
  clpc::user::ioreport::ChannelList::fromGroup(v7, v6, a3);
}

void sub_258FE0BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void clpc::user::ioreport::ChannelList::fromGroup(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = (void *)IOReportCopyChannelsInGroup();
  if (v7)
  {
    *(void *)a3 = v7;
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    *(unsigned char *)a3 = 0;
  }
  *(unsigned char *)(a3 + 8) = v8;
}

void sub_258FE0CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void clpc::user::ioreport::ChannelList::fromProvider(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)IOReportCopyChannelsForDriver();
  if (v2)
  {
    *(void *)a1 = v2;
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
    *(unsigned char *)a1 = 0;
  }
  *(unsigned char *)(a1 + 8) = v3;
}

void anonymous namespace'::populate_error_unsupported_stat(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported stat ID %llu.", a1);
    uint64_t v5 = *MEMORY[0x263F07F80];
    v6[0] = v3;
    unint64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    *a2 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:-536870206 userInfo:v4];
  }
}

void sub_258FE0EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::populate_error_unsupported_schema(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported schema ID %lu.", a1);
    uint64_t v5 = *MEMORY[0x263F07F80];
    v6[0] = v3;
    unint64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    *a2 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:-536870206 userInfo:v4];
  }
}

void sub_258FE116C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE12D0(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void sub_258FE1554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE16A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_258FE18C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE19C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_258FE1BF0(_Unwind_Exception *a1)
{
  id v6 = v3;

  _Unwind_Resume(a1);
}

void sub_258FE24B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22,char a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::~__value_func[abi:ne180100](&a35);
  if (a23) {

  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&a25);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&a39);

  _Unwind_Resume(a1);
}

id clpc::user::iokit::RegistryEntry::createProperty(clpc::user::iokit::RegistryEntry *this, const __CFString *a2)
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 2), a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  return CFProperty;
}

void anonymous namespace'::populate_error_property_read(void *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v3 = *MEMORY[0x263F07F80];
    v4[0] = @"Failed to read AppleCLPC property.";
    uint64_t v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
    *a1 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:-536870199 userInfo:v2];
  }
}

void sub_258FE26CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::populate_error_internal(void *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v3 = *MEMORY[0x263F07F80];
    v4[0] = @"An internal error occurred.";
    uint64_t v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
    *a1 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:-536870199 userInfo:v2];
  }
}

void sub_258FE27A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE28F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *clpc::user::ioreport::ChannelList::iterate(uint64_t a1, uint64_t a2)
{
  v3[4] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100]((uint64_t)v3, a2);
  IOReportIterate();
  return std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::~__value_func[abi:ne180100](v3);
}

void sub_258FE29C4(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_258FE3120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void *a8, char a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);

  if (*(unsigned char *)(v10 - 136)) {
    clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)(v10 - 160));
  }
  if (a9) {

  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)va);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)va1);

  _Unwind_Resume(a1);
}

void clpc::user::ioreport::ChannelList::subscribe(uint64_t a1@<X8>)
{
  id v8 = 0;
  uint64_t v9 = 0;
  CFAllocatorGetDefault();
  uint64_t Subscription = IOReportCreateSubscription();
  uint64_t v5 = &unk_270714DD0;
  uint64_t v6 = Subscription;
  uint64_t v7 = 0;
  if (Subscription) {
    BOOL v3 = v9 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    char v4 = 0;
    *(unsigned char *)a1 = 0;
  }
  else
  {
    *(void *)a1 = &unk_270714DD0;
    *(void *)(a1 + 8) = Subscription;
    *(void *)(a1 + 16) = 0;
    uint64_t v6 = 0;
    char v4 = 1;
  }
  *(unsigned char *)(a1 + 24) = v4;
  clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&v5);
}

void std::vector<CLPCReportingStatID>::reserve(void **a1, unint64_t a2)
{
  char v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<CLPCReportingStatID>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLPCReportingStatID>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    uint64_t v10 = (char *)*a1;
    v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_258FE3418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_258FE35D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE3704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN4clpc4user8ioreport11ChannelList7iterateENSt3__18functionIFvNS1_7ChannelEEEE_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFRetain(cf);
  v6[0] = &unk_270714E68;
  v6[1] = (id)cf;
  uint64_t v4 = *(void *)(a1 + 56);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, id *))(*(void *)v4 + 48))(v4, v6);
  clpc::user::ioreport::Channel::~Channel(v6);
  return 0;
}

void sub_258FE39EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

uint64_t __copy_helper_block_ea8_32c55_ZTSNSt3__18functionIFvN4clpc4user8ioreport7ChannelEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

void *__destroy_helper_block_ea8_32c55_ZTSNSt3__18functionIFvN4clpc4user8ioreport7ChannelEEEE(uint64_t a1)
{
  return std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::~__value_func[abi:ne180100]((void *)(a1 + 32));
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x25A2D5640);
}

uint64_t std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t ___ZN4clpc4user8ioreport11ChannelList6filterENSt3__18functionIFbNS1_7ChannelEEEE_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFRetain(cf);
  v7[0] = &unk_270714E68;
  v7[1] = (id)cf;
  uint64_t v4 = *(void *)(a1 + 56);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  if ((*(unsigned int (**)(uint64_t, id *))(*(void *)v4 + 48))(v4, v7)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 16;
  }
  clpc::user::ioreport::Channel::~Channel(v7);
  return v5;
}

void sub_258FE3BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

uint64_t __copy_helper_block_ea8_32c55_ZTSNSt3__18functionIFbN4clpc4user8ioreport7ChannelEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<BOOL ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

void *__destroy_helper_block_ea8_32c55_ZTSNSt3__18functionIFbN4clpc4user8ioreport7ChannelEEEE(uint64_t a1)
{
  return std::__function::__value_func<BOOL ()(clpc::user::ioreport::Channel)>::~__value_func[abi:ne180100]((void *)(a1 + 32));
}

uint64_t std::__function::__value_func<BOOL ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void std::vector<CLPCReportingStatID>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2654470D0, MEMORY[0x263F8C060]);
}

void sub_258FE3CF8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CLPCReportingStatID>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_258FE3F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  clpc::user::ioreport::Sample::~Sample((id *)va);
  _Unwind_Resume(a1);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t __copy_helper_block_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

void *__destroy_helper_block_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE(uint64_t a1)
{
  return std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::~__value_func[abi:ne180100]((void *)(a1 + 32));
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
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

void *std::__function::__value_func<BOOL ()(clpc::user::ioreport::Channel)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
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

void *std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__emplace_unique_key_args<CLPCReportingStatID,CLPCReportingStatID const&>(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x18uLL);
  *uint64_t i = 0;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t i = *v19;
LABEL_38:
    *uint64_t v19 = i;
    goto LABEL_39;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_258FE4368(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_unique<std::pair<unsigned int const,CLPCReportingStatID> const*>(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = a1[1];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      *(void *)(*a1 + 8 * i) = 0;
    uint64_t v8 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8) {
      BOOL v9 = a2 == a3;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      uint64_t v10 = (void *)v8;
    }
    else
    {
      do
      {
        *(_DWORD *)(v8 + 16) = *(_DWORD *)v4;
        *(void *)(v8 + 24) = *(void *)(v4 + 8);
        uint64_t v10 = *(void **)v8;
        std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique(a1, v8);
        v4 += 16;
        if (v10) {
          BOOL v11 = v4 == a3;
        }
        else {
          BOOL v11 = 1;
        }
        uint64_t v8 = (uint64_t)v10;
      }
      while (!v11);
    }
    if (v10)
    {
      do
      {
        unint64_t v12 = (void *)*v10;
        operator delete(v10);
        uint64_t v10 = v12;
      }
      while (v12);
    }
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,CLPCReportingStatID> const&>((uint64_t)a1, (unsigned int *)v4, (_OWORD *)v4);
    v4 += 16;
  }
}

void sub_258FE46A8(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    uint64_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_258FE46C8(_Unwind_Exception *a1)
{
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique(void *a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  unint64_t v5 = (_DWORD *)(a2 + 16);
  unint64_t v4 = *(unsigned int *)(a2 + 16);
  *((void *)v5 - 1) = v4;
  uint64_t v6 = std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v4, v5);
  if (v6) {
    return v6;
  }
  std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return v2;
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL) {
      uint64_t v5 = v3 <= a2 ? a2 % v3 : a2;
    }
    else {
      uint64_t v5 = (v3 - 1) & a2;
    }
    uint64_t v6 = *(uint64_t ***)(*(void *)a1 + 8 * v5);
    if (v6)
    {
      for (uint64_t i = *v6; i; uint64_t i = (uint64_t *)*i)
      {
        unint64_t v8 = i[1];
        if (v8 == a2)
        {
          if (*((_DWORD *)i + 4) == *a3) {
            return i;
          }
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3) {
              v8 %= v3;
            }
          }
          else
          {
            v8 &= v3 - 1;
          }
          if (v8 != v5) {
            break;
          }
        }
      }
    }
  }
  float v9 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v10 = *(float *)(a1 + 32);
  if (!v3 || (float)(v10 * (float)v3) < v9)
  {
    uint64_t v11 = 2 * v3;
    BOOL v12 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    size_t v13 = v12 | v11;
    unint64_t v14 = vcvtps_u32_f32(v9 / v10);
    if (v13 <= v14) {
      size_t v15 = v14;
    }
    else {
      size_t v15 = v13;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v15);
  }
  return 0;
}

void *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_unique_perform[abi:ne180100](void *result, void *a2)
{
  int8x8_t v2 = (int8x8_t)result[1];
  unint64_t v3 = a2[1];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  uint64_t v5 = *(void **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *uint64_t v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(void *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v2) {
        v6 %= *(void *)&v2;
      }
    }
    else
    {
      v6 &= *(void *)&v2 - 1;
    }
    uint64_t v5 = (void *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,CLPCReportingStatID> const&>(uint64_t a1, unsigned int *a2, _OWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    float v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      float v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          float v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  float v10 = operator new(0x20uLL);
  void *v10 = 0;
  v10[1] = v6;
  *((_OWORD *)v10 + 1) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *v10 = *v19;
LABEL_38:
    *uint64_t v19 = v10;
    goto LABEL_39;
  }
  void *v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_258FE4B10(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    float v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v11 = operator new(0x20uLL);
  void *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    void *v11 = *v20;
LABEL_38:
    void *v20 = v11;
    goto LABEL_39;
  }
  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_258FE4D38(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    float v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v11 = operator new(0x18uLL);
  void *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    void *v11 = *v20;
LABEL_38:
    void *v20 = v11;
    goto LABEL_39;
  }
  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_258FE4F5C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,CLPCReportingStatID>,void *> *>>(void *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0; i != v6; *(void *)(*a1 + 8 * i++) = 0)
    ;
  unint64_t v8 = (uint64_t *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      unint64_t v9 = *((unsigned int *)a2 + 4);
      *((_DWORD *)v8 + 4) = v9;
      v8[3] = a2[3];
      float v10 = (uint64_t *)*v8;
      v8[1] = v9;
      inserted = (void *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare((uint64_t)a1, v9, (_DWORD *)v8 + 4);
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform(a1, v8, inserted);
      a2 = (uint64_t *)*a2;
      unint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }
    do
    {
      unint64_t v12 = (uint64_t *)*v8;
      operator delete(v8);
      unint64_t v8 = v12;
    }
    while (v12);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_multi<std::pair<unsigned int const,CLPCReportingStatID> const&>(a1, (_OWORD *)a2 + 1);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_258FE5050(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    int8x8_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_258FE5070(_Unwind_Exception *a1)
{
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__rehash<false>(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  uint64_t v16 = *(void *)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    uint64_t v16 = *(void *)v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = *(void *)(v16 + 8);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = *(void *)(v16 + 8);
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }
    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }
    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && *(_DWORD *)(v16 + 16) == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__do_rehash<false>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(uint64_t ***)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = *v7; *v7; uint64_t i = *v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          uint64_t v7 = (uint64_t **)i;
        }
        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (uint64_t *)*v13;
            }
            while (v13 && *((_DWORD *)i + 4) == *((_DWORD *)v13 + 4));
            *uint64_t v7 = v13;
            *uint8x8_t v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = (uint64_t **)i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

unsigned int *std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_multi<std::pair<unsigned int const,CLPCReportingStatID> const&>(void *a1, _OWORD *a2)
{
  int8x8_t v4 = (unsigned int *)operator new(0x20uLL);
  *((_OWORD *)v4 + 1) = *a2;
  unint64_t v5 = v4[4];
  *(void *)int8x8_t v4 = 0;
  *((void *)v4 + 1) = v5;
  inserted = (void *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4 + 4);
  std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform(a1, v4, inserted);
  return v4;
}

void sub_258FE5590(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,unsigned int>,void *> *>>(void *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0; i != v6; *(void *)(*a1 + 8 * i++) = 0)
    ;
  unint64_t v8 = (uint64_t *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      unint64_t v9 = *((unsigned int *)a2 + 4);
      *((_DWORD *)v8 + 4) = v9;
      *((_DWORD *)v8 + 5) = *((_DWORD *)a2 + 5);
      BOOL v10 = (uint64_t *)*v8;
      v8[1] = v9;
      inserted = (void *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare((uint64_t)a1, v9, (_DWORD *)v8 + 4);
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform(a1, v8, inserted);
      a2 = (uint64_t *)*a2;
      unint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }
    do
    {
      unint64_t v12 = (uint64_t *)*v8;
      operator delete(v8);
      unint64_t v8 = v12;
    }
    while (v12);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_multi<std::pair<unsigned int const,unsigned int> const&>(a1, a2 + 2);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_258FE5684(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    int8x8_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_258FE56A4(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_multi<std::pair<unsigned int const,unsigned int> const&>(void *a1, uint64_t *a2)
{
  int8x8_t v4 = operator new(0x18uLL);
  uint64_t v5 = *a2;
  void v4[2] = *a2;
  *int8x8_t v4 = 0;
  v4[1] = v5;
  inserted = (void *)std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_prepare((uint64_t)a1, v5, (_DWORD *)v4 + 4);
  std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__node_insert_multi_perform(a1, v4, inserted);
  return v4;
}

void sub_258FE5720(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_258FE5874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void *std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v3 == v8)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>(uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      BOOL v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          BOOL v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  BOOL v10 = operator new(0x18uLL);
  void *v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *v10 = *v19;
LABEL_38:
    *unint64_t v19 = v10;
    goto LABEL_39;
  }
  void *v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    unint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_258FE5B94(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_258FE5CC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  clpc::user::ioreport::Channel::~Channel((id *)va);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::clear(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        int8x8_t v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void sub_258FE6340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);

  clpc::user::ioreport::Sample::~Sample((id *)va);
  _Unwind_Resume(a1);
}

void sub_258FE656C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE6684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE67CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE6994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE6AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE6CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE6E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE6FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE7114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE7264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE7430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE7580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE774C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE789C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE7A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE7BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE7D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_258FE7EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

clpc::user::iokit::CLPC *clpc::user::iokit::CLPC::CLPC(clpc::user::iokit::CLPC *this)
{
  *((_DWORD *)this + 3) = 0;
  int8x8_t v2 = (io_connect_t *)((char *)this + 12);
  *((_DWORD *)this + 2) = 0;
  *(void *)this = &unk_270714DB0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  CFDictionaryRef v3 = IOServiceMatching("AppleCLPC");
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v3);
  if (!MatchingService)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x25A2D55D0](exception, "Could not get service.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  v9[0] = &unk_270714D90;
  v9[1] = 0;
  *((_DWORD *)this + 2) = MatchingService;
  clpc::user::iokit::Service::~Service((clpc::user::iokit::Service *)v9);
  if (*((void *)this + 3) != 0x400000)
  {
    uint64_t v5 = *((void *)this + 2);
    *((void *)this + 2) = 0;
    *((void *)this + 3) = 0x400000;
    if (v5) {
      MEMORY[0x25A2D5620](v5, 0x1000C8077774924);
    }
  }
  io_service_t v6 = *((_DWORD *)this + 2);
  if (v6 && !*v2) {
    IOServiceOpen(v6, *MEMORY[0x263EF8960], 0, v2);
  }
  return this;
}

void sub_258FE8090(_Unwind_Exception *a1)
{
  uint64_t v4 = *v2;
  uint64_t *v2 = 0;
  if (v4) {
    MEMORY[0x25A2D5620](v4, 0x1000C8077774924);
  }
  clpc::user::iokit::Service::~Service(v1);
  _Unwind_Resume(a1);
}

uint64_t CCDigestCreate()
{
  return MEMORY[0x270ED7978]();
}

uint64_t CCDigestDestroy()
{
  return MEMORY[0x270ED7980]();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x270ED7988]();
}

uint64_t CCDigestReset()
{
  return MEMORY[0x270ED79A8]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x270ED79B0]();
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

uint64_t IOReportArrayGetValueAtIndex()
{
  return MEMORY[0x270F926F8]();
}

uint64_t IOReportChannelGetChannelID()
{
  return MEMORY[0x270F92710]();
}

uint64_t IOReportCopyAllChannels()
{
  return MEMORY[0x270F92748]();
}

uint64_t IOReportCopyChannelsForDriver()
{
  return MEMORY[0x270F92750]();
}

uint64_t IOReportCopyChannelsInCategories()
{
  return MEMORY[0x270F92758]();
}

uint64_t IOReportCopyChannelsInGroup()
{
  return MEMORY[0x270F92760]();
}

uint64_t IOReportCopyChannelsOfFormat()
{
  return MEMORY[0x270F92768]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x270F92780]();
}

uint64_t IOReportCreateSamplesDelta()
{
  return MEMORY[0x270F92788]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x270F92798]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x270F927A0]();
}

uint64_t IOReportHistogramGetBucketCount()
{
  return MEMORY[0x270F927B0]();
}

uint64_t IOReportHistogramGetBucketHits()
{
  return MEMORY[0x270F927B8]();
}

uint64_t IOReportHistogramGetBucketSum()
{
  return MEMORY[0x270F927C0]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x270F927D8]();
}

uint64_t IOReportPrune()
{
  return MEMORY[0x270F927E8]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x270F92800]();
}

uint64_t IOReportStateGetCount()
{
  return MEMORY[0x270F92808]();
}

uint64_t IOReportStateGetIDForIndex()
{
  return MEMORY[0x270F92818]();
}

uint64_t IOReportStateGetInTransitions()
{
  return MEMORY[0x270F92820]();
}

uint64_t IOReportStateGetResidency()
{
  return MEMORY[0x270F92830]();
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::exception::~exception(std::exception *this)
{
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

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_storeStrong(id *location, id obj)
{
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x270EDB410](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}