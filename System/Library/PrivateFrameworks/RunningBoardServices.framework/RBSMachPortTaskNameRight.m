@interface RBSMachPortTaskNameRight
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)portForSelf;
+ (id)taskNameForPID:(int)a3;
- (BOOL)isUsable;
- (RBSAuditToken)auditToken;
- (RBSMachPortTaskNameRight)init;
- (RBSMachPortTaskNameRight)initWithCoder:(id)a3;
- (RBSMachPortTaskNameRight)initWithRBSXPCCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithPID:(void *)a1;
- (int)pid;
- (uint64_t)_initWithPID:(void *)a3 port:(void *)a4 auditToken:;
- (unsigned)port;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)invalidate;
@end

@implementation RBSMachPortTaskNameRight

- (RBSAuditToken)auditToken
{
  return self->_auditToken;
}

+ (id)taskNameForPID:(int)a3
{
  if (a3 < 1)
  {
    id v6 = 0;
  }
  else
  {
    if (_RBSSandboxCanGetMachTaskName(a3)) {
      id v6 = -[RBSMachPortTaskNameRight initWithPID:](objc_alloc((Class)a1), a3);
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)initWithPID:(void *)a1
{
  kern_return_t v6;
  mach_error_t v7;
  NSObject *v8;
  long long v10;
  kern_return_t v11;
  mach_error_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _OWORD v16[2];
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  long long v19;
  mach_port_name_t tn;

  id v3 = 0;
  if (!a1 || a2 < 1) {
    goto LABEL_11;
  }
  if (!_RBSSandboxCanGetMachTaskName(a2)) {
    goto LABEL_10;
  }
  tn = 0;
  v5 = (mach_port_name_t *)MEMORY[0x1E4F14960];
  if (task_name_for_pid(*MEMORY[0x1E4F14960], a2, &tn))
  {
    if (RBSPIDExists(a2))
    {
      id v6 = task_name_for_pid(*v5, a2, &tn);
      if (v6)
      {
        v7 = v6;
        v8 = rbs_general_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[RBSMachPortTaskNameRight initWithPID:](v7);
        }

        goto LABEL_10;
      }
      goto LABEL_12;
    }
LABEL_10:
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:
  *(void *)&v10 = -1;
  *((void *)&v10 + 1) = -1;
  *(_OWORD *)task_info_out = v10;
  v19 = v10;
  task_info_outCnt = 8;
  v11 = task_info(tn, 0xFu, task_info_out, &task_info_outCnt);
  if (v11)
  {
    v12 = v11;
    v13 = rbs_general_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RBSMachPortTaskNameRight initWithPID:](v12);
    }

    id v3 = 0;
    tn = 0;
  }
  else
  {
    v16[0] = *(_OWORD *)task_info_out;
    v16[1] = v19;
    v14 = +[RBSAuditToken tokenFromAuditToken:v16];
    v15 = +[RBSMachPort portConsumingRightForPort:tn];
    -[RBSMachPortTaskNameRight _initWithPID:port:auditToken:]((uint64_t)a1, a2, v15, v14);
    id v3 = a1;
  }
LABEL_11:

  return v3;
}

- (uint64_t)_initWithPID:(void *)a3 port:(void *)a4 auditToken:
{
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 8), a3);
    *(_DWORD *)(a1 + 16) = a2;
    objc_storeStrong((id *)(a1 + 24), a4);
    id v10 = (id)a1;
  }

  return a1;
}

- (void)dealloc
{
  [(RBSMachPortTaskNameRight *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)RBSMachPortTaskNameRight;
  [(RBSMachPortTaskNameRight *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_port, 0);
}

- (unsigned)port
{
  return [(RBSMachPort *)self->_port port];
}

- (RBSMachPortTaskNameRight)init
{
  pid_t v3 = getpid();
  return (RBSMachPortTaskNameRight *)-[RBSMachPortTaskNameRight initWithPID:](self, v3);
}

- (BOOL)isUsable
{
  return [(RBSMachPort *)self->_port isUsable];
}

+ (id)portForSelf
{
  uint64_t v2 = getpid();
  return +[RBSMachPortTaskNameRight taskNameForPID:v2];
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t pid = self->_pid;
  id v5 = a3;
  [v5 encodeInt64:pid forKey:@"_pid"];
  [v5 encodeObject:self->_auditToken forKey:@"_auditToken"];
  [v5 encodeObject:self->_port forKey:@"_port"];
}

- (RBSMachPortTaskNameRight)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeInt64ForKey:@"_pid"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_auditToken"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_port"];

  -[RBSMachPortTaskNameRight _initWithPID:port:auditToken:]((uint64_t)self, v5, v7, v6);
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RBSMachPortTaskNameRight)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_uint64_t pid = [v4 decodeIntForKey:@"_pid"];
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_auditToken"];
  auditToken = self->_auditToken;
  self->_auditToken = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_port"];

  port = self->_port;
  self->_port = v7;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t pid = self->_pid;
  id v5 = a3;
  [v5 encodeInt:pid forKey:@"_pid"];
  [v5 encodeObject:self->_auditToken forKey:@"_auditToken"];
  [v5 encodeObject:self->_port forKey:@"_port"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[RBSMachPort copyWithZone:](self->_port, "copyWithZone:");
  if (v5)
  {
    id v6 = +[RBSMachPortTaskNameRight allocWithZone:a3];
    -[RBSMachPortTaskNameRight _initWithPID:port:auditToken:]((uint64_t)v6, self->_pid, v5, self->_auditToken);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (int)pid
{
  return self->_pid;
}

- (void)initWithPID:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_2(&dword_191FE8000, v1, v2, "Unable to obtain an audit token for pid %i: %{public}s (0x%x)", v3, v4, v5, v6, v7);
}

- (void)initWithPID:(mach_error_t)a1 .cold.2(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_2(&dword_191FE8000, v1, v2, "Unable to obtain a task name port right for pid %i: %{public}s (0x%x)", v3, v4, v5, v6, v7);
}

@end