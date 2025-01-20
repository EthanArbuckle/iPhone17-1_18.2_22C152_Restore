@interface RBSOSServiceProcessIdentity
- (BOOL)_matchesIdentity:(id)a3;
- (BOOL)hasConsistentLaunchdJob;
- (BOOL)isAngel;
- (BOOL)isAnonymous;
- (BOOL)isDaemon;
- (BOOL)supportsLaunchingDirectly;
- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3;
- (RBSOSServiceProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4;
- (RBSOSServiceProcessIdentity)initWithRBSXPCCoder:(id)a3;
- (id)_initAngelWithJobLabel:(id)a3;
- (id)_initDaemonWithJobLabel:(id)a3 pid:(int)a4 auid:(unsigned int)a5;
- (id)_initServiceWithJobLabel:(id)a3 pid:(int)a4 auid:(unsigned int)a5 type:(unsigned __int8)a6;
- (id)_initUnknownOSServiceWithJobLabel:(id)a3;
- (id)angelJobLabel;
- (id)consistentLaunchdJobLabel;
- (id)daemonJobLabel;
- (id)debugDescription;
- (id)encodeForJob;
- (unsigned)osServiceType;
- (void)encodeForJob;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setOsServiceType:(unsigned __int8)a3;
@end

@implementation RBSOSServiceProcessIdentity

- (void)encodeWithRBSXPCCoder:(id)a3
{
  jobLabel = self->_jobLabel;
  id v5 = a3;
  [v5 encodeObject:jobLabel forKey:@"_jobLabel"];
  [v5 encodeInt64:self->super._pid forKey:@"_pid"];
  [v5 encodeInt64:self->_type forKey:@"_type"];
}

- (RBSOSServiceProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"_pid"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_jobLabel"];
  unsigned __int8 v7 = [v4 decodeInt64ForKey:@"_type"];

  v8 = (RBSOSServiceProcessIdentity *)[(RBSOSServiceProcessIdentity *)self _initServiceWithJobLabel:v6 pid:v5 auid:0 type:v7];
  return v8;
}

- (id)_initDaemonWithJobLabel:(id)a3 pid:(int)a4 auid:(unsigned int)a5
{
  return [(RBSOSServiceProcessIdentity *)self _initServiceWithJobLabel:a3 pid:*(void *)&a4 auid:*(void *)&a5 type:2];
}

- (id)_initServiceWithJobLabel:(id)a3 pid:(int)a4 auid:(unsigned int)a5 type:(unsigned __int8)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RBSOSServiceProcessIdentity;
  v12 = [(RBSProcessIdentity *)&v22 _init];
  v13 = v12;
  if (v12)
  {
    *((_DWORD *)v12 + 2) = a4;
    objc_storeStrong(v12 + 7, a3);
    v14 = v13 + 7;
    if (v7) {
      [NSString stringWithFormat:@"osservice<%@(%d)>", *v14, v7];
    }
    else {
    uint64_t v15 = [NSString stringWithFormat:@"osservice<%@>", *v14];
    }
    id v16 = v13[2];
    v13[2] = (id)v15;

    uint64_t v17 = *((unsigned int *)v13 + 2);
    if (v17)
    {
      uint64_t v18 = [NSString stringWithFormat:@"%@:%d", v13[2], v17];
      id v19 = v13[2];
      v13[2] = (id)v18;
    }
    v13[3] = (id)[v13[2] hash];
    *((unsigned char *)v13 + 64) = a6;
    v20 = v13;
  }

  return v13;
}

- (BOOL)_matchesIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class()
    && ((jobLabel = self->_jobLabel, v8 = (NSString *)v4[7], jobLabel == v8)
     || (jobLabel ? (BOOL v9 = v8 == 0) : (BOOL v9 = 1), !v9 && -[NSString isEqual:](jobLabel, "isEqual:")))
    && self->super._pid == *((_DWORD *)v4 + 2);

  return v6;
}

- (BOOL)isDaemon
{
  return 1;
}

- (unsigned)osServiceType
{
  return self->_type;
}

- (id)consistentLaunchdJobLabel
{
  v2 = (void *)[(NSString *)self->_jobLabel copy];
  return v2;
}

