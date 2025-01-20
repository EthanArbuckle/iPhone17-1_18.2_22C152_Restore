uint64_t PTDConnection::get_ptd_connection(PTDConnection *this)
{
  CFDictionaryRef v2;
  io_service_t MatchingService;
  kern_return_t v4;
  mach_error_t v5;

  if (!*(_DWORD *)this)
  {
    v2 = IOServiceNameMatching("ApplePTD");
    if (v2)
    {
      MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
      *((_DWORD *)this + 1) = MatchingService;
      if (MatchingService)
      {
        v4 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)this);
        if (v4)
        {
          v5 = v4;
          getprogname();
          mach_error_string(v5);
          printf("%s: cannot open service: %s\n");
        }
      }
      else
      {
        getprogname();
        printf("%s: could not find device %s\n");
      }
    }
    else
    {
      puts("no matching service 'ApplePTD'");
    }
  }
  return *(unsigned int *)this;
}

void PTDConnection::~PTDConnection(io_connect_t *this)
{
  io_connect_t v2 = *this;
  if (v2)
  {
    IOServiceClose(v2);
    IOObjectRelease(this[1]);
    *this = 0;
  }
}

void __clang_call_terminate(void *a1)
{
}

uint64_t PTDObject::PTDLookUp(PTDConnection **a1, unsigned int a2, void *a3)
{
  if (!PTDConnection::get_ptd_connection(*a1)) {
    return 1;
  }
  size_t v8 = 12;
  mach_port_t ptd_connection = PTDConnection::get_ptd_connection(*a1);
  input[1] = 0;
  input[2] = 0;
  input[0] = a2;
  return 2 * (IOConnectCallMethod(ptd_connection, 2u, input, 3u, 0, 0, 0, 0, a3, &v8) != 0);
}

uint64_t PTDObject::PTDRead(PTDConnection **this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned __int8 *a5, int a6)
{
  if (!PTDConnection::get_ptd_connection(*this)) {
    return 1;
  }
  uint64_t v15 = 16 * a4;
  if (a6) {
    uint32_t v12 = 4;
  }
  else {
    uint32_t v12 = 3;
  }
  mach_port_t ptd_connection = PTDConnection::get_ptd_connection(*this);
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  return 2
       * (IOConnectCallMethod(ptd_connection, v12, input, 3u, 0, 0, 0, 0, a5, (size_t *)&v15) != 0);
}

int main(int argc, const char **argv, const char **envp)
{
  memset(name, 0, sizeof(name));
  *(void *)v27 = 0;
  memset(&__p, 0, sizeof(__p));
  time_t v25 = 0;
  unsigned int v24 = 0;
  memset(&v23, 0, sizeof(v23));
  verbosity = 0;
  if (parse_args(argc, (char **)argv) == -1)
  {
    int v5 = -6;
  }
  else
  {
    time(&v25);
    v3 = ctime(&v25);
    printf("Start Time: %s\n", v3);
    CFDictionaryRef v4 = IOServiceMatching("AppleARMSPMIDevice");
    if (IOServiceGetMatchingServices(kIOMainPortDefault, v4, (io_iterator_t *)&iter))
    {
      int v5 = -3;
      v6 = "\nerror: could not get available spmi services names";
LABEL_4:
      puts(v6);
    }
    else
    {
      while (1)
      {
        while (1)
        {
          io_registry_entry_t v8 = IOIteratorNext(iter);
          io_object_t v9 = v8;
          if (!v8)
          {
            putchar(10);
            IOObjectRelease(iter);
            time(&v25);
            v19 = ctime(&v25);
            printf("End Time: %s\n", v19);
            int v5 = 0;
            v6 = "Done";
            goto LABEL_4;
          }
          mach_error_t v10 = IORegistryEntryGetName(v8, name);
          if (v10)
          {
            v20 = mach_error_string(v10);
            printf("ERROR: could not get name for object %d: %s\n", v9, v20);
            IOObjectRelease(v9);
            IOObjectRelease(iter);
            int v5 = -5;
            goto LABEL_6;
          }
          if (!get_property_data(@"has-fw", &v24, v9) && v24 != 0) {
            break;
          }
          print_verbose("\n\tskipping %s\n", name);
          IOObjectRelease(v9);
        }
        printf("\n%s:", name);
        if (pmu_spmi_init(name)) {
          break;
        }
        get_ptmu_regions(@"ptmu-", @"-data", v9, (uint64_t *)&v21);
        std::vector<region>::__vdeallocate((uint64_t *)&v23);
        std::string v23 = v21;
        memset(&v21, 0, sizeof(v21));
        v28 = &v21;
        std::vector<region>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
        std::string::size_type size = v23.__r_.__value_.__l.__size_;
        for (std::string::size_type i = v23.__r_.__value_.__r.__words[0]; i != size; i += 32)
        {
          if (*(char *)(i + 23) < 0)
          {
            std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)i, *(void *)(i + 8));
          }
          else
          {
            long long v15 = *(_OWORD *)i;
            v21.__r_.__value_.__r.__words[2] = *(void *)(i + 16);
            *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v15;
          }
          *(void *)v22 = *(void *)(i + 24);
          if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            v16 = &v21;
          }
          else {
            v16 = (std::string *)v21.__r_.__value_.__r.__words[0];
          }
          printf("\n\t%s:", (const char *)v16);
          read_and_print_ptmu_region((size_t *)v22[0], v22[2]);
          if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v21.__r_.__value_.__l.__data_);
          }
        }
        std::string::assign(&__p, "general-config");
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        CFStringRef v18 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)p_p, 0x600u);
        if (!get_ptmu_region_data(v18, &v27[1], v27, v9)) {
          parse_general_config_buffer_and_read_ptd((PTDConnection *)LOWORD(v27[1]));
        }
        CFRelease(v18);
        IOObjectRelease(v9);
        putchar(10);
      }
      IOObjectRelease(v9);
      IOObjectRelease(iter);
      int v5 = -2;
    }
  }
LABEL_6:
  v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v23;
  std::vector<region>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v5;
}

void sub_100004AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  a11 = &a18;
  std::vector<region>::__destroy_vector::operator()[abi:ne180100]((void ***)&a11);
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  int v5 = this;
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
    io_registry_entry_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    int v5 = v8;
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
}

void sub_100004C4C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void std::vector<region>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  io_connect_t v2 = *a1;
  if (*v2)
  {
    std::vector<region>::__clear[abi:ne180100]((uint64_t *)v2);
    v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<region>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0) {
      operator delete(*(void **)(i - 32));
    }
  }
  a1[1] = v2;
}

void std::vector<region>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<region>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

const char *print_verbose(const char *result, ...)
{
  va_start(va, result);
  if (verbosity) {
    return (const char *)vprintf(result, va);
  }
  return result;
}

uint64_t read_and_print_ptmu_region(size_t *a1, unsigned int a2)
{
  int v3 = (int)a1;
  if (!pmu_spmi_read(a1, outputStruct, 8uLL) && a2)
  {
    LOWORD(v4) = 0;
    do
    {
      printf("\n\t\t0x%4x:  %2x %2x %2x %2x %2x %2x %2x %2x   rc=%d", (unsigned __int16)v3, outputStruct[0], outputStruct[1], outputStruct[2], outputStruct[3], outputStruct[4], outputStruct[5], outputStruct[6], outputStruct[7], 0);
      v3 += 8;
      if (pmu_spmi_read((size_t *)(unsigned __int16)v3, outputStruct, 8uLL)) {
        break;
      }
      unsigned int v4 = (unsigned __int16)(v4 + 8);
    }
    while (v4 < a2);
  }
  return putchar(10);
}

uint64_t parse_args(int a1, char **a2)
{
  uint64_t result = 0;
  int v7 = 0;
  memset(&v8, 0, sizeof(v8));
  if (a1 >= 2)
  {
    int v4 = getopt_long(a1, a2, ":hv", &v8, &v7);
    if (v4 <= 57)
    {
      if (v4 == -1) {
        return 0;
      }
      if (!v4) {
        return 0xFFFFFFFFLL;
      }
      goto LABEL_11;
    }
    if (v4 == 58)
    {
      std::string::size_type v6 = "option needs a value\n";
    }
    else
    {
      if (v4 != 104)
      {
LABEL_11:
        std::string::size_type v6 = "unsupported option\n";
        goto LABEL_12;
      }
      puts("USAGE:");
      int v5 = getprogname();
      printf("    %s [options]\n", v5);
      puts("\n[options]:");
      std::string::size_type v6 = "    -h : print this usage";
    }
LABEL_12:
    puts(v6);
    return 0xFFFFFFFFLL;
  }
  return result;
}

