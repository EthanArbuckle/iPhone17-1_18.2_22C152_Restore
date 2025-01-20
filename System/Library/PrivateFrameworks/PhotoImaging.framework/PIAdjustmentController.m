@interface PIAdjustmentController
+ (id)autoKey;
+ (id)enabledKey;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeFromInputKey:(SEL)a3 timescaleKey:(id)a4;
- (BOOL)_isDefault;
- (BOOL)canBeEnabled;
- (BOOL)canHaveAuto;
- (BOOL)enabled;
- (BOOL)hasAutoKeyInSchema;
- (BOOL)hasInputKey:(id)a3;
- (BOOL)isAuto;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 forKeys:(id)a4;
- (BOOL)isEqual:(id)a3 visualChangesOnly:(BOOL)a4;
- (BOOL)isEqualToAdjustmentController:(id)a3;
- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4;
- (NSArray)inputKeys;
- (NSDictionary)settings;
- (NSString)displayName;
- (NUAdjustment)adjustment;
- (NUComposition)containingComposition;
- (NUIdentifier)identifier;
- (PIAdjustmentController)initWithAdjustment:(id)a3;
- (id)_primitiveValueForKey:(id)a3;
- (id)autoKeysForPaste;
- (id)debugDescription;
- (id)settingForKey:(id)a3;
- (id)valuesForArrayInputKey:(id)a3;
- (unint64_t)hash;
- (void)_setPrimitiveValue:(id)a3 forKey:(id)a4;
- (void)interpolateFromStart:(id)a3 toEnd:(id)a4 progress:(double)a5;
- (void)pasteAdjustment:(id)a3 forMediaType:(int64_t)a4;
- (void)setContainingComposition:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFromAdjustment:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsAuto:(BOOL)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation PIAdjustmentController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingComposition, 0);
  objc_storeStrong((id *)&self->_adjustment, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

- (void)setContainingComposition:(id)a3
{
}

- (NUComposition)containingComposition
{
  return self->_containingComposition;
}

- (NUAdjustment)adjustment
{
  return self->_adjustment;
}

- (void)setIdentifier:(id)a3
{
}

- (NUIdentifier)identifier
{
  return self->_identifier;
}

- (id)autoKeysForPaste
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)pasteAdjustment:(id)a3 forMediaType:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PIAdjustmentController *)self pasteKeysForMediaType:a4];
  v8 = [(id)objc_opt_class() autoKey];
  v9 = [v6 objectForKeyedSubscript:v8];

  if ([v9 BOOLValue])
  {
    uint64_t v10 = [(PIAdjustmentController *)self autoKeysForPaste];

    v7 = (void *)v10;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v17 = objc_msgSend(v6, "objectForKeyedSubscript:", v16, (void)v18);
        [(NUAdjustment *)self->_adjustment setObject:v17 forKeyedSubscript:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PIAdjustmentController *)self adjustment];
  id v6 = [v5 debugDescription];
  v7 = [v3 stringWithFormat:@"<%@: %p adjustment = %@>", v4, self, v6];;

  return v7;
}

- (BOOL)_isDefault
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(PIAdjustmentController *)self inputKeys];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v9 = [(PIAdjustmentController *)self adjustment];
        uint64_t v10 = [v9 schema];
        id v11 = [v10 settings];
        uint64_t v12 = [v11 objectForKeyedSubscript:v8];

        uint64_t v13 = [v12 defaultValue];
        uint64_t v14 = [(PIAdjustmentController *)self _primitiveValueForKey:v8];
        LODWORD(v10) = [v14 isEqual:v13];

        v5 += v10;
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  BOOL v15 = [obj count] == v5;

  return v15;
}

- (NSDictionary)settings
{
  uint64_t v3 = [(PIAdjustmentController *)self adjustment];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(PIAdjustmentController *)self adjustment];
    uint64_t v6 = [v5 settings];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSDictionary *)v6;
}

- (id)_primitiveValueForKey:(id)a3
{
  return (id)[(NUAdjustment *)self->_adjustment valueForKey:a3];
}

