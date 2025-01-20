@interface SUControllerApply
+ (BOOL)supportsSecureCoding;
- (SUControllerApply)initWithCoder:(id)a3;
- (SUControllerDescriptor)descriptor;
- (SUControllerProgress)progress;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation SUControllerApply

- (SUControllerApply)initWithCoder:(id)a3
{
  v19[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUControllerApply;
  v5 = [(SUControllerApply *)&v17 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:6];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"descriptor"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (SUControllerDescriptor *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    v13 = [v11 setWithArray:v12];

    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"progress"];
    progress = v5->_progress;
    v5->_progress = (SUControllerProgress *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SUControllerApply *)self descriptor];
  [v4 encodeObject:v5 forKey:@"descriptor"];

  id v6 = [(SUControllerApply *)self progress];
  [v4 encodeObject:v6 forKey:@"progress"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUControllerApply *)self descriptor];
  v5 = [(SUControllerApply *)self progress];
  id v6 = [v3 stringWithFormat:@"Descriptor: %@\nProgress: %@", v4, v5];

  return v6;
}

- (SUControllerDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (SUControllerProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end