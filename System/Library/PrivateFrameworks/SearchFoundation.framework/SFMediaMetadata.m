@interface SFMediaMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMediaType;
- (BOOL)isEqual:(id)a3;
- (NSArray)bundleIdentifiersToExclude;
- (NSArray)mediaPunchouts;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)albumName;
- (NSString)artistName;
- (NSString)disambiguationTitle;
- (NSString)mediaIdentifier;
- (NSString)mediaName;
- (SFMediaMetadata)initWithCoder:(id)a3;
- (SFMediaMetadata)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)mediaType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setBundleIdentifiersToExclude:(id)a3;
- (void)setDisambiguationTitle:(id)a3;
- (void)setMediaIdentifier:(id)a3;
- (void)setMediaName:(id)a3;
- (void)setMediaPunchouts:(id)a3;
- (void)setMediaType:(int)a3;
@end

@implementation SFMediaMetadata

- (SFMediaMetadata)initWithProtobuf:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SFMediaMetadata;
  v5 = [(SFMediaMetadata *)&v41 init];
  if (v5)
  {
    v6 = [v4 mediaName];

    if (v6)
    {
      v7 = [v4 mediaName];
      [(SFMediaMetadata *)v5 setMediaName:v7];
    }
    if ([v4 mediaType]) {
      -[SFMediaMetadata setMediaType:](v5, "setMediaType:", [v4 mediaType]);
    }
    v8 = [v4 artistName];

    if (v8)
    {
      v9 = [v4 artistName];
      [(SFMediaMetadata *)v5 setArtistName:v9];
    }
    v10 = [v4 albumName];

    if (v10)
    {
      v11 = [v4 albumName];
      [(SFMediaMetadata *)v5 setAlbumName:v11];
    }
    v12 = [v4 mediaPunchouts];
    if (v12) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v13 = 0;
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v14 = [v4 mediaPunchouts];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          if (v19) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v16);
    }

    [(SFMediaMetadata *)v5 setMediaPunchouts:v13];
    v20 = [v4 bundleIdentifiersToExcludes];
    if (v20) {
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v21 = 0;
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v22 = objc_msgSend(v4, "bundleIdentifiersToExcludes", 0);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          if (*(void *)(*((void *)&v33 + 1) + 8 * j)) {
            objc_msgSend(v21, "addObject:");
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v24);
    }

    [(SFMediaMetadata *)v5 setBundleIdentifiersToExclude:v21];
    v27 = [v4 disambiguationTitle];

    if (v27)
    {
      v28 = [v4 disambiguationTitle];
      [(SFMediaMetadata *)v5 setDisambiguationTitle:v28];
    }
    v29 = [v4 mediaIdentifier];

    if (v29)
    {
      v30 = [v4 mediaIdentifier];
      [(SFMediaMetadata *)v5 setMediaIdentifier:v30];
    }
    v31 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_disambiguationTitle, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersToExclude, 0);
  objc_storeStrong((id *)&self->_mediaPunchouts, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_mediaName, 0);
}

