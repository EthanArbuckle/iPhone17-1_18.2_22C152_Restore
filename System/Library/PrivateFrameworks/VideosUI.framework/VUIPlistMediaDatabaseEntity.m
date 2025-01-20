@interface VUIPlistMediaDatabaseEntity
- (BOOL)isEqual:(id)a3;
- (NSNumber)isLocal;
- (NSString)canonicalID;
- (NSString)contentDescription;
- (NSString)genreTitle;
- (NSString)identifier;
- (NSString)title;
- (NSURL)coverArtURL;
- (VUIPlistMediaDatabaseEntity)init;
- (VUIPlistMediaDatabaseEntity)initWithDictionary:(id)a3;
- (VUIPlistMediaDatabaseEntity)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)type;
- (void)_mediaEntityPropertyDidChange:(id)a3;
- (void)dealloc;
- (void)setCanonicalID:(id)a3;
- (void)setContentDescription:(id)a3;
- (void)setCoverArtURL:(id)a3;
- (void)setGenreTitle:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation VUIPlistMediaDatabaseEntity

- (VUIPlistMediaDatabaseEntity)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"identifier" format];
  }
  v12.receiver = self;
  v12.super_class = (Class)VUIPlistMediaDatabaseEntity;
  v7 = [(VUIPlistMediaDatabaseEntity *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_type = a4;
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__mediaEntityPropertyDidChange_ name:VUIPlistMediaEntityPropertyDidChange object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIPlistMediaDatabaseEntity;
  [(VUIPlistMediaDatabaseEntity *)&v4 dealloc];
}

- (VUIPlistMediaDatabaseEntity)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "vui_stringForKey:", @"Identifier");
  id v6 = objc_msgSend(v4, "vui_numberForKey:", @"Type");
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = [(VUIPlistMediaDatabaseEntity *)self initWithIdentifier:v5 type:v7];
  if (v8)
  {
    v9 = objc_msgSend(v4, "vui_stringForKey:", @"Title");
    uint64_t v10 = [v9 copy];
    title = v8->_title;
    v8->_title = (NSString *)v10;

    objc_super v12 = objc_msgSend(v4, "vui_stringForKey:", @"GenreTitle");
    uint64_t v13 = [v12 copy];
    genreTitle = v8->_genreTitle;
    v8->_genreTitle = (NSString *)v13;

    v15 = objc_msgSend(v4, "vui_stringForKey:", @"ContentDescription");
    uint64_t v16 = [v15 copy];
    contentDescription = v8->_contentDescription;
    v8->_contentDescription = (NSString *)v16;

    v18 = objc_msgSend(v4, "vui_stringForKey:", @"canonicalId");
    uint64_t v19 = [v18 copy];
    canonicalID = v8->_canonicalID;
    v8->_canonicalID = (NSString *)v19;

    v21 = objc_msgSend(v4, "vui_stringForKey:", @"CoverArtURL");
    if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
      coverArtURL = v8->_coverArtURL;
      v8->_coverArtURL = (NSURL *)v22;
    }
  }

  return v8;
}

