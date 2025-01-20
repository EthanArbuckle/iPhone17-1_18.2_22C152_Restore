@interface WordPieceTokenizerObjc
- (WordPieceTokenizerObjc)initWithVocab:(id)a3;
- (float)endId;
- (float)padId;
- (float)startId;
- (float)unkId;
- (id)tokenize:(id)a3 withLength:(unint64_t)a4;
- (int)toWordTokens:(_NSRange *)a3 wordTokensUTF8:(_NSRange *)a4 fromInput:(id)a5 withLength:(unint64_t)a6;
- (int)tokenizeToIds:(float *)a3 ranges:(_NSRange *)a4 wordIndexes:(int64_t *)a5 fromString:(id)a6 wordTokens:(_NSRange *)a7 wordTokensUTF8:(_NSRange *)a8 wordCount:(int)a9 length:(unint64_t)a10;
@end

@implementation WordPieceTokenizerObjc

- (void).cxx_destruct
{
}

- (float)unkId
{
  unsigned int v4 = [(BurstTrieDictionary *)self->_vocab payloadForString:@"[UNK]"];
  if (v4 == -1)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"WordPieceTokenizerObjc.m", 307, @"Invalid parameter not satisfying: %@", @"unkId != BurstTrieDictionaryNotFound" object file lineNumber description];
  }
  return (float)v4;
}

- (float)padId
{
  unsigned int v4 = [(BurstTrieDictionary *)self->_vocab payloadForString:@"[PAD]"];
  if (v4 == -1)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"WordPieceTokenizerObjc.m", 300, @"Invalid parameter not satisfying: %@", @"padId != BurstTrieDictionaryNotFound" object file lineNumber description];
  }
  return (float)v4;
}

- (float)endId
{
  unsigned int v4 = [(BurstTrieDictionary *)self->_vocab payloadForString:@"[SEP]"];
  if (v4 == -1)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"WordPieceTokenizerObjc.m", 293, @"Invalid parameter not satisfying: %@", @"endId != BurstTrieDictionaryNotFound" object file lineNumber description];
  }
  return (float)v4;
}

- (float)startId
{
  unsigned int v4 = [(BurstTrieDictionary *)self->_vocab payloadForString:@"[CLS]"];
  if (v4 == -1)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"WordPieceTokenizerObjc.m", 286, @"Invalid parameter not satisfying: %@", @"startId != BurstTrieDictionaryNotFound" object file lineNumber description];
  }
  return (float)v4;
}

