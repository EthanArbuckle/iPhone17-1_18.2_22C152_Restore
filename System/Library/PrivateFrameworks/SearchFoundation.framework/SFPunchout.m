@interface SFPunchout
+ (BOOL)supportsSecureCoding;
+ (SFPunchout)punchoutWithURL:(id)a3;
+ (SFPunchout)punchoutWithURLs:(id)a3;
- (BOOL)canOpenURL:(id)a3;
- (BOOL)forceOpenInBrowser;
- (BOOL)hasClip;
- (BOOL)hasForceOpenInBrowser;
- (BOOL)hasHasClip;
- (BOOL)hasIsRunnableInBackground;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRunnableInBackground;
- (NSArray)urls;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)actionTarget;
- (NSString)bundleIdentifier;
- (NSString)label;
- (NSString)name;
- (NSURL)cachedOpenableURL;
- (NSURL)preferredOpenableURL;
- (SFPunchout)initWithCoder:(id)a3;
- (SFPunchout)initWithProtobuf:(id)a3;
- (SFUserActivityData)userActivityData;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionTarget:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCachedOpenableURL:(id)a3;
- (void)setForceOpenInBrowser:(BOOL)a3;
- (void)setHasClip:(BOOL)a3;
- (void)setIsRunnableInBackground:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setName:(id)a3;
- (void)setUrls:(id)a3;
- (void)setUserActivityData:(id)a3;
@end

@implementation SFPunchout

