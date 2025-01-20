@interface SNNMILContext
+ (id)valueForIRListValueType:(const IRListValueType *)a3 name:()basic_string<char;
+ (id)valueForIRTensorValue:(const IRTensorValue *)a3;
+ (id)valueForIRTensorValueType:(const IRTensorValueType *)a3 name:()basic_string<char;
+ (id)valueForIRValue:(const IRValue *)a3;
+ (id)valueForIRValueType:(const IRValueType *)a3 name:()basic_string<char;
- (SNNMILContext)init;
- (SNNMILContext)initWithOpsetName:(id)a3;
- (basic_string<char,)opsetName;
- (const)platformOpset;
- (id).cxx_construct;
- (shared_ptr<MIL::MILContext>)context;
- (uint64_t)init;
- (unique_ptr<const)milValueForScalarWithBytes:(void *)a3 dataType:(unint64_t)a4;
- (unique_ptr<const)milValueForString:(id)a3;
- (unique_ptr<const)milValueForTensorBlobWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6;
- (unique_ptr<const)milValueForTensorWithBytes:(void *)a3 shape:(id)a4 dataType:(unint64_t)a5;
- (void)dealloc;
@end

@implementation SNNMILContext

- (SNNMILContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)SNNMILContext;
  v2 = [(SNNMILContext *)&v6 init];
  MIL::Opsets::Common::CreateMILContext(&v5, (MIL::Opsets::Common *)v2);
  std::shared_ptr<MIL::MILContext>::operator=[abi:ne180100]<MIL::MILContext,std::default_delete<MIL::MILContext>,void>(&v2->_context.__ptr_, &v5);
  uint64_t v3 = v5;
  uint64_t v5 = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  MEMORY[0x25A2B9FC0](&v2->_opsetName, "ios15");
  return v2;
}

- (SNNMILContext)initWithOpsetName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SNNMILContext;
  uint64_t v5 = [(SNNMILContext *)&v11 init];
  MIL::Opsets::Common::CreateMILContext((uint64_t *)&v9, (MIL::Opsets::Common *)v5);
  std::shared_ptr<MIL::MILContext>::operator=[abi:ne180100]<MIL::MILContext,std::default_delete<MIL::MILContext>,void>(&v5->_context.__ptr_, (uint64_t *)&v9);
  uint64_t v6 = v9;
  *(void *)&long long v9 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  if (v4)
  {
    [v4 cxxString];
  }
  else
  {
    long long v9 = 0uLL;
    uint64_t v10 = 0;
  }
  p_opsetName = (void **)&v5->_opsetName;
  if (*((char *)&v5->_opsetName.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(*p_opsetName);
  }
  *(_OWORD *)p_opsetName = v9;
  *((void *)&v5->_opsetName.__r_.__value_.var0.var1 + 2) = v10;

  return v5;
}

- (void)dealloc
{
  cntrl = self->_context.__cntrl_;
  self->_context.__ptr_ = 0;
  self->_context.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4.receiver = self;
  v4.super_class = (Class)SNNMILContext;
  [(SNNMILContext *)&v4 dealloc];
}

