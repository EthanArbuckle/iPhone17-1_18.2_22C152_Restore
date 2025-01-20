@interface SFCreateReminderCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFCreateReminderCommand)initWithCoder:(id)a3;
- (SFCreateReminderCommand)initWithProtobuf:(id)a3;
- (SFReminder)reminder;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setReminder:(id)a3;
@end

@implementation SFCreateReminderCommand

- (SFCreateReminderCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCreateReminderCommand;
  v5 = [(SFCreateReminderCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 reminder];

    if (v6)
    {
      v7 = [SFReminder alloc];
      v8 = [v4 reminder];
      v9 = [(SFReminder *)v7 initWithProtobuf:v8];
      [(SFCreateReminderCommand *)v5 setReminder:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setReminder:(id)a3
{
}

- (SFReminder)reminder
{
  return self->_reminder;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFCreateReminderCommand;
  unint64_t v3 = [(SFCommand *)&v7 hash];
  id v4 = [(SFCreateReminderCommand *)self reminder];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFCreateReminderCommand *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFCreateReminderCommand *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFCreateReminderCommand,
             [(SFCommand *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFCreateReminderCommand *)self reminder];
    objc_super v7 = [(SFCreateReminderCommand *)v5 reminder];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFCreateReminderCommand *)self reminder];
      if (v8)
      {
        v9 = [(SFCreateReminderCommand *)self reminder];
        v10 = [(SFCreateReminderCommand *)v5 reminder];
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
  v8.super_class = (Class)SFCreateReminderCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFCreateReminderCommand *)self reminder];
  v6 = (void *)[v5 copy];
  [v4 setReminder:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCreateReminderCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCreateReminderCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCreateReminderCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCreateReminderCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFCreateReminderCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFCreateReminderCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFCreateReminderCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 reminder];
    [(SFCreateReminderCommand *)v5 setReminder:v9];

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