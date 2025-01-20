@interface TXRTexture
- (BOOL)cubemap;
- (BOOL)exportToURL:(id)a3 error:(id *)a4;
- (NSArray)mipmapLevels;
- (TXRTexture)initWithContentsOfURL:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6;
- (TXRTexture)initWithData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6;
- (TXRTexture)initWithDataSourceProvider:(id)a3;
- (TXRTexture)initWithDimensions:(unint64_t)a3 pixelFormat:(unint64_t)a4 alphaInfo:(unint64_t)a5 mipmapLevelCount:(unint64_t)a6 arrayLength:(BOOL)a7 cubemap:(id)a8 bufferAllocator:;
- (__n128)dimensions;
- (id)copyWithPixelFormat:(unint64_t)a3 options:(id)a4 bufferAllocator:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)exportToAssetCatalogWithName:(id)a3 location:(id)a4 error:(id *)a5;
- (unint64_t)alphaInfo;
- (unint64_t)pixelFormat;
- (void)generateMipmapsForRange:(_NSRange)a3 filter:(unint64_t)a4 error:(id *)a5;
- (void)reformat:(unint64_t)a3 gammaDegamma:(BOOL)a4 bufferAllocator:(id)a5 error:(id *)a6;
@end

@implementation TXRTexture

- (TXRTexture)initWithDataSourceProvider:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TXRTexture;
  v5 = [(TXRTexture *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    mipmapLevels = v5->_mipmapLevels;
    v5->_mipmapLevels = (NSMutableArray *)v6;

    v8 = [v4 provideTextureInfo];
    v5->_cubemap = [v8 cubemap];
    v5->_pixelFormat = [v8 pixelFormat];
    v5->_alphaInfo = [v8 alphaInfo];
    [v8 dimensions];
    *(_OWORD *)v5->_dimensions = v9;
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "mipmapLevelCount"));
    v11 = v5->_mipmapLevels;
    v5->_mipmapLevels = (NSMutableArray *)v10;

    if ([v8 mipmapLevelCount])
    {
      unint64_t v12 = 0;
      do
      {
        v13 = v5->_mipmapLevels;
        id v14 = -[TXRMipmapLevel initAsLevel:arrayLength:cubemap:dataSourceProvider:]([TXRMipmapLevel alloc], "initAsLevel:arrayLength:cubemap:dataSourceProvider:", v12, [v8 arrayLength], objc_msgSend(v8, "cubemap"), v4);
        [(NSMutableArray *)v13 addObject:v14];

        ++v12;
      }
      while (v12 < [v8 mipmapLevelCount]);
    }
  }
  return v5;
}

- (TXRTexture)initWithContentsOfURL:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = (TXRDefaultBufferAllocator *)a4;
  id v12 = a5;
  if (!v11) {
    v11 = objc_alloc_init(TXRDefaultBufferAllocator);
  }
  bufferAllocator = self->_bufferAllocator;
  self->_bufferAllocator = (TXRBufferAllocator *)v11;
  id v14 = v11;

  v15 = [[TXRFileDataSourceProvider alloc] initWithURL:v10 bufferAllocator:v14 options:v12 error:a6];
  objc_super v16 = [(TXRTexture *)self initWithDataSourceProvider:v15];

  return v16;
}

