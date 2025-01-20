@interface PAEPhotosFilters
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)read:(id)a3 red:(float *)a4 green:(float *)a5 blue:(float *)a6;
- (BOOL)readCubeLine:(id)a3 intoLUTEntries:(void *)a4;
- (BOOL)variesOverTime;
- (HGRef<HGBitmap>)lutBitmapForFilter:(int)a3 lutDimensions:(int *)a4;
- (PAEPhotosFilters)initWithAPIManager:(id)a3;
- (id).cxx_construct;
- (id)LUTFromCache:(int)a3 atPath:(id)a4;
- (id)lutFromCcubeFile:(id)a3;
- (id)lutFromCubeFile:(id)a3;
- (id)lutFromScubeFile:(id)a3;
- (id)properties;
- (id)readCubeData:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation PAEPhotosFilters

- (PAEPhotosFilters)initWithAPIManager:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PAEPhotosFilters;
  v3 = [(PAESharedDefaultBase *)&v5 initWithAPIManager:a3];
  if (v3)
  {
    v3->LUTcache = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    v3->LUTCubeURL = 0;
    v3->LUTScubeURL = 0;
    v3->LUTCcubeURL = 0;
    v3->whichFilter = -1;
  }
  return v3;
}

- (void)dealloc
{
  p_cacheMutex = &self->cacheMutex;
  PCMutex::lock(&self->cacheMutex);
  char v5 = 1;

  self->LUTCubeURL = 0;
  self->LUTScubeURL = 0;

  self->LUTCcubeURL = 0;
  PCMutex::unlock(&self->cacheMutex);
  v3.receiver = self;
  v3.super_class = (Class)PAEPhotosFilters;
  [(PAESharedDefaultBase *)&v3 dealloc];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithInt:6];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:67584];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:591872];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"SupportsHeliumRendering", v5, @"PixelTransformSupport", v6, @"SDRWorkingSpace", v7, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEPhotosFilters;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121CE48];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"PhotosFilter::Filter", 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", @"PhotosFilter::Entries", 0, 0), "componentsSeparatedByString:", @"|"), 1);
  }
  return v3 != 0;
}

- (BOOL)read:(id)a3 red:(float *)a4 green:(float *)a5 blue:(float *)a6
{
  if (![a3 scanFloat:a4] || !objc_msgSend(a3, "scanFloat:", a5)) {
    return 0;
  }

  return [a3 scanFloat:a6];
}

