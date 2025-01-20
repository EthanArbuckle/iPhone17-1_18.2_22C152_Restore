@interface WFFileType
+ (BOOL)supportsSecureCoding;
+ (id)fileTypeCache;
+ (id)typeForTagClass:(id)a3 tag:(id)a4;
+ (id)typeFromFileExtension:(id)a3;
+ (id)typeFromFilename:(id)a3;
+ (id)typeFromMIMEType:(id)a3;
+ (id)typeFromPasteboardType:(id)a3;
+ (id)typeWithString:(id)a3;
+ (id)typeWithUTType:(id)a3;
+ (id)typeWithUTType:(id)a3 string:(id)a4;
+ (id)typesForTagClass:(id)a3 tag:(id)a4 conformingToType:(id)a5;
+ (id)typesFromStrings:(id)a3;
+ (id)typesFromUTTypes:(id)a3;
+ (id)typesFromUTTypes:(id)a3 excludingType:(id)a4;
- (BOOL)conformsToString:(id)a3;
- (BOOL)conformsToType:(id)a3;
- (BOOL)conformsToUTType:(id)a3;
- (BOOL)conformsToUTTypes:(id)a3;
- (BOOL)isCoreType;
- (BOOL)isDeclared;
- (BOOL)isDynamic;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (BOOL)isEqualToType:(id)a3;
- (BOOL)isEqualToUTType:(id)a3;
- (NSArray)typesConformedTo;
- (NSDictionary)typeDeclaration;
- (NSString)MIMEType;
- (NSString)OSType;
- (NSString)fileExtension;
- (NSString)pboardType;
- (NSString)string;
- (NSString)typeDescription;
- (UTType)utType;
- (WFFileType)initWithCoder:(id)a3;
- (WFFileType)initWithString:(id)a3;
- (WFFileType)initWithUTType:(id)a3;
- (WFFileType)initWithUTType:(id)a3 string:(id)a4;
- (WFImage)documentIcon;
- (id)conformingTypesWithFileExtension:(id)a3;
- (id)conformingTypesWithMIMEType:(id)a3;
- (id)conformingTypesWithTagClass:(id)a3 tag:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFileType

+ (id)typeWithUTType:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [a1 fileTypeCache];
  v7 = [v6 objectForKey:v5];

  if (!v7)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithUTType:v4];
    if ([v7 isDeclared])
    {
      v8 = [a1 fileTypeCache];
      [v8 setObject:v7 forKey:v5];
    }
  }
  id v9 = v7;

  return v9;
}

+ (id)fileTypeCache
{
  if (fileTypeCache_onceToken != -1) {
    dispatch_once(&fileTypeCache_onceToken, &__block_literal_global_17163);
  }
  v2 = (void *)fileTypeCache_fileTypeCache;
  return v2;
}

- (BOOL)isDeclared
{
  v2 = [(WFFileType *)self utType];
  char v3 = [v2 isDeclared];

  return v3;
}

- (UTType)utType
{
  utType = self->_utType;
  if (!utType)
  {
    utType = self->_string;
    if (utType)
    {
      int v4 = [utType hasPrefix:@"com.apple"];
      string = self->_string;
      if (v4) {
        [MEMORY[0x1E4F442D8] _typeWithIdentifier:string allowUndeclared:1];
      }
      else {
      v6 = [MEMORY[0x1E4F442D8] typeWithIdentifier:string];
      }
      v7 = self->_utType;
      self->_utType = v6;

      utType = self->_utType;
    }
  }
  return (UTType *)utType;
}

- (WFFileType)initWithUTType:(id)a3 string:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (v7 | v8
    && (v14.receiver = self,
        v14.super_class = (Class)WFFileType,
        id v9 = [(WFFileType *)&v14 init],
        (self = v9) != 0))
  {
    objc_storeStrong((id *)&v9->_utType, a3);
    v10 = (NSString *)[(id)v8 copy];
    string = self->_string;
    self->_string = v10;

    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFFileType)initWithUTType:(id)a3
{
  return [(WFFileType *)self initWithUTType:a3 string:0];
}

