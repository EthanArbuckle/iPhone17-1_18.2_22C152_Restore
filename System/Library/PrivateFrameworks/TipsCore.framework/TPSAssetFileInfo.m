@interface TPSAssetFileInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (TPSAssetFileInfo)initWithCoder:(id)a3;
- (TPSAssetFileInfo)initWithDictionary:(id)a3;
- (TPSSize)size;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)scale;
- (int64_t)userInterface;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setScale:(int64_t)a3;
- (void)setSize:(id)a3;
- (void)setUserInterface:(int64_t)a3;
@end

@implementation TPSAssetFileInfo

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSAssetFileInfo;
  id v4 = a3;
  [(TPSSerializableObject *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSAssetFileInfo scale](self, "scale", v7.receiver, v7.super_class), @"scale");
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSAssetFileInfo userInterface](self, "userInterface"), @"userInterface");
  v5 = [(TPSAssetFileInfo *)self identifier];
  [v4 encodeObject:v5 forKey:@"fileId"];

  v6 = [(TPSAssetFileInfo *)self size];
  [v4 encodeObject:v6 forKey:@"size"];
}

- (int64_t)userInterface
{
  return self->_userInterface;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (TPSSize)size
{
  return self->_size;
}

- (int64_t)scale
{
  return self->_scale;
}

- (TPSAssetFileInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSAssetFileInfo;
  v5 = [(TPSSerializableObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_scale = [v4 decodeIntegerForKey:@"scale"];
    v5->_userInterface = [v4 decodeIntegerForKey:@"userInterface"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileId"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    size = v5->_size;
    v5->_size = (TPSSize *)v8;
  }
  return v5;
}

- (TPSAssetFileInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAssetFileInfo;
  v5 = [(TPSSerializableObject *)&v15 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 TPSSafeStringForKey:@"fileId"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    if (![(NSString *)v5->_identifier length])
    {
      v13 = 0;
      goto LABEL_8;
    }
    uint64_t v8 = [v4 TPSSafeIntegerForKey:@"scale"];
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8) {
      uint64_t v9 = v8;
    }
    v5->_scale = v9;
    v10 = [v4 TPSSafeStringForKey:@"userInterface"];
    v5->_userInterface = [v10 isEqualToString:@"dark"];
    objc_super v11 = [[TPSSize alloc] initWithDictionary:v4];
    size = v5->_size;
    v5->_size = v11;
  }
  v13 = v5;
LABEL_8:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TPSAssetFileInfo;
  id v4 = [(TPSSerializableObject *)&v8 copyWithZone:a3];
  objc_msgSend(v4, "setScale:", -[TPSAssetFileInfo scale](self, "scale"));
  objc_msgSend(v4, "setUserInterface:", -[TPSAssetFileInfo userInterface](self, "userInterface"));
  v5 = [(TPSAssetFileInfo *)self identifier];
  [v4 setIdentifier:v5];

  uint64_t v6 = [(TPSAssetFileInfo *)self size];
  [v4 setSize:v6];

  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v11.receiver = self;
  v11.super_class = (Class)TPSAssetFileInfo;
  id v4 = [(TPSSerializableObject *)&v11 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSAssetFileInfo *)self identifier];
  [v5 appendFormat:@"\n  %@ = %@", @"fileId", v6];

  [v5 appendFormat:@"\n  %@ = %ld", @"userInterface", -[TPSAssetFileInfo userInterface](self, "userInterface")];
  [v5 appendFormat:@"\n  %@ = %ld", @"scale", -[TPSAssetFileInfo scale](self, "scale")];
  objc_super v7 = [(TPSAssetFileInfo *)self size];

  if (v7)
  {
    objc_super v8 = [(TPSAssetFileInfo *)self size];
    uint64_t v9 = [v8 debugDescription];
    [v5 appendFormat:@"\n  %@ = %@", @"size", v9];
  }
  return v5;
}

id __31__TPSAssetFileInfo_na_identity__block_invoke()
{
  if (TPSAssetFileSizeKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSAssetFileSizeKey_block_invoke_na_once_token_0, &__block_literal_global_29_0);
  }
  v0 = (void *)TPSAssetFileSizeKey_block_invoke_na_once_object_0;
  return v0;
}

uint64_t __31__TPSAssetFileInfo_na_identity__block_invoke_2()
{
  uint64_t v0 = __31__TPSAssetFileInfo_na_identity__block_invoke_3();
  uint64_t v1 = TPSAssetFileSizeKey_block_invoke_na_once_object_0;
  TPSAssetFileSizeKey_block_invoke_na_once_object_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __31__TPSAssetFileInfo_na_identity__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_36];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_39];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_42_0];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_45];
  v5 = [v0 build];

  return v5;
}

uint64_t __31__TPSAssetFileInfo_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __31__TPSAssetFileInfo_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 scale];
  return [v2 numberWithInteger:v3];
}

uint64_t __31__TPSAssetFileInfo_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 userInterface];
  return [v2 numberWithInteger:v3];
}

uint64_t __31__TPSAssetFileInfo_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 size];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (void)setScale:(int64_t)a3
{
  self->_scale = a3;
}

- (void)setUserInterface:(int64_t)a3
{
  self->_userInterface = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setSize:(id)a3
{
}

@end