- (shared_ptr<MIL::MILContext>)context
{
  cntrl = self->_context.__cntrl_;
  SNNMILContext *v2 = self->_context.__ptr_;
  v2[1] = (MILContext *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (MILContext *)self;
  return result;
}

- (const)platformOpset
{
  return (const void *)MEMORY[0x270F48028](self->_context.__ptr_, &self->_opsetName);
}

- (unique_ptr<const)milValueForString:(id)a3
{
  objc_super v4 = v3;
  id v5 = a3;
  MIL::IRTensorValueType::MakeScalar();
  if (v5)
  {
    [v5 cxxString];
  }
  else
  {
    __p = 0;
    char v8 = 0;
  }
  MIL::IRTensorValueType::MakeStringValue();
  if (v8 < 0) {
    operator delete(__p);
  }
  *objc_super v4 = v9;

  return v6;
}

- (unique_ptr<const)milValueForTensorWithBytes:(void *)a3 shape:(id)a4 dataType:(unint64_t)a5
{
  uint64_t v9 = v5;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v10 = a4;
  __p = 0;
  v46 = 0;
  v47 = 0;
  v36 = v10;
  if (v10)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v12)
    {
      unint64_t v33 = a5;
      v34 = a3;
      v35 = v9;
      uint64_t v13 = *(void *)v42;
      unsigned int v14 = 1;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          int v17 = objc_msgSend(v16, "unsignedIntegerValue", v33, v34, v35);
          uint64_t v18 = MIL::IRConstantDimension::Make((MIL::IRConstantDimension *)self->_context.__ptr_, (MILContext *)[v16 unsignedIntegerValue]);
          uint64_t v19 = v18;
          v20 = v46;
          if (v46 >= v47)
          {
            uint64_t v22 = ((char *)v46 - (unsigned char *)__p) >> 3;
            if ((unint64_t)(v22 + 1) >> 61) {
              std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v23 = ((char *)v47 - (unsigned char *)__p) >> 2;
            if (v23 <= v22 + 1) {
              unint64_t v23 = v22 + 1;
            }
            if ((unint64_t)((char *)v47 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v24 = v23;
            }
            if (v24) {
              v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MIL::IRDimension const*>>((uint64_t)&v47, v24);
            }
            else {
              v25 = 0;
            }
            v26 = (uint64_t *)&v25[8 * v22];
            uint64_t *v26 = v19;
            v21 = v26 + 1;
            v28 = (char *)__p;
            v27 = (char *)v46;
            if (v46 != __p)
            {
              do
              {
                uint64_t v29 = *((void *)v27 - 1);
                v27 -= 8;
                *--v26 = v29;
              }
              while (v27 != v28);
              v27 = (char *)__p;
            }
            __p = v26;
            v46 = v21;
            v47 = (uint64_t *)&v25[8 * v24];
            if (v27) {
              operator delete(v27);
            }
          }
          else
          {
            uint64_t *v46 = v18;
            v21 = v20 + 1;
          }
          v14 *= v17;
          v46 = v21;
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v12);
      a3 = v34;
      uint64_t v9 = v35;
    }
    else
    {
      unsigned int v14 = 1;
    }
  }
  else
  {
    unsigned int v14 = 1;
  }
  if (v36) {
    uint64_t Scalar = MIL::IRTensorValueType::MakeWithShape();
  }
  else {
    uint64_t Scalar = MIL::IRTensorValueType::MakeScalar();
  }
  switch((*(unsigned int (**)(uint64_t))(*(void *)Scalar + 88))(Scalar))
  {
    case 2u:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<BOOL>::__init_with_size[abi:ne180100]<BOOL *,BOOL *>(&v38, a3, (unsigned char *)a3 + v14, v14);
      MIL::IRTensorValueType::MakeBoolValue();
      v31 = v38;
      *uint64_t v9 = v37;
      if (v31) {
        goto LABEL_48;
      }
      break;
    case 4u:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<MIL::Fp16>::__init_with_size[abi:ne180100]<MIL::Fp16*,MIL::Fp16*>(&v38, a3, (uint64_t)a3 + 2 * v14, v14);
      MIL::IRTensorValueType::MakeFloat16Value();
      goto LABEL_46;
    case 5u:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v38, a3, (uint64_t)a3 + 4 * v14, v14);
      MIL::IRTensorValueType::MakeFloat32Value();
      goto LABEL_46;
    case 6u:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v38, a3, (uint64_t)a3 + 8 * v14, v14);
      MIL::IRTensorValueType::MakeFloat64Value();
      goto LABEL_46;
    case 9u:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<signed char>::__init_with_size[abi:ne180100]<signed char *,signed char *>(&v38, a3, (uint64_t)a3 + v14, v14);
      MIL::IRTensorValueType::MakeInt8Value();
      goto LABEL_46;
    case 0xAu:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<short>::__init_with_size[abi:ne180100]<short *,short *>(&v38, a3, (uint64_t)a3 + 2 * v14, v14);
      MIL::IRTensorValueType::MakeInt16Value();
      goto LABEL_46;
    case 0xBu:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v38, a3, (uint64_t)a3 + 4 * v14, v14);
      MIL::IRTensorValueType::MakeInt32Value();
      goto LABEL_46;
    case 0xCu:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v38, a3, (uint64_t)a3 + 8 * v14, v14);
      MIL::IRTensorValueType::MakeInt64Value();
      goto LABEL_46;
    case 0xEu:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v38, a3, (uint64_t)a3 + v14, v14);
      MIL::IRTensorValueType::MakeUInt8Value();
      goto LABEL_46;
    case 0xFu:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(&v38, a3, (uint64_t)a3 + 2 * v14, v14);
      MIL::IRTensorValueType::MakeUInt16Value();
      goto LABEL_46;
    case 0x10u:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v38, a3, (uint64_t)a3 + 4 * v14, v14);
      MIL::IRTensorValueType::MakeUInt32Value();
      goto LABEL_46;
    case 0x11u:
      v38 = 0;
      v39 = 0;
      uint64_t v40 = 0;
      std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&v38, a3, (uint64_t)a3 + 8 * v14, v14);
      MIL::IRTensorValueType::MakeUInt64Value();
