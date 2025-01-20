@interface _ICDBackgroundTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithType:(int64_t)a3 configuration:(id)a4;
- (BOOL)isEqual:(id)a3;
- (ICConnectionConfiguration)configuration;
- (NSString)name;
- (_ICDBackgroundTask)initWithCoder:(id)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ICDBackgroundTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)name
{
  return self->_name;
}

- (_ICDBackgroundTask)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"config"];

  v7 = +[_ICDBackgroundTask taskWithType:v5 configuration:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_ICDBackgroundTask type](self, "type"), @"type");
  id v5 = [(_ICDBackgroundTask *)self configuration];
  [v4 encodeObject:v5 forKey:@"config"];
}

- (id)description
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_ICDBackgroundTask *)a3;
  if (self == v4)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(_ICDBackgroundTask *)v4 name];
      v6 = [(_ICDBackgroundTask *)self name];
      unsigned __int8 v7 = [v5 isEqualToString:v6];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)taskWithType:(int64_t)a3 configuration:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(_ICDBackgroundTask);
  v6->_type = a3;
  unsigned __int8 v7 = (ICConnectionConfiguration *)[v5 copy];
  configuration = v6->_configuration;
  v6->_configuration = v7;

  v9 = [v5 userIdentity];
  id v10 = [v9 accountDSID];
  long long v73 = 0u;
  long long v72 = 0u;
  long long v71 = 0u;
  long long v70 = 0u;
  long long v69 = 0u;
  long long v68 = 0u;
  long long v67 = 0u;
  memset(&v66, 0, sizeof(v66));
  CC_SHA1_Init(&v66);
  id v11 = v10;
  CC_SHA1_Update(&v66, [v11 UTF8String], (CC_LONG)objc_msgSend(v11, "length"));

  memset(&v74[8], 0, 64);
  *(void *)v74 = 4001;
  CC_SHA1_Final(&v74[8], &v66);
  v75[0] = *(_OWORD *)v74;
  v75[1] = *(_OWORD *)&v74[16];
  v75[2] = *(_OWORD *)&v74[32];
  v75[3] = *(_OWORD *)&v74[48];
  uint64_t v76 = *(void *)&v74[64];
  if (*(uint64_t *)v74 > 3999)
  {
    if (*(uint64_t *)v74 > 4255)
    {
      if (*(void *)v74 == 4256)
      {
        v53 = (unsigned __int8 *)v75 + 8;
        v54 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v55 = v54;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v57 = *v53++;
          v58 = &v54[i];
          char *v58 = a0123456789abcd[(unint64_t)v57 >> 4];
          v58[1] = a0123456789abcd[v57 & 0xF];
        }
        id v24 = objc_alloc((Class)NSString);
        v25 = v55;
        uint64_t v26 = 64;
      }
      else
      {
        if (*(void *)v74 != 4512) {
          goto LABEL_52;
        }
        v31 = (unsigned __int8 *)v75 + 8;
        v32 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v33 = v32;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v35 = *v31++;
          v36 = &v32[j];
          char *v36 = a0123456789abcd[(unint64_t)v35 >> 4];
          v36[1] = a0123456789abcd[v35 & 0xF];
        }
        id v24 = objc_alloc((Class)NSString);
        v25 = v33;
        uint64_t v26 = 128;
      }
    }
    else if (*(void *)v74 == 4000)
    {
      v43 = (unsigned __int8 *)v75 + 8;
      v44 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v45 = v44;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v47 = *v43++;
        v48 = &v44[k];
        char *v48 = a0123456789abcd[(unint64_t)v47 >> 4];
        v48[1] = a0123456789abcd[v47 & 0xF];
      }
      id v24 = objc_alloc((Class)NSString);
      v25 = v45;
      uint64_t v26 = 32;
    }
    else
    {
      if (*(void *)v74 != 4001) {
        goto LABEL_52;
      }
      v18 = (unsigned __int8 *)v75 + 8;
      v19 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v20 = v19;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v22 = *v18++;
        v23 = &v19[m];
        char *v23 = a0123456789abcd[(unint64_t)v22 >> 4];
        v23[1] = a0123456789abcd[v22 & 0xF];
      }
      id v24 = objc_alloc((Class)NSString);
      v25 = v20;
      uint64_t v26 = 40;
    }
