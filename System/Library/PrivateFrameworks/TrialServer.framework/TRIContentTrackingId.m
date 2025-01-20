@interface TRIContentTrackingId
+ (id)contentIdWithStr:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContentId:(id)a3;
- (NSString)str;
- (TRIContentTrackingId)initWithStr:(id)a3;
- (id)copyWithReplacementStr:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIContentTrackingId

- (TRIContentTrackingId)initWithStr:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1203, @"Invalid parameter not satisfying: %@", @"str != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIContentTrackingId;
  v7 = [(TRIContentTrackingId *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_str, a3);
  }

  return v8;
}

+ (id)contentIdWithStr:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithStr:v4];

  return v5;
}

- (id)copyWithReplacementStr:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStr:v3];

  return v4;
}

- (BOOL)isEqualToContentId:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4
    || (int v6 = self->_str != 0,
        [v4 str],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = v7 == 0,
        v7,
        v6 == v8))
  {
    char v11 = 0;
  }
  else
  {
    str = self->_str;
    if (str)
    {
      v10 = [v5 str];
      char v11 = [(NSString *)str isEqual:v10];
    }
    else
    {
      char v11 = 1;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIContentTrackingId *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIContentTrackingId *)self isEqualToContentId:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_str hash];
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIContentTrackingId | str:%@>", self->_str];
  return v2;
}

- (NSString)str
{
  return self->_str;
}

- (void).cxx_destruct
{
}

@end