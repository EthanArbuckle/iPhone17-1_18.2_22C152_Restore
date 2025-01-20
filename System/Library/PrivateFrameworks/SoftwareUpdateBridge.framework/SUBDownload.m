@interface SUBDownload
+ (BOOL)supportsSecureCoding;
+ (id)downloadWithDescriptor:(id)a3 andProgress:(id)a4;
- (SUBDescriptor)descriptor;
- (SUBDownload)initWithCoder:(id)a3;
- (SUBProgress)progress;
- (id)copy;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation SUBDownload

+ (id)downloadWithDescriptor:(id)a3 andProgress:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SUBDownload);
  v8 = (void *)[v6 copy];

  [(SUBDownload *)v7 setDescriptor:v8];
  v9 = (void *)[v5 copy];

  [(SUBDownload *)v7 setProgress:v9];
  return v7;
}

- (SUBDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUBDownload;
  id v5 = [(SUBDownload *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (SUBDescriptor *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"progress"];
    progress = v5->_progress;
    v5->_progress = (SUBProgress *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  descriptor = self->_descriptor;
  id v5 = a3;
  [v5 encodeObject:descriptor forKey:@"descriptor"];
  [v5 encodeObject:self->_progress forKey:@"progress"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Descriptor: %@\nProgress: %@", self->_descriptor, self->_progress];
}

- (id)copy
{
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

- (SUBDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (SUBProgress)progress
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