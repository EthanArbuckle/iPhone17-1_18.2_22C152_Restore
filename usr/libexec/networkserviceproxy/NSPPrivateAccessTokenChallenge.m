@interface NSPPrivateAccessTokenChallenge
+ (id)challengeAttributeName;
+ (id)httpAuthenticationScheme;
+ (id)originNameKeyAttributeName;
+ (id)tokenKeyAttributeName;
- (BOOL)isSupportedTokenType;
- (BOOL)typeHasAllowedOriginList;
- (BOOL)typeRequiresOriginName;
- (BOOL)typeRequiresRedemptionNonce;
- (NSArray)originNames;
- (NSData)challengeData;
- (NSData)redemptionNonce;
- (NSPPrivateAccessTokenChallenge)initWithData:(id)a3;
- (NSString)issuerName;
- (NSString)originName;
- (id)initRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5;
- (id)initRateLimitedRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5;
- (unsigned)tokenType;
@end

@implementation NSPPrivateAccessTokenChallenge

+ (id)httpAuthenticationScheme
{
  return @"PrivateToken";
}

+ (id)challengeAttributeName
{
  return @"challenge";
}

+ (id)tokenKeyAttributeName
{
  return @"token-key";
}

+ (id)originNameKeyAttributeName
{
  return @"issuer-encap-key";
}

- (NSPPrivateAccessTokenChallenge)initWithData:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v45 = nplog_obj();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v70[0] = "-[NSPPrivateAccessTokenChallenge initWithData:]";
      v46 = "%s called with null data";
      goto LABEL_83;
    }
LABEL_67:

    goto LABEL_16;
  }
  unint64_t v6 = (unint64_t)[v4 length];
  v7 = (unsigned __int16 *)[v5 bytes];
  if (!v6)
  {
    v45 = nplog_obj();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v70[0] = "-[NSPPrivateAccessTokenChallenge initWithData:]";
      v46 = "%s called with null remainingLength";
      goto LABEL_83;
    }
    goto LABEL_67;
  }
  v8 = v7;
  if (!v7)
  {
    v45 = nplog_obj();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
      goto LABEL_67;
    }
    *(_DWORD *)buf = 136315138;
    v70[0] = "-[NSPPrivateAccessTokenChallenge initWithData:]";
    v46 = "%s called with null cursor";
