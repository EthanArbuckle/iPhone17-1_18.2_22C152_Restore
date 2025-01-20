@interface PRPosterContentStyleSerialization
+ (id)contentStyleForData:(id)a3 error:(id *)a4;
+ (id)dataForContentStyle:(id)a3 error:(id *)a4;
@end

@implementation PRPosterContentStyleSerialization

+ (id)dataForContentStyle:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v12 = 0;
  v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
  id v7 = v12;
  v8 = v7;
  if (v7)
  {
    if (a4) {
      *a4 = v7;
    }
    v9 = PRLogModel();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[PRPosterContentStyleSerialization dataForContentStyle:error:]((uint64_t)v5, (uint64_t)v8, v9);
    }

    v10 = 0;
  }
  else
  {
    v10 = (void *)[v6 copy];
  }

  return v10;
}

+ (id)contentStyleForData:(id)a3 error:(id *)a4
{
  v15[5] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28DC0];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v15[3] = objc_opt_class();
  v15[4] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
  v9 = [v6 setWithArray:v8];
  id v14 = 0;
  v10 = [v5 _strictlyUnarchivedObjectOfClasses:v9 fromData:v7 error:&v14];

  id v11 = v14;
  if (!v10)
  {
    id v12 = PRLogModel();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[PRPosterContentStyleSerialization contentStyleForData:error:]((uint64_t)v11, v12);
    }
  }
  if (a4 && v11) {
    *a4 = v11;
  }

  return v10;
}

+ (void)dataForContentStyle:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Failed to archive %@: %{public}@", (uint8_t *)&v3, 0x16u);
}

+ (void)contentStyleForData:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_DEBUG, "Unable to unarchive content style: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end