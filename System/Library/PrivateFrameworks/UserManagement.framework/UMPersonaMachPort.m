@interface UMPersonaMachPort
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (UMPersonaMachPort)initWithCoder:(id)a3;
- (id)replacementObjectForCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UMPersonaMachPort

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = self;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UMPersonaMachPort;
    v5 = [(UMPersonaMachPort *)&v8 replacementObjectForCoder:v4];
  }
  v6 = v5;

  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_machPort(self, v5, v6)
    && objc_msgSend_machPort(self, v7, v8) != -1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_machPort(self, v9, v10);
    v12 = (void *)xpc_mach_send_create();
    if (v12) {
      objc_msgSend_encodeXPCObject_forKey_(v4, v11, (uint64_t)v12, @"UMPersonaMachPort");
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UMPersonaMachPort;
    [(UMPersonaMachPort *)&v13 encodeWithCoder:v4];
  }
}

- (UMPersonaMachPort)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend_decodeXPCObjectOfType_forKey_(v4, v5, MEMORY[0x1E4F145C8], @"UMPersonaMachPort"),
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6, uint64_t v8 = xpc_mach_send_copy_right(), v7, (v8 - 1) <= 0xFFFFFFFD))
  {
    v14.receiver = self;
    v14.super_class = (Class)UMPersonaMachPort;
    v9 = [(UMPersonaMachPort *)&v14 initWithMachPort:v8 options:0];
    if (!v9) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v8);
    }
  }
  else
  {

    v11 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28760], 4864, 0);
    objc_msgSend_failWithError_(v4, v12, (uint64_t)v11);

    v9 = 0;
  }

  return v9;
}

@end