void get_ptmu_regions(const __CFString *a1@<X1>, const __CFString *a2@<X2>, io_registry_entry_t a3@<W0>, uint64_t *a4@<X8>)
{
  kern_return_t v7;
  size_t Count;
  const void **v9;
  const void **v10;
  const void **v11;
  int v12;
  CFStringRef *v13;
  CFDataRef *v14;
  CFStringRef v15;
  CFIndex Length;
  CFIndex v17;
  CFIndex v18;
  CFStringRef v19;
  CFIndex v20;
  CFIndex MaximumSizeForEncoding;
  char *v22;
  std::string::size_type v23;
  char v24;
  FILE *v25;
  const char *v26;
  size_t v27;
  std::string::size_type size;
  CFDataRef v29;
  unint64_t v30;
  unint64_t v31;
  long long v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  long long v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const void **v47;
  const void **v48;
  uint64_t *v49;
  void *__p;
  std::string v51;
  uint64_t v52;
  _DWORD v53[2];
  CFMutableDictionaryRef properties;
  std::string::size_type v55;
  long long v56;
  char *v57;
  uint64_t v58;
  UInt8 buffer[8];
  void v60[2];
  CFRange v61;
  CFRange v62;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  properties = 0;
  memset(v53, 0, 7);
  int v7 = IORegistryEntryCreateCFProperties(a3, &properties, kCFAllocatorDefault, 0);
  if (v7)
  {
    fprintf(__stderrp, "ERROR: IORegistryEntryCreateCFProperties failed, rc=0x%x\n", v7);
    return;
  }
  Count = CFDictionaryGetCount(properties);
  io_object_t v9 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
  mach_error_t v10 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
  if (v9 && (v11 = v10) != 0)
  {
    CFDictionaryGetKeysAndValues(properties, v9, v10);
    v49 = a4;
    v47 = v11;
    v48 = v9;
    if (Count)
    {
      std::string __p = 0;
      LOBYTE(v12) = 0;
      v46 = (uint64_t)(a4 + 2);
      v13 = (CFStringRef *)v9;
      v14 = (CFDataRef *)v11;
      while (1)
      {
        long long v15 = *v13;
        if (!CFStringHasPrefix(*v13, a1) || !CFStringHasSuffix(v15, a2)) {
          goto LABEL_37;
        }
        Length = CFStringGetLength(a1);
        v17 = CFStringGetLength(v15);
        CFStringRef v18 = CFStringGetLength(a1);
        v62.length = v17 - (v18 + CFStringGetLength(a2));
        v62.location = Length;
        v19 = CFStringCreateWithSubstring(kCFAllocatorDefault, v15, v62);
        v20 = CFStringGetLength(v19);
        MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v20, 0x8000100u);
        v22 = (char *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0xF4192173uLL);
        if (v22)
        {
          if (CFStringGetCString(v19, v22, MaximumSizeForEncoding, 0x8000100u))
          {
            std::string::basic_string[abi:ne180100]<0>(&v55, v22);
            std::string v23 = v55;
            v60[0] = v56;
            *(void *)((char *)v60 + 7) = *(void *)((char *)&v56 + 7);
            unsigned int v24 = HIBYTE(v56);
            free(v22);
            v51.__r_.__value_.__r.__words[0] = v23;
            v51.__r_.__value_.__l.__size_ = v60[0];
            *(std::string::size_type *)((char *)&v51.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v60 + 7);
            *((unsigned char *)&v51.__r_.__value_.__s + 23) = v24;
            goto LABEL_15;
          }
          time_t v25 = __stderrp;
          v26 = "ERROR: out of memory\n";
          v27 = 21;
        }
        else
        {
          time_t v25 = __stderrp;
          v26 = "ERROR: string conversion failed\n";
          v27 = 32;
        }
        fwrite(v26, v27, 1uLL, v25);
        std::string::basic_string[abi:ne180100]<0>(&v51, (char *)&unk_100007C6E);
LABEL_15:
        if ((v12 & 0x80) != 0) {
          operator delete(__p);
        }
        std::string::size_type size = v51.__r_.__value_.__l.__size_;
        std::string __p = (void *)v51.__r_.__value_.__r.__words[0];
        v53[0] = v51.__r_.__value_.__r.__words[2];
        *(_DWORD *)((char *)v53 + 3) = *(_DWORD *)((char *)&v51.__r_.__value_.__r.__words[2] + 3);
        uint32_t v12 = SHIBYTE(v51.__r_.__value_.__r.__words[2]);
        v29 = *v14;
        if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
        {
          if (v51.__r_.__value_.__l.__size_)
          {
LABEL_21:
            if (v29 && CFDataGetLength(*v14) == 8)
            {
              v61.location = 0;
              v61.length = 8;
              CFDataGetBytes(v29, v61, buffer);
              if (v12 < 0)
              {
                std::string::__init_copy_ctor_external(&v51, (const std::string::value_type *)__p, size);
              }
              else
              {
                v51.__r_.__value_.__r.__words[0] = (std::string::size_type)__p;
                v51.__r_.__value_.__l.__size_ = size;
                LODWORD(v51.__r_.__value_.__r.__words[2]) = v53[0];
                *(_DWORD *)((char *)&v51.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v53 + 3);
                *((unsigned char *)&v51.__r_.__value_.__s + 23) = v12;
              }
              v52 = *(void *)buffer;
              v30 = v49[1];
              v31 = v49[2];
              if (v30 >= v31)
              {
                v33 = (uint64_t)(v30 - *v49) >> 5;
                v34 = v33 + 1;
                if ((unint64_t)(v33 + 1) >> 59) {
                  std::vector<region>::__throw_length_error[abi:ne180100]();
                }
                v35 = v31 - *v49;
                if (v35 >> 4 > v34) {
                  v34 = v35 >> 4;
                }
                if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFE0) {
                  v36 = 0x7FFFFFFFFFFFFFFLL;
                }
                else {
                  v36 = v34;
                }
                v58 = v46;
                v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<region>>(v46, v36);
                v38 = &v37[32 * v33];
                v55 = (std::string::size_type)v37;
                *(void *)&v56 = v38;
                v57 = &v37[32 * v39];
                v40 = *(_OWORD *)&v51.__r_.__value_.__l.__data_;
                *((void *)v38 + 2) = *((void *)&v51.__r_.__value_.__l + 2);
                *(_OWORD *)v38 = v40;
                memset(&v51, 0, sizeof(v51));
                *((void *)v38 + 3) = v52;
                *((void *)&v56 + 1) = v38 + 32;
                std::vector<region>::__swap_out_circular_buffer(v49, &v55);
                v41 = v49[1];
                std::__split_buffer<region>::~__split_buffer((uint64_t)&v55);
                v42 = SHIBYTE(v51.__r_.__value_.__r.__words[2]);
                v49[1] = v41;
                if (v42 < 0) {
                  operator delete(v51.__r_.__value_.__l.__data_);
                }
              }
              else
              {
                v32 = *(_OWORD *)&v51.__r_.__value_.__l.__data_;
                *(void *)(v30 + 16) = *((void *)&v51.__r_.__value_.__l + 2);
                *(_OWORD *)v30 = v32;
                memset(&v51, 0, sizeof(v51));
                *(void *)(v30 + 24) = v52;
                v49[1] = v30 + 32;
              }
              CFRelease(v19);
            }
          }
        }
        else if (*((unsigned char *)&v51.__r_.__value_.__s + 23))
        {
          goto LABEL_21;
        }
LABEL_37:
        ++v14;
        ++v13;
        if (!--Count) {
          goto LABEL_41;
        }
      }
    }
    std::string __p = 0;
    LOBYTE(v12) = 0;
