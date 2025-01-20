@interface CSHealthWrapEncryptor
- (BOOL)_appendEncryptedBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)_finalizeCryptorWithError:(id *)a3;
- (BOOL)_startCryptorWithError:(id *)a3;
- (BOOL)_updateCryptorWithData:(id)a3 error:(id *)a4;
- (BOOL)_updateHeaderWithKey:(id)a3 iv:(id)a4 hmacKey:(id)a5 error:(id *)a6;
- (BOOL)_writeStream:(const char *)a3 length:(unint64_t)a4 hash:(BOOL)a5 error:(id *)a6;
- (BOOL)appendData:(id)a3 error:(id *)a4;
- (BOOL)finalizeWithError:(id *)a3;
- (BOOL)startWithError:(id *)a3;
- (CSHealthWrapEncryptor)initWithOutputStream:(id)a3 certificate:(__SecCertificate *)a4 algorithm:(unsigned int)a5 options:(unsigned int)a6 keySize:(unsigned int)a7 uuid:(id)a8 studyUUID:(id)a9 compressionEnabled:(BOOL)a10;
- (__SecKey)_copyAndVerifyPublicKeyFromCertificate:(__SecCertificate *)a3 error:(id *)a4;
- (id)_encryptData:(id)a3 withCertificate:(__SecCertificate *)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation CSHealthWrapEncryptor

- (CSHealthWrapEncryptor)initWithOutputStream:(id)a3 certificate:(__SecCertificate *)a4 algorithm:(unsigned int)a5 options:(unsigned int)a6 keySize:(unsigned int)a7 uuid:(id)a8 studyUUID:(id)a9 compressionEnabled:(BOOL)a10
{
  id v16 = a3;
  id v17 = a8;
  id v18 = a9;
  v24.receiver = self;
  v24.super_class = (Class)CSHealthWrapEncryptor;
  v19 = [(CSHealthWrapEncryptor *)&v24 init];
  if (v19)
  {
    if (!a4)
    {
      v21 = +[NSAssertionHandler currentHandler];
      [v21 handleFailureInMethod:a2, v19, @"CSHealthWrapEncryptor.m", 60, @"Invalid parameter not satisfying: %@", @"certificate != NULL" object file lineNumber description];
    }
    objc_storeStrong((id *)&v19->_outputStream, a3);
    v19->_certificate = (__SecCertificate *)CFRetain(a4);
    v19->_algorithm = a5;
    v19->_options = a6;
    v19->_keySize = a7;
    v19->_cryptor = 0;
    objc_storeStrong((id *)&v19->_uuid, a8);
    objc_storeStrong((id *)&v19->_studyUUID, a9);
    v19->_hmacAlgorithm = 2;
    v19->_encryptedBytesCount = 0;
    v19->_compressionEnabled = a10;
  }

  return v19;
}

- (void)dealloc
{
  certificate = self->_certificate;
  if (certificate)
  {
    CFRelease(certificate);
    self->_certificate = 0;
  }
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CSHealthWrapEncryptor;
  [(CSHealthWrapEncryptor *)&v5 dealloc];
}

- (__SecKey)_copyAndVerifyPublicKeyFromCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CSHealthWrapEncryptor.m", 88, @"Invalid parameter not satisfying: %@", @"certificate != NULL" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v11 = +[NSAssertionHandler currentHandler];
  [v11 handleFailureInMethod:a2, self, @"CSHealthWrapEncryptor.m", 89, @"Invalid parameter not satisfying: %@", @"error != NULL" object file lineNumber description];

LABEL_3:
  v8 = SecCertificateCopyKey(a3);
  if (!v8) {
    +[CSHealthWrapErrorHelper assignError:a4 code:1 format:@"No public key found in certificate"];
  }
  return v8;
}