LABEL_46:
      v31 = v38;
      *uint64_t v9 = v37;
      if (v31)
      {
        v39 = v31;
LABEL_48:
        operator delete(v31);
      }
      break;
    default:
      *uint64_t v9 = 0;
      break;
  }
  if (__p)
  {
    v46 = (uint64_t *)__p;
    operator delete(__p);
  }

  return v32;
}

- (unique_ptr<const)milValueForScalarWithBytes:(void *)a3 dataType:(unint64_t)a4
{
  return (unique_ptr<const MIL::IRValue, std::default_delete<const MIL::IRValue>>)[(SNNMILContext *)self milValueForTensorWithBytes:a3 shape:0 dataType:a4];
}

- (unique_ptr<const)milValueForTensorBlobWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v37 = a3;
  id v9 = a4;
  id v36 = a6;
  v51 = 0;
  v52 = 0;
  v53 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(v10);
        }
        unsigned int v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        objc_msgSend(v14, "unsignedIntegerValue", v35);
        uint64_t v15 = MIL::IRConstantDimension::Make((MIL::IRConstantDimension *)self->_context.__ptr_, (MILContext *)[v14 unsignedIntegerValue]);
        uint64_t v16 = v15;
        int v17 = v52;
        if (v52 >= (uint64_t *)v53)
        {
          uint64_t v19 = ((char *)v52 - (unsigned char *)v51) >> 3;
          if ((unint64_t)(v19 + 1) >> 61) {
            std::vector<MIL::IRDimension const*>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v20 = (v53 - (unsigned char *)v51) >> 2;
          if (v20 <= v19 + 1) {
            unint64_t v20 = v19 + 1;
          }
          if ((unint64_t)(v53 - (unsigned char *)v51) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v20;
          }
          if (v21) {
            uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MIL::IRDimension const*>>((uint64_t)&v53, v21);
          }
          else {
            uint64_t v22 = 0;
          }
          unint64_t v23 = (uint64_t *)&v22[8 * v19];
          *unint64_t v23 = v16;
          uint64_t v18 = v23 + 1;
          v25 = (char *)v51;
          unint64_t v24 = (char *)v52;
          if (v52 != v51)
          {
            do
            {
              uint64_t v26 = *((void *)v24 - 1);
              v24 -= 8;
              *--unint64_t v23 = v26;
            }
            while (v24 != v25);
            unint64_t v24 = (char *)v51;
          }
          v51 = v23;
          v52 = v18;
          v53 = &v22[8 * v21];
          if (v24) {
            operator delete(v24);
          }
        }
        else
        {
          uint64_t *v52 = v15;
          uint64_t v18 = v17 + 1;
        }
        v52 = v18;
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v11);
  }

  MIL::IRTensorValueType::MakeWithShape();
  memset(v45, 0, sizeof(v45));
  int v46 = 1065353216;
  MIL::IRTensorValueType::MakeScalar();
  std::string::basic_string[abi:ne180100]<0>(&v42, "BLOBFILE");
  MIL::IRTensorValueType::MakeStringValue();
  std::string::basic_string[abi:ne180100]<0>(__p, "type");
  v54 = __p;
  v27 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v45, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v54);
  std::shared_ptr<MIL::IRValue const>::operator=[abi:ne180100]<MIL::IRTensorValue const,std::default_delete<MIL::IRTensorValue const>,void>((void *)v27 + 5, &v44);
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v28 = v44;
  uint64_t v44 = 0;
  if (v28) {
    (*(void (**)(uint64_t))(*(void *)v28 + 8))(v28);
  }
  if (v43 < 0) {
    operator delete(v42);
  }
  MIL::IRTensorValueType::MakeScalar();
  if (v37)
  {
    [v37 cxxString];
  }
  else
  {
    v38 = 0;
    char v39 = 0;
  }
  MIL::IRTensorValueType::MakeStringValue();
  std::string::basic_string[abi:ne180100]<0>(__p, "path");
  v54 = __p;
  uint64_t v29 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v45, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v54);
  std::shared_ptr<MIL::IRValue const>::operator=[abi:ne180100]<MIL::IRTensorValue const,std::default_delete<MIL::IRTensorValue const>,void>((void *)v29 + 5, &v44);
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v30 = v44;
  uint64_t v44 = 0;
  if (v30) {
    (*(void (**)(uint64_t))(*(void *)v30 + 8))(v30);
  }
  if (v39 < 0) {
    operator delete(v38);
  }
  uint64_t Scalar = (MIL::IRTensorValueType *)MIL::IRTensorValueType::MakeScalar();
  [v36 unsignedLongValue];
  MIL::IRTensorValueType::MakeUInt64Value(Scalar);
  std::string::basic_string[abi:ne180100]<0>(__p, "offset");
  v54 = __p;
  unique_ptr<const MIL::IRValue, std::default_delete<const MIL::IRValue>> v32 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v45, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v54);
  std::shared_ptr<MIL::IRValue const>::operator=[abi:ne180100]<MIL::IRTensorValue const,std::default_delete<MIL::IRTensorValue const>,void>((void *)v32 + 5, &v44);
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v33 = v44;
  uint64_t v44 = 0;
  if (v33) {
    (*(void (**)(uint64_t))(*(void *)v33 + 8))(v33);
  }
  MIL::IRTensorValueType::MakeValueFromFileProperties();
  void *v35 = __p[0];
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)v45);
  if (v51)
  {
    v52 = (uint64_t *)v51;
    operator delete(v51);
  }

  return v34;
}

