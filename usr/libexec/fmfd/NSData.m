@interface NSData
- (id)decryptWithKey:(id)a3 error:(id *)a4;
- (id)encryptWithKey:(id)a3 error:(id *)a4;
@end

@implementation NSData

- (id)encryptWithKey:(id)a3 error:(id *)a4
{
  v6 = self;
  id v7 = a3;
  v31 = a4;
  if (SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, bytes))
  {
    v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10006D554(v8);
    }

    v9 = 0;
  }
  else
  {
    v9 = +[NSData dataWithBytes:bytes length:16];
  }
  v10 = +[NSMutableData dataWithLength:[(NSData *)v6 length]];
  v11 = +[NSMutableData dataWithLength:16];
  bytes[0] = 16;
  id v12 = v7;
  [v12 bytes];
  [v12 length];

  id v13 = v9;
  [v13 bytes];
  [v13 length];
  v14 = v6;
  id v15 = [(NSData *)v14 bytes];
  uint64_t v32 = (uint64_t)v14;
  id v16 = [(NSData *)v14 length];
  id v17 = v10;
  id v18 = [v17 mutableBytes];
  id v19 = v11;
  id v30 = [v19 mutableBytes];
  uint64_t v20 = CCCryptorGCM();
  if (!v20)
  {
    id v27 = [v13 length:v15, v16, v18, v30, bytes];
    v28 = (char *)[v17 length];
    v26 = +[NSMutableData dataWithCapacity:&v28[(void)v27 + 1 + bytes[0]]];
    v24 = +[NSMutableData dataWithLength:1];
    if (v24) {
      [v26 appendData:v24];
    }
    [v26 appendData:v13];
    [v26 appendData:v17];
    [v26 appendData:v19];
    v23 = (void *)v32;
    goto LABEL_14;
  }
  uint64_t v21 = v20;
  v22 = sub_100005560();
  v23 = (void *)v32;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10006D4DC(v32, v22);
  }

  if (v31)
  {
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    v24 = +[NSString stringWithFormat:@"CCCryptorGCM() encryption failed with status %d", v21, v16, v18, v30, bytes];
    v34 = v24;
    v25 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id *v31 = +[NSError errorWithDomain:@"Encoder" code:1 userInfo:v25];

    v26 = 0;
LABEL_14:

    goto LABEL_16;
  }
  v26 = 0;
LABEL_16:

  return v26;
}

- (id)decryptWithKey:(id)a3 error:(id *)a4
{
  v5 = self;
  id v6 = a3;
  NSUInteger v7 = [(NSData *)v5 length];
  v8 = -[NSData subdataWithRange:](v5, "subdataWithRange:", 1, 16);
  v9 = -[NSData subdataWithRange:](v5, "subdataWithRange:", 17, (uint64_t)((v7 << 32) - 0x2100000000) >> 32);
  -[NSData subdataWithRange:](v5, "subdataWithRange:", ((uint64_t)((v7 << 32) - 0x1100000000) >> 32) + 1, 16);
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  v10 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", [v9 length]);
  v11 = +[NSMutableData dataWithLength:16];
  uint64_t v36 = 16;
  id v12 = v6;
  [v12 bytes];
  [v12 length];

  id v13 = v8;
  [v13 bytes];
  v34 = v13;
  [v13 length];
  id v14 = v9;
  id v15 = [v14 bytes];
  id v16 = [v14 length];
  id v32 = v10;
  id v17 = [v32 mutableBytes];
  id v18 = v11;
  id v31 = [v18 mutableBytes];
  id v29 = v15;
  uint64_t v19 = CCCryptorGCM();
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = sub_100005560();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10006D5E4((uint64_t)v5, v21);
    }

    v22 = v35;
    if (!a4) {
      goto LABEL_10;
    }
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    v23 = +[NSString stringWithFormat:@"CCCryptorGCM() decryption failed with status %d", v20, v16, v17, v31, &v36];
    v42 = v23;
    v24 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    *a4 = +[NSError errorWithDomain:@"Decoder" code:1 userInfo:v24];

LABEL_9:
LABEL_10:
    v25 = 0;
    goto LABEL_11;
  }
  v22 = v35;
  v25 = a4;
  if (timingsafe_bcmp(objc_msgSend(v35, "bytes", v29, v16, v17, v31, &v36), objc_msgSend(objc_retainAutorelease(v18), "bytes"), 0x10uLL))
  {
    if (!a4)
    {
LABEL_11:
      v26 = v32;
      goto LABEL_12;
    }
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    CFStringRef v40 = @"CCCryptorGCM() decryption failed tag has been tempered with";
    v23 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1, v30);
    *a4 = +[NSError errorWithDomain:@"Decoder" code:1 userInfo:v23];
    goto LABEL_9;
  }
  v28 = sub_100005560();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@: Success decrypting....", buf, 0xCu);
  }

  v26 = v32;
  v25 = (id *)v32;
LABEL_12:

  return v25;
}

@end