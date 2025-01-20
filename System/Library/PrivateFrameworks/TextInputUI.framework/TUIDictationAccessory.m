@interface TUIDictationAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)languages;
- (TUIDictationAccessory)initWithCoder:(id)a3;
- (TUIDictationAccessory)initWithLanguages:(id)a3 actionHandler:(id)a4;
- (id)additionalComponents;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLanguages:(id)a3;
@end

@implementation TUIDictationAccessory

- (void).cxx_destruct
{
}

- (void)setLanguages:(id)a3
{
}

- (NSArray)languages
{
  return self->_languages;
}

- (unint64_t)hash
{
  return 257 * [(NSArray *)self->_languages hash];
}

- (id)additionalComponents
{
  v6.receiver = self;
  v6.super_class = (Class)TUIDictationAccessory;
  v3 = [(TUICursorAccessory *)&v6 additionalComponents];
  if (self->_languages)
  {
    v4 = [NSString stringWithFormat:@"languages = %@", self->_languages];
    [v3 addObject:v4];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TUIDictationAccessory *)a3;
  v5 = v4;
  if (v4) {
    BOOL v6 = self == v4 || [(NSArray *)self->_languages isEqualToArray:v4->_languages];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUIDictationAccessory;
  id v4 = a3;
  [(TUICursorAccessory *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_languages, @"TUILanguagesCodingKey", v5.receiver, v5.super_class);
}

- (TUIDictationAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIDictationAccessory;
  objc_super v5 = [(TUICursorAccessory *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"TUILanguagesCodingKey"];
    languages = v5->_languages;
    v5->_languages = (NSArray *)v6;
  }
  return v5;
}

- (TUIDictationAccessory)initWithLanguages:(id)a3 actionHandler:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIDictationAccessory;
  v8 = [(TUICursorAccessory *)&v11 initWithIdentifier:0 actionHandler:a4];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_languages, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end