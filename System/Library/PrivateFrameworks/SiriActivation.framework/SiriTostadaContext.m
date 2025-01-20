@interface SiriTostadaContext
+ (BOOL)supportsSecureCoding;
- (NSSet)launchActions;
- (SiriTostadaContext)initWithCoder:(id)a3;
- (SiriTostadaContext)initWithLaunchActions:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLaunchActions:(id)a3;
@end

@implementation SiriTostadaContext

- (id)description
{
  v2 = NSString;
  v3 = [(NSSet *)self->_launchActions description];
  v4 = [v2 stringWithFormat:@"<SiriTostadaContext launchActions:%@", v3];

  return v4;
}

- (SiriTostadaContext)initWithLaunchActions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriTostadaContext;
  v6 = [(SiriTostadaContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_launchActions, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriTostadaContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriTostadaContext;
  id v5 = [(SiriContext *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"launchActions"];
    launchActions = v5->_launchActions;
    v5->_launchActions = (NSSet *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriTostadaContext;
  id v4 = a3;
  [(SiriContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_launchActions, @"launchActions", v5.receiver, v5.super_class);
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (void)setLaunchActions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end