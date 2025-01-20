@interface REMGrocerySuggestedSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)sectionCanonicalName;
- (REMGrocerySuggestedSection)initWithCoder:(id)a3;
- (REMGrocerySuggestedSection)initWithLabelIndex:(int64_t)a3 sectionCanonicalName:(id)a4 confidenceScore:(float)a5;
- (float)confidenceScore;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)labelIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMGrocerySuggestedSection

- (REMGrocerySuggestedSection)initWithLabelIndex:(int64_t)a3 sectionCanonicalName:(id)a4 confidenceScore:(float)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)REMGrocerySuggestedSection;
  v10 = [(REMGrocerySuggestedSection *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_labelIndex = a3;
    objc_storeStrong((id *)&v10->_sectionCanonicalName, a4);
    v11->_confidenceScore = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    uint64_t v5 = objc_opt_class();
    v6 = REMDynamicCast(v5, (uint64_t)v4);

    int64_t v7 = [(REMGrocerySuggestedSection *)self labelIndex];
    if (v7 == [v6 labelIndex])
    {
      v8 = [(REMGrocerySuggestedSection *)self sectionCanonicalName];
      uint64_t v9 = [v6 sectionCanonicalName];
      if (v8 == (void *)v9)
      {
      }
      else
      {
        v10 = (void *)v9;
        v11 = [(REMGrocerySuggestedSection *)self sectionCanonicalName];
        v12 = [v6 sectionCanonicalName];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_5;
        }
      }
      [(REMGrocerySuggestedSection *)self confidenceScore];
      float v16 = v15;
      [v6 confidenceScore];
      BOOL v14 = vabds_f32(v16, v17) <= 0.00000011921;
      goto LABEL_9;
    }
LABEL_5:
    BOOL v14 = 0;
LABEL_9:

    return v14;
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(REMGrocerySuggestedSection *)self labelIndex];
  v6 = [(REMGrocerySuggestedSection *)self sectionCanonicalName];
  [(REMGrocerySuggestedSection *)self confidenceScore];
  int64_t v7 = objc_msgSend(v4, "initWithLabelIndex:sectionCanonicalName:confidenceScore:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[REMGrocerySuggestedSection labelIndex](self, "labelIndex"), @"labelIndex");
  id v4 = [(REMGrocerySuggestedSection *)self sectionCanonicalName];
  [v5 encodeObject:v4 forKey:@"sectionCanonicalName"];

  [(REMGrocerySuggestedSection *)self confidenceScore];
  objc_msgSend(v5, "encodeFloat:forKey:", @"confidenceScore");
}

- (REMGrocerySuggestedSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMGrocerySuggestedSection;
  id v5 = [(REMGrocerySuggestedSection *)&v10 init];
  if (v5)
  {
    v5->_labelIndex = (int)[v4 decodeIntForKey:@"labelIndex"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionCanonicalName"];
    sectionCanonicalName = v5->_sectionCanonicalName;
    v5->_sectionCanonicalName = (NSString *)v6;

    [v4 decodeFloatForKey:@"confidenceScore"];
    v5->_confidenceScore = v8;
  }

  return v5;
}

- (int64_t)labelIndex
{
  return self->_labelIndex;
}

- (NSString)sectionCanonicalName
{
  return self->_sectionCanonicalName;
}

- (float)confidenceScore
{
  return self->_confidenceScore;
}

- (void).cxx_destruct
{
}

@end