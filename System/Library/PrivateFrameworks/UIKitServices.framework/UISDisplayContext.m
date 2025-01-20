@interface UISDisplayContext
+ (id)defaultContext;
- (BOOL)isEqual:(id)a3;
- (FBSDisplayConfiguration)displayConfiguration;
- (NSString)description;
- (UISApplicationSupportDisplayEdgeInfo)displayEdgeInfo;
- (UISDisplayContext)initWithDisplayConfiguration:(id)a3;
- (UISDisplayContext)initWithDisplayConfiguration:(id)a3 displayEdgeInfo:(id)a4;
- (UISDisplayContext)initWithDisplayConfiguration:(id)a3 displayEdgeInfo:(id)a4 exclusionArea:(id)a5;
- (UISDisplayContext)initWithXPCDictionary:(id)a3;
- (UISDisplayShape)exclusionArea;
- (id)_initWithDisplayContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)artworkSubtype;
- (unint64_t)hash;
- (unint64_t)userInterfaceStyle;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation UISDisplayContext

+ (id)defaultContext
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v3 = (void *)_MergedGlobals_16;
  uint64_t v13 = _MergedGlobals_16;
  if (!_MergedGlobals_16)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getCADisplayClass_block_invoke;
    v9[3] = &unk_1E5735260;
    v9[4] = &v10;
    __getCADisplayClass_block_invoke((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v10, 8);
  v5 = [v4 mainDisplay];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F62918]) initWithCADisplay:v5];
    if (v6)
    {
      v7 = (void *)[objc_alloc((Class)a1) initWithDisplayConfiguration:v6];
      goto LABEL_8;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (UISDisplayContext)initWithDisplayConfiguration:(id)a3
{
  return [(UISDisplayContext *)self initWithDisplayConfiguration:a3 displayEdgeInfo:0 exclusionArea:0];
}

- (UISDisplayContext)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISDisplayContext;
  v5 = [(UISDisplayContext *)&v13 init];
  if (v5)
  {
    uint64_t v6 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    displayConfiguration = v5->_displayConfiguration;
    v5->_displayConfiguration = (FBSDisplayConfiguration *)v6;

    uint64_t v8 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    displayEdgeInfo = v5->_displayEdgeInfo;
    v5->_displayEdgeInfo = (UISApplicationSupportDisplayEdgeInfo *)v8;

    v5->_artworkSubtype = xpc_dictionary_get_uint64(v4, "ArtworkSubtype");
    v5->_userInterfaceStyle = xpc_dictionary_get_uint64(v4, "UserInterfaceStyle");
    uint64_t v10 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    exclusionArea = v5->_exclusionArea;
    v5->_exclusionArea = (UISDisplayShape *)v10;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionArea, 0);
  objc_storeStrong((id *)&self->_displayEdgeInfo, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

- (UISDisplayContext)initWithDisplayConfiguration:(id)a3 displayEdgeInfo:(id)a4 exclusionArea:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UISDisplayContext;
  v11 = [(UISDisplayContext *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    displayConfiguration = v11->_displayConfiguration;
    v11->_displayConfiguration = (FBSDisplayConfiguration *)v12;

    uint64_t v14 = [v9 copy];
    displayEdgeInfo = v11->_displayEdgeInfo;
    v11->_displayEdgeInfo = (UISApplicationSupportDisplayEdgeInfo *)v14;

    v11->_artworkSubtype = 0;
    v11->_userInterfaceStyle = 0;
    uint64_t v16 = [v10 copy];
    exclusionArea = v11->_exclusionArea;
    v11->_exclusionArea = (UISDisplayShape *)v16;
  }
  return v11;
}

- (id)_initWithDisplayContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 displayConfiguration];
  uint64_t v6 = [v4 displayEdgeInfo];
  v7 = [v4 exclusionArea];
  id v8 = [(UISDisplayContext *)self initWithDisplayConfiguration:v5 displayEdgeInfo:v6 exclusionArea:v7];

  if (v8)
  {
    v8->_artworkSubtype = [v4 artworkSubtype];
    v8->_userInterfaceStyle = [v4 userInterfaceStyle];
  }

  return v8;
}

- (UISApplicationSupportDisplayEdgeInfo)displayEdgeInfo
{
  return self->_displayEdgeInfo;
}

- (unint64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (UISDisplayShape)exclusionArea
{
  return self->_exclusionArea;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (unint64_t)artworkSubtype
{
  return self->_artworkSubtype;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  xpc_dictionary_set_uint64(xdict, "ArtworkSubtype", self->_artworkSubtype);
  xpc_dictionary_set_uint64(xdict, "UserInterfaceStyle", self->_userInterfaceStyle);
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (UISDisplayContext)initWithDisplayConfiguration:(id)a3 displayEdgeInfo:(id)a4
{
  return [(UISDisplayContext *)self initWithDisplayConfiguration:a3 displayEdgeInfo:a4 exclusionArea:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [UISMutableDisplayContext alloc];
  return [(UISDisplayContext *)v4 _initWithDisplayContext:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UISDisplayContext *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if (v4 == self)
  {
    char v17 = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v5;
    v7 = [(UISDisplayContext *)self displayConfiguration];
    id v8 = [(UISDisplayContext *)v6 displayConfiguration];
    if ([v7 isEqual:v8])
    {
      id v9 = [(UISDisplayContext *)self displayEdgeInfo];
      id v10 = [(UISDisplayContext *)v6 displayEdgeInfo];
      if ([v9 isEqual:v10]
        && (unint64_t v11 = [(UISDisplayContext *)self artworkSubtype],
            v11 == [(UISDisplayContext *)v6 artworkSubtype])
        && (unint64_t v12 = [(UISDisplayContext *)self userInterfaceStyle],
            v12 == [(UISDisplayContext *)v6 userInterfaceStyle]))
      {
        objc_super v13 = [(UISDisplayContext *)self exclusionArea];
        uint64_t v14 = [(UISDisplayContext *)v6 exclusionArea];
        if (v13 == v14)
        {
          char v17 = 1;
        }
        else
        {
          v15 = [(UISDisplayContext *)self exclusionArea];
          [(UISDisplayContext *)v6 exclusionArea];
          uint64_t v16 = v19 = v13;
          char v17 = [v15 isEqual:v16];

          objc_super v13 = v19;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
LABEL_10:
    char v17 = 0;
  }
LABEL_16:

  return v17;
}

- (unint64_t)hash
{
  v3 = [(UISDisplayContext *)self displayConfiguration];
  uint64_t v4 = [v3 hash];
  v5 = [(UISDisplayContext *)self displayEdgeInfo];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(UISDisplayContext *)self artworkSubtype];
  unint64_t v8 = v7 ^ [(UISDisplayContext *)self userInterfaceStyle];
  id v9 = [(UISDisplayContext *)self exclusionArea];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_displayConfiguration withName:@"DisplayConfiguration"];
  id v5 = (id)[v3 appendObject:self->_displayEdgeInfo withName:@"DisplayEdgeInfo"];
  id v6 = (id)[v3 appendUnsignedInteger:self->_artworkSubtype withName:@"ArtworkSubtype"];
  id v7 = (id)[v3 appendUnsignedInteger:self->_userInterfaceStyle withName:@"UserInterfaceStyle"];
  id v8 = (id)[v3 appendObject:self->_exclusionArea withName:@"ExclusionArea"];
  id v9 = [v3 build];

  return (NSString *)v9;
}

@end