@interface SFCreateCalendarEventCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFCalendarEvent)event;
- (SFCreateCalendarEventCommand)initWithCoder:(id)a3;
- (SFCreateCalendarEventCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEvent:(id)a3;
@end

@implementation SFCreateCalendarEventCommand

- (SFCreateCalendarEventCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCreateCalendarEventCommand;
  v5 = [(SFCreateCalendarEventCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 event];

    if (v6)
    {
      v7 = [SFCalendarEvent alloc];
      v8 = [v4 event];
      v9 = [(SFCalendarEvent *)v7 initWithProtobuf:v8];
      [(SFCreateCalendarEventCommand *)v5 setEvent:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setEvent:(id)a3
{
}

- (SFCalendarEvent)event
{
  return self->_event;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFCreateCalendarEventCommand;
  unint64_t v3 = [(SFCommand *)&v7 hash];
  id v4 = [(SFCreateCalendarEventCommand *)self event];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFCreateCalendarEventCommand *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFCreateCalendarEventCommand *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFCreateCalendarEventCommand,
             [(SFCommand *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFCreateCalendarEventCommand *)self event];
    objc_super v7 = [(SFCreateCalendarEventCommand *)v5 event];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFCreateCalendarEventCommand *)self event];
      if (v8)
      {
        v9 = [(SFCreateCalendarEventCommand *)self event];
        v10 = [(SFCreateCalendarEventCommand *)v5 event];
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
  v8.super_class = (Class)SFCreateCalendarEventCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFCreateCalendarEventCommand *)self event];
  v6 = (void *)[v5 copy];
  [v4 setEvent:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCreateCalendarEventCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCreateCalendarEventCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCreateCalendarEventCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCreateCalendarEventCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFCreateCalendarEventCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFCreateCalendarEventCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFCreateCalendarEventCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 event];
    [(SFCreateCalendarEventCommand *)v5 setEvent:v9];

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