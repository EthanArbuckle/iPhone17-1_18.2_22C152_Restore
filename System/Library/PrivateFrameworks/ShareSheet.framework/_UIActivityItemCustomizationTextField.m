@interface _UIActivityItemCustomizationTextField
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)placeholder;
- (NSString)text;
- (_UIActivityItemCustomizationTextField)initWithCoder:(id)a3;
- (_UIActivityItemCustomizationTextField)initWithText:(id)a3 placeholder:(id)a4 identifier:(id)a5 footerText:(id)a6;
- (id)_handler;
- (void)_setHandler:(id)a3;
- (void)_setPlaceholder:(id)a3;
- (void)_setText:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIActivityItemCustomizationTextField

- (_UIActivityItemCustomizationTextField)initWithText:(id)a3 placeholder:(id)a4 identifier:(id)a5 footerText:(id)a6
{
  v17.receiver = self;
  v17.super_class = (Class)_UIActivityItemCustomizationTextField;
  id v9 = a4;
  id v10 = a3;
  v11 = [(_UIActivityItemCustomization *)&v17 _initWithTitle:v10 identifier:a5 footerText:a6];
  uint64_t v12 = objc_msgSend(v10, "copy", v17.receiver, v17.super_class);

  text = v11->_text;
  v11->_text = (NSString *)v12;

  uint64_t v14 = [v9 copy];
  placeholder = v11->_placeholder;
  v11->_placeholder = (NSString *)v14;

  return v11;
}

- (NSString)text
{
  return self->_text;
}

- (void)_setText:(id)a3
{
  v5 = (NSString *)a3;
  p_text = &self->_text;
  if (self->_text != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_text, a3);
    p_text = (NSString **)(*((uint64_t (**)(void))self->__handler + 2))();
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_text, v5);
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)_setPlaceholder:(id)a3
{
  v5 = (NSString *)a3;
  p_placeholder = &self->_placeholder;
  if (self->_placeholder != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_placeholder, a3);
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_placeholder, v5);
}

- (_UIActivityItemCustomizationTextField)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIActivityItemCustomizationTextField;
  v5 = [(_UIActivityItemCustomization *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholder"];
    placeholder = v5->_placeholder;
    v5->_placeholder = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIActivityItemCustomizationTextField;
  id v4 = a3;
  [(_UIActivityItemCustomization *)&v7 encodeWithCoder:v4];
  v5 = [(_UIActivityItemCustomizationTextField *)self text];
  [v4 encodeObject:v5 forKey:@"text"];

  uint64_t v6 = [(_UIActivityItemCustomizationTextField *)self placeholder];
  [v4 encodeObject:v6 forKey:@"placeholder"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIActivityItemCustomizationTextField *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v19.receiver = self;
      v19.super_class = (Class)_UIActivityItemCustomizationTextField;
      if (![(_UIActivityItemCustomization *)&v19 isEqual:v5])
      {
        char v12 = 0;
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v6 = [(_UIActivityItemCustomizationTextField *)v5 text];
      objc_super v7 = [(_UIActivityItemCustomizationTextField *)self text];
      id v8 = v6;
      id v9 = v7;
      id v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          char v12 = 0;
          objc_super v17 = v9;
          id v15 = v8;
LABEL_19:

          goto LABEL_20;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11)
        {
          char v12 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      v13 = [(_UIActivityItemCustomizationTextField *)v5 placeholder];
      uint64_t v14 = [(_UIActivityItemCustomizationTextField *)self placeholder];
      id v15 = v13;
      id v16 = v14;
      objc_super v17 = v16;
      if (v15 == v16)
      {
        char v12 = 1;
      }
      else if ((v15 == 0) == (v16 != 0))
      {
        char v12 = 0;
      }
      else
      {
        char v12 = [v15 isEqual:v16];
      }

      goto LABEL_19;
    }
    char v12 = 0;
  }
LABEL_22:

  return v12;
}

- (id)_handler
{
  return self->__handler;
}

- (void)_setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__handler, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end