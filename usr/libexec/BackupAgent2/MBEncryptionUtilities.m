@interface MBEncryptionUtilities
+ (id)decryptString:(id)a3 withKey:(id)a4 salt:(id)a5 error:(id *)a6;
+ (id)decryptToString:(id)a3 withKey:(id)a4 salt:(id)a5 error:(id *)a6;
+ (id)keyDataForKey:(id)a3 salt:(id)a4;
@end

@implementation MBEncryptionUtilities

+ (id)decryptToString:(id)a3 withKey:(id)a4 salt:(id)a5 error:(id *)a6
{
  v6 = +[MBEncryptionUtilities decryptString:a3 withKey:a4 salt:a5 error:a6];
  id v7 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];

  return v7;
}

+ (id)decryptString:(id)a3 withKey:(id)a4 salt:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [a1 keyDataForKey:a4 salt:a5];
  id v12 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v10 options:0];

  size_t dataOutMoved = 0;
  long long iv = xmmword_1000B0EB0;
  id v13 = v11;
  id v14 = [v13 bytes];
  id v15 = [v13 length];
  id v16 = v12;
  if (CCCrypt(1u, 0, 1u, v14, (size_t)v15, &iv, [v16 bytes], (size_t)objc_msgSend(v16, "length"), 0, 0, &dataOutMoved) == -4301|| !objc_msgSend(v16, "length"))
  {
    id v20 = objc_alloc((Class)NSMutableData);
    id v21 = [v20 initWithLength:dataOutMoved];
    id v22 = v13;
    id v23 = [v22 bytes];
    id v24 = [v22 length];
    id v25 = v16;
    id v26 = [v25 bytes];
    id v27 = [v25 length];
    id v19 = v21;
    id dataOut = [v19 mutableBytes];
    uint64_t v29 = CCCrypt(1u, 0, 1u, v23, (size_t)v24, &iv, v26, (size_t)v27, dataOut, dataOutMoved, &dataOutMoved);
    if (v29)
    {
      if (a6)
      {
        id v17 = +[MBError errorWithCode:1, @"Failed to encrypt data: %d", v29 format];
        id v18 = 0;
        goto LABEL_8;
      }
      id v18 = 0;
    }
    else
    {
      [v19 setLength:dataOutMoved];
      id v18 = v19;
      id v19 = v18;
    }
  }
  else
  {
    if (a6)
    {
      id v17 = +[MBError errorWithCode:1 format:@"CCCrypt was OK with a zero-length buffer? No. Just no."];
      id v18 = 0;
      id v19 = 0;
LABEL_8:
      *a6 = v17;
      goto LABEL_12;
    }
    id v18 = 0;
    id v19 = 0;
  }
LABEL_12:

  return v18;
}

+ (id)keyDataForKey:(id)a3 salt:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5 || (id v7 = v6) == 0) {
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:207 format:@"Key and salt must not be nil"]);
  }
  id v8 = [v5 mutableCopy];
  [v8 appendData:v7];
  v9 = +[MBDigest sha1ForData:v8];
  id v10 = [v9 subdataWithRange:0, 16];

  return v10;
}

@end