@interface RBSLaunchRequest
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)execute:(id *)a3;
- (BOOL)execute:(id *)a3 assertion:(id *)a4 error:(id *)a5;
- (BOOL)execute:(id *)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (RBSLaunchContext)context;
- (RBSLaunchRequest)initWithContext:(id)a3;
- (RBSLaunchRequest)initWithRBSXPCCoder:(id)a3;
- (id)executeRequest;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSLaunchRequest

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(RBSLaunchContext *)self->_context identity];
  v6 = [(RBSLaunchContext *)self->_context explanation];
  v7 = [v3 stringWithFormat:@"<%@| %@; \"%@\">", v4, v5, v6];

  return (NSString *)v7;
}

- (RBSLaunchContext)context
{
  return self->_context;
}

- (id)executeRequest
{
  v3 = +[RBSConnection sharedInstance];
  uint64_t v4 = [v3 executeLaunchRequest:self];

  return v4;
}

- (RBSLaunchRequest)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSLaunchRequest;
  v5 = [(RBSRequest *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_context"];
    context = v5->_context;
    v5->_context = (RBSLaunchContext *)v6;
  }
  return v5;
}

- (RBSLaunchRequest)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSLaunchRequest;
  v5 = [(RBSRequest *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    context = v5->_context;
    v5->_context = (RBSLaunchContext *)v6;
  }
  return v5;
}

- (BOOL)execute:(id *)a3 assertion:(id *)a4 error:(id *)a5
{
  v10 = [(RBSLaunchContext *)self->_context attributes];
  uint64_t v11 = [v10 count];

  if (!a4 && v11)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"RBSLaunchRequest.m" lineNumber:39 description:@"Cannot attempt to create an assertion during launch if the client will not retain the assertion"];
  }
  v13 = +[RBSConnection sharedInstance];
  v14 = [v13 executeLaunchRequest:self];

  v15 = [v14 process];
  v16 = v15;
  if (a3) {
    *a3 = v15;
  }
  v17 = [v14 assertion];
  v18 = v17;
  if (!a4)
  {
    [v17 invalidate];
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *a4 = v17;
  if (a5)
  {
LABEL_8:
    *a5 = [v14 error];
  }
LABEL_9:

  return v16 != 0;
}

- (BOOL)execute:(id *)a3 error:(id *)a4
{
  return [(RBSLaunchRequest *)self execute:a3 assertion:0 error:a4];
}

- (BOOL)execute:(id *)a3
{
  return [(RBSLaunchRequest *)self execute:0 assertion:0 error:a3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSLaunchRequest *)a3;
  BOOL v6 = 1;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class()
      || (context = self->_context, context != v4->_context) && !-[RBSLaunchContext isEqual:](context, "isEqual:"))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

@end