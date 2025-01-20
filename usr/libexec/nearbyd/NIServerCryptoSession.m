@interface NIServerCryptoSession
- (NIServerCryptoSession)initWithKeyDerivationKey:(id)a3 sessionIdentifier:(id)a4 encrypt:(BOOL)a5;
- (NSData)keyDerivationKey;
- (NSData)sessionIdentifier;
- (id)_deriveSessionKeyFromKeyDerivationKey:(id)a3 sessionIdentifier:(id)a4;
- (id)decrypt:(id)a3;
- (id)encrypt:(id)a3;
@end

@implementation NIServerCryptoSession

- (NIServerCryptoSession)initWithKeyDerivationKey:(id)a3 sessionIdentifier:(id)a4 encrypt:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v46.receiver = self;
  v46.super_class = (Class)NIServerCryptoSession;
  v11 = [(NIServerCryptoSession *)&v46 init];
  if (!v11) {
    goto LABEL_18;
  }
  if ([v9 length])
  {
    if ([v10 length])
    {
      objc_storeStrong((id *)&v11->_keyDerivationKey, a3);
      objc_storeStrong((id *)&v11->_sessionIdentifier, a4);
      uint64_t v12 = CUPrintNSObjectMasked();
      logIdentifier = v11->_logIdentifier;
      v11->_logIdentifier = (NSString *)v12;

      v11->_encrypt = v5;
      uint64_t v14 = [(NIServerCryptoSession *)v11 _deriveSessionKeyFromKeyDerivationKey:v9 sessionIdentifier:v10];
      sessionKey = v11->_sessionKey;
      v11->_sessionKey = (NSData *)v14;

      if (v11->_sessionKey)
      {
        if (v5)
        {
          v11->_nonce = arc4random_uniform(0xFFFF0000);
          v16 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v11->_logIdentifier;
            *(_DWORD *)buf = 138477827;
            v48 = v17;
            v18 = "#crypto,[%{private}@][Encryptor] initialized";
LABEL_17:
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
          }
        }
        else
        {
          v11->_nonce = 0;
          v16 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            v44 = v11->_logIdentifier;
            *(_DWORD *)buf = 138477827;
            v48 = v44;
            v18 = "#crypto,[%{private}@][Decryptor] initialized";
            goto LABEL_17;
          }
        }
LABEL_18:
        v43 = v11;
        goto LABEL_19;
      }
      v35 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100420508(v35, v36, v37, v38, v39, v40, v41, v42);
      }
    }
    else
    {
      v27 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_1004204D0(v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
  }
  else
  {
    v19 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100420498(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  v43 = 0;
LABEL_19:

  return v43;
}

- (id)encrypt:(id)a3
{
  id v4 = a3;
  if (!self->_encrypt)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100420540();
    }
    goto LABEL_23;
  }
  unint64_t nonce = self->_nonce;
  if (nonce >= 0xFFFFFFFF)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004205A8();
    }
    goto LABEL_23;
  }
  unint64_t v6 = nonce + 1;
  self->_unint64_t nonce = v6;
  int v29 = v6;
  CCCryptorRef cryptorRef = 0;
  CCCryptorStatus v7 = CCCryptorCreateWithMode(0, 0xCu, 0, 0x3E8u, 0, [(NSData *)self->_sessionKey bytes], [(NSData *)self->_sessionKey length], 0, 0, 0, 0, &cryptorRef);
  if (v7 || !cryptorRef)
  {
    v8 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)buf = 138478339;
      *(void *)&uint8_t buf[4] = logIdentifier;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v7;
      __int16 v34 = 1024;
      BOOL v35 = cryptorRef != 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#crypto,[%{private}@][Encryptor] create failed %d. Cryptor needs release: %d", buf, 0x18u);
    }
    if (!cryptorRef) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  [v4 length];
  if (CCCryptorAddParameter())
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100420818();
    }
LABEL_22:
    CCCryptorRelease(cryptorRef);