LABEL_41:
    free(v48);
    free(v47);
    CFRelease(properties);
    v43 = v49[1];
    v44 = 126 - 2 * __clz((v43 - *v49) >> 5);
    if (v43 == *v49) {
      v45 = 0;
    }
    else {
      v45 = v44;
    }
    std::__introsort<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *,false>((uint64_t *)*v49, v43, v45, 1);
    if ((v12 & 0x80) != 0) {
      operator delete(__p);
    }
  }
  else
  {
    fwrite("ERROR: malloc failed\n", 0x15uLL, 1uLL, __stderrp);
    CFRelease(properties);
  }
}

void sub_1000054D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *__p, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  if (v28 < 0) {
    operator delete(__p);
  }
  a19 = a15;
  std::vector<region>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  _Unwind_Resume(a1);
}

uint64_t get_property_data(CFStringRef key, unsigned int *a2, io_registry_entry_t entry)
{
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(entry, key, kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return 0xFFFFFFFFLL;
  }
  CFDataRef v5 = CFProperty;
  *a2 = *(_DWORD *)CFDataGetBytePtr(CFProperty);
  CFRelease(v5);
  return 0;
}

uint64_t get_ptmu_region_data(CFStringRef key, unsigned int *a2, unsigned int *a3, io_registry_entry_t entry)
{
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(entry, key, kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return 0xFFFFFFFFLL;
  }
  CFDataRef v7 = CFProperty;
  if (CFDataGetLength(CFProperty) == 8)
  {
    BytePtr = (unsigned int *)CFDataGetBytePtr(v7);
    *a2 = *BytePtr;
    *a3 = BytePtr[1];
  }
  CFRelease(v7);
  return 0;
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
    std::string::size_type v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string::size_type v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::vector<region>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<region>,std::reverse_iterator<region*>,std::reverse_iterator<region*>,std::reverse_iterator<region*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void std::vector<region>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<region>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<region>,std::reverse_iterator<region*>,std::reverse_iterator<region*>,std::reverse_iterator<region*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      long long v8 = *(_OWORD *)(a3 - 32);
      *(void *)(v7 - 16) = *(void *)(a3 - 16);
      *(_OWORD *)(v7 - 32) = v8;
      *(void *)(a3 - 24) = 0;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 32) = 0;
      *(void *)(v7 - 8) = *(void *)(a3 - 8);
      uint64_t v7 = *((void *)&v14 + 1) - 32;
      *((void *)&v14 + 1) -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<region>,std::reverse_iterator<region*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<region>,std::reverse_iterator<region*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<region>,std::reverse_iterator<region*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<region>,std::reverse_iterator<region*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 32;
  }
}