- (int)tokenizeToIds:(float *)a3 ranges:(_NSRange *)a4 wordIndexes:(int64_t *)a5 fromString:(id)a6 wordTokens:(_NSRange *)a7 wordTokensUTF8:(_NSRange *)a8 wordCount:(int)a9 length:(unint64_t)a10
{
  unint64_t v12 = a9;
  id v65 = a6;
  id v13 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:206];
  objc_msgSend(@"##", "getCharacters:range:", objc_msgSend(v13, "mutableBytes"), 0, 2);
  v75 = objc_opt_new();
  id v58 = v13;
  uint64_t v74 = [v58 mutableBytes];
  LODWORD(v14) = 1;
  if (a9 >= 1)
  {
    unint64_t v15 = a10;
    if (a10 != 1)
    {
      v16 = a8;
      int64_t v17 = 0;
      v18 = (unsigned __int16 *)(v74 + 4);
      CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
      unint64_t v20 = 1;
      uint64_t v21 = 1;
      v61 = a8;
      v68 = a7;
      do
      {
        v22 = &a7[v17];
        unint64_t length = v22->length;
        if (length < 0x65)
        {
          v25 = v16;
          int64x2_t v69 = (int64x2_t)v16[v17];
          NSUInteger location = v22->location;
          unint64_t v27 = length + v22->location;
          [v65 getCharacters:v18 range:v22->location];
          if (location >= v27)
          {
            uint64_t v14 = v21;
            v16 = v25;
            unint64_t v12 = a9;
            a7 = v68;
          }
          else
          {
            unint64_t v28 = v27;
            unint64_t v59 = v20;
            uint64_t v29 = v69.i64[0];
            uint64_t v66 = vaddvq_s64(v69);
            NSUInteger v30 = location;
            int v60 = v21;
            LODWORD(v14) = v21;
            NSUInteger v71 = location;
            unint64_t v67 = v27;
            while (1)
            {
              NSUInteger v73 = v29;
              int v70 = v14;
              BOOL v31 = v30 == location;
              NSUInteger v72 = v30;
              unint64_t v32 = v28 - v30;
              if (!v32) {
                break;
              }
              v33 = (const UniChar *)(v74 + 4 * v31);
              NSUInteger v34 = v66 - v73;
              while (1)
              {
                v35 = v75;
                CFStringRef v36 = CFStringCreateWithCharactersNoCopy(0, v33, v32 + 2 * (v72 != v71), v19);
                CFStringReplaceAll(v35, v36);

                CFRelease(v36);
                unsigned int v37 = [(BurstTrieDictionary *)self->_vocab payloadForString:v35];
                if (v37 != -1) {
                  break;
                }
                if (v32 == 1)
                {
                  unsigned int v38 = *v18;
                }
                else
                {
                  int v39 = *(unsigned __int16 *)(v74 + 2 * v32);
                  int v40 = v18[v32 - 1];
                  BOOL v41 = (v39 & 0xFC00) == 0xD800 && (v40 & 0xFC00) == 56320;
                  unsigned int v38 = v40 + (v39 << 10) - 56613888;
                  if (!v41) {
                    unsigned int v38 = v18[v32 - 1];
                  }
                }
                if (HIWORD(v38)) {
                  uint64_t v42 = -2;
                }
                else {
                  uint64_t v42 = -1;
                }
                if (v38 - 128 < 0x780) {
                  uint64_t v43 = -2;
                }
                else {
                  uint64_t v43 = -1;
                }
                BOOL v44 = (v38 - 2048) >> 11 > 0x1E;
                unsigned int v45 = v38 - 0x10000;
                uint64_t v46 = -3;
                if (v44) {
                  uint64_t v46 = v43;
                }
                BOOL v47 = v45 >= 0x100000;
                uint64_t v48 = -4;
                if (v47) {
                  uint64_t v48 = v46;
                }
                v34 += v48;
                v32 += v42;
                if (!v32) {
                  goto LABEL_40;
                }
              }
              if (v70 >= a10)
              {
                int v51 = 0;
                unint64_t v12 = a9;
                a7 = v68;
                unint64_t v52 = v67;
                NSUInteger v50 = v73;
              }
              else
              {
                v49 = &a4[v70];
                NSUInteger v50 = v73;
                v49->NSUInteger location = v73;
                v49->unint64_t length = v34;
                a5[v70] = v17;
                a3[v70] = (float)v37;
                int v51 = 1;
                unint64_t v12 = a9;
                a7 = v68;
                unint64_t v52 = v67;
              }
              unint64_t v53 = v52 - (v32 + v72);
              v54 = &v18[v32];
              NSUInteger v30 = v32 + v72;
              memmove(v18, v54, 2 * v53);
              unint64_t v28 = v67;
              uint64_t v14 = (v51 + v70);
              uint64_t v29 = v34 + v50;
              unint64_t v15 = a10;
              NSUInteger location = v71;
              v16 = v61;
              if (v67 <= v30) {
                goto LABEL_44;
              }
            }
LABEL_40:
            unint64_t v15 = a10;
            if (v59 >= a10)
            {
              int v55 = 0;
            }
            else
            {
              a4[v59] = (_NSRange)v69;
              a5[v59] = v17;
              a3[v59] = self->_unkId;
              int v55 = 1;
            }
            v16 = v61;
            unint64_t v12 = a9;
            a7 = v68;
            uint64_t v14 = (v55 + v60);
          }
        }
        else
        {
          if (v20 >= v15)
          {
            int v24 = 0;
          }
          else
          {
            a4[v20] = v16[v17];
            a5[v20] = v17;
            a3[v20] = self->_unkId;
            int v24 = 1;
          }
          uint64_t v14 = (v24 + v21);
        }
LABEL_44:
        if (++v17 >= v12) {
          break;
        }
        unint64_t v20 = (int)v14;
        uint64_t v21 = v14;
      }
      while ((int)v14 != v15);
    }
  }
  int v56 = v14;

  return v56;
}

- (int)toWordTokens:(_NSRange *)a3 wordTokensUTF8:(_NSRange *)a4 fromInput:(id)a5 withLength:(unint64_t)a6
{
  id v9 = a5;
  uint64_t v36 = 0;
  unsigned int v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 0;
  CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3010000000;
  v19[3] = &unk_25F5A006F;
  v19[4] = 0;
  v19[5] = 0;
  _PASIterateLongChars();
  v10 = v29;
  v11 = v37;
  int v12 = *((_DWORD *)v37 + 6);
  if (v29[3])
  {
    if (v12 >= a6)
    {
      int v17 = 0;
    }
    else
    {
      NSUInteger v13 = v21[3];
      uint64_t v14 = &a4[v12];
      v14->NSUInteger location = v25[3];
      v14->unint64_t length = v13;
      NSUInteger v15 = v10[3];
      v16 = &a3[v12];
      v16->NSUInteger location = v33[3];
      v16->unint64_t length = v15;
      int v17 = 1;
    }
    v12 += v17;
    *((_DWORD *)v11 + 6) = v12;
  }
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v12;
}