uint64_t __27__WFFileType_fileTypeCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)fileTypeCache_fileTypeCache;
  fileTypeCache_fileTypeCache = v0;

  v2 = (void *)fileTypeCache_fileTypeCache;
  return [v2 setName:@"WFFileType Cache"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OSType, 0);
  objc_storeStrong((id *)&self->_pboardType, 0);
  objc_storeStrong((id *)&self->_typeDeclaration, 0);
  objc_storeStrong((id *)&self->_utType, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (NSString)OSType
{
  return self->_OSType;
}

- (NSString)pboardType
{
  return self->_pboardType;
}

- (NSDictionary)typeDeclaration
{
  return self->_typeDeclaration;
}

- (id)conformingTypesWithTagClass:(id)a3 tag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = objc_opt_class();
  id v9 = [(WFFileType *)self utType];
  v10 = [v8 typesForTagClass:v7 tag:v6 conformingToType:v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  string = self->_string;
  if (string)
  {
    v5 = NSStringFromSelector(sel_string);
    [v8 encodeObject:string forKey:v5];
  }
  utType = self->_utType;
  if (utType)
  {
    id v7 = NSStringFromSelector(sel_utType);
    [v8 encodeObject:utType forKey:v7];
  }
}

- (WFFileType)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_string);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_utType);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  v11 = [(WFFileType *)self initWithUTType:v10 string:v7];
  return v11;
}

- (NSString)MIMEType
{
  v2 = [(WFFileType *)self utType];
  char v3 = [v2 preferredMIMEType];

  return (NSString *)v3;
}

- (NSString)fileExtension
{
  if ([(WFFileType *)self isEqualToUTType:*MEMORY[0x1E4F44510]])
  {
    char v3 = @"txt";
  }
  else
  {
    id v4 = [(WFFileType *)self utType];
    char v3 = [v4 preferredFilenameExtension];
  }
  return (NSString *)v3;
}

- (NSArray)typesConformedTo
{
  v2 = [(WFFileType *)self utType];
  char v3 = [v2 supertypes];
  id v4 = [v3 allObjects];

  if ([v4 count])
  {
    uint64_t v5 = [(id)objc_opt_class() typesFromUTTypes:v4];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

- (NSString)typeDescription
{
  v2 = [(WFFileType *)self utType];
  char v3 = [v2 localizedDescription];

  return (NSString *)v3;
}

- (BOOL)isCoreType
{
  v2 = [(WFFileType *)self utType];
  char v3 = [v2 _isCoreType];

  return v3;
}

- (BOOL)isDynamic
{
  v2 = [(WFFileType *)self utType];
  char v3 = [v2 isDynamic];

  return v3;
}

- (id)conformingTypesWithMIMEType:(id)a3
{
  return [(WFFileType *)self conformingTypesWithTagClass:*MEMORY[0x1E4F442E8] tag:a3];
}

- (id)conformingTypesWithFileExtension:(id)a3
{
  return [(WFFileType *)self conformingTypesWithTagClass:*MEMORY[0x1E4F442E0] tag:a3];
}

- (BOOL)conformsToUTTypes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[WFFileType conformsToUTType:](self, "conformsToUTType:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)conformsToUTType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFFileType *)self utType];
  char v6 = [v5 conformsToType:v4];

  return v6;
}

- (BOOL)conformsToString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() typeWithString:v4];

  char v6 = [v5 utType];

  if (v6) {
    BOOL v7 = [(WFFileType *)self conformsToUTType:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)conformsToType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 utType];
    if (v5) {
      BOOL v6 = [(WFFileType *)self conformsToUTType:v5];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToUTType:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [(WFFileType *)self utType];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (BOOL)isEqualToString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFFileType *)self string];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (BOOL)isEqualToType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 utType];
    BOOL v6 = [(WFFileType *)self isEqualToUTType:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  char v3 = [(WFFileType *)self utType];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(WFFileType *)self string];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WFFileType *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(WFFileType *)v4 utType];
      BOOL v6 = [(WFFileType *)self isEqualToUTType:v5];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)string
{
  string = self->_string;
  if (string)
  {
    char v3 = string;
  }
  else
  {
    char v3 = [(UTType *)self->_utType identifier];
  }
  return v3;
}