uint64_t std::__split_buffer<region>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<region>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::__introsort<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *,false>(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = a2;
  uint64_t v9 = a1;
  v150 = (uint64_t *)a2;
  v151 = (const char **)a1;
  while (1)
  {
    uint64_t v10 = v8 - (void)v9;
    uint64_t v11 = (v8 - (uint64_t)v9) >> 5;
    if (v5 || !v4)
    {
      switch(v11)
      {
        case 0:
        case 1:
          return;
        case 2:
          v150 = (uint64_t *)(v8 - 32);
          if (*(char *)(v8 - 9) >= 0) {
            v55 = (const char *)(v8 - 32);
          }
          else {
            v55 = *(const char **)(v8 - 32);
          }
          if (*((char *)v9 + 23) >= 0) {
            v56 = (const char *)v9;
          }
          else {
            v56 = (const char *)*v9;
          }
          if (strcmp(v55, v56) < 0) {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>((uint64_t **)&v151, (uint64_t *)&v150);
          }
          break;
        case 3:
          v150 = (uint64_t *)(v8 - 32);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>((uint64_t)v9, (uint64_t)(v9 + 4), v8 - 32);
          break;
        case 4:
          v150 = (uint64_t *)(v8 - 32);
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>((uint64_t)v9, (uint64_t)(v9 + 4), (uint64_t)(v9 + 8), v8 - 32);
          break;
        case 5:
          v150 = (uint64_t *)(v8 - 32);
          std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *,0>((uint64_t)v9, (uint64_t)(v9 + 4), (uint64_t)(v9 + 8), (uint64_t)(v9 + 12), v8 - 32);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v10 <= 767) {
      break;
    }
    if (!a3)
    {
      if (v9 != (uint64_t *)v8)
      {
        unint64_t v145 = v8 - (void)v9;
        v146 = (void **)v8;
        int64_t v72 = (unint64_t)(v11 - 2) >> 1;
        int64_t v73 = v72;
        do
        {
          int64_t v74 = v73;
          if (v72 >= v73)
          {
            int64_t v148 = v73;
            uint64_t v75 = (2 * v73) | 1;
            v76 = &v9[4 * v75];
            uint64_t v77 = 2 * v73 + 2;
            if (v77 < v11)
            {
              v78 = (const char *)*v76;
              if (*((char *)v76 + 23) >= 0) {
                v79 = (const char *)&v9[4 * v75];
              }
              else {
                v79 = (const char *)*v76;
              }
              v80 = (const char *)v76[4];
              if (*((char *)v76 + 55) >= 0) {
                v81 = (const char *)(v76 + 4);
              }
              else {
                v81 = (const char *)v76[4];
              }
              int v82 = strcmp(v79, v81);
              if (v82 >= 0) {
                v83 = v78;
              }
              else {
                v83 = v80;
              }
              if (v82 < 0)
              {
                v76 += 4;
                uint64_t v75 = v77;
              }
            }
            else
            {
              v83 = (const char *)*v76;
            }
            v84 = &v9[4 * v74];
            if (*((char *)v76 + 23) >= 0) {
              v85 = (const char *)v76;
            }
            else {
              v85 = v83;
            }
            if (*((char *)v84 + 23) >= 0) {
              v86 = (const char *)&v9[4 * v148];
            }
            else {
              v86 = (const char *)*v84;
            }
            if ((strcmp(v85, v86) & 0x80000000) == 0)
            {
              long long v87 = *(_OWORD *)v84;
              v154 = (const char *)v84[2];
              long long v153 = v87;
              v84[1] = 0;
              v84[2] = 0;
              uint64_t *v84 = 0;
              uint64_t v155 = v9[4 * v148 + 3];
              do
              {
                v88 = v76;
                if (*((char *)v84 + 23) < 0) {
                  operator delete((void *)*v84);
                }
                long long v89 = *(_OWORD *)v76;
                v84[2] = v76[2];
                *(_OWORD *)v84 = v89;
                *((unsigned char *)v76 + 23) = 0;
                *(unsigned char *)v76 = 0;
                v84[3] = v76[3];
                if (v72 < v75) {
                  break;
                }
                uint64_t v90 = (2 * v75) | 1;
                v76 = &v9[4 * v90];
                uint64_t v75 = 2 * v75 + 2;
                if (v75 < v11)
                {
                  int64_t v91 = v72;
                  v92 = (const char *)*v76;
                  v93 = *((char *)v76 + 23) >= 0 ? (const char *)&v9[4 * v90] : (const char *)*v76;
                  v94 = (const char *)v76[4];
                  v95 = *((char *)v76 + 55) >= 0 ? (const char *)(v76 + 4) : (const char *)v76[4];
                  int v96 = strcmp(v93, v95);
                  v97 = v96 >= 0 ? v92 : v94;
                  int64_t v72 = v91;
                  if (v96 >= 0) {
                    uint64_t v75 = v90;
                  }
                  else {
                    v76 += 4;
                  }
                }
                else
                {
                  v97 = (const char *)*v76;
                  uint64_t v75 = v90;
                }
                v98 = *((char *)v76 + 23) >= 0 ? (const char *)v76 : v97;
                v99 = SHIBYTE(v154) >= 0 ? (const char *)&v153 : (const char *)v153;
                v84 = v88;
              }
              while ((strcmp(v98, v99) & 0x80000000) == 0);
              if (*((char *)v88 + 23) < 0) {
                operator delete((void *)*v88);
              }
              long long v100 = v153;
              v88[2] = (uint64_t)v154;
              *(_OWORD *)v88 = v100;
              v88[3] = v155;
              int64_t v74 = v148;
            }
          }
          int64_t v73 = v74 - 1;
        }
        while (v74);
        v101 = v146;
        uint64_t v102 = v145 >> 5;
        do
        {
          uint64_t v103 = 0;
          v104 = v101;
          uint64_t v105 = *v9;
          *(void *)v156 = v9[1];
          *(void *)&v156[7] = *(uint64_t *)((char *)v9 + 15);
          char v149 = *((unsigned char *)v9 + 23);
          v9[1] = 0;
          v9[2] = 0;
          *uint64_t v9 = 0;
          uint64_t v147 = v9[3];
          uint64_t v106 = (uint64_t)v9;
          do
          {
            uint64_t v107 = v106 + 32 * v103 + 32;
            uint64_t v108 = 2 * v103;
            uint64_t v103 = (2 * v103) | 1;
            uint64_t v109 = v108 + 2;
            if (v108 + 2 < v102)
            {
              v110 = *(char *)(v107 + 23) >= 0 ? (const char *)v107 : *(const char **)v107;
              v111 = *(char *)(v107 + 55) >= 0 ? (const char *)(v107 + 32) : *(const char **)(v107 + 32);
              if (strcmp(v110, v111) < 0)
              {
                v107 += 32;
                uint64_t v103 = v109;
              }
            }
            if (*(char *)(v106 + 23) < 0) {
              operator delete(*(void **)v106);
            }
            long long v112 = *(_OWORD *)v107;
            *(void *)(v106 + 16) = *(void *)(v107 + 16);
            *(_OWORD *)uint64_t v106 = v112;
            *(unsigned char *)(v107 + 23) = 0;
            *(unsigned char *)uint64_t v107 = 0;
            *(void *)(v106 + 24) = *(void *)(v107 + 24);
            uint64_t v106 = v107;
          }
          while (v103 <= (uint64_t)((unint64_t)(v102 - 2) >> 1));
          v101 -= 4;
          int v113 = *(char *)(v107 + 23);
          if ((void **)v107 == v104 - 4)
          {
            if (v113 < 0) {
              operator delete(*(void **)v107);
            }
            *(void *)uint64_t v107 = v105;
            uint64_t v126 = *(void *)&v156[7];
            *(void *)(v107 + 8) = *(void *)v156;
            *(void *)(v107 + 15) = v126;
            *(unsigned char *)(v107 + 23) = v149;
            *(void *)(v107 + 24) = v147;
          }
          else
          {
            if (v113 < 0) {
              operator delete(*(void **)v107);
            }
            long long v114 = *(_OWORD *)v101;
            *(void *)(v107 + 16) = *(v104 - 2);
            *(_OWORD *)uint64_t v107 = v114;
            *((unsigned char *)v104 - 9) = 0;
            *((unsigned char *)v104 - 32) = 0;
            *(void *)(v107 + 24) = *(v104 - 1);
            if (*((char *)v104 - 9) < 0) {
              operator delete(*v101);
            }
            *(v104 - 4) = (void *)v105;
            *(v104 - 3) = *(void **)v156;
            *(void **)((char *)v104 - 17) = *(void **)&v156[7];
            *((unsigned char *)v104 - 9) = v149;
            *(v104 - 1) = (void *)v147;
            uint64_t v115 = v107 + 32 - (void)v9;
            if (v115 >= 33)
            {
              unint64_t v116 = (((unint64_t)v115 >> 5) - 2) >> 1;
              v117 = &v9[4 * v116];
              v118 = *((char *)v117 + 23) >= 0 ? (const char *)&v9[4 * v116] : (const char *)*v117;
              v119 = *(char *)(v107 + 23) >= 0 ? (const char *)v107 : *(const char **)v107;
              if (strcmp(v118, v119) < 0)
              {
                long long v120 = *(_OWORD *)v107;
                v154 = *(const char **)(v107 + 16);
                long long v153 = v120;
                *(void *)(v107 + 8) = 0;
                *(void *)(v107 + 16) = 0;
                *(void *)uint64_t v107 = 0;
                uint64_t v155 = *(void *)(v107 + 24);
                if (SHIBYTE(v154) >= 0) {
                  v121 = (const char *)&v153;
                }
                else {
                  v121 = (const char *)v153;
                }
                do
                {
                  uint64_t v122 = (uint64_t)v117;
                  if (*(char *)(v107 + 23) < 0) {
                    operator delete(*(void **)v107);
                  }
                  long long v123 = *(_OWORD *)v117;
                  *(void *)(v107 + 16) = v117[2];
                  *(_OWORD *)uint64_t v107 = v123;
                  *((unsigned char *)v117 + 23) = 0;
                  *(unsigned char *)v117 = 0;
                  *(void *)(v107 + 24) = v117[3];
                  if (!v116) {
                    break;
                  }
                  unint64_t v116 = (v116 - 1) >> 1;
                  v117 = &v9[4 * v116];
                  v124 = *((char *)v117 + 23) >= 0 ? (const char *)&v9[4 * v116] : (const char *)*v117;
                  uint64_t v107 = v122;
                }
                while (strcmp(v124, v121) < 0);
                if (*(char *)(v122 + 23) < 0) {
                  operator delete(*(void **)v122);
                }
                long long v125 = v153;
                *(void *)(v122 + 16) = v154;
                *(_OWORD *)uint64_t v122 = v125;
                *(void *)(v122 + 24) = v155;
              }
            }
          }
        }
        while (v102-- > 2);
      }
      return;
    }
    unint64_t v12 = (unint64_t)v11 >> 1;
    uint64_t v13 = v8 - 32;
    if ((unint64_t)v10 <= 0x1000)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>((uint64_t)&v9[4 * v12], (uint64_t)v9, v13);
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>((uint64_t)v9, (uint64_t)&v9[4 * v12], v13);
      uint64_t v14 = 32 * v12 - 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>((uint64_t)(v151 + 4), (uint64_t)v151 + v14, (uint64_t)(v150 - 8));
      uint64_t v15 = 32 * v12 + 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>((uint64_t)(v151 + 8), (uint64_t)v151 + v15, (uint64_t)(v150 - 12));
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>((uint64_t)v151 + v14, (uint64_t)&v151[4 * v12], (uint64_t)v151 + v15);
      *(void *)&long long v153 = &v151[4 * v12];
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *>((uint64_t **)&v151, (uint64_t *)&v153);
    }
    --a3;
    v16 = v151;
    if (a4)
    {
      unint64_t v17 = (unint64_t)v150;
    }
    else
    {
      if (*((char *)v151 - 9) >= 0) {
        CFStringRef v18 = (const char *)(v151 - 4);
      }
      else {
        CFStringRef v18 = *(v151 - 4);
      }
      if (*((char *)v151 + 23) >= 0) {
        v19 = (const char *)v151;
      }
      else {
        v19 = *v151;
      }
      unint64_t v17 = (unint64_t)v150;
      if ((strcmp(v18, v19) & 0x80000000) == 0)
      {
        v152 = v150;
        v37 = v16[3];
        v154 = v16[2];
        long long v153 = *(_OWORD *)v16;
        v16[1] = 0;
        v16[2] = 0;
        std::string *v16 = 0;
        uint64_t v155 = (uint64_t)v37;
        if (SHIBYTE(v154) >= 0) {
          v38 = (const char *)&v153;
        }
        else {
          v38 = (const char *)v153;
        }
        if (*(char *)(v17 - 9) >= 0) {
          v39 = (const char *)(v17 - 32);
        }
        else {
          v39 = *(const char **)(v17 - 32);
        }
        if (strcmp(v38, v39) < 0)
        {
          v40 = v16 + 4;
          do
          {
            *(void *)v156 = v40;
            if (*((char *)v40 + 23) >= 0) {
              v41 = (const char *)v40;
            }
            else {
              v41 = *v40;
            }
            v40 += 4;
          }
          while ((strcmp(v38, v41) & 0x80000000) == 0);
          unint64_t v42 = (unint64_t)(v40 - 4);
        }
        else
        {
          v43 = v16 + 4;
          do
          {
            unint64_t v42 = (unint64_t)v43;
            *(void *)v156 = v43;
            if ((unint64_t)v43 >= v17) {
              break;
            }
            v44 = *((char *)v43 + 23) >= 0 ? (const char *)v43 : *v43;
            int v45 = strcmp(v38, v44);
            v43 = (const char **)(v42 + 32);
          }
          while ((v45 & 0x80000000) == 0);
        }
        if (v42 < v17)
        {
          uint64_t v46 = v17 - 32;
          do
          {
            v152 = (uint64_t *)v46;
            if (*(char *)(v46 + 23) >= 0) {
              v47 = (const char *)v46;
            }
            else {
              v47 = *(const char **)v46;
            }
            v46 -= 32;
          }
          while (strcmp(v38, v47) < 0);
          unint64_t v17 = v46 + 32;
        }
        if (v42 < v17)
        {
          do
          {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>((uint64_t **)v156, (uint64_t *)&v152);
            uint64_t v48 = *(void *)v156 + 32;
            do
            {
              *(void *)v156 = v48;
              if (*(char *)(v48 + 23) >= 0) {
                v49 = (const char *)v48;
              }
              else {
                v49 = *(const char **)v48;
              }
              v48 += 32;
            }
            while ((strcmp(v38, v49) & 0x80000000) == 0);
            unint64_t v42 = v48 - 32;
            uint64_t v50 = (uint64_t)(v152 - 4);
            do
            {
              v152 = (uint64_t *)v50;
              if (*(char *)(v50 + 23) >= 0) {
                v51 = (const char *)v50;
              }
              else {
                v51 = *(const char **)v50;
              }
              v50 -= 32;
            }
            while (strcmp(v38, v51) < 0);
          }
          while (v42 < v50 + 32);
        }
        v52 = (void **)(v42 - 32);
        BOOL v4 = v42 - 32 >= (unint64_t)v16;
        BOOL v5 = v42 - 32 == (void)v16;
        if ((const char **)(v42 - 32) != v16)
        {
          if (*((char *)v16 + 23) < 0) {
            operator delete((void *)*v16);
          }
          long long v53 = *(_OWORD *)v52;
          v16[2] = *(const char **)(v42 - 16);
          *(_OWORD *)v16 = v53;
          *(unsigned char *)(v42 - 9) = 0;
          *(unsigned char *)(v42 - 32) = 0;
          v16[3] = *(const char **)(v42 - 8);
        }
        if (*(char *)(v42 - 9) < 0) {
          operator delete(*v52);
        }
        a4 = 0;
        long long v54 = v153;
        *(void *)(v42 - 16) = v154;
        *(_OWORD *)v52 = v54;
        *(void *)(v42 - 8) = v37;
        uint64_t v9 = *(uint64_t **)v156;
        goto LABEL_109;
      }
    }
    uint64_t v20 = 0;
    v152 = (uint64_t *)v17;
    std::string v21 = v16[3];
    v154 = v16[2];
    long long v153 = *(_OWORD *)v16;
    v16[1] = 0;
    v16[2] = 0;
    std::string *v16 = 0;
    uint64_t v155 = (uint64_t)v21;
    if (SHIBYTE(v154) >= 0) {
      v22 = (const char *)&v153;
    }
    else {
      v22 = (const char *)v153;
    }
    do
    {
      *(void *)v156 = &v16[v20 + 4];
      if (SHIBYTE(v16[v20 + 6]) >= 0) {
        std::string v23 = (const char *)&v16[v20 + 4];
      }
      else {
        std::string v23 = v16[v20 + 4];
      }
      v20 += 4;
    }
    while (strcmp(v23, v22) < 0);
    unint64_t v24 = (unint64_t)&v16[v20];
    if (v20 == 4)
    {
      uint64_t v25 = v17 - 32;
      while (1)
      {
        unint64_t v27 = v25 + 32;
        if (v24 >= v25 + 32) {
          break;
        }
        v152 = (uint64_t *)v25;
        if (*(char *)(v25 + 23) >= 0) {
          char v28 = (const char *)v25;
        }
        else {
          char v28 = *(const char **)v25;
        }
        v25 -= 32;
        if (strcmp(v28, v22) < 0) {
          goto LABEL_38;
        }
      }
    }
    else
    {
      uint64_t v25 = v17 - 32;
      do
      {
        v152 = (uint64_t *)v25;
        if (*(char *)(v25 + 23) >= 0) {
          v26 = (const char *)v25;
        }
        else {
          v26 = *(const char **)v25;
        }
        v25 -= 32;
      }
      while ((strcmp(v26, v22) & 0x80000000) == 0);
LABEL_38:
      unint64_t v27 = v25 + 32;
    }
    uint64_t v9 = (uint64_t *)v24;
    if (v24 < v27)
    {
      do
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>((uint64_t **)v156, (uint64_t *)&v152);
        uint64_t v29 = *(void *)v156 + 32;
        do
        {
          *(void *)v156 = v29;
          if (*(char *)(v29 + 23) >= 0) {
            v30 = (const char *)v29;
          }
          else {
            v30 = *(const char **)v29;
          }
          v29 += 32;
        }
        while (strcmp(v30, v22) < 0);
        uint64_t v9 = (uint64_t *)(v29 - 32);
        uint64_t v31 = (uint64_t)(v152 - 4);
        do
        {
          v152 = (uint64_t *)v31;
          if (*(char *)(v31 + 23) >= 0) {
            v32 = (const char *)v31;
          }
          else {
            v32 = *(const char **)v31;
          }
          v31 -= 32;
        }
        while ((strcmp(v32, v22) & 0x80000000) == 0);
      }
      while ((unint64_t)v9 < v31 + 32);
    }
    v33 = (void **)(v9 - 4);
    if (v9 - 4 != (uint64_t *)v16)
    {
      if (*((char *)v16 + 23) < 0) {
        operator delete((void *)*v16);
      }
      long long v34 = *(_OWORD *)v33;
      v16[2] = (const char *)*(v9 - 2);
      *(_OWORD *)v16 = v34;
      *((unsigned char *)v9 - 9) = 0;
      *((unsigned char *)v9 - 32) = 0;
      v16[3] = (const char *)*(v9 - 1);
    }
    if (*((char *)v9 - 9) < 0) {
      operator delete(*v33);
    }
    long long v35 = v153;
    *(v9 - 2) = (uint64_t)v154;
    *(_OWORD *)v33 = v35;
    *(v9 - 1) = (uint64_t)v21;
    if (v24 < v27) {
      goto LABEL_58;
    }
    BOOL v36 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>((uint64_t)v151, (uint64_t)(v9 - 4));
    if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>((uint64_t)v9, (uint64_t)v150))
    {
      if (!v36)
      {
LABEL_58:
        std::__introsort<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *,false>(v151, v9 - 4, a3, a4 & 1);
        a4 = 0;
      }
LABEL_109:
      v151 = (const char **)v9;
      goto LABEL_110;
    }
    if (v36) {
      return;
    }
    v150 = v9 - 4;
    uint64_t v9 = (uint64_t *)v151;