- (TXRTexture)initWithDimensions:(unint64_t)a3 pixelFormat:(unint64_t)a4 alphaInfo:(unint64_t)a5 mipmapLevelCount:(unint64_t)a6 arrayLength:(BOOL)a7 cubemap:(id)a8 bufferAllocator:
{
  BOOL v9 = a7;
  long long v25 = v8;
  v15 = (TXRDefaultBufferAllocator *)a8;
  v27.receiver = self;
  v27.super_class = (Class)TXRTexture;
  objc_super v16 = [(TXRTexture *)&v27 init];
  if (v16)
  {
    if (!v15) {
      v15 = objc_alloc_init(TXRDefaultBufferAllocator);
    }
    objc_storeStrong((id *)&v16->_bufferAllocator, v15);
    v16->_pixelFormat = a3;
    *(_OWORD *)v16->_dimensions = v25;
    v16->_cubemap = v9;
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a5];
    mipmapLevels = v16->_mipmapLevels;
    v16->_mipmapLevels = (NSMutableArray *)v17;

    if (a5)
    {
      uint64_t v19 = 0;
      long long v20 = v25;
      do
      {
        long long v26 = v20;
        v21 = v16->_mipmapLevels;
        id v22 = [[TXRMipmapLevel alloc] initAsLevel:v19 dimensions:a3 pixelFormat:a4 alphaInfo:a6 arrayLength:v9 cubemap:v15 bufferAllocator:*(double *)&v20];
        [(NSMutableArray *)v21 addObject:v22];

        *(uint32x2_t *)&long long v20 = vmax_u32(vshr_n_u32(*(uint32x2_t *)&v26, 1uLL), (uint32x2_t)0x100000001);
        int v23 = DWORD2(v26) >> 1;
        if (DWORD2(v26) >> 1 <= 1) {
          int v23 = 1;
        }
        *((void *)&v20 + 1) = __PAIR64__(HIDWORD(v26), v23);
        ++v19;
      }
      while (a5 != v19);
    }
  }

  return v16;
}

- (TXRTexture)initWithData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12.receiver = self;
  v12.super_class = (Class)TXRTexture;
  [(TXRTexture *)&v12 init];
  __assert_rtn("-[TXRTexture initWithData:bufferAllocator:options:error:]", "TXRTexture.m", 410, "!\"TODO: Must Implement\"");
}

- (id)exportToAssetCatalogWithName:(id)a3 location:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[TXRAssetCatalogSet alloc] initWithName:v8];

  id v10 = [(TXRAssetCatalogSet *)v9 exportAtLocation:v7 error:a5];

  return v10;
}

- (BOOL)exportToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 pathExtension];
  uint64_t v8 = [v7 caseInsensitiveCompare:@"ktx"];

  if (v8)
  {
    if (a4)
    {
      _newTXRErrorWithCodeAndErrorString(11, @"TXRTexture can only export to the KTX texture fil format");
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = +[TXRParserKTX exportTexture:self url:v6 error:a4];
  }

  return v9;
}

