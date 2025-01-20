@interface VGFrameRejectionState
+ (BOOL)supportsSecureCoding;
+ (unint64_t)parseInternalRejection:(int)a3;
- (BOOL)isEqual:(id)a3;
- (FrameRejectionState)internal;
- (NSDictionary)debugDictionary;
- (NSString)description;
- (VGFrameRejectionState)initWithCoder:(id)a3;
- (float)outOfDistanceRangeOffset;
- (float)outOfFovOffset;
- (id).cxx_construct;
- (id)initFromInternalRejectionState:(FrameRejectionState *)a3;
- (unint64_t)reason;
- (void)encodeWithCoder:(id)a3;
- (void)setInternal:(FrameRejectionState *)a3;
@end

@implementation VGFrameRejectionState

+ (unint64_t)parseInternalRejection:(int)a3
{
  if (a3 > 0x2A) {
    return 1;
  }
  else {
    return qword_260D21B40[a3];
  }
}

- (id)initFromInternalRejectionState:(FrameRejectionState *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VGFrameRejectionState;
  v4 = [(VGFrameRejectionState *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_internal.reason = a3->reason;
    objc_storeStrong((id *)&v4->_internal.description, a3->description);
    *(void *)&v5->_internal.outOfFovOffset = *(void *)&a3->outOfFovOffset;
    objc_storeStrong((id *)&v5->_internal.debugDictionary, a3->debugDictionary);
    v6 = v5;
  }

  return v5;
}

- (unint64_t)reason
{
  return +[VGFrameRejectionState parseInternalRejection:self->_internal.reason];
}

- (NSString)description
{
  return self->_internal.description;
}

- (float)outOfFovOffset
{
  return self->_internal.outOfFovOffset;
}

- (float)outOfDistanceRangeOffset
{
  return self->_internal.outOfDistanceRangeOffset;
}

- (NSDictionary)debugDictionary
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGFrameRejectionState)initWithCoder:(id)a3
{
  v24[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v24[3] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
  int v6 = [v4 decodeIntForKey:@"reason"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
  [v4 decodeFloatForKey:@"outOfFovOffset"];
  int v9 = v8;
  [v4 decodeFloatForKey:@"outOfDistanceRangeOffset"];
  int v11 = v10;
  v12 = [MEMORY[0x263EFFA08] setWithArray:v5];
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"debugDictionary"];

  int v19 = v6;
  id v14 = v7;
  id v20 = v14;
  int v21 = v9;
  int v22 = v11;
  id v15 = v13;
  v16 = v15;
  id v23 = v15;
  if (self)
  {
    v17 = [(VGFrameRejectionState *)self initFromInternalRejectionState:&v19];
  }
  else
  {

    v17 = 0;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInt:self->_internal.reason forKey:@"reason"];
  [v6 encodeObject:self->_internal.description forKey:@"description"];
  *(float *)&double v4 = self->_internal.outOfFovOffset;
  [v6 encodeFloat:@"outOfFovOffset" forKey:v4];
  *(float *)&double v5 = self->_internal.outOfDistanceRangeOffset;
  [v6 encodeFloat:@"outOfDistanceRangeOffset" forKey:v5];
  [v6 encodeObject:self->_internal.debugDictionary forKey:@"debugDictionary"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = v4;
    if (self->_internal.reason == *((_DWORD *)v5 + 2)
      && ((description = self->_internal.description, !((unint64_t)description | v5[2]))
       || -[NSString isEqual:](description, "isEqual:"))
      && self->_internal.outOfFovOffset == *((float *)v5 + 6)
      && self->_internal.outOfDistanceRangeOffset == *((float *)v5 + 7))
    {
      debugDictionary = self->_internal.debugDictionary;
      if ((unint64_t)debugDictionary | v5[4]) {
        char v8 = -[NSDictionary isEqualToDictionary:](debugDictionary, "isEqualToDictionary:");
      }
      else {
        char v8 = 1;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (FrameRejectionState)internal
{
  retstr->reason = self->_internal.reason;
  double v5 = self->_internal.description;
  uint64_t v6 = *(void *)&self->_internal.outOfFovOffset;
  debugDictionary = self->_internal.debugDictionary;
  retstr->description = v5;
  *(void *)&retstr->outOfFovOffset = v6;
  result = debugDictionary;
  retstr->debugDictionary = (NSDictionary *)result;
  return result;
}

- (void)setInternal:(FrameRejectionState *)a3
{
  self->_internal.reason = a3->reason;
  objc_storeStrong((id *)&self->_internal.description, a3->description);
  *(void *)&self->_internal.outOfFovOffset = *(void *)&a3->outOfFovOffset;
  objc_storeStrong((id *)&self->_internal.debugDictionary, a3->debugDictionary);

  description = a3->description;
}

- (void).cxx_destruct
{
  description = self->_internal.description;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end