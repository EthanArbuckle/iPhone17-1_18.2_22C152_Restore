@interface PKSharingGenericMessage
+ (BOOL)supportsSecureCoding;
+ (id)_contentForGenericSharingDict:(id)a3 appleSharingDict:(id)a4 format:(unint64_t)a5;
- (BOOL)configureWithContent:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSharingGenericMessage:(id)a3;
- (NSDictionary)appleSharingDict;
- (NSDictionary)genericSharingDict;
- (PKSharingGenericMessage)initWithFormat:(unint64_t)a3 type:(unint64_t)a4 genericSharingDict:(id)a5 appleSharingDict:(id)a6;
- (PKSharingGenericMessage)initWithFormat:(unint64_t)a3 type:(unint64_t)a4 genericSharingDict:(id)a5 appleSharingDict:(id)a6 displayInformation:(id)a7;
- (PKSharingGenericMessage)initWithVertical:(unint64_t)a3 type:(unint64_t)a4 genericSharingDict:(id)a5 appleSharingDict:(id)a6;
- (id)description;
- (id)embeddedMessageURLs;
- (unint64_t)hash;
- (void)addEmbeddedMessages:(id)a3;
@end

@implementation PKSharingGenericMessage

- (PKSharingGenericMessage)initWithVertical:(unint64_t)a3 type:(unint64_t)a4 genericSharingDict:(id)a5 appleSharingDict:(id)a6
{
  if (a3 == 2)
  {
    self = [(PKSharingGenericMessage *)self initWithFormat:2 type:a4 genericSharingDict:a5 appleSharingDict:a6 displayInformation:0];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PKSharingGenericMessage)initWithFormat:(unint64_t)a3 type:(unint64_t)a4 genericSharingDict:(id)a5 appleSharingDict:(id)a6
{
  return [(PKSharingGenericMessage *)self initWithFormat:a3 type:a4 genericSharingDict:a5 appleSharingDict:a6 displayInformation:0];
}

- (PKSharingGenericMessage)initWithFormat:(unint64_t)a3 type:(unint64_t)a4 genericSharingDict:(id)a5 appleSharingDict:(id)a6 displayInformation:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  v14 = (void *)[a5 mutableCopy];
  v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v17 = v16;

  v18 = [NSNumber numberWithUnsignedInteger:a4];
  [v17 setObject:v18 forKeyedSubscript:@"sharingDataType"];

  v19 = [(id)objc_opt_class() _contentForGenericSharingDict:v17 appleSharingDict:v13 format:a3];

  v20 = [(PKSharingMessage *)self initWithContent:v19 format:a3 type:a4 displayInformation:v12];
  return v20;
}

- (BOOL)configureWithContent:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingGenericMessage;
  BOOL v5 = [(PKSharingMessage *)&v12 configureWithContent:v4];
  if (v5)
  {
    v6 = PKSharingMessageGenericDataKeyForFormat([(PKSharingMessage *)self format]);
    v7 = [v4 PKDictionaryForKey:v6];
    genericSharingDict = self->_genericSharingDict;
    self->_genericSharingDict = v7;

    v9 = [v4 PKDictionaryForKey:@"apple"];
    appleSharingDict = self->_appleSharingDict;
    self->_appleSharingDict = v9;
  }
  return v5;
}

+ (id)_contentForGenericSharingDict:(id)a3 appleSharingDict:(id)a4 format:(unint64_t)a5
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = PKSharingMessageGenericDataKeyForFormat(a5);
  v12[0] = v9;
  v12[1] = @"apple";
  v13[0] = v8;
  v13[1] = v7;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  id v7 = [(PKSharingMessage *)self identifier];
  [v6 appendFormat:@"identifier: '%@'; ", v7];

  id v8 = PKSharingMessageTypeToString([(PKSharingMessage *)self type]);
  [v6 appendFormat:@"type: '%@'; ", v8];

  v9 = PKSharingMessageFormatToString([(PKSharingMessage *)self format]);
  [v6 appendFormat:@"format: '%@'; ", v9];

  [v6 appendFormat:@"genericSharingDict: '%@'; ", self->_genericSharingDict];
  [v6 appendFormat:@"appleSharingDict: '%@'; ", self->_appleSharingDict];
  v10 = [(PKSharingMessage *)self displayInformation];
  [v6 appendFormat:@"displayInformation: '%@'; ", v10];

  [v6 appendFormat:@">"];
  v11 = [NSString stringWithString:v6];

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_genericSharingDict) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_appleSharingDict) {
    objc_msgSend(v4, "addObject:");
  }
  unint64_t v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKSharingGenericMessage *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKSharingGenericMessage *)self isEqualToSharingGenericMessage:v5];

  return v6;
}

- (BOOL)isEqualToSharingGenericMessage:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSharingGenericMessage;
  if (![(PKSharingGenericMessage *)&v13 isEqual:v4]) {
    goto LABEL_8;
  }
  genericSharingDict = self->_genericSharingDict;
  BOOL v6 = (NSDictionary *)v4[6];
  if (genericSharingDict) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[NSDictionary isEqual:](genericSharingDict, "isEqual:")) {
      goto LABEL_11;
    }
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  if (genericSharingDict != v6) {
    goto LABEL_8;
  }
LABEL_11:
  appleSharingDict = self->_appleSharingDict;
  v11 = (NSDictionary *)v4[7];
  if (appleSharingDict) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12) {
    char v8 = appleSharingDict == v11;
  }
  else {
    char v8 = -[NSDictionary isEqual:](appleSharingDict, "isEqual:");
  }
LABEL_9:

  return v8;
}

- (void)addEmbeddedMessages:(id)a3
{
  appleSharingDict = self->_appleSharingDict;
  id v5 = a3;
  BOOL v6 = (void *)[(NSDictionary *)appleSharingDict mutableCopy];
  BOOL v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v12 = v8;

  [v12 setObject:v5 forKeyedSubscript:@"embededMessages"];
  v9 = (NSDictionary *)[v12 copy];
  v10 = self->_appleSharingDict;
  self->_appleSharingDict = v9;

  v11 = objc_msgSend((id)objc_opt_class(), "_contentForGenericSharingDict:appleSharingDict:format:", self->_genericSharingDict, v12, -[PKSharingMessage format](self, "format"));
  [(PKSharingMessage *)self updateMessageContentTo:v11];
}

- (id)embeddedMessageURLs
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_appleSharingDict PKArrayContaining:objc_opt_class() forKey:@"embededMessages"];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v17 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v10 = [v9 PKURLForKey:@"address"];
          v11 = [v9 PKStringForKey:@"targetDeviceType"];
          id v12 = v11;
          if (v10) {
            BOOL v13 = v11 == 0;
          }
          else {
            BOOL v13 = 1;
          }
          if (!v13)
          {
            v14 = [NSNumber numberWithInteger:PKPassCredentialShareTargetDeviceFromString(v11)];
            [v3 setObject:v10 forKeyedSubscript:v14];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    v15 = (void *)[v3 copy];
    v2 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSDictionary)genericSharingDict
{
  return self->_genericSharingDict;
}

- (NSDictionary)appleSharingDict
{
  return self->_appleSharingDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleSharingDict, 0);
  objc_storeStrong((id *)&self->_genericSharingDict, 0);
}

@end