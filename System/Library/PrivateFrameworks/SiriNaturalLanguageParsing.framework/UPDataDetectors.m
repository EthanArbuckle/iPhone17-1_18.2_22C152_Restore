@interface UPDataDetectors
- (UPDataDetector)dataDetector;
- (id)_matchSpansForDetectedDataArray:(__CFArray *)a3 label:(id)a4;
- (id)initLoadFromDataDetectorsDirectoryPath:(id)a3 forLocale:(id)a4;
- (id)matchSpans:(id)a3;
- (id)matchSpansForDetectedData:(id)a3;
- (id)matchSpansForUtterance:(id)a3;
- (void)ddUsoMapper;
- (void)dealloc;
@end

@implementation UPDataDetectors

- (void)ddUsoMapper
{
  return self->_ddUsoMapper;
}

- (UPDataDetector)dataDetector
{
  return self->_dataDetector;
}

- (id)_matchSpansForDetectedDataArray:(__CFArray *)a3 label:(id)a4
{
  id v7 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  if (CFArrayGetCount(a3) >= 1)
  {
    CFArrayGetValueAtIndex(a3, 0);
    DDResultGetRange();
    uaap::DDUsoMapper::toItemizedUsos();
  }

  return v6;
}

- (id)matchSpansForDetectedData:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 dataDetectorResult];
  id v7 = [v4 label];
  v8 = [(UPDataDetectors *)v5 _matchSpansForDetectedDataArray:v6 label:v7];

  objc_sync_exit(v5);
  return v8;
}

- (id)matchSpansForUtterance:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  uaap::UPDataDetector::matchSpans((void *)[(UPDataDetectors *)v5 dataDetector], (const char *)__p, (uint64_t)&v15);
  id v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = v15;
  for (i = v16; v8 != i; v8 += 5)
  {
    if (*((char *)v8 + 23) < 0)
    {
      v11 = (uint64_t *)*v8;
      uint64_t v10 = v8[1];
    }
    else
    {
      uint64_t v10 = *((unsigned __int8 *)v8 + 23);
      v11 = v8;
    }
    v12 = [NSString stringWithCharacters:v11 length:v10];
    v13 = [(UPDataDetectors *)v5 _matchSpansForDetectedDataArray:v8[3] label:v12];
    [v7 addObjectsFromArray:v13];
  }
  v19 = (void **)&v15;
  std::vector<uaap::UPDataDetectorResult>::__destroy_vector::operator()[abi:ne180100](&v19);
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  objc_sync_exit(v5);

  return v7;
}

- (id)matchSpans:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  uaap::UPDataDetector::matchSpans((void *)[(UPDataDetectors *)v5 dataDetector], (const char *)__p, (uint64_t)&v17);
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xCCCCCCCCCCCCCCCDLL * (v18 - v17)];
  v8 = v17;
  for (i = v18; v8 != i; v8 += 5)
  {
    if (*((char *)v8 + 23) < 0)
    {
      v11 = (uint64_t *)*v8;
      uint64_t v10 = v8[1];
    }
    else
    {
      uint64_t v10 = *((unsigned __int8 *)v8 + 23);
      v11 = v8;
    }
    v12 = [NSString stringWithCharacters:v11 length:v10];
    v13 = [UPDetectedData alloc];
    uint64_t v14 = v8[3];
    v8[3] = 0;
    v15 = [(UPDetectedData *)v13 initWithLabel:v12 dataDetectorResult:v14];
    [v7 addObject:v15];
  }
  v21 = (void **)&v17;
  std::vector<uaap::UPDataDetectorResult>::__destroy_vector::operator()[abi:ne180100](&v21);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  objc_sync_exit(v5);

  return v7;
}

