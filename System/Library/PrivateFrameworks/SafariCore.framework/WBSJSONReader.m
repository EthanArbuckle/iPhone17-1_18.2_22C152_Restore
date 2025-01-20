@interface WBSJSONReader
- (BOOL)parseData:(id)a3 error:(id *)a4;
- (BOOL)parseFileHandle:(id)a3 error:(id *)a4;
- (BOOL)parseURL:(id)a3 error:(id *)a4;
- (WBSJSONReaderDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation WBSJSONReader

- (BOOL)parseData:(id)a3 error:(id *)a4
{
  v47[9] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v32 = (uint64_t (**)(void **, uint64_t))&unk_1F10599B8;
  v33 = self;
  id v34 = WeakRetained;
  id v7 = v5;
  uint64_t v8 = [v7 bytes];
  v42[3] = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::iterator_input_adapter<char const*>>(v8, v8 + [v7 length], (uint64_t)v42, 1, (uint64_t)v43);
  memset(&__p, 0, sizeof(__p));
  while (2)
  {
    switch(v44)
    {
      case 1:
        char v9 = v32[1]((void **)&v32, 1);
        goto LABEL_18;
      case 2:
        char v9 = v32[1]((void **)&v32, 0);
        goto LABEL_18;
      case 3:
        char v9 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t)))*v32)(&v32);
        goto LABEL_18;
      case 4:
        char v9 = v32[5]((void **)&v32, (uint64_t)v47);
        goto LABEL_18;
      case 5:
        char v9 = v32[3]((void **)&v32, v47[5]);
        goto LABEL_18;
      case 6:
        char v9 = v32[2]((void **)&v32, v47[4]);
        goto LABEL_18;
      case 7:
        if ((v47[6] & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
        {
          std::string::size_type v27 = v46.__r_.__value_.__r.__words[0];
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v45, &v40);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v45, &v35);
          v28 = std::string::insert(&v35, 0, "number overflow parsing '", 0x19uLL);
          long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
          v36.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v29;
          v28->__r_.__value_.__l.__size_ = 0;
          v28->__r_.__value_.__r.__words[2] = 0;
          v28->__r_.__value_.__r.__words[0] = 0;
          v30 = std::string::append(&v36, "'", 1uLL);
          long long v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
          v37.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v31;
          v30->__r_.__value_.__l.__size_ = 0;
          v30->__r_.__value_.__r.__words[2] = 0;
          v30->__r_.__value_.__r.__words[0] = 0;
          nlohmann::detail::out_of_range::create(406, (uint64_t)&v37, (nlohmann::detail::exception *)&v38);
          int v16 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t), std::string::size_type, std::string *, std::exception *))v32[12])(&v32, v27, &v40, &v38);
          nlohmann::detail::out_of_range::~out_of_range(&v38);
          if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v37.__r_.__value_.__l.__data_);
          }
          goto LABEL_57;
        }
        if (v32[4]((void **)&v32, (uint64_t)v47)) {
          goto LABEL_19;
        }
        goto LABEL_53;
      case 8:
        if (!v32[10]((void **)&v32, -1)) {
          goto LABEL_53;
        }
        int v44 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v45);
        if (v44 == 10)
        {
          char v9 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t)))v32[11])(&v32);
          goto LABEL_18;
        }
        LOBYTE(v38.__vftable) = 1;
        std::vector<BOOL>::push_back((uint64_t)&__p, &v38);
        continue;
      case 9:
        if ((v32[7]((void **)&v32, -1) & 1) == 0) {
          goto LABEL_53;
        }
        int v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v45);
        int v44 = v10;
        if (v10 != 11)
        {
          if (v10 != 4) {
            goto LABEL_65;
          }
          if (!v32[8]((void **)&v32, (uint64_t)v47)) {
            goto LABEL_53;
          }
          int v44 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v45);
          if (v44 != 12) {
            goto LABEL_66;
          }
          LOBYTE(v38.__vftable) = 0;
          std::vector<BOOL>::push_back((uint64_t)&__p, &v38);
          int v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v45);
LABEL_35:
          int v44 = v15;
          continue;
        }
        char v9 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t)))v32[9])(&v32);
LABEL_18:
        if ((v9 & 1) == 0) {
          goto LABEL_53;
        }