LABEL_83:
    _os_log_fault_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, v46, buf, 0xCu);
    goto LABEL_67;
  }
  v68.receiver = self;
  v68.super_class = (Class)NSPPrivateAccessTokenChallenge;
  v9 = [(NSPPrivateAccessTokenChallenge *)&v68 init];
  if (!v9)
  {
    nplog_obj();
    self = (NSPPrivateAccessTokenChallenge *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    goto LABEL_16;
  }
  v10 = v9;
  if (v6 <= 1)
  {
    v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Invalid challenge length";
LABEL_8:
      v13 = v11;
      uint32_t v14 = 2;
LABEL_32:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v9->_tokenType = bswap32(*v8) >> 16;
  if (![(NSPPrivateAccessTokenChallenge *)v9 isSupportedTokenType])
  {
    v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    unsigned int v26 = [(NSPPrivateAccessTokenChallenge *)v10 tokenType];
    *(_DWORD *)buf = 67109120;
    LODWORD(v70[0]) = v26;
    v12 = "Unsupported token type %u";
    goto LABEL_31;
  }
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Invalid challenge length";
      goto LABEL_8;
    }
LABEL_14:

LABEL_15:
    self = v10;
LABEL_16:
    v10 = 0;
LABEL_17:

    goto LABEL_18;
  }
  size_t v16 = bswap32(v8[1]) >> 16;
  unint64_t v17 = v6 - 4;
  if (v6 - 4 < v16 || ((unsigned __int16)(v16 - 257) >> 8) != 255)
  {
    v25 = nplog_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      goto LABEL_15;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v70[0]) = v16;
    v38 = "Invalid issuer name length %u";
    goto LABEL_48;
  }
  int v18 = v16 + 1;
  v19 = malloc_type_calloc(1uLL, (v16 + 1), 0xA57663BFuLL);
  if (!v19)
  {
    v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v70[0]) = v18;
    v12 = "calloc of %u bytes failed";
    goto LABEL_31;
  }
  v20 = v19;
  v21 = (char *)(v8 + 2);
  memcpy(v19, v21, v16);
  v22 = +[NSString stringWithUTF8String:v20];
  objc_setProperty_atomic(v10, v23, v22, 24);

  free(v20);
  v24 = [(NSPPrivateAccessTokenChallenge *)v10 issuerName];

  if (!v24)
  {
    v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid origin name";
    goto LABEL_8;
  }
  if (v17 == v16)
  {
    v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Invalid challenge length";
      goto LABEL_8;
    }
    goto LABEL_14;
  }
  v27 = &v21[v16];
  v28 = &v21[v16];
  unsigned int v31 = *v28;
  v29 = (unsigned __int16 *)(v28 + 1);
  uint64_t v30 = v31;
  unint64_t v32 = v17 + ~v16;
  unint64_t v33 = v32 - v31;
  if (v32 < v31)
  {
    v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 67109376;
    LODWORD(v70[0]) = v30;
    WORD2(v70[0]) = 2048;
    *(void *)((char *)v70 + 6) = v32;
    v12 = "Invalid nonce length %u, cannot fit in %zu";
    v13 = v11;
    uint32_t v14 = 18;
    goto LABEL_32;
  }
  if (v30)
  {
    if (v30 != 32)
    {
      v11 = nplog_obj();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v70[0]) = v30;
      v12 = "Invalid nonce length %u";
      goto LABEL_31;
    }
    v34 = +[NSData dataWithBytes:v29 length:v30];
    objc_setProperty_atomic(v10, v35, v34, 32);

    v36 = [(NSPPrivateAccessTokenChallenge *)v10 redemptionNonce];

    if (!v36)
    {
      v11 = nplog_obj();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      v12 = "Invalid nonce";
      goto LABEL_8;
    }
    v29 = (unsigned __int16 *)(v27 + 33);
    unint64_t v32 = v33;
  }
  if ([(NSPPrivateAccessTokenChallenge *)v10 typeRequiresRedemptionNonce])
  {
    v37 = [(NSPPrivateAccessTokenChallenge *)v10 redemptionNonce];

    if (!v37)
    {
      v11 = nplog_obj();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      v12 = "Redemption nonce is required";
      goto LABEL_8;
    }
  }
  if (v32 <= 1)
  {
    v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid challenge length";
    goto LABEL_8;
  }
  unsigned int v43 = *v29;
  v42 = v29 + 1;
  unsigned int v41 = v43;
  size_t v44 = __rev16(v43);
  if (v32 - 2 < v44)
  {
    v25 = nplog_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 67109376;
    LODWORD(v70[0]) = v44;
    WORD2(v70[0]) = 2048;
    *(void *)((char *)v70 + 6) = v32 - 2;
    v38 = "Invalid origin info length %u, cannot fit in %zu";
    v39 = v25;
    uint32_t v40 = 18;
    goto LABEL_49;
  }
  if (v44 >= 0xA01)
  {
    v25 = nplog_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v70[0]) = v44;
    v38 = "Invalid origin info length %u";
LABEL_48:
    v39 = v25;
    uint32_t v40 = 8;
LABEL_49:
    _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    goto LABEL_27;
  }
  if (v41)
  {
    int v47 = v44 + 1;
    v48 = malloc_type_calloc(1uLL, (v44 + 1), 0xCF36E336uLL);
    if (v48)
    {
      v49 = v48;
      memcpy(v48, v42, v44);
      v50 = +[NSString stringWithUTF8String:v49];
      objc_setProperty_atomic(v10, v51, v50, 56);

      free(v49);
      v53 = [objc_getProperty(v10, v52, 56, 1) componentsSeparatedByString:@","];
      objc_setProperty_atomic(v10, v54, v53, 48);

      v55 = [(NSPPrivateAccessTokenChallenge *)v10 originNames];
      v56 = [v55 firstObject];
      objc_setProperty_atomic(v10, v57, v56, 40);

      goto LABEL_73;
    }
    v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v70[0]) = v47;
    v12 = "calloc of %u bytes failed";