- (VUIPlistMediaDatabaseEntity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (NSNumber)isLocal
{
  return 0;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(VUIPlistMediaDatabaseEntity *)self identifier];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, @"Identifier");

  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIPlistMediaDatabaseEntity type](self, "type"));
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v5, @"Type");

  id v6 = [(VUIPlistMediaDatabaseEntity *)self title];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v6, @"Title");

  uint64_t v7 = [(VUIPlistMediaDatabaseEntity *)self contentDescription];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v7, @"ContentDescription");

  uint64_t v8 = [(VUIPlistMediaDatabaseEntity *)self coverArtURL];
  v9 = [v8 absoluteString];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v9, @"CoverArtURL");

  uint64_t v10 = [(VUIPlistMediaDatabaseEntity *)self genreTitle];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v10, @"GenreTitle");

  v11 = [(VUIPlistMediaDatabaseEntity *)self canonicalID];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v11, @"canonicalId");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:self->_identifier type:self->_type];
  uint64_t v5 = [(NSString *)self->_title copy];
  id v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(NSString *)self->_contentDescription copy];
  uint64_t v8 = (void *)v4[5];
  v4[5] = v7;

  uint64_t v9 = [(NSURL *)self->_coverArtURL copy];
  uint64_t v10 = (void *)v4[6];
  v4[6] = v9;

  uint64_t v11 = [(NSString *)self->_genreTitle copy];
  objc_super v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSString *)self->_canonicalID copy];
  v14 = (void *)v4[7];
  v4[7] = v13;

  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VUIPlistMediaDatabaseEntity *)self type];
  uint64_t v4 = [(VUIPlistMediaDatabaseEntity *)self identifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIPlistMediaDatabaseEntity *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        uint64_t v7 = [(VUIPlistMediaDatabaseEntity *)self identifier];
        uint64_t v8 = [(VUIPlistMediaDatabaseEntity *)v6 identifier];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          uint64_t v11 = v10;
          char v12 = 0;
          if (!v9 || !v10) {
            goto LABEL_49;
          }
          char v13 = [v9 isEqual:v10];

          if ((v13 & 1) == 0) {
            goto LABEL_47;
          }
        }
        v14 = [(VUIPlistMediaDatabaseEntity *)self isLocal];
        v15 = [(VUIPlistMediaDatabaseEntity *)v6 isLocal];
        id v9 = v14;
        id v16 = v15;
        if (v9 == v16)
        {
        }
        else
        {
          uint64_t v11 = v16;
          char v12 = 0;
          if (!v9 || !v16) {
            goto LABEL_49;
          }
          char v17 = [v9 isEqual:v16];

          if ((v17 & 1) == 0) {
            goto LABEL_47;
          }
        }
        v18 = [(VUIPlistMediaDatabaseEntity *)self title];
        uint64_t v19 = [(VUIPlistMediaDatabaseEntity *)v6 title];
        id v9 = v18;
        id v20 = v19;
        if (v9 == v20)
        {
        }
        else
        {
          uint64_t v11 = v20;
          char v12 = 0;
          if (!v9 || !v20) {
            goto LABEL_49;
          }
          char v21 = [v9 isEqual:v20];

          if ((v21 & 1) == 0) {
            goto LABEL_47;
          }
        }
        uint64_t v22 = [(VUIPlistMediaDatabaseEntity *)self contentDescription];
        v23 = [(VUIPlistMediaDatabaseEntity *)v6 contentDescription];
        id v9 = v22;
        id v24 = v23;
        if (v9 == v24)
        {
        }
        else
        {
          uint64_t v11 = v24;
          char v12 = 0;
          if (!v9 || !v24) {
            goto LABEL_49;
          }
          char v25 = [v9 isEqual:v24];

          if ((v25 & 1) == 0) {
            goto LABEL_47;
          }
        }
        v26 = [(VUIPlistMediaDatabaseEntity *)self coverArtURL];
        v27 = [(VUIPlistMediaDatabaseEntity *)v6 coverArtURL];
        id v9 = v26;
        id v28 = v27;
        if (v9 == v28)
        {
        }
        else
        {
          uint64_t v11 = v28;
          char v12 = 0;
          if (!v9 || !v28) {
            goto LABEL_49;
          }
          char v29 = [v9 isEqual:v28];

          if ((v29 & 1) == 0) {
            goto LABEL_47;
          }
        }
        v30 = [(VUIPlistMediaDatabaseEntity *)self genreTitle];
        v31 = [(VUIPlistMediaDatabaseEntity *)v6 genreTitle];
        id v9 = v30;
        id v32 = v31;
        if (v9 == v32)
        {
        }
        else
        {
          uint64_t v11 = v32;
          char v12 = 0;
          if (!v9 || !v32) {
            goto LABEL_49;
          }
          char v33 = [v9 isEqual:v32];

          if ((v33 & 1) == 0) {
            goto LABEL_47;
          }
        }
        unint64_t v34 = [(VUIPlistMediaDatabaseEntity *)self type];
        if (v34 != [(VUIPlistMediaDatabaseEntity *)v6 type])
        {
LABEL_47:
          char v12 = 0;
LABEL_50:

          goto LABEL_51;
        }
        v35 = [(VUIPlistMediaDatabaseEntity *)self canonicalID];
        v36 = [(VUIPlistMediaDatabaseEntity *)v6 canonicalID];
        id v9 = v35;
        id v37 = v36;
        uint64_t v11 = v37;
        if (v9 == v37)
        {
          char v12 = 1;
        }
        else
        {
          char v12 = 0;
          if (v9 && v37) {
            char v12 = [v9 isEqual:v37];
          }
        }
