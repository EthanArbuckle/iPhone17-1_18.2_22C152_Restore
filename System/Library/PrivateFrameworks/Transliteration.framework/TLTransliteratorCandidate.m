@interface TLTransliteratorCandidate
+ (id)createWithCompositeTransliteratorCandidate:(const void *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtensionCandidate;
- (NSString)inputWord;
- (NSString)transliteratedWord;
- (TLTransliteratorCandidate)initWithInputWord:(id)a3 transliteratedWord:(id)a4 lmScore:(double)a5 seq2seqScore:(double)a6 isExtensionCandidate:(BOOL)a7 type:(int64_t)a8;
- (double)lmScore;
- (double)seq2seqScore;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation TLTransliteratorCandidate

+ (id)createWithCompositeTransliteratorCandidate:(const void *)a3
{
  char v4 = *((unsigned char *)a3 + 23);
  if (v4 >= 0) {
    v5 = (const UInt8 *)a3;
  }
  else {
    v5 = *(const UInt8 **)a3;
  }
  if (v5)
  {
    if (v4 >= 0) {
      CFIndex v6 = *((unsigned __int8 *)a3 + 23);
    }
    else {
      CFIndex v6 = *((void *)a3 + 1);
    }
    CFStringRef v7 = CFStringCreateWithBytes(0, v5, v6, 0x8000100u, 0);
    CFStringRef v17 = v7;
    if (!v7)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x26120D480](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  else
  {
    CFStringRef v7 = 0;
    CFStringRef v17 = 0;
  }
  char v9 = *((unsigned char *)a3 + 47);
  if (v9 >= 0) {
    v10 = (const UInt8 *)a3 + 24;
  }
  else {
    v10 = (const UInt8 *)*((void *)a3 + 3);
  }
  if (v10)
  {
    if (v9 >= 0) {
      CFIndex v11 = *((unsigned __int8 *)a3 + 47);
    }
    else {
      CFIndex v11 = *((void *)a3 + 4);
    }
    CFStringRef v12 = CFStringCreateWithBytes(0, v10, v11, 0x8000100u, 0);
    CFStringRef v16 = v12;
    if (!v12)
    {
      v13 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x26120D480](v13, "Could not construct");
      __cxa_throw(v13, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  else
  {
    CFStringRef v12 = 0;
    CFStringRef v16 = 0;
  }
  v14 = -[TLTransliteratorCandidate initWithInputWord:transliteratedWord:lmScore:seq2seqScore:isExtensionCandidate:type:]([TLTransliteratorCandidate alloc], "initWithInputWord:transliteratedWord:lmScore:seq2seqScore:isExtensionCandidate:type:", v7, v12, *((unsigned __int8 *)a3 + 72), *((void *)a3 + 8), *((double *)a3 + 6), *((double *)a3 + 7), v16, v17);
  if (v12) {
    CFRelease(v12);
  }
  if (v7) {
    CFRelease(v7);
  }
  return v14;
}

- (TLTransliteratorCandidate)initWithInputWord:(id)a3 transliteratedWord:(id)a4 lmScore:(double)a5 seq2seqScore:(double)a6 isExtensionCandidate:(BOOL)a7 type:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TLTransliteratorCandidate;
  CFStringRef v16 = [(TLTransliteratorCandidate *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    inputWord = v16->_inputWord;
    v16->_inputWord = (NSString *)v17;

    uint64_t v19 = [v15 copy];
    transliteratedWord = v16->_transliteratedWord;
    v16->_transliteratedWord = (NSString *)v19;

    v16->_lmScore = a5;
    v16->_seq2seqScore = a6;
    v16->_isExtensionCandidate = a7;
    v16->_type = a8;
  }

  return v16;
}

- (unint64_t)hash
{
  v3 = NSNumber;
  [(TLTransliteratorCandidate *)self lmScore];
  char v4 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v5 = [v4 hash];

  CFIndex v6 = NSNumber;
  [(TLTransliteratorCandidate *)self seq2seqScore];
  CFStringRef v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = [v7 hash];

  char v9 = [(TLTransliteratorCandidate *)self inputWord];
  uint64_t v10 = [v9 hash];

  CFIndex v11 = [(TLTransliteratorCandidate *)self transliteratedWord];
  uint64_t v12 = v8 ^ v5;
  uint64_t v13 = v10 ^ [v11 hash];

  return v12 ^ v13 ^ [(TLTransliteratorCandidate *)self type];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (-[TLTransliteratorCandidate lmScore](self, "lmScore"), double v8 = v7, [v6 lmScore], v8 == v9)
    && ([(TLTransliteratorCandidate *)self seq2seqScore],
        double v11 = v10,
        [v6 seq2seqScore],
        v11 == v12))
  {
    uint64_t v13 = [(TLTransliteratorCandidate *)self inputWord];
    id v14 = [v6 inputWord];
    if ([v13 isEqualToString:v14])
    {
      id v15 = [(TLTransliteratorCandidate *)self transliteratedWord];
      CFStringRef v16 = [v6 transliteratedWord];
      if ([v15 isEqualToString:v16]
        && (int v17 = [(TLTransliteratorCandidate *)self isExtensionCandidate],
            v17 == [v6 isExtensionCandidate]))
      {
        int64_t v19 = [(TLTransliteratorCandidate *)self type];
        BOOL v18 = v19 == [v6 type];
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)description
{
  v16[6] = *MEMORY[0x263EF8340];
  v15[0] = @"Input Word";
  v3 = [(TLTransliteratorCandidate *)self inputWord];
  v16[0] = v3;
  v15[1] = @"Transliterated Word";
  id v4 = [(TLTransliteratorCandidate *)self transliteratedWord];
  v16[1] = v4;
  v15[2] = @"LM Score";
  uint64_t v5 = NSNumber;
  [(TLTransliteratorCandidate *)self lmScore];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  v16[2] = v6;
  v15[3] = @"Seq2Seq Score";
  double v7 = NSNumber;
  [(TLTransliteratorCandidate *)self seq2seqScore];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  v16[3] = v8;
  v15[4] = @"Is Extension Candidate";
  BOOL v9 = [(TLTransliteratorCandidate *)self isExtensionCandidate];
  double v10 = @"NO";
  if (v9) {
    double v10 = @"YES";
  }
  v16[4] = v10;
  v15[5] = @"Type";
  double v11 = TLTransliterationCandidateTypeAsString([(TLTransliteratorCandidate *)self type]);
  v16[5] = v11;
  double v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];

  uint64_t v13 = [v12 description];

  return v13;
}

- (NSString)inputWord
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)transliteratedWord
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (double)lmScore
{
  return self->_lmScore;
}

- (double)seq2seqScore
{
  return self->_seq2seqScore;
}

- (BOOL)isExtensionCandidate
{
  return self->_isExtensionCandidate;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transliteratedWord, 0);
  objc_storeStrong((id *)&self->_inputWord, 0);
}

@end