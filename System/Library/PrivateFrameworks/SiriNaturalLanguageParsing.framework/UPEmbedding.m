@interface UPEmbedding
- (UPEmbedding)initWithCoordinates:(id)a3;
- (UPEmbedding)initWithProtobufEmbeddings:(id)a3 forTokenAt:(int)a4 error:(id *)p_isa;
- (id)description;
- (id)getCoordinates;
- (unint64_t)getDimension;
- (void)dealloc;
@end

@implementation UPEmbedding

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"{UPEmbedding: dimension %lu}", -[UPEmbedding getDimension](self, "getDimension"));
}

- (void)dealloc
{
  embedding = (void **)self->_embedding;
  if (embedding)
  {
    v4 = *embedding;
    if (*embedding)
    {
      embedding[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1CB775C40](embedding, 0x80C40D6874129);
  }
  v5.receiver = self;
  v5.super_class = (Class)UPEmbedding;
  [(UPEmbedding *)&v5 dealloc];
}

- (unint64_t)getDimension
{
  embedding = self->_embedding;
  v7 = 0;
  uint64_t v8 = 0;
  v6 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v6, *(const void **)embedding, *((void *)embedding + 1), (uint64_t)(*((void *)embedding + 1) - *(void *)embedding) >> 3);
  v3 = v6;
  v4 = v7;
  if (v6)
  {
    v7 = v6;
    operator delete(v6);
  }
  return (v4 - v3) >> 3;
}

- (id)getCoordinates
{
  embedding = self->_embedding;
  v10 = 0;
  uint64_t v11 = 0;
  __p = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)embedding, *((void *)embedding + 1), (uint64_t)(*((void *)embedding + 1) - *(void *)embedding) >> 3);
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:((char *)v10 - (unsigned char *)__p) >> 3];
  v4 = (double *)__p;
  objc_super v5 = v10;
  if (__p != v10)
  {
    do
    {
      v6 = [NSNumber numberWithDouble:*v4];
      [v3 addObject:v6];

      ++v4;
    }
    while (v4 != v5);
  }
  v7 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  if (__p)
  {
    v10 = (double *)__p;
    operator delete(__p);
  }
  return v7;
}

- (UPEmbedding)initWithProtobufEmbeddings:(id)a3 forTokenAt:(int)a4 error:(id *)p_isa
{
  uint64_t v6 = *(void *)&a4;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 hasEmbeddingDim])
  {
    if ([v8 hasNumToken] && objc_msgSend(v8, "numToken") > (unint64_t)(int)v6
      || (objc_msgSend(NSString, "stringWithFormat:", @"tokenIndex %u is out-of-bounds for an embedding tensor with %llu tokens", v6, objc_msgSend(v8, "numToken")), (v9 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v10 = [v8 embeddingDim];
      if (v10 * ((int)v6 + 1) <= (unint64_t)[v8 valuesCount]
        || (objc_msgSend(NSString, "stringWithFormat:", @"Protobuf message contains only %lu values but UPEmbedding for tokenIndex %u is being created (embeddingDim=%llu)", objc_msgSend(v8, "valuesCount"), v6, objc_msgSend(v8, "embeddingDim")), (v9 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        unint64_t v11 = [v8 valuesCount];
        if (!(v11 % [v8 embeddingDim])
          || (objc_msgSend(NSString, "stringWithFormat:", @"Protobuf message contains %lu embedding values which is not a multiple of %llu embedding dimensions", objc_msgSend(v8, "valuesCount"), objc_msgSend(v8, "embeddingDim")), (v9 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "embeddingDim"));
          unint64_t v13 = 0;
          uint64_t v14 = (int)v6;
          while ([v8 embeddingDim] > v13)
          {
            v15 = NSNumber;
            objc_msgSend(v8, "valuesAtIndex:", v13 + objc_msgSend(v8, "embeddingDim") * v14);
            v16 = objc_msgSend(v15, "numberWithFloat:");
            [v12 setObject:v16 atIndexedSubscript:v13];

            ++v13;
          }
          self = [(UPEmbedding *)self initWithCoordinates:v12];

          v9 = 0;
          p_isa = (id *)&self->super.isa;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    v9 = @"embeddingDim field missing from protobuf message";
  }
  if (p_isa)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = v9;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    *p_isa = (id)[v17 initWithDomain:@"com.apple.uaapcustomluframework" code:10 userInfo:v18];

    p_isa = 0;
  }
LABEL_15:

  return (UPEmbedding *)p_isa;
}

- (UPEmbedding)initWithCoordinates:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)UPEmbedding;
  if ([(UPEmbedding *)&v29 init])
  {
    __p = 0;
    v27 = 0;
    v28 = 0;
    std::vector<double>::reserve(&__p, [v4 count]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * i) doubleValue];
          uint64_t v10 = v9;
          unint64_t v11 = v27;
          if (v27 >= v28)
          {
            unint64_t v13 = (char *)__p;
            uint64_t v14 = (v27 - (unsigned char *)__p) >> 3;
            unint64_t v15 = v14 + 1;
            if ((unint64_t)(v14 + 1) >> 61) {
              std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v16 = v28 - (unsigned char *)__p;
            if ((v28 - (unsigned char *)__p) >> 2 > v15) {
              unint64_t v15 = v16 >> 2;
            }
            if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v17 = v15;
            }
            if (v17)
            {
              v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v28, v17);
              unint64_t v13 = (char *)__p;
              unint64_t v11 = v27;
            }
            else
            {
              v18 = 0;
            }
            v19 = &v18[8 * v14];
            *(void *)v19 = v10;
            v12 = v19 + 8;
            while (v11 != v13)
            {
              uint64_t v20 = *((void *)v11 - 1);
              v11 -= 8;
              *((void *)v19 - 1) = v20;
              v19 -= 8;
            }
            __p = v19;
            v27 = v12;
            v28 = &v18[8 * v17];
            if (v13) {
              operator delete(v13);
            }
          }
          else
          {
            *(void *)v27 = v9;
            v12 = v11 + 8;
          }
          v27 = v12;
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v6);
    }

    operator new();
  }

  return 0;
}

@end