LABEL_19:
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
        if (!__p.__r_.__value_.__l.__size_)
        {
LABEL_41:
          int v16 = 1;
          goto LABEL_42;
        }
        while (2)
        {
          if ((*(void *)(__p.__r_.__value_.__r.__words[0] + (((size - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (size - 1)))
          {
            int v12 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v45);
            int v44 = v12;
            if (v12 == 13) {
              goto LABEL_34;
            }
            if (v12 != 10)
            {
              std::string::size_type v22 = v46.__r_.__value_.__r.__words[0];
              nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v45, &v40);
              std::string v37 = v46;
              std::string::basic_string[abi:sn180100]<0>(&v35.__r_.__value_.__l.__data_, "array");
              nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v43, 0xAu, (uint64_t)&v35, &v36);
              nlohmann::detail::parse_error::create(101, (uint64_t *)&v37, (uint64_t)&v36, (nlohmann::detail::exception *)&v38);
              int v23 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t), std::string::size_type, std::string *, std::exception *))v32[12])(&v32, v22, &v40, &v38);
              goto LABEL_67;
            }
            char v13 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t)))v32[11])(&v32);
LABEL_27:
            if ((v13 & 1) == 0) {
              goto LABEL_53;
            }
            std::string::size_type size = --__p.__r_.__value_.__l.__size_;
            if (!__p.__r_.__value_.__l.__size_) {
              goto LABEL_41;
            }
            continue;
          }
          break;
        }
        int v14 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v45);
        int v44 = v14;
        if (v14 != 13)
        {
          if (v14 != 11)
          {
            std::string::size_type v24 = v46.__r_.__value_.__r.__words[0];
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v45, &v40);
            std::string v37 = v46;
            std::string::basic_string[abi:sn180100]<0>(&v35.__r_.__value_.__l.__data_, "object");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v43, 0xBu, (uint64_t)&v35, &v36);
            nlohmann::detail::parse_error::create(101, (uint64_t *)&v37, (uint64_t)&v36, (nlohmann::detail::exception *)&v38);
            int v23 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t), std::string::size_type, std::string *, std::exception *))v32[12])(&v32, v24, &v40, &v38);
            goto LABEL_67;
          }
          char v13 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t)))v32[9])(&v32);
          goto LABEL_27;
        }
        int v44 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v45);
        if (v44 != 4)
        {
LABEL_65:
          std::string::size_type v25 = v46.__r_.__value_.__r.__words[0];
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v45, &v40);
          std::string v37 = v46;
          std::string::basic_string[abi:sn180100]<0>(&v35.__r_.__value_.__l.__data_, "object key");
          nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v43, 4u, (uint64_t)&v35, &v36);
          nlohmann::detail::parse_error::create(101, (uint64_t *)&v37, (uint64_t)&v36, (nlohmann::detail::exception *)&v38);
          int v23 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t), std::string::size_type, std::string *, std::exception *))v32[12])(&v32, v25, &v40, &v38);
          goto LABEL_67;
        }
        if (!v32[8]((void **)&v32, (uint64_t)v47))
        {
LABEL_53:
          int v16 = 0;
          goto LABEL_42;
        }
        int v44 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v45);
        if (v44 == 12)
        {
LABEL_34:
          int v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v45);
          goto LABEL_35;
        }
LABEL_66:
        std::string::size_type v26 = v46.__r_.__value_.__r.__words[0];
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v45, &v40);
        std::string v37 = v46;
        std::string::basic_string[abi:sn180100]<0>(&v35.__r_.__value_.__l.__data_, "object separator");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v43, 0xCu, (uint64_t)&v35, &v36);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&v37, (uint64_t)&v36, (nlohmann::detail::exception *)&v38);
        int v23 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t), std::string::size_type, std::string *, std::exception *))v32[12])(&v32, v26, &v40, &v38);
LABEL_67:
        int v16 = v23;
        nlohmann::detail::parse_error::~parse_error(&v38);
LABEL_57:
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v36.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v35.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v40.__r_.__value_.__l.__data_);
        }