- (id)_encryptData:(id)a3 withCertificate:(__SecCertificate *)a4 error:(id *)a5
{
  CFDataRef v9 = (const __CFData *)a3;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_14:
    id v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CSHealthWrapEncryptor.m", 107, @"Invalid parameter not satisfying: %@", @"certificate != NULL" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v15 = +[NSAssertionHandler currentHandler];
  [v15 handleFailureInMethod:a2, self, @"CSHealthWrapEncryptor.m", 106, @"Invalid parameter not satisfying: %@", @"data != nil" object file lineNumber description];

  if (!a4) {
    goto LABEL_14;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_15:
  id v17 = +[NSAssertionHandler currentHandler];
  [v17 handleFailureInMethod:a2, self, @"CSHealthWrapEncryptor.m", 108, @"Invalid parameter not satisfying: %@", @"error != NULL" object file lineNumber description];

LABEL_4:
  v10 = [(CSHealthWrapEncryptor *)self _copyAndVerifyPublicKeyFromCertificate:a4 error:a5];
  if (v10)
  {
    v11 = v10;
    CFErrorRef error = 0;
    CFDataRef v12 = SecKeyCreateEncryptedData(v10, kSecKeyAlgorithmRSAEncryptionOAEPSHA1, v9, &error);
    CFDataRef v13 = v12;
    if (a5 && !v12) {
      *a5 = error;
    }
    CFRelease(v11);
  }
  else
  {
    CFDataRef v13 = 0;
  }

  return v13;
}

- (BOOL)_updateHeaderWithKey:(id)a3 iv:(id)a4 hmacKey:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_11:
    v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2, self, @"CSHealthWrapEncryptor.m", 135, @"Invalid parameter not satisfying: %@", @"iv != nil" object file lineNumber description];

    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  v20 = +[NSAssertionHandler currentHandler];
  [v20 handleFailureInMethod:a2, self, @"CSHealthWrapEncryptor.m", 134, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

  if (!v12) {
    goto LABEL_11;
  }
LABEL_3:
  if (a6) {
    goto LABEL_4;
  }
LABEL_12:
  v22 = +[NSAssertionHandler currentHandler];
  [v22 handleFailureInMethod:a2, self, @"CSHealthWrapEncryptor.m", 136, @"Invalid parameter not satisfying: %@", @"error != NULL" object file lineNumber description];

LABEL_4:
  v14 = +[GPBMessage message];
  [v14 setKey:v11];
  [v14 setIv:v12];
  v15 = [v14 data];
  id v16 = [(CSHealthWrapEncryptor *)self _encryptData:v15 withCertificate:self->_certificate error:a6];

  if (v16)
  {
    [(CSHWProtoMessageHeader *)self->_header setEncryptedMessageKey:v16];
    id v17 = [(CSHealthWrapEncryptor *)self _encryptData:v13 withCertificate:self->_certificate error:a6];
    BOOL v18 = v17 != 0;
    if (v17) {
      [(CSHWProtoMessageHeader *)self->_header setEncryptedHmackey:v17];
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)_startCryptorWithError:(id *)a3
{
  self->_encryptedBytesCount = 0;
  CCCryptorRef cryptorRef = 0;
  objc_super v5 = +[NSMutableData dataWithLength:16];
  id v6 = [v5 length];
  id v7 = v5;
  if (!SecRandomCopyBytes(kSecRandomDefault, (size_t)v6, [v7 mutableBytes]))
  {
    CFDataRef v9 = +[NSMutableData dataWithLength:self->_keySize];
    size_t keySize = self->_keySize;
    id v11 = v9;
    if (SecRandomCopyBytes(kSecRandomDefault, keySize, [v11 mutableBytes]))
    {
      +[CSHealthWrapErrorHelper assignError:a3, 1, @"Key generation: %d", *__error() code format];
      BOOL v8 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v12 = +[NSMutableData dataWithLength:32];
    if (SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, [v12 mutableBytes]))
    {
      +[CSHealthWrapErrorHelper assignError:a3, 1, @"HMAC key generation: %d", *__error() code format];
    }
    else if ([(CSHealthWrapEncryptor *)self _updateHeaderWithKey:v11 iv:v7 hmacKey:v12 error:a3])
    {
      CCHmacInit((CCHmacContext *)&self->_hmacContext, self->_hmacAlgorithm, [v12 bytes], 0x20uLL);
      id v13 = v7;
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, [v13 bytes], (size_t)[v13 length]);
      v14 = [(CSHWProtoMessageHeader *)self->_header studyUuid];
      if ([v14 length])
      {
        id v15 = v14;
        CCHmacUpdate((CCHmacContext *)&self->_hmacContext, [v15 bytes], (size_t)[v15 length]);
      }
      unsigned int data = bswap32([(CSHWProtoMessageHeader *)self->_header trailingHmaclength]);
      unsigned int v18 = bswap32([(CSHWProtoMessageHeader *)self->_header trailingShalength]);
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &data, 4uLL);
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &v18, 4uLL);
      uint64_t v16 = CCCryptorCreate(0, self->_algorithm, self->_options, [v11 bytes], self->_keySize, [v13 bytes], &cryptorRef);
      BOOL v8 = v16 == 0;
      if (v16) {
        +[CSHealthWrapErrorHelper assignError:a3, 1, @"cryptor create: %d", v16 code format];
      }
      else {
        self->_cryptor = cryptorRef;
      }

      goto LABEL_13;
    }
    BOOL v8 = 0;
LABEL_13:

    goto LABEL_14;
  }
  +[CSHealthWrapErrorHelper assignError:a3, 1, @"IV generation: %d", *__error() code format];
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (BOOL)startWithError:(id *)a3
{
  CC_SHA256_Init(&self->_sha256Context);
  objc_super v5 = +[GPBMessage message];
  header = self->_header;
  self->_header = v5;

  [(CSHWProtoMessageHeader *)self->_header setVersion:3];
  v17[0] = 0;
  v17[1] = 0;
  [(NSUUID *)self->_uuid getUUIDBytes:v17];
  id v7 = +[NSData dataWithBytes:v17 length:16];
  [(CSHWProtoMessageHeader *)self->_header setUploadUuid:v7];

  [(NSUUID *)self->_studyUUID getUUIDBytes:v17];
  BOOL v8 = +[NSData dataWithBytes:v17 length:16];
  [(CSHWProtoMessageHeader *)self->_header setStudyUuid:v8];

  [(CSHWProtoMessageHeader *)self->_header setTrailingHmaclength:32];
  [(CSHWProtoMessageHeader *)self->_header setTrailingShalength:32];
  [(CSHWProtoMessageHeader *)self->_header setCompressed:self->_compressionEnabled];
  CFDataRef v9 = +[NSMutableData dataWithLength:0x2000];
  buffer = self->_buffer;
  self->_buffer = v9;

  if (self->_buffer && self->_header)
  {
    CFDataRef v11 = SecCertificateCopyData(self->_certificate);
    if (v11)
    {
      [(CSHWProtoMessageHeader *)self->_header setEncryptionIdentity:v11];
      if ([(CSHealthWrapEncryptor *)self _startCryptorWithError:a3])
      {
        id v12 = [(GPBMessage *)self->_header data];
        unsigned int v16 = bswap32([v12 length]);
        if ([(CSHealthWrapEncryptor *)self _writeStream:&v16 length:4 hash:1 error:a3])
        {
          id v13 = v12;
          BOOL v14 = [[self _writeStream:length:hash:error:][v13 bytes], objc_msgSend(v13, "length"), 1, a3];
        }
        else
        {
          BOOL v14 = 0;
        }

        goto LABEL_12;
      }
    }
    else
    {
      +[CSHealthWrapErrorHelper assignError:a3 code:1 format:@"Could not copy certificate"];
    }
    BOOL v14 = 0;
LABEL_12:

    return v14;
  }
  +[CSHealthWrapErrorHelper assignError:a3 code:1 format:@"Could not allocate buffer or header"];
  return 0;
}

