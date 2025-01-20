@interface NUColorSpace
+ (BOOL)shouldTagAsDisplayP3:(__CVBuffer *)a3;
+ (NUColorSpace)displayP3_HLG;
+ (NUColorSpace)displayP3_PQ;
+ (id)_loadICCProfileDataWithIdentifier:(id)a3;
+ (id)adobeRGBColorSpace;
+ (id)colorSpaceFromColorPrimaries:(id)a3 transferFunction:(id)a4 yccMatrix:(id)a5;
+ (id)colorSpaceFromVideoColorProperties:(id)a3;
+ (id)displayP3ColorSpace;
+ (id)displayP3LinearColorSpace;
+ (id)extendedLinearGrayColorSpace;
+ (id)extendedSRGBColorSpace;
+ (id)extendedSRGBLinearColorSpace;
+ (id)genericGrayColorSpace;
+ (id)genericGrayGamma2_2ColorSpace;
+ (id)genericRGBColorSpace;
+ (id)genericRGBLinearColorSpace;
+ (id)itur2100HLGColorSpace;
+ (id)itur2100PQColorSpace;
+ (id)linearGrayColorSpace;
+ (id)rec709ColorSpace;
+ (id)sRGBColorSpace;
+ (id)sRGBLinearColorSpace;
- (BOOL)hasCICP;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtended;
- (BOOL)isHDR;
- (BOOL)isRGB;
- (BOOL)isWideGamut;
- (CGColorSpace)CGColorSpace;
- (NSDictionary)cvPixelBufferAttachments;
- (NSString)descriptionName;
- (NSString)name;
- (NUColorSpace)init;
- (NUColorSpace)initWithCGColorSpace:(CGColorSpace *)a3;
- (NUColorSpace)initWithCGColorSpace:(CGColorSpace *)a3 descriptionName:(id)a4;
- (NUColorSpace)initWithColorSpaceName:(id)a3;
- (NUColorSpace)initWithICCProfileData:(id)a3 descriptionName:(id)a4;
- (float)headroom;
- (id)description;
- (id)extended;
- (id)linearized;
- (unint64_t)hash;
- (void)applyAttachmentsToCVPixelBuffer:(__CVBuffer *)a3;
- (void)dealloc;
- (void)nu_updateDigest:(id)a3;
@end

@implementation NUColorSpace

- (void).cxx_destruct
{
}

- (NSString)descriptionName
{
  return self->_descriptionName;
}

- (CGColorSpace)CGColorSpace
{
  return self->_CGColorSpace;
}

- (float)headroom
{
  MEMORY[0x1F40D9BC0](self->_CGColorSpace, 0, 0);
  return result;
}