- (BOOL)readCubeLine:(id)a3 intoLUTEntries:(void *)a4
{
  objc_super v6 = (void *)[MEMORY[0x1E4F28FE8] scannerWithString:a3];
  [v6 setCaseSensitive:0];
  if ([v6 scanString:@"TITLE " intoString:0])
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  if ([v6 scanString:@"DOMAIN_MIN " intoString:0]
    || [v6 scanString:@"DOMAIN_MAX " intoString:0])
  {
    char v8 = [(PAEPhotosFilters *)self read:v6 red:&v15 green:(char *)&v15 + 4 blue:(char *)&v15 + 8];
LABEL_9:
    LOBYTE(v7) = v8;
    return v7;
  }
  if ([v6 scanString:@"LUT_1D_SIZE " intoString:0]
    || [v6 scanString:@"LUT_3D_SIZE " intoString:0])
  {
    *(void *)&long long v15 = 0;
    char v8 = [v6 scanInteger:&v15];
    goto LABEL_9;
  }
  long long v15 = xmmword_1B7E734D0;
  BOOL v7 = [(PAEPhotosFilters *)self read:v6 red:&v15 green:(char *)&v15 + 4 blue:(char *)&v15 + 8];
  if (v7)
  {
    if (*(float *)&v15 >= 0.0)
    {
      if (*(float *)&v15 <= 1.0) {
        char v10 = (int)(float)(*(float *)&v15 * 255.0);
      }
      else {
        char v10 = -1;
      }
    }
    else
    {
      char v10 = 0;
    }
    LOBYTE(v14) = v10;
    if (*((float *)&v15 + 1) >= 0.0)
    {
      if (*((float *)&v15 + 1) <= 1.0) {
        char v11 = (int)(float)(*((float *)&v15 + 1) * 255.0);
      }
      else {
        char v11 = -1;
      }
    }
    else
    {
      char v11 = 0;
    }
    BYTE1(v14) = v11;
    if (*((float *)&v15 + 2) >= 0.0)
    {
      if (*((float *)&v15 + 2) <= 1.0) {
        char v12 = (int)(float)(*((float *)&v15 + 2) * 255.0);
      }
      else {
        char v12 = -1;
      }
    }
    else
    {
      char v12 = 0;
    }
    BYTE2(v14) = v12;
    if (*((float *)&v15 + 3) >= 0.0)
    {
      if (*((float *)&v15 + 3) <= 1.0) {
        int v13 = (int)(float)(*((float *)&v15 + 3) * 255.0);
      }
      else {
        LOBYTE(v13) = -1;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
    HIBYTE(v14) = v13;
    std::vector<RGBA8Pixel>::push_back[abi:ne180100]((void **)a4, &v14);
  }
  return v7;
}

- (id)readCubeData:(id)a3 error:(id *)a4
{
  objc_super v6 = (void *)[[NSString alloc] initWithData:a3 encoding:4];
  BOOL v7 = (void *)[MEMORY[0x1E4F28FE8] scannerWithString:v6];
  uint64_t v8 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  __p = 0;
  v20 = 0;
  uint64_t v9 = 1;
  uint64_t v21 = 0;
  while (1)
  {
    if ([v7 isAtEnd])
    {

      char v10 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:__p length:v20 - (unsigned char *)__p];
      goto LABEL_20;
    }
    if ([v7 scanString:@"#" intoString:0])
    {
      if (([v7 scanUpToCharactersFromSet:v8 intoString:0] & 1) == 0)
      {
        if (a4)
        {
          uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Error on line %lu: Invalid comment", v9);
          uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x1E4F28588], 0);
          *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"Color Cube Converter Domain" code:1 userInfo:v12];
          NSLog(&stru_1F119C630.isa, v11);
        }
        else
        {
          NSLog(&cfstr_ErrorOnLineLuI.isa, v9);
        }
        goto LABEL_19;
      }
      goto LABEL_8;
    }
    uint64_t v18 = 0;
    if (([v7 scanUpToCharactersFromSet:v8 intoString:&v18] & 1) == 0) {
      break;
    }
    if (![(PAEPhotosFilters *)self readCubeLine:v18 intoLUTEntries:&__p])
    {
      if (a4)
      {
        uint64_t v15 = [NSString stringWithFormat:@"Error on line %lu: Unable to parse line: \"%@\".", v9, v18];
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x1E4F28588], 0);
        *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"Color Cube Converter Domain" code:3 userInfo:v16];
        NSLog(&stru_1F119C630.isa, v15);
      }
      else
      {
        NSLog(&cfstr_ErrorOnLineLuU_0.isa, v9, v18);
      }
      goto LABEL_19;
    }
LABEL_8:
    ++v9;
  }
  if (a4)
  {
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Error on line %lu: Unable to read text", v9);
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E4F28588], 0);
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"Color Cube Converter Domain" code:2 userInfo:v14];
    NSLog(&stru_1F119C630.isa, v13);
  }
  else
  {
    NSLog(&cfstr_ErrorOnLineLuU.isa, v9);
  }
LABEL_19:

  char v10 = 0;
LABEL_20:
  if (__p)
  {
    v20 = __p;
    operator delete(__p);
  }
  return v10;
}

- (id)lutFromCubeFile:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:");
  if (v5)
  {
    id result = [(PAEPhotosFilters *)self readCubeData:v5 error:&v7];
    if (result) {
      return result;
    }
    NSLog(&cfstr_ErrorReadingCu.isa, v7);
  }
  else
  {
    NSLog(&cfstr_ErrorOpeningCu.isa, a3);
  }
  return 0;
}

- (id)lutFromScubeFile:(id)a3
{
  if (a3) {
    return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:");
  }
  else {
    return 0;
  }
}

