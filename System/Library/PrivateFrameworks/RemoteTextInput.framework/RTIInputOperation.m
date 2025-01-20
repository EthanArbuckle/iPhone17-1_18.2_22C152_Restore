@interface RTIInputOperation
+ (BOOL)supportsSecureCoding;
+ (id)_stringForScrollType:(unint64_t)a3;
+ (id)scrollingInputOperationWithType:(unint64_t)a3 contentTransform:(CGAffineTransform *)a4 environmentTransform:(CGAffineTransform *)a5;
+ (unint64_t)_scrollTypeForString:(id)a3;
+ (void)registerClassesForScrollingInputOperations;
+ (void)registerCustomInfoClasses:(id)a3 forType:(id)a4;
+ (void)unregisterClassesForScrollingInputOperations;
+ (void)unregisterCustomInfoType:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isScrollingInputOperation;
- (CGAffineTransform)contentTransform;
- (CGAffineTransform)environmentTransform;
- (NSSecureCoding)customInfo;
- (NSString)customInfoType;
- (RTIInputOperation)initWithCoder:(id)a3;
- (SEL)actionSelector;
- (TIKeyboardInput)keyboardInput;
- (int)inputModality;
- (unint64_t)scrollType;
- (void)encodeWithCoder:(id)a3;
- (void)setActionSelector:(SEL)a3;
- (void)setCustomInfo:(id)a3;
- (void)setCustomInfoType:(id)a3;
- (void)setInputModality:(int)a3;
- (void)setKeyboardInput:(id)a3;
@end

@implementation RTIInputOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customInfo, 0);
  objc_storeStrong((id *)&self->_customInfoType, 0);
  objc_storeStrong((id *)&self->_keyboardInput, 0);
}

- (void)setCustomInfoType:(id)a3
{
}

- (void)setCustomInfo:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  if (([v11 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  v4 = [(RTIInputOperation *)self keyboardInput];

  if (v4)
  {
    v5 = [(RTIInputOperation *)self keyboardInput];
    [v11 encodeObject:v5 forKey:@"keyboardInput"];
  }
  if ([(RTIInputOperation *)self actionSelector])
  {
    v6 = NSStringFromSelector([(RTIInputOperation *)self actionSelector]);
    [v11 encodeObject:v6 forKey:@"inputActionSelectorKey"];
  }
  objc_msgSend(v11, "encodeInteger:forKey:", -[RTIInputOperation inputModality](self, "inputModality"), @"inputModalityKey");
  v7 = [(RTIInputOperation *)self customInfoType];

  if (v7)
  {
    v8 = [(RTIInputOperation *)self customInfoType];
    [v11 encodeObject:v8 forKey:@"customInfoTypeKey"];
  }
  v9 = [(RTIInputOperation *)self customInfo];

  if (v9)
  {
    v10 = [(RTIInputOperation *)self customInfo];
    [v11 encodeObject:v10 forKey:@"customInfoKey"];
  }
}

- (RTIInputOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v17.receiver = self;
  v17.super_class = (Class)RTIInputOperation;
  v5 = [(RTIInputOperation *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardInput"];
    keyboardInput = v5->_keyboardInput;
    v5->_keyboardInput = (TIKeyboardInput *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputActionSelectorKey"];
    v9 = v8;
    if (v8) {
      v5->_actionSelector = NSSelectorFromString(v8);
    }
    v5->_inputModality = [v4 decodeIntegerForKey:@"inputModalityKey"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customInfoTypeKey"];
    customInfoType = v5->_customInfoType;
    v5->_customInfoType = (NSString *)v10;

    v12 = v5->_customInfoType;
    if (v12)
    {
      v13 = +[RTIUtilities customInfoClassesForType:v12 forClass:objc_opt_class()];
      if ([v13 count])
      {
        uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"customInfoKey"];
        customInfo = v5->_customInfo;
        v5->_customInfo = (NSSecureCoding *)v14;
      }
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTIInputOperation *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(RTIInputOperation *)self keyboardInput];
      uint64_t v7 = [(RTIInputOperation *)v5 keyboardInput];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        v9 = [(RTIInputOperation *)self keyboardInput];
        uint64_t v10 = [v9 string];
        id v11 = [(RTIInputOperation *)v5 keyboardInput];
        v12 = [v11 string];
        int v13 = [v10 isEqualToString:v12];

        if (!v13) {
          goto LABEL_15;
        }
      }
      v15 = [(RTIInputOperation *)self customInfoType];
      uint64_t v16 = [(RTIInputOperation *)v5 customInfoType];
      if (v15 == (void *)v16)
      {
      }
      else
      {
        objc_super v17 = (void *)v16;
        v18 = [(RTIInputOperation *)self customInfoType];
        v19 = [(RTIInputOperation *)v5 customInfoType];
        int v20 = [v18 isEqual:v19];

        if (!v20) {
          goto LABEL_15;
        }
      }
      v21 = [(RTIInputOperation *)self customInfo];
      uint64_t v22 = [(RTIInputOperation *)v5 customInfo];
      if (v21 == (void *)v22)
      {
      }
      else
      {
        v23 = (void *)v22;
        v24 = [(RTIInputOperation *)self customInfo];
        v25 = [(RTIInputOperation *)v5 customInfo];
        int v26 = [v24 isEqual:v25];

        if (!v26)
        {
LABEL_15:
          BOOL v14 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      int v27 = [(RTIInputOperation *)self inputModality];
      BOOL v14 = v27 == [(RTIInputOperation *)v5 inputModality];
      goto LABEL_18;
    }
    BOOL v14 = 0;
  }
LABEL_19:

  return v14;
}

+ (void)registerCustomInfoClasses:(id)a3 forType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[RTIUtilities registerCustomInfoClasses:v6 forType:v5 forClass:objc_opt_class()];
}

+ (void)unregisterCustomInfoType:(id)a3
{
  id v3 = a3;
  +[RTIUtilities unregisterCustomInfoType:v3 forClass:objc_opt_class()];
}

- (TIKeyboardInput)keyboardInput
{
  return self->_keyboardInput;
}

- (void)setKeyboardInput:(id)a3
{
}

- (SEL)actionSelector
{
  return self->_actionSelector;
}

- (void)setActionSelector:(SEL)a3
{
  self->_actionSelector = a3;
}

- (int)inputModality
{
  return self->_inputModality;
}

- (void)setInputModality:(int)a3
{
  self->_inputModality = a3;
}

- (NSString)customInfoType
{
  return self->_customInfoType;
}

- (NSSecureCoding)customInfo
{
  return self->_customInfo;
}

+ (unint64_t)_scrollTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"textSelectionWillScroll"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"textSelectionScrolling"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"textSelectionDidScroll"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)_stringForScrollType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return &stru_1EEAB1148;
  }
  else {
    return off_1E583C768[a3 - 1];
  }
}

