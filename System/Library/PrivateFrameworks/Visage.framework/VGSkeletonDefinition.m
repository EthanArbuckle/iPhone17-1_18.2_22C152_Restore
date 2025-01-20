@interface VGSkeletonDefinition
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)parentChildOrder;
- (VGSkeletonDefinition)initWithCoder:(id)a3;
- (int)skeletonType;
- (int64_t)rootJointIndex;
- (unint64_t)jointCount;
- (void)encodeWithCoder:(id)a3;
- (void)setJointCount:(unint64_t)a3;
- (void)setParentChildOrder:(id)a3;
- (void)setRootJointIndex:(int64_t)a3;
- (void)setSkeletonType:(int)a3;
@end

@implementation VGSkeletonDefinition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", -[VGSkeletonDefinition jointCount](self, "jointCount"), @"jointCount");
  objc_msgSend(v5, "encodeInteger:forKey:", -[VGSkeletonDefinition rootJointIndex](self, "rootJointIndex"), @"rootJointIndex");
  v4 = [(VGSkeletonDefinition *)self parentChildOrder];
  [v5 encodeObject:v4 forKey:@"parentChildOrder"];

  objc_msgSend(v5, "encodeInt:forKey:", -[VGSkeletonDefinition skeletonType](self, "skeletonType"), @"skeletonType");
}

- (VGSkeletonDefinition)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VGSkeletonDefinition;
  id v5 = [(VGSkeletonDefinition *)&v12 init];
  if (v5)
  {
    -[VGSkeletonDefinition setJointCount:](v5, "setJointCount:", [v4 decodeInt64ForKey:@"jointCount"]);
    -[VGSkeletonDefinition setRootJointIndex:](v5, "setRootJointIndex:", [v4 decodeIntegerForKey:@"rootJointIndex"]);
    v6 = (void *)MEMORY[0x263EFFA08];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"parentChildOrder"];
    [(VGSkeletonDefinition *)v5 setParentChildOrder:v9];

    -[VGSkeletonDefinition setSkeletonType:](v5, "setSkeletonType:", [v4 decodeIntForKey:@"skeletonType"]);
    v10 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(VGSkeletonDefinition *)self jointCount] == *((void *)v5 + 2)
      && [(VGSkeletonDefinition *)self rootJointIndex] == *((void *)v5 + 3))
    {
      v6 = [(VGSkeletonDefinition *)self parentChildOrder];
      if (v6 || *((void *)v5 + 4))
      {
        v7 = [(VGSkeletonDefinition *)self parentChildOrder];
        if ([v7 isEqual:*((void *)v5 + 4)]) {
          BOOL v8 = [(VGSkeletonDefinition *)self skeletonType] == v5[2];
        }
        else {
          BOOL v8 = 0;
        }
      }
      else
      {
        BOOL v8 = [(VGSkeletonDefinition *)self skeletonType] == v5[2];
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)jointCount
{
  return self->_jointCount;
}

- (void)setJointCount:(unint64_t)a3
{
  self->_jointCount = a3;
}

- (int64_t)rootJointIndex
{
  return self->_rootJointIndex;
}

- (void)setRootJointIndex:(int64_t)a3
{
  self->_rootJointIndex = a3;
}

- (NSArray)parentChildOrder
{
  return self->_parentChildOrder;
}

- (void)setParentChildOrder:(id)a3
{
}

- (int)skeletonType
{
  return self->_skeletonType;
}

- (void)setSkeletonType:(int)a3
{
  self->_skeletonType = a3;
}

- (void).cxx_destruct
{
}

@end