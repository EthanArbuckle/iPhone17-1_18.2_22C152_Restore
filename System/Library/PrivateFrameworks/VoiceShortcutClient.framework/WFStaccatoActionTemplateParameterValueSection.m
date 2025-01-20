@interface WFStaccatoActionTemplateParameterValueSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActionTemplateParameterValueSection:(id)a3;
- (NSArray)values;
- (NSString)subtitle;
- (NSString)title;
- (WFImage)image;
- (WFStaccatoActionTemplateParameterValueSection)initWithCoder:(id)a3;
- (WFStaccatoActionTemplateParameterValueSection)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 values:(id)a6;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation WFStaccatoActionTemplateParameterValueSection

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFStaccatoActionTemplateParameterValueSection *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(WFStaccatoActionTemplateParameterValueSection *)self subtitle];
  [v4 encodeObject:v6 forKey:@"subtitle"];

  v7 = [(WFStaccatoActionTemplateParameterValueSection *)self image];
  [v4 encodeObject:v7 forKey:@"image"];

  id v8 = [(WFStaccatoActionTemplateParameterValueSection *)self values];
  [v4 encodeObject:v8 forKey:@"values"];
}

- (NSArray)values
{
  return self->_values;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (WFImage)image
{
  return self->_image;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (WFStaccatoActionTemplateParameterValueSection)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v10 = [v8 setWithArray:v9];
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"values"];

  if (v11)
  {
    self = [(WFStaccatoActionTemplateParameterValueSection *)self initWithTitle:v5 subtitle:v6 image:v7 values:v11];
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFStaccatoActionTemplateParameterValueSection)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 values:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFStaccatoActionTemplateParameterValueSection.m", 34, @"Invalid parameter not satisfying: %@", @"values" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)WFStaccatoActionTemplateParameterValueSection;
  v15 = [(WFStaccatoActionTemplateParameterValueSection *)&v25 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    title = v15->_title;
    v15->_title = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    subtitle = v15->_subtitle;
    v15->_subtitle = (NSString *)v18;

    objc_storeStrong((id *)&v15->_image, a5);
    uint64_t v20 = [v14 copy];
    values = v15->_values;
    v15->_values = (NSArray *)v20;

    v22 = v15;
  }

  return v15;
}

- (void)setValues:(id)a3
{
}

- (void)setImage:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = [(WFStaccatoActionTemplateParameterValueSection *)self title];
  id v5 = (id)[v3 combine:v4];

  v6 = [(WFStaccatoActionTemplateParameterValueSection *)self subtitle];
  id v7 = (id)[v3 combine:v6];

  id v8 = [(WFStaccatoActionTemplateParameterValueSection *)self image];
  id v9 = (id)[v3 combine:v8];

  v10 = [(WFStaccatoActionTemplateParameterValueSection *)self values];
  id v11 = (id)[v3 combine:v10];

  unint64_t v12 = [v3 finalize];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(WFStaccatoActionTemplateParameterValueSection *)self isEqualToActionTemplateParameterValueSection:v4];

  return v5;
}

- (BOOL)isEqualToActionTemplateParameterValueSection:(id)a3
{
  id v4 = (WFStaccatoActionTemplateParameterValueSection *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    if (v4)
    {
      v6 = [(WFStaccatoActionTemplateParameterValueSection *)self title];
      id v7 = [(WFStaccatoActionTemplateParameterValueSection *)v5 title];
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        char v11 = 0;
        unint64_t v12 = v9;
        id v13 = v8;
        if (!v8 || !v9) {
          goto LABEL_33;
        }
        int v14 = [v8 isEqualToString:v9];

        if (!v14)
        {
          char v11 = 0;
LABEL_34:

          goto LABEL_35;
        }
      }
      v15 = [(WFStaccatoActionTemplateParameterValueSection *)self subtitle];
      uint64_t v16 = [(WFStaccatoActionTemplateParameterValueSection *)v5 subtitle];
      id v13 = v15;
      id v17 = v16;
      unint64_t v12 = v17;
      if (v13 == v17)
      {
      }
      else
      {
        char v11 = 0;
        uint64_t v18 = v17;
        id v19 = v13;
        if (!v13 || !v17) {
          goto LABEL_32;
        }
        int v20 = [v13 isEqualToString:v17];

        if (!v20)
        {
          char v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
      }
      v21 = [(WFStaccatoActionTemplateParameterValueSection *)self image];
      v22 = [(WFStaccatoActionTemplateParameterValueSection *)v5 image];
      id v19 = v21;
      id v23 = v22;
      v31 = v23;
      if (v19 != v23)
      {
        char v11 = 0;
        if (v19)
        {
          v24 = v23;
          id v25 = v19;
          if (v23)
          {
            int v26 = [v19 isEqual:v23];

            if (!v26)
            {
              char v11 = 0;
LABEL_31:
              uint64_t v18 = v31;
LABEL_32:

              goto LABEL_33;
            }
            goto LABEL_23;
          }
        }
        else
        {
          v24 = v23;
          id v25 = 0;
        }
LABEL_30:

        goto LABEL_31;
      }

LABEL_23:
      v27 = [(WFStaccatoActionTemplateParameterValueSection *)self values];
      v28 = [(WFStaccatoActionTemplateParameterValueSection *)v5 values];
      id v25 = v27;
      id v29 = v28;
      v24 = v29;
      if (v25 == v29)
      {
        char v11 = 1;
      }
      else
      {
        char v11 = 0;
        if (v25 && v29) {
          char v11 = [v25 isEqualToArray:v29];
        }
      }

      goto LABEL_30;
    }
    char v11 = 0;
  }
LABEL_35:

  return v11;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)WFStaccatoActionTemplateParameterValueSection;
  id v4 = [(WFStaccatoActionTemplateParameterValueSection *)&v9 description];
  BOOL v5 = [(WFStaccatoActionTemplateParameterValueSection *)self title];
  v6 = [(WFStaccatoActionTemplateParameterValueSection *)self values];
  id v7 = [v3 stringWithFormat:@"<%@: %@ [%lu values]>", v4, v5, objc_msgSend(v6, "count")];

  return v7;
}

@end