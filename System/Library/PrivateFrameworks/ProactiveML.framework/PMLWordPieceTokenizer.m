@interface PMLWordPieceTokenizer
- (PMLWordPieceTokenizer)initWithVocab:(id)a3;
- (id)tokenize:(id)a3 withLength:(unint64_t)a4;
- (int)toTokens:(_NSRange *)a3 fromInput:(id)a4 withLength:(unint64_t)a5;
- (int)tokenizeToIds:(float *)a3 fromString:(id)a4 tokens:(_NSRange *)a5 tokenCount:(int)a6 length:(unint64_t)a7;
- (unsigned)endId;
- (unsigned)padId;
- (unsigned)startId;
@end

@implementation PMLWordPieceTokenizer

- (void).cxx_destruct
{
}

- (unsigned)padId
{
  unsigned int v4 = [(PMLWordPieceVocabProtocol *)self->_vocab payloadForString:@"[PAD]"];
  if (v4 == -1)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PMLWordPieceTokenizer.m", 188, @"Invalid parameter not satisfying: %@", @"padId != PMLWordPieceVocabNotFound" object file lineNumber description];
  }
  return v4;
}

- (unsigned)endId
{
  unsigned int v4 = [(PMLWordPieceVocabProtocol *)self->_vocab payloadForString:@"[SEP]"];
  if (v4 == -1)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PMLWordPieceTokenizer.m", 181, @"Invalid parameter not satisfying: %@", @"endId != PMLWordPieceVocabNotFound" object file lineNumber description];
  }
  return v4;
}

- (unsigned)startId
{
  unsigned int v4 = [(PMLWordPieceVocabProtocol *)self->_vocab payloadForString:@"[CLS]"];
  if (v4 == -1)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PMLWordPieceTokenizer.m", 174, @"Invalid parameter not satisfying: %@", @"startId != PMLWordPieceVocabNotFound" object file lineNumber description];
  }
  return v4;
}

- (int)tokenizeToIds:(float *)a3 fromString:(id)a4 tokens:(_NSRange *)a5 tokenCount:(int)a6 length:(unint64_t)a7
{
  id v47 = a4;
  id v10 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:206];
  objc_msgSend(@"##", "getCharacters:range:", objc_msgSend(v10, "mutableBytes"), 0, 2);
  v11 = objc_opt_new();
  id v12 = v10;
  uint64_t v46 = [v12 mutableBytes];
  LODWORD(v13) = 0;
  v39 = v12;
  if (a6 >= 1)
  {
    SEL v38 = a2;
    if (a7)
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      __dst = (char *)(v46 + 4);
      CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
      unint64_t v17 = a6;
      unint64_t v18 = 0;
      unint64_t v43 = v17;
      unint64_t v44 = a7;
      do
      {
        v19 = &a5[v14];
        unint64_t length = v19->length;
        if (length < 0x65)
        {
          NSUInteger location = v19->location;
          unint64_t v24 = length + v19->location;
          [v47 getCharacters:__dst range:v19->location];
          if (location >= v24)
          {
            uint64_t v13 = v15;
          }
          else
          {
            unint64_t v40 = v24;
            unint64_t v41 = v18;
            NSUInteger v25 = location;
            int v42 = v15;
            LODWORD(v13) = v15;
            NSUInteger v49 = location;
            while (1)
            {
              unint64_t v26 = v24 - v25;
              if (v24 == v25) {
                break;
              }
              v27 = (const UniChar *)(v46 + 4 * (v25 == location));
              while (1)
              {
                v28 = v11;
                CFStringRef v29 = CFStringCreateWithCharactersNoCopy(0, v27, 2 * (v25 != v49) + v26, v16);
                CFStringReplaceAll(v28, v29);

                CFRelease(v29);
                unsigned int v30 = [(PMLWordPieceVocabProtocol *)self->_vocab payloadForString:v28];
                if (v30 != -1) {
                  break;
                }
                if (!--v26) {
                  goto LABEL_24;
                }
              }
              a7 = v44;
              if ((int)v13 >= v44)
              {
                int v31 = 0;
              }
              else
              {
                a3[(int)v13] = (float)v30;
                int v31 = 1;
              }
              unint64_t v17 = v43;
              v25 += v26;
              unint64_t v24 = v40;
              memmove(__dst, &__dst[2 * v26], 2 * (v40 - v25));
              uint64_t v13 = (v31 + v13);
              NSUInteger location = v49;
              if (v40 <= v25) {
                goto LABEL_30;
              }
            }
LABEL_24:
            unsigned int v32 = [(PMLWordPieceVocabProtocol *)self->_vocab payloadForString:@"[UNK]"];
            if (v32 == -1)
            {
              v36 = [MEMORY[0x263F08690] currentHandler];
              [v36 handleFailureInMethod:v38, self, @"PMLWordPieceTokenizer.m", 161, @"Invalid parameter not satisfying: %@", @"unkToken != PMLWordPieceVocabNotFound" object file lineNumber description];
            }
            a7 = v44;
            if (v41 >= v44)
            {
              int v33 = 0;
            }
            else
            {
              a3[v41] = (float)v32;
              int v33 = 1;
            }
            unint64_t v17 = v43;
            uint64_t v13 = (v33 + v42);
          }
        }
        else
        {
          unsigned int v21 = [(PMLWordPieceVocabProtocol *)self->_vocab payloadForString:@"[UNK]"];
          if (v21 == -1)
          {
            [MEMORY[0x263F08690] currentHandler];
            v35 = unint64_t v34 = v18;
            [v35 handleFailureInMethod:v38, self, @"PMLWordPieceTokenizer.m", 132, @"Invalid parameter not satisfying: %@", @"unkToken != PMLWordPieceVocabNotFound" object file lineNumber description];

            unint64_t v18 = v34;
          }
          if (v18 >= a7)
          {
            int v22 = 0;
          }
          else
          {
            a3[v18] = (float)v21;
            int v22 = 1;
          }
          uint64_t v13 = (v22 + v15);
        }
LABEL_30:
        if (++v14 >= v17) {
          break;
        }
        unint64_t v18 = (int)v13;
        uint64_t v15 = v13;
      }
      while ((int)v13 != a7);
    }
  }

  return v13;
}