LABEL_110:
    uint64_t v8 = (uint64_t)v150;
  }
  if (a4)
  {
    if (v9 != (uint64_t *)v8)
    {
      v57 = (const char *)(v9 + 4);
      if (v9 + 4 != (uint64_t *)v8)
      {
        uint64_t v58 = 0;
        v59 = v9;
        do
        {
          v60 = (char *)v57;
          if (*((char *)v59 + 55) >= 0) {
            v61 = v57;
          }
          else {
            v61 = (const char *)v59[4];
          }
          if (*((char *)v59 + 23) >= 0) {
            v62 = (const char *)v59;
          }
          else {
            v62 = (const char *)*v59;
          }
          if (strcmp(v61, v62) < 0)
          {
            long long v63 = *(_OWORD *)v60;
            v154 = (const char *)*((void *)v60 + 2);
            long long v153 = v63;
            *((void *)v60 + 1) = 0;
            *((void *)v60 + 2) = 0;
            *(void *)v60 = 0;
            uint64_t v155 = v59[7];
            if (SHIBYTE(v154) >= 0) {
              v64 = (const char *)&v153;
            }
            else {
              v64 = (const char *)v153;
            }
            uint64_t v65 = v58;
            while (1)
            {
              v66 = (char *)v9 + v65;
              v67 = (void **)((char *)v9 + v65 + 32);
              if (*((char *)v9 + v65 + 55) < 0) {
                operator delete(*v67);
              }
              *(_OWORD *)v67 = *(_OWORD *)v66;
              uint64_t v68 = *((void *)v66 + 3);
              *(uint64_t *)((char *)v9 + v65 + 48) = *((void *)v66 + 2);
              v66[23] = 0;
              char *v66 = 0;
              *((void *)v66 + 7) = v68;
              if (!v65) {
                break;
              }
              if (*((char *)v9 + v65 - 9) >= 0) {
                v69 = (char *)v9 + v65 - 32;
              }
              else {
                v69 = *(const char **)((char *)v9 + v65 - 32);
              }
              v65 -= 32;
              if ((strcmp(v64, v69) & 0x80000000) == 0)
              {
                uint64_t v70 = (uint64_t)v9 + v65 + 32;
                goto LABEL_147;
              }
            }
            uint64_t v70 = (uint64_t)v9;
LABEL_147:
            if (*(char *)(v70 + 23) < 0) {
              operator delete(*(void **)v70);
            }
            long long v71 = v153;
            *(void *)(v70 + 16) = v154;
            *(_OWORD *)uint64_t v70 = v71;
            *(void *)(v70 + 24) = v155;
          }
          v57 = v60 + 32;
          v58 += 32;
          v59 = (uint64_t *)v60;
        }
        while (v60 + 32 != (char *)v8);
      }
    }
  }
  else if (v9 != (uint64_t *)v8)
  {
    v128 = (const char *)(v9 + 4);
    if (v9 + 4 != (uint64_t *)v8)
    {
      v129 = v9 + 7;
      do
      {
        v130 = (uint64_t *)v128;
        if (*((char *)v9 + 55) >= 0) {
          v131 = v128;
        }
        else {
          v131 = (const char *)v9[4];
        }
        if (*((char *)v9 + 23) >= 0) {
          v132 = (const char *)v9;
        }
        else {
          v132 = (const char *)*v9;
        }
        if (strcmp(v131, v132) < 0)
        {
          long long v133 = *(_OWORD *)v130;
          v154 = (const char *)v130[2];
          long long v153 = v133;
          v130[1] = 0;
          v130[2] = 0;
          uint64_t *v130 = 0;
          uint64_t v155 = v9[7];
          if (SHIBYTE(v154) >= 0) {
            v134 = (const char *)&v153;
          }
          else {
            v134 = (const char *)v153;
          }
          v135 = v129;
          do
          {
            v136 = (void **)(v135 - 3);
            if (*((char *)v135 - 1) < 0) {
              operator delete(*v136);
            }
            *(_OWORD *)v136 = *(_OWORD *)(v135 - 7);
            *(v135 - 1) = *(v135 - 5);
            *((unsigned char *)v135 - 33) = 0;
            *((unsigned char *)v135 - 56) = 0;
            v137 = v135 - 4;
            uint64_t *v135 = *(v135 - 4);
            int v138 = *((char *)v135 - 65);
            v141 = (const char *)*(v135 - 11);
            v140 = (const char *)(v135 - 11);
            v139 = v141;
            if (v138 >= 0) {
              v142 = v140;
            }
            else {
              v142 = v139;
            }
            v135 = v137;
          }
          while (strcmp(v134, v142) < 0);
          v143 = (void **)(v137 - 3);
          if (*((char *)v137 - 1) < 0) {
            operator delete(*v143);
          }
          long long v144 = v153;
          *(v137 - 1) = (uint64_t)v154;
          *(_OWORD *)v143 = v144;
          HIBYTE(v154) = 0;
          LOBYTE(v153) = 0;
          uint64_t *v137 = v155;
        }
        v128 = (const char *)(v130 + 4);
        v129 += 4;
        uint64_t v9 = v130;
      }
      while (v130 + 4 != (uint64_t *)v8);
    }
  }
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = **a1;
  *(void *)uint64_t v8 = (*a1)[1];
  *(void *)&v8[7] = *(uint64_t *)((char *)*a1 + 15);
  char v5 = *((unsigned char *)*a1 + 23);
  v2[1] = 0;
  v2[2] = 0;
  *uint64_t v2 = 0;
  uint64_t v6 = v2[3];
  uint64_t v7 = *(void *)(v3 + 16);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)v3;
  v2[2] = v7;
  *(unsigned char *)(v3 + 23) = 0;
  *(unsigned char *)uint64_t v3 = 0;
  v2[3] = *(void *)(v3 + 24);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  *(void *)uint64_t v3 = v4;
  *(void *)(v3 + 8) = *(void *)v8;
  *(void *)(v3 + 15) = *(void *)&v8[7];
  *(unsigned char *)(v3 + 23) = v5;
  *(void *)(v3 + 24) = v6;
}