- (void)_setPrimitiveValue:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_changes)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    changes = self->_changes;
    self->_changes = v7;
  }
  v9 = [(NUAdjustment *)self->_adjustment objectForKeyedSubscript:v6];
  [(NSMutableDictionary *)self->_changes setObject:v9 forKeyedSubscript:v6];

  [(NUAdjustment *)self->_adjustment setValue:v10 forKey:v6];
}

- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PIAdjustmentController *)self adjustment];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  uint64_t v10 = [v7 objectForKeyedSubscript:v6];

  id v11 = [(PIAdjustmentController *)self adjustment];
  uint64_t v12 = [v11 schema];
  uint64_t v13 = [v12 settings];
  uint64_t v14 = [v13 objectForKeyedSubscript:v6];

  BOOL v15 = [v14 defaultValue];
  if (([(id)v9 isEqual:v15] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([(id)v9 doubleValue], v16 == 0.0))
  {

    uint64_t v9 = 0;
  }
  if (([(id)v10 isEqual:v15] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([(id)v10 doubleValue], v17 == 0.0))
  {

    uint64_t v10 = 0;
  }
  if (v9 | v10) {
    char v18 = [(id)v9 isEqual:v10];
  }
  else {
    char v18 = 1;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3 forKeys:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!-[PIAdjustmentController isSettingEqual:forKey:](self, "isSettingEqual:forKey:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)isEqual:(id)a3 visualChangesOnly:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    [(PIAdjustmentController *)self visualInputKeys];
  }
  else {
  id v7 = [(PIAdjustmentController *)self inputKeys];
  }
  BOOL v8 = [(PIAdjustmentController *)self isEqual:v6 forKeys:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PIAdjustmentController *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PIAdjustmentController *)self isEqualToAdjustmentController:v4];
  }

  return v5;
}

- (BOOL)isEqualToAdjustmentController:(id)a3
{
  uint64_t v4 = [a3 adjustment];
  LOBYTE(self) = [(PIAdjustmentController *)self isEqual:v4 visualChangesOnly:0];

  return (char)self;
}

- (unint64_t)hash
{
  v2 = [(PIAdjustmentController *)self adjustment];
  unint64_t v3 = 0x1675E555296783 * [v2 hash];

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeFromInputKey:(SEL)a3 timescaleKey:(id)a4
{
  id v8 = a5;
  id v9 = a4;
  id v15 = [(PIAdjustmentController *)self adjustment];
  uint64_t v10 = [v15 objectForKeyedSubscript:v9];

  int64_t v11 = [v10 integerValue];
  BOOL v12 = [(PIAdjustmentController *)self adjustment];
  uint64_t v13 = [v12 objectForKeyedSubscript:v8];

  CMTimeMake((CMTime *)retstr, v11, [v13 intValue]);

  return result;
}

- (void)interpolateFromStart:(id)a3 toEnd:(id)a4 progress:(double)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id obj = [(PIAdjustmentController *)self inputKeys];
  v32 = v8;
  if (!v8 || a5 == 1.0)
  {
    uint64_t v10 = self;
    id v11 = v9;
    goto LABEL_6;
  }
  if (a5 == 0.0)
  {
    uint64_t v10 = self;
    id v11 = v8;
LABEL_6:
    [(PIAdjustmentController *)v10 setFromAdjustment:v11];
    goto LABEL_7;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    unint64_t v15 = 0x1E4F7A000uLL;
    uint64_t v31 = *(void *)v36;
    do
    {
      uint64_t v16 = 0;
      uint64_t v33 = v13;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * v16);
        char v18 = -[PIAdjustmentController settingForKey:](self, "settingForKey:", v17, v31);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v19 = v15;
          long long v20 = [v32 objectForKeyedSubscript:v17];
          id v21 = v9;
          v22 = [v9 objectForKeyedSubscript:v17];
          uint64_t v23 = v22;
          if (v20) {
            BOOL v24 = v22 == 0;
          }
          else {
            BOOL v24 = 1;
          }
          if (v24)
          {
            id v28 = v22;
          }
          else
          {
            [v20 doubleValue];
            double v26 = v25;
            [v23 doubleValue];
            id v28 = [NSNumber numberWithDouble:v26 + (v27 - v26) * a5];
          }
          v29 = v28;
          v30 = [(PIAdjustmentController *)self adjustment];
          [v30 setObject:v29 forKeyedSubscript:v17];

          id v9 = v21;
          uint64_t v14 = v31;
          unint64_t v15 = v19;
          uint64_t v13 = v33;
        }
        else
        {
          long long v20 = [v9 objectForKeyedSubscript:v17];
          uint64_t v23 = [(PIAdjustmentController *)self adjustment];
          [v23 setObject:v20 forKeyedSubscript:v17];
        }

        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v13);
  }