- (id)extended
{
  if ([(NUColorSpace *)self isExtended])
  {
    v3 = self;
  }
  else
  {
    CGColorSpaceRef Extended = CGColorSpaceCreateExtended(self->_CGColorSpace);
    if (Extended)
    {
      CGColorSpaceRef v5 = Extended;
      v3 = [[NUColorSpace alloc] initWithCGColorSpace:Extended];
      CFRelease(v5);
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (id)linearized
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BaseColorSpace = CGColorSpaceGetBaseColorSpace([(NUColorSpace *)self CGColorSpace]);
  if (BaseColorSpace)
  {
    uint64_t v4 = (uint64_t)CGColorSpaceRetain(BaseColorSpace);
    goto LABEL_3;
  }
  [(NUColorSpace *)self CGColorSpace];
  if (CGColorSpaceContainsFlexGTCInfo())
  {
    *(_DWORD *)v12 = 0;
    [(NUColorSpace *)self CGColorSpace];
    if (!CGColorSpaceGetCICPInfo())
    {
      CGColorSpaceRef v5 = 0;
LABEL_4:
      v6 = v5;
      if (v5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v4 = CGColorSpaceCreateFromCICP();
LABEL_3:
    CGColorSpaceRef v5 = (CGColorSpace *)v4;
    goto LABEL_4;
  }
LABEL_9:
  v6 = [(NUColorSpace *)self CGColorSpace];
  CGColorSpaceRef v5 = 0;
LABEL_10:
  CGColorSpaceRef Linearized = CGColorSpaceCreateLinearized(v6);
  if (Linearized)
  {
    CGColorSpaceRef v8 = Linearized;
    v9 = [[NUColorSpace alloc] initWithCGColorSpace:Linearized];
    CFRelease(v8);
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_239);
    }
    v10 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v12 = 138412290;
      *(void *)&v12[4] = self;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Failed to linearize colorspace: %@", v12, 0xCu);
    }
    v9 = 0;
  }
  CGColorSpaceRelease(v5);

  return v9;
}

- (void)applyAttachmentsToCVPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CVBufferRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24A00]);
  CVBufferRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24C18]);
  CVBufferRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24BC8]);
  CVBufferRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24A90]);
  CVBufferRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24B28]);
  CGColorSpaceRef v5 = [(NUColorSpace *)self cvPixelBufferAttachments];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = objc_msgSend(v5, "keyEnumerator", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        CFStringRef v11 = *(const __CFString **)(*((void *)&v13 + 1) + 8 * i);
        v12 = [v5 objectForKeyedSubscript:v11];
        CVBufferSetAttachment(a3, v11, v12, kCVAttachmentMode_ShouldPropagate);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (NSDictionary)cvPixelBufferAttachments
{
  v31[3] = *MEMORY[0x1E4F143B8];
  v3 = +[NUColorSpace rec709ColorSpace];
  BOOL v4 = [(NUColorSpace *)self isEqual:v3];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x1E4F24AB0];
    uint64_t v6 = *MEMORY[0x1E4F24BC8];
    v30[0] = *MEMORY[0x1E4F24A90];
    v30[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F24BE0];
    v31[0] = v5;
    v31[1] = v7;
    v30[2] = *MEMORY[0x1E4F24C18];
    v31[2] = *MEMORY[0x1E4F24C48];
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = (CGColorSpace **)v31;
    v10 = v30;
LABEL_7:
    uint64_t v21 = 3;
    goto LABEL_8;
  }
  CFStringRef v11 = +[NUColorSpace displayP3ColorSpace];
  BOOL v12 = [(NUColorSpace *)self isEqual:v11];

  if (v12)
  {
    uint64_t v13 = *MEMORY[0x1E4F24AC0];
    uint64_t v14 = *MEMORY[0x1E4F24BC8];
    v28[0] = *MEMORY[0x1E4F24A90];
    v28[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4F24BE0];
    v29[0] = v13;
    v29[1] = v15;
    v28[2] = *MEMORY[0x1E4F24C18];
    v29[2] = *MEMORY[0x1E4F24C40];
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = (CGColorSpace **)v29;
    v10 = v28;
    goto LABEL_7;
  }
  long long v16 = +[NUColorSpace itur2100HLGColorSpace];
  BOOL v17 = [(NUColorSpace *)self isEqual:v16];

  if (v17)
  {
    uint64_t v18 = *MEMORY[0x1E4F24AA8];
    uint64_t v19 = *MEMORY[0x1E4F24BC8];
    v26[0] = *MEMORY[0x1E4F24A90];
    v26[1] = v19;
    uint64_t v20 = *MEMORY[0x1E4F24BD8];
    v27[0] = v18;
    v27[1] = v20;
    v26[2] = *MEMORY[0x1E4F24C18];
    v27[2] = *MEMORY[0x1E4F24C30];
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = (CGColorSpace **)v27;
    v10 = v26;
    goto LABEL_7;
  }
  uint64_t v24 = *MEMORY[0x1E4F24A00];
  v25 = [(NUColorSpace *)self CGColorSpace];
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v9 = &v25;
  v10 = &v24;
  uint64_t v21 = 1;
LABEL_8:
  v22 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:v21];

  return (NSDictionary *)v22;
}

