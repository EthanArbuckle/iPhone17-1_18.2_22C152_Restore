@interface WBSTOTPGenerator
+ (BOOL)_urlWithComponentsHasValidOtpauthURLScheme:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_base32EncodedStringForKeyData:(id)a3;
+ (id)_keyDataForBase32EncodedString:(id)a3;
+ (id)countdownStringForMultipleCodesWithSecondsRemaining:(int64_t)a3;
+ (id)countdownStringForSecondsRemaining:(int64_t)a3;
+ (id)shortCountdownStringForSecondsRemaining:(int64_t)a3;
- (BOOL)generatesIdenticalCodesToGenerator:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)heuristicallyDeterminedServiceNameHints;
- (NSData)keyData;
- (NSDate)initialDate;
- (NSDictionary)dictionaryRepresentation;
- (NSString)accountName;
- (NSString)issuer;
- (NSURL)exportableURL;
- (NSURL)originalURL;
- (WBSTOTPGenerator)initWithASCIIEncodedKey:(id)a3 initialDate:(id)a4 codeGenerationPeriod:(unint64_t)a5 numberOfDigits:(unint64_t)a6 algorithm:(unint64_t)a7;
- (WBSTOTPGenerator)initWithBase32EncodedKey:(id)a3;
- (WBSTOTPGenerator)initWithBase32EncodedKey:(id)a3 initialDate:(id)a4 codeGenerationPeriod:(unint64_t)a5 numberOfDigits:(unint64_t)a6 algorithm:(unint64_t)a7;
- (WBSTOTPGenerator)initWithCoder:(id)a3;
- (WBSTOTPGenerator)initWithDictionaryRepresentation:(id)a3;
- (WBSTOTPGenerator)initWithKeyData:(id)a3 initialDate:(id)a4 codeGenerationPeriod:(unint64_t)a5 numberOfDigits:(unint64_t)a6 algorithm:(unint64_t)a7 issuer:(id)a8 accountName:(id)a9 originalURL:(id)a10;
- (WBSTOTPGenerator)initWithOTPAuthURL:(id)a3;
- (WBSTOTPGenerator)initWithUserProvidedString:(id)a3;
- (id)_stringForAlgorithm:(unint64_t)a3;
- (id)codeForDate:(id)a3;
- (id)description;
- (id)startDateOfIntervalContainingDate:(id)a3;
- (unint64_t)_HMACLengthForAlgorithm:(unint64_t)a3;
- (unint64_t)_algorithmForQueryItemValue:(id)a3;
- (unint64_t)_numberOfIntervalsSinceInitialDateForDate:(id)a3;
- (unint64_t)algorithm;
- (unint64_t)codeGenerationPeriod;
- (unint64_t)hash;
- (unint64_t)numberOfDigitsInCode;
- (unsigned)_commonCryptoAlgorithmForTOTPAlgorithm:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOriginalURL:(id)a3;
@end

@implementation WBSTOTPGenerator

+ (id)_keyDataForBase32EncodedString:(id)a3
{
  id v3 = a3;
  if (_keyDataForBase32EncodedString__onceToken != -1) {
    dispatch_once(&_keyDataForBase32EncodedString__onceToken, &__block_literal_global_67);
  }
  id v4 = v3;
  v5 = (const char *)[v4 UTF8String];
  size_t v6 = strlen(v5);
  if (v6)
  {
    size_t v7 = v6;
    v8 = malloc_type_calloc(v6, 1uLL, 0x826F2895uLL);
    int v9 = 0;
    uint64_t v10 = 0;
    do
    {
      unsigned int v12 = *(unsigned __int8 *)v5++;
      unsigned int v11 = v12;
      if (v12 != 61 && memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZ234567", v11, 0x21uLL))
      {
        unsigned int v13 = *((unsigned __int8 *)&_keyDataForBase32EncodedString__inverseAlphabet + v11);
        int v14 = 5 * v9 + 7;
        if (5 * v9 >= 0) {
          int v14 = 5 * v9;
        }
        signed int v15 = 5 * v9 - (v14 & 0xFFFFFFF8);
        uint64_t v10 = (uint64_t)v14 >> 3;
        v16 = &v8[v14 >> 3];
        char v17 = *v16;
        if (v15 >= 4)
        {
          v8[v10] = v17 | (v13 >> (v15 - 3));
          v16 = &v8[v10 + 1];
          char v17 = *v16;
          char v18 = 11;
        }
        else
        {
          char v18 = 3;
        }
        char *v16 = v17 | ((_BYTE)v13 << (v18 - v15));
        ++v9;
      }
      --v7;
    }
    while (v7);
    if (v8[v10 + 1]) {
      uint64_t v19 = v10 + 2;
    }
    else {
      uint64_t v19 = v10 + 1;
    }
    id v20 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v8 length:v19 freeWhenDone:1];
  }
  else
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  }
  v21 = v20;

  return v21;
}

