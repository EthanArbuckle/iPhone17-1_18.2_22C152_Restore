@interface SFFlightCheckinCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPlaceHolderProperty;
- (BOOL)isEqual:(id)a3;
- (BOOL)placeHolderProperty;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFFlightCheckinCommand)initWithCoder:(id)a3;
- (SFFlightCheckinCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPlaceHolderProperty:(BOOL)a3;
@end

@implementation SFFlightCheckinCommand

- (SFFlightCheckinCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFFlightCheckinCommand;
  v5 = [(SFFlightCheckinCommand *)&v8 init];
  if (v5)
  {
    if ([v4 placeHolderProperty]) {
      -[SFFlightCheckinCommand setPlaceHolderProperty:](v5, "setPlaceHolderProperty:", [v4 placeHolderProperty]);
    }
    v6 = v5;
  }

  return v5;
}

- (BOOL)placeHolderProperty
{
  return self->_placeHolderProperty;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)SFFlightCheckinCommand;
  unint64_t v3 = [(SFCommand *)&v5 hash];
  return v3 ^ [(SFFlightCheckinCommand *)self placeHolderProperty];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFFlightCheckinCommand *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if ([(SFFlightCheckinCommand *)v4 isMemberOfClass:objc_opt_class()] {
         && (v10.receiver = self,
  }
             v10.super_class = (Class)SFFlightCheckinCommand,
             [(SFCommand *)&v10 isEqual:v4]))
  {
    objc_super v5 = v4;
    BOOL v6 = [(SFFlightCheckinCommand *)self placeHolderProperty];
    BOOL v7 = [(SFFlightCheckinCommand *)v5 placeHolderProperty];

    char v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFFlightCheckinCommand;
  id v4 = [(SFCommand *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setPlaceHolderProperty:", -[SFFlightCheckinCommand placeHolderProperty](self, "placeHolderProperty"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBFlightCheckinCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBFlightCheckinCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBFlightCheckinCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBFlightCheckinCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFFlightCheckinCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFFlightCheckinCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SFFlightCheckinCommand *)self init];
  objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  BOOL v7 = [[_SFPBCommand alloc] initWithData:v6];
  char v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SFFlightCheckinCommand *)v5 setPlaceHolderProperty:[(SFCommand *)v8 placeHolderProperty]];
    v9 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v9];

    objc_super v10 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v10];

    v11 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v11];

    v12 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v12];
  }
  return v5;
}

- (BOOL)hasPlaceHolderProperty
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPlaceHolderProperty:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_placeHolderProperty = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end