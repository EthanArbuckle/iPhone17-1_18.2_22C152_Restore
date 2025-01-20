@interface PMLPlistClassWrapper
- (PMLPlistClassWrapper)initWithClassNameKey:(id)a3;
- (id)readObjectWithData:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)readObjectWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)writeToDataWithObject:(id)a3 andChunks:(id)a4;
- (id)writeToPlistWithObject:(id)a3 andChunks:(id)a4;
@end

@implementation PMLPlistClassWrapper

- (void).cxx_destruct
{
}

- (id)readObjectWithData:(id)a3 chunks:(id)a4 context:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v15 = 0;
  v10 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:&v15];
  id v11 = v15;
  if (v10)
  {
    v12 = [(PMLPlistClassWrapper *)self readObjectWithPlist:v10 chunks:v8 context:v9];
  }
  else
  {
    v13 = PML_LogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_error_impl(&dword_2212A0000, v13, OS_LOG_TYPE_ERROR, "Error reading object from NSData: %@", buf, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

- (id)writeToDataWithObject:(id)a3 andChunks:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F08AC0];
  v5 = [(PMLPlistClassWrapper *)self writeToPlistWithObject:a3 andChunks:a4];
  id v10 = 0;
  v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:&v10];
  id v7 = v10;

  if (!v6)
  {
    id v8 = PML_LogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_error_impl(&dword_2212A0000, v8, OS_LOG_TYPE_ERROR, "Error writing object to NSData: %@", buf, 0xCu);
    }
  }
  return v6;
}

- (id)readObjectWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PMLPlistClassWrapper.m", 38, @"Invalid parameter not satisfying: %@", @"plist" object file lineNumber description];
  }
  id v12 = [v9 objectForKeyedSubscript:self->_classNameKey];
  Class v13 = NSClassFromString(v12);
  if (!v13)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PMLPlistClassWrapper.m", 42, @"Invalid plan. Unknown class: %@", 0 object file lineNumber description];
  }
  if (([(objc_class *)v13 conformsToProtocol:&unk_26D3390D0] & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PMLPlistClassWrapper.m", 45, @"Invalid plan. class %@ doesn't conform to %@", v13, &unk_26D3390D0 object file lineNumber description];
  }
  v14 = (void *)[[v13 alloc] initWithPlist:v9 chunks:v10 context:v11];

  return v14;
}

- (id)writeToPlistWithObject:(id)a3 andChunks:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  classNameKey = self->_classNameKey;
  id v5 = a4;
  id v6 = a3;
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  v14[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&classNameKey count:1];
  id v10 = (void *)[v9 mutableCopy];

  id v11 = [v6 toPlistWithChunks:v5];

  [v10 addEntriesFromDictionary:v11];
  return v10;
}

- (PMLPlistClassWrapper)initWithClassNameKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLPlistClassWrapper;
  id v6 = [(PMLPlistClassWrapper *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_classNameKey, a3);
  }

  return v7;
}

@end