void __51__WBSTOTPGenerator__keyDataForBase32EncodedString___block_invoke()
{
  uint64_t v0 = 0;
  xmmword_1E9E59C10 = 0u;
  unk_1E9E59C20 = 0u;
  xmmword_1E9E59BF0 = 0u;
  unk_1E9E59C00 = 0u;
  xmmword_1E9E59BD0 = 0u;
  unk_1E9E59BE0 = 0u;
  xmmword_1E9E59BB0 = 0u;
  unk_1E9E59BC0 = 0u;
  xmmword_1E9E59B90 = 0u;
  unk_1E9E59BA0 = 0u;
  xmmword_1E9E59B70 = 0u;
  unk_1E9E59B80 = 0u;
  xmmword_1E9E59B50 = 0u;
  unk_1E9E59B60 = 0u;
  _keyDataForBase32EncodedString__inverseAlphabet = 0u;
  unk_1E9E59B40 = 0u;
  do
  {
    *((unsigned char *)&_keyDataForBase32EncodedString__inverseAlphabet + aAbcdefghijklmn_2[v0]) = v0;
    ++v0;
  }
  while (v0 != 32);
}

+ (id)_base32EncodedStringForKeyData:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 bytes];
  uint64_t v5 = [v3 length];
  unint64_t v6 = (2 * (((unint64_t)(v5 + 4) * (unsigned __int128)0xCCCCCCCCCCCCCCCDLL) >> 64)) & 0xFFFFFFFFFFFFFFF8;
  if (v6)
  {
    uint64_t v7 = v5;
    v8 = malloc_type_calloc(v6 | 1, 1uLL, 0xD9DA89CAuLL);
    int v9 = v8;
    if (v7)
    {
      unint64_t v10 = 0;
      do
      {
        unint64_t v11 = v10 / 5;
        unsigned int v12 = v10 % 5;
        char v13 = v12 + 3;
        v8[v10 / 5] |= *v4 >> (v10 % 5 + 3);
        if (v12 >= 3)
        {
          char v13 = v12 - 2;
          v8[++v11] |= (*v4 >> (v12 - 2)) & 0x1F;
        }
        char v14 = *v4++;
        v8[v11 + 1] |= (v14 << (5 - v13)) & 0x1F;
        v10 += 8;
        --v7;
      }
      while (v7);
    }
    else
    {
      unint64_t v11 = 0;
    }
    uint64_t v16 = 0;
    unint64_t v17 = v11 + 2;
    do
    {
      v8[v16] = aAbcdefghijklmn_2[v8[v16]];
      ++v16;
    }
    while (v17 != v16);
    if (v17 < v6)
    {
      memset(&v8[v17], 61, v6 - v11 - 2);
      unint64_t v17 = v6;
    }
    v9[v17] = 0;
    signed int v15 = (__CFString *)[[NSString alloc] initWithBytesNoCopy:v9 length:v17 encoding:1 freeWhenDone:1];
  }
  else
  {
    signed int v15 = &stru_1F105D3F0;
  }

  return v15;
}

+ (BOOL)_urlWithComponentsHasValidOtpauthURLScheme:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  if ([v4 caseInsensitiveCompare:@"otpauth"])
  {
    uint64_t v5 = [v3 scheme];
    BOOL v6 = [v5 caseInsensitiveCompare:@"apple-otpauth"] == 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (WBSTOTPGenerator)initWithOTPAuthURL:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:1];
  v50 = self;
  if (([(id)objc_opt_class() _urlWithComponentsHasValidOtpauthURLScheme:v5] & 1) == 0)
  {
    int v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WBSTOTPGenerator initWithOTPAuthURL:](v9, v4);
    }
    goto LABEL_7;
  }
  BOOL v6 = [v5 host];
  uint64_t v7 = [v6 caseInsensitiveCompare:@"totp"];

  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSTOTPGenerator initWithOTPAuthURL:](v8, v4);
    }
