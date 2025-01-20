@interface WTContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)attributedText;
- (NSUUID)uuid;
- (WTContext)initWithAttributedText:(id)a3 range:(_NSRange)a4;
- (WTContext)initWithCoder:(id)a3;
- (WTContext)initWithXPCDictionary:(id)a3;
- (WTSmartReplyConfiguration)smartReplyConfig;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSmartReplyConfig:(id)a3;
@end

@implementation WTContext

- (WTContext)initWithAttributedText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WTContext;
  v8 = [(WTContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F08C38] UUID];
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v9;

    uint64_t v11 = [v7 copy];
    attributedText = v8->_attributedText;
    v8->_attributedText = (NSAttributedString *)v11;

    v8->_range.NSUInteger location = location;
    v8->_range.NSUInteger length = length;
  }

  return v8;
}

- (void)setAttributedText:(id)a3
{
}

- (unint64_t)hash
{
  v3 = [(WTContext *)self uuid];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = 257 * ([(WTContext *)self range] + 257 * v4);
  [(WTContext *)self range];
  return v5 + v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WTContext *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [(WTContext *)self uuid];
    id v7 = [(WTContext *)v5 uuid];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = [(WTContext *)self range];
      uint64_t v10 = v9;
      BOOL v13 = v8 == [(WTContext *)v5 range] && v10 == v11;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(WTContext *)self uuid];
    id v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(WTContext *)self attributedText];
    uint64_t v9 = [v8 copyWithZone:a3];
    uint64_t v10 = (void *)v5[2];
    v5[2] = v9;

    v5[4] = [(WTContext *)self range];
    v5[5] = v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(WTContext *)self uuid];
  [v13 encodeObject:v4 forKey:@"WTContextCodingKeyUUID"];

  uint64_t v5 = objc_alloc_init(WTBSCompatibleAttributedString);
  uint64_t v6 = [(WTContext *)self attributedText];
  [(WTBSCompatibleAttributedString *)v5 setAttributedString:v6];

  [v13 encodeObject:v5 forKey:@"WTContextCodingKeyAttributedText"];
  id v7 = (void *)MEMORY[0x263F08D40];
  uint64_t v8 = [(WTContext *)self range];
  uint64_t v10 = objc_msgSend(v7, "valueWithRange:", v8, v9);
  [v13 encodeObject:v10 forKey:@"WTContextCodingKeyRange"];

  uint64_t v11 = [(WTContext *)self smartReplyConfig];

  if (v11)
  {
    v12 = [(WTContext *)self smartReplyConfig];
    [v13 encodeObject:v12 forKey:@"WTContextCodingKeySmartReplyConfiguration"];
  }
}

- (WTContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WTContext;
  uint64_t v5 = [(WTContext *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTContextCodingKeyUUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTContextCodingKeyAttributedText"];
    uint64_t v9 = [v8 attributedString];
    attributedText = v5->_attributedText;
    v5->_attributedText = (NSAttributedString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTContextCodingKeyRange"];
    v5->_range.NSUInteger location = [v11 rangeValue];
    v5->_range.NSUInteger length = v12;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTContextCodingKeySmartReplyConfiguration"];
    smartReplyConfig = v5->_smartReplyConfig;
    v5->_smartReplyConfig = (WTSmartReplyConfiguration *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3 = a3;
  [@"WTContextKey" UTF8String];
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
}

- (WTContext)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  [@"WTContextKey" UTF8String];
  BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  uint64_t v5 = (WTContext *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (WTSmartReplyConfiguration)smartReplyConfig
{
  return self->_smartReplyConfig;
}

- (void)setSmartReplyConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartReplyConfig, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end