- (id)tokenize:(id)a3 withLength:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v36 = 0;
  memptr = 0;
  if (a4 >= 0x200) {
    unint64_t v7 = 512;
  }
  else {
    unint64_t v7 = a4;
  }
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  v33 = 0;
  malloc_type_posix_memalign(&memptr, 8uLL, 4 * v7, 0x133F7CD2uLL);
  malloc_type_posix_memalign(&v36, 8uLL, 16 * v7, 0x511E587uLL);
  malloc_type_posix_memalign(&v35, 8uLL, 16 * v7, 0x8EFFA18uLL);
  malloc_type_posix_memalign(&v34, 8uLL, 16 * v7, 0x8287CA6AuLL);
  uint64_t v8 = malloc_type_posix_memalign(&v33, 8uLL, 8 * v7, 0x7D4EE911uLL);
  if (v7)
  {
    id v9 = v34;
    *(void *)uint64_t v34 = 0;
    v9[1] = 0;
    *(float *)memptr = self->_startId;
    *(void *)v33 = -1;
  }
  v10 = (void *)MEMORY[0x2611F71C0](v8);
  LODWORD(v32) = [(WordPieceTokenizerObjc *)self toWordTokens:v36 wordTokensUTF8:v35 fromInput:v6 withLength:v7];
  int v11 = [(WordPieceTokenizerObjc *)self tokenizeToIds:memptr ranges:v34 wordIndexes:v33 fromString:v6 wordTokens:v36 wordTokensUTF8:v35 wordCount:v32 length:v7];
  if (v7 <= v11) {
    int v12 = v7 - 1;
  }
  else {
    int v12 = v11;
  }
  NSUInteger v13 = (char *)v34;
  uint64_t v14 = v12;
  if (v7 <= v12)
  {
    v16 = (char *)memptr;
    int v17 = (char *)v33;
  }
  else
  {
    NSUInteger v15 = (char *)v34 + 16 * v12;
    *NSUInteger v15 = 0;
    v15[1] = 0;
    v16 = (char *)memptr;
    *((_DWORD *)memptr + v14) = LODWORD(self->_endId);
    int v17 = (char *)v33;
    *((void *)v33 + v14) = -1;
  }
  int v18 = v14 + 1;
  if (v7 > v18)
  {
    uint64_t v19 = v18;
    unint64_t v20 = v7 - v18;
    uint64_t v21 = &v17[8 * v19];
    uint64_t v22 = (float *)&v16[4 * v19];
    uint64_t v23 = &v13[16 * v19];
    do
    {
      *(void *)uint64_t v23 = 0;
      *((void *)v23 + 1) = 0;
      v23 += 16;
      *v22++ = self->_padId;
      *(void *)uint64_t v21 = -1;
      v21 += 8;
      --v20;
    }
    while (v20);
  }
  free(v36);
  free(v35);
  id v24 = objc_alloc(MEMORY[0x263EFF8F8]);
  v25 = (void *)[v24 initWithBytesNoCopy:memptr length:4 * v7 freeWhenDone:1];
  id v26 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v27 = (void *)[v26 initWithBytesNoCopy:v34 length:16 * v7 freeWhenDone:1];
  id v28 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v29 = (void *)[v28 initWithBytesNoCopy:v33 length:8 * v7 freeWhenDone:1];
  uint64_t v30 = [[TokenizerOutputObjc alloc] initWithTokenIds:v25 tokenRanges:v27 wordIndexes:v29];

  return v30;
}

- (WordPieceTokenizerObjc)initWithVocab:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WordPieceTokenizerObjc.m", 105, @"Invalid parameter not satisfying: %@", @"vocab" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WordPieceTokenizerObjc;
  unint64_t v7 = [(WordPieceTokenizerObjc *)&v15 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_vocab, a3);
    [(WordPieceTokenizerObjc *)v8 startId];
    v8->_startId = v9;
    [(WordPieceTokenizerObjc *)v8 endId];
    v8->_endId = v10;
    [(WordPieceTokenizerObjc *)v8 padId];
    v8->_padId = v11;
    [(WordPieceTokenizerObjc *)v8 unkId];
    v8->_unkId = v12;
  }

  return v8;
}

@end