@interface SBSApplicationShortcutCustomImageIcon
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemplate;
- (NSData)imageData;
- (SBSApplicationShortcutCustomImageIcon)initWithImageData:(id)a3 dataType:(int64_t)a4;
- (SBSApplicationShortcutCustomImageIcon)initWithImageData:(id)a3 dataType:(int64_t)a4 isTemplate:(BOOL)a5;
- (SBSApplicationShortcutCustomImageIcon)initWithImagePNGData:(id)a3;
- (SBSApplicationShortcutCustomImageIcon)initWithXPCDictionary:(id)a3;
- (id)_initForSubclass;
- (int64_t)dataType;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SBSApplicationShortcutCustomImageIcon

- (SBSApplicationShortcutCustomImageIcon)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = xpc_dictionary_get_value(v4, "customImageIconImageData");
    if ((v6
       || (xpc_dictionary_get_value(v5, "customIconPNGData"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
      && MEMORY[0x192FC1100](v6) == MEMORY[0x1E4F14580])
    {
      v9 = (void *)MEMORY[0x1E4F1C9B8];
      bytes_ptr = xpc_data_get_bytes_ptr(v6);
      v7 = [v9 dataWithBytes:bytes_ptr length:xpc_data_get_length(v6)];
      int64_t int64 = xpc_dictionary_get_int64(v5, "customImageIconDataType");
      self = [(SBSApplicationShortcutCustomImageIcon *)self initWithImageData:v7 dataType:int64 isTemplate:xpc_dictionary_get_BOOL(v5, "customImageIconIsTemplate")];
      v8 = self;
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SBSApplicationShortcutCustomImageIcon)initWithImageData:(id)a3 dataType:(int64_t)a4 isTemplate:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSApplicationShortcutCustomImageIcon;
  v10 = [(SBSApplicationShortcutIcon *)&v13 _initForSubclass];
  v11 = (SBSApplicationShortcutCustomImageIcon *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 2, a3);
    v11->_dataType = a4;
    v11->_isTemplate = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSApplicationShortcutCustomImageIcon *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    v6 = [(SBSApplicationShortcutCustomImageIcon *)self imageData];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke;
    v20[3] = &unk_1E566CEC0;
    v7 = v4;
    v21 = v7;
    id v8 = (id)[v5 appendObject:v6 counterpart:v20];

    int64_t v9 = [(SBSApplicationShortcutCustomImageIcon *)self dataType];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke_2;
    v18[3] = &unk_1E566CEE8;
    v10 = v7;
    v19 = v10;
    id v11 = (id)[v5 appendInteger:v9 counterpart:v18];
    BOOL v12 = [(SBSApplicationShortcutCustomImageIcon *)self isTemplate];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke_3;
    v16[3] = &unk_1E566CF10;
    v17 = v10;
    id v13 = (id)[v5 appendBool:v12 counterpart:v16];
    char v14 = [v5 isEqual];
  }
  return v14;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    xpc_object_t xdict = v4;
    v5 = [(SBSApplicationShortcutCustomImageIcon *)self imageData];
    size_t v6 = [v5 length];
    if (v6) {
      xpc_dictionary_set_data(xdict, "customImageIconImageData", (const void *)[v5 bytes], v6);
    }
    xpc_dictionary_set_int64(xdict, "customImageIconDataType", [(SBSApplicationShortcutCustomImageIcon *)self dataType]);
    xpc_dictionary_set_BOOL(xdict, "customImageIconIsTemplate", [(SBSApplicationShortcutCustomImageIcon *)self isTemplate]);

    id v4 = xdict;
  }
}

- (BOOL)isTemplate
{
  return self->_isTemplate;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (int64_t)dataType
{
  return self->_dataType;
}

uint64_t __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isTemplate];
}

uint64_t __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataType];
}

uint64_t __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) imageData];
}

- (void).cxx_destruct
{
}

- (SBSApplicationShortcutCustomImageIcon)initWithImageData:(id)a3 dataType:(int64_t)a4
{
  return [(SBSApplicationShortcutCustomImageIcon *)self initWithImageData:a3 dataType:a4 isTemplate:0];
}

- (SBSApplicationShortcutCustomImageIcon)initWithImagePNGData:(id)a3
{
  return [(SBSApplicationShortcutCustomImageIcon *)self initWithImageData:a3 dataType:0 isTemplate:0];
}

- (id)_initForSubclass
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = (objc_class *)objc_opt_class();
  size_t v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%s is not a valid initializer. You must call -[%@ initWithImageData:dataType:isTemplate:].", "-[SBSApplicationShortcutCustomImageIcon _initForSubclass]", v6 format];

  return [(SBSApplicationShortcutCustomImageIcon *)self initWithImageData:0 dataType:0 isTemplate:0];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  uint64_t v4 = [(SBSApplicationShortcutCustomImageIcon *)self imageData];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = (id)[v3 appendInteger:-[SBSApplicationShortcutCustomImageIcon dataType](self, "dataType")];
  id v7 = [v3 appendBool:-[SBSApplicationShortcutCustomImageIcon isTemplate](self, "isTemplate")];
  unint64_t v8 = [v3 hash];

  return v8;
}

@end