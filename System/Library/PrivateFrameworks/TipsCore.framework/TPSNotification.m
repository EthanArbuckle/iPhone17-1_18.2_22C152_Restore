@interface TPSNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationFromDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (NSString)title;
- (TPSAssets)assets;
- (TPSNotification)initWithCoder:(id)a3;
- (TPSNotification)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssets:(id)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TPSNotification

- (TPSNotification)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSNotification;
  v5 = [(TPSSerializableObject *)&v12 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 TPSSafeStringForKey:@"title"];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  uint64_t v8 = [v4 TPSSafeStringForKey:@"text"];
  text = v5->_text;
  v5->_text = (NSString *)v8;

  if ([(NSString *)v5->_title length] || [(NSString *)v5->_text length]) {
LABEL_4:
  }
    v10 = v5;
  else {
    v10 = 0;
  }

  return v10;
}

+ (id)notificationFromDictionary:(id)a3
{
  return (id)[a3 TPSSafeDictionaryForKey:@"notification"];
}

uint64_t __30__TPSNotification_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 assets];
}

uint64_t __30__TPSNotification_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 text];
}

uint64_t __30__TPSNotification_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 title];
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

id __30__TPSNotification_na_identity__block_invoke()
{
  if (TPSNotificationAssetsKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSNotificationAssetsKey_block_invoke_na_once_token_0, &__block_literal_global_26);
  }
  v0 = (void *)TPSNotificationAssetsKey_block_invoke_na_once_object_0;
  return v0;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TPSNotification;
  id v4 = a3;
  [(TPSSerializableObject *)&v8 encodeWithCoder:v4];
  v5 = [(TPSNotification *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  uint64_t v6 = [(TPSNotification *)self text];
  [v4 encodeObject:v6 forKey:@"text"];

  v7 = [(TPSNotification *)self assets];
  [v4 encodeObject:v7 forKey:@"assets"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPSNotification;
  id v4 = [(TPSSerializableObject *)&v9 copyWithZone:a3];
  v5 = [(TPSNotification *)self title];
  [v4 setTitle:v5];

  uint64_t v6 = [(TPSNotification *)self text];
  [v4 setText:v6];

  v7 = [(TPSNotification *)self assets];
  [v4 setAssets:v7];

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)text
{
  return self->_text;
}

- (TPSAssets)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (TPSNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSNotification;
  v5 = [(TPSSerializableObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assets"];
    assets = v5->_assets;
    v5->_assets = (TPSAssets *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __30__TPSNotification_na_identity__block_invoke_2()
{
  uint64_t v0 = __30__TPSNotification_na_identity__block_invoke_3();
  uint64_t v1 = TPSNotificationAssetsKey_block_invoke_na_once_object_0;
  TPSNotificationAssetsKey_block_invoke_na_once_object_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __30__TPSNotification_na_identity__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_33];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_35_0];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_38];
  id v4 = [v0 build];

  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v14.receiver = self;
  v14.super_class = (Class)TPSNotification;
  id v4 = [(TPSSerializableObject *)&v14 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSNotification *)self title];

  if (v6)
  {
    v7 = [(TPSNotification *)self title];
    [v5 appendFormat:@"\n  %@ = %@", @"title", v7];
  }
  uint64_t v8 = [(TPSNotification *)self text];

  if (v8)
  {
    objc_super v9 = [(TPSNotification *)self text];
    [v5 appendFormat:@"\n  %@ = %@", @"text", v9];
  }
  uint64_t v10 = [(TPSNotification *)self assets];

  if (v10)
  {
    v11 = [(TPSNotification *)self assets];
    objc_super v12 = [v11 debugDescription];
    [v5 appendFormat:@"\n  %@ = %@", @"assets", v12];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

@end