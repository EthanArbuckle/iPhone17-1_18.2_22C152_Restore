@interface PRSharingSessionHelper
+ (basic_string<char,)UIntToHexString:(std::allocator<char>> *__return_ptr)retstr len:;
+ (id)HexStringToNSDataMac:(const void *)a3;
+ (id)NSDataMacToUUID:(id)a3;
+ (id)ProxToString:(int64_t)a3;
+ (id)UUIDStringToNSDataMac:(const void *)a3 len:(unint64_t)a4;
+ (id)UUIDToNSDataMac:(id)a3 len:(unint64_t)a4;
+ (id)convertMacStringToNSData:(const void *)a3;
+ (id)reverseNSData:(id)a3;
+ (int)ProxToCoarseRange:(int64_t)a3;
+ (int64_t)CoarseRangeToProx:(int)a3;
+ (unint64_t)NSDataToUInt64:(id)a3;
@end

@implementation PRSharingSessionHelper

+ (id)NSDataMacToUUID:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PRSharingSessionHelper.mm", 19, @"Invalid parameter not satisfying: %@", @"mac" object file lineNumber description];
  }
  v9[0] = 0;
  v9[1] = 0;
  objc_msgSend(v5, "getBytes:length:", v9, objc_msgSend(v5, "length"));
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v9];

  return v6;
}

+ (id)UUIDToNSDataMac:(id)a3 len:(unint64_t)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PRSharingSessionHelper.mm", 29, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  if (a4 <= 8)
  {
    v11[0] = 0;
    v11[1] = 0;
    [v7 getUUIDBytes:v11];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v11 length:a4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)UUIDStringToNSDataMac:(const void *)a3 len:(unint64_t)a4
{
  id v5 = a3;
  if ((*((char *)a3 + 23) & 0x80000000) == 0)
  {
    v6 = 0;
    if (!a4 || !*((unsigned char *)a3 + 23)) {
      goto LABEL_9;
    }
LABEL_8:
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v5, objc_msgSend(NSString, "defaultCStringEncoding"));
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    v6 = +[PRSharingSessionHelper UUIDToNSDataMac:v8 len:a4];

    goto LABEL_9;
  }
  v6 = 0;
  if (a4 && *((void *)a3 + 1))
  {
    id v5 = *(const void **)a3;
    goto LABEL_8;
  }
LABEL_9:
  return v6;
}

+ (id)HexStringToNSDataMac:(const void *)a3
{
  if (*((char *)a3 + 23) < 0)
  {
    if (*((void *)a3 + 1)) {
      BOOL v6 = (*((void *)a3 + 1) & 1) == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (!v6) {
      goto LABEL_12;
    }
    id v5 = *(char **)a3;
  }
  else
  {
    if (*((unsigned char *)a3 + 23)) {
      BOOL v4 = (*((unsigned char *)a3 + 23) & 1) == 0;
    }
    else {
      BOOL v4 = 0;
    }
    if (!v4)
    {
LABEL_12:
      id v7 = 0;
      goto LABEL_19;
    }
    id v5 = (char *)a3;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, v5);
  unint64_t v8 = std::stoull(&__p, 0, 16);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  unint64_t v13 = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  unint64_t v10 = *((unsigned __int8 *)a3 + 23);
  if ((v10 & 0x80u) != 0) {
    unint64_t v10 = *((void *)a3 + 1);
  }
  id v7 = (void *)[v9 initWithBytes:&v13 length:v10 >> 1];
LABEL_19:
  return v7;
}

+ (basic_string<char,)UIntToHexString:(std::allocator<char>> *__return_ptr)retstr len:
{
  uint64_t v2 = v1;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v11);
  *(_DWORD *)((char *)&v12[1] + *(void *)(v12[0] - 24)) |= 0x4000u;
  v10.__r_.__value_.__s.__data_[0] = 48;
  BOOL v4 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v12, (char *)&v10);
  uint64_t v5 = *v4;
  *(uint64_t *)((char *)v4 + *(void *)(*v4 - 24) + 24) = 2 * (int)v2;
  *(_DWORD *)((char *)v4 + *(void *)(v5 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  std::stringbuf::str();
  unint64_t v6 = 2 * v2;
  if (*((char *)&retstr->var0.var0.var0.var1 + 23) < 0)
  {
    unint64_t var1 = retstr->var0.var0.var0.var1.var1;
    if (var1 <= v6) {
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t var1 = *((unsigned __int8 *)&retstr->var0.var0.var0.var1 + 23);
    if (v6 >= var1) {
      goto LABEL_8;
    }
  }
  std::string::basic_string(&v10, (const std::string *)retstr, var1 - v6, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v15);
  if (*((char *)&retstr->var0.var0.var0.var1 + 23) < 0) {
    operator delete(retstr->var0.var0.var0.var1.var0);
  }
  retstr->var0.var0 = (__rep)v10;
LABEL_8:
  v11[0] = *MEMORY[0x1E4FBA408];
  uint64_t v8 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v11 + *(void *)(v11[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v12[0] = v8;
  v12[1] = MEMORY[0x1E4FBA470] + 16;
  if (v13 < 0) {
    operator delete((void *)v12[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)MEMORY[0x19F3B9590](&v14);
}

+ (unint64_t)NSDataToUInt64:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    std::string v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PRSharingSessionHelper.mm", 79, @"Invalid parameter not satisfying: %@", @"inData" object file lineNumber description];
  }
  unint64_t v11 = 0;
  unint64_t v6 = [v5 length];
  if (v6 >= 8) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = v6;
  }
  [v5 getBytes:&v11 length:v7];
  unint64_t v8 = v11;

  return v8;
}

+ (id)convertMacStringToNSData:(const void *)a3
{
  uint64_t v3 = *((unsigned __int8 *)a3 + 23);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *((void *)a3 + 1);
  }
  if (v3 == 36) {
    +[PRSharingSessionHelper UUIDStringToNSDataMac:len:](PRSharingSessionHelper, "UUIDStringToNSDataMac:len:");
  }
  else {
  BOOL v4 = +[PRSharingSessionHelper HexStringToNSDataMac:](PRSharingSessionHelper, "HexStringToNSDataMac:");
  }
  return v4;
}

+ (id)reverseNSData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PRSharingSessionHelper.mm", 103, @"Invalid parameter not satisfying: %@", @"inData" object file lineNumber description];
  }
  id v6 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithData:v5];
  unint64_t v7 = [v6 mutableBytes];
  uint64_t v8 = [v6 length];
  id v9 = (unsigned char *)(v7 + v8 - 1);
  if (v8) {
    BOOL v10 = (unint64_t)v9 > v7;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    unint64_t v11 = v7 + 1;
    do
    {
      char v12 = *(unsigned char *)(v11 - 1);
      *(unsigned char *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:v6];

  return v14;
}

+ (int)ProxToCoarseRange:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return dword_19E02CD68[a3];
  }
}

+ (id)ProxToString:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"immediate";
  }
  else {
    return off_1E5999D50[a3];
  }
}

+ (int64_t)CoarseRangeToProx:(int)a3
{
  if (a3 > 3) {
    return 4;
  }
  else {
    return qword_19E02CD80[a3];
  }
}

@end