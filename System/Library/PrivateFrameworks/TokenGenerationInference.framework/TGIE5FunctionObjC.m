@interface TGIE5FunctionObjC
- (BOOL)isEqual:(id)a3;
- (NSString)adapterType;
- (NSString)name;
- (TGIE5Function)e5Function;
- (TGIE5FunctionObjC)initWithName:(id)a3 queryLength:(int64_t)a4 contextSize:(int64_t)a5 adapterType:(id)a6;
- (id)description;
- (int64_t)contextSize;
- (int64_t)queryLength;
- (unint64_t)hash;
@end

@implementation TGIE5FunctionObjC

- (TGIE5FunctionObjC)initWithName:(id)a3 queryLength:(int64_t)a4 contextSize:(int64_t)a5 adapterType:(id)a6
{
  v27[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = (__CFString *)a6;
  v25.receiver = self;
  v25.super_class = (Class)TGIE5FunctionObjC;
  v12 = [(TGIE5FunctionObjC *)&v25 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_queryLength = a4;
    v12->_contextSize = a5;
    uint64_t v15 = [(__CFString *)v11 copy];
    adapterType = v12->_adapterType;
    v12->_adapterType = (NSString *)v15;

    v27[0] = v10;
    v26[0] = @"name";
    v26[1] = @"queryLength";
    v17 = [NSNumber numberWithInteger:a4];
    v27[1] = v17;
    v26[2] = @"contextSize";
    uint64_t v18 = [NSNumber numberWithInteger:a5];
    v19 = (void *)v18;
    v26[3] = @"adapterType";
    v20 = @"nil";
    if (v11) {
      v20 = v11;
    }
    v27[2] = v18;
    v27[3] = v20;
    v21 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
    uint64_t v22 = [v21 description];
    description = v12->_description;
    v12->_description = (NSString *)v22;
  }
  return v12;
}

- (TGIE5Function)e5Function
{
  v2 = v1;
  __p.__r_.__value_.__s.__data_[0] = 0;
  char v10 = 0;
  v4 = [v1 adapterType];

  if (v4)
  {
    id v5 = [v2 adapterType];
    v8 = (std::string::value_type *)[v5 UTF8String];
    std::optional<std::string>::operator=[abi:ne180100]<char const*,void>(&__p, &v8);
  }
  id v6 = [v2 name];
  std::string::basic_string[abi:ne180100]<0>(retstr, (char *)[v6 UTF8String]);
  LODWORD(retstr->var0.var0.var1.var0[0]) = [v2 queryLength];
  HIDWORD(retstr->var0.var0.var1.var0[0]) = [v2 contextSize];
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)&retstr->var0.var0.var1.var0[1], (long long *)&__p);

  if (v10)
  {
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  return result;
}

- (unint64_t)hash
{
  v3 = [(TGIE5FunctionObjC *)self name];
  uint64_t v4 = [v3 hash];

  int64_t v5 = [(TGIE5FunctionObjC *)self queryLength];
  int64_t v6 = [(TGIE5FunctionObjC *)self contextSize];
  v7 = [(TGIE5FunctionObjC *)self adapterType];
  unint64_t v8 = v5 ^ v4 ^ v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(TGIE5FunctionObjC *)self name];
    v7 = [v5 name];
    if ([v6 isEqual:v7]
      && (int64_t v8 = -[TGIE5FunctionObjC queryLength](self, "queryLength"), v8 == [v5 queryLength])
      && (int64_t v9 = -[TGIE5FunctionObjC contextSize](self, "contextSize"), v9 == [v5 contextSize]))
    {
      char v10 = [(TGIE5FunctionObjC *)self adapterType];
      v11 = [v5 adapterType];
      unint64_t v12 = v10;
      unint64_t v13 = v11;
      v14 = (void *)v13;
      if (v12 | v13)
      {
        if (!v12 || v13) {
          char v15 = [(id)v12 isEqual:v13];
        }
        else {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 1;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)queryLength
{
  return self->_queryLength;
}

- (int64_t)contextSize
{
  return self->_contextSize;
}

- (NSString)adapterType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapterType, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_description, 0);
}

@end