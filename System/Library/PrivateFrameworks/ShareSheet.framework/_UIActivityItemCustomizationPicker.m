@interface _UIActivityItemCustomizationPicker
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)_optionTitles;
- (_UIActivityItemCustomizationPicker)initWithCoder:(id)a3;
- (_UIActivityItemCustomizationPicker)initWithIdentifier:(id)a3 optionTitles:(id)a4 selectedOptionIndex:(int64_t)a5 footerText:(id)a6;
- (id)_handler;
- (int64_t)previousSelectedOptionIndex;
- (int64_t)selectedOptionIndex;
- (void)_setHandler:(id)a3;
- (void)_setSelectedOptionIndex:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIActivityItemCustomizationPicker

- (_UIActivityItemCustomizationPicker)initWithIdentifier:(id)a3 optionTitles:(id)a4 selectedOptionIndex:(int64_t)a5 footerText:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)_UIActivityItemCustomizationPicker;
  id v9 = a4;
  v10 = [(_UIActivityItemCustomization *)&v14 _initWithTitle:0 identifier:a3 footerText:a6];
  uint64_t v11 = objc_msgSend(v9, "copy", v14.receiver, v14.super_class);

  optionTitles = v10->_optionTitles;
  v10->_optionTitles = (NSArray *)v11;

  v10->_selectedOptionIndex = a5;
  v10->_previousSelectedOptionIndex = a5;
  return v10;
}

- (int64_t)selectedOptionIndex
{
  return self->_selectedOptionIndex;
}

- (int64_t)previousSelectedOptionIndex
{
  return self->_previousSelectedOptionIndex;
}

- (void)_setSelectedOptionIndex:(int64_t)a3
{
  int64_t selectedOptionIndex = self->_selectedOptionIndex;
  if (selectedOptionIndex != a3)
  {
    self->_previousSelectedOptionIndex = selectedOptionIndex;
    self->_int64_t selectedOptionIndex = a3;
    (*((void (**)(void))self->__handler + 2))();
  }
}

- (_UIActivityItemCustomizationPicker)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIActivityItemCustomizationPicker;
  v5 = [(_UIActivityItemCustomization *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"optionTitles"];
    optionTitles = v5->_optionTitles;
    v5->_optionTitles = (NSArray *)v6;

    v5->_previousSelectedOptionIndex = [v4 decodeInt64ForKey:@"previousSelectedOptionIndex"];
    v5->_int64_t selectedOptionIndex = [v4 decodeInt64ForKey:@"selectedOptionIndex"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIActivityItemCustomizationPicker;
  id v4 = a3;
  [(_UIActivityItemCustomization *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_optionTitles, @"optionTitles", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_previousSelectedOptionIndex forKey:@"previousSelectedOptionIndex"];
  [v4 encodeInt64:self->_selectedOptionIndex forKey:@"selectedOptionIndex"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIActivityItemCustomizationPicker *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v15.receiver = self;
      v15.super_class = (Class)_UIActivityItemCustomizationPicker;
      if ([(_UIActivityItemCustomization *)&v15 isEqual:v5]
        && (uint64_t v6 = [(_UIActivityItemCustomizationPicker *)v5 previousSelectedOptionIndex],
            v6 == [(_UIActivityItemCustomizationPicker *)self previousSelectedOptionIndex])
        && (uint64_t v7 = [(_UIActivityItemCustomizationPicker *)v5 selectedOptionIndex],
            v7 == [(_UIActivityItemCustomizationPicker *)self selectedOptionIndex]))
      {
        v8 = [(_UIActivityItemCustomizationPicker *)v5 _optionTitles];
        objc_super v9 = [(_UIActivityItemCustomizationPicker *)self _optionTitles];
        id v10 = v8;
        id v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {
          char v13 = 1;
        }
        else if ((v10 == 0) == (v11 != 0))
        {
          char v13 = 0;
        }
        else
        {
          char v13 = [v10 isEqual:v11];
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (NSArray)_optionTitles
{
  return self->_optionTitles;
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
  objc_storeStrong((id *)&self->_optionTitles, 0);
}

@end