LABEL_7:
}

- (void)setFromAdjustment:(id)a3
{
  self->_adjustment = (NUAdjustment *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)valuesForArrayInputKey:(id)a3
{
  adjustment = self->_adjustment;
  id v4 = a3;
  BOOL v5 = [(NUAdjustment *)adjustment schema];
  id v6 = [v5 settings];

  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 values];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PIAdjustmentController *)self inputKeys];
  int v9 = [v8 containsObject:v6];

  if (v9)
  {
    [(PIAdjustmentController *)self _setPrimitiveValue:v7 forKey:v6];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PIAdjustmentController;
    [(PIAdjustmentController *)&v10 setValue:v7 forUndefinedKey:v6];
  }
}

- (void)setIsAuto:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![(PIAdjustmentController *)self hasAutoKeyInSchema])
  {
    id v7 = (uint64_t *)MEMORY[0x1E4F7A750];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
    }
    id v8 = (os_log_t *)MEMORY[0x1E4F7A748];
    int v9 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = NSString;
      id v11 = v9;
      uint64_t v12 = [v10 stringWithFormat:@"Adjustment does not have an auto setting"];
      *(_DWORD *)buf = 138543362;
      double v27 = v12;
      _os_log_impl(&dword_1A9680000, v11, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v13 = *v7;
      if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v13 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
        }
LABEL_13:
        os_log_t v14 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
          uint64_t v16 = (void *)MEMORY[0x1E4F29060];
          id v17 = specific;
          char v18 = v14;
          unint64_t v19 = [v16 callStackSymbols];
          long long v20 = [v19 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          double v27 = specific;
          __int16 v28 = 2114;
          v29 = v20;
          _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_21:
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (v13 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
      }
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_13;
    }
    os_log_t v21 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)MEMORY[0x1E4F29060];
      char v18 = v21;
      uint64_t v23 = [v22 callStackSymbols];
      BOOL v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v27 = v24;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_21;
    }
LABEL_18:
    _NUAssertContinueHandler();
    return;
  }
  if ([(PIAdjustmentController *)self canHaveAuto])
  {
    id v25 = [NSNumber numberWithBool:v3];
    BOOL v5 = [(PIAdjustmentController *)self adjustment];
    id v6 = [(id)objc_opt_class() autoKey];
    [v5 setObject:v25 forKeyedSubscript:v6];
  }
}

- (BOOL)isAuto
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![(PIAdjustmentController *)self hasAutoKeyInSchema])
  {
    id v8 = (uint64_t *)MEMORY[0x1E4F7A750];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
    }
    int v9 = (os_log_t *)MEMORY[0x1E4F7A748];
    objc_super v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSString;
      uint64_t v12 = v10;
      uint64_t v13 = [v11 stringWithFormat:@"Adjustment does not have an auto setting"];
      int v26 = 138543362;
      double v27 = v13;
      _os_log_impl(&dword_1A9680000, v12, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&v26, 0xCu);

      uint64_t v14 = *v8;
      if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
        }
