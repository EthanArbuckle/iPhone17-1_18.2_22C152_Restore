@interface SFInvokeSiriCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)utteranceText;
- (SFInvokeSiriCommand)initWithCoder:(id)a3;
- (SFInvokeSiriCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUtteranceText:(id)a3;
@end

@implementation SFInvokeSiriCommand

- (void).cxx_destruct
{
}

- (void)setUtteranceText:(id)a3
{
}

- (NSString)utteranceText
{
  return self->_utteranceText;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFInvokeSiriCommand;
  unint64_t v3 = [(SFCommand *)&v7 hash];
  v4 = [(SFInvokeSiriCommand *)self utteranceText];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFInvokeSiriCommand *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFInvokeSiriCommand *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFInvokeSiriCommand,
             [(SFCommand *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFInvokeSiriCommand *)self utteranceText];
    objc_super v7 = [(SFInvokeSiriCommand *)v5 utteranceText];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFInvokeSiriCommand *)self utteranceText];
      if (v8)
      {
        v9 = [(SFInvokeSiriCommand *)self utteranceText];
        v10 = [(SFInvokeSiriCommand *)v5 utteranceText];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 1;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFInvokeSiriCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFInvokeSiriCommand *)self utteranceText];
  v6 = (void *)[v5 copy];
  [v4 setUtteranceText:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBInvokeSiriCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBInvokeSiriCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBInvokeSiriCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBInvokeSiriCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFInvokeSiriCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFInvokeSiriCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFInvokeSiriCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 utteranceText];
    [(SFInvokeSiriCommand *)v5 setUtteranceText:v9];

    v10 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v10];

    char v11 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v11];

    v12 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v12];

    objc_super v13 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v13];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFInvokeSiriCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFInvokeSiriCommand;
  unint64_t v5 = [(SFInvokeSiriCommand *)&v10 init];
  if (v5)
  {
    v6 = [v4 utteranceText];

    if (v6)
    {
      objc_super v7 = [v4 utteranceText];
      [(SFInvokeSiriCommand *)v5 setUtteranceText:v7];
    }
    objc_super v8 = v5;
  }

  return v5;
}

@end