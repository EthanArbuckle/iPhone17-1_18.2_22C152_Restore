@interface VIFaissIndex
+ (BOOL)hasFaissSupport;
- (VIFaissIndex)initWithContentsOfFile:(id)a3 error:(id *)a4;
- (VIFaissIndex)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)computeResidualForEmbedding:(id)a3 identifier:(int64_t)a4 error:(id *)a5;
- (id)reconstructEmbeddingForIdentifier:(int64_t)a3;
- (id)searchWithQuery:(id)a3 numberOfNearestNeighbors:(int64_t)a4 options:(unint64_t)a5 error:(id *)a6;
- (int64_t)embeddingLength;
- (int64_t)identifierForIndex:(int64_t)a3;
- (int64_t)numberOfIndexedEmbeddings;
- (void)getFaissError:(id *)a3 forCode:(int64_t)a4;
- (void)getFaissError:(id *)a3 forCode:(int64_t)a4 userInfo:(id)a5;
- (void)getFaissError:(id *)a3 forFaissException:(const void *)a4;
@end

@implementation VIFaissIndex

+ (BOOL)hasFaissSupport
{
  return 1;
}

- (VIFaissIndex)initWithContentsOfFile:(id)a3 error:(id *)a4
{
  v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  v7 = [(VIFaissIndex *)self initWithContentsOfURL:v6 error:a4];

  return v7;
}

- (VIFaissIndex)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VIFaissIndex;
  v7 = [(VIFaissIndex *)&v14 init];
  if (!v7) {
    goto LABEL_8;
  }
  if (([v6 isFileURL] & 1) == 0)
  {
    if (!a4) {
      goto LABEL_9;
    }
    uint64_t v15 = *MEMORY[0x1E4F289D0];
    v16[0] = v6;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:262 userInfo:v12];

LABEL_8:
    a4 = 0;
    goto LABEL_9;
  }
  id v8 = [v6 path];
  v9 = (faiss *)[v8 fileSystemRepresentation];

  uint64_t index = faiss::read_index(v9, 0);
  value = v7->_index.__ptr_.__value_;
  v7->_index.__ptr_.__value_ = (Index *)index;
  if (value) {
    (*(void (**)(Index *))(*(void *)value + 8))(value);
  }
  a4 = v7;
LABEL_9:

  return (VIFaissIndex *)a4;
}

- (int64_t)numberOfIndexedEmbeddings
{
  return *((void *)self->_index.__ptr_.__value_ + 2);
}

- (int64_t)embeddingLength
{
  return *((int *)self->_index.__ptr_.__value_ + 2);
}

- (id)searchWithQuery:(id)a3 numberOfNearestNeighbors:(int64_t)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v7 = a5;
  id v41 = a3;
  if ([v41 dataType] != 65568)
  {
    uint64_t v18 = 5;
LABEL_8:
    [(VIFaissIndex *)self getFaissError:a6 forCode:v18];
    id v19 = 0;
    goto LABEL_40;
  }
  v9 = [v41 shape];
  uint64_t v10 = [v9 count];

  if (v10 != 2)
  {
    uint64_t v18 = 6;
    goto LABEL_8;
  }
  id v11 = v41;
  uint64_t v39 = [v11 dataPointer];
  v48 = objc_opt_new();
  v12 = [v11 shape];
  v13 = [v12 objectAtIndexedSubscript:0];
  uint64_t v14 = [v13 integerValue];

  uint64_t v15 = [v11 shape];
  v16 = [v15 objectAtIndexedSubscript:1];
  int64_t v47 = [v16 integerValue];

  if (v47 == [(VIFaissIndex *)self embeddingLength])
  {
    v54[0] = 0;
    std::vector<long long>::vector(v55, v14 * a4, v54);
    LODWORD(v53[0]) = 0;
    std::vector<float>::vector(v54, v14 * a4, v53);
    LODWORD(__p) = 0;
    std::vector<float>::vector(v53, v47 * v14 * a4, &__p);
    int v50 = 0;
    std::vector<float>::vector(&__p, v47, &v50);
    value = self->_index.__ptr_.__value_;
    v46 = self;
    if (v7) {
      (*(void (**)(Index *, uint64_t, uint64_t, int64_t, void *, void *, void *))(*(void *)value + 96))(value, v14, v39, a4, v54[0], v55[0], v53[0]);
    }
    else {
      (*(void (**)(Index *, uint64_t, uint64_t, int64_t, void *, void *))(*(void *)value + 40))(value, v14, v39, a4, v54[0], v55[0]);
    }
    if (v14 >= 1)
    {
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v40 = v14;
      char v45 = v7;
      while (a4 < 1)
      {
LABEL_30:
        ++v42;
        v43 += 4 * v47 * a4;
        if (v42 == v40) {
          goto LABEL_31;
        }
      }
      uint64_t v20 = 0;
      uint64_t v21 = v43;
      int64_t v22 = v42 * a4;
      uint64_t v44 = v39 + 4 * v42 * v47;
      while (1)
      {
        int v23 = *((_DWORD *)v54[0] + v20 + v22);
        if (*((void *)v55[0] + v20 + v22) == -1
          || (int64_t v24 = -[VIFaissIndex identifierForIndex:](self, "identifierForIndex:"), v24 == 0x7FFFFFFFFFFFFFFFLL))
        {
          v25 = 0;
          v26 = 0;
          int64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          if (v7)
          {
            v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v47];
            int64_t v31 = v47;
            uint64_t v32 = v21;
            if (v47 >= 1)
            {
              do
              {
                LODWORD(v30) = *(_DWORD *)((char *)v53[0] + v32);
                v33 = objc_msgSend(NSNumber, "numberWithFloat:", v30, v39);
                [v25 addObject:v33];

                v32 += 4;
                --v31;
              }
              while (v31);
            }
            char v7 = v45;
            self = v46;
            if ((v45 & 2) != 0)
            {
LABEL_26:
              (*(void (**)(Index *, uint64_t, void *, int64_t))(*(void *)self->_index.__ptr_.__value_
                                                                               + 104))(self->_index.__ptr_.__value_, v44, __p, v24);
              v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v47];
              v35 = __p;
              if (v52 != __p)
              {
                unint64_t v36 = 0;
                do
                {
                  LODWORD(v34) = v35[v36];
                  v37 = objc_msgSend(NSNumber, "numberWithFloat:", v34, v39);
                  [v26 addObject:v37];

                  ++v36;
                  v35 = __p;
                }
                while (v36 < (v52 - (unsigned char *)__p) >> 2);
                char v7 = v45;
                self = v46;
              }
              goto LABEL_18;
            }
          }
          else
          {
            v25 = 0;
            if ((v7 & 2) != 0) {
              goto LABEL_26;
            }
          }
          v26 = 0;
        }
LABEL_18:
        v27 = [VIFaissSearchResult alloc];
        LODWORD(v28) = v23;
        v29 = [(VIFaissSearchResult *)v27 initWithIdentifier:v24 distance:v25 embedding:v26 residual:v28];
        [v48 addObject:v29];

        ++v20;
        v21 += 4 * v47;
        if (v20 == a4) {
          goto LABEL_30;
        }
      }
    }
