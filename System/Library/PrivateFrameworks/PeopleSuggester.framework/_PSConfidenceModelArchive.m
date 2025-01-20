@interface _PSConfidenceModelArchive
+ (BOOL)supportsSecureCoding;
- (NSDictionary)confidenceModelDictionary;
- (_PSConfidenceModelArchive)initWithCoder:(id)a3;
- (_PSConfidenceModelArchive)initWithConfidenceModelDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PSConfidenceModelArchive

- (_PSConfidenceModelArchive)initWithConfidenceModelDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSConfidenceModelArchive;
  v6 = [(_PSConfidenceModelArchive *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_confidenceModelDictionary, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(_PSConfidenceModelArchive *)self confidenceModelDictionary];
  v6 = (void *)[v4 initWithConfidenceModelDictionary:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_PSConfidenceModelArchive *)self confidenceModelDictionary];
  id v5 = NSStringFromSelector(sel_confidenceModelDictionary);
  [v4 encodeObject:v6 forKey:v5];
}

- (_PSConfidenceModelArchive)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v13 = NSStringFromSelector(sel_confidenceModelDictionary);
  v14 = [v5 decodeObjectOfClasses:v12 forKey:v13];

  v15 = [(_PSConfidenceModelArchive *)self initWithConfidenceModelDictionary:v14];
  return v15;
}

- (NSDictionary)confidenceModelDictionary
{
  return self->_confidenceModelDictionary;
}

- (void).cxx_destruct
{
}

@end