+ (id)valueForIRTensorValueType:(const IRTensorValueType *)a3 name:()basic_string<char
{
  id v5 = (void *)[[NSString alloc] initWithCXXString:a4];
  unsigned int v6 = (*((uint64_t (**)(const IRTensorValueType *))a3->var0 + 11))(a3) - 2;
  if (v6 < 0x10 && ((0xF79Fu >> v6) & 1) != 0)
  {
    uint64_t v9 = qword_2576AB680[v6];
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFF940];
    MIL::IRDataTypeToString();
    if (v19 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    objc_msgSend(v7, "raise:format:", *MEMORY[0x263EFF4A0], @"Unsupported data type %s", p_p);
    if (v19 < 0) {
      operator delete(__p);
    }
    uint64_t v9 = 0;
  }
  id v10 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  uint64_t v11 = (*((uint64_t (**)(const IRTensorValueType *))a3->var0 + 12))(a3);
  uint64_t v12 = *(MIL::IRDimension ***)v11;
  uint64_t v13 = *(MIL::IRDimension ***)(v11 + 8);
  if (*(MIL::IRDimension ***)v11 != v13)
  {
    do
    {
      uint64_t v14 = MIL::IRDimension::AsConstant(*v12);
      uint64_t v15 = [NSNumber numberWithInt:(*(uint64_t (**)(uint64_t))(*(void *)v14 + 48))(v14)];
      [v10 addObject:v15];

      ++v12;
    }
    while (v12 != v13);
  }
  uint64_t v16 = [[SNNMILValueDescriptor alloc] initWithShape:v10 dataType:v9 name:v5];

  return v16;
}