LABEL_42:
        if (__p.__r_.__value_.__r.__words[0]) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (v16)
        {
          int v44 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan((uint64_t)v45);
          if (v44 != 15)
          {
            std::string::size_type v17 = v46.__r_.__value_.__r.__words[0];
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v45, &__p);
            std::string v40 = v46;
            std::string::basic_string[abi:sn180100]<0>(&v36.__r_.__value_.__l.__data_, "value");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v43, 0xFu, (uint64_t)&v36, &v37);
            nlohmann::detail::parse_error::create(101, (uint64_t *)&v40, (uint64_t)&v37, (nlohmann::detail::exception *)&v38);
            ((void (*)(uint64_t (***)(void **, uint64_t), std::string::size_type, std::string *, std::exception *))v32[12])(&v32, v17, &__p, &v38);
            v38.__vftable = (std::exception_vtbl *)&unk_1F1059AE8;
            MEMORY[0x1BA9BC6A0](v39);
            std::exception::~exception(&v38);
            if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v37.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v36.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
        }
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer((uint64_t)v45);
        std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](v43);
        std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](v42);

        return 1;
      case 14:
        std::string::size_type v19 = v46.__r_.__value_.__r.__words[0];
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v45, &v40);
        std::string v37 = v46;
        std::string::basic_string[abi:sn180100]<0>(&v35.__r_.__value_.__l.__data_, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v43, 0, (uint64_t)&v35, &v36);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&v37, (uint64_t)&v36, (nlohmann::detail::exception *)&v38);
        int v20 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t), std::string::size_type, std::string *, std::exception *))v32[12])(&v32, v19, &v40, &v38);
        goto LABEL_56;
      default:
        std::string::size_type v21 = v46.__r_.__value_.__r.__words[0];
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string((uint64_t)v45, &v40);
        std::string v37 = v46;
        std::string::basic_string[abi:sn180100]<0>(&v35.__r_.__value_.__l.__data_, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message((uint64_t)v43, 0x10u, (uint64_t)&v35, &v36);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&v37, (uint64_t)&v36, (nlohmann::detail::exception *)&v38);
        int v20 = ((uint64_t (*)(uint64_t (***)(void **, uint64_t), std::string::size_type, std::string *, std::exception *))v32[12])(&v32, v21, &v40, &v38);
LABEL_56:
        int v16 = v20;
        v38.__vftable = (std::exception_vtbl *)&unk_1F1059AE8;
        MEMORY[0x1BA9BC6A0](v39);
        std::exception::~exception(&v38);
        goto LABEL_57;
    }
  }
}

- (BOOL)parseURL:(id)a3 error:(id *)a4
{
  v19[18] = *(void **)MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v10 = &unk_1F10599B8;
  v11 = self;
  id v12 = WeakRetained;
  id v7 = [v5 path];
  [v7 fileSystemRepresentation];
  std::ifstream::basic_ifstream(v14);

  uint64_t v8 = *(void *)&v15[*(void *)(v14[0] - 24) + 24];
  v13[0] = v14;
  v13[1] = v8;
  v13[2] = 0;
  v13[3] = 0;
  v17[3] = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::input_stream_adapter>((uint64_t)v13, (uint64_t)v17, 1, (uint64_t)v18);
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~lexer(v19);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](v18);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](v17);
  if (v13[0]) {
    std::ios_base::clear((std::ios_base *)(v13[0] + *(void *)(*(void *)v13[0] - 24)), *(_DWORD *)(v13[0] + *(void *)(*(void *)v13[0] - 24) + 32) & 2);
  }
  v14[0] = *MEMORY[0x1E4FBA3F8];
  *(uint64_t *)((char *)v14 + *(void *)(v14[0] - 24)) = *(void *)(MEMORY[0x1E4FBA3F8] + 24);
  MEMORY[0x1BA9BC700](v15);
  std::istream::~istream();
  MEMORY[0x1BA9BC770](&v16);

  return 1;
}

- (BOOL)parseFileHandle:(id)a3 error:(id *)a4
{
  v22[18] = *(void **)MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = &unk_1F10599B8;
  int v14 = self;
  id v15 = WeakRetained;
  LODWORD(self) = [v5 fileDescriptor];
  std::streambuf::basic_streambuf();
  int v18 = (int)self;
  __sb[0] = &unk_1F1059A40;
  __sb[2] = v19;
  __sb[3] = v19;
  __sb[4] = v19;
  v9[0] = MEMORY[0x1E4FBA450] + 24;
  v9[1] = 0;
  v10.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E4FBA450] + 64);
  std::ios_base::init(&v10, __sb);
  uint64_t v11 = 0;
  int v12 = -1;
  uint64_t v7 = *(std::streamsize *)((char *)&v10.__width_ + *(void *)(v9[0] - 24));
  v16[0] = v9;
  v16[1] = v7;
  v16[2] = 0;
  v16[3] = 0;
  v20[3] = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::input_stream_adapter>((uint64_t)v16, (uint64_t)v20, 1, (uint64_t)v21);
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::input_stream_adapter>::~lexer(v22);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](v21);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:sn180100](v20);
  if (v16[0]) {
    std::ios_base::clear((std::ios_base *)(v16[0] + *(void *)(*(void *)v16[0] - 24)), *(_DWORD *)(v16[0] + *(void *)(*(void *)v16[0] - 24) + 32) & 2);
  }
  std::istream::~istream();
  std::streambuf::~streambuf();

  return 1;
}

- (WBSJSONReaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSJSONReaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end