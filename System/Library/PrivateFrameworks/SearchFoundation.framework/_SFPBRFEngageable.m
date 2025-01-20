@interface _SFPBRFEngageable
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBCommandReference)command_reference;
- (_SFPBRFEngageable)initWithDictionary:(id)a3;
- (_SFPBRFEngageable)initWithFacade:(id)a3;
- (_SFPBRFEngageable)initWithJSON:(id)a3;
- (_SFPBRFPreviewList)preview_list;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichEngageable_Oneof;
- (void)setCommand_reference:(id)a3;
- (void)setPreview_list:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFEngageable

- (_SFPBRFEngageable)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFEngageable *)self init];
  if (v5)
  {
    if (objc_msgSend(v4, "hasCommand_reference"))
    {
      v6 = objc_msgSend(v4, "command_reference");

      if (v6)
      {
        v7 = [_SFPBCommandReference alloc];
        v8 = objc_msgSend(v4, "command_reference");
        v9 = [(_SFPBCommandReference *)v7 initWithFacade:v8];
        [(_SFPBRFEngageable *)v5 setCommand_reference:v9];
      }
    }
    if (objc_msgSend(v4, "hasPreview_list"))
    {
      v10 = objc_msgSend(v4, "preview_list");

      if (v10)
      {
        v11 = [_SFPBRFPreviewList alloc];
        v12 = objc_msgSend(v4, "preview_list");
        v13 = [(_SFPBRFPreviewList *)v11 initWithFacade:v12];
        [(_SFPBRFEngageable *)v5 setPreview_list:v13];
      }
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview_list, 0);
  objc_storeStrong((id *)&self->_command_reference, 0);
}

- (unint64_t)whichEngageable_Oneof
{
  return self->_whichEngageable_Oneof;
}

- (_SFPBRFEngageable)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFEngageable;
  v5 = [(_SFPBRFEngageable *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"commandReference"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBCommandReference alloc] initWithDictionary:v6];
      [(_SFPBRFEngageable *)v5 setCommand_reference:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"previewList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFPreviewList alloc] initWithDictionary:v8];
      [(_SFPBRFEngageable *)v5 setPreview_list:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBRFEngageable)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFEngageable *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFEngageable *)self dictionaryRepresentation];
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
  if (self->_command_reference)
  {
    id v4 = [(_SFPBRFEngageable *)self command_reference];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"commandReference"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"commandReference"];
    }
  }
  if (self->_preview_list)
  {
    uint64_t v7 = [(_SFPBRFEngageable *)self preview_list];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"previewList"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"previewList"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBCommandReference *)self->_command_reference hash];
  return [(_SFPBRFPreviewList *)self->_preview_list hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBRFEngageable *)self command_reference];
  v6 = objc_msgSend(v4, "command_reference");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBRFEngageable *)self command_reference];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFEngageable *)self command_reference];
    v10 = objc_msgSend(v4, "command_reference");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFEngageable *)self preview_list];
  v6 = objc_msgSend(v4, "preview_list");
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBRFEngageable *)self preview_list];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBRFEngageable *)self preview_list];
    v15 = objc_msgSend(v4, "preview_list");
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFPBRFEngageable *)self command_reference];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBRFEngageable *)self preview_list];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFEngageableReadFrom(self, (uint64_t)a3);
}

- (_SFPBRFPreviewList)preview_list
{
  if (self->_whichEngageable_Oneof == 2) {
    v2 = self->_preview_list;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPreview_list:(id)a3
{
  id v4 = (_SFPBRFPreviewList *)a3;
  command_reference = self->_command_reference;
  self->_command_reference = 0;

  self->_whichEngageable_Oneof = 2 * (v4 != 0);
  preview_list = self->_preview_list;
  self->_preview_list = v4;
}

- (_SFPBCommandReference)command_reference
{
  if (self->_whichEngageable_Oneof == 1) {
    v2 = self->_command_reference;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCommand_reference:(id)a3
{
  id v4 = (_SFPBCommandReference *)a3;
  preview_list = self->_preview_list;
  self->_preview_list = 0;

  self->_whichEngageable_Oneof = v4 != 0;
  command_reference = self->_command_reference;
  self->_command_reference = v4;
}

@end