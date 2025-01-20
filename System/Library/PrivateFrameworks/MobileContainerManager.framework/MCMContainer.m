@interface MCMContainer
+ (id)containerWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 existed:(BOOL *)a5 error:(id *)a6;
+ (id)containerWithIdentifier:(id)a3 error:(id *)a4;
+ (id)temporaryContainerWithIdentifier:(id)a3 existed:(BOOL *)a4 error:(id *)a5;
+ (int64_t)typeContainerClass;
- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainer:(id)a3;
- (BOOL)isTemporary;
- (BOOL)recreateDefaultStructureWithError:(id *)a3;
- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3;
- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (MCMContainer)init;
- (MCMContainer)initWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 existed:(BOOL *)a5 temp:(BOOL)a6 error:(id *)a7;
- (MCMContainer)initWithIdentifier:(id)a3 path:(id)a4 uniquePathComponent:(id)a5 uuid:(id)a6 personaUniqueString:(id)a7 uid:(unsigned int)a8 error:(id *)a9;
- (NSDictionary)info;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSURL)url;
- (NSUUID)uuid;
- (container_object_s)getLowLevelContainerObject;
- (container_object_s)thisContainer;
- (id)description;
- (id)destroyContainerWithCompletion:(id)a3;
- (id)infoValueForKey:(id)a3 error:(id *)a4;
- (int64_t)containerClass;
- (unint64_t)diskUsageWithError:(id *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)markDeleted;
@end

@implementation MCMContainer

- (MCMContainer)initWithIdentifier:(id)a3 path:(id)a4 uniquePathComponent:(id)a5 uuid:(id)a6 personaUniqueString:(id)a7 uid:(unsigned int)a8 error:(id *)a9
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  uint64_t v20 = [(id)objc_opt_class() typeContainerClass];
  if (!v20)
  {
    v28 = container_log_handle_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_226325000, v28, OS_LOG_TYPE_FAULT, "You cannot init this class directly. Instead, use a subclass e.g. MCMAppContainer", buf, 2u);
    }

    abort();
  }
  uint64_t v21 = v20;
  v30.receiver = self;
  v30.super_class = (Class)MCMContainer;
  v22 = [(MCMContainer *)&v30 init];
  v23 = v22;
  if (!v22)
  {
    id v25 = 0;
    goto LABEL_17;
  }
  if (v21 > 14 || !v15 || !v18 || (unint64_t)(gMCMContainerClassToContainerClass[v21] - 1) >= 0xE)
  {
    v26 = container_log_handle_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      _os_log_fault_impl(&dword_226325000, v26, OS_LOG_TYPE_FAULT, "Bad initializers: id: %@, UUID: %@, Class: %ld", buf, 0x20u);
    }

    id v25 = [MEMORY[0x263F087E8] errorWithDomain:@"MCMErrorDomain" code:31 userInfo:0];

    goto LABEL_12;
  }
  objc_storeStrong((id *)&v22->_identifier, a3);
  objc_storeStrong((id *)&v23->_uuid, a6);
  v23->_containerClass = v21;
  objc_storeStrong((id *)&v23->_personaUniqueString, a7);
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  [v18 getUUIDBytes:buf];
  [(NSString *)v23->_identifier UTF8String];
  [v16 fileSystemRepresentation];
  [v17 UTF8String];
  [(NSString *)v23->_personaUniqueString UTF8String];
  LOWORD(v29) = 0;
  uint64_t v24 = container_object_create();
  v23->_thisContainer = (container_object_s *)v24;
  if (!v24)
  {

    objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCMErrorDomain", 11, 0, 0, v29, 0, 0, 0);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v23 = 0;
    goto LABEL_13;
  }
  id v25 = 0;
LABEL_13:
  if (a9 && v25)
  {
    id v25 = v25;
    *a9 = v25;
  }
LABEL_17:

  return v23;
}

+ (id)containerWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 existed:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v10 createIfNecessary:v8 existed:a5 temp:0 error:a6];

  return v11;
}