+ (void)registerClassesForScrollingInputOperations
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  +[RTIInputOperation registerCustomInfoClasses:v5 forType:@"UIUserInteractionRemoteInputOperations"];
}

+ (void)unregisterClassesForScrollingInputOperations
{
}

+ (id)scrollingInputOperationWithType:(unint64_t)a3 contentTransform:(CGAffineTransform *)a4 environmentTransform:(CGAffineTransform *)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v9 = objc_alloc_init(RTIInputOperation);
  uint64_t v10 = [a1 _stringForScrollType:a3];
  [(RTIInputOperation *)v9 setActionSelector:NSSelectorFromString(v10)];

  [(RTIInputOperation *)v9 setCustomInfoType:@"UIUserInteractionRemoteInputOperations"];
  v15[0] = @"contentTransform";
  id v11 = [MEMORY[0x1E4F29238] valueWithBytes:a4 objCType:"{CGAffineTransform=dddddd}"];
  v15[1] = @"environmentTransform";
  v16[0] = v11;
  v12 = [MEMORY[0x1E4F29238] valueWithBytes:a5 objCType:"{CGAffineTransform=dddddd}"];
  v16[1] = v12;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [(RTIInputOperation *)v9 setCustomInfo:v13];

  return v9;
}

- (BOOL)isScrollingInputOperation
{
  uint64_t v3 = [(RTIInputOperation *)self customInfoType];
  if ([v3 isEqualToString:@"UIUserInteractionRemoteInputOperations"]) {
    BOOL v4 = [(RTIInputOperation *)self scrollType] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (unint64_t)scrollType
{
  uint64_t v3 = objc_opt_class();
  BOOL v4 = NSStringFromSelector([(RTIInputOperation *)self actionSelector]);
  unint64_t v5 = [v3 _scrollTypeForString:v4];

  return v5;
}

- (CGAffineTransform)contentTransform
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  uint64_t v7 = [(RTIInputOperation *)self customInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [(RTIInputOperation *)self customInfo];
    id v12 = [v10 objectForKey:@"contentTransform"];

    id v11 = v12;
    if (v12)
    {
      [v12 getValue:retstr size:48];
      id v11 = v12;
    }
  }
  return result;
}

- (CGAffineTransform)environmentTransform
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  uint64_t v7 = [(RTIInputOperation *)self customInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [(RTIInputOperation *)self customInfo];
    id v12 = [v10 objectForKey:@"environmentTransform"];

    id v11 = v12;
    if (v12)
    {
      [v12 getValue:retstr size:48];
      id v11 = v12;
    }
  }
  return result;
}

@end