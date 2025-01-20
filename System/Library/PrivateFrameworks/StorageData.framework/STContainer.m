@interface STContainer
+ (STContainer)containerWithIdentifier:(id)a3 containerClass:(unint64_t)a4 personaUniqueString:(id)a5;
+ (id)containersWithClass:(unint64_t)a3 personaUniqueString:(id)a4;
- (NSString)identifier;
- (NSURL)url;
- (STContainer)initWithLibsystemContainer:(container_object_s *)a3;
- (unint64_t)containerClass;
- (unint64_t)diskUsageWithError:(id *)a3;
- (void)dealloc;
@end

@implementation STContainer

- (STContainer)initWithLibsystemContainer:(container_object_s *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STContainer;
  v3 = [(STContainer *)&v9 init];
  if (v3)
  {
    uint64_t v4 = [NSString stringWithUTF8String:container_get_identifier()];
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v4;

    v3->_containerClass = container_get_class();
    uint64_t v6 = [NSURL fileURLWithFileSystemRepresentation:container_get_path() isDirectory:1 relativeToURL:0];
    url = v3->_url;
    v3->_url = (NSURL *)v6;

    v3->_container = (container_object_s *)container_copy_object();
  }
  return v3;
}

- (void)dealloc
{
  MEMORY[0x21D463860](self->_container, a2);
  v3.receiver = self;
  v3.super_class = (Class)STContainer;
  [(STContainer *)&v3 dealloc];
}

- (unint64_t)diskUsageWithError:(id *)a3
{
  return container_disk_usage();
}

+ (id)containersWithClass:(unint64_t)a3 personaUniqueString:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a4;
  uint64_t v6 = [v4 array];
  container_query_create();
  container_query_set_class();
  container_query_set_include_other_owners();
  id v7 = v5;
  [v7 UTF8String];

  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  uint64_t v11 = MEMORY[0x263EF8330];
  id v8 = v6;
  v12 = v8;
  if ((container_query_iterate_results_sync() & 1) == 0)
  {

    id v8 = 0;
  }
  container_query_free();
  objc_super v9 = objc_msgSend(v8, "copy", v11, 3221225472, __55__STContainer_containersWithClass_personaUniqueString___block_invoke, &unk_2643058A0);

  return v9;
}

uint64_t __55__STContainer_containersWithClass_personaUniqueString___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithLibsystemContainer:a2];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

+ (STContainer)containerWithIdentifier:(id)a3 containerClass:(unint64_t)a4 personaUniqueString:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  container_query_create();
  id v9 = v8;
  v10 = (const char *)[v9 UTF8String];

  xpc_object_t v11 = xpc_string_create(v10);
  container_query_set_identifiers();

  container_query_set_class();
  container_query_set_include_other_owners();
  id v12 = v7;
  [v12 UTF8String];

  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  uint64_t single_result = container_query_get_single_result();
  if (single_result) {
    v14 = (void *)[objc_alloc((Class)a1) initWithLibsystemContainer:single_result];
  }
  else {
    v14 = 0;
  }
  container_query_free();

  return (STContainer *)v14;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end