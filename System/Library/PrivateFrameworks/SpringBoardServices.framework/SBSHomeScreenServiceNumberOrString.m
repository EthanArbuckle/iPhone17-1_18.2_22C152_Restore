@interface SBSHomeScreenServiceNumberOrString
+ (BOOL)supportsSecureCoding;
- (NSCopying)numberOrString;
- (SBSHomeScreenServiceNumberOrString)init;
- (SBSHomeScreenServiceNumberOrString)initWithCoder:(id)a3;
- (SBSHomeScreenServiceNumberOrString)initWithNumberOrString:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSHomeScreenServiceNumberOrString

- (SBSHomeScreenServiceNumberOrString)initWithNumberOrString:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = self;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_6;
      }
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"SBSHomeScreenServiceSpecification.m", 106, @"Invalid parameter not satisfying: %@", @"!numberOrString || [numberOrString isKindOfClass:[NSString self]] || [numberOrString isKindOfClass:[NSNumber self]]" object file lineNumber description];
    }
  }
LABEL_6:
  v13.receiver = self;
  v13.super_class = (Class)SBSHomeScreenServiceNumberOrString;
  v9 = [(SBSHomeScreenServiceNumberOrString *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v5 copyWithZone:0];
    numberOrString = v9->_numberOrString;
    v9->_numberOrString = (NSCopying *)v10;
  }
  return v9;
}

- (SBSHomeScreenServiceNumberOrString)init
{
  return [(SBSHomeScreenServiceNumberOrString *)self initWithNumberOrString:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SBSHomeScreenServiceNumberOrString)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = self;
  v7 = self;
  v8 = [v4 setWithObjects:v6, v7];
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"numberOrString"];

  uint64_t v10 = [(SBSHomeScreenServiceNumberOrString *)self initWithNumberOrString:v9];
  return v10;
}

- (NSCopying)numberOrString
{
  return self->_numberOrString;
}

- (void).cxx_destruct
{
}

@end