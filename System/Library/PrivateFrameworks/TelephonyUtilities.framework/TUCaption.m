@interface TUCaption
+ (BOOL)supportsSecureCoding;
+ (double)averageConfidenceOverCaptions:(id)a3;
+ (id)combinedStringFromCaptions:(id)a3;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCaption:(id)a3;
- (NSNumber)utteranceDuration;
- (NSNumber)utteranceStartTimestamp;
- (NSString)text;
- (TUCaption)initWithCaption:(id)a3;
- (TUCaption)initWithCaptionsToken:(id)a3;
- (TUCaption)initWithCaptionsToken:(id)a3 utteranceStartTimestamp:(id)a4 utteranceDuration:(id)a5;
- (TUCaption)initWithCoder:(id)a3;
- (TUCaption)initWithConfidence:(double)a3 text:(id)a4;
- (double)confidence;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setText:(id)a3;
@end

@implementation TUCaption

- (TUCaption)initWithCaptionsToken:(id)a3 utteranceStartTimestamp:(id)a4 utteranceDuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUCaption initWithCaptionsToken:utteranceStartTimestamp:utteranceDuration:]", @"token" format];
  }
  v11 = [(TUCaption *)self initWithCaptionsToken:v8];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_utteranceStartTimestamp, a4);
    objc_storeStrong((id *)&v12->_utteranceDuration, a5);
  }

  return v12;
}

- (TUCaption)initWithCaptionsToken:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUCaption initWithCaptionsToken:]", @"token" format];
  }
  v11.receiver = self;
  v11.super_class = (Class)TUCaption;
  v5 = [(TUCaption *)&v11 init];
  if (v5)
  {
    [v4 confidence];
    v5->_confidence = v6;
    v7 = [v4 text];
    uint64_t v8 = [v7 copy];
    text = v5->_text;
    v5->_text = (NSString *)v8;
  }
  return v5;
}

- (TUCaption)initWithCaption:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUCaption;
  v5 = [(TUCaption *)&v11 init];
  if (v5)
  {
    double v6 = [v4 text];
    uint64_t v7 = [v6 copy];
    text = v5->_text;
    v5->_text = (NSString *)v7;

    [v4 confidence];
    v5->_confidence = v9;
  }

  return v5;
}

- (TUCaption)initWithConfidence:(double)a3 text:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUCaption;
  uint64_t v7 = [(TUCaption *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_confidence = a3;
    uint64_t v9 = [v6 copy];
    text = v8->_text;
    v8->_text = (NSString *)v9;
  }
  return v8;
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = [a1 unarchivedObjectClasses];
  uint64_t v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  text = self->_text;
  v5 = NSStringFromSelector(sel_text);
  [v12 encodeObject:text forKey:v5];

  double confidence = self->_confidence;
  id v7 = NSStringFromSelector(sel_confidence);
  [v12 encodeDouble:v7 forKey:confidence];

  utteranceDuration = self->_utteranceDuration;
  if (utteranceDuration)
  {
    uint64_t v9 = NSStringFromSelector(sel_utteranceDuration);
    [v12 encodeObject:utteranceDuration forKey:v9];
  }
  utteranceStartTimestamp = self->_utteranceStartTimestamp;
  if (utteranceStartTimestamp)
  {
    objc_super v11 = NSStringFromSelector(sel_utteranceDuration);
    [v12 encodeObject:utteranceStartTimestamp forKey:v11];
  }
}

- (TUCaption)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TUCaption;
  v5 = [(TUCaption *)&v21 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_text);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    text = v5->_text;
    v5->_text = (NSString *)v8;

    id v10 = NSStringFromSelector(sel_confidence);
    [v4 decodeDoubleForKey:v10];
    v5->_double confidence = v11;

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector(sel_utteranceDuration);
    uint64_t v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    utteranceDuration = v5->_utteranceDuration;
    v5->_utteranceDuration = (NSNumber *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_utteranceStartTimestamp);
    uint64_t v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    utteranceStartTimestamp = v5->_utteranceStartTimestamp;
    v5->_utteranceStartTimestamp = (NSNumber *)v18;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUCaption allocWithZone:a3];

  return [(TUCaption *)v4 initWithCaption:self];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_confidence);
  [(TUCaption *)self confidence];
  [v3 appendFormat:@" %@=%f", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = [(TUCaption *)self utteranceDuration];

  if (v6)
  {
    id v7 = [(TUCaption *)self utteranceDuration];
    [v3 appendFormat:@" utteranceDuration=%@", v7];
  }
  [v3 appendFormat:@", "];
  uint64_t v8 = [(TUCaption *)self utteranceStartTimestamp];

  if (v8)
  {
    uint64_t v9 = [(TUCaption *)self utteranceStartTimestamp];
    [v3 appendFormat:@" utteranceStartTimestamp=%@", v9];
  }
  [v3 appendString:@">"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TUCaption *)self text];
  uint64_t v4 = [v3 hash];
  [(TUCaption *)self confidence];
  unint64_t v6 = (unint64_t)v5;
  id v7 = [(TUCaption *)self utteranceDuration];
  uint64_t v8 = v4 ^ [v7 hash];
  uint64_t v9 = [(TUCaption *)self utteranceStartTimestamp];
  unint64_t v10 = v8 ^ [v9 hash] ^ v6;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUCaption *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TUCaption *)self isEqualToCaption:v4];
  }

  return v5;
}

- (BOOL)isEqualToCaption:(id)a3
{
  id v4 = a3;
  text = self->_text;
  unint64_t v6 = [v4 text];
  if (TUObjectsAreEqualOrNil((unint64_t)text, (uint64_t)v6)
    && (double confidence = self->_confidence, [v4 confidence], confidence == v8))
  {
    utteranceDuration = self->_utteranceDuration;
    unint64_t v10 = [v4 utteranceDuration];
    if (TUObjectsAreEqualOrNil((unint64_t)utteranceDuration, (uint64_t)v10))
    {
      utteranceStartTimestamp = self->_utteranceStartTimestamp;
      uint64_t v12 = [v4 utteranceStartTimestamp];
      char v13 = TUObjectsAreEqualOrNil((unint64_t)utteranceStartTimestamp, (uint64_t)v12);
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

+ (id)combinedStringFromCaptions:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__TUCaption_combinedStringFromCaptions___block_invoke;
  v9[3] = &unk_1E58E6FB8;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v7 = [v6 componentsJoinedByString:@" "];

  return v7;
}

void __40__TUCaption_combinedStringFromCaptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 text];
  [v2 addObject:v3];
}

+ (double)averageConfidenceOverCaptions:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__TUCaption_averageConfidenceOverCaptions___block_invoke;
  v7[3] = &unk_1E58E6FE0;
  v7[4] = &v8;
  [v3 enumerateObjectsUsingBlock:v7];
  double v4 = v9[3];
  double v5 = v4 / (double)(unint64_t)[v3 count];
  _Block_object_dispose(&v8, 8);

  return v5;
}

double __43__TUCaption_averageConfidenceOverCaptions___block_invoke(uint64_t a1, void *a2)
{
  [a2 confidence];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_double confidence = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSNumber)utteranceStartTimestamp
{
  return self->_utteranceStartTimestamp;
}

- (NSNumber)utteranceDuration
{
  return self->_utteranceDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceDuration, 0);
  objc_storeStrong((id *)&self->_utteranceStartTimestamp, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end