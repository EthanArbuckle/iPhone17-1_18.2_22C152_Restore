@interface ULDataContainer
- (BOOL)_consumeSandboxExtensionForContainer:(container_object_s *)a3;
- (ULDataContainer)init;
- (const)_getContainerPathWithSandboxAccessForQuery:(container_query_s *)a3;
- (const)_getPathFromContainer:(container_object_s *)a3;
- (container_object_s)_getContainerForQuery:(container_query_s *)a3;
- (container_object_s)_getContainerSingleResultForQuery:(container_query_s *)a3;
- (id)getContainerPathWithSandboxAccess;
- (int64_t)extensionHandle;
- (void)_releaseExtensionHandle;
- (void)dealloc;
- (void)setExtensionHandle:(int64_t)a3;
@end

@implementation ULDataContainer

- (ULDataContainer)init
{
  v5.receiver = self;
  v5.super_class = (Class)ULDataContainer;
  v2 = [(ULDataContainer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ULDataContainer *)v2 setExtensionHandle:-1];
  }
  return v3;
}

- (void)dealloc
{
  [(ULDataContainer *)self _releaseExtensionHandle];
  v3.receiver = self;
  v3.super_class = (Class)ULDataContainer;
  [(ULDataContainer *)&v3 dealloc];
}

- (id)getContainerPathWithSandboxAccess
{
  [(ULDataContainer *)self _releaseExtensionHandle];
  uint64_t v3 = container_query_create();
  if (v3)
  {
    v4 = [(ULDataContainer *)self _getContainerPathWithSandboxAccessForQuery:v3];
    if (v4)
    {
      objc_super v5 = [NSURL fileURLWithFileSystemRepresentation:v4 isDirectory:1 relativeToURL:0];
    }
    else
    {
      objc_super v5 = 0;
    }
    container_query_free();
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_37);
    }
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_ERROR, "Error creating query for data container", v8, 2u);
    }
    objc_super v5 = 0;
  }
  return v5;
}

- (container_object_s)_getContainerSingleResultForQuery:(container_query_s *)a3
{
  return (container_object_s *)MEMORY[0x270ED9078](a3, a2);
}

- (const)_getPathFromContainer:(container_object_s *)a3
{
  return (const char *)MEMORY[0x270ED9008](a3, a2);
}

- (container_object_s)_getContainerForQuery:(container_query_s *)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  container_query_set_class();
  container_query_operation_set_flags();
  container_query_set_persona_unique_string();
  objc_super v5 = [(ULDataContainer *)self _getContainerSingleResultForQuery:a3];
  if (!v5)
  {
    container_query_get_last_error();
    v6 = (void *)container_error_copy_unlocalized_description();
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_37);
    }
    v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = v6;
      _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_ERROR, "Error executing query for data container: %s", (uint8_t *)&v9, 0xCu);
    }
    free(v6);
  }
  return v5;
}

- (BOOL)_consumeSandboxExtensionForContainer:(container_object_s *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = container_copy_sandbox_token();
  if (v4)
  {
    objc_super v5 = (void *)v4;
    [(ULDataContainer *)self setExtensionHandle:sandbox_extension_consume()];
    free(v5);
    if (([(ULDataContainer *)self extensionHandle] & 0x8000000000000000) == 0)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_37);
    }
    v8 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = *__error();
      v11[0] = 67109120;
      v11[1] = v9;
      _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_ERROR, "Error consuming sandbox extension for container: %{darwin.errno}d", (uint8_t *)v11, 8u);
    }

    [(ULDataContainer *)self _releaseExtensionHandle];
LABEL_13:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_37);
  }
  v7 = logObject_MicroLocation_Default;
  BOOL v6 = os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_ERROR, "Error getting sandbox extension for container. Got NULL", (uint8_t *)v11, 2u);
    goto LABEL_13;
  }
  return v6;
}

- (const)_getContainerPathWithSandboxAccessForQuery:(container_query_s *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(ULDataContainer *)self _getContainerForQuery:a3];
  if (!v4) {
    return 0;
  }
  objc_super v5 = v4;
  BOOL v6 = [(ULDataContainer *)self _getPathFromContainer:v4];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_37);
  }
  v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_INFO))
  {
    v9[0] = 68289283;
    v9[1] = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2081;
    v13 = v6;
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Got container path\", \"path\":%{private, location:escape_only}s}", (uint8_t *)v9, 0x1Cu);
  }
  if (![(ULDataContainer *)self _consumeSandboxExtensionForContainer:v5]) {
    return 0;
  }
  return v6;
}

- (void)_releaseExtensionHandle
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (([(ULDataContainer *)self extensionHandle] & 0x8000000000000000) == 0)
  {
    [(ULDataContainer *)self extensionHandle];
    if (sandbox_extension_release() == -1)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_37);
      }
      uint64_t v3 = (id)logObject_MicroLocation_Default;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v4 = *__error();
        v5[0] = 67109120;
        v5[1] = v4;
        _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_ERROR, "Error releasing data container's sandbox extension: %{darwin.errno}d", (uint8_t *)v5, 8u);
      }
    }
    [(ULDataContainer *)self setExtensionHandle:-1];
  }
}

- (int64_t)extensionHandle
{
  return self->_extensionHandle;
}

- (void)setExtensionHandle:(int64_t)a3
{
  self->_extensionHandle = a3;
}

@end