- (void)dealloc
{
  dataDetector = self->_dataDetector;
  if (dataDetector)
  {
    uaap::UPDataDetector::~UPDataDetector((uaap::UPDataDetector *)dataDetector);
    MEMORY[0x1CB775C40]();
  }
  ddUsoMapper = self->_ddUsoMapper;
  if (ddUsoMapper)
  {
    id v6 = (void **)self->_ddUsoMapper;
    std::vector<std::unique_ptr<uaap::AbstractDateTimeHandler>>::__destroy_vector::operator()[abi:ne180100](&v6);
    MEMORY[0x1CB775C40](ddUsoMapper, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)UPDataDetectors;
  [(UPDataDetectors *)&v5 dealloc];
}

- (id)initLoadFromDataDetectorsDirectoryPath:(id)a3 forLocale:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)UPDataDetectors;
  if ([(UPDataDetectors *)&v30 init])
  {
    __p[0] = (void *)[v6 UTF8String];
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v29, (char **)__p);
    memset(v28, 0, sizeof(v28));
    long long v27 = 0u;
    *(_OWORD *)v25 = 0u;
    memset(v26, 0, sizeof(v26));
    memset(v24, 0, sizeof(v24));
    *(_OWORD *)__p = 0u;
    std::__fs::filesystem::path::path[abi:ne180100]<char [16],void>(&v31.__pn_, "addresses.cache");
    std::__fs::filesystem::operator/[abi:ne180100](&v32.__pn_, (uint64_t)&v29, &v31);
    if (SHIBYTE(v24[0]) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)__p = *(_OWORD *)&v32.__pn_.__r_.__value_.__l.__data_;
    v24[0] = (void *)v32.__pn_.__r_.__value_.__r.__words[2];
    *((unsigned char *)&v32.__pn_.__r_.__value_.__s + 23) = 0;
    v32.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v31.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__pn_.__r_.__value_.__l.__data_);
    }
    std::__fs::filesystem::path::path[abi:ne180100]<char [16],void>(&v31.__pn_, "date_time.cache");
    std::__fs::filesystem::operator/[abi:ne180100](&v32.__pn_, (uint64_t)&v29, &v31);
    if (SHIBYTE(v24[3]) < 0) {
      operator delete(v24[1]);
    }
    *(std::__fs::filesystem::path *)&v24[1] = v32;
    *((unsigned char *)&v32.__pn_.__r_.__value_.__s + 23) = 0;
    v32.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v31.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__pn_.__r_.__value_.__l.__data_);
    }
    std::__fs::filesystem::path::path[abi:ne180100]<char [14],void>(&v31.__pn_, "flights.cache");
    std::__fs::filesystem::operator/[abi:ne180100](&v32.__pn_, (uint64_t)&v29, &v31);
    if (SHIBYTE(v26[0]) < 0) {
      operator delete(v25[0]);
    }
    *(_OWORD *)v25 = *(_OWORD *)&v32.__pn_.__r_.__value_.__l.__data_;
    v26[0] = (void *)v32.__pn_.__r_.__value_.__r.__words[2];
    *((unsigned char *)&v32.__pn_.__r_.__value_.__s + 23) = 0;
    v32.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v31.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__pn_.__r_.__value_.__l.__data_);
    }
    memset(&v31, 0, sizeof(v31));
    std::string::append[abi:ne180100]<char const*,0>(&v31.__pn_, "currencies.cache", "");
    std::__fs::filesystem::operator/[abi:ne180100](&v32.__pn_, (uint64_t)&v29, &v31);
    if (SHIBYTE(v26[3]) < 0) {
      operator delete(v26[1]);
    }
    *(std::__fs::filesystem::path *)&v26[1] = v32;
    *((unsigned char *)&v32.__pn_.__r_.__value_.__s + 23) = 0;
    v32.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v31.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__pn_.__r_.__value_.__l.__data_);
    }
    std::__fs::filesystem::path::path[abi:ne180100]<char [14],void>(&v31.__pn_, "numbers.cache");
    std::__fs::filesystem::operator/[abi:ne180100](&v32.__pn_, (uint64_t)&v29, &v31);
    if (SHIBYTE(v28[0]) < 0) {
      operator delete((void *)v27);
    }
    long long v27 = *(_OWORD *)&v32.__pn_.__r_.__value_.__l.__data_;
    v28[0] = *((void *)&v32.__pn_.__r_.__value_.__l + 2);
    *((unsigned char *)&v32.__pn_.__r_.__value_.__s + 23) = 0;
    v32.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v31.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__pn_.__r_.__value_.__l.__data_);
    }
    std::__fs::filesystem::path::path[abi:ne180100]<char [19],void>(&v31.__pn_, "phone_mobile.cache");
    std::__fs::filesystem::operator/[abi:ne180100](&v32.__pn_, (uint64_t)&v29, &v31);
    if (SHIBYTE(v28[3]) < 0) {
      operator delete((void *)v28[1]);
    }
    *(std::__fs::filesystem::path *)&v28[1] = v32;
    *((unsigned char *)&v32.__pn_.__r_.__value_.__s + 23) = 0;
    v32.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v31.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__pn_.__r_.__value_.__l.__data_);
    }
    id v8 = [v7 languageCode];
    std::string::basic_string[abi:ne180100]<0>(&v21, (char *)[v8 UTF8String]);
    v9 = std::string::insert(&v21, 0, "addresses_");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v22.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    v11 = std::string::append(&v22, ".cache");
    std::string::size_type v12 = v11->__r_.__value_.__r.__words[0];
    v33[0] = v11->__r_.__value_.__l.__size_;
    *(void *)((char *)v33 + 7) = *(std::string::size_type *)((char *)&v11->__r_.__value_.__r.__words[1] + 7);
    char v13 = HIBYTE(v11->__r_.__value_.__r.__words[2]);
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    *(std::string::size_type *)((char *)&v31.__pn_.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v33 + 7);
    v31.__pn_.__r_.__value_.__r.__words[0] = v12;
    v31.__pn_.__r_.__value_.__l.__size_ = v33[0];
    *((unsigned char *)&v31.__pn_.__r_.__value_.__s + 23) = v13;
    std::__fs::filesystem::operator/[abi:ne180100](&v32.__pn_, (uint64_t)&v29, &v31);
    if (SHIBYTE(v31.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__pn_.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v22.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v21.__r_.__value_.__l.__data_);
    }

    std::__fs::filesystem::__status(&v32, 0);
    if (v31.__pn_.__r_.__value_.__s.__data_[0] && v31.__pn_.__r_.__value_.__s.__data_[0] != 255) {
      std::string::operator=((std::string *)__p, &v32.__pn_);
    }
    if (SHIBYTE(v32.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v32.__pn_.__r_.__value_.__l.__data_);
    }
    id v14 = [v7 localeIdentifier];
    std::string::basic_string[abi:ne180100]<0>(&v21, (char *)[v14 UTF8String]);
    v15 = std::string::insert(&v21, 0, "date_time_");
    long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v22.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    v17 = std::string::append(&v22, ".cache");
    std::string::size_type v18 = v17->__r_.__value_.__r.__words[0];
    v33[0] = v17->__r_.__value_.__l.__size_;
    *(void *)((char *)v33 + 7) = *(std::string::size_type *)((char *)&v17->__r_.__value_.__r.__words[1] + 7);
    char v19 = HIBYTE(v17->__r_.__value_.__r.__words[2]);
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    *(std::string::size_type *)((char *)&v31.__pn_.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v33 + 7);
    v31.__pn_.__r_.__value_.__r.__words[0] = v18;
    v31.__pn_.__r_.__value_.__l.__size_ = v33[0];
    *((unsigned char *)&v31.__pn_.__r_.__value_.__s + 23) = v19;
    std::__fs::filesystem::operator/[abi:ne180100](&v32.__pn_, (uint64_t)&v29, &v31);
    if (SHIBYTE(v31.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v31.__pn_.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v22.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v21.__r_.__value_.__l.__data_);
    }

    std::__fs::filesystem::__status(&v32, 0);
    if (v31.__pn_.__r_.__value_.__s.__data_[0] && v31.__pn_.__r_.__value_.__s.__data_[0] != 255) {
      std::string::operator=((std::string *)&v24[1], &v32.__pn_);
    }
    if (SHIBYTE(v32.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v32.__pn_.__r_.__value_.__l.__data_);
    }
    operator new();
  }

  return 0;
}

@end