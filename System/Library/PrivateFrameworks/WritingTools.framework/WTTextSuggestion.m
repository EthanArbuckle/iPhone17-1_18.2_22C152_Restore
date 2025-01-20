@interface WTTextSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)replacement;
- (NSString)suggestionCategory;
- (NSString)suggestionDescription;
- (NSString)suggestionShortDescription;
- (NSUUID)uuid;
- (WTTextSuggestion)initWithCoder:(id)a3;
- (WTTextSuggestion)initWithOriginalRange:(_NSRange)a3 replacement:(id)a4;
- (WTTextSuggestion)initWithOriginalRange:(_NSRange)a3 replacement:(id)a4 suggestionCategory:(id)a5 suggestionShortDescription:(id)a6 suggestionDescription:(id)a7;
- (WTTextSuggestion)initWithOriginalRange:(_NSRange)a3 replacement:(id)a4 suggestionDescription:(id)a5;
- (WTTextSuggestion)initWithXPCDictionary:(id)a3;
- (_NSRange)originalRange;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation WTTextSuggestion

- (WTTextSuggestion)initWithOriginalRange:(_NSRange)a3 replacement:(id)a4 suggestionCategory:(id)a5 suggestionShortDescription:(id)a6 suggestionDescription:(id)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)WTTextSuggestion;
  v17 = [(WTTextSuggestion *)&v29 init];
  if (v17)
  {
    v18 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    uuid = v17->_uuid;
    v17->_uuid = v18;

    v17->_originalRange.NSUInteger location = location;
    v17->_originalRange.NSUInteger length = length;
    uint64_t v20 = [v13 copy];
    replacement = v17->_replacement;
    v17->_replacement = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    suggestionCategory = v17->_suggestionCategory;
    v17->_suggestionCategory = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    suggestionShortDescription = v17->_suggestionShortDescription;
    v17->_suggestionShortDescription = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    suggestionDescription = v17->_suggestionDescription;
    v17->_suggestionDescription = (NSString *)v26;

    v17->_state = 0;
  }

  return v17;
}

- (WTTextSuggestion)initWithOriginalRange:(_NSRange)a3 replacement:(id)a4 suggestionDescription:(id)a5
{
  return -[WTTextSuggestion initWithOriginalRange:replacement:suggestionCategory:suggestionShortDescription:suggestionDescription:](self, "initWithOriginalRange:replacement:suggestionCategory:suggestionShortDescription:suggestionDescription:", a3.location, a3.length, a4, 0, 0, a5);
}

- (WTTextSuggestion)initWithOriginalRange:(_NSRange)a3 replacement:(id)a4
{
  return -[WTTextSuggestion initWithOriginalRange:replacement:suggestionCategory:suggestionShortDescription:suggestionDescription:](self, "initWithOriginalRange:replacement:suggestionCategory:suggestionShortDescription:suggestionDescription:", a3.location, a3.length, a4, 0, 0, 0);
}

- (unint64_t)hash
{
  v3 = [(WTTextSuggestion *)self uuid];
  uint64_t v4 = [v3 hash];

  return [(WTTextSuggestion *)self state] + 257 * v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WTTextSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(WTTextSuggestion *)self uuid];
    v7 = [(WTTextSuggestion *)v5 uuid];
    if ([v6 isEqual:v7])
    {
      int64_t v8 = [(WTTextSuggestion *)self state];
      BOOL v9 = v8 == [(WTTextSuggestion *)v5 state];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3 = a3;
  [@"WTTextSuggestionKey" UTF8String];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
}

- (WTTextSuggestion)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  [@"WTTextSuggestionKey" UTF8String];
  BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  v5 = (WTTextSuggestion *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  id v4 = [(WTTextSuggestion *)self uuid];
  [v13 encodeObject:v4 forKey:@"WTSessionCodingKeyUUID"];

  v5 = (void *)MEMORY[0x263F08D40];
  uint64_t v6 = [(WTTextSuggestion *)self originalRange];
  int64_t v8 = objc_msgSend(v5, "valueWithRange:", v6, v7);
  [v13 encodeObject:v8 forKey:@"WTSessionCodingKeyOriginalRange"];

  BOOL v9 = [(WTTextSuggestion *)self replacement];
  [v13 encodeObject:v9 forKey:@"WTSessionCodingKeyReplacement"];

  v10 = [(WTTextSuggestion *)self suggestionCategory];
  [v13 encodeObject:v10 forKey:@"WTSessionCodingKeySuggestionCategory"];

  v11 = [(WTTextSuggestion *)self suggestionShortDescription];
  [v13 encodeObject:v11 forKey:@"WTSessionCodingKeySuggestionShortDescription"];

  v12 = [(WTTextSuggestion *)self suggestionDescription];
  [v13 encodeObject:v12 forKey:@"WTSessionCodingKeySuggestionDescription"];

  objc_msgSend(v13, "encodeInt64:forKey:", -[WTTextSuggestion state](self, "state"), @"WTSessionCodingKeyState");
}

- (WTTextSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WTTextSuggestion *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTSessionCodingKeyUUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTSessionCodingKeyOriginalRange"];
    v5->_originalRange.NSUInteger location = [v8 rangeValue];
    v5->_originalRange.NSUInteger length = v9;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTSessionCodingKeyReplacement"];
    replacement = v5->_replacement;
    v5->_replacement = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTSessionCodingKeySuggestionCategory"];
    suggestionCategory = v5->_suggestionCategory;
    v5->_suggestionCategory = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTSessionCodingKeySuggestionShortDescription"];
    suggestionShortDescription = v5->_suggestionShortDescription;
    v5->_suggestionShortDescription = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTSessionCodingKeySuggestionDescription"];
    suggestionDescription = v5->_suggestionDescription;
    v5->_suggestionDescription = (NSString *)v16;

    v5->_state = [v4 decodeInt64ForKey:@"WTSessionCodingKeyState"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (_NSRange)originalRange
{
  NSUInteger length = self->_originalRange.length;
  NSUInteger location = self->_originalRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)replacement
{
  return self->_replacement;
}

- (NSString)suggestionCategory
{
  return self->_suggestionCategory;
}

- (NSString)suggestionShortDescription
{
  return self->_suggestionShortDescription;
}

- (NSString)suggestionDescription
{
  return self->_suggestionDescription;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionDescription, 0);
  objc_storeStrong((id *)&self->_suggestionShortDescription, 0);
  objc_storeStrong((id *)&self->_suggestionCategory, 0);
  objc_storeStrong((id *)&self->_replacement, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end