- (BOOL)_writeStream:(const char *)a3 length:(unint64_t)a4 hash:(BOOL)a5 error:(id *)a6
{
  unint64_t v7 = a4;
  BOOL v8 = a3;
  if (a5)
  {
    if (a4 >= 0xFFFFFFFF) {
      sub_100325328();
    }
    CC_SHA256_Update(&self->_sha256Context, a3, a4);
  }
  if (!v7) {
    return 1;
  }
  while (1)
  {
    uint64_t v10 = [(NSOutputStream *)self->_outputStream write:v8 maxLength:v7];
    if (v10 <= 0) {
      break;
    }
    BOOL v11 = v7 >= v10;
    v7 -= v10;
    if (!v11) {
      sub_100325354();
    }
    v8 += v10;
    if (!v7) {
      return 1;
    }
  }
  if (!a6) {
    return 0;
  }
  id v13 = [(NSOutputStream *)self->_outputStream streamError];
  BOOL result = 0;
  *a6 = v13;
  return result;
}

- (BOOL)_appendEncryptedBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  CCHmacUpdate((CCHmacContext *)&self->_hmacContext, a3, a4);
  self->_encryptedBytesCount += a4;

  return [(CSHealthWrapEncryptor *)self _writeStream:a3 length:a4 hash:1 error:a5];
}