- (void)nu_updateDigest:(id)a3
{
  id v4 = a3;
  uint64_t MD5Digest = CGColorSpaceGetMD5Digest();
  [v4 addString:@"NUColorSpace<"];
  [v4 addBytes:MD5Digest length:16];
  [v4 addString:@">"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NUColorSpace *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if (CGColorSpaceEqualToColorSpace())
      {
        BOOL v6 = 1;
      }
      else
      {
        uint64_t v16 = 0;
        BOOL v17 = &v16;
        uint64_t v18 = 0x2020000000;
        int v19 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = &v12;
        uint64_t v14 = 0x2020000000;
        int v15 = 0;
        uint64_t v8 = 0;
        uint64_t v9 = &v8;
        uint64_t v10 = 0x2020000000;
        int v11 = 0;
        BOOL v6 = CGColorConversionInfoIterateColorSpaceFunctionsWithCallbacks()
          && !*((_DWORD *)v9 + 6)
          && !*((_DWORD *)v17 + 6)
          && *((_DWORD *)v13 + 6) == 0;
        _Block_object_dispose(&v8, 8);
        _Block_object_dispose(&v12, 8);
        _Block_object_dispose(&v16, 8);
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return CFHash(self->_CGColorSpace);
}

- (NSString)name
{
  v2 = (void *)CGColorSpaceCopyICCProfileDescription();

  return (NSString *)v2;
}

- (id)description
{
  v3 = [(NUColorSpace *)self descriptionName];
  if (v3)
  {
    id v4 = [(NUColorSpace *)self descriptionName];
    uint64_t v5 = [v4 stringByAppendingString:@": "];
  }
  else
  {
    uint64_t v5 = &stru_1F0017700;
  }

  BOOL v6 = (__CFString *)CFCopyDescription(self->_CGColorSpace);
  uint64_t v7 = [(__CFString *)v5 stringByAppendingString:v6];

  return v7;
}

- (void)dealloc
{
  CFRelease(self->_CGColorSpace);
  v3.receiver = self;
  v3.super_class = (Class)NUColorSpace;
  [(NUColorSpace *)&v3 dealloc];
}

- (BOOL)hasCICP
{
  return CGColorSpaceGetCICPInfo();
}

- (BOOL)isWideGamut
{
  v2 = [(NUColorSpace *)self CGColorSpace];

  return CGColorSpaceIsWideGamutRGB(v2);
}

- (BOOL)isExtended
{
  v2 = [(NUColorSpace *)self CGColorSpace];

  return CGColorSpaceUsesExtendedRange(v2);
}

- (BOOL)isHDR
{
  v2 = [(NUColorSpace *)self CGColorSpace];

  return CGColorSpaceUsesITUR_2100TF(v2);
}

- (BOOL)isRGB
{
  return CGColorSpaceGetModel([(NUColorSpace *)self CGColorSpace]) == kCGColorSpaceModelRGB;
}

- (NUColorSpace)initWithICCProfileData:(id)a3 descriptionName:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 || (uint64_t v8 = v7, ![v6 length]))
  {
    uint64_t v12 = NUAssertLogger_4177();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil && data.length > 0");
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int v15 = NUAssertLogger_4177();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        int v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        __int16 v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      BOOL v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSpace initWithICCProfileData:descriptionName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 105, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"data != nil && data.length > 0");
  }
  uint64_t v9 = (CGColorSpace *)MEMORY[0x1AD0F9720](v6);
  uint64_t v10 = [(NUColorSpace *)self initWithCGColorSpace:v9 descriptionName:v8];
  CGColorSpaceRelease(v9);

  return v10;
}

- (NUColorSpace)initWithCGColorSpace:(CGColorSpace *)a3 descriptionName:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!a3)
  {
    int v11 = NUAssertLogger_4177();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colorSpace != NULL");
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_4177();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        uint64_t v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        int v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        id v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        __int16 v30 = 2114;
        v31 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      BOOL v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSpace initWithCGColorSpace:descriptionName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 92, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"colorSpace != NULL");
  }
  uint64_t v8 = v7;
  v27.receiver = self;
  v27.super_class = (Class)NUColorSpace;
  uint64_t v9 = [(NUColorSpace *)&v27 init];
  if (v9)
  {
    v9->_CGColorSpace = CGColorSpaceRetain(a3);
    objc_storeStrong((id *)&v9->_descriptionName, a4);
  }

  return v9;
}

- (NUColorSpace)initWithCGColorSpace:(CGColorSpace *)a3
{
  return [(NUColorSpace *)self initWithCGColorSpace:a3 descriptionName:0];
}