- (SFPunchout)initWithProtobuf:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SFPunchout;
  v5 = [(SFPunchout *)&v32 init];
  if (v5)
  {
    v6 = [v4 name];

    if (v6)
    {
      v7 = [v4 name];
      [(SFPunchout *)v5 setName:v7];
    }
    v8 = [v4 bundleIdentifier];

    if (v8)
    {
      v9 = [v4 bundleIdentifier];
      [(SFPunchout *)v5 setBundleIdentifier:v9];
    }
    v10 = [v4 label];

    if (v10)
    {
      v11 = [v4 label];
      [(SFPunchout *)v5 setLabel:v11];
    }
    v12 = [v4 urls];
    if (v12) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v13 = 0;
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v14 = objc_msgSend(v4, "urls", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = _SFPBURLHandwrittenTranslator(*(void **)(*((void *)&v28 + 1) + 8 * i));
          if (v19) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v16);
    }

    [(SFPunchout *)v5 setUrls:v13];
    v20 = [v4 userActivityData];

    if (v20)
    {
      v21 = [SFUserActivityData alloc];
      v22 = [v4 userActivityData];
      v23 = [(SFUserActivityData *)v21 initWithProtobuf:v22];
      [(SFPunchout *)v5 setUserActivityData:v23];
    }
    v24 = [v4 actionTarget];

    if (v24)
    {
      v25 = [v4 actionTarget];
      [(SFPunchout *)v5 setActionTarget:v25];
    }
    if ([v4 isRunnableInBackground]) {
      -[SFPunchout setIsRunnableInBackground:](v5, "setIsRunnableInBackground:", [v4 isRunnableInBackground]);
    }
    if ([v4 hasClip]) {
      -[SFPunchout setHasClip:](v5, "setHasClip:", [v4 hasClip]);
    }
    if ([v4 forceOpenInBrowser]) {
      -[SFPunchout setForceOpenInBrowser:](v5, "setForceOpenInBrowser:", [v4 forceOpenInBrowser]);
    }
    v26 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOpenableURL, 0);
  objc_storeStrong((id *)&self->_actionTarget, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setCachedOpenableURL:(id)a3
{
}

- (NSURL)cachedOpenableURL
{
  return self->_cachedOpenableURL;
}

- (BOOL)forceOpenInBrowser
{
  return self->_forceOpenInBrowser;
}

- (BOOL)hasClip
{
  return self->_hasClip;
}

- (BOOL)isRunnableInBackground
{
  return self->_isRunnableInBackground;
}

- (void)setActionTarget:(id)a3
{
}

- (NSString)actionTarget
{
  return self->_actionTarget;
}

- (void)setUserActivityData:(id)a3
{
}

- (SFUserActivityData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUrls:(id)a3
{
}

- (NSArray)urls
{
  return self->_urls;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  v3 = [(SFPunchout *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(SFPunchout *)self bundleIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFPunchout *)self label];
  uint64_t v8 = [v7 hash];
  v9 = [(SFPunchout *)self urls];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(SFPunchout *)self userActivityData];
  uint64_t v12 = [v11 hash];
  id v13 = [(SFPunchout *)self actionTarget];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = v10 ^ v14 ^ [(SFPunchout *)self isRunnableInBackground];
  uint64_t v16 = [(SFPunchout *)self hasClip];
  unint64_t v17 = v15 ^ v16 ^ [(SFPunchout *)self forceOpenInBrowser];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFPunchout *)a3;
  if (self == v5)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if ([(SFPunchout *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFPunchout *)self name];
      uint64_t v8 = [(SFPunchout *)v6 name];
      if ((v7 == 0) == (v8 != 0))
      {
        LOBYTE(v12) = 0;
LABEL_49:

        goto LABEL_50;
      }
      v9 = [(SFPunchout *)self name];
      if (v9)
      {
        uint64_t v10 = [(SFPunchout *)self name];
        v11 = [(SFPunchout *)v6 name];
        if (![v10 isEqual:v11])
        {
          LOBYTE(v12) = 0;
          goto LABEL_47;
        }
        v67 = v11;
        v68 = v10;
      }
      id v13 = [(SFPunchout *)self bundleIdentifier];
      uint64_t v14 = [(SFPunchout *)v6 bundleIdentifier];
      if ((v13 == 0) != (v14 != 0))
      {
        v66 = v14;
        uint64_t v15 = [(SFPunchout *)self bundleIdentifier];
        if (v15)
        {
          uint64_t v16 = [(SFPunchout *)self bundleIdentifier];
          unint64_t v17 = [(SFPunchout *)v6 bundleIdentifier];
          if (([v16 isEqual:v17] & 1) == 0)
          {

LABEL_44:
LABEL_45:
            LOBYTE(v12) = 0;
            goto LABEL_46;
          }
          v64 = v17;
          v65 = v13;
          v3 = v16;
          v18 = v15;
        }
        else
        {
          v65 = v13;
          v18 = 0;
        }
        v19 = [(SFPunchout *)self label];
        v20 = [(SFPunchout *)v6 label];
        v21 = v18;
        v22 = v3;
        if ((v19 == 0) != (v20 != 0))
        {
          v63 = v20;
          v62 = v19;
          v61 = [(SFPunchout *)self label];
          if (v61)
          {
            v23 = [(SFPunchout *)self label];
            v24 = [(SFPunchout *)v6 label];
            if (([v23 isEqual:v24] & 1) == 0)
            {

              if (v21)
              {
              }
              goto LABEL_45;
            }
            v59 = v24;
            v60 = v23;
            v25 = v21;
          }
          else
          {
            v25 = v21;
          }
          v26 = [(SFPunchout *)self urls];
          v27 = [(SFPunchout *)v6 urls];
          v21 = v25;
          v22 = v3;
          if ((v26 == 0) != (v27 != 0))
          {
            id v58 = v27;
            v57 = [(SFPunchout *)self urls];
            if (v57)
            {
              long long v28 = [(SFPunchout *)self urls];
              [(SFPunchout *)v6 urls];
              v54 = v56 = v28;
              if (!objc_msgSend(v28, "isEqual:"))
              {
                LOBYTE(v12) = 0;
                uint64_t v34 = v57;
                goto LABEL_70;
              }
              v55 = v21;
            }
            else
            {
              v55 = v21;
            }
            long long v29 = [(SFPunchout *)self userActivityData];
            long long v30 = [(SFPunchout *)v6 userActivityData];
            if ((v29 == 0) != (v30 != 0))
            {
              v53 = v30;
              uint64_t v31 = [(SFPunchout *)self userActivityData];
              v52 = v29;
              if (v31)
              {
                objc_super v32 = [(SFPunchout *)self userActivityData];
                v50 = [(SFPunchout *)v6 userActivityData];
                v51 = v32;
                if (!objc_msgSend(v32, "isEqual:"))
                {
                  LOBYTE(v12) = 0;
                  v38 = (void *)v31;
                  v21 = v55;
LABEL_68:

LABEL_69:
                  uint64_t v34 = v57;
                  if (!v57)
                  {
LABEL_71:

                    if (v61)
                    {
                    }
                    if (v21)
                    {
                    }
LABEL_46:
                    v11 = v67;
                    uint64_t v10 = v68;
                    if (!v9)
                    {
LABEL_48:

                      goto LABEL_49;
                    }
LABEL_47:

                    goto LABEL_48;
                  }
LABEL_70:

                  goto LABEL_71;
                }
                v49 = (void *)v31;
              }
              else
              {
                v49 = 0;
              }
              v35 = [(SFPunchout *)self actionTarget];
              v36 = [(SFPunchout *)v6 actionTarget];
              if ((v35 == 0) == (v36 != 0))
              {

                LOBYTE(v12) = 0;
                v21 = v55;
                goto LABEL_67;
              }
              v47 = v36;
              [(SFPunchout *)self actionTarget];
              v21 = v55;
              uint64_t v46 = v45 = v35;
              if (!v46
                || ([(SFPunchout *)self actionTarget],
                    v48 = objc_claimAutoreleasedReturnValue(),
                    [(SFPunchout *)v6 actionTarget],
                    v44 = objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v48, "isEqual:")))
              {
                BOOL v39 = [(SFPunchout *)self isRunnableInBackground];
                if (v39 == [(SFPunchout *)v6 isRunnableInBackground]
                  && (BOOL v40 = [(SFPunchout *)self hasClip], v40 == [(SFPunchout *)v6 hasClip]))
                {
                  BOOL v42 = [(SFPunchout *)self forceOpenInBrowser];
                  BOOL v12 = v42 ^ [(SFPunchout *)v6 forceOpenInBrowser] ^ 1;
                  BOOL v41 = v12;
                }
                else
                {
                  LOBYTE(v12) = 0;
                  BOOL v41 = 0;
                }
                v37 = (void *)v46;
                if (!v46)
                {
                  v43 = v47;
                  LOBYTE(v12) = v41;
                  goto LABEL_66;
                }
              }
              else
              {
                LOBYTE(v12) = 0;
                v37 = (void *)v46;
              }

              v43 = v47;
LABEL_66:

LABEL_67:
              v38 = v49;
              if (!v49) {
                goto LABEL_69;
              }
              goto LABEL_68;
            }

            if (v57)
            {
            }
            v21 = v55;
            v27 = v58;
          }

          if (v61)
          {
          }
          v19 = v62;
          v20 = v63;
        }

        if (v21)
        {
        }
        id v13 = v65;
        uint64_t v14 = v66;
      }

      goto LABEL_44;
    }
    LOBYTE(v12) = 0;
  }