- (id)lutFromCcubeFile:(id)a3
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3];
  uint64_t v4 = [v3 bytes];
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  __p = 0;
  v25 = 0;
  v26 = 0;
  unint64_t v7 = (unint64_t)[v3 length] >> 4;
  do
  {
    uint64_t v8 = (float *)(v4 + 16 * v6);
    float v9 = *v8;
    if (*v8 >= 0.0)
    {
      if (v9 <= 1.0) {
        int v10 = (int)(float)(v9 * 255.0);
      }
      else {
        int v10 = 255;
      }
    }
    else
    {
      int v10 = 0;
    }
    float v11 = v8[1];
    if (v11 >= 0.0)
    {
      if (v11 <= 1.0) {
        int v12 = (int)(float)(v11 * 255.0);
      }
      else {
        int v12 = 255;
      }
    }
    else
    {
      int v12 = 0;
    }
    float v13 = v8[2];
    if (v13 >= 0.0)
    {
      if (v13 <= 1.0) {
        int v14 = (int)(float)(v13 * 255.0);
      }
      else {
        int v14 = 255;
      }
    }
    else
    {
      int v14 = 0;
    }
    if (v5 >= v26)
    {
      uint64_t v15 = v5 - __p;
      if ((unint64_t)(v15 + 1) >> 62) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v16 = ((char *)v26 - (char *)__p) >> 1;
      if (v16 <= v15 + 1) {
        unint64_t v16 = v15 + 1;
      }
      if ((unint64_t)((char *)v26 - (char *)__p) >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v16;
      }
      if (v17) {
        uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v26, v17);
      }
      else {
        uint64_t v18 = 0;
      }
      v19 = (unsigned int *)&v18[4 * v15];
      unsigned int *v19 = (v12 << 8) | (v14 << 16) | v10 | 0xFF000000;
      uint64_t v5 = v19 + 1;
      v20 = v25;
      if (v25 != __p)
      {
        do
        {
          unsigned int v21 = *--v20;
          *--v19 = v21;
        }
        while (v20 != __p);
        v20 = __p;
      }
      __p = v19;
      v26 = (unsigned int *)&v18[4 * v17];
      if (v20) {
        operator delete(v20);
      }
    }
    else
    {
      *v5++ = (v12 << 8) | (v14 << 16) | v10 | 0xFF000000;
    }
    v25 = v5;
    ++v6;
  }
  while (v6 != v7);
  v22 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:__p length:(char *)v5 - (char *)__p];
  if (__p) {
    operator delete(__p);
  }
  return v22;
}

- (id)LUTFromCache:(int)a3 atPath:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:");
  p_cacheMutex = &self->cacheMutex;
  PCMutex::lock(&self->cacheMutex);
  char v37 = 1;
  uint64_t v8 = self;
  float v9 = (void *)[(NSMutableDictionary *)self->LUTcache objectForKey:v7];
  id v10 = (id)[v9 objectForKey:@"LUTData"];
  float v11 = (void *)[v9 objectForKey:@"LUT Path"];
  if (v10 && ([v11 isEqualToString:a4] & 1) != 0) {
    goto LABEL_43;
  }
  if (a3 > 28)
  {
    switch(a3)
    {
      case 32:
        id v18 = [(PAEPhotosFilters *)self lutFromCcubeFile:a4];
        break;
      case 31:
        id v18 = [(PAEPhotosFilters *)self lutFromScubeFile:a4];
        break;
      case 30:
        id v18 = [(PAEPhotosFilters *)self lutFromCubeFile:a4];
        break;
      default:
        goto LABEL_18;
    }
    id v10 = v18;
LABEL_18:
    if (!v10) {
      goto LABEL_43;
    }
    goto LABEL_30;
  }
  int v12 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  float v13 = off_1E616BAC8[a3];
  uint64_t v14 = [v12 pathForResource:v13 ofType:@"scube"];
  if (a3 >= 16)
  {
    uint64_t v15 = off_1E616BBB0[a3 - 16];
    unint64_t v16 = (void *)[MEMORY[0x1E4F1E040] filterWithName:v15];
    if (v16
      || [(__CFString *)v15 hasSuffix:@"Background"]
      && (unint64_t v16 = objc_msgSend(MEMORY[0x1E4F1E040], "filterWithName:", -[__CFString stringByReplacingOccurrencesOfString:withString:](v15, "stringByReplacingOccurrencesOfString:withString:", @"Background", &stru_1F119C770))) != 0)
    {
      if (a3 == 27) {
        [v16 setValue:&unk_1F11EC268 forKey:*MEMORY[0x1E4F1E510]];
      }
      if (objc_opt_respondsToSelector())
      {
        if ([(__CFString *)v15 hasSuffix:@"Background"]) {
          uint64_t v17 = [v16 backgroundCubePath];
        }
        else {
          uint64_t v17 = [v16 cubePath];
        }
        uint64_t v14 = v17;
      }
    }
    else
    {
      NSLog(&cfstr_UnableToFindSc.isa);
    }
  }
  if (!v14)
  {
    v19 = (void *)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.motion.contentfilters"];
    if (!v19 || (uint64_t v14 = [v19 pathForResource:v13 ofType:@"scube"]) == 0)
    {
      NSLog(&cfstr_UnableToLoadLu.isa, v13);
      uint64_t v14 = 0;
    }
  }
  id v10 = [(PAEPhotosFilters *)self lutFromScubeFile:v14];
  if (v10)
  {
LABEL_30:
    uint64_t v31 = v7;
    if ((unint64_t)[(NSMutableDictionary *)self->LUTcache count] >= 2)
    {
      uint64_t v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      unsigned int v21 = (void *)[(NSMutableDictionary *)self->LUTcache allKeys];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v22)
      {
        id v29 = v10;
        id v30 = a4;
        uint64_t v23 = 0;
        uint64_t v24 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v33 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            v27 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v8->LUTcache, "objectForKey:", v26), "objectForKey:", @"CacheTime");
            if ([v27 compare:v20] == -1)
            {
              uint64_t v23 = v26;
              uint64_t v20 = (uint64_t)v27;
            }
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v22);
        id v10 = v29;
        a4 = v30;
        if (v23) {
          [(NSMutableDictionary *)v8->LUTcache removeObjectForKey:v23];
        }
      }
    }
    -[NSMutableDictionary setObject:forKey:](v8->LUTcache, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v10, @"LUTData", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", 0.0), @"CacheTime", a4, @"LUT Path", 0), v31);
  }