- (NUColorSpace)initWithColorSpaceName:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  CFStringRef v4 = (const __CFString *)a3;
  if (!v4)
  {
    uint64_t v9 = NUAssertLogger_4177();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_4177();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        int v19 = [v17 callStackSymbols];
        id v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSpace initWithColorSpaceName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 75, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"name != nil");
  }
  uint64_t v5 = (__CFString *)v4;
  id v6 = (NUColorSpace *)CGColorSpaceCreateWithName(v4);
  if (v6)
  {
    id v7 = [(NUColorSpace *)self initWithCGColorSpace:v6];
    CFRelease(v6);
    self = v7;
    id v6 = self;
  }

  return v6;
}

- (NUColorSpace)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_4191);
  }
  objc_super v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v4 = NSString;
    uint64_t v5 = v3;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_4191);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_4191);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    int v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    BOOL v13 = v11;
    uint64_t v14 = [v12 callStackSymbols];
    BOOL v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  BOOL v13 = v16;
  id v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUColorSpace init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 71, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

+ (BOOL)shouldTagAsDisplayP3:(__CVBuffer *)a3
{
  CFStringRef v4 = (void *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24A90], 0);
  uint64_t v5 = (void *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24BC8], 0);
  BOOL v6 = [v4 isEqualToString:*MEMORY[0x1E4F24AC0]]
    && ([v5 isEqualToString:*MEMORY[0x1E4F24BE0]] & 1) != 0;

  return v6;
}

+ (id)colorSpaceFromColorPrimaries:(id)a3 transferFunction:(id)a4 yccMatrix:(id)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v18 = NUAssertLogger_4177();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colorPrimaries != nil");
      *(_DWORD *)buf = 138543362;
      v69 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v21 = NUAssertLogger_4177();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v39;
        __int16 v70 = 2114;
        v71 = v43;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace colorSpaceFromColorPrimaries:transferFunction:yccMatrix:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 444, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"colorPrimaries != nil");
  }
  if (!v9)
  {
    uint64_t v25 = NUAssertLogger_4177();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "transferFunction != nil");
      *(_DWORD *)buf = 138543362;
      v69 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_4177();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v48;
        __int16 v70 = 2114;
        v71 = v52;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      __int16 v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace colorSpaceFromColorPrimaries:transferFunction:yccMatrix:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 445, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"transferFunction != nil");
  }
  int v11 = v10;
  if (!v10)
  {
    uint64_t v32 = NUAssertLogger_4177();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "yccMatrix != nil");
      *(_DWORD *)buf = 138543362;
      v69 = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v35 = NUAssertLogger_4177();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E4F29060];
        id v59 = v57;
        v60 = [v58 callStackSymbols];
        v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v57;
        __int16 v70 = 2114;
        v71 = v61;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace colorSpaceFromColorPrimaries:transferFunction:yccMatrix:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 446, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)"yccMatrix != nil");
  }
  uint64_t v12 = *MEMORY[0x1E4F24BC8];
  v66[0] = *MEMORY[0x1E4F24A90];
  v66[1] = v12;
  v67[0] = v8;
  v67[1] = v9;
  v66[2] = *MEMORY[0x1E4F24C18];
  v67[2] = v10;
  CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:3];
  CGColorSpaceRef ColorSpaceFromAttachments = CVImageBufferCreateColorSpaceFromAttachments(v13);
  if (ColorSpaceFromAttachments)
  {
    CGColorSpaceRef v15 = ColorSpaceFromAttachments;
    BOOL v16 = (void *)[objc_alloc((Class)a1) initWithCGColorSpace:ColorSpaceFromAttachments descriptionName:@"custom"];
    CFRelease(v15);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (id)colorSpaceFromVideoColorProperties:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v14 = NUAssertLogger_4177();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      CGColorSpaceRef v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colorProperties != nil");
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v17 = NUAssertLogger_4177();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        uint64_t v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        uint64_t v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        __int16 v32 = 2114;
        v33 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace colorSpaceFromVideoColorProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 429, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"colorProperties != nil");
  }
  uint64_t v5 = v4;
  BOOL v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F16240]];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F162E0]];
  uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F16308]];
  id v9 = (void *)v8;
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v8 == 0)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [a1 colorSpaceFromColorPrimaries:v6 transferFunction:v7 yccMatrix:v8];
  }

  return v12;
}

