@interface SUControllerDownload
+ (BOOL)supportsSecureCoding;
+ (id)downloadWithDescriptor:(id)a3 andProgress:(id)a4;
- (SUControllerDescriptor)descriptor;
- (SUControllerDownload)initWithCoder:(id)a3;
- (SUControllerDownload)initWithDescriptor:(id)a3;
- (SUControllerProgress)progress;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation SUControllerDownload

+ (id)downloadWithDescriptor:(id)a3 andProgress:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SUControllerDownload);
  v8 = (void *)[v6 copy];

  [(SUControllerDownload *)v7 setDescriptor:v8];
  v9 = (void *)[v5 copy];

  [(SUControllerDownload *)v7 setProgress:v9];

  return v7;
}

- (SUControllerDownload)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUControllerDownload;
  id v6 = [(SUControllerDownload *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_descriptor, a3);
  }

  return v7;
}

- (SUControllerDownload)initWithCoder:(id)a3
{
  v19[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUControllerDownload;
  id v5 = [(SUControllerDownload *)&v17 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
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
  id v5 = [(SUControllerDownload *)self descriptor];
  [v4 encodeObject:v5 forKey:@"descriptor"];

  id v6 = [(SUControllerDownload *)self progress];
  [v4 encodeObject:v6 forKey:@"progress"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUControllerDownload *)self descriptor];
  id v5 = [(SUControllerDownload *)self progress];
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