@interface VisionCoreTensorDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorForEspressoBlobDimensions:(id *)a3 dataType:(unint64_t)a4 error:(id *)a5;
- (BOOL)E5RTExecutionContextAssignNewTensorInstanceToNamedObjects:(id)a3 error:(id *)a4;
- (BOOL)getByteOffset:(unint64_t *)a3 forPosition:(const unint64_t *)a4 rank:(unint64_t)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (VisionCoreTensorDescriptor)initWithANSTTensorDescriptor:(id)a3;
- (VisionCoreTensorDescriptor)initWithCoder:(id)a3;
- (VisionCoreTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 shape:(id)a5 strides:(id)a6;
- (VisionCoreTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 shape:(id)a5 strides:(id)a6 storageByteCount:(unint64_t)a7;
- (VisionCoreTensorShape)shape;
- (VisionCoreTensorStrides)strides;
- (id)E5RTExecutionContextNewIOSurfacePropertiesAndReturnError:(id *)a3;
- (id)confidencesDescriptorWithLabelsFileURL:(id)a3 error:(id *)a4;
- (id)description;
- (unint64_t)dataType;
- (unint64_t)hash;
- (unint64_t)storageByteCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreTensorDescriptor

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (unint64_t)storageByteCount
{
  return self->_storageByteCount;
}

- (VisionCoreTensorStrides)strides
{
  return self->_strides;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (VisionCoreTensorDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"type"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shape"];
    if (v7)
    {
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"strides"];
      if (v8)
      {
        self = -[VisionCoreTensorDescriptor initWithName:dataType:shape:strides:storageByteCount:](self, "initWithName:dataType:shape:strides:storageByteCount:", v5, v6, v7, v8, [v4 decodeInt64ForKey:@"storageByteCount"]);
        v9 = self;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeInteger:self->_dataType forKey:@"type"];
  [v5 encodeObject:self->_shape forKey:@"shape"];
  [v5 encodeObject:self->_strides forKey:@"strides"];
  [v5 encodeInt64:self->_storageByteCount forKey:@"storageByteCount"];
}

- (id)description
{
  id v3 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)VisionCoreTensorDescriptor;
  id v4 = [(VisionCoreDescriptor *)&v10 description];
  id v5 = [(VisionCoreTensorDescriptor *)self name];
  uint64_t v6 = NSStringFromVisionCoreTensorDataType([(VisionCoreTensorDescriptor *)self dataType]);
  v7 = [(VisionCoreTensorDescriptor *)self shape];
  v8 = (void *)[v3 initWithFormat:@"%@ \"%@\" %@ %@", v4, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VisionCoreTensorDescriptor *)a3;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(VisionCoreTensorDescriptor *)self name];
      v7 = [(VisionCoreTensorDescriptor *)v5 name];
      int v8 = [v6 isEqualToString:v7];

      if (!v8) {
        goto LABEL_9;
      }
      unint64_t v9 = [(VisionCoreTensorDescriptor *)self dataType];
      if (v9 != [(VisionCoreTensorDescriptor *)v5 dataType]) {
        goto LABEL_9;
      }
      objc_super v10 = [(VisionCoreTensorDescriptor *)self shape];
      v11 = [(VisionCoreTensorDescriptor *)v5 shape];
      int v12 = [v10 isEqual:v11];

      if (v12)
      {
        v13 = [(VisionCoreTensorDescriptor *)self strides];
        v14 = [(VisionCoreTensorDescriptor *)v5 strides];
        char v15 = [v13 isEqual:v14];
      }
      else
      {
LABEL_9:
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  v2 = [(VisionCoreTensorDescriptor *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (VisionCoreTensorShape)shape
{
  return self->_shape;
}

- (BOOL)getByteOffset:(unint64_t *)a3 forPosition:(const unint64_t *)a4 rank:(unint64_t)a5 error:(id *)a6
{
  v11 = [(VisionCoreTensorDescriptor *)self shape];
  if ([v11 rank] == a5)
  {
    id v12 = v11;
    uint64_t v13 = [v12 sizes];
    id v14 = [(VisionCoreTensorDescriptor *)self strides];
    uint64_t v15 = [v14 byteOffsets];

    if (a5)
    {
      uint64_t v16 = 0;
      unint64_t v17 = 0;
      while (1)
      {
        unint64_t v18 = a4[v16];
        if (v18 >= *(void *)(v13 + 8 * v16)) {
          break;
        }
        v17 += *(void *)(v15 + 8 * v16++) * v18;
        if (a5 == v16) {
          goto LABEL_10;
        }
      }
      if (a6)
      {
        uint64_t v19 = [[NSString alloc] initWithFormat:@"A position of %lu at index %lu is out of range for a shape of %@", a4[v16], v16, v12];
        goto LABEL_13;
      }
    }
    else
    {
      unint64_t v17 = 0;
LABEL_10:
      *a3 = v17;
      LOBYTE(a6) = 1;
    }
  }
  else if (a6)
  {
    uint64_t v19 = [[NSString alloc] initWithFormat:@"A rank of %lu is out of range for a shape of %@", a5, v11, v22];
LABEL_13:
    v20 = (void *)v19;
    *a6 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v19];

    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

- (VisionCoreTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 shape:(id)a5 strides:(id)a6 storageByteCount:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = (VisionCoreTensorStrides *)a6;
  v20.receiver = self;
  v20.super_class = (Class)VisionCoreTensorDescriptor;
  uint64_t v15 = [(VisionCoreTensorDescriptor *)&v20 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    name = v15->_name;
    v15->_name = (NSString *)v16;

    v15->_dataType = a4;
    objc_storeStrong((id *)&v15->_shape, a5);
    unint64_t v18 = v14;
    if (!v14) {
      unint64_t v18 = [[VisionCoreTensorStrides alloc] initWithShape:v13 dataType:a4];
    }
    objc_storeStrong((id *)&v15->_strides, v18);
    if (!v14) {

    }
    v15->_storageByteCount = a7;
  }

  return v15;
}

- (VisionCoreTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 shape:(id)a5 strides:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = -[VisionCoreTensorDescriptor initWithName:dataType:shape:strides:storageByteCount:](self, "initWithName:dataType:shape:strides:storageByteCount:", v12, a4, v11, v10, ((unsigned __int16)a4 >> 3) * [v11 elementCount]);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptorForEspressoBlobDimensions:(id *)a3 dataType:(unint64_t)a4 error:(id *)a5
{
  if (a3->var0)
  {
    int v8 = (void *)[[NSString alloc] initWithUTF8String:a3->var0];
    long long v9 = *(_OWORD *)&a3->var2;
    v14[0] = *(_OWORD *)&a3->var0;
    v14[1] = v9;
    unint64_t var4 = a3->var4;
    id v10 = +[VisionCoreEspressoTensorShape shapeForBlobDimensions:v14];
    id v11 = (void *)[objc_alloc((Class)a1) initWithName:v8 dataType:a4 shape:v10 strides:0];
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", @"name cannot be NULL", a4);
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (id)confidencesDescriptorWithLabelsFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = self;
    int v8 = [(VisionCoreTensorDescriptor *)v7 labelsFileURL];
    char v9 = [v8 isEqual:v6];

    if (v9) {
      goto LABEL_17;
    }
  }
  unint64_t v10 = [(VisionCoreTensorDescriptor *)self dataType];
  uint64_t v11 = v10;
  if (v10 == 65552 || v10 == 65568)
  {
    id v12 = [(VisionCoreTensorDescriptor *)self shape];
    uint64_t v27 = 0;
    v7 = 0;
    if ([v12 getOneDimensionalArrayDimensionIndex:&v27 error:a4])
    {
      id v13 = [VisionCoreLabeledConfidencesDescriptor alloc];
      id v14 = [(VisionCoreTensorDescriptor *)self name];
      uint64_t v15 = [(VisionCoreTensorDescriptor *)self strides];
      uint64_t v16 = [(VisionCoreLabeledConfidencesDescriptor *)v13 initWithName:v14 dataType:v11 shape:v12 strides:v15 labelsFileURL:v6];

      uint64_t v17 = [v12 elementCount];
      unint64_t v18 = [(VisionCoreLabeledConfidencesDescriptor *)v16 labels];
      uint64_t v19 = [v18 count];

      if (v19 == v17)
      {
        v7 = v16;
      }
      else
      {
        if (a4)
        {
          id v23 = [NSString alloc];
          v24 = [v6 path];
          v25 = (void *)[v23 initWithFormat:@"Labels file %@ contains %lu entries but the confidences descriptor has %lu elements", v24, v19, v17];

          *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v25];
        }
        v7 = 0;
      }
    }
  }
  else
  {
    if (a4)
    {
      id v20 = [NSString alloc];
      v21 = NSStringFromVisionCoreTensorDataType(v11);
      uint64_t v22 = (void *)[v20 initWithFormat:@"%@ is not a supported confidences type", v21];

      *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v22];
    }
    v7 = 0;
  }
LABEL_17:

  return v7;
}

- (BOOL)E5RTExecutionContextAssignNewTensorInstanceToNamedObjects:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFDictionaryRef v7 = [(VisionCoreTensorDescriptor *)self E5RTExecutionContextNewIOSurfacePropertiesAndReturnError:a4];
  CFDictionaryRef v8 = v7;
  if (!v7) {
    goto LABEL_6;
  }
  IOSurfaceRef v9 = IOSurfaceCreate(v7);
  if (!v9)
  {
    if (!a4) {
      goto LABEL_7;
    }
    id v12 = (void *)[[NSString alloc] initWithFormat:@"Could not create IOSurfaceRef with properties %@", v8];
    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidOperationWithLocalizedDescription:v12];

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  IOSurfaceRef v10 = v9;
  uint64_t v11 = [(VisionCoreTensorDescriptor *)self name];
  LOBYTE(a4) = [v6 assignSurface:v10 toName:v11 error:a4];

  CFRelease(v10);
LABEL_7:

  return a4 & 1;
}

- (id)E5RTExecutionContextNewIOSurfacePropertiesAndReturnError:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[VisionCoreTensorDescriptor storageByteCount](self, "storageByteCount"));
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F0ED30]];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", (unsigned __int16)-[VisionCoreTensorDescriptor dataType](self, "dataType") >> 3);
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F0ED48]];

  return v4;
}

