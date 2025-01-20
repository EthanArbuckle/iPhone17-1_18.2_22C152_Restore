@interface PIReframeKeyframeSequence
- (PIReframeKeyframeSequence)initWithKeyframeArray:(id)a3;
- (int64_t)interpolation;
- (uint64_t)homographyAtTime:(long long *)a3;
- (unint64_t)count;
@end

@implementation PIReframeKeyframeSequence

- (void).cxx_destruct
{
}

- (uint64_t)homographyAtTime:(long long *)a3
{
  v3 = *(void **)(a1 + 8);
  long long v5 = *a3;
  uint64_t v6 = *((void *)a3 + 2);
  return [v3 sampleAtTime:&v5];
}

- (int64_t)interpolation
{
  return [(NUKeyframeSequenceMatrixFloat33 *)self->_homographySequence interpolation];
}

- (unint64_t)count
{
  return [(NUKeyframeSequenceMatrixFloat33 *)self->_homographySequence count];
}

- (PIReframeKeyframeSequence)initWithKeyframeArray:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PIReframeKeyframeSequence;
  v27 = [(PIReframeKeyframeSequence *)&v35 init];
  size_t v5 = [v4 count];
  uint64_t v6 = (char *)malloc_type_calloc(v5, 0x18uLL, 0x1000040504FFAC1uLL);
  size_t v26 = v5;
  v28 = (char *)malloc_type_calloc(v5, 0x30uLL, 0x1000040EED21634uLL);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v32;
    do
    {
      uint64_t v12 = 0;
      v13 = &v28[48 * v10 + 32];
      v14 = &v6[24 * v10];
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v7);
        }
        v15 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
        if (v15)
        {
          [*(id *)(*((void *)&v31 + 1) + 8 * v12) time];
        }
        else
        {
          long long v29 = 0uLL;
          uint64_t v30 = 0;
        }
        *((void *)v14 + 2) = v30;
        *(_OWORD *)v14 = v29;
        v14 += 24;
        objc_msgSend(v15, "homography", v26);
        *((_DWORD *)v13 - 6) = v16;
        *((void *)v13 - 4) = v17;
        *((_DWORD *)v13 - 2) = v18;
        *((void *)v13 - 2) = v19;
        v20 = v13 + 8;
        ++v12;
        *(void *)v13 = v21;
        v13 += 48;
        _DWORD *v20 = v22;
      }
      while (v9 != v12);
      v10 += v12;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }

  uint64_t v23 = [objc_alloc(MEMORY[0x1E4F7A530]) initWithCount:v26 times:v6 values:v28];
  homographySequence = v27->_homographySequence;
  v27->_homographySequence = (NUKeyframeSequenceMatrixFloat33 *)v23;

  free(v6);
  free(v28);

  return v27;
}

@end