LABEL_45:
    CFStringRef v42 = (CFStringRef)[v24 initWithBytesNoCopy:v25 length:v26 encoding:4 freeWhenDone:1];
    goto LABEL_46;
  }
  if (*(uint64_t *)v74 > 2999)
  {
    if (*(void *)v74 == 3000)
    {
      LODWORD(v77[0]) = bswap32(DWORD2(v75[0]));
      v49 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v50 = 0;
      v51 = v49 + 1;
      do
      {
        unint64_t v52 = *((unsigned __int8 *)v77 + v50);
        *(v51 - 1) = a0123456789abcd[v52 >> 4];
        unsigned char *v51 = a0123456789abcd[v52 & 0xF];
        v51 += 2;
        ++v50;
      }
      while (v50 != 4);
      id v24 = objc_alloc((Class)NSString);
      v25 = v49;
      uint64_t v26 = 8;
    }
    else
    {
      if (*(void *)v74 != 3001) {
        goto LABEL_52;
      }
      v77[0] = bswap64(*((unint64_t *)&v75[0] + 1));
      v27 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v28 = 0;
      v29 = v27 + 1;
      do
      {
        unint64_t v30 = *((unsigned __int8 *)v77 + v28);
        *(v29 - 1) = a0123456789abcd[v30 >> 4];
        unsigned char *v29 = a0123456789abcd[v30 & 0xF];
        v29 += 2;
        ++v28;
      }
      while (v28 != 8);
      id v24 = objc_alloc((Class)NSString);
      v25 = v27;
      uint64_t v26 = 16;
    }
    goto LABEL_45;
  }
  if (*(void *)v74 == 1000)
  {
    uint64_t v37 = *((void *)&v75[0] + 1);
    v38 = (char *)v78 + 1;
    uint64_t quot = *((void *)&v75[0] + 1);
    do
    {
      lldiv_t v40 = lldiv(quot, 10);
      uint64_t quot = v40.quot;
      if (v40.rem >= 0) {
        LOBYTE(v41) = v40.rem;
      }
      else {
        uint64_t v41 = -v40.rem;
      }
      *(v38 - 2) = v41 + 48;
      v17 = (const UInt8 *)(v38 - 2);
      --v38;
    }
    while (v40.quot);
    if (v37 < 0)
    {
      *(v38 - 2) = 45;
      v17 = (const UInt8 *)(v38 - 2);
    }
    v16 = (char *)((char *)v78 - (char *)v17);
    goto LABEL_35;
  }
  if (*(void *)v74 == 2000)
  {
    uint64_t v12 = DWORD2(v75[0]);
    v13 = v78;
    do
    {
      ldiv_t v14 = ldiv(v12, 10);
      uint64_t v12 = v14.quot;
      if (v14.rem >= 0) {
        LOBYTE(v15) = v14.rem;
      }
      else {
        uint64_t v15 = -v14.rem;
      }
      *((unsigned char *)v13 - 1) = v15 + 48;
      v13 = (void *)((char *)v13 - 1);
    }
    while (v14.quot);
    v16 = (char *)((char *)v78 - (char *)v13);
    v17 = (const UInt8 *)v13;
LABEL_35:
    CFStringRef v42 = CFStringCreateWithBytes(0, v17, (CFIndex)v16, 0x8000100u, 0);
LABEL_46:
    v59 = (__CFString *)v42;
    goto LABEL_47;
  }
LABEL_52:
  v64 = +[NSAssertionHandler currentHandler];
  v65 = +[NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
  [v64 handleFailureInFunction:v65 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

  v59 = &stru_1001BF9F0;
LABEL_47:

  CFStringRef v60 = @"com.apple.itunescloudd.deferredPushUpdate.jalisco";
  if (!a3) {
    CFStringRef v60 = @"com.apple.itunescloudd.deferredPushUpdate.saga";
  }
  uint64_t v61 = +[NSString stringWithFormat:@"%@.%@", v60, v59];
  name = v6->_name;
  v6->_name = (NSString *)v61;

  return v6;
}

@end