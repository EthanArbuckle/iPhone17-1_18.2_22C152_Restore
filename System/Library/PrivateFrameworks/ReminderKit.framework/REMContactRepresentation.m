@interface REMContactRepresentation
+ (BOOL)supportsSecureCoding;
+ (id)representationFromData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesContactRepresentation:(id)a3;
- (NSArray)emails;
- (NSArray)phones;
- (REMContactRepresentation)initWithCoder:(id)a3;
- (REMContactRepresentation)initWithPhones:(id)a3 emails:(id)a4;
- (id)archivedData;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEmails:(id)a3;
- (void)setPhones:(id)a3;
@end

@implementation REMContactRepresentation

- (REMContactRepresentation)initWithPhones:(id)a3 emails:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMContactRepresentation;
  v8 = [(REMContactRepresentation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    phones = v8->_phones;
    v8->_phones = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    emails = v8->_emails;
    v8->_emails = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REMContactRepresentation *)a3;
  v5 = v4;
  if (v4 != self)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(REMContactRepresentation *)self phones];
      uint64_t v8 = [(REMContactRepresentation *)v6 phones];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        uint64_t v9 = (void *)v8;
        v10 = [(REMContactRepresentation *)self phones];
        uint64_t v11 = [(REMContactRepresentation *)v6 phones];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      objc_super v14 = [(REMContactRepresentation *)self emails];
      uint64_t v15 = [(REMContactRepresentation *)v6 emails];
      if (v14 == (void *)v15)
      {
        char v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMContactRepresentation *)self emails];
        v18 = [(REMContactRepresentation *)v6 emails];
        char v13 = [v17 isEqual:v18];
      }
      goto LABEL_12;
    }
LABEL_5:
    char v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v13 = 1;
LABEL_13:

  return v13;
}

- (BOOL)matchesContactRepresentation:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [(REMContactRepresentation *)self phones];
  id v7 = [v5 setWithArray:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = [v4 phones];
  v10 = [v8 setWithArray:v9];

  if ([v7 intersectsSet:v10])
  {
    BOOL v11 = 1;
  }
  else
  {
    int v12 = (void *)MEMORY[0x1E4F1CAD0];
    char v13 = [(REMContactRepresentation *)self emails];
    objc_super v14 = [v12 setWithArray:v13];

    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    v16 = [v4 emails];
    v17 = [v15 setWithArray:v16];

    if ([v14 intersectsSet:v17])
    {
      BOOL v11 = 1;
    }
    else
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v18 = v7;
      uint64_t v31 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v31)
      {
        uint64_t v19 = *(void *)v41;
        v34 = v17;
        v35 = v7;
        v33 = v18;
        uint64_t v30 = *(void *)v41;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v41 != v19) {
              objc_enumerationMutation(v18);
            }
            uint64_t v32 = v20;
            v21 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:*(void *)(*((void *)&v40 + 1) + 8 * v20)];
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            id v22 = v10;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v37;
              while (2)
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v37 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:*(void *)(*((void *)&v36 + 1) + 8 * i)];
                  char v28 = [v21 isLikePhoneNumber:v27];

                  if (v28)
                  {

                    BOOL v11 = 1;
                    v17 = v34;
                    id v7 = v35;
                    id v18 = v33;
                    goto LABEL_23;
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
            }

            uint64_t v20 = v32 + 1;
            v17 = v34;
            id v7 = v35;
            id v18 = v33;
            uint64_t v19 = v30;
          }
          while (v32 + 1 != v31);
          BOOL v11 = 0;
          uint64_t v31 = [v33 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v31);
      }
      else
      {
        BOOL v11 = 0;
      }
LABEL_23:
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(REMContactRepresentation *)self phones];
  uint64_t v4 = [v3 hash];
  v5 = [(REMContactRepresentation *)self emails];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMContactRepresentation *)self phones];
  uint64_t v6 = [v5 count];
  id v7 = [(REMContactRepresentation *)self emails];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p phones.count=%ld emails.count=%ld>", v4, self, v6, objc_msgSend(v7, "count")];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMContactRepresentation *)self phones];
  [v4 encodeObject:v5 forKey:@"phones"];

  id v6 = [(REMContactRepresentation *)self emails];
  [v4 encodeObject:v6 forKey:@"emails"];
}

- (REMContactRepresentation)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"phones"];
  uint64_t v9 = [v5 decodeObjectOfClasses:v7 forKey:@"emails"];

  v10 = [(REMContactRepresentation *)self initWithPhones:v8 emails:v9];
  return v10;
}

- (id)archivedData
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

+ (id)representationFromData:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  id v10 = 0;
  id v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v10];

  id v6 = v10;
  if (v6)
  {
    id v7 = +[REMLogStore utility];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[REMContactRepresentation representationFromData:](v6, v7);
    }

    id v8 = 0;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (NSArray)phones
{
  return self->_phones;
}

- (void)setPhones:(id)a3
{
}

- (NSArray)emails
{
  return self->_emails;
}

- (void)setEmails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emails, 0);

  objc_storeStrong((id *)&self->_phones, 0);
}

+ (void)representationFromData:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Unable to unarchive data to create REMContactRepresentation: %@", (uint8_t *)&v4, 0xCu);
}

@end