- (VisionCoreTensorDescriptor)initWithANSTTensorDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 dataType];
  uint64_t v6 = 131080;
  switch(v5)
  {
    case 'c':
      break;
    case 'd':
      uint64_t v6 = 65600;
      break;
    case 'e':
    case 'g':
      goto LABEL_6;
    case 'f':
      uint64_t v6 = 65568;
      break;
    case 'h':
      uint64_t v6 = 65552;
      break;
    case 'i':
      uint64_t v6 = 131104;
      break;
    default:
      if (v5 == 73)
      {
        uint64_t v6 = 196640;
      }
      else if (v5 == 67)
      {
        uint64_t v6 = 196616;
      }
      else
      {
LABEL_6:
        uint64_t v6 = 0;
      }
      break;
  }
  CFDictionaryRef v7 = -[VisionCoreTensorShape initWithBatchNumber:channels:height:width:]([VisionCoreTensorShape alloc], "initWithBatchNumber:channels:height:width:", [v4 lengthOfDimensionAt:0], objc_msgSend(v4, "lengthOfDimensionAt:", 1), objc_msgSend(v4, "lengthOfDimensionAt:", 2), objc_msgSend(v4, "lengthOfDimensionAt:", 3));
  CFDictionaryRef v8 = [[VisionCoreTensorStrides alloc] initWithShape:v7 dataType:v6];
  IOSurfaceRef v9 = [v4 name];
  IOSurfaceRef v10 = [(VisionCoreTensorDescriptor *)self initWithName:v9 dataType:v6 shape:v7 strides:v8];

  return v10;
}

@end