LABEL_50:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFPunchout *)self name];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setName:v6];

  v7 = [(SFPunchout *)self bundleIdentifier];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setBundleIdentifier:v8];

  v9 = [(SFPunchout *)self label];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setLabel:v10];

  v11 = [(SFPunchout *)self urls];
  BOOL v12 = (void *)[v11 copy];
  [v4 setUrls:v12];

  id v13 = [(SFPunchout *)self userActivityData];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setUserActivityData:v14];

  uint64_t v15 = [(SFPunchout *)self actionTarget];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setActionTarget:v16];

  objc_msgSend(v4, "setIsRunnableInBackground:", -[SFPunchout isRunnableInBackground](self, "isRunnableInBackground"));
  objc_msgSend(v4, "setHasClip:", -[SFPunchout hasClip](self, "hasClip"));
  objc_msgSend(v4, "setForceOpenInBrowser:", -[SFPunchout forceOpenInBrowser](self, "forceOpenInBrowser"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPunchout alloc] initWithFacade:self];
  v3 = [(_SFPBPunchout *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPunchout alloc] initWithFacade:self];
  v3 = [(_SFPBPunchout *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBPunchout alloc] initWithFacade:self];
  v5 = [(_SFPBPunchout *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFPunchout)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBPunchout alloc] initWithData:v5];
  v7 = [(SFPunchout *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasForceOpenInBrowser
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setForceOpenInBrowser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_forceOpenInBrowser = a3;
}

- (BOOL)hasHasClip
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasClip:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hasClip = a3;
}

- (BOOL)hasIsRunnableInBackground
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsRunnableInBackground:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isRunnableInBackground = a3;
}

- (BOOL)canOpenURL:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F223E0];
  id v4 = a3;
  v5 = [v3 defaultWorkspace];
  char v6 = [v5 isApplicationAvailableToOpenURL:v4 error:0];

  return v6;
}

- (NSURL)preferredOpenableURL
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(SFPunchout *)self cachedOpenableURL];

  if (!v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [(SFPunchout *)self urls];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([(SFPunchout *)self canOpenURL:v10])
          {
            [(SFPunchout *)self setCachedOpenableURL:v10];
            id v4 = v10;

            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    v11 = [(SFPunchout *)self urls];
    BOOL v12 = [v11 firstObject];
    [(SFPunchout *)self setCachedOpenableURL:v12];
  }
  id v4 = [(SFPunchout *)self cachedOpenableURL];
LABEL_13:
  return (NSURL *)v4;
}

+ (SFPunchout)punchoutWithURLs:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(SFPunchout);
  [(SFPunchout *)v4 setUrls:v3];

  return v4;
}

+ (SFPunchout)punchoutWithURL:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v8 = a3;
    id v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = a3;
    v5 = [v3 arrayWithObjects:&v8 count:1];
    uint64_t v6 = +[SFPunchout punchoutWithURLs:](SFPunchout, "punchoutWithURLs:", v5, v8, v9);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (SFPunchout *)v6;
}

@end