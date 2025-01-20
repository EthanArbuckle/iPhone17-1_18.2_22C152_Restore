@interface _SFPBReminder
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)notes;
- (NSString)title;
- (_SFPBDate)dueDate;
- (_SFPBReminder)initWithDictionary:(id)a3;
- (_SFPBReminder)initWithFacade:(id)a3;
- (_SFPBReminder)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setDueDate:(id)a3;
- (void)setNotes:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBReminder

- (_SFPBReminder)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBReminder *)self init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(_SFPBReminder *)v5 setTitle:v7];
    }
    v8 = [v4 dueDate];

    if (v8)
    {
      v9 = [_SFPBDate alloc];
      v10 = [v4 dueDate];
      v11 = [(_SFPBDate *)v9 initWithNSDate:v10];
      [(_SFPBReminder *)v5 setDueDate:v11];
    }
    v12 = [v4 notes];

    if (v12)
    {
      v13 = [v4 notes];
      [(_SFPBReminder *)v5 setNotes:v13];
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)notes
{
  return self->_notes;
}

- (_SFPBDate)dueDate
{
  return self->_dueDate;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBReminder)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBReminder;
  v5 = [(_SFPBReminder *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBReminder *)v5 setTitle:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"dueDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBDate alloc] initWithDictionary:v8];
      [(_SFPBReminder *)v5 setDueDate:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"notes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBReminder *)v5 setNotes:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBReminder)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBReminder *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBReminder *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_dueDate)
  {
    id v4 = [(_SFPBReminder *)self dueDate];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"dueDate"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"dueDate"];
    }
  }
  if (self->_notes)
  {
    uint64_t v7 = [(_SFPBReminder *)self notes];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"notes"];
  }
  if (self->_title)
  {
    v9 = [(_SFPBReminder *)self title];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"title"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  unint64_t v4 = [(_SFPBDate *)self->_dueDate hash] ^ v3;
  return v4 ^ [(NSString *)self->_notes hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBReminder *)self title];
  v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBReminder *)self title];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBReminder *)self title];
    v10 = [v4 title];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBReminder *)self dueDate];
  v6 = [v4 dueDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBReminder *)self dueDate];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(_SFPBReminder *)self dueDate];
    v15 = [v4 dueDate];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBReminder *)self notes];
  v6 = [v4 notes];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBReminder *)self notes];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBReminder *)self notes];
    v20 = [v4 notes];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_SFPBReminder *)self title];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBReminder *)self dueDate];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  v6 = [(_SFPBReminder *)self notes];
  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBReminderReadFrom(self, (uint64_t)a3);
}

- (void)setNotes:(id)a3
{
  self->_notes = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDueDate:(id)a3
{
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end