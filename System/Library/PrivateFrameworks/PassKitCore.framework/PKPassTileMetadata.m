@interface PKPassTileMetadata
+ (BOOL)isGroupType:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_createDictionaryMapForDictionaries:(id)a3;
+ (id)_createMetadataForType:(int64_t)a3 identifier:(id)a4 context:(int64_t)a5;
+ (id)_createWithDictionary:(id)a3 privateDictionaryMap:(id)a4 privateDictionary:(id *)a5 context:(int64_t)a6;
- (BOOL)_setUpWithDictionary:(id)a3 privateDictionary:(id)a4;
- (BOOL)isGroupType;
- (BOOL)isSelectable;
- (BOOL)showInPrearm;
- (NSString)identifier;
- (PKPassTileMetadata)init;
- (PKPassTileMetadata)initWithCoder:(id)a3;
- (PKPassTileMetadataHorizontalFlowGroup)metadataTypeHorizontalFlowGroup;
- (PKPassTileMetadataVehicleFunction)metadataTypeVehicleFunction;
- (PKPassTileMetadataVerticalFlowGroup)metadataTypeVerticalFlowGroup;
- (int64_t)context;
- (int64_t)preferredStyle;
- (int64_t)type;
- (void)_initWithIdentifier:(uint64_t)a3 type:(uint64_t)a4 context:;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setPreferredStyle:(int64_t)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setShowInPrearm:(BOOL)a3;
@end

@implementation PKPassTileMetadata

+ (id)_createDictionaryMapForDictionaries:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "PKStringForKey:", @"identifier", (void)v14);
          if (v11) {
            [v4 setObject:v10 forKeyedSubscript:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    v12 = (void *)[v4 copy];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_createWithDictionary:(id)a3 privateDictionaryMap:(id)a4 privateDictionary:(id *)a5 context:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    uint64_t v19 = 0;
    v11 = [v9 PKStringForKey:@"type"];
    int v12 = PKPassTileTypeFromString(v11, &v19);

    id v13 = 0;
    if (v12)
    {
      long long v14 = [v9 PKStringForKey:@"identifier"];
      if (v14)
      {
        long long v15 = [v10 objectForKeyedSubscript:v14];
        id v16 = +[PKPassTileMetadata _createMetadataForType:v19 identifier:v14 context:a6];
        long long v17 = v16;
        if (v16 && [v16 _setUpWithDictionary:v9 privateDictionary:v15])
        {
          if (a5) {
            objc_storeStrong(a5, v15);
          }
          id v13 = v17;
        }
        else
        {
          id v13 = 0;
        }
      }
      else
      {
        id v13 = 0;
      }
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)_createMetadataForType:(int64_t)a3 identifier:(id)a4 context:(int64_t)a5
{
  id v7 = a4;
  if ((unint64_t)a3 > 3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = objc_alloc(*off_1E56EC408[a3]);
  }
  id v9 = -[PKPassTileMetadata _initWithIdentifier:type:context:](v8, v7, a3, a5);

  return v9;
}

- (void)_initWithIdentifier:(uint64_t)a3 type:(uint64_t)a4 context:
{
  id v8 = a2;
  id v9 = v8;
  if (a1 && v8)
  {
    v14.receiver = a1;
    v14.super_class = (Class)PKPassTileMetadata;
    id v10 = objc_msgSendSuper2(&v14, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)v10 + 2, a2);
      v11[3] = a3;
      v11[5] = a4;
    }
    a1 = v11;
    int v12 = a1;
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (PKPassTileMetadata)init
{
  return 0;
}

- (BOOL)_setUpWithDictionary:(id)a3 privateDictionary:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 PKStringForKey:@"preferredStyle"];
  self->_preferredStyle = PKPassTileStyleFromString(v6);

  self->_selectable = [v5 PKBoolForKey:@"selectable"];
  id v7 = [v5 PKNumberForKey:@"showInPrearm"];

  id v8 = (void *)MEMORY[0x1E4F1CC38];
  if (v7) {
    id v8 = v7;
  }
  id v9 = v8;

  char v10 = [v9 BOOLValue];
  self->_showInPrearm = v10;
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  unint64_t v16 = 0;
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  char v7 = PKPassTileTypeFromString(v6, &v16);

  if (v7 & 1) != 0 && v16 <= 3 && objc_opt_class() && (objc_opt_isKindOfClass())
  {
    uint64_t v8 = v16;
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextIdentifier"];
    uint64_t v10 = PKPassTileContextFromString(v9);
    v11 = -[PKPassTileMetadata _initWithIdentifier:type:context:](self, v5, v8, v10);

    if (v11)
    {
      int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredStyle"];
      v11[4] = PKPassTileStyleFromString(v12);

      *((unsigned char *)v11 + 8) = [v4 decodeBoolForKey:@"selectable"];
      *((unsigned char *)v11 + 9) = [v4 decodeBoolForKey:@"showInPrearm"];
    }
    self = v11;
    id v13 = self;
  }
  else
  {
    objc_super v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKPassTileMetadataDecoder" code:0 userInfo:0];
    [v4 failWithError:v14];

    id v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v12 = a3;
  [v12 encodeObject:identifier forKey:@"identifier"];
  unint64_t type = self->_type;
  if (type > 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_1E56EC440[type];
  }
  [v12 encodeObject:v6 forKey:@"type"];
  int64_t preferredStyle = self->_preferredStyle;
  uint64_t v8 = @"compact";
  if (preferredStyle != 1) {
    uint64_t v8 = 0;
  }
  if (preferredStyle) {
    id v9 = v8;
  }
  else {
    id v9 = @"default";
  }
  [v12 encodeObject:v9 forKey:@"preferredStyle"];
  [v12 encodeBool:self->_selectable forKey:@"selectable"];
  [v12 encodeBool:self->_showInPrearm forKey:@"showInPrearm"];
  uint64_t v10 = 0;
  unint64_t v11 = self->_context - 1;
  if (v11 <= 2) {
    uint64_t v10 = off_1E56EC428[v11];
  }
  [v12 encodeObject:v10 forKey:@"contextIdentifier"];
}

- (PKPassTileMetadataVehicleFunction)metadataTypeVehicleFunction
{
  if (self->_type != 1) {
    self = 0;
  }
  return (PKPassTileMetadataVehicleFunction *)self;
}

- (PKPassTileMetadataHorizontalFlowGroup)metadataTypeHorizontalFlowGroup
{
  if (self->_type != 2) {
    self = 0;
  }
  return (PKPassTileMetadataHorizontalFlowGroup *)self;
}

- (PKPassTileMetadataVerticalFlowGroup)metadataTypeVerticalFlowGroup
{
  if (self->_type != 3) {
    self = 0;
  }
  return (PKPassTileMetadataVerticalFlowGroup *)self;
}

- (BOOL)isGroupType
{
  return +[PKPassTileMetadata isGroupType:self->_type];
}

+ (BOOL)isGroupType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_int64_t preferredStyle = a3;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (void)setSelectable:(BOOL)a3
{
  self->_selectable = a3;
}

- (BOOL)showInPrearm
{
  return self->_showInPrearm;
}

- (void)setShowInPrearm:(BOOL)a3
{
  self->_showInPrearm = a3;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
}

@end