@interface TRITaskQueuingOptions
+ (BOOL)supportsSecureCoding;
+ (id)defaultOptionsWithIgnoreDuplicates;
+ (id)optionsWithDuplicateTaskResolution:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOptions:(id)a3;
- (TRITaskQueuingOptions)initWithCoder:(id)a3;
- (TRITaskQueuingOptions)initWithDuplicateTaskResolution:(unint64_t)a3;
- (id)copyWithReplacementDuplicateTaskResolution:(unint64_t)a3;
- (id)description;
- (unint64_t)duplicateTaskResolution;
- (unint64_t)hash;
- (void)defaultEncodeWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRITaskQueuingOptions

- (TRITaskQueuingOptions)initWithDuplicateTaskResolution:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TRITaskQueuingOptions;
  result = [(TRITaskQueuingOptions *)&v5 init];
  if (result) {
    result->_duplicateTaskResolution = a3;
  }
  return result;
}

+ (id)optionsWithDuplicateTaskResolution:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDuplicateTaskResolution:a3];
  return v3;
}

- (id)copyWithReplacementDuplicateTaskResolution:(unint64_t)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithDuplicateTaskResolution:a3];
}

- (BOOL)isEqualToOptions:(id)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t duplicateTaskResolution = self->_duplicateTaskResolution;
  return duplicateTaskResolution == [a3 duplicateTaskResolution];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRITaskQueuingOptions *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRITaskQueuingOptions *)self isEqualToOptions:v5];

  return v6;
}

- (unint64_t)hash
{
  return self->_duplicateTaskResolution;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRITaskQueuingOptions)initWithCoder:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"duplicateTaskResolution"];
  if (v5) {
    goto LABEL_2;
  }
  v7 = [v4 error];

  if (v7)
  {
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_7;
  }
  if (([v4 containsValueForKey:@"duplicateTaskResolution"] & 1) == 0)
  {
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Missing serialized value for TRITaskQueuingOptions.duplicateTaskResolution";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRITaskQueuingOptionsOCNTErrorDomain" code:1 userInfo:v8];
    [v4 failWithError:v9];

    goto LABEL_6;
  }
LABEL_2:
  self = [(TRITaskQueuingOptions *)self initWithDuplicateTaskResolution:v5];
  BOOL v6 = self;
LABEL_7:

  return v6;
}

- (void)defaultEncodeWithCoder:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 671, @"Do not use NSKeyedArchiver to persist instances of TRITaskQueuingOptions to disk. If you want to persist this object to disk, create a protobuf schema." object file lineNumber description];
  }
  [(TRITaskQueuingOptions *)self defaultEncodeWithCoder:v6];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_duplicateTaskResolution];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<TRITaskQueuingOptions | duplicateTaskResolution:%@>", v4];

  return v5;
}

- (unint64_t)duplicateTaskResolution
{
  return self->_duplicateTaskResolution;
}

+ (id)defaultOptionsWithIgnoreDuplicates
{
  return +[TRITaskQueuingOptions optionsWithDuplicateTaskResolution:0];
}

@end