- (void)setMediaIdentifier:(id)a3
{
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (void)setDisambiguationTitle:(id)a3
{
}

- (NSString)disambiguationTitle
{
  return self->_disambiguationTitle;
}

- (void)setBundleIdentifiersToExclude:(id)a3
{
}

- (NSArray)bundleIdentifiersToExclude
{
  return self->_bundleIdentifiersToExclude;
}

- (void)setMediaPunchouts:(id)a3
{
}

- (NSArray)mediaPunchouts
{
  return self->_mediaPunchouts;
}

- (void)setAlbumName:(id)a3
{
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (void)setMediaName:(id)a3
{
}

- (NSString)mediaName
{
  return self->_mediaName;
}

- (unint64_t)hash
{
  v3 = [(SFMediaMetadata *)self mediaName];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 ^ [(SFMediaMetadata *)self mediaType];
  v6 = [(SFMediaMetadata *)self artistName];
  uint64_t v7 = [v6 hash];
  v8 = [(SFMediaMetadata *)self albumName];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  v10 = [(SFMediaMetadata *)self mediaPunchouts];
  uint64_t v11 = [v10 hash];
  v12 = [(SFMediaMetadata *)self bundleIdentifiersToExclude];
  uint64_t v13 = v11 ^ [v12 hash];
  v14 = [(SFMediaMetadata *)self disambiguationTitle];
  uint64_t v15 = v9 ^ v13 ^ [v14 hash];
  uint64_t v16 = [(SFMediaMetadata *)self mediaIdentifier];
  unint64_t v17 = v15 ^ [v16 hash];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFMediaMetadata *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFMediaMetadata *)v5 isMemberOfClass:objc_opt_class()])
    {
      v6 = v5;
      uint64_t v7 = [(SFMediaMetadata *)self mediaName];
      v8 = [(SFMediaMetadata *)v6 mediaName];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_47:

        goto LABEL_48;
      }
      uint64_t v9 = [(SFMediaMetadata *)self mediaName];
      if (v9)
      {
        v10 = [(SFMediaMetadata *)self mediaName];
        v75 = [(SFMediaMetadata *)v6 mediaName];
        v76 = v10;
        if (!objc_msgSend(v10, "isEqual:"))
        {
          char v11 = 0;
          goto LABEL_45;
        }
      }
      int v12 = [(SFMediaMetadata *)self mediaType];
      if (v12 == [(SFMediaMetadata *)v6 mediaType])
      {
        uint64_t v13 = [(SFMediaMetadata *)self artistName];
        v14 = [(SFMediaMetadata *)v6 artistName];
        if ((v13 == 0) == (v14 != 0))
        {
LABEL_42:

          goto LABEL_43;
        }
        v74 = v14;
        uint64_t v15 = [(SFMediaMetadata *)self artistName];
        v73 = (void *)v15;
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          unint64_t v17 = [(SFMediaMetadata *)self artistName];
          v3 = [(SFMediaMetadata *)v6 artistName];
          if (([v17 isEqual:v3] & 1) == 0)
          {

LABEL_43:
            goto LABEL_44;
          }
          v71 = v9;
          v72 = v13;
          v18 = v76;
          uint64_t v13 = v17;
        }
        else
        {
          v71 = v9;
          v72 = v13;
          v18 = v76;
        }
        v76 = v18;
        v19 = [(SFMediaMetadata *)self albumName];
        v20 = [(SFMediaMetadata *)v6 albumName];
        id v21 = v73;
        uint64_t v9 = v71;
        if ((v19 == 0) == (v20 != 0))
        {
LABEL_39:

          if (v21)
          {
          }
          uint64_t v13 = v72;
          v14 = v74;
          goto LABEL_42;
        }
        v69 = v20;
        v68 = [(SFMediaMetadata *)self albumName];
        v70 = v3;
        if (!v68)
        {
          v67 = v19;
          uint64_t v25 = v13;
          v26 = v73;
          goto LABEL_22;
        }
        v22 = v19;
        uint64_t v23 = [(SFMediaMetadata *)self albumName];
        uint64_t v24 = [(SFMediaMetadata *)v6 albumName];
        if ([v23 isEqual:v24])
        {
          v64 = v24;
          v65 = v23;
          v67 = v22;
          uint64_t v25 = v13;
          v26 = v73;
LABEL_22:
          v66 = v25;
          v27 = [(SFMediaMetadata *)self mediaPunchouts];
          v28 = [(SFMediaMetadata *)v6 mediaPunchouts];
          id v21 = v26;
          v3 = v70;
          v19 = v67;
          if ((v27 == 0) != (v28 != 0))
          {
            id v63 = v28;
            v62 = [(SFMediaMetadata *)self mediaPunchouts];
            if (v62)
            {
              v29 = [(SFMediaMetadata *)self mediaPunchouts];
              v60 = [(SFMediaMetadata *)v6 mediaPunchouts];
              v61 = v29;
              if (!objc_msgSend(v29, "isEqual:"))
              {
                char v11 = 0;
                v30 = v72;
                v31 = v62;
LABEL_65:

LABEL_66:
                if (v68)
                {
                }
                if (v21)
                {
                }
                if (!v71) {
                  goto LABEL_46;
                }
                goto LABEL_45;
              }
            }
            v32 = [(SFMediaMetadata *)self bundleIdentifiersToExclude];
            long long v33 = [(SFMediaMetadata *)v6 bundleIdentifiersToExclude];
            if ((v32 == 0) != (v33 != 0))
            {
              v59 = v33;
              long long v34 = [(SFMediaMetadata *)self bundleIdentifiersToExclude];
              v58 = v27;
              if (v34)
              {
                long long v35 = [(SFMediaMetadata *)self bundleIdentifiersToExclude];
                v56 = [(SFMediaMetadata *)v6 bundleIdentifiersToExclude];
                v57 = v35;
                if (!objc_msgSend(v35, "isEqual:"))
                {
                  char v11 = 0;
                  id v21 = v73;
                  goto LABEL_63;
                }
                v55 = v32;
              }
              else
              {
                v55 = v32;
              }
              long long v37 = [(SFMediaMetadata *)self disambiguationTitle];
              long long v38 = [(SFMediaMetadata *)v6 disambiguationTitle];
              if ((v37 == 0) != (v38 != 0))
              {
                v53 = v38;
                [(SFMediaMetadata *)self disambiguationTitle];
                uint64_t v52 = v54 = v34;
                if (!v52
                  || ([(SFMediaMetadata *)self disambiguationTitle],
                      long long v39 = objc_claimAutoreleasedReturnValue(),
                      [(SFMediaMetadata *)v6 disambiguationTitle],
                      v50 = objc_claimAutoreleasedReturnValue(),
                      v51 = v39,
                      objc_msgSend(v39, "isEqual:")))
                {
                  v42 = [(SFMediaMetadata *)self mediaIdentifier];
                  v43 = [(SFMediaMetadata *)v6 mediaIdentifier];
                  if ((v42 == 0) == (v43 != 0))
                  {

                    char v11 = 0;
                    id v21 = v73;
                    long long v40 = v37;
                    v32 = v55;
                    objc_super v41 = (void *)v52;
                    if (!v52) {
                      goto LABEL_62;
                    }
                  }
                  else
                  {
                    v48 = v43;
                    uint64_t v44 = [(SFMediaMetadata *)self mediaIdentifier];
                    id v21 = v73;
                    v49 = v37;
                    if (v44)
                    {
                      v45 = (void *)v44;
                      v46 = [(SFMediaMetadata *)self mediaIdentifier];
                      v47 = [(SFMediaMetadata *)v6 mediaIdentifier];
                      char v11 = [v46 isEqual:v47];
                    }
                    else
                    {

                      char v11 = 1;
                    }
                    v32 = v55;
                    objc_super v41 = (void *)v52;
                    long long v40 = v49;
                    if (!v52)
                    {
LABEL_62:

                      long long v34 = v54;
                      if (!v54) {
                        goto LABEL_64;
                      }
                      goto LABEL_63;
                    }
                  }
                }
                else
                {
                  char v11 = 0;
                  id v21 = v73;
                  long long v40 = v37;
                  v32 = v55;
                  objc_super v41 = (void *)v52;
                }

                goto LABEL_62;
              }

              char v11 = 0;
              id v21 = v73;
              v32 = v55;
              if (!v34)
              {
LABEL_64:

                v31 = v62;
                v30 = v72;
                v27 = v58;
                if (!v62) {
                  goto LABEL_66;
                }
                goto LABEL_65;
              }
LABEL_63:

              goto LABEL_64;
            }

            if (v62)
            {
            }
            id v21 = v73;
            v28 = v63;
            v3 = v70;
          }

          if (v68)
          {
          }
          v20 = v69;
          uint64_t v13 = v66;
          goto LABEL_39;
        }

        if (v73)
        {
        }
      }