- (MCMContainer)initWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 existed:(BOOL *)a5 temp:(BOOL)a6 error:(id *)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() typeContainerClass];
  if (!v10)
  {
    id v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)dst = 0;
      _os_log_fault_impl(&dword_226325000, v25, OS_LOG_TYPE_FAULT, "You cannot init this class directly. Instead, use a subclass e.g. MCMAppContainer", dst, 2u);
    }

    abort();
  }
  int64_t v11 = v10;
  v26.receiver = self;
  v26.super_class = (Class)MCMContainer;
  persona_unique_string = [(MCMContainer *)&v26 init];
  v13 = persona_unique_string;
  if (persona_unique_string)
  {
    id v14 = v9;
    [v14 UTF8String];
    uint64_t v15 = container_create_or_lookup_for_current_user();
    v13->_thisContainer = (container_object_s *)v15;
    memset(dst, 0, 16);
    if (v15)
    {
      uuid = (const unsigned __int8 *)container_object_get_uuid();
      uuid_copy(dst, uuid);
    }
    else
    {
      uuid_clear(dst);
    }
    if (uuid_is_null(dst))
    {

      persona_unique_string = [MEMORY[0x263F087E8] errorWithDomain:@"MCMErrorDomain" code:11 userInfo:0];
      v13 = 0;
    }
    else
    {
      uint64_t v18 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:dst];
      id v19 = v13->_uuid;
      v13->_uuid = (NSUUID *)v18;

      v13->_containerClass = v11;
      uint64_t v20 = [NSString stringWithString:v14];
      identifier = v13->_identifier;
      v13->_identifier = (NSString *)v20;

      personaUniqueString = v13->_personaUniqueString;
      v13->_personaUniqueString = 0;

      persona_unique_string = (MCMContainer *)container_get_persona_unique_string();
      if (persona_unique_string)
      {
        uint64_t v23 = [NSString stringWithUTF8String:persona_unique_string];
        uint64_t v24 = v13->_personaUniqueString;
        v13->_personaUniqueString = (NSString *)v23;

        persona_unique_string = 0;
      }
    }
    if (a7 && persona_unique_string)
    {
      persona_unique_string = persona_unique_string;
      *a7 = persona_unique_string;
    }
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4
{
  BOOL result = 0;
  if (a3 && a4) {
    BOOL result = [a3 isEqual:a4];
  }
  if (!((unint64_t)a3 | (unint64_t)a4)) {
    return 1;
  }
  return result;
}

- (id)description
{
  int64_t containerClass = self->_containerClass;
  BOOL v4 = containerClass <= 14 && (unint64_t)(gMCMContainerClassToContainerClass[containerClass] - 1) < 0xE;
  uuid = self->_uuid;
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  id v9 = (void *)v8;
  if (uuid && v4)
  {
    int64_t v10 = self->_containerClass;
    identifier = self->_identifier;
    v12 = self->_uuid;
    v13 = [(MCMContainer *)self url];
    BOOL v14 = [(MCMContainer *)self isTemporary];
    uint64_t v15 = [(MCMContainer *)self info];
    id v16 = [(MCMContainer *)self personaUniqueString];
    id v17 = [v6 stringWithFormat:@"<%@ (%ld) ID: %@ UUID: %@ URL: %@ isTemp: %d info: %@ persona: %@>", v9, v10, identifier, v12, v13, v14, v15, v16];
  }
  else
  {
    id v17 = [v6 stringWithFormat:@"<%@: deleted container>", v8];
  }

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_uuid hash];
  uint64_t v4 = container_class_normalized();
  return v4 ^ v3 ^ [(NSString *)self->_personaUniqueString hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MCMContainer *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MCMContainer *)self isEqualToContainer:v4];
    }
  }

  return v5;
}

- (BOOL)isEqualToContainer:(id)a3
{
  uint64_t v4 = a3;
  if ([(MCMContainer *)self _obj1:self->_uuid isEqualToObj2:v4[2]]
    && [(MCMContainer *)self _obj1:self->_personaUniqueString isEqualToObj2:v4[3]])
  {
    uint64_t v5 = container_class_normalized();
    BOOL v6 = v5 == container_class_normalized();
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)diskUsageWithError:(id *)a3
{
  unint64_t v4 = container_disk_usage();
  if (a3) {
    *a3 = 0;
  }

  return v4;
}

- (int64_t)containerClass
{
  int64_t containerClass = self->_containerClass;
  if (containerClass > 14) {
    return 0;
  }
  if ((unint64_t)(gMCMContainerClassToContainerClass[containerClass] - 1) >= 0xE || self->_uuid == 0) {
    return 0;
  }
  else {
    return self->_containerClass;
  }
}

- (NSUUID)uuid
{
  int64_t containerClass = self->_containerClass;
  if (containerClass > 14
    || ((unint64_t v3 = gMCMContainerClassToContainerClass[containerClass] - 1, (uuid = self->_uuid) != 0)
      ? (BOOL v5 = v3 > 0xD)
      : (BOOL v5 = 1),
        v5))
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = uuid;
  }
  return v6;
}

