@interface NTKArgonExtractorOperation
- (BOOL)isEqual:(id)a3;
- (NTKArgonExtractorOperation)initWithKeyDescriptor:(id)a3 operationType:(int64_t)a4;
- (NTKArgonKeyDescriptor)keyDescriptor;
- (int64_t)operationType;
- (unint64_t)hash;
@end

@implementation NTKArgonExtractorOperation

- (NTKArgonExtractorOperation)initWithKeyDescriptor:(id)a3 operationType:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKArgonExtractorOperation;
  v7 = [(NTKArgonExtractorOperation *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    keyDescriptor = v7->_keyDescriptor;
    v7->_keyDescriptor = (NTKArgonKeyDescriptor *)v8;

    v7->_operationType = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [(NTKArgonExtractorOperation *)self keyDescriptor];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NTKArgonExtractorOperation *)self operationType] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 keyDescriptor];
    uint64_t v8 = [(NTKArgonExtractorOperation *)self keyDescriptor];
    char v9 = [v7 isEqual:v8];
    if ((v9 & 1) != 0
      || ([v6 keyDescriptor],
          v3 = objc_claimAutoreleasedReturnValue(),
          [(NTKArgonExtractorOperation *)self keyDescriptor],
          v10 = objc_claimAutoreleasedReturnValue(),
          v3 == v10))
    {
      uint64_t v12 = [v6 operationType];
      BOOL v11 = v12 == [(NTKArgonExtractorOperation *)self operationType];
      v10 = v3;
      if (v9)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      BOOL v11 = 0;
    }

    goto LABEL_8;
  }
  BOOL v11 = 0;
LABEL_9:

  return v11;
}

- (NTKArgonKeyDescriptor)keyDescriptor
{
  return self->_keyDescriptor;
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (void).cxx_destruct
{
}

@end