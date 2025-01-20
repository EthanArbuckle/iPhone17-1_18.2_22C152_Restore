@interface RBSProcessExitEvent
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (RBSProcessExitContext)context;
- (RBSProcessExitEvent)initWithRBSXPCCoder:(id)a3;
- (RBSProcessHandle)process;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setContext:(id)a3;
- (void)setProcess:(id)a3;
@end

@implementation RBSProcessExitEvent

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(RBSProcessExitEvent);
  [(RBSProcessExitEvent *)v4 setProcess:self->_process];
  [(RBSProcessExitEvent *)v4 setContext:self->_context];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSProcessExitEvent *)a3;
  if (self == v4) {
    goto LABEL_12;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
LABEL_3:
    char v6 = 0;
    goto LABEL_13;
  }
  process = self->_process;
  v8 = v4->_process;
  if (process != v8)
  {
    char v6 = 0;
    if (!process || !v8) {
      goto LABEL_13;
    }
    if (!-[RBSProcessHandle isEqual:](process, "isEqual:")) {
      goto LABEL_3;
    }
  }
  context = self->_context;
  v10 = v4->_context;
  if (context == v10)
  {
LABEL_12:
    char v6 = 1;
    goto LABEL_13;
  }
  char v6 = 0;
  if (context && v10) {
    char v6 = -[RBSProcessExitContext isEqual:](context, "isEqual:");
  }
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  return [(RBSProcessHandle *)self->_process hash];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| process:%@ context:%@>", v4, self->_process, self->_context];

  return (NSString *)v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  process = self->_process;
  id v5 = a3;
  [v5 encodeObject:process forKey:@"_process"];
  [v5 encodeObject:self->_context forKey:@"_context"];
}

- (RBSProcessExitEvent)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RBSProcessExitEvent;
  id v5 = [(RBSProcessExitEvent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_process"];
    process = v5->_process;
    v5->_process = (RBSProcessHandle *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_context"];
    context = v5->_context;
    v5->_context = (RBSProcessExitContext *)v8;
  }
  return v5;
}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (RBSProcessExitContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end