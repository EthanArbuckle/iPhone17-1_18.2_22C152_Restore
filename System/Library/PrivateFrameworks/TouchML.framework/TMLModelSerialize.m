@interface TMLModelSerialize
+ (ProtobufCMessage)unpackData:(id)a3 withDescriptor:(const ProtobufCMessageDescriptor *)a4;
+ (id)decode:(id)a3;
+ (id)decodeZ85:(id)a3;
+ (id)pack:(const ProtobufCMessage *)a3;
+ (id)verifySignature:(id)a3;
@end

@implementation TMLModelSerialize

+ (id)pack:(const ProtobufCMessage *)a3
{
  CFIndex v4 = sub_23984B99C((uint64_t)a3);
  if (v4)
  {
    v10 = sub_23989120C;
    CFTypeRef cf = CFDataCreateMutable(0, v4);
    uint64_t v5 = sub_23984CF58((uint64_t)a3, (void (**)(void, void, void))&v10);
    v6 = (id)cf;
    objc_msgSend_setLength_(v6, v7, v8, v5, v10);
    CFRelease(cf);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (ProtobufCMessage)unpackData:(id)a3 withDescriptor:(const ProtobufCMessageDescriptor *)a4
{
  id v5 = a3;
  unint64_t v8 = objc_msgSend_length(v5, v6, v7);
  id v9 = v5;
  v12 = (char *)objc_msgSend_bytes(v9, v10, v11);

  return (ProtobufCMessage *)sub_23984DF34((uint64_t)a4, 0, v8, v12);
}

+ (id)decode:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend_length(v4, v5, v6)) {
    goto LABEL_12;
  }
  id v4 = v4;
  if (*(unsigned char *)objc_msgSend_bytes(v4, v7, v8))
  {
    id v11 = [NSString alloc];
    v14 = objc_msgSend_initWithData_encoding_(v11, v12, v13, v4, 5);
    if (objc_msgSend_hasPrefix_(v14, v15, v16, @"83847776"))
    {
      v19 = objc_msgSend_substringFromIndex_(v14, v17, v18, 8);
      v22 = objc_msgSend_decodeZ85_(a1, v20, v21, v19);
      objc_msgSend_verifySignature_(a1, v23, v24, v22);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v25 = 0;
    }

    goto LABEL_13;
  }
  uint64_t v26 = objc_msgSend_length(v4, v9, v10);
  v29 = objc_msgSend_subdataWithRange_(v4, v27, v28, 1, v26 - 1);
  v32 = objc_msgSend_verifySignature_(a1, v30, v31, v29);

  if (!v32)
  {
    id v4 = 0;
LABEL_12:
    id v25 = 0;
    goto LABEL_13;
  }
  id v25 = objc_msgSend_mutableCopy(v32, v33, v34);
  v37 = (unsigned char *)objc_msgSend_mutableBytes(v25, v35, v36);
  for (uint64_t i = objc_msgSend_length(v25, v38, v39); i; --i)
    *v37++ ^= 0x3Au;
  id v4 = v32;
LABEL_13:

  return v25;
}

+ (id)decodeZ85:(id)a3
{
  id v3 = a3;
  double v6 = (const char *)objc_msgSend_cStringUsingEncoding_(v3, v4, v5, 4);
  size_t v7 = strlen(v6);
  unint64_t v8 = v7 / 5;
  unint64_t v9 = 4 * (v7 / 5);
  unint64_t v10 = v7 % 5;
  v14 = objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v11, v12, v7 % 5 + v9);
  if (v7 >= 5)
  {
    uint64_t v17 = 0;
    if (v8 <= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v8;
    }
    v19 = v6;
    do
    {
      uint64_t v20 = 0;
      unsigned int v21 = 0;
      do
        unsigned int v21 = byte_23989EA60[v19[v20++]] + 85 * v21;
      while (v20 != 5);
      unsigned int v32 = bswap32(v21);
      objc_msgSend_replaceBytesInRange_withBytes_(v14, v13, v15, 4 * v17++, 4, &v32);
      v19 += 5;
    }
    while (v17 != v18);
    uint64_t v16 = 4 * v18;
    if (!v10) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (!v10) {
      goto LABEL_17;
    }
  }
  unsigned int v22 = 0;
  v23 = &v6[5 * v8];
  unint64_t v24 = v10;
  do
  {
    uint64_t v25 = *v23++;
    unsigned int v22 = byte_23989EA60[v25] + 85 * v22;
    --v24;
  }
  while (v24);
  double v27 = pow(85.0, (double)(5 - v10)) * (double)v22;
  unsigned int v28 = 0xFFFFFFu >> (8 * v10 - 16);
  if (v10 <= 1) {
    unsigned int v28 = 0;
  }
  unsigned int v31 = bswap32(v28 + v27);
  objc_msgSend_replaceBytesInRange_withBytes_(v14, v26, v27, v9, 4, &v31);
  uint64_t v16 = v10 + v16 - 1;
LABEL_17:
  v29 = objc_msgSend_subdataWithRange_(v14, v13, v15, 0, v16);

  return v29;
}

+ (id)verifySignature:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (qword_268A05968 != -1) {
    dispatch_once(&qword_268A05968, &unk_26ECEE4C8);
  }
  if (qword_268A05960
    && (id v4 = v3,
        size_t v7 = (const uint8_t *)objc_msgSend_bytes(v4, v5, v6),
        uint64_t v10 = objc_msgSend_length(v4, v8, v9),
        uint64_t v11 = v10 - 128,
        memset(v16, 0, sizeof(v16)),
        CC_SHA512(v7 + 128, v10 - 128, (unsigned __int8 *)v16),
        !SecKeyRawVerify((SecKeyRef)qword_268A05960, 0x8006u, (const uint8_t *)v16, 0x40uLL, v7, 0x80uLL)))
  {
    v14 = objc_msgSend_subdataWithRange_(v4, v12, v13, 128, v11);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end