@interface _SFPBRFAvatarImage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)contact_ids;
- (NSData)jsonData;
- (_SFPBRFAvatarImage)initWithDictionary:(id)a3;
- (_SFPBRFAvatarImage)initWithFacade:(id)a3;
- (_SFPBRFAvatarImage)initWithJSON:(id)a3;
- (id)contact_idsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (int)image_style;
- (unint64_t)contact_idsCount;
- (unint64_t)hash;
- (void)addContact_ids:(id)a3;
- (void)clearContact_ids;
- (void)setContact_ids:(id)a3;
- (void)setImage_style:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFAvatarImage

- (_SFPBRFAvatarImage)initWithFacade:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFAvatarImage *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "contact_ids");
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = objc_msgSend(v4, "contact_ids", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v15 + 1) + 8 * i)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [(_SFPBRFAvatarImage *)v5 setContact_ids:v7];
    if (objc_msgSend(v4, "hasImage_style")) {
      -[_SFPBRFAvatarImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    }
    v13 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (int)image_style
{
  return self->_image_style;
}

- (NSArray)contact_ids
{
  return self->_contact_ids;
}

- (_SFPBRFAvatarImage)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFPBRFAvatarImage;
  v5 = [(_SFPBRFAvatarImage *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contactIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "copy", (void)v17);
              [(_SFPBRFAvatarImage *)v5 addContact_ids:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v9);
      }
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"imageStyle", (void)v17);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFAvatarImage setImage_style:](v5, "setImage_style:", [v14 intValue]);
    }
    long long v15 = v5;
  }
  return v5;
}

- (_SFPBRFAvatarImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFAvatarImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFAvatarImage *)self dictionaryRepresentation];
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
  if (self->_contact_ids)
  {
    id v4 = [(_SFPBRFAvatarImage *)self contact_ids];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"contactIds"];
  }
  if (self->_image_style)
  {
    uint64_t v6 = [(_SFPBRFAvatarImage *)self image_style];
    if v6 < 0x2A && ((0x3FFDFFFFFFFuLL >> v6))
    {
      uint64_t v7 = off_1E5A2ED80[v6];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v7 forKeyedSubscript:@"imageStyle"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_image_style) ^ [(NSArray *)self->_contact_ids hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBRFAvatarImage *)self contact_ids];
    uint64_t v6 = objc_msgSend(v4, "contact_ids");
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBRFAvatarImage *)self contact_ids];
      if (!v8)
      {

LABEL_10:
        int image_style = self->_image_style;
        BOOL v13 = image_style == objc_msgSend(v4, "image_style");
        goto LABEL_8;
      }
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(_SFPBRFAvatarImage *)self contact_ids];
      uint64_t v11 = objc_msgSend(v4, "contact_ids");
      int v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFAvatarImage *)self contact_ids];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ([(_SFPBRFAvatarImage *)self image_style]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFAvatarImageReadFrom(self, (uint64_t)a3);
}

- (void)setImage_style:(int)a3
{
  self->_int image_style = a3;
}

- (id)contact_idsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_contact_ids objectAtIndexedSubscript:a3];
}

- (unint64_t)contact_idsCount
{
  return [(NSArray *)self->_contact_ids count];
}

- (void)addContact_ids:(id)a3
{
  id v4 = a3;
  contact_ids = self->_contact_ids;
  id v8 = v4;
  if (!contact_ids)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_contact_ids;
    self->_contact_ids = v6;

    id v4 = v8;
    contact_ids = self->_contact_ids;
  }
  [(NSArray *)contact_ids addObject:v4];
}

- (void)clearContact_ids
{
}

- (void)setContact_ids:(id)a3
{
  self->_contact_ids = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end