- (WFFileType)initWithString:(id)a3
{
  return [(WFFileType *)self initWithUTType:0 string:a3];
}

+ (id)typesForTagClass:(id)a3 tag:(id)a4 conformingToType:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F442D8];
  id v9 = a5;
  v10 = [v8 typesWithTag:a4 tagClass:a3 conformingToType:v9];
  long long v11 = [a1 typesFromUTTypes:v10 excludingType:v9];

  return v11;
}

+ (id)typeForTagClass:(id)a3 tag:(id)a4
{
  if (a4)
  {
    uint64_t v5 = [MEMORY[0x1E4F442D8] typeWithTag:a4 tagClass:a3 conformingToType:0];
    if (v5)
    {
      BOOL v6 = [a1 typeWithUTType:v5];
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  return v6;
}

+ (id)typesFromStrings:(id)a3
{
  return (id)objc_msgSend(a3, "if_compactMap:", &__block_literal_global_49);
}

WFFileType *__31__WFFileType_typesFromStrings___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFFileType typeWithString:a2];
}

+ (id)typesFromUTTypes:(id)a3
{
  return (id)[a1 typesFromUTTypes:a3 excludingType:0];
}

+ (id)typesFromUTTypes:(id)a3 excludingType:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__WFFileType_typesFromUTTypes_excludingType___block_invoke;
  v10[3] = &unk_1E6079260;
  if (!a3) {
    a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v11 = v6;
  id v12 = a1;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(a3, "if_compactMap:", v10);

  return v8;
}

id __45__WFFileType_typesFromUTTypes_excludingType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqual:v3])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) typeWithUTType:v3];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)typeFromPasteboardType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Apple Web Archive pasteboard type"])
  {
    id v5 = objc_alloc((Class)a1);
    uint64_t v6 = [v5 initWithUTType:*MEMORY[0x1E4F44538] string:@"Apple Web Archive pasteboard type"];
  }
  else
  {
    uint64_t v6 = [a1 typeWithString:v4];
  }
  id v7 = (void *)v6;

  return v7;
}

+ (id)typeFromMIMEType:(id)a3
{
  return (id)[a1 typeForTagClass:*MEMORY[0x1E4F442E8] tag:a3];
}

+ (id)typeFromFileExtension:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [a1 typeForTagClass:*MEMORY[0x1E4F442E0] tag:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)typeFromFilename:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [&unk_1F0CB1DC0 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(&unk_1F0CB1DC0);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [NSString stringWithFormat:@".%@.zip", v8];
        char v10 = [v3 hasSuffix:v9];

        if (v10)
        {
          id v12 = [a1 typeFromFileExtension:v8];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [&unk_1F0CB1DC0 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v11 = [v3 pathExtension];
  id v12 = [a1 typeFromFileExtension:v11];

LABEL_11:
  return v12;
}

+ (id)typeWithUTType:(id)a3 string:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (!(v7 | v8))
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"WFFileType.m" lineNumber:64 description:@"Either a UTType or a string must be provided"];

    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    uint64_t v9 = [a1 typeWithString:v8];
    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v9 = [objc_alloc((Class)a1) initWithUTType:v7 string:v8];
  }
  else
  {
    uint64_t v9 = [a1 typeWithUTType:v7];
  }
LABEL_8:
  id v11 = (void *)v9;

  return v11;
}

+ (id)typeWithString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 fileTypeCache];
  uint64_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithString:v4];
    if ([v6 isDeclared])
    {
      unint64_t v7 = [a1 fileTypeCache];
      [v7 setObject:v6 forKey:v4];
    }
  }
  id v8 = v6;

  return v8;
}

- (WFImage)documentIcon
{
  id v3 = objc_getAssociatedObject(self, sel_documentIcon);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[WFImage documentIconImageForFileType:self];
    objc_setAssociatedObject(self, sel_documentIcon, v5, (void *)1);
  }

  return (WFImage *)v5;
}

@end