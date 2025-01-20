@interface NSMutableURLRequest
- (BOOL)s3_encryptAESWithPlaintext:(id)a3 ciphertext:(id *)a4 key:(id *)a5 iv:(id *)a6;
- (id)AWSCanonicalizedResourceWithBucket:(id)a3 FileName:(id)a4;
- (id)AWSStringToSignWithHTTPVerb:(id)a3 contentMD5:(id)a4 contentType:(id)a5 date:(id)a6 canonicalizedResource:(id)a7;
- (id)_formatHTTPDate:(id)a3;
- (id)_secureRandomOfLength:(unint64_t)a3;
- (id)s3_decryptAESWithCiphertext:(id)a3 key:(id)a4 iv:(id)a5;
- (id)s3_encryptPlaintext:(id)a3;
- (void)s3_setS3HeadersWithContent:(id)a3 accessConfig:(id)a4;
@end

@implementation NSMutableURLRequest

- (id)_formatHTTPDate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDateFormat:@"E, d MMM yyyy HH:mm:ss zzz"];
  v5 = [v4 stringFromDate:v3];

  return v5;
}

- (id)AWSCanonicalizedResourceWithBucket:(id)a3 FileName:(id)a4
{
  return +[NSString stringWithFormat:@"/%@/%@", a3, a4];
}

- (id)AWSStringToSignWithHTTPVerb:(id)a3 contentMD5:(id)a4 contentType:(id)a5 date:(id)a6 canonicalizedResource:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  v14 = [(NSMutableURLRequest *)self _formatHTTPDate:a6];
  v15 = +[NSString stringWithFormat:@"%@\n\n%@\n%@\n%@", v13, v12, v14, v11];

  return v15;
}

- (id)_secureRandomOfLength:(unint64_t)a3
{
  +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:");
  id v4 = objc_claimAutoreleasedReturnValue();
  SecRandomCopyBytes(kSecRandomDefault, a3, [v4 mutableBytes]);

  return v4;
}

- (BOOL)s3_encryptAESWithPlaintext:(id)a3 ciphertext:(id *)a4 key:(id *)a5 iv:(id *)a6
{
  id v10 = a3;
  +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", (char *)[v10 length] + 16);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  size_t v19 = 0;
  *a6 = [(NSMutableURLRequest *)self _secureRandomOfLength:16];
  id v11 = [(NSMutableURLRequest *)self _secureRandomOfLength:16];
  *a5 = v11;
  id v12 = [v11 bytes];
  id v13 = [*a6 bytes];
  id v14 = v10;
  id v15 = [v14 bytes];
  id v16 = [v14 length];

  CCCryptorStatus v17 = CCCrypt(0, 0, 1u, v12, 0x10uLL, v13, v15, (size_t)v16, [*a4 mutableBytes], (size_t)[*a4 length], &v19);
  if (!v17) {
    [*a4 setLength:v19];
  }
  return v17 == 0;
}

- (id)s3_decryptAESWithCiphertext:(id)a3 key:(id)a4 iv:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", [v9 length]);
  size_t v22 = 0;
  id v11 = v8;
  id v12 = [v11 bytes];

  id v13 = v7;
  id v14 = [v13 bytes];

  id v15 = v9;
  id v16 = [v15 bytes];
  id v17 = [v15 length];

  id v18 = v10;
  CCCryptorStatus v19 = CCCrypt(1u, 0, 1u, v12, 0x10uLL, v14, v16, (size_t)v17, [v18 mutableBytes], (size_t)[v18 length], &v22);
  id v20 = 0;
  if (!v19)
  {
    [v18 setLength:v22];
    id v20 = v18;
  }

  return v20;
}

- (id)s3_encryptPlaintext:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  id v23 = 0;
  id v24 = 0;
  id v22 = 0;
  [(NSMutableURLRequest *)self s3_encryptAESWithPlaintext:v4 ciphertext:&v24 key:&v23 iv:&v22];
  id v5 = v24;
  id v6 = v23;
  id v7 = v22;
  CFDataRef v8 = (const __CFData *)[objc_alloc((Class)NSData) initWithBase64EncodedString:@"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" options:0];
  id v9 = SecCertificateCreateWithData(0, v8);
  id v10 = SecCertificateCopyKey(v9);
  id v11 = +[NSMutableData dataWithLength:SecKeyGetBlockSize(v10)];
  size_t cipherTextLen = 0;
  id v12 = v6;
  id v13 = (const uint8_t *)[v12 bytes];
  id v14 = [v12 length];
  id v15 = v11;
  uint64_t v16 = SecKeyEncrypt(v10, 2u, v13, (size_t)v14, (uint8_t *)[v15 mutableBytes], &cipherTextLen);
  NSLog(@"the encrypted things with key [%@] iv [%@]!! result:%d", v12, v7, v16);
  CFRelease(v10);
  [v15 setLength:cipherTextLen];
  id v17 = objc_opt_new();
  [v17 appendData:v15];
  NSLog(@"write publicKeyBuffer %lu", [v15 length]);
  [v17 appendData:v7];
  NSLog(@"write iv %lu", [v7 length]);
  [v17 appendData:v5];
  id v18 = [v5 length];

  NSLog(@"write ciphertext %lu", v18);
  CCCryptorStatus v19 = [v17 base64EncodedStringWithOptions:0];

  return v19;
}

- (void)s3_setS3HeadersWithContent:(id)a3 accessConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFDataRef v8 = [v6 gzipContent];
  id v9 = v8;
  if (!v8)
  {
    id v9 = [v6 content];
  }
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v9 length]);
  [(NSMutableURLRequest *)self setValue:v10 forHTTPHeaderField:@"Content-Length"];

  if (!v8) {
  id v11 = [v6 mimeType];
  }
  [(NSMutableURLRequest *)self setValue:v11 forHTTPHeaderField:@"Content-Type"];

  id v12 = [v6 gzipContent];
  if (v12)
  {
    [(NSMutableURLRequest *)self setHTTPBody:v12];
  }
  else
  {
    id v13 = [v6 content];
    [(NSMutableURLRequest *)self setHTTPBody:v13];
  }
  [(NSMutableURLRequest *)self setHTTPMethod:@"PUT"];
  id v14 = objc_opt_new();
  id v15 = [v6 bucket];
  uint64_t v16 = [v6 filename];
  v29 = [(NSMutableURLRequest *)self AWSCanonicalizedResourceWithBucket:v15 FileName:v16];

  id v17 = [v6 mimeType];
  id v18 = [(NSMutableURLRequest *)self AWSStringToSignWithHTTPVerb:@"PUT" contentMD5:0 contentType:v17 date:v14 canonicalizedResource:v29];

  id v19 = [v7 AWSSecretAccessKey];
  id v20 = [v19 UTF8String];
  v21 = [v7 AWSSecretAccessKey];
  id v22 = [v21 lengthOfBytesUsingEncoding:4];
  id v23 = v18;
  CCHmac(0, v20, (size_t)v22, [v23 UTF8String], (size_t)[v23 lengthOfBytesUsingEncoding:4], macOut);

  id v24 = +[NSData dataWithBytes:macOut length:20];
  v25 = [v24 base64EncodedStringWithOptions:0];

  v26 = [v7 AWSAccessKeyID];

  v27 = +[NSString stringWithFormat:@"AWS %@:%@", v26, v25];

  [(NSMutableURLRequest *)self setValue:v27 forHTTPHeaderField:@"Authorization"];
  v28 = [(NSMutableURLRequest *)self _formatHTTPDate:v14];
  [(NSMutableURLRequest *)self setValue:v28 forHTTPHeaderField:@"Date"];
}

@end