- (void)reformat:(unint64_t)a3 gammaDegamma:(BOOL)a4 bufferAllocator:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = (TXRBufferAllocator *)a5;
  if (!v10)
  {
    id v10 = self->_bufferAllocator;
    if (!v10) {
      id v10 = objc_alloc_init(TXRDefaultBufferAllocator);
    }
  }
  long long v44 = *(_OWORD *)self->_dimensions;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v43 = self;
  obj = self->_mipmapLevels;
  uint64_t v37 = [(NSMutableArray *)obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v51;
    unint64_t v11 = 0x1E6CA2000uLL;
    unint64_t v12 = 0x1E6CA2000uLL;
    do
    {
      uint64_t v13 = 0;
      long long v14 = v44;
      do
      {
        long long v45 = v14;
        if (*(void *)v51 != v36)
        {
          objc_enumerationMutation(obj);
          *(void *)&long long v14 = v45;
        }
        uint64_t v38 = v13;
        v15 = *(void **)(*((void *)&v50 + 1) + 8 * v13);
        +[TXRPixelFormatInfo packedMemoryLayoutForFormat:a3 dimensions:*(double *)&v14];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v39 = [v15 elements];
        uint64_t v41 = [v39 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v41)
        {
          uint64_t v40 = *(void *)v47;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v47 != v40) {
                objc_enumerationMutation(v39);
              }
              uint64_t v42 = v16;
              uint64_t v17 = *(void **)(*((void *)&v46 + 1) + 8 * v16);
              v18 = [v17 faces];
              uint64_t v19 = [v18 count];

              if (v19)
              {
                unint64_t v20 = 0;
                do
                {
                  id v21 = objc_alloc(*(Class *)(v11 + 2568));
                  id v22 = [v17 faces];
                  [v22 objectAtIndexedSubscript:v20];
                  unint64_t v23 = v12;
                  v24 = v10;
                  BOOL v25 = v7;
                  long long v26 = a6;
                  v28 = unint64_t v27 = a3;
                  v29 = (void *)[v21 initWithImage:v28 dimensions:v43->_pixelFormat pixelFormat:v43->_alphaInfo alphaInfo:*(double *)&v45];

                  a3 = v27;
                  a6 = v26;
                  BOOL v7 = v25;
                  id v10 = v24;
                  unint64_t v12 = v23;

                  v30 = (void *)[*(id *)(v23 + 2536) newImageFromSourceImage:v29 newPixelFormat:a3 bufferAllocator:v10 gammaDegamma:v7 error:a6];
                  [v17 setImage:v30 atFace:v20];

                  ++v20;
                  v31 = [v17 faces];
                  unint64_t v32 = [v31 count];

                  unint64_t v11 = 0x1E6CA2000;
                }
                while (v20 < v32);
              }
              uint64_t v16 = v42 + 1;
            }
            while (v42 + 1 != v41);
            uint64_t v41 = [v39 countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v41);
        }

        *(uint32x2_t *)&long long v33 = vcgt_u32(*(uint32x2_t *)&v45, (uint32x2_t)0x100000001);
        *(int32x2_t *)&long long v33 = vsub_s32((int32x2_t)vand_s8((int8x8_t)vshr_n_u32(*(uint32x2_t *)&v45, 1uLL), *(int8x8_t *)&v33), (int32x2_t)vmvn_s8(*(int8x8_t *)&v33));
        if (DWORD2(v45) <= 1) {
          int v34 = 1;
        }
        else {
          int v34 = DWORD2(v45) >> 1;
        }
        *((void *)&v33 + 1) = __PAIR64__(HIDWORD(v45), v34);
        uint64_t v13 = v38 + 1;
        long long v14 = v33;
      }
      while (v38 + 1 != v37);
      long long v44 = v33;
      uint64_t v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16, *(double *)&v33);
    }
    while (v37);
  }

  v43->_pixelFormat = a3;
}

