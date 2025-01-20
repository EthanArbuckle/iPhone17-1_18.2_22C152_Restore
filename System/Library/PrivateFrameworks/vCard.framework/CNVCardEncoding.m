@interface CNVCardEncoding
+ (id)addPreferredEncoding:(id)a3 toEncodings:(id)a4;
+ (id)asciiEncoding;
+ (id)encodingWithName:(id)a3 stringEncoding:(unint64_t)a4;
+ (id)encodingsFromUserDefaults;
+ (id)isoLatin1Encoding;
+ (id)macRomanEncoding;
+ (id)makeStandardEncodings;
+ (id)preferredEncodingInUserDefaults;
+ (id)standardEncodings;
+ (id)utf8Encoding;
- (CNVCardEncoding)initWithName:(id)a3 stringEncoding:(unint64_t)a4;
- (NSString)name;
- (unint64_t)stringEncoding;
@end

@implementation CNVCardEncoding

+ (id)standardEncodings
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CNVCardEncoding_standardEncodings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (standardEncodings_cn_once_token_1 != -1) {
    dispatch_once(&standardEncodings_cn_once_token_1, block);
  }
  v2 = (void *)standardEncodings_cn_once_object_1;
  return v2;
}

void __36__CNVCardEncoding_standardEncodings__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) makeStandardEncodings];
  uint64_t v1 = [v3 copy];
  v2 = (void *)standardEncodings_cn_once_object_1;
  standardEncodings_cn_once_object_1 = v1;
}

+ (id)makeStandardEncodings
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = +[CNVCardEncoding asciiEncoding];
  [v2 addObject:v3];

  v4 = +[CNVCardEncoding isoLatin1Encoding];
  [v2 addObject:v4];

  v5 = +[CNVCardEncoding macRomanEncoding];
  [v2 addObject:v5];

  v6 = +[CNVCardEncoding utf8Encoding];
  [v2 addObject:v6];

  return v2;
}

+ (id)addPreferredEncoding:(id)a3 toEncodings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__CNVCardEncoding_addPreferredEncoding_toEncodings___block_invoke;
    v11[3] = &unk_1E6C2D300;
    id v9 = v5;
    id v12 = v9;
    objc_msgSend(v8, "_cn_removeObjectsPassingTest:", v11);
    if ([v8 count] == 1) {
      objc_msgSend(v8, "_cn_addNonNilObject:", v9);
    }
    else {
      objc_msgSend(v8, "_cn_insertNonNilObject:atIndex:", v9, 1);
    }
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

uint64_t __52__CNVCardEncoding_addPreferredEncoding_toEncodings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  v4 = [*(id *)(a1 + 32) name];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

+ (id)encodingsFromUserDefaults
{
  id v3 = [a1 standardEncodings];
  v4 = [a1 preferredEncodingInUserDefaults];
  uint64_t v5 = [a1 addPreferredEncoding:v4 toEncodings:v3];

  return v5;
}

+ (id)preferredEncodingInUserDefaults
{
  id v3 = +[CNVCardUserDefaults vCard21Encoding];
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v4 = 0;
  }
  else
  {
    CFStringRef v5 = [v3 uppercaseString];

    CFStringEncoding v6 = CFStringConvertIANACharSetNameToEncoding(v5);
    if (v6 == -1)
    {
      v4 = 0;
    }
    else
    {
      v4 = [a1 encodingWithName:v5 stringEncoding:CFStringConvertEncodingToNSStringEncoding(v6)];
    }
    id v3 = (void *)v5;
  }

  return v4;
}

+ (id)encodingWithName:(id)a3 stringEncoding:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithName:v6 stringEncoding:a4];

  return v7;
}

+ (id)asciiEncoding
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__CNVCardEncoding_asciiEncoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (asciiEncoding_cn_once_token_2 != -1) {
    dispatch_once(&asciiEncoding_cn_once_token_2, block);
  }
  v2 = (void *)asciiEncoding_cn_once_object_2;
  return v2;
}

uint64_t __32__CNVCardEncoding_asciiEncoding__block_invoke(uint64_t a1)
{
  asciiEncoding_cn_once_object_2 = [*(id *)(a1 + 32) encodingWithName:@"ASCII" stringEncoding:1];
  return MEMORY[0x1F41817F8]();
}

+ (id)isoLatin1Encoding
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CNVCardEncoding_isoLatin1Encoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isoLatin1Encoding_cn_once_token_3 != -1) {
    dispatch_once(&isoLatin1Encoding_cn_once_token_3, block);
  }
  v2 = (void *)isoLatin1Encoding_cn_once_object_3;
  return v2;
}

uint64_t __36__CNVCardEncoding_isoLatin1Encoding__block_invoke(uint64_t a1)
{
  isoLatin1Encoding_cn_once_object_3 = [*(id *)(a1 + 32) encodingWithName:@"LATIN1" stringEncoding:5];
  return MEMORY[0x1F41817F8]();
}

+ (id)macRomanEncoding
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CNVCardEncoding_macRomanEncoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (macRomanEncoding_cn_once_token_4 != -1) {
    dispatch_once(&macRomanEncoding_cn_once_token_4, block);
  }
  v2 = (void *)macRomanEncoding_cn_once_object_4;
  return v2;
}

uint64_t __35__CNVCardEncoding_macRomanEncoding__block_invoke(uint64_t a1)
{
  macRomanEncoding_cn_once_object_4 = [*(id *)(a1 + 32) encodingWithName:@"MACINTOSH" stringEncoding:30];
  return MEMORY[0x1F41817F8]();
}

+ (id)utf8Encoding
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CNVCardEncoding_utf8Encoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (utf8Encoding_cn_once_token_5 != -1) {
    dispatch_once(&utf8Encoding_cn_once_token_5, block);
  }
  v2 = (void *)utf8Encoding_cn_once_object_5;
  return v2;
}

uint64_t __31__CNVCardEncoding_utf8Encoding__block_invoke(uint64_t a1)
{
  utf8Encoding_cn_once_object_5 = [*(id *)(a1 + 32) encodingWithName:@"UTF-8" stringEncoding:4];
  return MEMORY[0x1F41817F8]();
}

- (CNVCardEncoding)initWithName:(id)a3 stringEncoding:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(CNVCardEncoding *)self init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_stringEncoding = a4;
    v10 = v7;
  }

  return v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)stringEncoding
{
  return self->_stringEncoding;
}

- (void).cxx_destruct
{
}

@end