LABEL_11:
        os_log_t v15 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
          id v17 = (void *)MEMORY[0x1E4F29060];
          id v18 = specific;
          unint64_t v19 = v15;
          long long v20 = [v17 callStackSymbols];
          os_log_t v21 = [v20 componentsJoinedByString:@"\n"];
          int v26 = 138543618;
          double v27 = specific;
          __int16 v28 = 2114;
          v29 = v21;
          _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v26, 0x16u);

LABEL_19:
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
      }
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_11;
    }
    os_log_t v22 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F29060];
      unint64_t v19 = v22;
      BOOL v24 = [v23 callStackSymbols];
      id v25 = [v24 componentsJoinedByString:@"\n"];
      int v26 = 138543362;
      double v27 = v25;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v26, 0xCu);

      goto LABEL_19;
    }
LABEL_16:
    _NUAssertContinueHandler();
    return 0;
  }
  if ([(PIAdjustmentController *)self canHaveAuto])
  {
    BOOL v3 = [(PIAdjustmentController *)self adjustment];
    id v4 = [(id)objc_opt_class() autoKey];
    BOOL v5 = [v3 objectForKeyedSubscript:v4];
    char v6 = [v5 BOOLValue];

    return v6;
  }
  return 0;
}

- (BOOL)hasAutoKeyInSchema
{
  BOOL v3 = [(id)objc_opt_class() autoKey];
  LOBYTE(self) = [(PIAdjustmentController *)self hasInputKey:v3];

  return (char)self;
}

- (BOOL)canHaveAuto
{
  BOOL v3 = [(id)objc_opt_class() autoKey];
  LOBYTE(self) = [(PIAdjustmentController *)self hasInputKey:v3];

  return (char)self;
}

- (BOOL)canBeEnabled
{
  BOOL v3 = [(id)objc_opt_class() enabledKey];
  LOBYTE(self) = [(PIAdjustmentController *)self hasInputKey:v3];

  return (char)self;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(id)objc_opt_class() enabledKey];
  if (![(PIAdjustmentController *)self hasInputKey:v5])
  {
    id v8 = (uint64_t *)MEMORY[0x1E4F7A750];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
    }
    int v9 = (os_log_t *)MEMORY[0x1E4F7A748];
    objc_super v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSString;
      uint64_t v12 = v10;
      uint64_t v13 = [v11 stringWithFormat:@"Adjustment does not have an enabled setting"];
      *(_DWORD *)buf = 138543362;
      __int16 v28 = v13;
      _os_log_impl(&dword_1A9680000, v12, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v14 = *v8;
      if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
        }
LABEL_12:
        os_log_t v15 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
          id v17 = (void *)MEMORY[0x1E4F29060];
          id v18 = specific;
          unint64_t v19 = v15;
          long long v20 = [v17 callStackSymbols];
          os_log_t v21 = [v20 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          __int16 v28 = specific;
          __int16 v29 = 2114;
          uint64_t v30 = v21;
          _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_19:
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
      }
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_12;
    }
    os_log_t v22 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F29060];
      unint64_t v19 = v22;
      BOOL v24 = [v23 callStackSymbols];
      id v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v28 = v25;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_19;
    }
LABEL_17:
    _NUAssertContinueHandler();

    return;
  }

  id v26 = [NSNumber numberWithBool:v3];
  char v6 = [(PIAdjustmentController *)self adjustment];
  id v7 = [(id)objc_opt_class() enabledKey];
  [v6 setObject:v26 forKeyedSubscript:v7];
}

- (BOOL)enabled
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(PIAdjustmentController *)self canBeEnabled])
  {
    BOOL v3 = [(PIAdjustmentController *)self adjustment];
    id v4 = [(id)objc_opt_class() enabledKey];
    BOOL v5 = [v3 objectForKeyedSubscript:v4];
    char v6 = [v5 BOOLValue];

    return v6;
  }
  id v8 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
  }
  int v9 = (os_log_t *)MEMORY[0x1E4F7A748];
  objc_super v10 = (void *)*MEMORY[0x1E4F7A748];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = NSString;
    uint64_t v12 = v10;
    uint64_t v13 = [v11 stringWithFormat:@"Adjustment does not have an enabled setting"];
    int v26 = 138543362;
    double v27 = v13;
    _os_log_impl(&dword_1A9680000, v12, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&v26, 0xCu);

    uint64_t v14 = *v8;
    if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
      }
