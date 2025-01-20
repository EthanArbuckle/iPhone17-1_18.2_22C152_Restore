@interface SMHandle
+ (BOOL)supportsSecureCoding;
+ (int64_t)getSMHandleTypeWithHandle:(id)a3;
- (BOOL)hasEqualPrimaryHandle:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)secondaryHandles;
- (NSString)primaryHandle;
- (SMHandle)initWithCoder:(id)a3;
- (SMHandle)initWithDictionary:(id)a3;
- (SMHandle)initWithPrimaryHandle:(id)a3 secondaryHandles:(id)a4;
- (id)canonicalizedHandle;
- (id)description;
- (id)descriptionDictionary;
- (id)outputToDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMHandle

- (SMHandle)initWithPrimaryHandle:(id)a3 secondaryHandles:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SMHandle;
  v9 = [(SMHandle *)&v13 init];
  p_isa = (id *)&v9->super.isa;
  if (!v9) {
    goto LABEL_5;
  }
  v11 = 0;
  if (v7 && v8)
  {
    objc_storeStrong((id *)&v9->_primaryHandle, a3);
    objc_storeStrong(p_isa + 2, a4);
LABEL_5:
    v11 = p_isa;
  }

  return v11;
}

- (BOOL)hasEqualPrimaryHandle:(id)a3
{
  id v4 = a3;
  v5 = [(SMHandle *)self primaryHandle];
  v6 = [v4 primaryHandle];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (id)canonicalizedHandle
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [(SMHandle *)self primaryHandle];
  id v4 = +[SMHandleFormatting canonicalIDSAddressForAddress:v3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(SMHandle *)self primaryHandle];
  }
  id v7 = v6;

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v9 = [(SMHandle *)self secondaryHandles];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = +[SMHandleFormatting canonicalIDSAddressForAddress:v14];
        v16 = (void *)v15;
        if (v15) {
          v17 = (void *)v15;
        }
        else {
          v17 = v14;
        }
        id v18 = v17;

        if (v18) {
          [v8 addObject:v18];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  v19 = [[SMHandle alloc] initWithPrimaryHandle:v7 secondaryHandles:v8];
  return v19;
}

+ (int64_t)getSMHandleTypeWithHandle:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "+[SMHandle getSMHandleTypeWithHandle:]";
      __int16 v9 = 1024;
      int v10 = 54;
      _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle (in %s:%d)", (uint8_t *)&v7, 0x12u);
    }
  }
  if (MEMORY[0x261167CC0](v3))
  {
    int64_t v5 = 1;
  }
  else if (IMStringIsEmail())
  {
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)descriptionDictionary
{
  v6[1] = *MEMORY[0x263EF8340];
  int64_t v5 = @"__kSMPrimaryHandleKey";
  v2 = [(SMHandle *)self primaryHandle];
  v6[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(SMHandle *)self descriptionDictionary];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMPrimaryHandleKey"];
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  __int16 v9 = [v4 decodeObjectOfClasses:v8 forKey:@"__kSMSecondaryHandlesKey"];

  int v10 = [(SMHandle *)self initWithPrimaryHandle:v5 secondaryHandles:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  primaryHandle = self->_primaryHandle;
  id v5 = a3;
  [v5 encodeObject:primaryHandle forKey:@"__kSMPrimaryHandleKey"];
  [v5 encodeObject:self->_secondaryHandles forKey:@"__kSMSecondaryHandlesKey"];
}

- (SMHandle)initWithDictionary:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 valueForKey:@"__kSMPrimaryHandleKey"];
  id v6 = [v4 valueForKey:@"__kSMSecondaryHandlesKey"];

  if ([v5 length])
  {
    uint64_t v7 = [[SMHandle alloc] initWithPrimaryHandle:v5 secondaryHandles:v6];
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[SMHandle initWithDictionary:]";
      _os_log_error_impl(&dword_25B6E0000, v8, OS_LOG_TYPE_ERROR, "%s, toHandleString is empty", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)outputToDictionary
{
  id v3 = objc_opt_new();
  id v4 = [(SMHandle *)self primaryHandle];
  [v3 setObject:v4 forKey:@"__kSMPrimaryHandleKey"];

  id v5 = [(SMHandle *)self secondaryHandles];
  [v3 setObject:v5 forKey:@"__kSMSecondaryHandlesKey"];

  return v3;
}

- (unint64_t)hash
{
  id v3 = [(SMHandle *)self primaryHandle];
  uint64_t v4 = [v3 hash];
  id v5 = [(SMHandle *)self secondaryHandles];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (SMHandle *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v6 = v5;
      uint64_t v7 = [(SMHandle *)self primaryHandle];
      id v8 = [(SMHandle *)v6 primaryHandle];
      if (v7 != v8)
      {
        __int16 v9 = [(SMHandle *)self primaryHandle];
        id v3 = [(SMHandle *)v6 primaryHandle];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      uint64_t v11 = [(SMHandle *)self secondaryHandles];
      uint64_t v12 = [(SMHandle *)v6 secondaryHandles];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        objc_super v13 = [(SMHandle *)self secondaryHandles];
        v14 = [(SMHandle *)v6 secondaryHandles];
        char v10 = [v13 isEqual:v14];
      }
      __int16 v9 = v16;
      if (v7 == v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_15:

  return v10;
}

- (NSString)primaryHandle
{
  return self->_primaryHandle;
}

- (NSArray)secondaryHandles
{
  return self->_secondaryHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryHandles, 0);
  objc_storeStrong((id *)&self->_primaryHandle, 0);
}

@end