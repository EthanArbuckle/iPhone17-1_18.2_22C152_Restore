@interface SFRequestUserReportCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFRequestUserReportCommand)initWithCoder:(id)a3;
- (SFRequestUserReportCommand)initWithProtobuf:(id)a3;
- (SFUserReportRequest)userReportRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUserReportRequest:(id)a3;
@end

@implementation SFRequestUserReportCommand

- (SFRequestUserReportCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFRequestUserReportCommand;
  v5 = [(SFRequestUserReportCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 userReportRequest];

    if (v6)
    {
      v7 = [SFUserReportRequest alloc];
      v8 = [v4 userReportRequest];
      v9 = [(SFUserReportRequest *)v7 initWithProtobuf:v8];
      [(SFRequestUserReportCommand *)v5 setUserReportRequest:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setUserReportRequest:(id)a3
{
}

- (SFUserReportRequest)userReportRequest
{
  return self->_userReportRequest;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFRequestUserReportCommand;
  unint64_t v3 = [(SFCommand *)&v7 hash];
  id v4 = [(SFRequestUserReportCommand *)self userReportRequest];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFRequestUserReportCommand *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFRequestUserReportCommand *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFRequestUserReportCommand,
             [(SFCommand *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFRequestUserReportCommand *)self userReportRequest];
    objc_super v7 = [(SFRequestUserReportCommand *)v5 userReportRequest];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFRequestUserReportCommand *)self userReportRequest];
      if (v8)
      {
        v9 = [(SFRequestUserReportCommand *)self userReportRequest];
        v10 = [(SFRequestUserReportCommand *)v5 userReportRequest];
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
  v8.super_class = (Class)SFRequestUserReportCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFRequestUserReportCommand *)self userReportRequest];
  v6 = (void *)[v5 copy];
  [v4 setUserReportRequest:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRequestUserReportCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRequestUserReportCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRequestUserReportCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRequestUserReportCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFRequestUserReportCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFRequestUserReportCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFRequestUserReportCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 userReportRequest];
    [(SFRequestUserReportCommand *)v5 setUserReportRequest:v9];

    v10 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v10];

    char v11 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v11];

    objc_super v12 = [(SFCommand *)v8 backendData];
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

@end