LABEL_10:
      os_log_t v15 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
        id v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = specific;
        unint64_t v19 = v15;
        long long v20 = [v17 callStackSymbols];
        os_log_t v21 = [v20 componentsJoinedByString:@"\n"];
        int v26 = 138543618;
        double v27 = specific;
        __int16 v28 = 2114;
        __int16 v29 = v21;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v26, 0x16u);

LABEL_17:
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (v14 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_3040);
    }
  }
  else if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
  {
    goto LABEL_10;
  }
  os_log_t v22 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F29060];
    unint64_t v19 = v22;
    BOOL v24 = [v23 callStackSymbols];
    id v25 = [v24 componentsJoinedByString:@"\n"];
    int v26 = 138543362;
    double v27 = v25;
    _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v26, 0xCu);

    goto LABEL_17;
  }
LABEL_15:
  _NUAssertContinueHandler();
  return 1;
}

- (BOOL)hasInputKey:(id)a3
{
  BOOL v3 = [(PIAdjustmentController *)self settingForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)settingForKey:(id)a3
{
  adjustment = self->_adjustment;
  id v4 = a3;
  BOOL v5 = [(NUAdjustment *)adjustment schema];
  char v6 = [v5 settings];
  id v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (NSArray)inputKeys
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  adjustment = self->_adjustment;
  if (!adjustment)
  {
    id v7 = NUAssertLogger_3067();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [NSString stringWithFormat:@"Adjustment empty"];
      int v20 = 138543362;
      os_log_t v21 = v8;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v20, 0xCu);
    }
    int v9 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v11 = NUAssertLogger_3067();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        os_log_t v15 = dispatch_get_specific(*v9);
        uint64_t v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        id v18 = [v16 callStackSymbols];
        unint64_t v19 = [v18 componentsJoinedByString:@"\n"];
        int v20 = 138543618;
        os_log_t v21 = v15;
        __int16 v22 = 2114;
        uint64_t v23 = v19;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v20, 0x16u);
      }
    }
    else if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v13 componentsJoinedByString:@"\n"];
      int v20 = 138543362;
      os_log_t v21 = v14;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v20, 0xCu);
    }
    _NUAssertFailHandler();
  }
  BOOL v3 = [(NUAdjustment *)adjustment schema];
  id v4 = [v3 settings];
  BOOL v5 = [v4 allKeys];

  return (NSArray *)v5;
}

- (NSString)displayName
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  adjustment = self->_adjustment;
  if (!adjustment)
  {
    char v6 = NUAssertLogger_3067();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Adjustment empty"];
      int v19 = 138543362;
      int v20 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v19, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    objc_super v10 = NUAssertLogger_3067();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        uint64_t v14 = dispatch_get_specific(*v8);
        os_log_t v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        id v17 = [v15 callStackSymbols];
        id v18 = [v17 componentsJoinedByString:@"\n"];
        int v19 = 138543618;
        int v20 = v14;
        __int16 v21 = 2114;
        __int16 v22 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v19, 0x16u);
      }
    }
    else if (v11)
    {
      BOOL v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
      int v19 = 138543362;
      int v20 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v19, 0xCu);
    }
    _NUAssertFailHandler();
  }
  BOOL v3 = [(NUAdjustment *)adjustment identifier];
  id v4 = [v3 name];

  return (NSString *)v4;
}

- (PIAdjustmentController)initWithAdjustment:(id)a3
{
  id v4 = (NUAdjustment *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PIAdjustmentController;
  BOOL v5 = [(PIAdjustmentController *)&v8 init];
  adjustment = v5->_adjustment;
  v5->_adjustment = v4;

  return v5;
}

+ (id)enabledKey
{
  return @"enabled";
}

+ (id)autoKey
{
  return @"auto";
}

@end