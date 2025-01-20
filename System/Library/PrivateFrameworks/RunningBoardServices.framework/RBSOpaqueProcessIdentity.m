@interface RBSOpaqueProcessIdentity
+ (BOOL)supportsRBSXPCSecureCoding;
- (RBSOpaqueProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4;
- (RBSOpaqueProcessIdentity)initWithRBSXPCCoder:(id)a3;
- (id)_initOpaqueWithPid:(int)a3 auid:(unsigned int)a4 description:(id)a5;
- (id)_initOpaqueWithPid:(int)a3 name:(id)a4 auid:(unsigned int)a5;
- (id)encodeForJob;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSOpaqueProcessIdentity

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t pid = self->super._pid;
  id v5 = a3;
  [v5 encodeInt64:pid forKey:@"_pid"];
  [v5 encodeObject:self->super._description forKey:@"_description"];
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (id)_initOpaqueWithPid:(int)a3 name:(id)a4 auid:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  v8 = [NSString stringWithFormat:@"anon<%@>", a4];
  id v9 = [(RBSOpaqueProcessIdentity *)self _initOpaqueWithPid:v6 auid:v5 description:v8];

  return v9;
}

- (RBSOpaqueProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"_pid"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_description"];

  v7 = [(RBSOpaqueProcessIdentity *)self _initOpaqueWithPid:v5 auid:0 description:v6];
  return v7;
}

- (id)_initOpaqueWithPid:(int)a3 auid:(unsigned int)a4 description:(id)a5
{
  id v7 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RBSOpaqueProcessIdentity;
  v8 = [(RBSProcessIdentity *)&v14 _init];
  id v9 = v8;
  if (v8)
  {
    v8[2] = a3;
    uint64_t v10 = [v7 copy];
    v11 = (void *)*((void *)v9 + 2);
    *((void *)v9 + 2) = v10;

    *((void *)v9 + 3) = (int)v9[2];
    v12 = v9;
  }

  return v9;
}

- (id)encodeForJob
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 7);
  xpc_dictionary_set_int64(empty, "p", self->super._pid);
  id v4 = [(NSString *)self->super._description UTF8String];
  if (v4) {
    xpc_dictionary_set_string(empty, "d", v4);
  }
  return empty;
}

- (RBSOpaqueProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = rbs_general_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[RBSOpaqueProcessIdentity initWithDecodeFromJob:uuid:]((uint64_t)v7, v8);
    }
  }
  int64_t int64 = xpc_dictionary_get_int64(v6, "p");
  string = xpc_dictionary_get_string(v6, "d");
  if (string)
  {
    v11 = [NSString stringWithUTF8String:string];
  }
  else
  {
    v11 = 0;
  }
  v12 = [(RBSOpaqueProcessIdentity *)self _initOpaqueWithPid:int64 auid:0 description:v11];

  return v12;
}

- (void)initWithDecodeFromJob:(uint64_t)a1 uuid:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_191FE8000, a2, OS_LOG_TYPE_FAULT, "There is no reason an opaque identity should have a UUID %@:", (uint8_t *)&v2, 0xCu);
}

@end