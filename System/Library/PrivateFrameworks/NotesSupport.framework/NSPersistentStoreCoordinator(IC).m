@interface NSPersistentStoreCoordinator(IC)
- (id)ic_managedObjectIDForURIRepresentation:()IC;
- (id)ic_managedObjectIDForURIString:()IC;
@end

@implementation NSPersistentStoreCoordinator(IC)

- (id)ic_managedObjectIDForURIRepresentation:()IC
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 scheme],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:@"x-coredata"],
        v6,
        v7))
  {
    v8 = [a1 managedObjectIDForURIRepresentation:v5];
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[NSPersistentStoreCoordinator(IC) ic_managedObjectIDForURIRepresentation:](v5, v9);
    }

    v8 = 0;
  }

  return v8;
}

- (id)ic_managedObjectIDForURIString:()IC
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[NSPersistentStoreCoordinator(IC) ic_managedObjectIDForURIString:](v6);
    }
    goto LABEL_11;
  }
  if (![v4 length])
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[NSPersistentStoreCoordinator(IC) ic_managedObjectIDForURIString:](v6);
    }
LABEL_11:
    int v7 = 0;
    goto LABEL_12;
  }
  v6 = [NSURL URLWithString:v5];
  int v7 = objc_msgSend(a1, "ic_managedObjectIDForURIRepresentation:", v6);
  if (!v7)
  {
    v8 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(NSPersistentStoreCoordinator(IC) *)(uint64_t)v5 ic_managedObjectIDForURIString:v8];
    }
  }
LABEL_12:

  return v7;
}

- (void)ic_managedObjectIDForURIString:()IC .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20C263000, log, OS_LOG_TYPE_DEBUG, "Trying to create managed object ID from nil URI string", v1, 2u);
}

- (void)ic_managedObjectIDForURIString:()IC .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20C263000, log, OS_LOG_TYPE_DEBUG, "Trying to create managed object ID from zero-length URI string", v1, 2u);
}

- (void)ic_managedObjectIDForURIString:()IC .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_20C263000, log, OS_LOG_TYPE_DEBUG, "Could not create object ID from string %@ in coordinator %@", (uint8_t *)&v3, 0x16u);
}

- (void)ic_managedObjectIDForURIRepresentation:()IC .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [a1 absoluteString];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "Unable to get object ID URL for HTML note uriString: %@", (uint8_t *)&v4, 0xCu);
}

- (void)ic_managedObjectIDForURIRepresentation:()IC .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = objc_begin_catch(a1);
  __int16 v5 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    uint64_t v7 = a3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl(&dword_20C263000, v5, OS_LOG_TYPE_DEBUG, "Failed to get managed object ID from URL %@: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_end_catch();
}

@end