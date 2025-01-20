@interface PLKeyedUnarchiver
+ (id)secureUnarchivedObjectWithData:(id)a3 ofClass:(Class)a4;
+ (id)secureUnarchivedObjectWithData:(id)a3 ofClasses:(id)a4;
@end

@implementation PLKeyedUnarchiver

+ (id)secureUnarchivedObjectWithData:(id)a3 ofClasses:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  id v13 = 0;
  v8 = (void *)[[v6 alloc] initForReadingFromData:v7 error:&v13];

  id v9 = v13;
  if (!v8)
  {
    v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Data was corrupt; forcing -[NSKeyedUnarchiver initForReadingFromData:error:] to return nil, error: %@",
        buf,
        0xCu);
    }
  }
  v11 = [v8 decodeObjectOfClasses:v5 forKey:*MEMORY[0x1E4F284E8]];

  return v11;
}

+ (id)secureUnarchivedObjectWithData:(id)a3 ofClass:(Class)a4
{
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  v8 = [v6 setWithObject:a4];
  id v9 = [a1 secureUnarchivedObjectWithData:v7 ofClasses:v8];

  return v9;
}

@end