+ (NUColorSpace)displayP3_HLG
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__NUColorSpace_displayP3_HLG__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (displayP3_HLG_onceToken != -1) {
    dispatch_once(&displayP3_HLG_onceToken, block);
  }
  v2 = (void *)displayP3_HLG_result;

  return (NUColorSpace *)v2;
}

void __29__NUColorSpace_displayP3_HLG__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB98]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceDisplayP3_HLG"];
      *(_DWORD *)BOOL v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        BOOL v16 = [v14 callStackSymbols];
        BOOL v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)BOOL v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)BOOL v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace displayP3_HLG]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 415, @"Failed to load kCGColorSpaceDisplayP3_HLG", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"DisplayP3+HLG"];
  uint64_t v5 = (void *)displayP3_HLG_result;
  displayP3_HLG_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (NUColorSpace)displayP3_PQ
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__NUColorSpace_displayP3_PQ__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (displayP3_PQ_onceToken != -1) {
    dispatch_once(&displayP3_PQ_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)displayP3_PQ_result;

  return (NUColorSpace *)v2;
}

void __28__NUColorSpace_displayP3_PQ__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBA0]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceDisplayP3_PQ"];
      *(_DWORD *)BOOL v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        BOOL v16 = [v14 callStackSymbols];
        BOOL v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)BOOL v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)BOOL v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace displayP3_PQ]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 402, @"Failed to load kCGColorSpaceDisplayP3_PQ", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"DisplayP3+PQ"];
  uint64_t v5 = (void *)displayP3_PQ_result;
  displayP3_PQ_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)rec709ColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__NUColorSpace_rec709ColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (rec709ColorSpace_onceToken != -1) {
    dispatch_once(&rec709ColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)rec709ColorSpace_result;

  return v2;
}

void __32__NUColorSpace_rec709ColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) colorSpaceFromColorPrimaries:*MEMORY[0x1E4F24AB0] transferFunction:*MEMORY[0x1E4F24BE0] yccMatrix:*MEMORY[0x1E4F24C48]];
  CGColorSpaceRef v2 = (void *)rec709ColorSpace_result;
  rec709ColorSpace_float result = v1;

  if (!rec709ColorSpace_result)
  {
    objc_super v3 = NUAssertLogger_4177();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [NSString stringWithFormat:@"Failed to load HDTV colorspace"];
      *(_DWORD *)uint64_t v19 = 138543362;
      *(void *)&v19[4] = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v19, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v6 = NUAssertLogger_4177();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        BOOL v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        int v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        CFDictionaryRef v13 = [v11 callStackSymbols];
        uint64_t v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v19 = 138543618;
        *(void *)&v19[4] = v10;
        __int16 v20 = 2114;
        uint64_t v21 = v14;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v19, 0x16u);
      }
    }
    else if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v19 = 138543362;
      *(void *)&v19[4] = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v19, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace rec709ColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 391, @"Failed to load HDTV colorspace", v15, v16, v17, v18, *(uint64_t *)v19);
  }
}

+ (id)displayP3LinearColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__NUColorSpace_displayP3LinearColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (displayP3LinearColorSpace_onceToken != -1) {
    dispatch_once(&displayP3LinearColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)displayP3LinearColorSpace_result;

  return v2;
}

void __41__NUColorSpace_displayP3LinearColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC70]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceLinearDisplayP3"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace displayP3LinearColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 370, @"Failed to load kCGColorSpaceLinearDisplayP3", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"DisplayP3 (linear)"];
  uint64_t v5 = (void *)displayP3LinearColorSpace_result;
  displayP3LinearColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)displayP3ColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__NUColorSpace_displayP3ColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (displayP3ColorSpace_onceToken != -1) {
    dispatch_once(&displayP3ColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)displayP3ColorSpace_result;

  return v2;
}

void __35__NUColorSpace_displayP3ColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceDisplayP3"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace displayP3ColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 357, @"Failed to load kCGColorSpaceDisplayP3", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"DisplayP3"];
  uint64_t v5 = (void *)displayP3ColorSpace_result;
  displayP3ColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)genericGrayColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NUColorSpace_genericGrayColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (genericGrayColorSpace_onceToken != -1) {
    dispatch_once(&genericGrayColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)genericGrayColorSpace_result;

  return v2;
}

