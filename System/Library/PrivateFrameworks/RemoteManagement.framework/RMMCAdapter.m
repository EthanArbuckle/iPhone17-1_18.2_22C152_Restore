@interface RMMCAdapter
+ (void)downloadDataAtURL:(id)a3 downloadURL:(id)a4 completionHandler:(id)a5;
+ (void)fetchDataAtURL:(id)a3 completionHandler:(id)a4;
@end

@implementation RMMCAdapter

+ (void)fetchDataAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[RMLog mcAdapter];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[RMMCAdapter fetchDataAtURL:completionHandler:]((uint64_t)v5, v7);
  }

  [MEMORY[0x263F52818] fetchDataAtURL:v5 completionHandler:v6];
}

+ (void)downloadDataAtURL:(id)a3 downloadURL:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = +[RMLog mcAdapter];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[RMMCAdapter downloadDataAtURL:downloadURL:completionHandler:]((uint64_t)v7, v10);
  }

  [MEMORY[0x263F52818] downloadDataAtURL:v7 downloadURL:v9 completionHandler:v8];
}

+ (void)fetchDataAtURL:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_224784000, a2, OS_LOG_TYPE_DEBUG, "Fetching MDM data at: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)downloadDataAtURL:(uint64_t)a1 downloadURL:(NSObject *)a2 completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_224784000, a2, OS_LOG_TYPE_DEBUG, "Downloading MDM data at: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end