void std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *,0>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  std::string v21 = (const char **)a2;
  v22 = (uint64_t *)a1;
  v19 = (uint64_t *)a4;
  uint64_t v20 = (uint64_t *)a3;
  uint64_t v18 = a5;
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>(a1, a2, a3, a4);
  if (*(char *)(a5 + 23) >= 0) {
    uint64_t v10 = (const char *)a5;
  }
  else {
    uint64_t v10 = *(const char **)a5;
  }
  if (*(char *)(a4 + 23) >= 0) {
    uint64_t v11 = (const char *)a4;
  }
  else {
    uint64_t v11 = *(const char **)a4;
  }
  if (strcmp(v10, v11) < 0)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>(&v19, &v18);
    unint64_t v12 = *((char *)v19 + 23) >= 0 ? (const char *)v19 : (const char *)*v19;
    uint64_t v13 = *(char *)(a3 + 23) >= 0 ? (const char *)a3 : *(const char **)a3;
    if (strcmp(v12, v13) < 0)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>(&v20, (uint64_t *)&v19);
      uint64_t v14 = *((char *)v20 + 23) >= 0 ? (const char *)v20 : (const char *)*v20;
      uint64_t v15 = *(char *)(a2 + 23) >= 0 ? (const char *)a2 : *(const char **)a2;
      if (strcmp(v14, v15) < 0)
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>((uint64_t **)&v21, (uint64_t *)&v20);
        if (*((char *)v21 + 23) >= 0) {
          v16 = (const char *)v21;
        }
        else {
          v16 = *v21;
        }
        if (*(char *)(a1 + 23) >= 0) {
          unint64_t v17 = (const char *)a1;
        }
        else {
          unint64_t v17 = *(const char **)a1;
        }
        if (strcmp(v16, v17) < 0) {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>(&v22, (uint64_t *)&v21);
        }
      }
    }
  }
}