void __37__NUColorSpace_genericGrayColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBF8]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceGenericGray"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace genericGrayColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 344, @"Failed to load kCGColorSpaceGenericGray", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"Generic Gray"];
  uint64_t v5 = (void *)genericGrayColorSpace_result;
  genericGrayColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)genericRGBLinearColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NUColorSpace_genericRGBLinearColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (genericRGBLinearColorSpace_onceToken != -1) {
    dispatch_once(&genericRGBLinearColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)genericRGBLinearColorSpace_result;

  return v2;
}

void __42__NUColorSpace_genericRGBLinearColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC18]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceGenericRGBLinear"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace genericRGBLinearColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 331, @"Failed to load kCGColorSpaceGenericRGBLinear", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"Generic RGB (linear)"];
  uint64_t v5 = (void *)genericRGBLinearColorSpace_result;
  genericRGBLinearColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)genericRGBColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__NUColorSpace_genericRGBColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (genericRGBColorSpace_onceToken != -1) {
    dispatch_once(&genericRGBColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)genericRGBColorSpace_result;

  return v2;
}

void __36__NUColorSpace_genericRGBColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC10]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceGenericRGB"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace genericRGBColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 318, @"Failed to load kCGColorSpaceGenericRGB", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"Generic RGB"];
  uint64_t v5 = (void *)genericRGBColorSpace_result;
  genericRGBColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)adobeRGBColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__NUColorSpace_adobeRGBColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (adobeRGBColorSpace_onceToken != -1) {
    dispatch_once(&adobeRGBColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)adobeRGBColorSpace_result;

  return v2;
}

void __34__NUColorSpace_adobeRGBColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB78]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceAdobeRGB1998"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace adobeRGBColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 305, @"Failed to load kCGColorSpaceAdobeRGB1998", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"Adobe RGB 1998"];
  uint64_t v5 = (void *)adobeRGBColorSpace_result;
  adobeRGBColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)extendedSRGBLinearColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NUColorSpace_extendedSRGBLinearColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (extendedSRGBLinearColorSpace_onceToken != -1) {
    dispatch_once(&extendedSRGBLinearColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)extendedSRGBLinearColorSpace_result;

  return v2;
}

void __44__NUColorSpace_extendedSRGBLinearColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE0]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceExtendedLinearSRGB"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace extendedSRGBLinearColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 292, @"Failed to load kCGColorSpaceExtendedLinearSRGB", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2, @"sRGB (linear, extended)" descriptionName];
  uint64_t v5 = (void *)extendedSRGBLinearColorSpace_result;
  extendedSRGBLinearColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)sRGBLinearColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__NUColorSpace_sRGBLinearColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sRGBLinearColorSpace_onceToken != -1) {
    dispatch_once(&sRGBLinearColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)sRGBLinearColorSpace_result;

  return v2;
}

void __36__NUColorSpace_sRGBLinearColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC88]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceLinearSRGB"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace sRGBLinearColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 279, @"Failed to load kCGColorSpaceLinearSRGB", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"sRGB (linear)"];
  uint64_t v5 = (void *)sRGBLinearColorSpace_result;
  sRGBLinearColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)extendedSRGBColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__NUColorSpace_extendedSRGBColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (extendedSRGBColorSpace_onceToken != -1) {
    dispatch_once(&extendedSRGBColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)extendedSRGBColorSpace_result;

  return v2;
}

void __38__NUColorSpace_extendedSRGBColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceExtendedSRGB"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace extendedSRGBColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 266, @"Failed to load kCGColorSpaceExtendedSRGB", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"sRGB (extended)"];
  uint64_t v5 = (void *)extendedSRGBColorSpace_result;
  extendedSRGBColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)itur2100PQColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__NUColorSpace_itur2100PQColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (itur2100PQColorSpace_onceToken != -1) {
    dispatch_once(&itur2100PQColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)itur2100PQColorSpace_result;

  return v2;
}

