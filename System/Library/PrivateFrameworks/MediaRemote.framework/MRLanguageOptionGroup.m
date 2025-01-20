@interface MRLanguageOptionGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsEmptySelection;
- (BOOL)hasAllowsEmptySelection;
- (BOOL)isEqual:(id)a3;
- (MRLanguageOption)defaultLanguageOption;
- (MRLanguageOptionGroup)initWithCoder:(id)a3;
- (MRLanguageOptionGroup)initWithData:(id)a3;
- (MRLanguageOptionGroup)initWithLanguageOptions:(id)a3 defaultLanguageOption:(id)a4 allowsEmptySelection:(BOOL)a5;
- (MRLanguageOptionGroup)initWithProtobuf:(id)a3;
- (NSArray)languageOptions;
- (NSData)data;
- (NSDictionary)dictionaryRepresentation;
- (_MRLanguageOptionGroupProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsEmptySelection:(BOOL)a3;
- (void)setDefaultLanguageOption:(id)a3;
- (void)setHasAllowsEmptySelection:(BOOL)a3;
- (void)setLanguageOptions:(id)a3;
@end

@implementation MRLanguageOptionGroup

- (MRLanguageOptionGroup)initWithLanguageOptions:(id)a3 defaultLanguageOption:(id)a4 allowsEmptySelection:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRLanguageOptionGroup;
  v10 = [(MRLanguageOptionGroup *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    languageOptions = v10->_languageOptions;
    v10->_languageOptions = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_defaultLanguageOption, a4);
    v10->_allowsEmptySelection = a5;
    v10->_hasAllowsEmptySelection = 1;
  }

  return v10;
}

- (MRLanguageOptionGroup)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)MRLanguageOptionGroup;
    v5 = [(MRLanguageOptionGroup *)&v15 init];
    if (v5)
    {
      v5->_allowsEmptySelection = [v4 allowEmptySelection];
      v5->_hasAllowsEmptySelection = [v4 hasAllowEmptySelection];
      if ([v4 hasDefaultLanguageOption])
      {
        v6 = [MRLanguageOption alloc];
        v7 = [v4 defaultLanguageOption];
        uint64_t v8 = [(MRLanguageOption *)v6 initWithProtobuf:v7];
        defaultLanguageOption = v5->_defaultLanguageOption;
        v5->_defaultLanguageOption = (MRLanguageOption *)v8;
      }
      v10 = [v4 languageOptions];
      uint64_t v11 = objc_msgSend(v10, "mr_map:", &__block_literal_global_105);
      languageOptions = v5->_languageOptions;
      v5->_languageOptions = (NSArray *)v11;
    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

MRLanguageOption *__42__MRLanguageOptionGroup_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRLanguageOption alloc] initWithProtobuf:v2];

  return v3;
}

- (MRLanguageOptionGroup)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_MRLanguageOptionGroupProtobuf alloc] initWithData:v4];

    self = [(MRLanguageOptionGroup *)self initWithProtobuf:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_MRLanguageOptionGroupProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRLanguageOptionGroupProtobuf);
  id v4 = [(MRLanguageOptionGroup *)self defaultLanguageOption];
  v5 = [v4 protobuf];
  [(_MRLanguageOptionGroupProtobuf *)v3 setDefaultLanguageOption:v5];

  v6 = [(MRLanguageOptionGroup *)self languageOptions];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(MRLanguageOptionGroup *)self languageOptions];
    id v9 = objc_msgSend(v8, "mr_map:", &__block_literal_global_11_1);
    v10 = (void *)[v9 mutableCopy];
    [(_MRLanguageOptionGroupProtobuf *)v3 setLanguageOptions:v10];
  }
  [(_MRLanguageOptionGroupProtobuf *)v3 setAllowEmptySelection:[(MRLanguageOptionGroup *)self allowsEmptySelection]];
  [(_MRLanguageOptionGroupProtobuf *)v3 setHasAllowEmptySelection:[(MRLanguageOptionGroup *)self hasAllowsEmptySelection]];

  return v3;
}

uint64_t __33__MRLanguageOptionGroup_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

- (NSData)data
{
  id v2 = [(MRLanguageOptionGroup *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(MRLanguageOptionGroup *)self hasAllowsEmptySelection])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MRLanguageOptionGroup allowsEmptySelection](self, "allowsEmptySelection"));
    [v3 setObject:v4 forKeyedSubscript:@"allowsEmptySelection"];
  }
  v5 = [(MRLanguageOptionGroup *)self languageOptions];
  v6 = objc_msgSend(v5, "mr_map:", &__block_literal_global_18_1);
  [v3 setObject:v6 forKeyedSubscript:@"languageOptions"];

  uint64_t v7 = [(MRLanguageOptionGroup *)self defaultLanguageOption];
  uint64_t v8 = [v7 dictionaryRepresentation];
  [v3 setObject:v8 forKeyedSubscript:@"defaultLanguageOption"];

  return (NSDictionary *)v3;
}

