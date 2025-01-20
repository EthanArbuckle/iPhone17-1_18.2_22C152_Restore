@interface WFContextualCallDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INPerson)person;
- (NSString)handle;
- (WFContextualCallDescriptor)initWithCoder:(id)a3;
- (WFContextualCallDescriptor)initWithHandle:(id)a3 callType:(unint64_t)a4 person:(id)a5 callTypeSerializedRepresentation:(id)a6 personSerializedRepresentation:(id)a7;
- (WFPropertyListObject)callTypeSerializedRepresentation;
- (WFPropertyListObject)personSerializedRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)callType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContextualCallDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_callTypeSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (WFPropertyListObject)personSerializedRepresentation
{
  return self->_personSerializedRepresentation;
}

- (INPerson)person
{
  return self->_person;
}

- (WFPropertyListObject)callTypeSerializedRepresentation
{
  return self->_callTypeSerializedRepresentation;
}

- (unint64_t)callType
{
  return self->_callType;
}

- (NSString)handle
{
  return self->_handle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(WFContextualCallDescriptor *)self handle];
  unint64_t v6 = [(WFContextualCallDescriptor *)self callType];
  v7 = [(WFContextualCallDescriptor *)self person];
  v8 = [(WFContextualCallDescriptor *)self callTypeSerializedRepresentation];
  v9 = [(WFContextualCallDescriptor *)self personSerializedRepresentation];
  v10 = (void *)[v4 initWithHandle:v5 callType:v6 person:v7 callTypeSerializedRepresentation:v8 personSerializedRepresentation:v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFContextualCallDescriptor *)self handle];
  [v4 encodeObject:v5 forKey:@"handle"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFContextualCallDescriptor callType](self, "callType"), @"callType");
  unint64_t v6 = [(WFContextualCallDescriptor *)self callTypeSerializedRepresentation];
  [v4 encodeObject:v6 forKey:@"callTypeSerializedRepresentation"];

  v7 = [(WFContextualCallDescriptor *)self person];
  [v4 encodeObject:v7 forKey:@"person"];

  id v8 = [(WFContextualCallDescriptor *)self personSerializedRepresentation];
  [v4 encodeObject:v8 forKey:@"personSerializedRepresentation"];
}

- (WFContextualCallDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
  if (v5)
  {
    uint64_t v25 = [v4 decodeIntegerForKey:@"callType"];
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v24 = [v4 decodeObjectOfClasses:v12 forKey:@"callTypeSerializedRepresentation"];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"person"];
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
    v21 = [v4 decodeObjectOfClasses:v20 forKey:@"personSerializedRepresentation"];

    self = [(WFContextualCallDescriptor *)self initWithHandle:v5 callType:v25 person:v13 callTypeSerializedRepresentation:v24 personSerializedRepresentation:v21];
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = [(WFContextualCallDescriptor *)self handle];
  id v5 = (id)[v3 combineContentsOfPropertyListObject:v4];

  id v6 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualCallDescriptor callType](self, "callType"));
  uint64_t v7 = [(WFContextualCallDescriptor *)self callTypeSerializedRepresentation];
  id v8 = (id)[v3 combineContentsOfPropertyListObject:v7];

  uint64_t v9 = [(WFContextualCallDescriptor *)self person];
  id v10 = (id)[v3 combineContentsOfPropertyListObject:v9];

  uint64_t v11 = [(WFContextualCallDescriptor *)self personSerializedRepresentation];
  id v12 = (id)[v3 combineContentsOfPropertyListObject:v11];

  unint64_t v13 = [v3 finalize];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFContextualCallDescriptor *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFContextualCallDescriptor *)self handle];
      id v6 = [(WFContextualCallDescriptor *)v4 handle];
      id v7 = v5;
      id v8 = v6;
      uint64_t v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        char v10 = 0;
        uint64_t v11 = v8;
        id v12 = v7;
        if (!v7 || !v8) {
          goto LABEL_35;
        }
        int v13 = [v7 isEqualToString:v8];

        if (!v13) {
          goto LABEL_17;
        }
      }
      unint64_t v14 = [(WFContextualCallDescriptor *)self callType];
      if (v14 != [(WFContextualCallDescriptor *)v4 callType])
      {
LABEL_17:
        char v10 = 0;
LABEL_36:

        goto LABEL_37;
      }
      uint64_t v15 = [(WFContextualCallDescriptor *)self callTypeSerializedRepresentation];
      uint64_t v16 = [(WFContextualCallDescriptor *)v4 callTypeSerializedRepresentation];
      id v12 = v15;
      id v17 = v16;
      uint64_t v11 = v17;
      if (v12 == v17)
      {
      }
      else
      {
        char v10 = 0;
        uint64_t v18 = v17;
        id v19 = v12;
        if (!v12 || !v17) {
          goto LABEL_34;
        }
        int v20 = [v12 isEqual:v17];

        if (!v20)
        {
          char v10 = 0;
LABEL_35:

          goto LABEL_36;
        }
      }
      v21 = [(WFContextualCallDescriptor *)self person];
      v22 = [(WFContextualCallDescriptor *)v4 person];
      id v19 = v21;
      id v23 = v22;
      v31 = v23;
      if (v19 != v23)
      {
        char v10 = 0;
        if (v19)
        {
          v24 = v23;
          id v25 = v19;
          if (v23)
          {
            int v26 = [v19 isEqual:v23];

            if (!v26)
            {
              char v10 = 0;
LABEL_33:
              uint64_t v18 = v31;
LABEL_34:

              goto LABEL_35;
            }
            goto LABEL_25;
          }
        }
        else
        {
          v24 = v23;
          id v25 = 0;
        }
LABEL_32:

        goto LABEL_33;
      }

LABEL_25:
      v27 = [(WFContextualCallDescriptor *)self personSerializedRepresentation];
      v28 = [(WFContextualCallDescriptor *)v4 personSerializedRepresentation];
      id v25 = v27;
      id v29 = v28;
      v24 = v29;
      if (v25 == v29)
      {
        char v10 = 1;
      }
      else
      {
        char v10 = 0;
        if (v25 && v29) {
          char v10 = [v25 isEqual:v29];
        }
      }

      goto LABEL_32;
    }
    char v10 = 0;
  }
LABEL_37:

  return v10;
}

- (WFContextualCallDescriptor)initWithHandle:(id)a3 callType:(unint64_t)a4 person:(id)a5 callTypeSerializedRepresentation:(id)a6 personSerializedRepresentation:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFContextualCallDescriptor.m", 17, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)WFContextualCallDescriptor;
  id v17 = [(WFContextualCallDescriptor *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    handle = v17->_handle;
    v17->_handle = (NSString *)v18;

    v17->_callType = a4;
    objc_storeStrong((id *)&v17->_callTypeSerializedRepresentation, a6);
    uint64_t v20 = [v14 copy];
    person = v17->_person;
    v17->_person = (INPerson *)v20;

    objc_storeStrong((id *)&v17->_personSerializedRepresentation, a7);
    v22 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end