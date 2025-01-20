@interface NMSDownloadableItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isManuallyAdded;
- (NMSDownloadableItem)initWithMediaLibraryIdentifier:(id)a3 externalLibraryIdentifier:(id)a4 size:(unint64_t)a5 itemType:(unint64_t)a6 manuallyAdded:(BOOL)a7;
- (NSNumber)mediaLibraryIdentifier;
- (NSString)externalLibraryIdentifier;
- (id)description;
- (id)identifier;
- (unint64_t)hash;
- (unint64_t)itemType;
- (unint64_t)size;
@end

@implementation NMSDownloadableItem

- (NMSDownloadableItem)initWithMediaLibraryIdentifier:(id)a3 externalLibraryIdentifier:(id)a4 size:(unint64_t)a5 itemType:(unint64_t)a6 manuallyAdded:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NMSDownloadableItem;
  v15 = [(NMSDownloadableItem *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mediaLibraryIdentifier, a3);
    objc_storeStrong((id *)&v16->_externalLibraryIdentifier, a4);
    v16->_size = a5;
    v16->_itemType = a6;
    v16->_manuallyAdded = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NMSDownloadableItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        id v7 = [(NMSDownloadableItem *)self mediaLibraryIdentifier];
        id v8 = [(NMSDownloadableItem *)v6 mediaLibraryIdentifier];
        if (v7 == v8)
        {
        }
        else
        {
          int v9 = [v7 isEqual:v8];

          if (!v9)
          {
            BOOL v10 = 0;
LABEL_16:

            goto LABEL_17;
          }
        }
        id v11 = [(NMSDownloadableItem *)self externalLibraryIdentifier];
        id v12 = [(NMSDownloadableItem *)v6 externalLibraryIdentifier];
        if (v11 == v12)
        {
        }
        else
        {
          int v13 = [v11 isEqual:v12];

          if (!v13)
          {
            BOOL v10 = 0;
LABEL_15:

            goto LABEL_16;
          }
        }
        unint64_t v14 = [(NMSDownloadableItem *)self itemType];
        BOOL v10 = v14 == [(NMSDownloadableItem *)v6 itemType];
        goto LABEL_15;
      }
    }
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_mediaLibraryIdentifier hash];
  return [(NSString *)self->_externalLibraryIdentifier hash] ^ v3 ^ self->_itemType;
}

- (id)identifier
{
  if (self->_mediaLibraryIdentifier) {
    return self->_mediaLibraryIdentifier;
  }
  else {
    return &unk_26D51CED8;
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)NMSDownloadableItem;
  v4 = [(NMSDownloadableItem *)&v9 description];
  v5 = [(NMSDownloadableItem *)self mediaLibraryIdentifier];
  v6 = [(NMSDownloadableItem *)self externalLibraryIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@ - MLDB pid: %@ - PDB UUID %@ - size: %llu - type: %lu - manuallyAdded: %x>", v4, v5, v6, -[NMSDownloadableItem size](self, "size"), -[NMSDownloadableItem itemType](self, "itemType"), -[NMSDownloadableItem isManuallyAdded](self, "isManuallyAdded")];

  return v7;
}

- (NSNumber)mediaLibraryIdentifier
{
  return self->_mediaLibraryIdentifier;
}

- (NSString)externalLibraryIdentifier
{
  return self->_externalLibraryIdentifier;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (BOOL)isManuallyAdded
{
  return self->_manuallyAdded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalLibraryIdentifier, 0);

  objc_storeStrong((id *)&self->_mediaLibraryIdentifier, 0);
}

@end