@interface _PSCandidate
+ (BOOL)supportsSecureCoding;
+ selfCandidate;
- (BOOL)hasCandidateIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleId;
- (NSString)derivedIntentId;
- (NSString)domainId;
- (NSString)recipientsId;
- (_PSCandidate)initWithCoder:(id)a3;
- (_PSCandidate)initWithDomainId:(id)a3 derivedIntentId:(id)a4 bundleId:(id)a5 recipientsId:(id)a6;
- (id)candidateForDeduping;
- (id)candidateIdentifier;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)populateIsSystemBundleId;
@end

@implementation _PSCandidate

- (_PSCandidate)initWithDomainId:(id)a3 derivedIntentId:(id)a4 bundleId:(id)a5 recipientsId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_PSCandidate;
  v14 = [(_PSCandidate *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    domainId = v14->_domainId;
    v14->_domainId = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    derivedIntentId = v14->_derivedIntentId;
    v14->_derivedIntentId = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    bundleId = v14->_bundleId;
    v14->_bundleId = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    recipientsId = v14->_recipientsId;
    v14->_recipientsId = (NSString *)v21;

    [(_PSCandidate *)v14 populateIsSystemBundleId];
  }

  return v14;
}

- (_PSCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_PSCandidate;
  v5 = [(_PSCandidate *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainId"];
    domainId = v5->_domainId;
    v5->_domainId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"derivedIntentId"];
    derivedIntentId = v5->_derivedIntentId;
    v5->_derivedIntentId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientsId"];
    recipientsId = v5->_recipientsId;
    v5->_recipientsId = (NSString *)v12;

    [(_PSCandidate *)v5 populateIsSystemBundleId];
    v14 = v5;
  }

  return v5;
}

- (void)populateIsSystemBundleId
{
  id v3 = +[_PSConstants systemBundleIds];
  self->_isSystemBundleId = [v3 containsObject:self->_bundleId];
}

- (void)encodeWithCoder:(id)a3
{
  domainId = self->_domainId;
  id v5 = a3;
  [v5 encodeObject:domainId forKey:@"domainId"];
  [v5 encodeObject:self->_derivedIntentId forKey:@"derivedIntentId"];
  [v5 encodeObject:self->_bundleId forKey:@"bundleId"];
  [v5 encodeObject:self->_recipientsId forKey:@"recipientsId"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(_PSCandidate *)self candidateIdentifier];
  id v5 = (void *)[v3 initWithFormat:@"%@_%@", v4, self->_bundleId];

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domainId hash];
  NSUInteger v4 = [(NSString *)self->_derivedIntentId hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_recipientsId hash] - v4 + 32 * v4;
  return [(NSString *)self->_bundleId hash] - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (_PSCandidate *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      domainId = self->_domainId;
      v7 = v5->_domainId;
      if (domainId == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        v9 = domainId;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_15;
        }
      }
      derivedIntentId = self->_derivedIntentId;
      id v13 = v5->_derivedIntentId;
      if (derivedIntentId == v13)
      {
      }
      else
      {
        v14 = v13;
        uint64_t v15 = derivedIntentId;
        char v16 = [(NSString *)v15 isEqual:v14];

        if ((v16 & 1) == 0) {
          goto LABEL_15;
        }
      }
      recipientsId = self->_recipientsId;
      v18 = v5->_recipientsId;
      if (recipientsId == v18)
      {
      }
      else
      {
        uint64_t v19 = v18;
        v20 = recipientsId;
        char v21 = [(NSString *)v20 isEqual:v19];

        if ((v21 & 1) == 0)
        {
LABEL_15:
          char v11 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      v22 = self->_bundleId;
      v23 = v22;
      if (v22 == v5->_bundleId) {
        char v11 = 1;
      }
      else {
        char v11 = -[NSString isEqual:](v22, "isEqual:");
      }

      goto LABEL_21;
    }
    char v11 = 0;
  }
LABEL_22:

  return v11;
}

- (BOOL)hasCandidateIdentifier
{
  return self->_domainId || self->_derivedIntentId || self->_recipientsId != 0;
}

- (id)candidateIdentifier
{
  if (!self->_isSystemBundleId)
  {
    derivedIntentId = self->_derivedIntentId;
    if (derivedIntentId) {
      return derivedIntentId;
    }
    goto LABEL_3;
  }
  derivedIntentId = self->_domainId;
  if (!derivedIntentId) {
LABEL_3:
  }
    derivedIntentId = self->_recipientsId;
  return derivedIntentId;
}

- (id)candidateForDeduping
{
  BOOL isSystemBundleId = self->_isSystemBundleId;
  NSUInteger v4 = [_PSCandidate alloc];
  if (isSystemBundleId)
  {
    derivedIntentId = 0;
    domainId = self->_domainId;
  }
  else
  {
    domainId = 0;
    derivedIntentId = self->_derivedIntentId;
  }
  v7 = [(_PSCandidate *)v4 initWithDomainId:domainId derivedIntentId:derivedIntentId bundleId:self->_bundleId recipientsId:self->_recipientsId];
  if ([(_PSCandidate *)v7 isEqual:self])
  {
    uint64_t v8 = self;

    v7 = v8;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(_PSCandidate *)self candidateIdentifier];
  uint64_t v6 = [v4 candidateIdentifier];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

+ selfCandidate
{
  void *v2;
  uint64_t vars8;

  if (selfCandidate__pasOnceToken2 != -1) {
    dispatch_once(&selfCandidate__pasOnceToken2, &__block_literal_global_8);
  }
  v2 = (void *)selfCandidate__pasExprOnceResult;

  return v2;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)derivedIntentId
{
  return self->_derivedIntentId;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)recipientsId
{
  return self->_recipientsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientsId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_derivedIntentId, 0);

  objc_storeStrong((id *)&self->_domainId, 0);
}

@end