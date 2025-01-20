@interface PISegmentationLayoutRegions
+ (id)dictionaryFromRegions:(id)a3;
+ (id)regionsFromDictionary:(id)a3 error:(id *)a4;
- (CGRect)acceptableCropRect;
- (CGRect)gazeAreaRect;
- (CGRect)preferredCropRect;
- (NSArray)faceRegions;
- (NSArray)petRegions;
- (NSString)debugDescription;
- (PISegmentationLayoutRegions)init;
- (PISegmentationLayoutRegions)initWithAcceptableRect:(CGRect)a3 preferredRect:(CGRect)a4 faces:(id)a5 pets:(id)a6;
- (void)initWithAcceptableRect:(double)a3 preferredRect:(double)a4 gazeAreaRect:(double)a5 faces:(double)a6 pets:(double)a7;
@end

@implementation PISegmentationLayoutRegions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_petRegions, 0);
  objc_storeStrong((id *)&self->_faceRegions, 0);
}

- (NSArray)petRegions
{
  return self->_petRegions;
}

- (NSArray)faceRegions
{
  return self->_faceRegions;
}

- (CGRect)gazeAreaRect
{
  double x = self->_gazeAreaRect.origin.x;
  double y = self->_gazeAreaRect.origin.y;
  double width = self->_gazeAreaRect.size.width;
  double height = self->_gazeAreaRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)preferredCropRect
{
  double x = self->_preferredCropRect.origin.x;
  double y = self->_preferredCropRect.origin.y;
  double width = self->_preferredCropRect.size.width;
  double height = self->_preferredCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)acceptableCropRect
{
  double x = self->_acceptableCropRect.origin.x;
  double y = self->_acceptableCropRect.origin.y;
  double width = self->_acceptableCropRect.size.width;
  double height = self->_acceptableCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E4F29238];
  [(PISegmentationLayoutRegions *)self acceptableCropRect];
  v22[0] = v6;
  v22[1] = v7;
  v22[2] = v8;
  v22[3] = v9;
  v10 = [v5 valueWithBytes:v22 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v11 = (void *)MEMORY[0x1E4F29238];
  [(PISegmentationLayoutRegions *)self preferredCropRect];
  v21[0] = v12;
  v21[1] = v13;
  v21[2] = v14;
  v21[3] = v15;
  v16 = [v11 valueWithBytes:v21 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v17 = [(PISegmentationLayoutRegions *)self faceRegions];
  v18 = [(PISegmentationLayoutRegions *)self petRegions];
  v19 = [v3 stringWithFormat:@"<%@:%p accept=%@ pref=%@ faces=%@ pets=%@>", v4, self, v10, v16, v17, v18];

  return (NSString *)v19;
}

- (void)initWithAcceptableRect:(double)a3 preferredRect:(double)a4 gazeAreaRect:(double)a5 faces:(double)a6 pets:(double)a7
{
  id v30 = a11;
  id v31 = a12;
  v39.receiver = a1;
  v39.super_class = (Class)PISegmentationLayoutRegions;
  v32 = objc_msgSendSuper2(&v39, sel_init);
  v33 = v32;
  *((double *)v32 + 3) = a2;
  *((double *)v32 + 4) = a3;
  *((double *)v32 + 5) = a4;
  *((double *)v32 + 6) = a5;
  *((double *)v32 + 7) = a6;
  *((double *)v32 + 8) = a7;
  *((double *)v32 + 9) = a8;
  *((double *)v32 + 10) = a9;
  if (v30)
  {
    uint64_t v34 = [v30 copy];
    v35 = (void *)v33[1];
    v33[1] = v34;
  }
  else
  {
    v35 = (void *)v32[1];
    v32[1] = MEMORY[0x1E4F1CBF0];
  }

  if (v31)
  {
    uint64_t v36 = [v31 copy];
    v37 = (void *)v33[2];
    v33[2] = v36;
  }
  else
  {
    v37 = (void *)v33[2];
    v33[2] = MEMORY[0x1E4F1CBF0];
  }

  v33[11] = a17;
  v33[12] = a18;
  v33[13] = a19;
  v33[14] = a20;

  return v33;
}

- (PISegmentationLayoutRegions)initWithAcceptableRect:(CGRect)a3 preferredRect:(CGRect)a4 faces:(id)a5 pets:(id)a6
{
  return -[PISegmentationLayoutRegions initWithAcceptableRect:preferredRect:gazeAreaRect:faces:pets:](self, "initWithAcceptableRect:preferredRect:gazeAreaRect:faces:pets:", a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *MEMORY[0x1E4F1DB28], *(void *)(MEMORY[0x1E4F1DB28] + 8), *(void *)(MEMORY[0x1E4F1DB28] + 16), *(void *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PISegmentationLayoutRegions)init
{
  return -[PISegmentationLayoutRegions initWithAcceptableRect:preferredRect:faces:pets:](self, "initWithAcceptableRect:preferredRect:faces:pets:", 0, 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

+ (id)regionsFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v18 = NUAssertLogger_794();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "contents != nil");
      LODWORD(rect.origin.x) = 138543362;
      *(void *)((char *)&rect.origin.x + 4) = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&rect, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_794();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        id v30 = [v29 componentsJoinedByString:@"\n"];
        LODWORD(rect.origin.x) = 138543618;
        *(void *)((char *)&rect.origin.x + 4) = v26;
        WORD2(rect.origin.y) = 2114;
        *(void *)((char *)&rect.origin.y + 6) = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&rect, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      LODWORD(rect.origin.x) = 138543362;
      *(void *)((char *)&rect.origin.x + 4) = v25;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&rect, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v6 = v5;
  memset(&rect, 0, sizeof(rect));
  id v7 = [v5 objectForKeyedSubscript:@"acceptable"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_12;
  }
  BOOL v8 = CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v7, &rect);

  if (!v8)
  {
LABEL_12:
    [MEMORY[0x1E4F7A438] mismatchError:@"Expected a rect value" object:v7];
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  memset(&v31, 0, sizeof(v31));
  CFDictionaryRef v9 = [v6 objectForKeyedSubscript:@"preferred"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v10 = CGRectMakeWithDictionaryRepresentation(v9, &v31);

    if (v10)
    {
      v11 = [v6 objectForKeyedSubscript:@"faces"];
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (__59__PISegmentationLayoutRegions_regionsFromDictionary_error___block_invoke(v11, v12))
      {
        uint64_t v13 = [v6 objectForKeyedSubscript:@"pets"];
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (__59__PISegmentationLayoutRegions_regionsFromDictionary_error___block_invoke(v13, v14))
        {
          uint64_t v15 = [PISegmentationLayoutRegions alloc];
          v16 = -[PISegmentationLayoutRegions initWithAcceptableRect:preferredRect:faces:pets:](v15, "initWithAcceptableRect:preferredRect:faces:pets:", v12, v14, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
        }
        else
        {
          [MEMORY[0x1E4F7A438] mismatchError:@"Expected an array of rect values" object:v13];
          v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        [MEMORY[0x1E4F7A438] mismatchError:@"Expected an array of rect values" object:v11];
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_18;
    }
  }
  else
  {
  }
  [MEMORY[0x1E4F7A438] mismatchError:@"Expected a rect value" object:v9];
  v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_13:
  return v16;
}

uint64_t __59__PISegmentationLayoutRegions_regionsFromDictionary_error___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          memset(&rect, 0, sizeof(rect));
          id v11 = v10;
          if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {

LABEL_16:
            uint64_t v14 = 0;
            goto LABEL_18;
          }
          BOOL v12 = CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v11, &rect);

          if (!v12) {
            goto LABEL_16;
          }
          CGRect v16 = rect;
          uint64_t v13 = [MEMORY[0x1E4F29238] valueWithBytes:&v16 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          [v4 addObject:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        uint64_t v14 = 1;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v14 = 1;
    }
LABEL_18:
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)dictionaryFromRegions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    uint64_t v13 = NUAssertLogger_794();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "regions != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v17 = NUAssertLogger_794();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        long long v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v21;
        __int16 v28 = 2114;
        v29 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      long long v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v4 = v3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
  [v4 acceptableCropRect];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v32);
  [v5 setObject:DictionaryRepresentation forKeyedSubscript:@"acceptable"];

  [v4 preferredCropRect];
  CFDictionaryRef v7 = CGRectCreateDictionaryRepresentation(v33);
  [v5 setObject:v7 forKeyedSubscript:@"preferred"];

  uint64_t v8 = [v4 faceRegions];
  CFDictionaryRef v9 = __53__PISegmentationLayoutRegions_dictionaryFromRegions___block_invoke(v8);
  [v5 setObject:v9 forKeyedSubscript:@"faces"];

  BOOL v10 = [v4 petRegions];
  id v11 = __53__PISegmentationLayoutRegions_dictionaryFromRegions___block_invoke(v10);
  [v5 setObject:v11 forKeyedSubscript:@"pets"];

  return v5;
}

id __53__PISegmentationLayoutRegions_dictionaryFromRegions___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "rectValue", (void)v10);
          CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v17);
          [v2 addObject:DictionaryRepresentation];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end