LABEL_31:
    id v19 = v48;
    if (__p)
    {
      v52 = __p;
      operator delete(__p);
    }
    if (v53[0])
    {
      v53[1] = v53[0];
      operator delete(v53[0]);
    }
    if (v54[0])
    {
      v54[1] = v54[0];
      operator delete(v54[0]);
    }
    if (v55[0])
    {
      v55[1] = v55[0];
      operator delete(v55[0]);
    }
  }
  else
  {
    [(VIFaissIndex *)self getFaissError:a6 forCode:3];
    id v19 = 0;
  }

LABEL_40:
  return v19;
}

- (id)reconstructEmbeddingForIdentifier:(int64_t)a3
{
  unint64_t v5 = [(VIFaissIndex *)self embeddingLength];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  int v12 = 0;
  std::vector<float>::vector(&__p, v5, &v12);
  (*(void (**)(Index *, int64_t, void *))(*(void *)self->_index.__ptr_.__value_ + 80))(self->_index.__ptr_.__value_, a3, __p);
  id v8 = __p;
  if (v14 != __p)
  {
    unint64_t v9 = 0;
    do
    {
      LODWORD(v7) = v8[v9];
      uint64_t v10 = [NSNumber numberWithFloat:v7];
      [v6 addObject:v10];

      ++v9;
      id v8 = __p;
    }
    while (v9 < (v14 - (unsigned char *)__p) >> 2);
  }
  if (__p)
  {
    uint64_t v14 = __p;
    operator delete(__p);
  }
  return v6;
}

- (id)computeResidualForEmbedding:(id)a3 identifier:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  unint64_t v8 = [(VIFaissIndex *)self embeddingLength];
  if ([v7 count] == v8)
  {
    unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
    std::vector<float>::vector(&v22, v8);
    int v19 = 0;
    std::vector<float>::vector(&__p, v8, &v19);
    if (v23 != v22)
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = [v7 objectAtIndexedSubscript:v10];
        [v11 floatValue];
        *((_DWORD *)v22 + v10) = v12;

        ++v10;
      }
      while (v10 < (v23 - (unsigned char *)v22) >> 2);
    }
    (*(void (**)(Index *))(*(void *)self->_index.__ptr_.__value_ + 104))(self->_index.__ptr_.__value_);
    uint64_t v14 = __p;
    if (v21 != __p)
    {
      unint64_t v15 = 0;
      do
      {
        LODWORD(v13) = v14[v15];
        v16 = [NSNumber numberWithFloat:v13];
        [v9 addObject:v16];

        ++v15;
        uint64_t v14 = __p;
      }
      while (v15 < (v21 - (unsigned char *)__p) >> 2);
    }
    id v17 = v9;
    if (__p)
    {
      uint64_t v21 = __p;
      operator delete(__p);
    }
    if (v22)
    {
      int v23 = v22;
      operator delete(v22);
    }
  }
  else
  {
    [(VIFaissIndex *)self getFaissError:a5 forCode:4];
    id v17 = 0;
  }

  return v17;
}

- (int64_t)identifierForIndex:(int64_t)a3
{
  return a3;
}

- (void)getFaissError:(id *)a3 forCode:(int64_t)a4
{
}

- (void)getFaissError:(id *)a3 forCode:(int64_t)a4 userInfo:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (a3)
  {
    id v9 = v7;
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.argos.faiss.error_domain" code:a4 userInfo:v7];
    *a3 = v7;
    id v8 = v9;
  }
  MEMORY[0x1F41817F8](v7, v8);
}

- (void)getFaissError:(id *)a3 forFaissException:(const void *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v11 = *MEMORY[0x1E4F28568];
    id v7 = (char *)*((void *)a4 + 1);
    unint64_t v5 = (char *)a4 + 8;
    id v6 = v7;
    if (v5[23] >= 0) {
      id v8 = v5;
    }
    else {
      id v8 = v6;
    }
    id v9 = [NSString stringWithUTF8String:v8];
    v12[0] = v9;
    unint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.argos.faiss.error_domain" code:2 userInfo:v10];
  }
}

- (void).cxx_destruct
{
  value = self->_index.__ptr_.__value_;
  self->_index.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end