void std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v16 = (const char **)a2;
  unint64_t v17 = (uint64_t *)a1;
  uint64_t v15 = a3;
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v4 = (const char *)a2;
  }
  else {
    uint64_t v4 = *(const char **)a2;
  }
  if (*(char *)(a1 + 23) >= 0) {
    char v5 = (const char *)a1;
  }
  else {
    char v5 = *(const char **)a1;
  }
  int v6 = strcmp(v4, v5);
  if (*(char *)(a3 + 23) >= 0) {
    uint64_t v7 = (const char *)a3;
  }
  else {
    uint64_t v7 = *(const char **)a3;
  }
  int v8 = strcmp(v7, v4);
  if (v6 < 0)
  {
    if (v8 < 0)
    {
      uint64_t v9 = &v17;
LABEL_30:
      unint64_t v12 = &v15;
      goto LABEL_31;
    }
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>(&v17, (uint64_t *)&v16);
    if (*(char *)(v15 + 23) >= 0) {
      uint64_t v13 = (const char *)v15;
    }
    else {
      uint64_t v13 = *(const char **)v15;
    }
    if (*((char *)v16 + 23) >= 0) {
      uint64_t v14 = (const char *)v16;
    }
    else {
      uint64_t v14 = *v16;
    }
    if (strcmp(v13, v14) < 0)
    {
      uint64_t v9 = (uint64_t **)&v16;
      goto LABEL_30;
    }
  }
  else if (v8 < 0)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>((uint64_t **)&v16, &v15);
    uint64_t v10 = *((char *)v16 + 23) >= 0 ? (const char *)v16 : *v16;
    uint64_t v11 = *((char *)v17 + 23) >= 0 ? (const char *)v17 : (const char *)*v17;
    if (strcmp(v10, v11) < 0)
    {
      uint64_t v9 = &v17;
      unint64_t v12 = (uint64_t *)&v16;
LABEL_31:
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>(v9, v12);
    }
  }
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *>(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = **a1;
  *(void *)int v8 = (*a1)[1];
  *(void *)&v8[7] = *(uint64_t *)((char *)*a1 + 15);
  char v5 = *((unsigned char *)*a1 + 23);
  v2[1] = 0;
  v2[2] = 0;
  *uint64_t v2 = 0;
  uint64_t v6 = v2[3];
  uint64_t v7 = *(void *)(v3 + 16);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)v3;
  v2[2] = v7;
  *(unsigned char *)(v3 + 23) = 0;
  *(unsigned char *)uint64_t v3 = 0;
  v2[3] = *(void *)(v3 + 24);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  *(void *)uint64_t v3 = v4;
  *(void *)(v3 + 8) = *(void *)v8;
  *(void *)(v3 + 15) = *(void *)&v8[7];
  *(unsigned char *)(v3 + 23) = v5;
  *(void *)(v3 + 24) = v6;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v25 = a2;
  v26 = (uint64_t *)a1;
  uint64_t v4 = (a2 - a1) >> 5;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = *(const char **)(a2 - 32);
      uint64_t v25 = a2 - 32;
      if (*(char *)(a2 - 9) >= 0) {
        uint64_t v7 = (const char *)(a2 - 32);
      }
      else {
        uint64_t v7 = v6;
      }
      if (*(char *)(a1 + 23) >= 0) {
        int v8 = (const char *)a1;
      }
      else {
        int v8 = *(const char **)a1;
      }
      if (strcmp(v7, v8) < 0) {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>(&v26, &v25);
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>(a1, a1 + 32, a2 - 32);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>(a1, a1 + 32, a1 + 64, a2 - 32);
      return 1;
    case 5:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *,0>(a1, a1 + 32, a1 + 64, a1 + 96, a2 - 32);
      return 1;
    default:
      uint64_t v9 = a1 + 64;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>(a1, a1 + 32, a1 + 64);
      uint64_t v10 = a1 + 96;
      if (v10 == v2) {
        return 1;
      }
      int v11 = 0;
      break;
  }
  while (1)
  {
    if (*(char *)(v10 + 23) >= 0) {
      unint64_t v12 = (const char *)v10;
    }
    else {
      unint64_t v12 = *(const char **)v10;
    }
    if (*(char *)(v9 + 23) >= 0) {
      uint64_t v13 = (const char *)v9;
    }
    else {
      uint64_t v13 = *(const char **)v9;
    }
    if ((strcmp(v12, v13) & 0x80000000) == 0) {
      goto LABEL_34;
    }
    long long v22 = *(_OWORD *)v10;
    uint64_t v14 = *(void *)(v10 + 16);
    uint64_t v15 = *(void *)(v10 + 24);
    *(void *)(v10 + 8) = 0;
    *(void *)(v10 + 16) = 0;
    *(void *)uint64_t v10 = 0;
    uint64_t v23 = v14;
    uint64_t v24 = v15;
    do
    {
      uint64_t v16 = v9;
      uint64_t v17 = v9 + 32;
      if (*(char *)(v16 + 55) < 0) {
        operator delete(*(void **)v17);
      }
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v16;
      uint64_t v18 = *(void *)(v16 + 24);
      *(void *)(v17 + 16) = *(void *)(v16 + 16);
      *(unsigned char *)(v16 + 23) = 0;
      *(unsigned char *)uint64_t v16 = 0;
      *(void *)(v16 + 56) = v18;
      if ((uint64_t *)v16 == v26) {
        break;
      }
      uint64_t v9 = v16 - 32;
      v19 = v23 >= 0 ? (const char *)&v22 : (const char *)v22;
      uint64_t v20 = *(char *)(v16 - 9) >= 0 ? (const char *)(v16 - 32) : *(const char **)(v16 - 32);
    }
    while (strcmp(v19, v20) < 0);
    if (*(char *)(v16 + 23) < 0) {
      operator delete(*(void **)v16);
    }
    long long v21 = v22;
    *(void *)(v16 + 16) = v23;
    *(_OWORD *)uint64_t v16 = v21;
    HIBYTE(v23) = 0;
    LOBYTE(v22) = 0;
    *(void *)(v16 + 24) = v24;
    if (++v11 == 8) {
      return v10 + 32 == v25;
    }
    uint64_t v2 = v25;
LABEL_34:
    uint64_t v9 = v10;
    v10 += 32;
    if (v10 == v2) {
      return 1;
    }
  }
}

void std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = (const char **)a2;
  uint64_t v17 = (uint64_t *)a1;
  uint64_t v14 = a4;
  uint64_t v15 = (uint64_t *)a3;
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,get_ptmu_regions(unsigned int,__CFString const*,__CFString const*)::$_0 &,region *>(a1, a2, a3);
  if (*(char *)(a4 + 23) >= 0) {
    int v8 = (const char *)a4;
  }
  else {
    int v8 = *(const char **)a4;
  }
  if (*(char *)(a3 + 23) >= 0) {
    uint64_t v9 = (const char *)a3;
  }
  else {
    uint64_t v9 = *(const char **)a3;
  }
  if (strcmp(v8, v9) < 0)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>(&v15, &v14);
    uint64_t v10 = *((char *)v15 + 23) >= 0 ? (const char *)v15 : (const char *)*v15;
    int v11 = *(char *)(a2 + 23) >= 0 ? (const char *)a2 : *(const char **)a2;
    if (strcmp(v10, v11) < 0)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>((uint64_t **)&v16, (uint64_t *)&v15);
      if (*((char *)v16 + 23) >= 0) {
        unint64_t v12 = (const char *)v16;
      }
      else {
        unint64_t v12 = *v16;
      }
      if (*(char *)(a1 + 23) >= 0) {
        uint64_t v13 = (const char *)a1;
      }
      else {
        uint64_t v13 = *(const char **)a1;
      }
      if (strcmp(v12, v13) < 0) {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<region *&,region *&>(&v17, (uint64_t *)&v16);
      }
    }
  }
}

uint64_t pmu_spmi_init(char *a1)
{
  uint64_t v2 = IOServiceNameMatching(a1);
  CFDictionarySetValue(v2, @"IOProviderClass", @"AppleARMSPMIDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    uint64_t result = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&connect);
    if (!result) {
      return result;
    }
    mach_error_t v5 = result;
    uint64_t v6 = __stderrp;
    uint64_t v7 = getprogname();
    int v8 = mach_error_string(v5);
    fprintf(v6, "%s: cannot open service: %s\n", v7, v8);
    getprogname();
    mach_error_string(v5);
    printf("%s: cannot open service: %s\n");
  }
  else
  {
    uint64_t v9 = __stderrp;
    uint64_t v10 = getprogname();
    fprintf(v9, "%s: could not find device %s\n", v10, a1);
    getprogname();
    printf("%s: could not find device %s\n");
  }
  return 0xFFFFFFFFLL;
}

