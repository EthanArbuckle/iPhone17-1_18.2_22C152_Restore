@interface CollationElement
+ (id)scopeToString:(int64_t)a3;
- (CollationElement)initWithBundle:(id)a3 version:(id)a4 atPath:(id)a5 withScope:(int64_t)a6 withCommand:(id)a7 withCommandArgs:(id)a8 withEnv:(id)a9;
- (CollationElement)initWithXPC:(id)a3;
- (NSArray)cle_command_args;
- (NSDictionary)cle_env;
- (NSString)cle_bundle_id;
- (NSString)cle_bundle_version;
- (NSString)cle_command;
- (NSString)cle_mnt_path;
- (id)copyAbsolutePath:(id)a3;
- (id)description;
- (id)package;
- (int64_t)cle_scope;
@end

@implementation CollationElement

+ (id)scopeToString:(int64_t)a3
{
  v3 = @"SCOPE_UNK";
  if (a3 == 2) {
    v3 = @"SCOPE_USER";
  }
  if (a3 == 1) {
    return @"SCOPE_SYSTEM";
  }
  else {
    return v3;
  }
}

- (id)description
{
  v3 = NSString;
  cle_bundle_id = self->_cle_bundle_id;
  v5 = +[CollationElement scopeToString:[(CollationElement *)self cle_scope]];
  v6 = [v3 stringWithFormat:@"[bundle: %@, scope: %@, mount: %@, cmd: %@, env: %@]", cle_bundle_id, v5, self->_cle_mnt_path, self->_cle_command, self->_cle_env];

  return v6;
}

- (id)copyAbsolutePath:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CollationElement)initWithBundle:(id)a3 version:(id)a4 atPath:(id)a5 withScope:(int64_t)a6 withCommand:(id)a7 withCommandArgs:(id)a8 withEnv:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)CollationElement;
  v18 = [(CollationElement *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_cle_scope = a6;
    objc_storeStrong((id *)&v18->_cle_mnt_path, a5);
    objc_storeStrong((id *)&v19->_cle_bundle_id, a3);
    objc_storeStrong((id *)&v19->_cle_bundle_version, a4);
    objc_storeStrong((id *)&v19->_cle_command, a7);
    objc_storeStrong((id *)&v19->_cle_env, a9);
    objc_storeStrong((id *)&v19->_cle_command_args, a8);
  }

  return v19;
}

- (CollationElement)initWithXPC:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CollationElement;
  v5 = [(CollationElement *)&v22 init];
  if (v5)
  {
    string = xpc_dictionary_get_string(v4, "cmd");
    v5->_cle_scope = xpc_dictionary_get_int64(v4, "scope");
    uint64_t v7 = [NSString stringWithUTF8String:xpc_dictionary_get_string(v4, "mntpath")];
    cle_mnt_path = v5->_cle_mnt_path;
    v5->_cle_mnt_path = (NSString *)v7;

    uint64_t v9 = [NSString stringWithUTF8String:xpc_dictionary_get_string(v4, "cryptex_bundleid")];
    cle_bundle_id = v5->_cle_bundle_id;
    v5->_cle_bundle_id = (NSString *)v9;

    uint64_t v11 = [NSString stringWithUTF8String:xpc_dictionary_get_string(v4, "version")];
    cle_bundle_version = v5->_cle_bundle_version;
    v5->_cle_bundle_version = (NSString *)v11;

    if (string)
    {
      uint64_t v13 = [NSString stringWithUTF8String:string];
      cle_command = v5->_cle_command;
      v5->_cle_command = (NSString *)v13;
    }
    v15 = xpc_dictionary_get_dictionary(v4, "env");
    if (v15)
    {
      uint64_t v16 = _CFXPCCreateCFObjectFromXPCObject();
      cle_env = v5->_cle_env;
      v5->_cle_env = (NSDictionary *)v16;
    }
    v18 = xpc_dictionary_get_array(v4, "cmd_arg");

    if (v18)
    {
      uint64_t v19 = _CFXPCCreateCFObjectFromXPCObject();
      cle_command_args = v5->_cle_command_args;
      v5->_cle_command_args = (NSArray *)v19;
    }
  }

  return v5;
}

- (id)package
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "scope", [(CollationElement *)self cle_scope]);
  id v4 = +[CollationElement scopeToString:[(CollationElement *)self cle_scope]];
  xpc_dictionary_set_string(empty, "scope_string", (const char *)[v4 UTF8String]);

  id v5 = [(CollationElement *)self cle_bundle_id];
  xpc_dictionary_set_string(empty, "cryptex_bundleid", (const char *)[v5 UTF8String]);

  id v6 = [(CollationElement *)self cle_mnt_path];
  xpc_dictionary_set_string(empty, "mntpath", (const char *)[v6 UTF8String]);

  id v7 = [(CollationElement *)self cle_bundle_version];
  xpc_dictionary_set_string(empty, "version", (const char *)[v7 UTF8String]);

  v8 = [(CollationElement *)self cle_command];

  if (v8)
  {
    id v9 = [(CollationElement *)self cle_command];
    xpc_dictionary_set_string(empty, "command", (const char *)[v9 UTF8String]);
  }
  v10 = [(CollationElement *)self cle_env];

  if (v10)
  {
    uint64_t v11 = [(CollationElement *)self cle_env];
    v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(empty, "env", v12);
  }
  uint64_t v13 = [(CollationElement *)self cle_command_args];

  if (v13)
  {
    v14 = [(CollationElement *)self cle_command_args];
    v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(empty, "cmd_arg", v15);
  }

  return empty;
}

- (int64_t)cle_scope
{
  return self->_cle_scope;
}

- (NSString)cle_bundle_id
{
  return self->_cle_bundle_id;
}

- (NSString)cle_bundle_version
{
  return self->_cle_bundle_version;
}

- (NSString)cle_mnt_path
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)cle_command
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)cle_env
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)cle_command_args
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cle_command_args, 0);
  objc_storeStrong((id *)&self->_cle_env, 0);
  objc_storeStrong((id *)&self->_cle_command, 0);
  objc_storeStrong((id *)&self->_cle_mnt_path, 0);
  objc_storeStrong((id *)&self->_cle_bundle_version, 0);

  objc_storeStrong((id *)&self->_cle_bundle_id, 0);
}

@end