LABEL_7:
    unint64_t v10 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  char v13 = [v5 path];
  v43 = v13;
  if (v13)
  {
    char v14 = [v13 componentsSeparatedByString:@":"];
    if ([v14 count] == 2)
    {
      uint64_t v15 = [v14 firstObject];
      uint64_t v16 = [v14 lastObject];
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }
    v47 = (void *)v15;
  }
  else
  {
    v47 = 0;
    uint64_t v16 = 0;
  }
  v42 = (void *)v16;
  v44 = (void *)v12;
  v45 = v5;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  unint64_t v17 = [v5 queryItems];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (!v18)
  {
    id v20 = 0;
    uint64_t v48 = 6;
    uint64_t v49 = 0;
    uint64_t v46 = 30;
    goto LABEL_38;
  }
  uint64_t v19 = v18;
  id v20 = 0;
  uint64_t v21 = *(void *)v52;
  uint64_t v48 = 6;
  uint64_t v49 = 0;
  uint64_t v46 = 30;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v52 != v21) {
        objc_enumerationMutation(v17);
      }
      v23 = *(void **)(*((void *)&v51 + 1) + 8 * v22);
      v24 = [v23 name];
      if (![v24 caseInsensitiveCompare:@"secret"])
      {
        v28 = [v23 value];
        uint64_t v29 = [v28 uppercaseString];

        id v20 = (void *)v29;
        goto LABEL_32;
      }
      if (![v24 caseInsensitiveCompare:@"algorithm"])
      {
        v30 = [v23 value];
        uint64_t v49 = [(WBSTOTPGenerator *)v50 _algorithmForQueryItemValue:v30];
LABEL_31:

        goto LABEL_32;
      }
      if (![v24 caseInsensitiveCompare:@"digits"])
      {
        v30 = [v23 value];
        uint64_t v48 = [v30 integerValue];
        goto LABEL_31;
      }
      if (![v24 caseInsensitiveCompare:@"period"])
      {
        v30 = [v23 value];
        uint64_t v46 = [v30 integerValue];
        goto LABEL_31;
      }
      if ([v24 caseInsensitiveCompare:@"issuer"])
      {
        v25 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = v25;
          v27 = [v4 absoluteString];
          *(_DWORD *)buf = 138739971;
          v56 = v27;
          _os_log_impl(&dword_1B728F000, v26, OS_LOG_TYPE_INFO, "Found invalid parameter in otpauth URL. url=%{sensitive}@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v31 = [v23 value];

        v47 = (void *)v31;
      }
LABEL_32:

      ++v22;
    }
    while (v19 != v22);
    uint64_t v32 = [v17 countByEnumeratingWithState:&v51 objects:v57 count:16];
    uint64_t v19 = v32;
  }
  while (v32);
LABEL_38:

  if ([v20 length])
  {
    uint64_t v5 = v45;
    v33 = [v45 scheme];
    int v34 = [v33 isEqualToString:@"apple-otpauth"];

    v35 = v44;
    v36 = v47;
    v37 = v42;
    if (v34)
    {
      v38 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B728F000, v38, OS_LOG_TYPE_INFO, "Rewriting apple-otpauth:// URL.", buf, 2u);
      }
      [v45 setScheme:@"otpauth"];
      uint64_t v39 = [v45 URL];

      id v4 = (id)v39;
    }
    v40 = [(id)objc_opt_class() _keyDataForBase32EncodedString:v20];
    unint64_t v10 = [(WBSTOTPGenerator *)v50 initWithKeyData:v40 initialDate:v44 codeGenerationPeriod:v46 numberOfDigits:v48 algorithm:v49 issuer:v47 accountName:v42 originalURL:v4];

    if (v10)
    {
      unint64_t v10 = v10;
      v50 = v10;
    }
    else
    {
      v50 = 0;
    }
  }
  else
  {
    v41 = WBS_LOG_CHANNEL_PREFIXPasswords();
    v35 = v44;
    uint64_t v5 = v45;
    v36 = v47;
    v37 = v42;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[WBSTOTPGenerator initWithOTPAuthURL:](v41, v4);
    }
    unint64_t v10 = 0;
  }

LABEL_8:
  return v10;
}

