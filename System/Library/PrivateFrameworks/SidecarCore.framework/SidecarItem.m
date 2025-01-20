@interface SidecarItem
- (BOOL)conformsToType:(id)a3;
- (NSData)data;
- (NSString)type;
- (SidecarItem)initWithData:(id)a3 type:(id)a4;
- (SidecarItem)initWithObject:(id)a3 type:(id)a4;
- (UTType)uniformType;
- (id)debugDescription;
- (id)description;
- (id)objectValue;
@end

@implementation SidecarItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (UTType)uniformType
{
  v2 = (void *)MEMORY[0x263F1D920];
  v3 = [(SidecarItem *)self type];
  v4 = [v2 typeWithIdentifier:v3];

  return (UTType *)v4;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(SidecarItem *)self type];
  v7 = [(SidecarItem *)self data];
  v8 = [v3 stringWithFormat:@"<%@: %@ (%lu bytes)>", v5, v6, objc_msgSend(v7, "length")];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SidecarItem *)self type];
  v5 = [(SidecarItem *)self data];
  v6 = [v3 stringWithFormat:@"<%@ (%lu bytes)>", v4, objc_msgSend(v5, "length")];

  return v6;
}

- (BOOL)conformsToType:(id)a3
{
  v4 = [MEMORY[0x263F1D920] _typeWithIdentifier:a3 allowUndeclared:1];
  v5 = [(SidecarItem *)self uniformType];
  char v6 = [v5 conformsToType:v4];

  return v6;
}

- (id)objectValue
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [(SidecarItem *)self data];
  id v13 = 0;
  v3 = SidecarOPACKDecode(v2, &v13);
  id v4 = v13;

  id v5 = v4;
  if (v5)
  {
    v7 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v7)
    {
      log = v7;
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      v7 = log;
      if (v8)
      {
        v9 = [v5 domain];
        uint64_t v10 = [v5 code];
        v11 = [v5 localizedDescription];
        *(_DWORD *)buf = 138543875;
        v15 = v9;
        __int16 v16 = 2048;
        uint64_t v17 = v10;
        __int16 v18 = 2113;
        v19 = v11;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v7 = log;
      }
    }
  }

  return v3;
}

- (SidecarItem)initWithObject:(id)a3 type:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v17 = 0;
  v7 = SidecarOPACKEncode(a3, &v17);
  id v8 = v17;
  v9 = v8;
  if (!v7 || v8)
  {
    uint64_t v10 = (void *)MEMORY[0x263EFF940];
    uint64_t v11 = *MEMORY[0x263F08160];
    v12 = [v8 localizedDescription];
    uint64_t v18 = *MEMORY[0x263F08608];
    v19[0] = v9;
    id v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v14 = [v10 exceptionWithName:v11 reason:v12 userInfo:v13];
    [v14 raise];
  }
  v15 = [(SidecarItem *)self initWithData:v7 type:v6];

  return v15;
}

- (SidecarItem)initWithData:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SidecarItem;
  v9 = [(SidecarItem *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_type, a4);
  }

  return v10;
}

@end