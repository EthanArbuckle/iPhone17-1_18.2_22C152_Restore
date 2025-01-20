@interface PPSocialHighlightStoreRequestKey
+ (id)socialHighlightStoreRequestKeyWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 reason:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSocialHighlightStoreRequestKey:(id)a3;
- (NSString)client;
- (NSString)reason;
- (NSString)variant;
- (PPSocialHighlightStoreRequestKey)initWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 reason:(id)a6;
- (id)copyWithReplacementClient:(id)a3;
- (id)copyWithReplacementLimit:(unint64_t)a3;
- (id)copyWithReplacementReason:(id)a3;
- (id)copyWithReplacementVariant:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)limit;
@end

@implementation PPSocialHighlightStoreRequestKey

- (unint64_t)hash
{
  unint64_t limit = self->_limit;
  NSUInteger v4 = [(NSString *)self->_client hash] - limit + 32 * limit;
  NSUInteger v5 = [(NSString *)self->_variant hash] - v4 + 32 * v4;
  return [(NSString *)self->_reason hash] - v5 + 32 * v5;
}

+ (id)socialHighlightStoreRequestKeyWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 reason:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = (void *)[objc_alloc((Class)a1) initWithLimit:a3 client:v12 variant:v11 reason:v10];

  return v13;
}

- (PPSocialHighlightStoreRequestKey)initWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 reason:(id)a6
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PPSocialHighlightStore.m", 56, @"Invalid parameter not satisfying: %@", @"client != nil" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PPSocialHighlightStore.m", 57, @"Invalid parameter not satisfying: %@", @"variant != nil" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)PPSocialHighlightStoreRequestKey;
  v15 = [(PPSocialHighlightStoreRequestKey *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_unint64_t limit = a3;
    objc_storeStrong((id *)&v15->_client, a4);
    objc_storeStrong((id *)&v16->_variant, a5);
    objc_storeStrong((id *)&v16->_reason, a6);
  }

  return v16;
}

- (BOOL)isEqualToSocialHighlightStoreRequestKey:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  unint64_t limit = self->_limit;
  if (limit != [v4 limit]) {
    goto LABEL_12;
  }
  int v7 = self->_client != 0;
  v8 = [v5 client];
  int v9 = v8 == 0;

  if (v7 == v9) {
    goto LABEL_12;
  }
  client = self->_client;
  if (client)
  {
    id v11 = [v5 client];
    int v12 = [(NSString *)client isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  int v13 = self->_variant != 0;
  id v14 = [v5 variant];
  int v15 = v14 == 0;

  if (v13 == v15) {
    goto LABEL_12;
  }
  variant = self->_variant;
  if (variant)
  {
    v17 = [v5 variant];
    int v18 = [(NSString *)variant isEqual:v17];

    if (!v18) {
      goto LABEL_12;
    }
  }
  int v19 = self->_reason != 0;
  objc_super v20 = [v5 reason];
  int v21 = v20 == 0;

  if (v19 == v21)
  {
LABEL_12:
    char v24 = 0;
  }
  else
  {
    reason = self->_reason;
    if (reason)
    {
      v23 = [v5 reason];
      char v24 = [(NSString *)reason isEqual:v23];
    }
    else
    {
      char v24 = 1;
    }
  }

  return v24;
}

- (NSString)variant
{
  return self->_variant;
}

- (NSString)client
{
  return self->_client;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPSocialHighlightStoreRequestKey *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPSocialHighlightStoreRequestKey *)self isEqualToSocialHighlightStoreRequestKey:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_limit];
  NSUInteger v5 = (void *)[v3 initWithFormat:@"<PPSocialHighlightStoreRequestKey | limit:%@ client:%@ variant:%@ reason:%@>", v4, self->_client, self->_variant, self->_reason];

  return v5;
}

- (id)copyWithReplacementReason:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLimit:self->_limit client:self->_client variant:self->_variant reason:v4];

  return v5;
}

- (id)copyWithReplacementVariant:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLimit:self->_limit client:self->_client variant:v4 reason:self->_reason];

  return v5;
}

- (id)copyWithReplacementClient:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLimit:self->_limit client:v4 variant:self->_variant reason:self->_reason];

  return v5;
}

- (id)copyWithReplacementLimit:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  client = self->_client;
  variant = self->_variant;
  reason = self->_reason;
  return (id)[v5 initWithLimit:a3 client:client variant:variant reason:reason];
}

@end