@interface PIInpaintOperation
- (BOOL)hasExclusionMask;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualtoInpaintOperation:(id)a3;
- (BOOL)isFilledBrushStroke;
- (BOOL)isLassoedSelection;
- (BOOL)isScribbledSelection;
- (BOOL)isTapSelect;
- (BOOL)isTargetPoints;
- (NSArray)exclusionMaskIdentifiers;
- (NSArray)maskIdentifiers;
- (NUBrushStroke)brushStroke;
- (PIInpaintOperation)init;
- (PIInpaintOperation)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)mode;
- (unint64_t)hash;
- (unint64_t)options;
- (void)nu_updateDigest:(id)a3;
@end

@implementation PIInpaintOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brushStroke, 0);
  objc_storeStrong((id *)&self->_exclusionMaskIdentifiers, 0);
  objc_storeStrong((id *)&self->_maskIdentifiers, 0);
}

- (NUBrushStroke)brushStroke
{
  return self->_brushStroke;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)exclusionMaskIdentifiers
{
  return self->_exclusionMaskIdentifiers;
}

- (NSArray)maskIdentifiers
{
  return self->_maskIdentifiers;
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)isEqualtoInpaintOperation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 mode];
  if (v5 != [(PIInpaintOperation *)self mode]) {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 options];
  if (v6 != [(PIInpaintOperation *)self options]) {
    goto LABEL_8;
  }
  if ([(PIInpaintOperation *)self mode] == 2)
  {
    v7 = [v4 brushStroke];
    v8 = [(PIInpaintOperation *)self brushStroke];
    char v9 = [v7 isEqualToBrushStroke:v8];

    if ((v9 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    v10 = [v4 maskIdentifiers];
    v11 = [(PIInpaintOperation *)self maskIdentifiers];
    int v12 = [v10 isEqualToArray:v11];

    if (!v12)
    {
LABEL_8:
      char v14 = 0;
      goto LABEL_9;
    }
  }
  int v13 = [v4 hasExclusionMask];
  if (v13 != [(PIInpaintOperation *)self hasExclusionMask]) {
    goto LABEL_8;
  }
  if ([(PIInpaintOperation *)self hasExclusionMask])
  {
    v16 = [v4 exclusionMaskIdentifiers];
    v17 = [(PIInpaintOperation *)self exclusionMaskIdentifiers];
    char v14 = [v16 isEqualToArray:v17];
  }
  else
  {
    char v14 = 1;
  }
LABEL_9:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 isEqualtoInpaintOperation:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  int64_t mode = self->_mode;
  if (mode == 2)
  {
    uint64_t v4 = 0x218F3622596F05 * [(NUBrushStroke *)self->_brushStroke hash];
  }
  else
  {
    uint64_t v5 = 0x1EA54677C8386DLL * NUDeepArrayHash();
    uint64_t v4 = v5 ^ (0x1461D866E2FF85 * NUDeepArrayHash());
  }
  return (0xA9D3B49167B13 * self->_options) ^ (0x229450DF6E391BLL * mode) ^ v4;
}

- (void)nu_updateDigest:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 addString:@"PIInpaintOperation{"];
  uint64_t v5 = [NSNumber numberWithInteger:self->_mode];
  objc_msgSend(v5, "nu_updateDigest:", v4);

  [(NUBrushStroke *)self->_brushStroke nu_updateDigest:v4];
  [v4 addCString:","];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [(PIInpaintOperation *)self maskIdentifiers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 addString:*(void *)(*((void *)&v21 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = [(PIInpaintOperation *)self exclusionMaskIdentifiers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [v4 addString:*(void *)(*((void *)&v17 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  [v4 addCString:","];
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PIInpaintOperation options](self, "options"));
  objc_msgSend(v16, "nu_updateDigest:", v4);

  [v4 addString:@"}"];
}

- (BOOL)isScribbledSelection
{
  return ([(PIInpaintOperation *)self options] >> 7) & 1;
}

- (BOOL)isLassoedSelection
{
  return ([(PIInpaintOperation *)self options] >> 6) & 1;
}

- (BOOL)isFilledBrushStroke
{
  v3 = [(PIInpaintOperation *)self maskIdentifiers];
  int v4 = PFExists();

  return ([(PIInpaintOperation *)self options] >> 4) & 1 | v4;
}

uint64_t __41__PIInpaintOperation_isFilledBrushStroke__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"filledStrokeMask"];
}

- (BOOL)isTargetPoints
{
  v3 = [(PIInpaintOperation *)self maskIdentifiers];
  int v4 = PFExists();

  return ([(PIInpaintOperation *)self options] >> 3) & 1 | v4;
}

uint64_t __36__PIInpaintOperation_isTargetPoints__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"targetPoints"];
}

- (BOOL)isTapSelect
{
  return ([(PIInpaintOperation *)self options] >> 5) & 1;
}

- (BOOL)hasExclusionMask
{
  v2 = [(PIInpaintOperation *)self exclusionMaskIdentifiers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v4 = [(PIInpaintOperation *)self brushStroke];
  [v3 setObject:v4 forKeyedSubscript:@"stroke"];

  uint64_t v5 = [(PIInpaintOperation *)self maskIdentifiers];
  [v3 setObject:v5 forKeyedSubscript:@"maskIdentifiers"];

  uint64_t v6 = [(PIInpaintOperation *)self exclusionMaskIdentifiers];
  [v3 setObject:v6 forKeyedSubscript:@"exclusionMaskIdentifiers"];

  id v7 = [NSString alloc];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = PIRetouchModeToString([(PIInpaintOperation *)self mode]);
  uint64_t v10 = (void *)[v7 initWithFormat:@"<%@:%p> mode=%@ details:%@", v8, self, v9, v3];

  return v10;
}

- (PIInpaintOperation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PIInpaintOperation;
  uint64_t v5 = [(PIInpaintOperation *)&v17 init];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"mode"];
  v5->_int64_t mode = PIRetouchModeFromString(v6);

  if (v5->_mode == 2)
  {
    uint64_t v7 = [MEMORY[0x1E4F7A398] brushStrokeFromDictionary:v4];
    brushStroke = v5->_brushStroke;
    v5->_brushStroke = (NUBrushStroke *)v7;
  }
  uint64_t v9 = [v4 objectForKeyedSubscript:@"options"];
  v5->_options = [v9 unsignedIntegerValue];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"maskIdentifiers"];
  uint64_t v11 = [v10 copy];
  maskIdentifiers = v5->_maskIdentifiers;
  v5->_maskIdentifiers = (NSArray *)v11;

  uint64_t v13 = [v4 objectForKeyedSubscript:@"exclusionMaskIdentifiers"];
  uint64_t v14 = [v13 copy];
  exclusionMaskIdentifiers = v5->_exclusionMaskIdentifiers;
  v5->_exclusionMaskIdentifiers = (NSArray *)v14;

  return v5;
}

- (PIInpaintOperation)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v4 = (os_log_t *)MEMORY[0x1E4F7A748];
    uint64_t v5 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = NSString;
      uint64_t v7 = v5;
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      uint64_t v10 = NSStringFromSelector(a2);
      uint64_t v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_98);
        }
LABEL_7:
        os_log_t v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F29060];
          uint64_t v15 = v13;
          v16 = [v14 callStackSymbols];
          objc_super v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_98);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      long long v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      uint64_t v15 = v18;
      long long v22 = [v20 callStackSymbols];
      long long v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      __int16 v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    long long v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_98);
  }
}

@end