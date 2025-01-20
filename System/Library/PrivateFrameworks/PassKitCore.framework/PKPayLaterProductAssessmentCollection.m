@interface PKPayLaterProductAssessmentCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKPayLaterProductAssessmentCollection)initWithArray:(id)a3;
- (PKPayLaterProductAssessmentCollection)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)eligibleProductAssessments;
- (id)financingOptionWithSelectionIdentifier:(id)a3 productType:(unint64_t)a4;
- (id)ineligibleProductAssessments;
- (id)productAssessmentForProductType:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPayLaterProductAssessmentCollection

- (PKPayLaterProductAssessmentCollection)initWithArray:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKPayLaterProductAssessmentCollection;
  v5 = [(PKPayLaterProductAssessmentCollection *)&v35 init];
  v6 = v5;
  if (v5)
  {
    v30 = v5;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = v13;
            v15 = [[PKPayLaterProductAssessment alloc] initWithDictionary:v14];

            if (v15)
            {
              uint64_t v16 = [(PKPayLaterProductAssessment *)v15 productType];
              v17 = [NSNumber numberWithUnsignedInteger:v16];
              [v7 setObject:v15 forKey:v17];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      uint64_t v18 = [v7 copy];
      v6 = v30;
      productAssessments = v30->_productAssessments;
      v30->_productAssessments = (NSDictionary *)v18;
    }
    else
    {
      v6 = v30;
      productAssessments = v30->_productAssessments;
      v30->_productAssessments = 0;
    }

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v22 = [(PKPayLaterProductAssessmentCollection *)v6 productAssessmentForProductType:1];
    v23 = v22;
    if (v22)
    {
      if ([v22 isEligible]) {
        v24 = v20;
      }
      else {
        v24 = v21;
      }
      objc_msgSend(v24, "addObject:", v23, v30);
    }
    uint64_t v25 = objc_msgSend(v20, "copy", v30);
    eligibleProductAssessments = v6->_eligibleProductAssessments;
    v6->_eligibleProductAssessments = (NSArray *)v25;

    uint64_t v27 = [v21 copy];
    ineligibleProductAssessments = v6->_ineligibleProductAssessments;
    v6->_ineligibleProductAssessments = (NSArray *)v27;
  }
  return v6;
}

- (id)eligibleProductAssessments
{
  return self->_eligibleProductAssessments;
}

- (id)ineligibleProductAssessments
{
  return self->_ineligibleProductAssessments;
}

- (id)productAssessmentForProductType:(unint64_t)a3
{
  productAssessments = self->_productAssessments;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSDictionary *)productAssessments objectForKey:v4];

  return v5;
}

- (id)financingOptionWithSelectionIdentifier:(id)a3 productType:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PKPayLaterProductAssessmentCollection *)self productAssessmentForProductType:a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = objc_msgSend(v7, "financingOptions", 0);
  id v9 = (id)[v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [v12 selectionIdentifier];
        id v14 = v6;
        v15 = v14;
        if (v13 == v14)
        {

LABEL_16:
          id v9 = v12;
          goto LABEL_17;
        }
        if (v6 && v13)
        {
          char v16 = [v13 isEqualToString:v14];

          if (v16) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSDictionary *)self->_productAssessments copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterProductAssessmentCollection *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    productAssessments = self->_productAssessments;
    id v7 = v5->_productAssessments;
    if (productAssessments && v7) {
      char v8 = -[NSDictionary isEqual:](productAssessments, "isEqual:");
    }
    else {
      char v8 = productAssessments == v7;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_productAssessments];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKPayLaterProductAssessmentCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterProductAssessmentCollection;
  v5 = [(PKPayLaterProductAssessmentCollection *)&v13 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"productAssessments"];
    productAssessments = v5->_productAssessments;
    v5->_productAssessments = (NSDictionary *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"productAssessments: %@; ", self->_productAssessments];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ineligibleProductAssessments, 0);
  objc_storeStrong((id *)&self->_eligibleProductAssessments, 0);
  objc_storeStrong((id *)&self->_productAssessments, 0);
}

@end