- (NSString)personaUniqueString
{
  int64_t containerClass = self->_containerClass;
  if (containerClass > 14
    || ((v3 = gMCMContainerClassToContainerClass[containerClass] - 1, self->_uuid) ? (BOOL v4 = v3 > 0xD) : (BOOL v4 = 1), v4))
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = self->_personaUniqueString;
  }
  return v5;
}

- (NSString)identifier
{
  int64_t containerClass = self->_containerClass;
  if (containerClass > 14
    || ((v3 = gMCMContainerClassToContainerClass[containerClass] - 1, self->_uuid) ? (BOOL v4 = v3 > 0xD) : (BOOL v4 = 1), v4))
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = self->_identifier;
  }
  return v5;
}

- (BOOL)isTemporary
{
  return 0;
}

- (NSDictionary)info
{
  v2 = (void *)container_copy_info();
  unint64_t v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  return (NSDictionary *)v3;
}

- (NSURL)url
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = container_copy_path();
  uint64_t v6 = v2;
  if (v2)
  {
    unint64_t v3 = (void *)v2;
    BOOL v4 = objc_msgSend(NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v2, 1, 0, v6, v7);
    free(v3);
    memset_s(&v6, 8uLL, 0, 8uLL);
  }
  else
  {
    BOOL v4 = 0;
  }
  return (NSURL *)v4;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  uint64_t v4 = container_regenerate_uuid();
  if (v4 == 1)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"MCMErrorDomain" code:v4 userInfo:0];
    if (a3 && v5)
    {
      id v5 = v5;
      *a3 = v5;
    }
  }
  BOOL v6 = v5 == 0;

  return v6;
}

- (BOOL)recreateDefaultStructureWithError:(id *)a3
{
  uint64_t v4 = container_recreate_structure();
  if (v4 == 1)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"MCMErrorDomain" code:v4 userInfo:0];
    if (a3 && v5)
    {
      id v5 = v5;
      *a3 = v5;
    }
  }
  BOOL v6 = v5 == 0;

  return v6;
}

- (id)infoValueForKey:(id)a3 error:(id *)a4
{
  [a3 UTF8String];
  uint64_t v4 = (void *)container_copy_info_value_for_key();
  id v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  return v5;
}

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  [v7 UTF8String];
  id v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  uint64_t v10 = container_set_info_value();
  if (v10 == 1)
  {
    id v11 = 0;
  }
  else
  {
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"MCMErrorDomain" code:v10 userInfo:0];
    if (a5 && v11)
    {
      id v11 = v11;
      *a5 = v11;
    }
  }
  BOOL v12 = v11 == 0;

  return v12;
}

- (id)destroyContainerWithCompletion:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *))a3;
  if (self->_thisContainer
    && (uuid = (const unsigned __int8 *)container_object_get_uuid(), !uuid_is_null(uuid))
    && container_object_get_identifier()
    && (unint64_t)(container_object_get_class() - 1) < 0xE)
  {
    id v8 = +[MCMContainerManager defaultManager];
    v10[0] = self;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    BOOL v6 = [v8 deleteContainers:v9 withCompletion:v4];
  }
  else
  {
    BOOL v6 = [MEMORY[0x263F087E8] errorWithDomain:@"MCMErrorDomain" code:11 userInfo:0];
    v4[2](v4, v6);
  }

  return v6;
}

- (MCMContainer)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = container_log_handle_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)unint64_t v3 = 0;
    _os_log_fault_impl(&dword_226325000, v2, OS_LOG_TYPE_FAULT, "You cannot init this class directly. Instead, use convenience constructor containerWithIdentifier:", v3, 2u);
  }

  abort();
}

+ (int64_t)typeContainerClass
{
  return 0;
}

+ (id)temporaryContainerWithIdentifier:(id)a3 existed:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v8 createIfNecessary:1 existed:a4 temp:1 error:a5];

  return v9;
}

+ (id)containerWithIdentifier:(id)a3 error:(id *)a4
{
  return (id)[a1 containerWithIdentifier:a3 createIfNecessary:0 existed:0 error:a4];
}

- (container_object_s)thisContainer
{
  return self->_thisContainer;
}

- (container_object_s)getLowLevelContainerObject
{
  return self->_thisContainer;
}

- (void)markDeleted
{
  identifier = self->_identifier;
  self->_identifier = 0;

  uuid = self->_uuid;
  self->_uuid = 0;

  self->_int64_t containerClass = 0;
  thisContainer = self->_thisContainer;
  MEMORY[0x270ED9058](thisContainer, 0);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  MEMORY[0x22A64D640](self->_thisContainer, a2);
  v3.receiver = self;
  v3.super_class = (Class)MCMContainer;
  [(MCMContainer *)&v3 dealloc];
}

@end