- (void)generateMipmapsForRange:(_NSRange)a3 filter:(unint64_t)a4 error:(id *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location >= [(NSMutableArray *)self->_mipmapLevels count])
  {
    if (a5)
    {
      _newTXRErrorWithCodeAndErrorString(9, @"Range Location must be an index of an existing mipmap level");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    long long v46 = self->_bufferAllocator;
    if (!v46) {
      long long v46 = objc_alloc_init(TXRDefaultBufferAllocator);
    }
    unint64_t v10 = location + length;
    unsigned int v11 = *(_DWORD *)&self->_dimensions[4];
    if (v11 <= *(_DWORD *)&self->_dimensions[8]) {
      unsigned int v11 = *(_DWORD *)&self->_dimensions[8];
    }
    if (*(_DWORD *)self->_dimensions > v11) {
      unsigned int v11 = *(_DWORD *)self->_dimensions;
    }
    if (v11)
    {
      unint64_t v12 = -1;
      do
      {
        ++v12;
        BOOL v13 = v11 > 1;
        v11 >>= 1;
      }
      while (v13);
    }
    else
    {
      unint64_t v12 = 0xFFFFFFFFLL;
    }
    if (v10 >= v12) {
      unint64_t v10 = v12;
    }
    unint64_t v45 = location + 1;
    if (location + 1 < v10)
    {
      long long v43 = *(_OWORD *)self->_dimensions;
      unint64_t v14 = 0x1E6CA2000uLL;
      unint64_t v42 = v10;
      while (1)
      {
        NSUInteger v44 = location;
        if ([(NSMutableArray *)self->_mipmapLevels count] <= v45)
        {
          id v15 = objc_alloc(*(Class *)(v14 + 2584));
          uint64_t v16 = [(NSMutableArray *)self->_mipmapLevels objectAtIndexedSubscript:0];
          uint64_t v17 = [v16 elements];
          v18 = objc_msgSend(v15, "initAsLevel:arrayLength:cubemap:dataSourceProvider:", v45, objc_msgSend(v17, "count"), self->_cubemap, 0);

          [(NSMutableArray *)self->_mipmapLevels addObject:v18];
        }
        unint64_t v19 = a4;
        unint64_t v20 = 0;
LABEL_23:
        id v21 = [(NSMutableArray *)self->_mipmapLevels objectAtIndexedSubscript:0];
        id v22 = [v21 elements];
        unint64_t v23 = [v22 count];

        if (v20 < v23) {
          break;
        }
        int8x8_t v39 = (int8x8_t)vcgt_u32(*(uint32x2_t *)&v43, (uint32x2_t)0x100000001);
        *(int32x2_t *)&long long v40 = vsub_s32((int32x2_t)vand_s8((int8x8_t)vshr_n_u32(*(uint32x2_t *)&v43, 1uLL), v39), (int32x2_t)vmvn_s8(v39));
        if (DWORD2(v43) <= 1) {
          int v41 = 1;
        }
        else {
          int v41 = DWORD2(v43) >> 1;
        }
        *((void *)&v40 + 1) = __PAIR64__(HIDWORD(v43), v41);
        NSUInteger location = v44 + 1;
        long long v43 = v40;
        ++v45;
        a4 = v19;
        unint64_t v14 = 0x1E6CA2000;
        if (v45 == v42) {
          goto LABEL_36;
        }
      }
      for (unint64_t i = 0; ; ++i)
      {
        BOOL v25 = [(NSMutableArray *)self->_mipmapLevels objectAtIndexedSubscript:0];
        long long v26 = [v25 elements];
        unint64_t v27 = [v26 objectAtIndexedSubscript:0];
        v28 = [v27 faces];
        unint64_t v29 = [v28 count];

        if (i >= v29)
        {
          ++v20;
          goto LABEL_23;
        }
        v30 = [(NSMutableArray *)self->_mipmapLevels objectAtIndexedSubscript:v44];
        v31 = [v30 elements];
        unint64_t v32 = [v31 objectAtIndexedSubscript:v20];
        long long v33 = [v32 faces];
        int v34 = [v33 objectAtIndexedSubscript:i];

        v35 = [[TXRImageIndependent alloc] initWithImage:v34 dimensions:self->_pixelFormat pixelFormat:self->_alphaInfo alphaInfo:*(double *)&v43];
        id v36 = +[TXRDataScaler newImageFromSourceImage:v35 bufferAllocattor:v46 filter:v19 error:a5];
        uint64_t v37 = v36;
        if (*a5 || !v36) {
          break;
        }
        uint64_t v38 = [(NSMutableArray *)self->_mipmapLevels objectAtIndexedSubscript:v45];
        [v38 setImage:v37 atElement:v20 atFace:i];
      }
    }
LABEL_36:
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [+[TXRTexture allocWithZone:](TXRTexture, "allocWithZone:") init];
  objc_storeStrong((id *)&v5->_bufferAllocator, self->_bufferAllocator);
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", a3), "initWithCapacity:", -[NSMutableArray count](self->_mipmapLevels, "count"));
  mipmapLevels = v5->_mipmapLevels;
  v5->_mipmapLevels = (NSMutableArray *)v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_mipmapLevels;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = v5->_mipmapLevels;
        unint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "copyWithZone:", a3, (void)v16);
        [(NSMutableArray *)v13 addObject:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)copyWithPixelFormat:(unint64_t)a3 options:(id)a4 bufferAllocator:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  __assert_rtn("-[TXRTexture copyWithPixelFormat:options:bufferAllocator:]", "TXRTexture.m", 574, "!\"TODO: Must Implement\"");
}

- (NSArray)mipmapLevels
{
  return &self->_mipmapLevels->super;
}

- (__n128)dimensions
{
  return a1[2];
}

- (BOOL)cubemap
{
  return self->_cubemap;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)alphaInfo
{
  return self->_alphaInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mipmapLevels, 0);
  objc_storeStrong((id *)&self->_bufferAllocator, 0);
}

@end