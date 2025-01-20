@interface _SFPBToggleAudioCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)localMediaIdentifier;
- (NSString)persistentIdentifier;
- (NSString)universalLibraryIdentifier;
- (_SFPBToggleAudioCommand)initWithDictionary:(id)a3;
- (_SFPBToggleAudioCommand)initWithFacade:(id)a3;
- (_SFPBToggleAudioCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)mediaEntityType;
- (unint64_t)hash;
- (void)setLocalMediaIdentifier:(id)a3;
- (void)setMediaEntityType:(int)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setUniversalLibraryIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBToggleAudioCommand

- (_SFPBToggleAudioCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBToggleAudioCommand *)self init];
  if (v5)
  {
    v6 = [v4 localMediaIdentifier];

    if (v6)
    {
      v7 = [v4 localMediaIdentifier];
      [(_SFPBToggleAudioCommand *)v5 setLocalMediaIdentifier:v7];
    }
    v8 = [v4 persistentIdentifier];

    if (v8)
    {
      v9 = [v4 persistentIdentifier];
      [(_SFPBToggleAudioCommand *)v5 setPersistentIdentifier:v9];
    }
    if ([v4 hasMediaEntityType]) {
      -[_SFPBToggleAudioCommand setMediaEntityType:](v5, "setMediaEntityType:", [v4 mediaEntityType]);
    }
    v10 = [v4 universalLibraryIdentifier];

    if (v10)
    {
      v11 = [v4 universalLibraryIdentifier];
      [(_SFPBToggleAudioCommand *)v5 setUniversalLibraryIdentifier:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalLibraryIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_localMediaIdentifier, 0);
}

- (NSString)universalLibraryIdentifier
{
  return self->_universalLibraryIdentifier;
}

- (int)mediaEntityType
{
  return self->_mediaEntityType;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSString)localMediaIdentifier
{
  return self->_localMediaIdentifier;
}

- (_SFPBToggleAudioCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBToggleAudioCommand;
  v5 = [(_SFPBToggleAudioCommand *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"localMediaIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBToggleAudioCommand *)v5 setLocalMediaIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"persistentIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBToggleAudioCommand *)v5 setPersistentIdentifier:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"mediaEntityType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBToggleAudioCommand setMediaEntityType:](v5, "setMediaEntityType:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"universalLibraryIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(_SFPBToggleAudioCommand *)v5 setUniversalLibraryIdentifier:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (_SFPBToggleAudioCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBToggleAudioCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBToggleAudioCommand *)self dictionaryRepresentation];
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
  if (self->_localMediaIdentifier)
  {
    id v4 = [(_SFPBToggleAudioCommand *)self localMediaIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"localMediaIdentifier"];
  }
  if (self->_mediaEntityType)
  {
    uint64_t v6 = [(_SFPBToggleAudioCommand *)self mediaEntityType];
    if (v6 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_1E5A2EFD8[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"mediaEntityType"];
  }
  if (self->_persistentIdentifier)
  {
    v8 = [(_SFPBToggleAudioCommand *)self persistentIdentifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"persistentIdentifier"];
  }
  if (self->_universalLibraryIdentifier)
  {
    v10 = [(_SFPBToggleAudioCommand *)self universalLibraryIdentifier];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"universalLibraryIdentifier"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_localMediaIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_persistentIdentifier hash];
  uint64_t v5 = 2654435761 * self->_mediaEntityType;
  return v4 ^ v3 ^ [(NSString *)self->_universalLibraryIdentifier hash] ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  uint64_t v5 = [(_SFPBToggleAudioCommand *)self localMediaIdentifier];
  uint64_t v6 = [v4 localMediaIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_17;
  }
  uint64_t v7 = [(_SFPBToggleAudioCommand *)self localMediaIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBToggleAudioCommand *)self localMediaIdentifier];
    v10 = [v4 localMediaIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBToggleAudioCommand *)self persistentIdentifier];
  uint64_t v6 = [v4 persistentIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_17;
  }
  uint64_t v12 = [(_SFPBToggleAudioCommand *)self persistentIdentifier];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBToggleAudioCommand *)self persistentIdentifier];
    objc_super v15 = [v4 persistentIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int mediaEntityType = self->_mediaEntityType;
  if (mediaEntityType != [v4 mediaEntityType]) {
    goto LABEL_18;
  }
  uint64_t v5 = [(_SFPBToggleAudioCommand *)self universalLibraryIdentifier];
  uint64_t v6 = [v4 universalLibraryIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v18 = [(_SFPBToggleAudioCommand *)self universalLibraryIdentifier];
  if (!v18)
  {

LABEL_21:
    BOOL v23 = 1;
    goto LABEL_19;
  }
  v19 = (void *)v18;
  v20 = [(_SFPBToggleAudioCommand *)self universalLibraryIdentifier];
  v21 = [v4 universalLibraryIdentifier];
  char v22 = [v20 isEqual:v21];

  if (v22) {
    goto LABEL_21;
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_SFPBToggleAudioCommand *)self localMediaIdentifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  uint64_t v5 = [(_SFPBToggleAudioCommand *)self persistentIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBToggleAudioCommand *)self mediaEntityType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v6 = [(_SFPBToggleAudioCommand *)self universalLibraryIdentifier];
  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBToggleAudioCommandReadFrom(self, (uint64_t)a3);
}

- (void)setUniversalLibraryIdentifier:(id)a3
{
  self->_universalLibraryIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setMediaEntityType:(int)a3
{
  self->_int mediaEntityType = a3;
}

- (void)setPersistentIdentifier:(id)a3
{
  self->_persistentIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLocalMediaIdentifier:(id)a3
{
  self->_localMediaIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end