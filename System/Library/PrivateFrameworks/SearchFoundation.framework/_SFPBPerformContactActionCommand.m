@interface _SFPBPerformContactActionCommand
- (BOOL)didDisplayHandleOptions;
- (BOOL)didSelectFromOptionsMenu;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBPerformContactActionCommand)initWithDictionary:(id)a3;
- (_SFPBPerformContactActionCommand)initWithFacade:(id)a3;
- (_SFPBPerformContactActionCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)contactActionType;
- (unint64_t)hash;
- (void)setContactActionType:(int)a3;
- (void)setDidDisplayHandleOptions:(BOOL)a3;
- (void)setDidSelectFromOptionsMenu:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPerformContactActionCommand

- (_SFPBPerformContactActionCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBPerformContactActionCommand *)self init];
  if (v5)
  {
    if ([v4 hasContactActionType]) {
      -[_SFPBPerformContactActionCommand setContactActionType:](v5, "setContactActionType:", [v4 contactActionType]);
    }
    if ([v4 hasDidDisplayHandleOptions]) {
      -[_SFPBPerformContactActionCommand setDidDisplayHandleOptions:](v5, "setDidDisplayHandleOptions:", [v4 didDisplayHandleOptions]);
    }
    if ([v4 hasDidSelectFromOptionsMenu]) {
      -[_SFPBPerformContactActionCommand setDidSelectFromOptionsMenu:](v5, "setDidSelectFromOptionsMenu:", [v4 didSelectFromOptionsMenu]);
    }
    v6 = v5;
  }

  return v5;
}

- (BOOL)didSelectFromOptionsMenu
{
  return self->_didSelectFromOptionsMenu;
}

- (BOOL)didDisplayHandleOptions
{
  return self->_didDisplayHandleOptions;
}

- (int)contactActionType
{
  return self->_contactActionType;
}

- (_SFPBPerformContactActionCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBPerformContactActionCommand;
  v5 = [(_SFPBPerformContactActionCommand *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contactActionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPerformContactActionCommand setContactActionType:](v5, "setContactActionType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"didDisplayHandleOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPerformContactActionCommand setDidDisplayHandleOptions:](v5, "setDidDisplayHandleOptions:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"didSelectFromOptionsMenu"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPerformContactActionCommand setDidSelectFromOptionsMenu:](v5, "setDidSelectFromOptionsMenu:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBPerformContactActionCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPerformContactActionCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPerformContactActionCommand *)self dictionaryRepresentation];
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
  if (self->_contactActionType)
  {
    uint64_t v4 = [(_SFPBPerformContactActionCommand *)self contactActionType];
    if (v4 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2ED30[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"contactActionType"];
  }
  if (self->_didDisplayHandleOptions)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBPerformContactActionCommand didDisplayHandleOptions](self, "didDisplayHandleOptions"));
    [v3 setObject:v6 forKeyedSubscript:@"didDisplayHandleOptions"];
  }
  if (self->_didSelectFromOptionsMenu)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBPerformContactActionCommand didSelectFromOptionsMenu](self, "didSelectFromOptionsMenu"));
    [v3 setObject:v7 forKeyedSubscript:@"didSelectFromOptionsMenu"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761;
  if (self->_didDisplayHandleOptions) {
    uint64_t v3 = 2654435761;
  }
  else {
    uint64_t v3 = 0;
  }
  if (!self->_didSelectFromOptionsMenu) {
    uint64_t v2 = 0;
  }
  return v3 ^ v2 ^ (2654435761 * self->_contactActionType);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int contactActionType = self->_contactActionType,
        contactActionType == [v4 contactActionType])
    && (int didDisplayHandleOptions = self->_didDisplayHandleOptions,
        didDisplayHandleOptions == [v4 didDisplayHandleOptions]))
  {
    int didSelectFromOptionsMenu = self->_didSelectFromOptionsMenu;
    BOOL v8 = didSelectFromOptionsMenu == [v4 didSelectFromOptionsMenu];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_SFPBPerformContactActionCommand *)self contactActionType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBPerformContactActionCommand *)self didDisplayHandleOptions]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBPerformContactActionCommand *)self didSelectFromOptionsMenu]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPerformContactActionCommandReadFrom(self, (uint64_t)a3);
}

- (void)setDidSelectFromOptionsMenu:(BOOL)a3
{
  self->_int didSelectFromOptionsMenu = a3;
}

- (void)setDidDisplayHandleOptions:(BOOL)a3
{
  self->_int didDisplayHandleOptions = a3;
}

- (void)setContactActionType:(int)a3
{
  self->_int contactActionType = a3;
}

@end