@interface PAELUTFile
- (BOOL)addParameters;
- (HGRef<HGBitmap>)lutBitmapForFilter:(int)a3 lutDimensions:(int *)a4;
- (PAELUTFile)initWithAPIManager:(id)a3;
@end

@implementation PAELUTFile

- (PAELUTFile)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAELUTFile;
  result = [(PAEPhotosFilters *)&v4 initWithAPIManager:a3];
  if (result) {
    result->super.whichFilter = -1;
  }
  return result;
}

- (BOOL)addParameters
{
  v3 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [(PROAPIAccessing *)self->super.super.super._apiManager apiForProtocol:&unk_1F121CE48];
  if (v4)
  {
    v5 = (void *)v4;
    uint64_t v6 = [v3 localizedStringForKey:@"LUT File::LUT File" value:0 table:0];
    LOBYTE(v4) = [v5 addStringParameterWithName:v6 parmId:101 defaultValue:&stru_1F119C770 parmFlags:3];
  }
  return v4;
}

- (HGRef<HGBitmap>)lutBitmapForFilter:(int)a3 lutDimensions:(int *)a4
{
  uint64_t v6 = *(void *)&a3;
  v8 = v4;
  v9 = (void *)[(PROAPIAccessing *)self->super.super.super._apiManager apiForProtocol:&unk_1F121A608];
  v10.m_Obj = (HGBitmap *)[(PROAPIAccessing *)self->super.super.super._apiManager apiForProtocol:&unk_1F1219D80];
  if (v9) {
    BOOL v11 = v10.m_Obj == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    m_Obj = v10.m_Obj;
    uint64_t v18 = 0;
    [v9 getStringParameterValue:&v18 fromParm:101];
    v13 = (void *)[(HGBitmap *)m_Obj URLForMediaFolder];
    v14 = (void *)[v13 URLByAppendingPathComponent:v18];
    v15 = (void *)[v14 pathExtension];
    if ([v15 isEqualToString:@"cube"])
    {
      uint64_t v6 = 30;
      v16 = &OBJC_IVAR___PAEPhotosFilters_LUTCubeURL;
    }
    else if ([v15 isEqualToString:@"scube"])
    {
      uint64_t v6 = 31;
      v16 = &OBJC_IVAR___PAEPhotosFilters_LUTScubeURL;
    }
    else
    {
      if (![v15 isEqualToString:@"ccube"])
      {
LABEL_14:
        v17.receiver = self;
        v17.super_class = (Class)PAELUTFile;
        return [(PAEPhotosFilters *)&v17 lutBitmapForFilter:v6 lutDimensions:a4];
      }
      uint64_t v6 = 32;
      v16 = &OBJC_IVAR___PAEPhotosFilters_LUTCcubeURL;
    }
    *(Class *)((char *)&self->super.super.super.super.isa + *v16) = (Class)v14;
    goto LABEL_14;
  }
  void *v8 = 0;
  return v10;
}

@end