LABEL_31:
    v13 = v11;
    uint32_t v14 = 8;
    goto LABEL_32;
  }
LABEL_73:
  if ([(NSPPrivateAccessTokenChallenge *)v10 typeRequiresOriginName]
    && !objc_getProperty(v10, v58, 56, 1))
  {
    v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v12 = "Origin name is required";
    goto LABEL_8;
  }
  objc_setProperty_atomic(v10, v58, v5, 16);
  if (os_variant_allows_internal_security_policies())
  {
    v59 = [(NSPPrivateAccessTokenChallenge *)v10 issuerName];
    unsigned int v60 = [v59 containsString:@";"];

    if (v60)
    {
      v61 = [(NSPPrivateAccessTokenChallenge *)v10 issuerName];
      v62 = [v61 componentsSeparatedByString:@";"];
      self = [v62 firstObject];

      LODWORD(v61) = [(NSPPrivateAccessTokenChallenge *)v10 tokenType];
      v63 = [(NSPPrivateAccessTokenChallenge *)v10 redemptionNonce];
      id Property = objc_getProperty(v10, v64, 56, 1);
      v66 = sub_1000B4B20(v61, self, v63, Property);
      objc_setProperty_atomic(v10, v67, v66, 16);

      goto LABEL_17;
    }
  }
LABEL_18:

  return v10;
}

- (id)initRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5
{
  v5 = self;
  if (a3)
  {
    v5 = sub_1000B55E0(&self->super, 2u, a3, a4, a5);
    unint64_t v6 = v5;
  }
  else
  {
    v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      v10 = "-[NSPPrivateAccessTokenChallenge initRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null issuerName", (uint8_t *)&v9, 0xCu);
    }

    unint64_t v6 = 0;
  }

  return v6;
}

- (id)initRateLimitedRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v8)
  {
    uint32_t v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136315138;
      unint64_t v17 = "-[NSPPrivateAccessTokenChallenge initRateLimitedRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
      v15 = "%s called with null issuerName";
      goto LABEL_13;
    }
LABEL_11:

    v12 = 0;
    goto LABEL_5;
  }
  if (!v9)
  {
    uint32_t v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136315138;
      unint64_t v17 = "-[NSPPrivateAccessTokenChallenge initRateLimitedRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
      v15 = "%s called with null redemptionNonce";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (![v10 count])
  {
    uint32_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    int v16 = 136315138;
    unint64_t v17 = "-[NSPPrivateAccessTokenChallenge initRateLimitedRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
    v15 = "%s called with null originNames.count";
LABEL_13:
    _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_11;
  }
  self = sub_1000B55E0(&self->super, 3u, v8, v9, v11);
  v12 = self;
LABEL_5:

  return v12;
}

- (BOOL)isSupportedTokenType
{
  return [(NSPPrivateAccessTokenChallenge *)self tokenType] == 2
      || [(NSPPrivateAccessTokenChallenge *)self tokenType] == 3;
}

- (BOOL)typeRequiresOriginName
{
  return [(NSPPrivateAccessTokenChallenge *)self tokenType] == 3;
}

- (BOOL)typeRequiresRedemptionNonce
{
  return [(NSPPrivateAccessTokenChallenge *)self tokenType] == 3;
}

- (BOOL)typeHasAllowedOriginList
{
  return [(NSPPrivateAccessTokenChallenge *)self tokenType] == 2;
}

- (NSData)challengeData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)tokenType
{
  return self->_tokenType;
}

- (NSString)issuerName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)redemptionNonce
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)originName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)originNames
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originInfo, 0);
  objc_storeStrong((id *)&self->_originNames, 0);
  objc_storeStrong((id *)&self->_originName, 0);
  objc_storeStrong((id *)&self->_redemptionNonce, 0);
  objc_storeStrong((id *)&self->_issuerName, 0);

  objc_storeStrong((id *)&self->_challengeData, 0);
}

@end