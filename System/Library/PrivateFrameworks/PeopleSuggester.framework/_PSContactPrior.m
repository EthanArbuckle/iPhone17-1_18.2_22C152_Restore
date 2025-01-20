@interface _PSContactPrior
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (NSString)contactIdentifier;
- (NSString)modelName;
- (NSString)modelVersion;
- (_PSContactPrior)initWithCoder:(id)a3;
- (_PSContactPrior)initWithContactIdentifier:(id)a3 priorScore:(float)a4 rank:(unsigned int)a5 modelName:(id)a6 modelVersion:(id)a7;
- (float)priorScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)rank;
- (void)encodeWithCoder:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setPriorScore:(float)a3;
- (void)setRank:(unsigned int)a3;
@end

@implementation _PSContactPrior

- (_PSContactPrior)initWithContactIdentifier:(id)a3 priorScore:(float)a4 rank:(unsigned int)a5 modelName:(id)a6 modelVersion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)_PSContactPrior;
  v15 = [(_PSContactPrior *)&v24 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    contactIdentifier = v15->_contactIdentifier;
    v15->_contactIdentifier = (NSString *)v16;

    contact = v15->_contact;
    v15->_contact = 0;

    v15->_priorScore = a4;
    v15->_rank = a5;
    uint64_t v19 = [v13 copy];
    modelName = v15->_modelName;
    v15->_modelName = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    modelVersion = v15->_modelVersion;
    v15->_modelVersion = (NSString *)v21;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_PSContactPrior *)self contactIdentifier];
  v6 = NSStringFromSelector(sel_contactIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  [(_PSContactPrior *)self priorScore];
  int v8 = v7;
  v9 = NSStringFromSelector(sel_priorScore);
  LODWORD(v10) = v8;
  [v4 encodeFloat:v9 forKey:v10];

  uint64_t v11 = [(_PSContactPrior *)self rank];
  id v12 = NSStringFromSelector(sel_rank);
  [v4 encodeInt32:v11 forKey:v12];

  id v13 = [(_PSContactPrior *)self modelName];
  id v14 = NSStringFromSelector(sel_modelName);
  [v4 encodeObject:v13 forKey:v14];

  id v16 = [(_PSContactPrior *)self modelVersion];
  v15 = NSStringFromSelector(sel_modelVersion);
  [v4 encodeObject:v16 forKey:v15];
}

- (_PSContactPrior)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_contactIdentifier);
  int v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  int v8 = NSStringFromSelector(sel_priorScore);
  [v4 decodeFloatForKey:v8];
  int v10 = v9;

  uint64_t v11 = NSStringFromSelector(sel_rank);
  uint64_t v12 = [v4 decodeInt32ForKey:v11];

  uint64_t v13 = objc_opt_class();
  id v14 = NSStringFromSelector(sel_modelName);
  v15 = [v4 decodeObjectOfClass:v13 forKey:v14];

  uint64_t v16 = objc_opt_class();
  v17 = NSStringFromSelector(sel_modelVersion);
  v18 = [v4 decodeObjectOfClass:v16 forKey:v17];

  LODWORD(v19) = v10;
  v20 = [(_PSContactPrior *)self initWithContactIdentifier:v7 priorScore:v12 rank:v15 modelName:v18 modelVersion:v19];

  return v20;
}

- (unint64_t)hash
{
  return [(NSString *)self->_contactIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_PSContactPrior *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v20 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        uint64_t v7 = [(_PSContactPrior *)self contactIdentifier];
        if (v7)
        {
          int v8 = (void *)v7;
          uint64_t v9 = [(_PSContactPrior *)self modelName];
          if (!v9)
          {
            BOOL v20 = 0;
LABEL_24:

            goto LABEL_25;
          }
          int v10 = (void *)v9;
          uint64_t v11 = [(_PSContactPrior *)self modelVersion];
          if (!v11) {
            goto LABEL_18;
          }
          uint64_t v12 = (void *)v11;
          uint64_t v13 = [(_PSContactPrior *)v6 contactIdentifier];
          if (!v13)
          {
            BOOL v20 = 0;
LABEL_22:

            goto LABEL_23;
          }
          id v14 = (void *)v13;
          uint64_t v15 = [(_PSContactPrior *)v6 modelName];
          if (!v15) {
            goto LABEL_20;
          }
          uint64_t v16 = (void *)v15;
          v17 = [(_PSContactPrior *)v6 modelVersion];

          if (v17)
          {
            int v8 = [(_PSContactPrior *)self contactIdentifier];
            int v10 = [(_PSContactPrior *)v6 contactIdentifier];
            if ([v8 isEqualToString:v10])
            {
              uint64_t v12 = [(_PSContactPrior *)self modelName];
              id v14 = [(_PSContactPrior *)v6 modelName];
              if ([v12 isEqualToString:v14])
              {
                v18 = [(_PSContactPrior *)self modelVersion];
                double v19 = [(_PSContactPrior *)v6 modelVersion];
                if ([v18 isEqualToString:v19]) {
                  BOOL v20 = self->_rank == v6->_rank;
                }
                else {
                  BOOL v20 = 0;
                }

                goto LABEL_21;
              }
LABEL_20:
              BOOL v20 = 0;
LABEL_21:

              goto LABEL_22;
            }
LABEL_18:
            BOOL v20 = 0;
LABEL_23:

            goto LABEL_24;
          }
        }
        BOOL v20 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    BOOL v20 = 0;
  }
LABEL_26:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_PSContactPrior allocWithZone:a3] init];
  uint64_t v5 = [(_PSContactPrior *)self contactIdentifier];
  [(_PSContactPrior *)v4 setContactIdentifier:v5];

  [(_PSContactPrior *)self priorScore];
  -[_PSContactPrior setPriorScore:](v4, "setPriorScore:");
  [(_PSContactPrior *)v4 setRank:[(_PSContactPrior *)self rank]];
  v6 = [(_PSContactPrior *)self modelName];
  [(_PSContactPrior *)v4 setModelName:v6];

  uint64_t v7 = [(_PSContactPrior *)self modelVersion];
  [(_PSContactPrior *)v4 setModelVersion:v7];

  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(_PSContactPrior *)self contactIdentifier];
  v6 = [(_PSContactPrior *)self contact];
  [(_PSContactPrior *)self priorScore];
  double v8 = v7;
  uint64_t v9 = [(_PSContactPrior *)self rank];
  int v10 = [(_PSContactPrior *)self modelName];
  uint64_t v11 = [(_PSContactPrior *)self modelVersion];
  uint64_t v12 = [v3 stringWithFormat:@"<%@ %p> contactIdentifier: %@, contact: %@, priorScore: %f, rank: %d, modelName: %@, modelVersion: %@", v4, self, v5, v6, *(void *)&v8, v9, v10, v11];

  return v12;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (float)priorScore
{
  return self->_priorScore;
}

- (void)setPriorScore:(float)a3
{
  self->_priorScore = a3;
}

- (unsigned)rank
{
  return self->_rank;
}

- (void)setRank:(unsigned int)a3
{
  self->_rank = a3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end