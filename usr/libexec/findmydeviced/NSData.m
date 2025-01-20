@interface NSData
+ (NSData)dataWithHexString:(id)a3;
+ (NSData)dataWithMACAddressString:(id)a3;
- (NSData)initWithBase64EncodedString:(id)a3;
- (id)base64EncodedString;
- (id)defaultCipherWithError:(id *)a3;
- (id)hexString;
- (id)randomBytesWithLength:(unint64_t)a3 error:(id *)a4;
- (void)decryptWithCipher:(id)a3 completion:(id)a4;
- (void)encryptWithcompletion:(id)a3;
@end

@implementation NSData

+ (NSData)dataWithHexString:(id)a3
{
  v3 = +[NSString sanitizedHexString:a3];
  if ([v3 length])
  {
    v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10023D1FC((uint64_t)v3, v9);
    }

    v5 = 0;
  }
  else
  {
    __int16 v12 = 0;
    v4 = [v3 lowercaseString];

    v5 = objc_opt_new();
    int v6 = [v4 length];
    if (v6 >= 2)
    {
      uint64_t v7 = 0;
      int v8 = v6 - 1;
      do
      {
        __str[0] = [v4 characterAtIndex:v7];
        __str[1] = [v4 characterAtIndex:v7 + 1];
        HIBYTE(v12) = strtol(__str, 0, 16);
        [v5 appendBytes:(char *)&v12 + 1 length:1];
        v7 += 2;
      }
      while (v8 > (int)v7);
    }
    v3 = v4;
  }

  return (NSData *)v5;
}

+ (NSData)dataWithMACAddressString:(id)a3
{
  v3 = +[NSString sanitizedHexString:a3];
  if ([v3 length] == (id)12)
  {
    v4 = +[NSData dataWithHexString:v3];
  }
  else
  {
    v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10023D274((uint64_t)v3, v5);
    }

    v4 = 0;
  }

  return (NSData *)v4;
}

- (id)base64EncodedString
{
  return [(NSData *)self base64EncodedStringWithOptions:0];
}

- (NSData)initWithBase64EncodedString:(id)a3
{
  return [(NSData *)self initWithBase64EncodedString:a3 options:0];
}

- (id)hexString
{
  +[NSMutableString stringWithCapacity:2 * [(NSData *)self length]];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000332E0;
  v6[3] = &unk_1002DA5F8;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v7;
  [(NSData *)self enumerateByteRangesUsingBlock:v6];
  v4 = +[NSString stringWithString:v3];

  return v4;
}

- (void)encryptWithcompletion:(id)a3
{
  v4 = (void (**)(id, id, void *, void *))a3;
  id v33 = 0;
  v5 = [(NSData *)self defaultCipherWithError:&v33];
  id v6 = v33;
  id v7 = v6;
  id v8 = 0;
  if (v5 && !v6)
  {
    v9 = [v5 initializationVector];
    [v9 length];

    v10 = [v5 initializationVector];
    v11 = [v5 key];
    [v11 length];

    __int16 v12 = [v5 key];
    NSUInteger v13 = [(NSData *)self length];
    v14 = self;
    v15 = +[NSMutableData dataWithLength:v13];
    uint64_t v16 = qword_10031CCB0;
    v17 = +[NSMutableData dataWithLength:qword_10031CCB0];
    id v32 = v12;
    [v32 bytes];
    id v31 = v10;
    [v31 bytes];
    v18 = v14;
    [(NSData *)v18 bytes];

    id v8 = v15;
    id v19 = [v8 mutableBytes];
    id v20 = v17;
    id v30 = [v20 mutableBytes];
    uint64_t v21 = CCCryptorGCMOneshotEncrypt();
    if (v21)
    {
      uint64_t v22 = v21;
      id v7 = +[NSError errorWithDomain:@"kFMDEncryptableErrorDomain", 2, 0, v13, v19, v30, v16 code userInfo];
      v23 = sub_100004238();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10023D64C(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    else
    {
      [v5 setTag:v20, v13, v19, v30, v16];
      id v7 = 0;
    }
  }
  if (v4) {
    v4[2](v4, v8, v5, v7);
  }
}

- (void)decryptWithCipher:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v35 = (void (**)(id, id, id, void *))a4;
  id v7 = [v6 initializationVector];
  [v7 length];

  id v8 = [v6 initializationVector];
  v9 = [v6 key];
  [v9 length];

  v10 = [v6 key];
  NSUInteger v11 = [(NSData *)self length];
  __int16 v12 = self;
  NSUInteger v13 = [v6 tag];
  id v14 = [v13 length];

  v15 = [v6 tag];
  uint64_t v16 = +[NSMutableData dataWithLength:v11];
  id v34 = v10;
  [v34 bytes];
  id v33 = v8;
  [v33 bytes];
  v17 = v12;
  [(NSData *)v17 bytes];

  id v18 = v16;
  id v19 = [v18 mutableBytes];
  id v20 = v15;
  id v32 = [v20 bytes];
  id v31 = v19;
  uint64_t v21 = CCCryptorGCMOneshotDecrypt();
  if (v21)
  {
    uint64_t v22 = v21;
    v23 = sub_100004238();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10023D6B8(v22, v23, v24, v25, v26, v27, v28, v29);
    }

    id v30 = +[NSError errorWithDomain:@"kFMDEncryptableErrorDomain", 3, 0, v11, v31, v32, v14 code userInfo];
  }
  else
  {
    id v30 = 0;
  }
  if (v35) {
    v35[2](v35, v18, v6, v30);
  }
}

- (id)defaultCipherWithError:(id *)a3
{
  v5 = objc_alloc_init(FMDOneShotCipher);
  id v12 = 0;
  id v6 = [(NSData *)self randomBytesWithLength:qword_10031CCB8 error:&v12];
  id v7 = v12;
  [(FMDOneShotCipher *)v5 setInitializationVector:v6];

  if (v7)
  {
    if (a3)
    {
LABEL_3:
      id v7 = v7;
      id v8 = 0;
      *a3 = v7;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  id v11 = 0;
  v9 = [(NSData *)self randomBytesWithLength:qword_10031CCC0 error:&v11];
  id v7 = v11;
  [(FMDOneShotCipher *)v5 setKey:v9];

  if (v7)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_6:
    id v8 = 0;
    goto LABEL_8;
  }
  id v8 = v5;
LABEL_8:

  return v8;
}

- (id)randomBytesWithLength:(unint64_t)a3 error:(id *)a4
{
  +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:");
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t Bytes = CCRandomGenerateBytes([v6 mutableBytes], a3);
  if (Bytes)
  {
    uint64_t v8 = Bytes;
    v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10023D724(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = +[NSError errorWithDomain:@"kFMDEncryptableErrorDomain" code:1 userInfo:0];
    v17 = v16;
    if (a4) {
      *a4 = v16;
    }

    id v18 = 0;
  }
  else
  {
    id v18 = v6;
  }

  return v18;
}

@end