void __36__NUColorSpace_itur2100PQColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC50]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceITUR_2100_PQ"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace itur2100PQColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 254, @"Failed to load kCGColorSpaceITUR_2100_PQ", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"ITU Rec2100 PQ"];
  uint64_t v5 = (void *)itur2100PQColorSpace_result;
  itur2100PQColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)itur2100HLGColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NUColorSpace_itur2100HLGColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (itur2100HLGColorSpace_onceToken != -1) {
    dispatch_once(&itur2100HLGColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)itur2100HLGColorSpace_result;

  return v2;
}

void __37__NUColorSpace_itur2100HLGColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC48]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceITUR_2100_HLG"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace itur2100HLGColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 241, @"Failed to load kCGColorSpaceITUR_2100_HLG", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"ITU Rec2100 HLG"];
  uint64_t v5 = (void *)itur2100HLGColorSpace_result;
  itur2100HLGColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)extendedLinearGrayColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NUColorSpace_extendedLinearGrayColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (extendedLinearGrayColorSpace_onceToken != -1) {
    dispatch_once(&extendedLinearGrayColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)extendedLinearGrayColorSpace_result;

  return v2;
}

void __44__NUColorSpace_extendedLinearGrayColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBD0]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceExtendedLinearGray"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace extendedLinearGrayColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 228, @"Failed to load kCGColorSpaceExtendedLinearGray", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2, @"gray (linear, extended)" descriptionName];
  uint64_t v5 = (void *)extendedLinearGrayColorSpace_result;
  extendedLinearGrayColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)linearGrayColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__NUColorSpace_linearGrayColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (linearGrayColorSpace_onceToken != -1) {
    dispatch_once(&linearGrayColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)linearGrayColorSpace_result;

  return v2;
}

void __36__NUColorSpace_linearGrayColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC78]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load linear gray color space"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace linearGrayColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 215, @"Failed to load linear gray color space", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"Linear Gray"];
  uint64_t v5 = (void *)linearGrayColorSpace_result;
  linearGrayColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)genericGrayGamma2_2ColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NUColorSpace_genericGrayGamma2_2ColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (genericGrayGamma2_2ColorSpace_onceToken != -1) {
    dispatch_once(&genericGrayGamma2_2ColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)genericGrayGamma2_2ColorSpace_result;

  return v2;
}

void __45__NUColorSpace_genericGrayGamma2_2ColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceGenericGrayGamma2_2"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace genericGrayGamma2_2ColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 202, @"Failed to load kCGColorSpaceGenericGrayGamma2_2", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"Generic Gray (2.2)"];
  uint64_t v5 = (void *)genericGrayGamma2_2ColorSpace_result;
  genericGrayGamma2_2ColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)sRGBColorSpace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__NUColorSpace_sRGBColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sRGBColorSpace_onceToken != -1) {
    dispatch_once(&sRGBColorSpace_onceToken, block);
  }
  CGColorSpaceRef v2 = (void *)sRGBColorSpace_result;

  return v2;
}

void __30__NUColorSpace_sRGBColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  if (!v2)
  {
    BOOL v6 = NUAssertLogger_4177();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = [NSString stringWithFormat:@"Failed to load kCGColorSpaceSRGB"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v9 = NUAssertLogger_4177();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        CFDictionaryRef v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace sRGBColorSpace]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 189, @"Failed to load kCGColorSpaceSRGB", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  objc_super v3 = v2;
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithCGColorSpace:v2 descriptionName:@"sRGB"];
  uint64_t v5 = (void *)sRGBColorSpace_result;
  sRGBColorSpace_float result = v4;

  CGColorSpaceRelease(v3);
}

+ (id)_loadICCProfileDataWithIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 pathForResource:v3 ofType:@"icc"];
  BOOL v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
  if (!v6 || (BOOL v7 = v6, ![v6 length]))
  {
    id v9 = NUAssertLogger_4177();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = [NSString stringWithFormat:@"Failed to load %@", v3];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v12 = NUAssertLogger_4177();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        uint64_t v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        uint64_t v19 = [v17 callStackSymbols];
        uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        uint64_t v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUColorSpace _loadICCProfileDataWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUColorSpace.m", 65, @"Failed to load %@", v21, v22, v23, v24, (uint64_t)v3);
  }

  return v7;
}

@end