LABEL_49:

        goto LABEL_50;
      }
    }
    char v12 = 0;
  }
LABEL_51:

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v33.receiver = self;
  v33.super_class = (Class)VUIPlistMediaDatabaseEntity;
  uint64_t v4 = [(VUIPlistMediaDatabaseEntity *)&v33 description];
  [v3 addObject:v4];

  unint64_t v5 = NSString;
  id v6 = [(VUIPlistMediaDatabaseEntity *)self identifier];
  uint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"identifier", v6];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIPlistMediaDatabaseEntity type](self, "type"));
  id v10 = [v8 stringWithFormat:@"%@=%@", @"type", v9];
  [v3 addObject:v10];

  uint64_t v11 = NSString;
  char v12 = [(VUIPlistMediaDatabaseEntity *)self isLocal];
  char v13 = [v11 stringWithFormat:@"%@=%@", @"isLocal", v12];
  [v3 addObject:v13];

  v14 = NSString;
  v15 = [(VUIPlistMediaDatabaseEntity *)self title];
  id v16 = [v14 stringWithFormat:@"%@=%@", @"title", v15];
  [v3 addObject:v16];

  char v17 = NSString;
  v18 = [(VUIPlistMediaDatabaseEntity *)self contentDescription];
  uint64_t v19 = [v17 stringWithFormat:@"%@=%@", @"contentDescription", v18];
  [v3 addObject:v19];

  id v20 = NSString;
  char v21 = [(VUIPlistMediaDatabaseEntity *)self coverArtURL];
  uint64_t v22 = [v20 stringWithFormat:@"%@=%@", @"coverArtURL", v21];
  [v3 addObject:v22];

  v23 = NSString;
  id v24 = [(VUIPlistMediaDatabaseEntity *)self genreTitle];
  char v25 = [v23 stringWithFormat:@"%@=%@", @"genreTitle", v24];
  [v3 addObject:v25];

  v26 = NSString;
  v27 = [(VUIPlistMediaDatabaseEntity *)self canonicalID];
  id v28 = [v26 stringWithFormat:@"%@=%@", @"canonicalID", v27];
  [v3 addObject:v28];

  char v29 = NSString;
  v30 = [v3 componentsJoinedByString:@", "];
  v31 = [v29 stringWithFormat:@"<%@>", v30];

  return v31;
}

- (void)_mediaEntityPropertyDidChange:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 object];
  unint64_t v5 = v4;
  if (v4 != self)
  {
    id v6 = [(VUIPlistMediaDatabaseEntity *)v4 identifier];
    uint64_t v7 = [(VUIPlistMediaDatabaseEntity *)self identifier];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      id v9 = [v14 userInfo];
      id v10 = [v9 objectForKey:VUIPlistMediaEntityPropertyDidChangePropertyNameKey];

      uint64_t v11 = [v14 userInfo];
      char v12 = [v11 objectForKey:VUIPlistMediaEntityPropertyDidChangePropertyValueKey];

      if (v10)
      {
        char v13 = [MEMORY[0x1E4F1CA98] null];

        if (v12 == v13)
        {

          char v12 = 0;
        }
        [(VUIPlistMediaDatabaseEntity *)self setValue:v12 forKey:v10];
      }
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)genreTitle
{
  return self->_genreTitle;
}

- (void)setGenreTitle:(id)a3
{
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (void)setContentDescription:(id)a3
{
}

- (NSURL)coverArtURL
{
  return self->_coverArtURL;
}

- (void)setCoverArtURL:(id)a3
{
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_coverArtURL, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_genreTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end