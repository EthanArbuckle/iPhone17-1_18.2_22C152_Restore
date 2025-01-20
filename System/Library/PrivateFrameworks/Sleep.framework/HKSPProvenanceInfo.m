@interface HKSPProvenanceInfo
+ (HKSPProvenanceInfo)unknownProvenance;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProvenanceInfo:(id)a3;
- (HKSPProvenanceInfo)initWithSource:(id)a3 presentation:(id)a4;
- (NSString)presentation;
- (NSString)source;
- (id)description;
- (unint64_t)hash;
@end

@implementation HKSPProvenanceInfo

- (HKSPProvenanceInfo)initWithSource:(id)a3 presentation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKSPProvenanceInfo;
  v9 = [(HKSPProvenanceInfo *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    objc_storeStrong((id *)&v10->_presentation, a4);
    v11 = v10;
  }

  return v10;
}

+ (HKSPProvenanceInfo)unknownProvenance
{
  v2 = [[HKSPProvenanceInfo alloc] initWithSource:@"Unknown" presentation:@"HKSPAnalyticsLaunchSourceUnknown"];
  return v2;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"[%@.%p] source %@, presentation: %@", v5, self, self->_source, self->_presentation];

  return v6;
}

- (BOOL)isEqualToProvenanceInfo:(id)a3
{
  id v4 = a3;
  v5 = [(HKSPProvenanceInfo *)self source];
  v6 = [v4 source];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [(HKSPProvenanceInfo *)self presentation];
    id v8 = [v4 presentation];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSPProvenanceInfo *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HKSPProvenanceInfo *)self isEqualToProvenanceInfo:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [(HKSPProvenanceInfo *)self source];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(HKSPProvenanceInfo *)self presentation];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)presentation
{
  return self->_presentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end