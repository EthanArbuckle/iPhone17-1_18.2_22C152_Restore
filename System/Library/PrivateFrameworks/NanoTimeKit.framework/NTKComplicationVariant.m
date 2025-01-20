@interface NTKComplicationVariant
+ (BOOL)supportsSecureCoding;
+ (id)defaultVariantForFamily:(int64_t)a3 device:(id)a4;
+ (id)variantWithFamily:(int64_t)a3 metrics:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NTKComplicationMetrics)metrics;
- (NTKComplicationVariant)initWithCoder:(id)a3;
- (int64_t)family;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKComplicationVariant

+ (id)variantWithFamily:(int64_t)a3 metrics:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  v7 = (void *)v6;
  if (v6)
  {
    *(void *)(v6 + 8) = a3;
    uint64_t v8 = [v5 copy];
    v9 = (void *)v7[2];
    v7[2] = v8;
  }

  return v7;
}

+ (id)defaultVariantForFamily:(int64_t)a3 device:(id)a4
{
  uint64_t v6 = +[NTKComplicationMetrics defaultMetricsForFamily:a3 device:a4];
  v7 = [a1 variantWithFamily:a3 metrics:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t family = self->_family;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __34__NTKComplicationVariant_isEqual___block_invoke;
  v18[3] = &unk_1E62C24A0;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendInteger:family counterpart:v18];
  metrics = self->_metrics;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __34__NTKComplicationVariant_isEqual___block_invoke_2;
  v16 = &unk_1E62C2690;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:metrics counterpart:&v13];
  LOBYTE(metrics) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)metrics;
}

uint64_t __34__NTKComplicationVariant_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8);
}

id __34__NTKComplicationVariant_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_family];
  id v5 = (id)[v3 appendObject:self->_metrics];
  unint64_t v6 = [v3 hash];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationVariant)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"family"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metrics"];

  id v7 = +[NTKComplicationVariant variantWithFamily:v5 metrics:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t family = self->_family;
  id v5 = a3;
  [v5 encodeInteger:family forKey:@"family"];
  [v5 encodeObject:self->_metrics forKey:@"metrics"];
}

- (int64_t)family
{
  return self->_family;
}

- (NTKComplicationMetrics)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
}

@end