uint64_t pmu_spmi_read(size_t *outputStructCnt, unsigned __int8 *outputStruct, unint64_t a3)
{
  unsigned int v5 = outputStructCnt;
  size_t v12 = 128;
  if (spmi_verbose) {
    printf("%s: start: addr 0x%x size %td\n", "pmu_spmi_read", outputStructCnt, a3);
  }
  if (a3 >= 0x80)
  {
    unsigned int v7 = 1;
    while (1)
    {
      uint64_t input = v5;
      uint64_t v14 = transferOptions;
      uint64_t v8 = IOConnectCallMethod(connect, 5u, &input, 2u, 0, 0, 0, 0, outputStruct, &v12);
      uint64_t v6 = v8;
      if (spmi_verbose) {
        printf("%s: addr 0x%x size %td rc = 0x%x\n", "pmu_spmi_read", v5, v12, v8);
      }
      if ((v6 & 0x80000000) != 0) {
        break;
      }
      outputStruct += 128;
      v5 += 128;
      if (a3 >> 7 <= v7++) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v6 = 0xFFFFFFFFLL;
LABEL_10:
    size_t v12 = a3 & 0x7F;
    if ((a3 & 0x7F) != 0)
    {
      uint64_t input = v5;
      uint64_t v14 = transferOptions;
      uint64_t v10 = IOConnectCallMethod(connect, 5u, &input, 2u, 0, 0, 0, 0, outputStruct, &v12);
      uint64_t v6 = v10;
      if (spmi_verbose) {
        printf("%s: addr 0x%x size %td rc = 0x%x\n", "pmu_spmi_read", v5, v12, v10);
      }
    }
  }
  return v6;
}

void number_to_ascii_string(unsigned int a1@<W0>, uint64_t a2@<X8>)
{
  std::string::basic_string[abi:ne180100]<0>((void *)a2, (char *)&unk_100007C6E);
  if (a1)
  {
    uint64_t v4 = *(const std::string::value_type **)a2;
    do
    {
      *((unsigned char *)&__p.__r_.__value_.__s + 23) = 1;
      LOWORD(__p.__r_.__value_.__l.__data_) = a1;
      int v5 = *(char *)(a2 + 23);
      if (v5 >= 0) {
        uint64_t v6 = (const std::string::value_type *)a2;
      }
      else {
        uint64_t v6 = v4;
      }
      if (v5 >= 0) {
        std::string::size_type v7 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        std::string::size_type v7 = *(void *)(a2 + 8);
      }
      uint64_t v8 = std::string::append(&__p, v6, v7);
      uint64_t v4 = (const std::string::value_type *)v8->__r_.__value_.__r.__words[0];
      v12[0] = v8->__r_.__value_.__l.__size_;
      *(void *)((char *)v12 + 7) = *(std::string::size_type *)((char *)&v8->__r_.__value_.__r.__words[1] + 7);
      char v9 = HIBYTE(v8->__r_.__value_.__r.__words[2]);
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      if (*(char *)(a2 + 23) < 0) {
        operator delete(*(void **)a2);
      }
      *(void *)a2 = v4;
      *(void *)(a2 + 8) = v12[0];
      *(void *)(a2 + 15) = *(void *)((char *)v12 + 7);
      *(unsigned char *)(a2 + 23) = v9;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        uint64_t v4 = *(const std::string::value_type **)a2;
      }
      BOOL v10 = a1 >= 0x100;
      a1 >>= 8;
    }
    while (v10);
  }
}

void sub_1000071B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v14 + 23) < 0) {
    operator delete(*(void **)v14);
  }
  _Unwind_Resume(exception_object);
}

uint64_t parse_general_config_buffer_and_read_ptd(PTDConnection *a1)
{
  Instance = (PTDConnection *)PTDConnection::get_Instance(a1);
  putchar(10);
  uint64_t result = config_buffer_get_feature_config((size_t *)a1, 1, 0, &size, 0);
  if (!result)
  {
    uint64_t v3 = (char *)malloc_type_malloc((unsigned __int16)size, 0x4FBCC30DuLL);
    if (v3)
    {
      uint64_t v4 = v3;
      unsigned int feature_config = config_buffer_get_feature_config((size_t *)a1, 0, v3, &size, (unsigned __int16)size);
      if (feature_config)
      {
        unsigned int v6 = feature_config;
        free(v4);
        if (v6 == 1) {
          return 0;
        }
        else {
          return v6;
        }
      }
      if ((unsigned __int16)size < 0xCu)
      {
LABEL_20:
        free(v4);
        return 0;
      }
      uint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = &v4[12 * v7];
        number_to_ascii_string(*(_DWORD *)v8, (uint64_t)__p);
        if (v15 >= 0) {
          char v9 = __p;
        }
        else {
          char v9 = (void **)__p[0];
        }
        printf("\n\t'%s'", (const char *)v9);
        if (v15 < 0) {
          operator delete(__p[0]);
        }
        BOOL v10 = (unsigned __int8 *)malloc_type_malloc(16 * v8[8], 0x37BFF60BuLL);
        if (!v10) {
          break;
        }
        int v11 = v10;
        if (PTDObject::PTDRead(&Instance, *(_DWORD *)v8, 0, v8[8], v10, 1))
        {
          puts("\t\tFailed to read from AON PTD");
          free(v11);
          return 4294967287;
        }
        LOBYTE(v12) = v8[8];
        if ((_BYTE)v12)
        {
          unint64_t v13 = 0;
          do
          {
            printf("\n\t\tentry %d, data : 0x%16llX\ttimestamp:0x%16llX", v13, *(void *)&v11[8 * v13], *(void *)&v11[8 * v13 + 8 * v12]);
            ++v13;
            unint64_t v12 = v8[8];
          }
          while (v13 < v12);
        }
        free(v11);
        if (++v7 >= (unint64_t)((unsigned __int16)size / 0xCu)) {
          goto LABEL_20;
        }
      }
    }
    puts("\t\tMemory allocation failed");
    return 4294967289;
  }
  return result;
}

uint64_t config_buffer_get_feature_config(size_t *outputStructCnt, char a2, void *a3, void *a4, unsigned int a5)
{
  if (!a4)
  {
    BOOL v10 = "\t\tInvalid header pointer argument";
    goto LABEL_23;
  }
  if (!a3 && (a2 & 1) == 0)
  {
    BOOL v10 = "\t\tInvalid result pointer argument";
LABEL_23:
    puts(v10);
    return 0xFFFFFFFFLL;
  }
  if (!outputStructCnt)
  {
    BOOL v10 = "\t\tNo config buffer address defined for this PMU";
    goto LABEL_23;
  }
  if ((pmu_spmi_read(outputStructCnt, (unsigned __int8 *)size, 8uLL) & 0x80000000) != 0)
  {
    puts("\t\tspmi error");
    return 4294967292;
  }
  else if (size[0] && size[1] != 8 && size_4)
  {
    int v11 = (unsigned __int8 *)malloc_type_malloc(size[0], 0xA8E1D9E7uLL);
    if (v11)
    {
      unint64_t v12 = (unsigned __int16 *)v11;
      if ((pmu_spmi_read(outputStructCnt, v11, size[0]) & 0x80000000) != 0)
      {
        puts("\t\tspmi error");
        uint64_t v17 = 4294967292;
      }
      else
      {
        int v13 = size_4;
        if (size_4)
        {
          uint64_t v14 = v12 + 4;
          while (1)
          {
            uint64_t v15 = *v14;
            if (*((unsigned char *)v14 + 2) == 6 && v15 != 0) {
              break;
            }
            uint64_t v14 = (unsigned __int16 *)((char *)v14 + v15 + 8);
            if (!--v13) {
              goto LABEL_21;
            }
          }
          *a4 = *(void *)v14;
          if ((a2 & 1) == 0)
          {
            unsigned int v21 = *v14;
            v19 = v14 + 4;
            unsigned int v20 = v21;
            if (v21 >= a5) {
              size_t v22 = a5;
            }
            else {
              size_t v22 = v20;
            }
            memcpy(a3, v19, v22);
          }
          uint64_t v17 = 0;
        }
        else
        {
LABEL_21:
          puts("\t\tfeature configuration not found");
          uint64_t v17 = 1;
        }
      }
      free(v12);
    }
    else
    {
      puts("\t\tMemory allocation failed");
      return 4294967289;
    }
  }
  else
  {
    puts("\t\tNo valid configuration buffer found");
    return 4294967288;
  }
  return v17;
}

void *PTDConnection::get_Instance(PTDConnection *this)
{
  {
    __cxa_atexit((void (*)(void *))PTDConnection::~PTDConnection, &PTDConnection::get_Instance(void)::instance, (void *)&_mh_execute_header);
  }
  return &PTDConnection::get_Instance(void)::instance;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
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
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

char *__cdecl ctime(const time_t *a1)
{
  return _ctime(a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

const char *getprogname(void)
{
  return _getprogname();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int vprintf(const char *a1, va_list a2)
{
  return _vprintf(a1, a2);
}