+ (id)valueForIRListValueType:(const IRListValueType *)a3 name:()basic_string<char
{
  return 0;
}

+ (id)valueForIRValueType:(const IRValueType *)a3 name:()basic_string<char
{
  uint64_t v6 = (*((uint64_t (**)(const IRValueType *, SEL))a3->var0 + 3))(a3, a2);
  if (v6)
  {
    uint64_t v7 = v6;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      std::string::__init_copy_ctor_external(&value, a4->__r_.__value_.var0.var1.__data_, a4->__r_.__value_.var0.var1.__size_);
    }
    else {
      std::string value = (std::string)a4->__r_.__value_;
    }
    id v10 = +[SNNMILContext valueForIRTensorValueType:v7 name:&value];
    if ((SHIBYTE(value.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_15;
    }
    data = (char *)value.__r_.__value_.__r.__words[0];
  }
  else
  {
    uint64_t v8 = (*((uint64_t (**)(const IRValueType *))a3->var0 + 4))(a3);
    if (!v8)
    {
      (*((void (**)(const IRValueType *))a3->var0 + 5))(a3);
      (*((void (**)(const IRValueType *))a3->var0 + 6))(a3);
      id v10 = 0;
      goto LABEL_15;
    }
    uint64_t v9 = v8;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      std::string::__init_copy_ctor_external((std::string *)&__p, a4->__r_.__value_.var0.var1.__data_, a4->__r_.__value_.var0.var1.__size_);
    }
    else {
      __rep __p = a4->__r_.__value_;
    }
    id v10 = +[SNNMILContext valueForIRListValueType:v9 name:&__p];
    if ((*((char *)&__p.var0.var1 + 23) & 0x80000000) == 0) {
      goto LABEL_15;
    }
    data = __p.var0.var1.__data_;
  }
  operator delete(data);
LABEL_15:
  return v10;
}

