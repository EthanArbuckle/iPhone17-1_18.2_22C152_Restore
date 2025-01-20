@interface SFCommandButtonItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsDestructive;
- (BOOL)isDestructive;
- (BOOL)isEqual:(id)a3;
- (NSArray)previewButtonItems;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)title;
- (SFCommand)command;
- (SFCommandButtonItem)initWithCoder:(id)a3;
- (SFCommandButtonItem)initWithProtobuf:(id)a3;
- (SFImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCommand:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsDestructive:(BOOL)a3;
- (void)setPreviewButtonItems:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFCommandButtonItem

- (SFCommandButtonItem)initWithProtobuf:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SFCommandButtonItem;
  v5 = [(SFCommandButtonItem *)&v30 init];
  if (v5)
  {
    v6 = [v4 image];

    if (v6)
    {
      v7 = [SFImage alloc];
      v8 = [v4 image];
      v9 = [(SFImage *)v7 initWithProtobuf:v8];
      [(SFCommandButtonItem *)v5 setImage:v9];
    }
    v10 = [v4 title];

    if (v10)
    {
      v11 = [v4 title];
      [(SFCommandButtonItem *)v5 setTitle:v11];
    }
    v12 = [v4 command];

    if (v12)
    {
      v13 = [SFCommand alloc];
      v14 = [v4 command];
      v15 = [(SFCommand *)v13 initWithProtobuf:v14];
      [(SFCommandButtonItem *)v5 setCommand:v15];
    }
    v16 = [v4 previewButtonItems];
    if (v16) {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v17 = 0;
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v18 = objc_msgSend(v4, "previewButtonItems", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [[SFButtonItem alloc] initWithProtobuf:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          if (v23) {
            [v17 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v20);
    }

    [(SFCommandButtonItem *)v5 setPreviewButtonItems:v17];
    if ([v4 isDestructive]) {
      -[SFCommandButtonItem setIsDestructive:](v5, "setIsDestructive:", [v4 isDestructive]);
    }
    if ([v4 uniqueId]) {
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v24 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewButtonItems, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void)setPreviewButtonItems:(id)a3
{
}

- (NSArray)previewButtonItems
{
  return self->_previewButtonItems;
}

- (void)setCommand:(id)a3
{
}

- (SFCommand)command
{
  return self->_command;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setImage:(id)a3
{
}

- (SFImage)image
{
  return self->_image;
}

- (unint64_t)hash
{
  v15.receiver = self;
  v15.super_class = (Class)SFCommandButtonItem;
  unint64_t v3 = [(SFButtonItem *)&v15 hash];
  id v4 = [(SFCommandButtonItem *)self image];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCommandButtonItem *)self title];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFCommandButtonItem *)self command];
  uint64_t v9 = v7 ^ [v8 hash];
  v10 = [(SFCommandButtonItem *)self previewButtonItems];
  uint64_t v11 = v9 ^ [v10 hash];
  unint64_t v12 = v11 ^ [(SFCommandButtonItem *)self isDestructive] ^ v3;
  unint64_t v13 = v12 ^ [(SFButtonItem *)self uniqueId];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFCommandButtonItem *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    if ([(SFCommandButtonItem *)v4 isMemberOfClass:objc_opt_class()])
    {
      v43.receiver = self;
      v43.super_class = (Class)SFCommandButtonItem;
      if ([(SFButtonItem *)&v43 isEqual:v4])
      {
        uint64_t v5 = v4;
        v6 = [(SFCommandButtonItem *)self image];
        uint64_t v7 = [(SFCommandButtonItem *)v5 image];
        if ((v6 == 0) == (v7 != 0))
        {
          BOOL v10 = 0;
LABEL_38:

          goto LABEL_39;
        }
        v8 = [(SFCommandButtonItem *)self image];
        if (v8)
        {
          uint64_t v9 = [(SFCommandButtonItem *)self image];
          v41 = [(SFCommandButtonItem *)v5 image];
          if (!objc_msgSend(v9, "isEqual:"))
          {
            BOOL v10 = 0;
            goto LABEL_36;
          }
          v40 = v9;
        }
        v42 = [(SFCommandButtonItem *)self title];
        uint64_t v11 = [(SFCommandButtonItem *)v5 title];
        if ((v42 == 0) != (v11 != 0))
        {
          uint64_t v12 = [(SFCommandButtonItem *)self title];
          if (v12)
          {
            unint64_t v13 = (void *)v12;
            v14 = [(SFCommandButtonItem *)self title];
            [(SFCommandButtonItem *)v5 title];
            v39 = v37 = v14;
            if (!objc_msgSend(v14, "isEqual:"))
            {
              BOOL v10 = 0;
              uint64_t v19 = v39;
              goto LABEL_33;
            }
            v38 = v13;
          }
          else
          {
            v38 = 0;
          }
          objc_super v15 = [(SFCommandButtonItem *)self command];
          v16 = [(SFCommandButtonItem *)v5 command];
          if ((v15 == 0) != (v16 != 0))
          {
            v35 = v15;
            v36 = v16;
            id v17 = [(SFCommandButtonItem *)self command];
            if (v17)
            {
              v18 = [(SFCommandButtonItem *)self command];
              v33 = [(SFCommandButtonItem *)v5 command];
              v34 = v18;
              if (!objc_msgSend(v18, "isEqual:"))
              {
                BOOL v10 = 0;
                unint64_t v13 = v38;
                uint64_t v19 = v39;
                goto LABEL_31;
              }
            }
            uint64_t v20 = [(SFCommandButtonItem *)self previewButtonItems];
            uint64_t v21 = [(SFCommandButtonItem *)v5 previewButtonItems];
            if ((v20 == 0) == (v21 != 0))
            {

              BOOL v10 = 0;
              unint64_t v13 = v38;
              uint64_t v19 = v39;
              if (!v17) {
                goto LABEL_32;
              }
              goto LABEL_31;
            }
            v31 = v21;
            uint64_t v32 = v20;
            [(SFCommandButtonItem *)self previewButtonItems];
            v30 = uint64_t v19 = v39;
            if (!v30
              || ([(SFCommandButtonItem *)self previewButtonItems],
                  v22 = objc_claimAutoreleasedReturnValue(),
                  [(SFCommandButtonItem *)v5 previewButtonItems],
                  long long v28 = v22,
                  uint64_t v29 = objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v22, "isEqual:")))
            {
              BOOL v26 = [(SFCommandButtonItem *)self isDestructive];
              if (v26 == [(SFCommandButtonItem *)v5 isDestructive])
              {
                unint64_t v27 = [(SFButtonItem *)self uniqueId];
                BOOL v10 = v27 == [(SFButtonItem *)v5 uniqueId];
              }
              else
              {
                BOOL v10 = 0;
              }
              v23 = (void *)v29;
              v24 = (void *)v30;
              if (!v30)
              {
LABEL_45:

                unint64_t v13 = v38;
                if (!v17)
                {
LABEL_32:

                  if (!v13)
                  {
LABEL_34:

LABEL_35:
                    uint64_t v9 = v40;
                    if (!v8)
                    {
LABEL_37:

                      goto LABEL_38;
                    }
LABEL_36:

                    goto LABEL_37;
                  }
LABEL_33:

                  goto LABEL_34;
                }
LABEL_31:

                goto LABEL_32;
              }
            }
            else
            {
              BOOL v10 = 0;
              v23 = (void *)v29;
              v24 = (void *)v30;
            }

            goto LABEL_45;
          }

          if (v38)
          {
          }
        }

        BOOL v10 = 0;
        goto LABEL_35;
      }
    }
    BOOL v10 = 0;
  }
LABEL_39:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SFCommandButtonItem;
  id v4 = [(SFButtonItem *)&v14 copyWithZone:a3];
  uint64_t v5 = [(SFCommandButtonItem *)self image];
  v6 = (void *)[v5 copy];
  [v4 setImage:v6];

  uint64_t v7 = [(SFCommandButtonItem *)self title];
  v8 = (void *)[v7 copy];
  [v4 setTitle:v8];

  uint64_t v9 = [(SFCommandButtonItem *)self command];
  BOOL v10 = (void *)[v9 copy];
  [v4 setCommand:v10];

  uint64_t v11 = [(SFCommandButtonItem *)self previewButtonItems];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setPreviewButtonItems:v12];

  objc_msgSend(v4, "setIsDestructive:", -[SFCommandButtonItem isDestructive](self, "isDestructive"));
  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCommandButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCommandButtonItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCommandButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCommandButtonItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBCommandButtonItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBCommandButtonItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCommandButtonItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBCommandButtonItem alloc] initWithData:v5];
  uint64_t v7 = [(SFCommandButtonItem *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIsDestructive
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsDestructive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isDestructive = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end