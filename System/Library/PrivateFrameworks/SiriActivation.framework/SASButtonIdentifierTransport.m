@interface SASButtonIdentifierTransport
+ (BOOL)supportsSecureCoding;
- (BOOL)_identifierMatchesSiriButtonIdentifier:(int64_t)a3;
- (NSString)identifier;
- (SASButtonIdentifierTransport)initWithCoder:(id)a3;
- (SASButtonIdentifierTransport)initWithSiriButtonIdentifier:(int64_t)a3;
- (SASButtonIdentifierTransport)initWithString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)siriButtonIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)siriButtonIdentifier;
@end

@implementation SASButtonIdentifierTransport

- (SASButtonIdentifierTransport)initWithSiriButtonIdentifier:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SASButtonIdentifierTransport;
  v4 = [(SASButtonIdentifierTransport *)&v7 init];
  if (v4)
  {
    v5 = [NSString stringWithSiriButtonIdentifier:a3];
    [(SASButtonIdentifierTransport *)v4 setIdentifier:v5];
  }
  return v4;
}

- (SASButtonIdentifierTransport)initWithString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASButtonIdentifierTransport;
  v5 = [(SASButtonIdentifierTransport *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SASButtonIdentifierTransport *)v5 setIdentifier:v4];
  }

  return v6;
}

- (id)description
{
  v2 = NSString;
  v3 = [(SASButtonIdentifierTransport *)self identifier];
  id v4 = [v2 stringWithFormat:@"SASButtonIdentifierTransport:%@", v3];

  return v4;
}

- (BOOL)_identifierMatchesSiriButtonIdentifier:(int64_t)a3
{
  id v4 = [(SASButtonIdentifierTransport *)self identifier];
  v5 = [NSString stringWithSiriButtonIdentifier:a3];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (int64_t)siriButtonIdentifier
{
  int64_t v3 = 1;
  if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:1])
  {
    int64_t v3 = 2;
    if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:2])
    {
      int64_t v3 = 3;
      if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:3])
      {
        int64_t v3 = 4;
        if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:4])
        {
          int64_t v3 = 5;
          if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:5])
          {
            int64_t v3 = 6;
            if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:6])
            {
              int64_t v3 = 7;
              if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:7])
              {
                int64_t v3 = 100;
                if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:100])
                {
                  int64_t v3 = 101;
                  if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:101])
                  {
                    int64_t v3 = 200;
                    if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:200])
                    {
                      int64_t v3 = 201;
                      if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:201])
                      {
                        int64_t v3 = 8;
                        if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:8])
                        {
                          int64_t v3 = 9;
                          if (![(SASButtonIdentifierTransport *)self _identifierMatchesSiriButtonIdentifier:9])
                          {
                            id v4 = (void *)*MEMORY[0x1E4F4E360];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
                              [(SASButtonIdentifierTransport *)v4 siriButtonIdentifier];
                            }
                            return 200;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(SASButtonIdentifierTransport *)self siriButtonIdentifier];
  return (id)[v4 initWithSiriButtonIdentifier:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASButtonIdentifierTransport)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASButtonIdentifierTransport;
  int64_t v5 = [(SASButtonIdentifierTransport *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SASButtonIdentifierTransport *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)siriButtonIdentifier
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int64_t v3 = a1;
  id v4 = [a2 identifier];
  int v5 = 136315394;
  uint64_t v6 = "-[SASButtonIdentifierTransport siriButtonIdentifier]";
  __int16 v7 = 2112;
  objc_super v8 = v4;
  _os_log_error_impl(&dword_1D9588000, v3, OS_LOG_TYPE_ERROR, "%s ERROR: attempted to create SiriButtonIdentifier from '%@'.", (uint8_t *)&v5, 0x16u);
}

@end