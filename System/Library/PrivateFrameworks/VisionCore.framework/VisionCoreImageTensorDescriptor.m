@interface VisionCoreImageTensorDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VisionCoreImageTensorDescriptor)initWithANSTPixelBufferDescriptor:(id)a3;
- (VisionCoreImageTensorDescriptor)initWithCoder:(id)a3;
- (VisionCoreImageTensorDescriptor)initWithName:(id)a3 pixelFormatType:(unsigned int)a4 pixelWidth:(unint64_t)a5 pixelHeight:(unint64_t)a6;
- (id)E5RTExecutionContextNewIOSurfacePropertiesAndReturnError:(id *)a3;
- (id)description;
- (unint64_t)bytesPerRow;
- (unint64_t)hash;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unsigned)pixelFormatType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreImageTensorDescriptor

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (unsigned)pixelFormatType
{
  return self->_pixelFormatType;
}

- (VisionCoreImageTensorDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  if (v5)
  {
    self = -[VisionCoreImageTensorDescriptor initWithName:pixelFormatType:pixelWidth:pixelHeight:](self, "initWithName:pixelFormatType:pixelWidth:pixelHeight:", v5, [v4 decodeInt32ForKey:@"pixelFormat"], (int)objc_msgSend(v4, "decodeInt32ForKey:", @"w"), (int)objc_msgSend(v4, "decodeInt32ForKey:", @"h"));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(VisionCoreTensorDescriptor *)self name];
  [v5 encodeObject:v4 forKey:@"name"];

  objc_msgSend(v5, "encodeInt32:forKey:", -[VisionCoreImageTensorDescriptor pixelFormatType](self, "pixelFormatType"), @"pixelFormat");
  objc_msgSend(v5, "encodeInt32:forKey:", -[VisionCoreImageTensorDescriptor pixelWidth](self, "pixelWidth"), @"w");
  objc_msgSend(v5, "encodeInt32:forKey:", -[VisionCoreImageTensorDescriptor pixelHeight](self, "pixelHeight"), @"h");
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)VisionCoreImageTensorDescriptor;
  id v4 = [(VisionCoreTensorDescriptor *)&v8 description];
  id v5 = VisionCoreFourCharCodeToString([(VisionCoreImageTensorDescriptor *)self pixelFormatType]);
  v6 = (void *)[v3 initWithFormat:@"%@ %@ %lu x %lu", v4, v5, -[VisionCoreImageTensorDescriptor pixelWidth](self, "pixelWidth"), -[VisionCoreImageTensorDescriptor pixelHeight](self, "pixelHeight")];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VisionCoreImageTensorDescriptor *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unsigned int v6 = [(VisionCoreImageTensorDescriptor *)self pixelFormatType];
      if (v6 == [(VisionCoreImageTensorDescriptor *)v5 pixelFormatType]
        && (unint64_t v7 = [(VisionCoreImageTensorDescriptor *)self pixelWidth],
            v7 == [(VisionCoreImageTensorDescriptor *)v5 pixelWidth])
        && (unint64_t v8 = [(VisionCoreImageTensorDescriptor *)self pixelHeight],
            v8 == [(VisionCoreImageTensorDescriptor *)v5 pixelHeight]))
      {
        unint64_t v9 = [(VisionCoreImageTensorDescriptor *)self bytesPerRow];
        BOOL v10 = v9 == [(VisionCoreImageTensorDescriptor *)v5 bytesPerRow];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)VisionCoreImageTensorDescriptor;
  unint64_t v3 = [(VisionCoreTensorDescriptor *)&v8 hash];
  uint64_t v4 = [(VisionCoreImageTensorDescriptor *)self pixelFormatType];
  unint64_t v5 = v4 ^ [(VisionCoreImageTensorDescriptor *)self pixelWidth];
  unint64_t v6 = v5 ^ [(VisionCoreImageTensorDescriptor *)self pixelHeight];
  return v3 ^ v6 ^ [(VisionCoreImageTensorDescriptor *)self bytesPerRow];
}

- (VisionCoreImageTensorDescriptor)initWithName:(id)a3 pixelFormatType:(unsigned int)a4 pixelWidth:(unint64_t)a5 pixelHeight:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  if ((int)v8 <= 1278226487)
  {
    if ((int)v8 <= 39)
    {
      if (v8 == 8) {
        goto LABEL_19;
      }
      if (v8 == 32) {
        goto LABEL_18;
      }
    }
    else
    {
      if (v8 == 40) {
        goto LABEL_19;
      }
      if (v8 == 1094862674 || v8 == 1111970369) {
        goto LABEL_18;
      }
    }
LABEL_21:
    unint64_t v12 = 0;
    int v11 = 1;
    goto LABEL_22;
  }
  if ((int)v8 <= 1380401728)
  {
    if (v8 != 1278226488)
    {
      if (v8 == 1278226534)
      {
        int v11 = 0;
        unint64_t v12 = 983072;
        goto LABEL_22;
      }
      if (v8 == 1278226536)
      {
        int v11 = 0;
        unint64_t v12 = 983056;
        goto LABEL_22;
      }
      goto LABEL_21;
    }
LABEL_19:
    int v11 = 0;
    unint64_t v12 = 983048;
    goto LABEL_22;
  }
  if (v8 == 1380401729)
  {
LABEL_18:
    int v11 = 0;
    unint64_t v12 = 196640;
    goto LABEL_22;
  }
  int v11 = 0;
  unint64_t v12 = 65600;
  if (v8 != 1647719521 && v8 != 1815491698) {
    goto LABEL_21;
  }
LABEL_22:
  v13 = [[VisionCoreTensorShape alloc] initWithPixelFormatType:v8 width:a5 height:a6];
  v17.receiver = self;
  v17.super_class = (Class)VisionCoreImageTensorDescriptor;
  v14 = [(VisionCoreTensorDescriptor *)&v17 initWithName:v10 dataType:v12 shape:v13 strides:0];

  if (v14)
  {
    v14->_pixelFormatType = v8;
    v14->_pixelWidth = a5;
    v14->_pixelHeight = a6;
    unint64_t v15 = ((v12 >> 3) & 0xF) * a5;
    if (v11) {
      unint64_t v15 = 0;
    }
    v14->_bytesPerRow = v15;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VisionCoreImageTensorDescriptor)initWithANSTPixelBufferDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pixelFormatType];
  uint64_t v6 = [v4 width];
  uint64_t v7 = [v4 height];
  uint64_t v8 = [v4 name];

  unint64_t v9 = [(VisionCoreImageTensorDescriptor *)self initWithName:v8 pixelFormatType:v5 pixelWidth:v6 pixelHeight:v7];
  return v9;
}

- (id)E5RTExecutionContextNewIOSurfacePropertiesAndReturnError:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VisionCoreImageTensorDescriptor;
  id v4 = [(VisionCoreTensorDescriptor *)&v11 E5RTExecutionContextNewIOSurfacePropertiesAndReturnError:a3];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[VisionCoreImageTensorDescriptor pixelWidth](self, "pixelWidth"));
    [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F0EF50]];

    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[VisionCoreImageTensorDescriptor pixelHeight](self, "pixelHeight"));
    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F0EDF8]];

    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[VisionCoreImageTensorDescriptor bytesPerRow](self, "bytesPerRow"));
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x263F0ED50]];

    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VisionCoreImageTensorDescriptor pixelFormatType](self, "pixelFormatType"));
    [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x263F0EE48]];

    id v9 = v4;
  }

  return v4;
}

@end