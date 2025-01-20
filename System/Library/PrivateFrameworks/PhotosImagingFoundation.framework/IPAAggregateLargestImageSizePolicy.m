@interface IPAAggregateLargestImageSizePolicy
- (BOOL)isBestFitPolicy;
- (BOOL)isEqual:(id)a3;
- (CGSize)transformSize:(CGSize)a3;
- (IPAAggregateLargestImageSizePolicy)initWithCoder:(id)a3;
- (IPAAggregateLargestImageSizePolicy)initWithPolicies:(id)a3;
- (double)transformScaleForSize:(CGSize)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IPAAggregateLargestImageSizePolicy

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  return [(NSArray *)self->_policies hash];
}

- (BOOL)isEqual:(id)a3
{
  return [(NSArray *)self->_policies isEqualToArray:*((void *)a3 + 1)];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IPAAggregateLargestImageSizePolicy;
  id v4 = a3;
  [(IPAImageSizePolicy *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_policies, @"policies", v5.receiver, v5.super_class);
}

- (IPAAggregateLargestImageSizePolicy)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IPAAggregateLargestImageSizePolicy;
  id v3 = a3;
  id v4 = [(IPAImageSizePolicy *)&v8 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectForKey:", @"policies", v8.receiver, v8.super_class);

  policies = v4->_policies;
  v4->_policies = (NSArray *)v5;

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> %@", objc_opt_class(), self, self->_policies];
}

- (double)transformScaleForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3.width < 0.0 || a3.height < 0.0)
  {
    NSStringFromSize(a3);
    objc_claimAutoreleasedReturnValue();
    _PFAssertFailHandler();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_policies;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "transformScaleForSize:", width, height);
        if (v11 > v9) {
          double v9 = v11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (CGSize)transformSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3.width < 0.0 || a3.height < 0.0)
  {
    NSStringFromSize(a3);
    objc_claimAutoreleasedReturnValue();
    _PFAssertFailHandler();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_policies;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "transformSize:", width, height);
        if (v13 * v14 > v10)
        {
          double v9 = v14;
          double v10 = v13 * v14;
          double v11 = v13;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
    double v11 = 0.0;
  }

  double v15 = v11;
  double v16 = v9;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (BOOL)isBestFitPolicy
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_policies;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isBestFitPolicy", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (IPAAggregateLargestImageSizePolicy)initWithPolicies:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    v12.receiver = self;
    v12.super_class = (Class)IPAAggregateLargestImageSizePolicy;
    uint64_t v6 = [(IPAAggregateLargestImageSizePolicy *)&v12 init];
    BOOL v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_policies, a3);
    }

    return v7;
  }
  else
  {
    long long v9 = (void *)_PFAssertFailHandler();
    return (IPAAggregateLargestImageSizePolicy *)+[IPAImageSizePolicy bestFitPolicyWithEvenWidthTotalPixelCount:v11];
  }
}

@end