LABEL_44:
      char v11 = 0;
      if (!v9)
      {
LABEL_46:

        goto LABEL_47;
      }
LABEL_45:

      goto LABEL_46;
    }
    char v11 = 0;
  }
LABEL_48:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFMediaMetadata *)self mediaName];
  v6 = (void *)[v5 copy];
  [v4 setMediaName:v6];

  objc_msgSend(v4, "setMediaType:", -[SFMediaMetadata mediaType](self, "mediaType"));
  uint64_t v7 = [(SFMediaMetadata *)self artistName];
  v8 = (void *)[v7 copy];
  [v4 setArtistName:v8];

  uint64_t v9 = [(SFMediaMetadata *)self albumName];
  v10 = (void *)[v9 copy];
  [v4 setAlbumName:v10];

  char v11 = [(SFMediaMetadata *)self mediaPunchouts];
  int v12 = (void *)[v11 copy];
  [v4 setMediaPunchouts:v12];

  uint64_t v13 = [(SFMediaMetadata *)self bundleIdentifiersToExclude];
  v14 = (void *)[v13 copy];
  [v4 setBundleIdentifiersToExclude:v14];

  uint64_t v15 = [(SFMediaMetadata *)self disambiguationTitle];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setDisambiguationTitle:v16];

  unint64_t v17 = [(SFMediaMetadata *)self mediaIdentifier];
  v18 = (void *)[v17 copy];
  [v4 setMediaIdentifier:v18];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMediaMetadata alloc] initWithFacade:self];
  v3 = [(_SFPBMediaMetadata *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMediaMetadata alloc] initWithFacade:self];
  v3 = [(_SFPBMediaMetadata *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBMediaMetadata alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBMediaMetadata *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFMediaMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBMediaMetadata alloc] initWithData:v5];
  uint64_t v7 = [(SFMediaMetadata *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasMediaType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMediaType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mediaType = a3;
}

@end