LABEL_23:
    id v9 = 0;
    goto LABEL_24;
  }
  if (CCCryptorAddParameter())
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004207B0();
    }
    goto LABEL_22;
  }
  if (CCCryptorAddParameter())
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100420748();
    }
    goto LABEL_22;
  }
  char v27 = 1;
  LOBYTE(v25) = 0;
  sub_1001B0664(buf, 5uLL, &v25);
  **(unsigned char **)buf = v27;
  *(_DWORD *)(*(void *)buf + 1) = v29;
  if (CCCryptorAddParameter())
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004206E0();
    }
    CCCryptorRelease(cryptorRef);
    id v9 = 0;
  }
  else
  {
    size_t OutputLength = CCCryptorGetOutputLength(cryptorRef, (size_t)[v4 length], 0);
    LOBYTE(__p) = 0;
    sub_1001B0664(&v25, OutputLength, &__p);
    size_t dataOutMoved = 0;
    v13 = cryptorRef;
    id v14 = v4;
    id v15 = [v14 bytes];
    id v16 = [v14 length];
    if (CCCryptorUpdate(v13, v15, (size_t)v16, v25, v26 - (unsigned char *)v25, &dataOutMoved))
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100420678();
      }
      CCCryptorRelease(cryptorRef);
      id v9 = 0;
    }
    else
    {
      if (dataOutMoved < v26 - (unsigned char *)v25) {
        sub_10021D2C0((unint64_t *)&v25, dataOutMoved);
      }
      v30[0] = 0;
      sub_1001B0664(&__p, 0x10uLL, v30);
      size_t v21 = 0;
      CCCryptorStatus v17 = CCCryptorFinal(cryptorRef, __p, v23 - (unsigned char *)__p, &v21);
      if (v17 || v21)
      {
        v18 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
        {
          v19 = self->_logIdentifier;
          *(_DWORD *)uint64_t v30 = 138478339;
          *(void *)&v30[4] = v19;
          *(_WORD *)&v30[12] = 1024;
          *(_DWORD *)&v30[14] = v17;
          __int16 v31 = 1024;
          int v32 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#crypto,[%{private}@][Encryptor] cryptor-final failed %d. Leftover: %d", v30, 0x18u);
        }
        CCCryptorRelease(cryptorRef);
        id v9 = 0;
      }
      else
      {
        LOBYTE(v20) = 0;
        sub_1001B0664(v30, 6uLL, &v20);
        uint64_t v20 = *(void *)&v30[8] - *(void *)v30;
        if (CCCryptorGetParameter())
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_100420610();
          }
          CCCryptorRelease(cryptorRef);
          id v9 = 0;
        }
        else
        {
          CCCryptorRelease(cryptorRef);
          id v9 = objc_opt_new();
          [v9 appendBytes:&v27 length:1];
          [v9 appendBytes:&v29 length:4];
          [v9 appendBytes:*(void *)v30 length:*(void *)&v30[8] - *(void *)v30];
          [v9 appendBytes:v25 length:v26 - (unsigned char *)v25];
        }
        if (*(void *)v30)
        {
          *(void *)&v30[8] = *(void *)v30;
          operator delete(*(void **)v30);
        }
      }
      if (__p)
      {
        uint64_t v23 = __p;
        operator delete(__p);
      }
    }
    if (v25)
    {
      uint64_t v26 = v25;
      operator delete(v25);
    }
  }
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
LABEL_24:

  return v9;
}