- (BOOL)_updateCryptorWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = (char *)[v6 length];
  id v8 = v6;
  CFDataRef v9 = (char *)[v8 bytes];
  if ([v8 length])
  {
    unint64_t v10 = 0;
    while (1)
    {
      size_t v11 = (unint64_t)&v7[-v10] >= 0x1FF0 ? 8176 : (size_t)&v7[-v10];
      size_t dataOutMoved = 0;
      uint64_t v12 = CCCryptorUpdate(self->_cryptor, &v9[v10], v11, [(NSMutableData *)self->_buffer mutableBytes], 0x2000uLL, &dataOutMoved);
      if (v12) {
        break;
      }
      if (dataOutMoved)
      {
        id v13 = [(NSMutableData *)self->_buffer bytes];
        if (![(CSHealthWrapEncryptor *)self _appendEncryptedBytes:v13 length:dataOutMoved error:a4])goto LABEL_12; {
      }
        }
      v10 += v11;
      if (v10 >= (unint64_t)[v8 length]) {
        goto LABEL_10;
      }
    }
    +[CSHealthWrapErrorHelper assignError:a4, 1, @"crpytor update: %d", v12 code format];
LABEL_12:
    BOOL v14 = 0;
  }
  else
  {
LABEL_10:
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)_finalizeCryptorWithError:(id *)a3
{
  size_t dataOutMoved = 0;
  uint64_t v5 = CCCryptorFinal(self->_cryptor, [(NSMutableData *)self->_buffer mutableBytes], 0x2000uLL, &dataOutMoved);
  if (v5)
  {
    +[CSHealthWrapErrorHelper assignError:a3, 1, @"crpytor update: %d", v5 code format];
    LOBYTE(v6) = 0;
  }
  else if (!dataOutMoved {
         || (id v7 = [(NSMutableData *)self->_buffer bytes],
  }
             BOOL v6 = [(CSHealthWrapEncryptor *)self _appendEncryptedBytes:v7 length:dataOutMoved error:a3]))
  {
    unint64_t data = bswap64(self->_encryptedBytesCount);
    CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &data, 8uLL);
    LOBYTE(v6) = [(CSHealthWrapEncryptor *)self _writeStream:&data length:8 hash:1 error:a3];
  }
  return v6;
}

- (BOOL)appendData:(id)a3 error:(id *)a4
{
  return [(CSHealthWrapEncryptor *)self _updateCryptorWithData:a3 error:a4];
}

- (BOOL)finalizeWithError:(id *)a3
{
  BOOL v5 = -[CSHealthWrapEncryptor _finalizeCryptorWithError:](self, "_finalizeCryptorWithError:");
  if (v5)
  {
    CCHmacFinal((CCHmacContext *)&self->_hmacContext, macOut);
    BOOL v5 = [(CSHealthWrapEncryptor *)self _writeStream:macOut length:32 hash:1 error:a3];
    if (v5)
    {
      CC_SHA256_Final(md, &self->_sha256Context);
      LOBYTE(v5) = [(CSHealthWrapEncryptor *)self _writeStream:md length:32 hash:0 error:a3];
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_buffer, 0);

  objc_storeStrong((id *)&self->_outputStream, 0);
}

@end