LABEL_43:
  if (p_cacheMutex && v37) {
    PCMutex::unlock(p_cacheMutex);
  }
  return v10;
}

- (HGRef<HGBitmap>)lutBitmapForFilter:(int)a3 lutDimensions:(int *)a4
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v8 = v4;
  *uint64_t v4 = 0;
  if ((a3 - 30) > 2) {
    float v9 = &stru_1F119C770;
  }
  else {
    float v9 = (__CFString *)[*(id *)((char *)&self->super.super.super.isa + *off_1E616BC18[a3 - 30]) path];
  }
  id v10 = [(PAEPhotosFilters *)self LUTFromCache:v6 atPath:v9];
  if (v10)
  {
    float v11 = v10;
    size_t v12 = [v10 length];
    int v13 = (int)cbrt((double)(v12 >> 2));
    *a4 = v13;
    uint64_t v14 = HGObject::operator new(0x80uLL);
    id v10 = (id)HGBitmap::HGBitmap(v14, 0, (v13 * v13 + 1) | ((unint64_t)(v13 + 1) << 32), 24);
    if (v14) {
      *uint64_t v8 = v14;
    }
    int v15 = *a4;
    int v16 = 4 * v15 * v15;
    if (v14[8] == v16)
    {
      uint64_t v17 = (void *)v14[10];
      id v18 = (const void *)[v11 bytes];
      return (HGRef<HGBitmap>)memcpy(v17, v18, v12);
    }
    else if (v15 >= 1)
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      size_t v21 = v16;
      do
      {
        id v10 = memcpy((void *)(v14[10] + v14[8] * v20++), (const void *)([v11 bytes] + v19), v21);
        v19 += v21;
      }
      while (v20 < *a4);
    }
  }
  return (HGRef<HGBitmap>)v10;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v8)
  {
    int whichFilter = self->whichFilter;
    if (whichFilter == -1) {
      [v8 getIntValue:&whichFilter fromParm:1 atFxTime:a5->var0.var1];
    }
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v17 = 0;
    }
    int v16 = 32;
    id v15 = 0;
    if (whichFilter == 29)
    {
      long long v9 = *(_OWORD *)&a5->var2;
      long long v10 = *(_OWORD *)&a5->var4;
      v14[0] = *(_OWORD *)&a5->var0.var0;
      v14[1] = v9;
      v14[2] = v10;
      [(PAESharedDefaultBase *)self getHeliumImage:&v15 layerOffsetX:0 layerOffsetY:0 requestInfo:v14 fromParm:2 atTime:a5->var0.var1];
      int v16 = [v15 height];
      unsigned int v11 = 27;
    }
    else
    {
      -[PAEPhotosFilters lutBitmapForFilter:lutDimensions:](self, "lutBitmapForFilter:lutDimensions:");
      unsigned int v11 = 24;
    }
    size_t v12 = (HGNode *)HGObject::operator new(0x210uLL);
    HGApply3DLUT::HGApply3DLUT(v12, v16, v11, 1, 0, 1, 1, 1, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0);
  }
  return 0;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end