- (int)toTokens:(_NSRange *)a3 fromInput:(id)a4 withLength:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  _PASIterateLongChars();
  NSUInteger v8 = v15[3];
  v9 = v23;
  int v10 = *((_DWORD *)v23 + 6);
  if (v8)
  {
    if (v10 >= a5)
    {
      int v12 = 0;
    }
    else
    {
      v11 = &a3[v10];
      v11->NSUInteger location = v19[3];
      v11->unint64_t length = v8;
      int v12 = 1;
    }
    v10 += v12;
    *((_DWORD *)v9 + 6) = v10;
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

uint64_t __55__PMLWordPieceTokenizer_toTokens_fromInput_withLength___block_invoke(uint64_t result, UTF32Char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(result + 56) != *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v8 = result;
    result = CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(result + 64), a2);
    uint64_t v9 = *(void *)(*(void *)(v8 + 40) + 8);
    uint64_t v10 = *(void *)(v9 + 24);
    if (a2 == 176 || result)
    {
      *(void *)(v9 + 24) = v10 + a5;
    }
    else
    {
      if (v10)
      {
        uint64_t v11 = *(void *)(*(void *)(v8 + 32) + 8);
        int v12 = *(_DWORD *)(v11 + 24);
        if (*(void *)(v8 + 56) <= (unint64_t)v12)
        {
          int v14 = 0;
        }
        else
        {
          uint64_t v13 = (void *)(*(void *)(v8 + 72) + 16 * v12);
          *uint64_t v13 = *(void *)(*(void *)(*(void *)(v8 + 48) + 8) + 24);
          v13[1] = v10;
          uint64_t v11 = *(void *)(*(void *)(v8 + 32) + 8);
          int v12 = *(_DWORD *)(v11 + 24);
          int v14 = 1;
        }
        *(_DWORD *)(v11 + 24) = v12 + v14;
      }
      result = CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(v8 + 80), a2);
      if (!result)
      {
        uint64_t v15 = *(void *)(*(void *)(v8 + 32) + 8);
        int v16 = *(_DWORD *)(v15 + 24);
        if (*(void *)(v8 + 56) <= (unint64_t)v16)
        {
          int v18 = 0;
        }
        else
        {
          uint64_t v17 = (void *)(*(void *)(v8 + 72) + 16 * v16);
          *uint64_t v17 = a4;
          v17[1] = a5;
          uint64_t v15 = *(void *)(*(void *)(v8 + 32) + 8);
          int v16 = *(_DWORD *)(v15 + 24);
          int v18 = 1;
        }
        *(_DWORD *)(v15 + 24) = v16 + v18;
      }
      *(void *)(*(void *)(*(void *)(v8 + 48) + 8) + 24) = a4 + a5;
      *(void *)(*(void *)(*(void *)(v8 + 40) + 8) + 24) = 0;
    }
  }
  return result;
}

- (id)tokenize:(id)a3 withLength:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 >= 0x200) {
    unint64_t v7 = 512;
  }
  else {
    unint64_t v7 = a4;
  }
  unint64_t v8 = (4 * v7) | 3;
  memptr = 0;
  uint64_t v20 = 0;
  if (v8 > 0x194)
  {
    int v15 = malloc_type_posix_memalign(&memptr, 8uLL, 4 * v7, 0x100004052888210uLL);
    LOBYTE(v20) = 0;
    if (v15) {
      goto LABEL_19;
    }
    uint64_t v9 = (char *)memptr;
  }
  else
  {
    uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v9, (4 * v7) | 3);
  }
  unint64_t v10 = (16 * v7) | 7;
  memptr = 0;
  uint64_t v20 = 0;
  if (v10 <= 0x328)
  {
    uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v11, (16 * v7) | 7);
    goto LABEL_8;
  }
  int v16 = malloc_type_posix_memalign(&memptr, 8uLL, 16 * v7, 0x1000040451B5BE8uLL);
  LOBYTE(v20) = 0;
  if (v16)
  {
LABEL_19:
    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v17);
  }
  uint64_t v11 = (char *)memptr;
LABEL_8:
  int v12 = (void *)MEMORY[0x223C7E5C0]();
  uint64_t v13 = +[PMLSparseVector sparseVectorFromDense:v9 length:[(PMLWordPieceTokenizer *)self tokenizeToIds:v9 fromString:v6 tokens:v11 tokenCount:[(PMLWordPieceTokenizer *)self toTokens:v11 fromInput:v6 withLength:v7] length:v7]];
  if (v8 >= 0x195) {
    free(v9);
  }
  if (v10 >= 0x329) {
    free(v11);
  }

  return v13;
}

- (PMLWordPieceTokenizer)initWithVocab:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    unint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PMLWordPieceTokenizer.m", 56, @"Invalid parameter not satisfying: %@", @"vocab" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PMLWordPieceTokenizer;
  unint64_t v7 = [(PMLWordPieceTokenizer *)&v11 init];
  unint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_vocab, a3);
  }

  return v8;
}

@end