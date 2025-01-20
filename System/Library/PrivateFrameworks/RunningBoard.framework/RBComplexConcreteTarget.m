@interface RBComplexConcreteTarget
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystem;
- (id)_initWithProcess:(void *)a3 identity:(void *)a4 environment:;
- (id)createRBSTarget;
- (id)description;
- (id)environment;
- (id)identity;
- (id)process;
- (unint64_t)hash;
@end

@implementation RBComplexConcreteTarget

- (id)_initWithProcess:(void *)a3 identity:(void *)a4 environment:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)RBComplexConcreteTarget;
    v11 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      uint64_t v12 = [v10 copy];
      id v13 = a1[4];
      a1[4] = (id)v12;

      if (a1[4])
      {
        id v14 = [NSString alloc];
        id v15 = a1[2];
        if (!v15) {
          id v15 = a1[3];
        }
        id v16 = [v15 shortDescription];
        uint64_t v17 = [v14 initWithFormat:@"%@(%@)", v16, a1[4]];
        id v18 = a1[1];
        a1[1] = (id)v17;
      }
      else
      {
        uint64_t v19 = [a1[3] shortDescription];
        id v16 = a1[1];
        a1[1] = (id)v19;
      }
    }
  }

  return a1;
}

- (BOOL)isSystem
{
  return 0;
}

- (id)identity
{
  return self->_identity;
}

- (id)process
{
  return self->_process;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBComplexConcreteTarget *)a3;
  if (self == v4) {
    goto LABEL_13;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()
    || self->_process != v4->_process
    || v4->_identity && !-[RBSProcessIdentity isEqualToIdentity:](self->_identity, "isEqualToIdentity:"))
  {
    goto LABEL_4;
  }
  environment = self->_environment;
  id v8 = v4->_environment;
  if (environment == v8)
  {
LABEL_13:
    char v6 = 1;
    goto LABEL_14;
  }
  if (environment) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char v6 = -[NSString isEqualToString:](environment, "isEqualToString:");
    goto LABEL_14;
  }
LABEL_4:
  char v6 = 0;
LABEL_14:

  return v6;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (id)environment
{
  return self->_environment;
}

- (unint64_t)hash
{
  uint64_t v3 = [(RBSProcessIdentity *)self->_identity hash];
  NSUInteger v4 = [(NSString *)self->_environment hash] ^ v3;
  return v4 ^ [(RBProcess *)self->_process hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

- (id)createRBSTarget
{
  if ([(RBComplexConcreteTarget *)self isSystem])
  {
    uint64_t v3 = [MEMORY[0x263F64630] systemTarget];
  }
  else
  {
    process = self->_process;
    if (process) {
      objc_msgSend(MEMORY[0x263F64630], "targetWithPid:environmentIdentifier:", -[RBProcess rbs_pid](process, "rbs_pid"), self->_environment);
    }
    else {
    uint64_t v3 = [MEMORY[0x263F64630] targetWithProcessIdentity:self->_identity environmentIdentifier:self->_environment];
    }
  }
  return v3;
}

@end