- (WBSTOTPGenerator)initWithASCIIEncodedKey:(id)a3 initialDate:(id)a4 codeGenerationPeriod:(unint64_t)a5 numberOfDigits:(unint64_t)a6 algorithm:(unint64_t)a7
{
  id v12 = a4;
  char v13 = [a3 dataUsingEncoding:1];
  char v14 = [(WBSTOTPGenerator *)self initWithKeyData:v13 initialDate:v12 codeGenerationPeriod:a5 numberOfDigits:a6 algorithm:a7 issuer:0 accountName:0 originalURL:0];

  return v14;
}

- (WBSTOTPGenerator)initWithBase32EncodedKey:(id)a3 initialDate:(id)a4 codeGenerationPeriod:(unint64_t)a5 numberOfDigits:(unint64_t)a6 algorithm:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a3;
  char v14 = objc_opt_class();
  uint64_t v15 = [v13 uppercaseString];

  uint64_t v16 = [v14 _keyDataForBase32EncodedString:v15];
  unint64_t v17 = [(WBSTOTPGenerator *)self initWithKeyData:v16 initialDate:v12 codeGenerationPeriod:a5 numberOfDigits:a6 algorithm:a7 issuer:0 accountName:0 originalURL:0];

  return v17;
}

- (WBSTOTPGenerator)initWithBase32EncodedKey:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  BOOL v6 = [v4 dateWithTimeIntervalSince1970:0.0];
  uint64_t v7 = [(WBSTOTPGenerator *)self initWithBase32EncodedKey:v5 initialDate:v6 codeGenerationPeriod:30 numberOfDigits:6 algorithm:0];

  return v7;
}

