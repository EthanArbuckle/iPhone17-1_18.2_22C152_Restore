@interface SYSerializationSupport
+ (id)archiveDataFromData:(id)a3 formatIdentifier:(unsigned int)a4 majorVersion:(unsigned __int8)a5 minorVersion:(unsigned __int8)a6;
+ (id)archiveDataFromItemData:(id)a3;
+ (id)itemDataFromArchiveData:(id)a3 majorVersion:(int64_t *)a4 minorVersion:(int64_t *)a5 error:(id *)a6;
@end

@implementation SYSerializationSupport

+ (id)archiveDataFromItemData:(id)a3
{
  return (id)[a1 archiveDataFromData:a3 formatIdentifier:4034099561 majorVersion:1 minorVersion:3];
}

+ (id)archiveDataFromData:(id)a3 formatIdentifier:(unsigned int)a4 majorVersion:(unsigned __int8)a5 minorVersion:(unsigned __int8)a6
{
  id v11 = a3;
  unsigned int v19 = a4;
  unsigned __int8 v18 = a5;
  unsigned __int8 v17 = a6;
  if (!v11)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"SYSerializationSupport.m", 61, @"Invalid parameter not satisfying: %@", @"itemData" object file lineNumber description];
  }
  v12 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(v11, "length") + 8);
  [v12 appendBytes:&v19 length:4];
  [v12 appendBytes:&v18 length:1];
  [v12 appendBytes:&v17 length:1];
  __int16 v16 = 8;
  [v12 appendBytes:&v16 length:2];
  if ([v12 length] != 8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"SYSerializationSupport.m" lineNumber:81 description:@"Header size is wrong."];
  }
  [v12 appendData:v11];

  return v12;
}

+ (id)itemDataFromArchiveData:(id)a3 majorVersion:(int64_t *)a4 minorVersion:(int64_t *)a5 error:(id *)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if ((unint64_t)[v11 length] <= 7) {
    goto LABEL_7;
  }
  if ((unint64_t)[v11 length] <= 8)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:a1 file:@"SYSerializationSupport.m" lineNumber:103 description:@"Invalid data size"];
  }
  LODWORD(v24[0]) = 0;
  objc_msgSend(v11, "getBytes:range:", v24, 0, 4);
  if (LODWORD(v24[0]) != -260867735)
  {
LABEL_7:
    unsigned __int8 v17 = SYFormatErrorMalformed();
    int64_t v13 = 0;
    int64_t v12 = 0;
    goto LABEL_8;
  }
  __int16 v22 = 0;
  objc_msgSend(v11, "getBytes:range:", (char *)&v22 + 1, 4, 1);
  objc_msgSend(v11, "getBytes:range:", &v22, 5, 1);
  int64_t v12 = HIBYTE(v22);
  int64_t v13 = v22;
  if (HIBYTE(v22) >= 2uLL)
  {
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"Data format is a future or unsupported version: %ld.%ld.", HIBYTE(v22), v22);
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = v14;
    __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    unsigned __int8 v17 = [v15 errorWithDomain:@"com.apple.synapse" code:-123 userInfo:v16];

    goto LABEL_8;
  }
  LOWORD(v24[0]) = 0;
  objc_msgSend(v11, "getBytes:range:", v24, 6, 2);
  unint64_t v20 = LOWORD(v24[0]);
  if (LOWORD(v24[0]) < 8uLL || [v11 length] <= v20)
  {
    unsigned __int8 v17 = SYFormatErrorMalformed();
LABEL_8:
    unsigned __int8 v18 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  [v11 length];
  unsigned __int8 v18 = objc_msgSend(v11, "subdataWithRange:", 8, objc_msgSend(v11, "length") - 8);
  unsigned __int8 v17 = 0;
  if (a4) {
LABEL_9:
  }
    *a4 = v12;
LABEL_10:
  if (a5) {
    *a5 = v13;
  }
  if (a6) {
    *a6 = v17;
  }

  return v18;
}

@end