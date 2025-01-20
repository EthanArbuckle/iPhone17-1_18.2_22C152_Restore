@interface SKPartitionDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorWithVolume:(id)a3;
+ (id)descriptorWithVolume:(id)a3 size:(unint64_t)a4;
- (NSString)name;
- (SKFilesystem)filesystem;
- (SKPartitionDescriptor)initWithCoder:(id)a3;
- (SKPartitionDescriptor)initWithVolume:(id)a3 size:(unint64_t)a4;
- (SKVolumeDescriptor)innerDescriptor;
- (id)description;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setInnerDescriptor:(id)a3;
@end

@implementation SKPartitionDescriptor

- (SKPartitionDescriptor)initWithVolume:(id)a3 size:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKPartitionDescriptor;
  v8 = [(SKPartitionDescriptor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_innerDescriptor, a3);
    v9->_size = a4;
  }

  return v9;
}

+ (id)descriptorWithVolume:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithVolume:v3 size:0];

  return v4;
}

+ (id)descriptorWithVolume:(id)a3 size:(unint64_t)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithVolume:v5 size:a4];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  v2 = [(SKPartitionDescriptor *)self innerDescriptor];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (SKFilesystem)filesystem
{
  v2 = [(SKPartitionDescriptor *)self innerDescriptor];
  id v3 = [v2 filesystem];

  return (SKFilesystem *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SKPartitionDescriptor *)self innerDescriptor];
  [v4 encodeObject:v5 forKey:@"descriptor"];

  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKPartitionDescriptor size](self, "size"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"size"];
}

- (SKPartitionDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKPartitionDescriptor;
  id v5 = [(SKPartitionDescriptor *)&v11 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"descriptor"];
    innerDescriptor = v5->_innerDescriptor;
    v5->_innerDescriptor = (SKVolumeDescriptor *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    v5->_size = [v9 unsignedLongLongValue];
  }
  return v5;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [(SKPartitionDescriptor *)self size];
  uint64_t v7 = [(SKPartitionDescriptor *)self innerDescriptor];
  v8 = [v3 stringWithFormat:@"<%@: { size: \"%lu\", innerDescriptor: \"%@\"}>", v5, v6, v7];

  return v8;
}

- (unint64_t)size
{
  return self->_size;
}

- (SKVolumeDescriptor)innerDescriptor
{
  return self->_innerDescriptor;
}

- (void)setInnerDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end