- (WBSTOTPGenerator)initWithUserProvidedString:(id)a3
{
  id v4 = objc_msgSend(a3, "safari_stringByTrimmingWhitespace");
  if ([v4 length])
  {
    if ((objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", @"otpauth:") & 1) != 0
      || objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", @"apple-otpauth:"))
    {
      id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
      self = [(WBSTOTPGenerator *)self initWithOTPAuthURL:v5];

      BOOL v6 = self;
    }
    else
    {
      self = [(WBSTOTPGenerator *)self initWithBase32EncodedKey:v4];
      BOOL v6 = self;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (WBSTOTPGenerator)initWithKeyData:(id)a3 initialDate:(id)a4 codeGenerationPeriod:(unint64_t)a5 numberOfDigits:(unint64_t)a6 algorithm:(unint64_t)a7 issuer:(id)a8 accountName:(id)a9 originalURL:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if ([v16 length]
    && (v35.receiver = self,
        v35.super_class = (Class)WBSTOTPGenerator,
        (self = [(WBSTOTPGenerator *)&v35 init]) != 0))
  {
    uint64_t v21 = (NSData *)[v16 copy];
    key = self->_key;
    self->_key = v21;

    if (v17)
    {
      v23 = (NSDate *)v17;
    }
    else
    {
      v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    }
    initialDate = self->_initialDate;
    self->_initialDate = v23;

    unint64_t v26 = 30;
    if (a5 - 5 < 0x128) {
      unint64_t v26 = a5;
    }
    self->_codeGenerationPeriod = v26;
    self->_algorithm = a7;
    unint64_t v27 = 6;
    if (a6 - 5 < 0xB) {
      unint64_t v27 = a6;
    }
    self->_numberOfDigitsInCode = v27;
    v28 = (NSString *)[v18 copy];
    issuer = self->_issuer;
    self->_issuer = v28;

    v30 = (NSString *)[v19 copy];
    accountName = self->_accountName;
    self->_accountName = v30;

    uint64_t v32 = (NSURL *)[v20 copy];
    originalURL = self->_originalURL;
    self->_originalURL = v32;

    self = self;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (NSURL)exportableURL
{
  v23[4] = *MEMORY[0x1E4F143B8];
  originalURL = self->_originalURL;
  if (originalURL)
  {
    id v4 = (void *)[(NSURL *)originalURL copy];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v5 setScheme:@"otpauth"];
    [v5 setHost:@"totp"];
    BOOL v6 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v22 = [(id)objc_opt_class() _base32EncodedStringForKeyData:self->_key];
    uint64_t v21 = [v22 stringByReplacingOccurrencesOfString:@"=" withString:&stru_1F105D3F0];
    id v20 = [v6 queryItemWithName:@"secret" value:v21];
    v23[0] = v20;
    uint64_t v7 = (void *)MEMORY[0x1E4F290C8];
    v8 = [(WBSTOTPGenerator *)self _stringForAlgorithm:self->_algorithm];
    int v9 = [v7 queryItemWithName:@"algorithm" value:v8];
    v23[1] = v9;
    unint64_t v10 = (void *)MEMORY[0x1E4F290C8];
    unint64_t v11 = [NSNumber numberWithUnsignedInteger:self->_numberOfDigitsInCode];
    id v12 = [v11 stringValue];
    id v13 = [v10 queryItemWithName:@"digits" value:v12];
    v23[2] = v13;
    char v14 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:self->_codeGenerationPeriod];
    id v16 = [v15 stringValue];
    id v17 = [v14 queryItemWithName:@"period" value:v16];
    v23[3] = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    [v5 setQueryItems:v18];

    id v4 = [v5 URL];
  }
  return (NSURL *)v4;
}

- (NSData)keyData
{
  return self->_key;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSTOTPGenerator *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([(NSData *)self->_key isEqualToData:v5->_key]
        && [(NSDate *)self->_initialDate isEqualToDate:v5->_initialDate]
        && self->_codeGenerationPeriod == v5->_codeGenerationPeriod
        && self->_algorithm == v5->_algorithm
        && self->_numberOfDigitsInCode == v5->_numberOfDigitsInCode
        && WBSIsEqual(self->_issuer, v5->_issuer)
        && WBSIsEqual(self->_accountName, v5->_accountName))
      {
        char v6 = WBSIsEqual(self->_originalURL, v5->_originalURL);
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_key hash];
  unint64_t v4 = [(NSDate *)self->_initialDate hash] ^ v3 ^ self->_codeGenerationPeriod ^ self->_algorithm ^ self->_numberOfDigitsInCode;
  NSUInteger v5 = [(NSString *)self->_issuer hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_accountName hash];
  return v4 ^ v6 ^ [(NSURL *)self->_originalURL hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)WBSTOTPGenerator;
  unint64_t v4 = [(WBSTOTPGenerator *)&v10 description];
  long long v9 = *(_OWORD *)&self->_initialDate;
  unint64_t numberOfDigitsInCode = self->_numberOfDigitsInCode;
  NSUInteger v6 = [(WBSTOTPGenerator *)self _stringForAlgorithm:self->_algorithm];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ date=%@ period=%i digits=%i alg=%@>", v4, v9, numberOfDigitsInCode, v6];

  return v7;
}

- (NSArray)heuristicallyDeterminedServiceNameHints
{
  cachedHeuristicallyDeterminedServiceNameHints = self->_cachedHeuristicallyDeterminedServiceNameHints;
  if (!cachedHeuristicallyDeterminedServiceNameHints)
  {
    issuer = self->_issuer;
    if (!issuer) {
      goto LABEL_5;
    }
    NSUInteger v5 = [(NSString *)issuer componentsSeparatedByString:@":"];
    NSUInteger v6 = self->_cachedHeuristicallyDeterminedServiceNameHints;
    self->_cachedHeuristicallyDeterminedServiceNameHints = v5;

    cachedHeuristicallyDeterminedServiceNameHints = self->_cachedHeuristicallyDeterminedServiceNameHints;
  }
  issuer = cachedHeuristicallyDeterminedServiceNameHints;
LABEL_5:
  return (NSArray *)issuer;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  issuer = self->_issuer;
  id v5 = a3;
  [v5 encodeObject:issuer forKey:@"issuer"];
  [v5 encodeObject:self->_accountName forKey:@"accountName"];
  [v5 encodeObject:self->_initialDate forKey:@"_initialDate"];
  [v5 encodeInteger:self->_codeGenerationPeriod forKey:@"period"];
  [v5 encodeInteger:self->_algorithm forKey:@"algorithm"];
  [v5 encodeInteger:self->_numberOfDigitsInCode forKey:@"digits"];
  [v5 encodeObject:self->_originalURL forKey:@"originalURL"];
  [v5 encodeObject:self->_key forKey:@"secret"];
}

- (WBSTOTPGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuer"];
  NSUInteger v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountName"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_initialDate"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"period"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"algorithm"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"digits"];
  unint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalURL"];
  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secret"];

  id v13 = [(WBSTOTPGenerator *)self initWithKeyData:v12 initialDate:v7 codeGenerationPeriod:v8 numberOfDigits:v10 algorithm:v9 issuer:v5 accountName:v6 originalURL:v11];
  return v13;
}

+ (id)countdownStringForSecondsRemaining:(int64_t)a3
{
  uint64_t v3 = NSString;
  if (a3 == 1)
  {
    id v4 = _WBSLocalizedString(@"This code is valid for the next %zu second.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    objc_msgSend(v3, "localizedStringWithFormat:", v4, 1);
  }
  else
  {
    id v4 = _WBSLocalizedString(@"This code is valid for the next %zu seconds.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    objc_msgSend(v3, "localizedStringWithFormat:", v4, a3);
  NSUInteger v6 = };

  uint64_t v7 = _WBSLocalizedString(@"A new code will be generated when it expires.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  uint64_t v8 = [NSString localizedStringWithFormat:@"%@\n%@", v6, v7];

  return v8;
}

+ (id)countdownStringForMultipleCodesWithSecondsRemaining:(int64_t)a3
{
  uint64_t v3 = [a1 shortCountdownStringForSecondsRemaining:a3];
  id v4 = _WBSLocalizedString(@"Verification codes are valid for a short window. New codes will be generated when they expire.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  id v5 = [NSString localizedStringWithFormat:@"%@\n%@", v4, v3];

  return v5;
}

+ (id)shortCountdownStringForSecondsRemaining:(int64_t)a3
{
  id v4 = NSString;
  id v5 = _WBSLocalizedString(@"%zu seconds left.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  NSUInteger v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (WBSTOTPGenerator)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"originalURL"];
    id v20 = (void *)v5;
    if (v5)
    {
      NSUInteger v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5 relativeToURL:0];
    }
    else
    {
      NSUInteger v6 = 0;
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"secret"];
    id v18 = [v4 objectForKeyedSubscript:@"_initialDate"];
    id v19 = [v4 objectForKeyedSubscript:@"period"];
    uint64_t v17 = [v19 unsignedIntegerValue];
    uint64_t v9 = [v4 objectForKeyedSubscript:@"digits"];
    uint64_t v10 = [v9 unsignedIntegerValue];
    unint64_t v11 = [v4 objectForKeyedSubscript:@"algorithm"];
    uint64_t v12 = [v11 unsignedIntegerValue];
    id v13 = [v4 objectForKeyedSubscript:@"issuer"];
    char v14 = [v4 objectForKeyedSubscript:@"accountName"];
    self = [(WBSTOTPGenerator *)self initWithKeyData:v8 initialDate:v18 codeGenerationPeriod:v17 numberOfDigits:v10 algorithm:v12 issuer:v13 accountName:v14 originalURL:v6];

    if (self) {
      uint64_t v15 = self;
    }

    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  v17[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  key = self->_key;
  v16[0] = @"secret";
  v16[1] = @"_initialDate";
  initialDate = self->_initialDate;
  v17[0] = key;
  v17[1] = initialDate;
  v16[2] = @"digits";
  NSUInteger v6 = [NSNumber numberWithUnsignedInteger:self->_numberOfDigitsInCode];
  v17[2] = v6;
  v16[3] = @"period";
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_codeGenerationPeriod];
  v17[3] = v7;
  v16[4] = @"algorithm";
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_algorithm];
  v17[4] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  uint64_t v10 = [v3 dictionaryWithDictionary:v9];

  issuer = self->_issuer;
  if (issuer) {
    [v10 setObject:issuer forKeyedSubscript:@"issuer"];
  }
  accountName = self->_accountName;
  if (accountName) {
    [v10 setObject:accountName forKeyedSubscript:@"accountName"];
  }
  originalURL = self->_originalURL;
  if (originalURL)
  {
    char v14 = [(NSURL *)originalURL absoluteString];
    [v10 setObject:v14 forKeyedSubscript:@"originalURL"];
  }
  return (NSDictionary *)v10;
}

- (id)codeForDate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t algorithm = self->_algorithm;
  id v5 = a3;
  unint64_t v6 = [(WBSTOTPGenerator *)self _HMACLengthForAlgorithm:algorithm];
  uint64_t v7 = [(WBSTOTPGenerator *)self _commonCryptoAlgorithmForTOTPAlgorithm:self->_algorithm];
  CCHmacAlgorithm v8 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&data - v9;
  unint64_t v11 = [(WBSTOTPGenerator *)self _numberOfIntervalsSinceInitialDateForDate:v5];

  unint64_t data = bswap64(v11);
  CCHmac(v8, [(NSData *)self->_key bytes], [(NSData *)self->_key length], &data, 8uLL, v10);
  LODWORD(v6) = bswap32(*(_DWORD *)&v10[v10[v6 - 1] & 0xF] & 0xFFFFFF7F);
  unint64_t numberOfDigitsInCode = self->_numberOfDigitsInCode;
  uint64_t v15 = v6 % __exp10((double)numberOfDigitsInCode);
  id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%0*u", numberOfDigitsInCode, v15);
  return v13;
}

- (id)startDateOfIntervalContainingDate:(id)a3
{
  unint64_t v4 = [(WBSTOTPGenerator *)self _numberOfIntervalsSinceInitialDateForDate:a3];
  initialDate = self->_initialDate;
  double v6 = (double)(self->_codeGenerationPeriod * v4);
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
  return (id)[v7 dateWithTimeInterval:initialDate sinceDate:v6];
}

- (BOOL)generatesIdenticalCodesToGenerator:(id)a3
{
  unint64_t v4 = a3;
  BOOL v5 = v4
    && [(NSData *)self->_key isEqualToData:v4[1]]
    && [(NSDate *)self->_initialDate isEqualToDate:v4[5]]
    && self->_codeGenerationPeriod == v4[6]
    && self->_algorithm == v4[7]
    && self->_numberOfDigitsInCode == v4[8];

  return v5;
}

- (unint64_t)_numberOfIntervalsSinceInitialDateForDate:(id)a3
{
  [a3 timeIntervalSinceDate:self->_initialDate];
  return vcvtmd_u64_f64(v4 / (double)self->_codeGenerationPeriod);
}

- (unint64_t)_algorithmForQueryItemValue:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    if (![v3 caseInsensitiveCompare:@"sha256"])
    {
      unint64_t v5 = 1;
      goto LABEL_7;
    }
    if (![v4 caseInsensitiveCompare:@"sha512"])
    {
      unint64_t v5 = 2;
      goto LABEL_7;
    }
  }
  unint64_t v5 = 0;
LABEL_7:

  return v5;
}

- (unsigned)_commonCryptoAlgorithmForTOTPAlgorithm:(unint64_t)a3
{
  if (a3 == 2) {
    return 4;
  }
  else {
    return 2 * (a3 == 1);
  }
}

- (unint64_t)_HMACLengthForAlgorithm:(unint64_t)a3
{
  unint64_t v3 = 20;
  if (a3 == 1) {
    unint64_t v3 = 32;
  }
  if (a3 == 2) {
    return 64;
  }
  else {
    return v3;
  }
}

- (id)_stringForAlgorithm:(unint64_t)a3
{
  unint64_t v3 = @"SHA1";
  if (a3 == 1) {
    unint64_t v3 = @"SHA256";
  }
  if (a3 == 2) {
    return @"SHA512";
  }
  else {
    return v3;
  }
}

- (NSString)issuer
{
  return self->_issuer;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (NSDate)initialDate
{
  return self->_initialDate;
}

- (unint64_t)codeGenerationPeriod
{
  return self->_codeGenerationPeriod;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (unint64_t)numberOfDigitsInCode
{
  return self->_numberOfDigitsInCode;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_cachedHeuristicallyDeterminedServiceNameHints, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)initWithOTPAuthURL:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  double v4 = [a2 absoluteString];
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Otpauth URL is missing a secret. url=%{sensitive}@", v7, v8, v9, v10, 3u);
}

- (void)initWithOTPAuthURL:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  double v4 = [a2 absoluteString];
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Attempting to create a TOTP generator from a URL with a non-TOTP host portion. url=%{sensitive}@", v7, v8, v9, v10, 3u);
}

- (void)initWithOTPAuthURL:(void *)a1 .cold.3(void *a1, void *a2)
{
  id v3 = a1;
  double v4 = [a2 absoluteString];
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Attempting to create a TOTP generator from a URL with a non-otpauth scheme. url=%{sensitive}@", v7, v8, v9, v10, 3u);
}

@end