- (id)decrypt:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_encrypt)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100420CF4();
    }
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  char v31 = 0;
  if (![v4 length])
  {
    CCCryptorStatus v7 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100420880((uint64_t)self->_logIdentifier, (int)[v5 length], (uint64_t)&v41);
    }

    goto LABEL_15;
  }
  [v5 getBytes:&v31 range:0];
  if (v31 != 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100420C8C();
    }
    goto LABEL_15;
  }
  unsigned int v30 = 0;
  if ((unint64_t)[v5 length] <= 4)
  {
    unint64_t v6 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1004208C4((uint64_t)self->_logIdentifier, (int)[v5 length], (uint64_t)&v41);
    }

    goto LABEL_15;
  }
  [v5 getBytes:&v30 range:1];
  cryptorRef[1] = (CCCryptorRef)v30;
  LOBYTE(v38) = 0;
  sub_1001B0664(&v41, 6uLL, &v38);
  if ((unint64_t)[v5 length] > 0xA)
  {
    [v5 getBytes:v41 range:5, 6];
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    id v11 = [v5 length];
    unint64_t v12 = (unint64_t)v11 - 11;
    if (v11 == (id)11)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042094C();
      }
      goto LABEL_43;
    }
    buf[0] = 0;
    sub_10021DC20(&v38, v12, buf);
    [v5 getBytes:v38 range:11];
    if (v11 != [v5 length]) {
      __assert_rtn("-[NIServerCryptoSession decrypt:]", "NIServerCryptoSession.mm", 306, "byteOffset == ciphertext.length");
    }
    cryptorRef[0] = 0;
    CCCryptorStatus v13 = CCCryptorCreateWithMode(1u, 0xCu, 0, 0x3E8u, 0, [(NSData *)self->_sessionKey bytes], [(NSData *)self->_sessionKey length], 0, 0, 0, 0, cryptorRef);
    if (v13 || !cryptorRef[0])
    {
      id v14 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
      {
        logIdentifier = self->_logIdentifier;
        *(_DWORD *)buf = 138478339;
        *(void *)&uint8_t buf[4] = logIdentifier;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v13;
        __int16 v36 = 1024;
        BOOL v37 = cryptorRef[0] != 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#crypto,[%{private}@][Decryptor] create failed %d. Cryptor needs release: %d", buf, 0x18u);
      }
      if (!cryptorRef[0]) {
        goto LABEL_43;
      }
    }
    else if (CCCryptorAddParameter())
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100420C24();
      }
    }
    else if (CCCryptorAddParameter())
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100420BBC();
      }
    }
    else
    {
      if (!CCCryptorAddParameter())
      {
        LOBYTE(v27) = 0;
        sub_1001B0664(buf, 5uLL, &v27);
        **(unsigned char **)buf = v31;
        *(_DWORD *)(*(void *)buf + 1) = v30;
        if (CCCryptorAddParameter())
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_100420AEC();
          }
          CCCryptorRelease(cryptorRef[0]);
          v8 = 0;
        }
        else
        {
          size_t OutputLength = CCCryptorGetOutputLength(cryptorRef[0], v39 - v38, 0);
          LOBYTE(v24) = 0;
          sub_1001B0664(&v27, OutputLength, &v24);
          size_t dataOutMoved = 0;
          if (CCCryptorUpdate(cryptorRef[0], v38, v39 - v38, v27, v28 - (unsigned char *)v27, &dataOutMoved))
          {
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
              sub_100420A84();
            }
            CCCryptorRelease(cryptorRef[0]);
            v8 = 0;
          }
          else
          {
            if (dataOutMoved < v28 - (unsigned char *)v27) {
              sub_10021D2C0((unint64_t *)&v27, dataOutMoved);
            }
            __p[0] = 0;
            sub_1001B0664(&v24, 0x10uLL, __p);
            size_t v23 = 0;
            CCCryptorStatus v17 = CCCryptorFinal(cryptorRef[0], v24, v25 - (unsigned char *)v24, &v23);
            if (v17 || v23)
            {
              v18 = qword_1008ABDE0;
              if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
              {
                size_t v21 = self->_logIdentifier;
                *(_DWORD *)__p = 138478339;
                *(void *)&__p[4] = v21;
                *(_WORD *)&__p[12] = 1024;
                *(_DWORD *)&__p[14] = v17;
                __int16 v33 = 1024;
                int v34 = v23;
                _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#crypto,[%{private}@][Decryptor] cryptor-final failed %d. Leftover: %d", __p, 0x18u);
              }
              CCCryptorRelease(cryptorRef[0]);
              v8 = 0;
            }
            else
            {
              LOBYTE(v22) = 0;
              sub_1001B0664(__p, 6uLL, &v22);
              uint64_t v22 = *(void *)&__p[8] - *(void *)__p;
              if (CCCryptorGetParameter())
              {
                if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
                  sub_100420A1C();
                }
                CCCryptorRelease(cryptorRef[0]);
                v8 = 0;
              }
              else
              {
                CCCryptorRelease(cryptorRef[0]);
                v19 = +[NSData dataWithBytes:v41 length:v42 - v41];
                uint64_t v20 = +[NSData dataWithBytes:*(void *)__p length:*(void *)&__p[8] - *(void *)__p];
                if ([v19 isEqualToData:v20])
                {
                  v8 = +[NSData dataWithBytes:v27 length:v28 - (unsigned char *)v27];
                }
                else
                {
                  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
                    sub_1004209B4();
                  }
                  v8 = 0;
                }
              }
              if (*(void *)__p)
              {
                *(void *)&__p[8] = *(void *)__p;
                operator delete(*(void **)__p);
              }
            }
            if (v24)
            {
              uint64_t v25 = v24;
              operator delete(v24);
            }
          }
          if (v27)
          {
            uint64_t v28 = v27;
            operator delete(v27);
          }
        }
        if (*(void *)buf)
        {
          *(void *)&buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }
        goto LABEL_44;
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100420B54();
      }
    }
    CCCryptorRelease(cryptorRef[0]);
LABEL_43:
    v8 = 0;
LABEL_44:
    if (v38)
    {
      uint64_t v39 = v38;
      operator delete(v38);
    }
    goto LABEL_46;
  }
  id v10 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100420908((uint64_t)self->_logIdentifier, (int)[v5 length], (uint64_t)&v38);
  }

  v8 = 0;
LABEL_46:
  if (v41)
  {
    uint64_t v42 = v41;
    operator delete(v41);
  }
LABEL_16:

  return v8;
}

- (id)_deriveSessionKeyFromKeyDerivationKey:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 bytes];
  [v7 length];
  int Hkdf = CCKDFParametersCreateHkdf();
  id v9 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    logIdentifier = self->_logIdentifier;
    int __p = 138478339;
    __p_4 = logIdentifier;
    __int16 v14 = 1024;
    int v15 = Hkdf;
    __int16 v16 = 1024;
    int v17 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#crypto,[%{private}@][KDF] create parameters failed %d. Parameters need release: %d", (uint8_t *)&__p, 0x18u);
  }

  return 0;
}

- (NSData)keyDerivationKey
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)sessionIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_keyDerivationKey, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);

  objc_storeStrong((id *)&self->_sessionKey, 0);
}

@end