+ (id)valueForIRTensorValue:(const IRTensorValue *)a3
{
  uint64_t v4 = (*((uint64_t (**)(const IRTensorValue *, SEL))a3->var0 + 4))(a3, a2);
  unsigned int v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 88))(v4) - 2;
  if (v5 < 0x10 && ((0xF79Fu >> v5) & 1) != 0)
  {
    uint64_t v53 = qword_2576AB680[v5];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF4A0];
    MIL::IRDataTypeToString();
    if (v61 >= 0) {
      uint64_t v8 = __p;
    }
    else {
      uint64_t v8 = (void **)__p[0];
    }
    objc_msgSend(v6, "raise:format:", v7, @"Unsupported data type %s", v8);
    if (v61 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v53 = 0;
  }
  uint64_t v9 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  uint64_t v10 = (*((uint64_t (**)(const IRTensorValue *))a3->var0 + 4))(a3);
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 96))(v10);
  uint64_t v13 = *(MIL::IRDimension ***)v11;
  uint64_t v12 = *(MIL::IRDimension ***)(v11 + 8);
  uint64_t v14 = 1;
  while (v13 != v12)
  {
    uint64_t v15 = MIL::IRDimension::AsConstant(*v13);
    uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 48))(v15);
    int v17 = [NSNumber numberWithInt:v16];
    [v9 addObject:v17];
    v14 *= (int)v16;

    ++v13;
  }
  if ((*((unsigned int (**)(const IRTensorValue *))a3->var0 + 10))(a3))
  {
    uint64_t v18 = (*((uint64_t (**)(const IRTensorValue *))a3->var0 + 11))(a3);
    std::unordered_map<std::string,std::shared_ptr<MIL::IRValue const>>::unordered_map((uint64_t)__p, v18);
    std::string::basic_string[abi:ne180100]<0>(v56, "type");
    v54[0] = v56;
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)v56, (uint64_t)&std::piecewise_construct, (long long **)v54);
    MIL::IRValue::GetScalar<std::string>();
    if (v57 < 0) {
      operator delete(v56[0]);
    }
    if (v59 < 0)
    {
      if (v58[1] != (void *)14) {
        goto LABEL_29;
      }
      char v19 = (void **)v58[0];
    }
    else
    {
      if (v59 != 14) {
        goto LABEL_29;
      }
      char v19 = v58;
    }
    unint64_t v24 = *v19;
    uint64_t v25 = *(uint64_t *)((char *)v19 + 6);
    if (v24 == (void *)0x4C4259434147454CLL && v25 == 0x454C4946424F4C42)
    {
      v31 = +[SNNLogging framework];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        +[SNNMILContext valueForIRTensorValue:](v31);
      }

      unint64_t v21 = 0;
      goto LABEL_38;
    }
LABEL_29:
    std::string::basic_string[abi:ne180100]<0>(v54, "path");
    v62 = v54;
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)v54, (uint64_t)&std::piecewise_construct, (long long **)&v62);
    MIL::IRValue::GetScalar<std::string>();
    if (v55 < 0) {
      operator delete(v54[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(v54, "offset");
    v62 = v54;
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)v54, (uint64_t)&std::piecewise_construct, (long long **)&v62);
    uint64_t v27 = MIL::IRValue::GetScalar<unsigned long long>();
    if (v55 < 0) {
      operator delete(v54[0]);
    }
    uint64_t v28 = [SNNMILBlobValue alloc];
    uint64_t v29 = (void *)[[NSString alloc] initWithCXXString:v56];
    uint64_t v30 = [NSNumber numberWithUnsignedLong:v27];
    unint64_t v21 = [(SNNMILBlobValue *)v28 initWithFilename:v29 shape:v9 dataType:v53 offset:v30];

    if (v57 < 0) {
      operator delete(v56[0]);
    }
LABEL_38:
    if (v59 < 0) {
      operator delete(v58[0]);
    }
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::IRValue const>>>>::~__hash_table((uint64_t)__p);
    goto LABEL_96;
  }
  uint64_t v20 = [v9 count];
  unint64_t v21 = 0;
  switch(v5)
  {
    case 0u:
      if (!v20)
      {
        int v46 = [NSNumber numberWithBool:MIL::IRValue::GetScalar<BOOL>()];
        long long v47 = [[SNNMILDataValue alloc] initWithScalar:v46 dataType:0];
        goto LABEL_95;
      }
      uint64_t Data = MIL::IRTensorValue::GetDataView<BOOL>();
      if (v14 != v23) {
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 314, "contiguousCount == dataView.Size()");
      }
      goto LABEL_80;
    case 1u:
      if (!v20)
      {
        id v51 = [NSString alloc];
        MIL::IRValue::GetScalar<std::string>();
        int v46 = (void *)[v51 initWithCXXString:__p];
        if (v61 < 0) {
          operator delete(__p[0]);
        }
        long long v47 = [[SNNMILDataValue alloc] initWithStringScalar:v46];
        goto LABEL_95;
      }
      char v41 = +[SNNLogging framework];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        +[SNNMILContext valueForIRTensorValue:](v41);
      }

