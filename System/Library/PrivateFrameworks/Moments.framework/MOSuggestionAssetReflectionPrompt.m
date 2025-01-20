@interface MOSuggestionAssetReflectionPrompt
+ (BOOL)supportsSecureCoding;
- (MOSuggestionAssetReflectionPrompt)initWithCoder:(id)a3;
- (MOSuggestionAssetReflectionPrompt)initWithReflectionPrompts:(id)a3 icon:(id)a4 type:(unint64_t)a5;
- (NSArray)reflectionPrompts;
- (NSString)reflectionPrompt;
- (UIImage)reflectionVisual;
- (unint64_t)reflectionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOSuggestionAssetReflectionPrompt

- (MOSuggestionAssetReflectionPrompt)initWithReflectionPrompts:(id)a3 icon:(id)a4 type:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MOSuggestionAssetReflectionPrompt;
  v11 = [(MOSuggestionAssetReflectionPrompt *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_reflectionPrompts, a3);
    objc_storeStrong((id *)&v12->_reflectionVisual, a4);
    v12->_reflectionType = a5;
    uint64_t v13 = [v9 firstObject];
    reflectionPrompt = v12->_reflectionPrompt;
    v12->_reflectionPrompt = (NSString *)v13;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  reflectionPrompts = self->_reflectionPrompts;
  id v5 = a3;
  [v5 encodeObject:reflectionPrompts forKey:@"kCoderKeyReflectionAssetPrompts"];
  [v5 encodeObject:self->_reflectionPrompt forKey:@"kCoderKeyReflectionAssetPrompt"];
  [v5 encodeObject:self->_reflectionVisual forKey:@"kCoderKeyReflectionAssetImage"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_reflectionType];
  [v5 encodeObject:v6 forKey:@"kCoderKeyReflectionAssetType"];
}

- (MOSuggestionAssetReflectionPrompt)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MOSuggestionAssetReflectionPrompt;
  id v5 = [(MOSuggestionAssetReflectionPrompt *)&v17 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kCoderKeyReflectionAssetPrompts"];
    reflectionPrompts = v5->_reflectionPrompts;
    v5->_reflectionPrompts = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyReflectionAssetPrompt"];
    reflectionPrompt = v5->_reflectionPrompt;
    v5->_reflectionPrompt = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyReflectionAssetImage"];
    reflectionVisual = v5->_reflectionVisual;
    v5->_reflectionVisual = (UIImage *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyReflectionAssetType"];
    v5->_reflectionType = (int)[v15 intValue];
  }
  return v5;
}

- (NSString)reflectionPrompt
{
  return self->_reflectionPrompt;
}

- (NSArray)reflectionPrompts
{
  return self->_reflectionPrompts;
}

- (UIImage)reflectionVisual
{
  return self->_reflectionVisual;
}

- (unint64_t)reflectionType
{
  return self->_reflectionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reflectionVisual, 0);
  objc_storeStrong((id *)&self->_reflectionPrompts, 0);
  objc_storeStrong((id *)&self->_reflectionPrompt, 0);
}

@end