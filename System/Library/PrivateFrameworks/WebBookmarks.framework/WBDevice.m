@interface WBDevice
+ (id)deviceWithParameters:(id)a3 unnamedTabGroups:(id)a4 profileIdentifier:(id)a5;
- (BOOL)isCloseRequestSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInserted;
- (BOOL)isRemoteDevice;
- (BOOL)needsSecureDelete;
- (NSArray)tabs;
- (NSArray)unnamedMutableTabGroups;
- (NSArray)unnamedTabGroups;
- (NSString)description;
- (NSString)deviceTypeIdentifier;
- (NSString)privacyPreservingDescription;
- (NSString)profileIdentifier;
- (NSString)serverID;
- (NSString)title;
- (NSString)uuid;
- (WBDevice)initWithBookmark:(id)a3;
- (WBDevice)initWithBookmark:(id)a3 unnamedTabGroups:(id)a4 profileIdentifier:(id)a5;
- (WBSCRDTPosition)syncPosition;
- (WebBookmark)bookmark;
- (id)copyWithZone:(_NSZone *)a3;
- (int)_identifier;
- (unint64_t)hash;
- (void)mergeWithDevice:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setSyncPosition:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnnamedMutableTabGroups:(id)a3;
@end

@implementation WBDevice

+ (id)deviceWithParameters:(id)a3 unnamedTabGroups:(id)a4 profileIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v8 isRemoteDevice]) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 3;
  }
  v12 = [WebBookmark alloc];
  v13 = [v8 deviceIdentifier];
  id v14 = [(WebBookmark *)v12 initFolderWithParentID:0 subtype:v11 deviceIdentifier:v13 collectionType:1];

  v15 = [v8 title];
  [v14 setTitle:v15];

  v16 = [v8 creationDeviceIdentifier];

  if (v16)
  {
    v17 = [v8 creationDeviceIdentifier];
    [v14 setCreationDeviceIdentifier:v17];
  }
  v18 = [v8 deviceTypeIdentifier];

  if (v18)
  {
    v19 = [v8 deviceTypeIdentifier];
    [v14 setDeviceTypeIdentifier:v19];
  }
  v20 = (void *)[objc_alloc((Class)a1) initWithBookmark:v14 unnamedTabGroups:v10 profileIdentifier:v9];

  return v20;
}

- (WBDevice)initWithBookmark:(id)a3 unnamedTabGroups:(id)a4 profileIdentifier:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)WBDevice;
  v12 = [(WBDevice *)&v29 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmark, a3);
    v13->_remoteDevice = [v9 subtype] == 4;
    uint64_t v14 = [v10 copy];
    unnamedTabGroups = v13->_unnamedTabGroups;
    v13->_unnamedTabGroups = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    profileIdentifier = v13->_profileIdentifier;
    v13->_profileIdentifier = (NSString *)v16;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v10;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22++), "setProfileIdentifier:", v11, (void)v25);
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v20);
    }

    v23 = v13;
  }

  return v13;
}

- (WBDevice)initWithBookmark:(id)a3
{
  return [(WBDevice *)self initWithBookmark:a3 unnamedTabGroups:MEMORY[0x263EFFA68] profileIdentifier:*MEMORY[0x263F66420]];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBDevice *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WBDevice *)v4 uuid];
      v6 = [(WBDevice *)self uuid];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSArray)tabs
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_unnamedTabGroups;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "tabs", (void)v12);
        id v10 = objc_msgSend(v9, "safari_filterObjectsUsingBlock:", &__block_literal_global_22);

        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

uint64_t __16__WBDevice_tabs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isBlank] ^ 1;
}

- (unint64_t)hash
{
  v2 = [(WBDevice *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)title
{
  return [(WebBookmark *)self->_bookmark title];
}

- (void)setTitle:(id)a3
{
}

- (NSString)uuid
{
  return [(WebBookmark *)self->_bookmark UUID];
}

- (int)_identifier
{
  return [(WebBookmark *)self->_bookmark identifier];
}

- (WBSCRDTPosition)syncPosition
{
  return [(WebBookmark *)self->_bookmark syncPosition];
}

- (void)setSyncPosition:(id)a3
{
}

- (BOOL)isInserted
{
  return [(WebBookmark *)self->_bookmark isInserted];
}

- (NSArray)unnamedTabGroups
{
  return self->_unnamedTabGroups;
}

- (BOOL)needsSecureDelete
{
  return 0;
}

- (BOOL)isCloseRequestSupported
{
  return 1;
}

- (NSString)serverID
{
  return [(WebBookmark *)self->_bookmark serverID];
}

- (NSString)deviceTypeIdentifier
{
  return [(WebBookmark *)self->_bookmark deviceTypeIdentifier];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (void *)[(WebBookmark *)self->_bookmark copy];
  uint64_t v6 = [+[WBDevice allocWithZone:a3] initWithBookmark:v5 unnamedTabGroups:self->_unnamedTabGroups profileIdentifier:self->_profileIdentifier];

  return v6;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WBDevice *)self _identifier];
  uint64_t v7 = [(WBDevice *)self title];
  id v8 = [(WBDevice *)self uuid];
  id v9 = [v3 stringWithFormat:@"<%@: %p identifier = %d; title = %@; uuid = %@>", v5, self, v6, v7, v8];;

  return (NSString *)v9;
}

- (NSString)privacyPreservingDescription
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WBDevice *)self _identifier];
  uint64_t v7 = [(WBDevice *)self uuid];
  id v8 = [v3 stringWithFormat:@"<%@: %p identifier = %d; uuid = %@>", v5, self, v6, v7];;

  return (NSString *)v8;
}

- (void)mergeWithDevice:(id)a3
{
  bookmark = self->_bookmark;
  id v4 = [a3 bookmark];
  [(WebBookmark *)bookmark mergeWithBookmark:v4];
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (NSArray)unnamedMutableTabGroups
{
  return self->_unnamedTabGroups;
}

- (void)setUnnamedMutableTabGroups:(id)a3
{
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (BOOL)isRemoteDevice
{
  return self->_remoteDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_unnamedTabGroups, 0);
}

@end