LABEL_68:
      unint64_t v21 = 0;
      break;
    case 2u:
      break;
    case 3u:
      if (!v20)
      {
        long long v49 = NSNumber;
        MIL::IRValue::GetScalar<float>();
        int v46 = [v49 numberWithDouble:v50];
        long long v47 = [[SNNMILDataValue alloc] initWithScalar:v46 dataType:3];
        goto LABEL_95;
      }
      uint64_t Data = MIL::IRTensorValue::GetDataView<float>();
      if (v14 != v37) {
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 338, "contiguousCount == dataView.Size()");
      }
      goto LABEL_80;
    case 4u:
      if (!v20)
      {
        long long v48 = NSNumber;
        MIL::IRValue::GetScalar<double>();
        int v46 = objc_msgSend(v48, "numberWithDouble:");
        long long v47 = [[SNNMILDataValue alloc] initWithScalar:v46 dataType:4];
        goto LABEL_95;
      }
      uint64_t Data = MIL::IRTensorValue::GetDataView<double>();
      if (v14 != v33) {
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 326, "contiguousCount == dataView.Size()");
      }
      goto LABEL_80;
    case 7u:
      if (!v20)
      {
        int v46 = [NSNumber numberWithChar:MIL::IRValue::GetScalar<signed char>()];
        long long v47 = [[SNNMILDataValue alloc] initWithScalar:v46 dataType:5];
        goto LABEL_95;
      }
      uint64_t Data = MIL::IRTensorValue::GetDataView<signed char>();
      if (v14 != v35) {
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 402, "contiguousCount == dataView.Size()");
      }
      goto LABEL_80;
    case 8u:
      if (!v20)
      {
        int v46 = [NSNumber numberWithShort:MIL::IRValue::GetScalar<short>()];
        long long v47 = [[SNNMILDataValue alloc] initWithScalar:v46 dataType:6];
        goto LABEL_95;
      }
      uint64_t Data = MIL::IRTensorValue::GetDataView<short>();
      if (v14 != v42) {
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 414, "contiguousCount == dataView.Size()");
      }
      goto LABEL_80;
    case 9u:
      if (!v20)
      {
        int v46 = [NSNumber numberWithInteger:(int)MIL::IRValue::GetScalar<int>()];
        long long v47 = [[SNNMILDataValue alloc] initWithScalar:v46 dataType:7];
        goto LABEL_95;
      }
      uint64_t Data = MIL::IRTensorValue::GetDataView<int>();
      if (v14 != v43) {
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 426, "contiguousCount == dataView.Size()");
      }
      goto LABEL_80;
    case 0xAu:
      if (!v20)
      {
        int v46 = [NSNumber numberWithLong:MIL::IRValue::GetScalar<long long>()];
        long long v47 = [[SNNMILDataValue alloc] initWithScalar:v46 dataType:8];
        goto LABEL_95;
      }
      uint64_t Data = MIL::IRTensorValue::GetDataView<long long>();
      if (v14 != v45) {
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 438, "contiguousCount == dataView.Size()");
      }
      goto LABEL_80;
    case 0xCu:
      if (!v20)
      {
        int v46 = [NSNumber numberWithUnsignedChar:MIL::IRValue::GetScalar<unsigned char>()];
        long long v47 = [[SNNMILDataValue alloc] initWithScalar:v46 dataType:9];
        goto LABEL_95;
      }
      uint64_t Data = MIL::IRTensorValue::GetDataView<unsigned char>();
      if (v14 != v44) {
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 354, "contiguousCount == dataView.Size()");
      }
      goto LABEL_80;
    case 0xDu:
      if (!v20)
      {
        int v46 = [NSNumber numberWithUnsignedShort:MIL::IRValue::GetScalar<unsigned short>()];
        long long v47 = [[SNNMILDataValue alloc] initWithScalar:v46 dataType:10];
        goto LABEL_95;
      }
      uint64_t Data = MIL::IRTensorValue::GetDataView<unsigned short>();
      if (v14 != v32) {
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 366, "contiguousCount == dataView.Size()");
      }
      goto LABEL_80;
    case 0xEu:
      if (!v20)
      {
        int v46 = [NSNumber numberWithUnsignedInteger:MIL::IRValue::GetScalar<unsigned int>()];
        long long v47 = [[SNNMILDataValue alloc] initWithScalar:v46 dataType:11];
        goto LABEL_95;
      }
      uint64_t Data = MIL::IRTensorValue::GetDataView<unsigned int>();
      if (v14 != v36) {
        __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 378, "contiguousCount == dataView.Size()");
      }
      goto LABEL_80;
    case 0xFu:
      if (v20)
      {
        uint64_t Data = MIL::IRTensorValue::GetDataView<unsigned long long>();
        if (v14 != v34) {
          __assert_rtn("+[SNNMILContext valueForIRTensorValue:]", "SNNTypes.mm", 390, "contiguousCount == dataView.Size()");
        }
LABEL_80:
        unint64_t v21 = [[SNNMILDataValue alloc] initWithShape:v9 bytes:Data dataType:v53];
      }
      else
      {
        int v46 = [NSNumber numberWithUnsignedLong:MIL::IRValue::GetScalar<unsigned long long>()];
        long long v47 = [[SNNMILDataValue alloc] initWithScalar:v46 dataType:12];
LABEL_95:
        unint64_t v21 = v47;
      }
      break;
    default:
      id v38 = [NSString alloc];
      MIL::IRDataTypeToString();
      char v39 = (void *)[v38 initWithCXXString:__p];
      if (v61 < 0) {
        operator delete(__p[0]);
      }
      uint64_t v40 = +[SNNLogging framework];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        +[SNNMILContext valueForIRTensorValue:]((uint64_t)v39, v40);
      }

      goto LABEL_68;
  }