- (BOOL)hasConsistentLaunchdJob
{
  return 1;
}

- (void).cxx_destruct
{
}

- (BOOL)isAnonymous
{
  return 0;
}

- (id)encodeForJob
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  p_type = &self->_type;
  if (self->_type <= 1u) {
    [(RBSOSServiceProcessIdentity *)&v8 encodeForJob];
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 6);
  jobLabel = self->_jobLabel;
  if (jobLabel)
  {
    BOOL v6 = [(NSString *)jobLabel UTF8String];
    if (v6) {
      xpc_dictionary_set_string(empty, "l", v6);
    }
  }
  xpc_dictionary_set_int64(empty, "p", self->super._pid);
  xpc_dictionary_set_int64(empty, "t", *p_type);
  return empty;
}

- (void)setOsServiceType:(unsigned __int8)a3
{
  if (self->_type == 1) {
    self->_type = a3;
  }
}

- (RBSOSServiceProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = rbs_general_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[RBSOSServiceProcessIdentity initWithDecodeFromJob:uuid:]((uint64_t)v7, v8);
    }
  }
  int64_t int64 = xpc_dictionary_get_int64(v6, "p");
  string = xpc_dictionary_get_string(v6, "l");
  if (string)
  {
    id v11 = [NSString stringWithUTF8String:string];
  }
  else
  {
    id v11 = 0;
  }
  v12 = [(RBSOSServiceProcessIdentity *)self _initServiceWithJobLabel:v11 pid:int64 auid:0 type:xpc_dictionary_get_int64(v6, "t")];

  return v12;
}

- (id)_initAngelWithJobLabel:(id)a3
{
  return [(RBSOSServiceProcessIdentity *)self _initServiceWithJobLabel:a3 pid:0 auid:0 type:3];
}

- (id)_initUnknownOSServiceWithJobLabel:(id)a3
{
  return [(RBSOSServiceProcessIdentity *)self _initServiceWithJobLabel:a3 pid:0 auid:0 type:1];
}

- (id)debugDescription
{
  v3 = self->_jobLabel;
  uint64_t v4 = [(RBSProcessIdentity *)self auid];
  uint64_t v5 = v4;
  id v6 = NSString;
  uint64_t pid = self->super._pid;
  if ((int)pid <= 0) {
    uint64_t v8 = &stru_1EE2E2768;
  }
  else {
    uint64_t v8 = @" pid=";
  }
  if ((int)pid < 1)
  {
    BOOL v9 = &stru_1EE2E2768;
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v9 = [NSNumber numberWithInt:pid];
    if (v5)
    {
LABEL_6:
      uint64_t v10 = [NSNumber numberWithUnsignedInt:v5];
      id v11 = [v6 stringWithFormat:@"<type=%@ identifier=%@%@%@%@%@>", @"daemon", v3, v8, v9, @" AUID=", v10];

      goto LABEL_9;
    }
  }
  id v11 = [v6 stringWithFormat:@"<type=%@ identifier=%@%@%@%@%@>", @"daemon", v3, v8, v9, &stru_1EE2E2768, &stru_1EE2E2768];
LABEL_9:
  if ((int)pid >= 1) {

  }
  return v11;
}

- (id)daemonJobLabel
{
  v2 = (void *)[(NSString *)self->_jobLabel copy];
  return v2;
}

- (id)angelJobLabel
{
  v2 = (void *)[(NSString *)self->_jobLabel copy];
  return v2;
}

- (BOOL)isAngel
{
  return 1;
}

- (BOOL)supportsLaunchingDirectly
{
  return 1;
}

- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3
{
  int type = self->_type;
  if (type == 2) {
    return 0;
  }
  if (type == 3) {
    return 1;
  }
  id v7 = +[RBSConnection sharedInstance];
  LOBYTE(a3) = [v7 isIdentityAnAngel:self withError:a3];

  return (char)a3;
}

- (void)encodeForJob
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (void)initWithDecodeFromJob:(uint64_t)a1 uuid:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_191FE8000, a2, OS_LOG_TYPE_FAULT, "There is no reason a daemon should have a UUID: %@", (uint8_t *)&v2, 0xCu);
}

@end