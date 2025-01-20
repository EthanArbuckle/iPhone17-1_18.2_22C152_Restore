@interface RBSMachPort
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)portConsumingRightForPort:(unsigned int)a3;
+ (id)portForPort:(unsigned int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsable;
- (RBSMachPort)initWithCoder:(id)a3;
- (RBSMachPort)initWithRBSXPCCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)port;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)invalidate;
@end

@implementation RBSMachPort

+ (id)portConsumingRightForPort:(unsigned int)a3
{
  v4 = [RBSMachPort alloc];
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)RBSMachPort;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    if (v4)
    {
      v4->_port = a3;
      v4->_lock._os_unfair_lock_opaque = 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  [(RBSMachPort *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)RBSMachPort;
  [(RBSMachPort *)&v3 dealloc];
}

- (void)invalidate
{
}

- (unsigned)port
{
  if (self->_port + 1 >= 2) {
    return self->_port;
  }
  else {
    return 0;
  }
}

+ (id)portForPort:(unsigned int)a3
{
  if (mach_port_insert_right(*MEMORY[0x1E4F14960], a3, a3, 0x13u))
  {
    v4 = rbs_general_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[RBSMachPort portForPort:](v4, v5, v6, v7, v8, v9, v10, v11);
    }

    v12 = 0;
  }
  else
  {
    v12 = [RBSMachPort alloc];
    if (v12)
    {
      v14.receiver = v12;
      v14.super_class = (Class)RBSMachPort;
      v12 = objc_msgSendSuper2(&v14, sel_init);
      if (v12)
      {
        v12->_port = a3;
        v12->_lock._os_unfair_lock_opaque = 0;
      }
    }
  }
  return v12;
}

- (BOOL)isUsable
{
  mach_port_name_t port = self->_port;
  if (port - 1 > 0xFFFFFFFD) {
    LOBYTE(v3) = 0;
  }
  else {
    return (RBSMachPortType(port) >> 16) & 1;
  }
  return v3;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)xpc_mach_send_create();
  if (v5) {
    [v6 encodeXPCObject:v5 forKey:@"_port"];
  }
  os_unfair_lock_unlock(p_lock);
}

- (RBSMachPort)initWithRBSXPCCoder:(id)a3
{
  v4 = [a3 decodeXPCObjectOfType:MEMORY[0x1E4F145C8] forKey:@"_port"];
  if (v4)
  {
    unsigned int v5 = xpc_mach_send_copy_right();
    if (!self) {
      goto LABEL_7;
    }
  }
  else
  {
    unsigned int v5 = 0;
    if (!self) {
      goto LABEL_7;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)RBSMachPort;
  id v6 = [(RBSMachPort *)&v8 init];
  self = v6;
  if (v6)
  {
    v6->_mach_port_name_t port = v5;
    v6->_lock._os_unfair_lock_opaque = 0;
  }
LABEL_7:

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RBSMachPort)initWithCoder:(id)a3
{
  uint64_t v4 = MEMORY[0x1E4F145C8];
  uint64_t v5 = [a3 decodeXPCObjectOfType:MEMORY[0x1E4F145C8] forKey:@"_port"];
  id v6 = (void *)v5;
  if (v5 && MEMORY[0x192FECA30](v5) == v4)
  {
    unsigned int v8 = xpc_mach_send_copy_right();
    if (self)
    {
      unsigned int v9 = v8;
      v12.receiver = self;
      v12.super_class = (Class)RBSMachPort;
      uint64_t v10 = [(RBSMachPort *)&v12 init];
      if (v10)
      {
        v10->_mach_port_name_t port = v9;
        v10->_lock._os_unfair_lock_opaque = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    self = v10;
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  mach_port_name_t port = self->_port;
  if (port - 1 <= 0xFFFFFFFD && (RBSMachPortType(port) & 0x10000) != 0)
  {
    id v6 = (void *)xpc_mach_send_create();
    if (v6) {
      [v7 encodeXPCObject:v6 forKey:@"_port"];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = +[RBSMachPort portForPort:self->_port];
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RBSMachPort *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = [(RBSMachPort *)self port];
      BOOL v6 = v5 == [(RBSMachPort *)v4 port];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(RBSMachPort *)self port];
}

+ (void)portForPort:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end