LABEL_96:

  return v21;
}

+ (id)valueForIRValue:(const IRValue *)a3
{
  uint64_t v4 = (*((uint64_t (**)(const IRValue *, SEL))a3->var0 + 5))(a3, a2);
  if (v4)
  {
    unsigned int v5 = +[SNNMILContext valueForIRTensorValue:v4];
  }
  else
  {
    unsigned int v5 = (MIL::IRListValue *)(*((uint64_t (**)(const IRValue *))a3->var0 + 6))(a3);
    if (v5)
    {
      uint64_t v6 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
      uint64_t Values = MIL::IRListValue::GetValues(v5);
      if (v8)
      {
        uint64_t v9 = (void *)Values;
        uint64_t v10 = 16 * v8;
        do
        {
          uint64_t v11 = +[SNNMILContext valueForIRValue:*v9];
          if (v11) {
            [v6 addObject:v11];
          }

          v9 += 2;
          v10 -= 16;
        }
        while (v10);
      }
      unsigned int v5 = [[SNNMILListValue alloc] initWithValues:v6];
    }
    else
    {
      (*((void (**)(const IRValue *))a3->var0 + 7))(a3);
      (*((void (**)(const IRValue *))a3->var0 + 8))(a3);
    }
  }
  return v5;
}

- (basic_string<char,)opsetName
{
  if (result[1].__r_.__value_.var0.var0.__data_[7] < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)retstr, *(const std::string::value_type **)&result->__r_.var0, result->var0);
  }
  else
  {
    *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.var0;
    *((void *)&retstr->__r_.__value_.var0.var1 + 2) = result[1].__r_.__value_.var0.var1.__data_;
  }
  return result;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_opsetName.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_opsetName.__r_.__value_.var0.var1.__data_);
  }
  cntrl = self->_context.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (uint64_t)init
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

+ (void)valueForIRTensorValue:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_257455000, log, OS_LOG_TYPE_ERROR, "Legacy weight files are not supported.", v1, 2u);
}

+ (void)valueForIRTensorValue:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
}

+ (void)valueForIRTensorValue:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
}

@end