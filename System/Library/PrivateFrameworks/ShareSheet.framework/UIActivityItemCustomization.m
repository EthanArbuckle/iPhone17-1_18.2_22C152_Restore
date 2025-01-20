@interface UIActivityItemCustomization
+ (id)actionCustomizationWithTitle:(id)a3 identifier:(id)a4 handler:(id)a5;
+ (id)pickerCustomizationWithTitle:(id)a3 identifier:(id)a4 options:(id)a5 selectedOptionIndex:(int64_t)a6 valueChangedHandler:(id)a7;
+ (id)switchCustomizationWithTitle:(id)a3 identifier:(id)a4 value:(BOOL)a5 valueChangedHandler:(id)a6;
- (BOOL)enabled;
- (NSString)identifier;
- (NSString)title;
- (id)_initWithTitle:(id)a3 identifier:(id)a4;
- (void)setEnabled:(BOOL)a3;
@end

@implementation UIActivityItemCustomization

+ (id)switchCustomizationWithTitle:(id)a3 identifier:(id)a4 value:(BOOL)a5 valueChangedHandler:(id)a6
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[UIActivityItemCustomization alloc] _initWithTitle:v8 identifier:v7];

  return v9;
}

+ (id)pickerCustomizationWithTitle:(id)a3 identifier:(id)a4 options:(id)a5 selectedOptionIndex:(int64_t)a6 valueChangedHandler:(id)a7
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [[UIActivityItemCustomization alloc] _initWithTitle:v9 identifier:v8];

  return v10;
}

+ (id)actionCustomizationWithTitle:(id)a3 identifier:(id)a4 handler:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[UIActivityItemCustomization alloc] _initWithTitle:v7 identifier:v6];

  return v8;
}

- (id)_initWithTitle:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UIActivityItemCustomization;
  id v8 = [(UIActivityItemCustomization *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v11;

    v8->_enabled = 1;
    v13 = v8;
  }

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end