uint64_t __49__MRLanguageOptionGroup_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (void)setAllowsEmptySelection:(BOOL)a3
{
  self->_allowsEmptySelection = a3;
  self->_hasAllowsEmptySelection = 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRLanguageOptionGroup *)a3;
  if (v4 == self)
  {
    char v13 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  BOOL v5 = [(MRLanguageOptionGroup *)v4 hasAllowsEmptySelection];
  if (v5 != [(MRLanguageOptionGroup *)self hasAllowsEmptySelection]) {
    goto LABEL_9;
  }
  if ([(MRLanguageOptionGroup *)v4 hasAllowsEmptySelection])
  {
    if ([(MRLanguageOptionGroup *)self hasAllowsEmptySelection])
    {
      BOOL v6 = [(MRLanguageOptionGroup *)v4 allowsEmptySelection];
      if (v6 != [(MRLanguageOptionGroup *)self allowsEmptySelection]) {
        goto LABEL_9;
      }
    }
  }
  uint64_t v7 = [(MRLanguageOptionGroup *)v4 languageOptions];
  uint64_t v8 = [(MRLanguageOptionGroup *)self languageOptions];
  if (v7 == (void *)v8)
  {
  }
  else
  {
    id v9 = (void *)v8;
    v10 = [(MRLanguageOptionGroup *)v4 languageOptions];
    uint64_t v11 = [(MRLanguageOptionGroup *)self languageOptions];
    int v12 = [v10 isEqual:v11];

    if (!v12)
    {
LABEL_9:
      char v13 = 0;
      goto LABEL_11;
    }
  }
  objc_super v15 = [(MRLanguageOptionGroup *)v4 defaultLanguageOption];
  uint64_t v16 = [(MRLanguageOptionGroup *)self defaultLanguageOption];
  if (v15 == (void *)v16)
  {
    char v13 = 1;
    v17 = v15;
  }
  else
  {
    v17 = (void *)v16;
    v18 = [(MRLanguageOptionGroup *)v4 defaultLanguageOption];
    v19 = [(MRLanguageOptionGroup *)self defaultLanguageOption];
    char v13 = [v18 isEqual:v19];
  }
LABEL_11:

  return v13;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(MRLanguageOptionGroup *)self dictionaryRepresentation];
  BOOL v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(MRLanguageOptionGroup *)self hasAllowsEmptySelection]) {
    objc_msgSend(v5, "setAllowsEmptySelection:", -[MRLanguageOptionGroup allowsEmptySelection](self, "allowsEmptySelection"));
  }
  BOOL v6 = [(MRLanguageOptionGroup *)self defaultLanguageOption];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setDefaultLanguageOption:v7];

  uint64_t v8 = [(MRLanguageOptionGroup *)self languageOptions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__MRLanguageOptionGroup_copyWithZone___block_invoke;
  v11[3] = &__block_descriptor_40_e26__16__0__MRLanguageOption_8l;
  v11[4] = a3;
  id v9 = objc_msgSend(v8, "mr_map:", v11);
  [v5 setLanguageOptions:v9];

  return v5;
}

id __38__MRLanguageOptionGroup_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copyWithZone:*(void *)(a1 + 32)];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if ([v9 allowsKeyedCoding])
  {
    objc_msgSend(v9, "encodeBool:forKey:", -[MRLanguageOptionGroup allowsEmptySelection](self, "allowsEmptySelection"), @"kMRLanguageOptionAllowEmptySelection");
    uint64_t v4 = [(MRLanguageOptionGroup *)self defaultLanguageOption];
    BOOL v5 = [v4 protobuf];
    [v9 encodeObject:v5 forKey:@"kMRLanguageOptionDefaultSelection"];

    BOOL v6 = [(MRLanguageOptionGroup *)self languageOptions];
    uint64_t v7 = objc_msgSend(v6, "mr_map:", &__block_literal_global_30_1);
    [v9 encodeObject:v7 forKey:@"kMRLanguageOptions"];

    uint64_t v8 = [(MRLanguageOptionGroup *)self protobuf];
    [v9 encodeObject:v8 forKey:@"protobuf"];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"coder must support key-value coding"];
  }
}

uint64_t __41__MRLanguageOptionGroup_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

- (MRLanguageOptionGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRLanguageOptionGroup;
  BOOL v5 = [(MRLanguageOptionGroup *)&v16 init];
  if (!v5) {
    goto LABEL_10;
  }
  if (![v4 allowsKeyedCoding])
  {
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:38];
    [v4 failWithError:v6];
LABEL_9:

LABEL_10:
    char v13 = v5;
    goto LABEL_14;
  }
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[MRLanguageOptionGroup setAllowsEmptySelection:](v5, "setAllowsEmptySelection:", [v4 decodeBoolForKey:@"kMRLanguageOptionAllowEmptySelection"]);
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMRLanguageOptionDefaultSelection"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        uint64_t v7 = 0;
      }
      uint64_t v8 = [[MRLanguageOption alloc] initWithProtobuf:v7];
      [(MRLanguageOptionGroup *)v5 setDefaultLanguageOption:v8];

      id v9 = MSVPropertyListDataClasses();
      v10 = [v9 setByAddingObject:objc_opt_class()];
      uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kMRLanguageOptions"];
      int v12 = objc_msgSend(v11, "mr_map:", &__block_literal_global_40_0);
      [(MRLanguageOptionGroup *)v5 setLanguageOptions:v12];

      goto LABEL_9;
    }
  }
  objc_super v14 = _MRLogForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[MRLanguageOption initWithCoder:]((uint64_t)v6, v14);
  }

  char v13 = 0;
LABEL_14:

  return v13;
}

MRLanguageOption *__39__MRLanguageOptionGroup_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MRLanguageOption alloc] initWithProtobuf:v2];

  return v3;
}

- (BOOL)allowsEmptySelection
{
  return self->_allowsEmptySelection;
}

- (BOOL)hasAllowsEmptySelection
{
  return self->_hasAllowsEmptySelection;
}

- (void)setHasAllowsEmptySelection:(BOOL)a3
{
  self->_hasAllowsEmptySelection = a3;
}

- (NSArray)languageOptions
{
  return self->_languageOptions;
}

- (void)setLanguageOptions:(id)a3
{
}

- (MRLanguageOption)defaultLanguageOption
{
  return self->_defaultLanguageOption;
}

- (void)setDefaultLanguageOption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultLanguageOption, 0);

  objc_storeStrong((id *)&self->_languageOptions, 0);
}

@end