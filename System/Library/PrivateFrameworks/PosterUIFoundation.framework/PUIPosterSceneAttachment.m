@interface PUIPosterSceneAttachment
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PUIPosterSceneAttachment)initWithBSXPCCoder:(id)a3;
- (PUIPosterSceneAttachment)initWithCoder:(id)a3;
- (PUIPosterSceneAttachment)initWithContextId:(unsigned int)a3 renderId:(unint64_t)a4 level:(int64_t)a5;
- (int64_t)level;
- (unint64_t)renderId;
- (unsigned)contextId;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIPosterSceneAttachment

- (PUIPosterSceneAttachment)initWithContextId:(unsigned int)a3 renderId:(unint64_t)a4 level:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PUIPosterSceneAttachment;
  result = [(PUIPosterSceneAttachment *)&v9 init];
  if (result)
  {
    result->_contextId = a3;
    result->_level = a5;
    result->_renderId = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PUIPosterSceneAttachment *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4)
  {
    uint64_t v6 = objc_opt_class();
    v7 = v5;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    if (v10
      && (uint64_t v11 = [(PUIPosterSceneAttachment *)v10 renderId],
          v11 == [(PUIPosterSceneAttachment *)self renderId])
      && (unsigned int v12 = [(PUIPosterSceneAttachment *)v10 contextId],
          v12 == [(PUIPosterSceneAttachment *)self contextId]))
    {
      uint64_t v13 = [(PUIPosterSceneAttachment *)v10 level];
      BOOL v9 = v13 == [(PUIPosterSceneAttachment *)self level];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendUInt64:self->_contextId withName:@"_contextId"];
  id v5 = (id)[v3 appendUInt64:self->_renderId withName:@"_renderId"];
  id v6 = (id)[v3 appendInt64:self->_level withName:@"_level"];
  v7 = [v3 build];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  uint64_t contextId = self->_contextId;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedInt:contextId];
  [v6 encodeObject:v7 forKey:@"_contextId"];

  v8 = [NSNumber numberWithUnsignedLongLong:self->_renderId];
  [v6 encodeObject:v8 forKey:@"_renderId"];

  id v9 = [NSNumber numberWithInteger:self->_level];
  [v6 encodeObject:v9 forKey:@"_level"];
}

- (PUIPosterSceneAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUIPosterSceneAttachment;
  id v5 = [(PUIPosterSceneAttachment *)&v13 init];
  if (v5)
  {
    id v6 = self;
    v7 = [v4 decodeObjectOfClass:v6 forKey:@"_contextId"];
    v5->_uint64_t contextId = [v7 unsignedIntValue];

    v8 = self;
    id v9 = [v4 decodeObjectOfClass:v8 forKey:@"_renderId"];
    v5->_renderId = [v9 unsignedLongLongValue];

    v10 = self;
    uint64_t v11 = [v4 decodeObjectOfClass:v10 forKey:@"_level"];
    v5->_level = [v11 unsignedIntegerValue];
  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = NSNumber;
  uint64_t contextId = self->_contextId;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedInt:contextId];
  [v6 encodeObject:v7 forKey:@"_contextId"];

  v8 = [NSNumber numberWithUnsignedLongLong:self->_renderId];
  [v6 encodeObject:v8 forKey:@"_renderId"];

  id v9 = [NSNumber numberWithInteger:self->_level];
  [v6 encodeObject:v9 forKey:@"_level"];
}

- (PUIPosterSceneAttachment)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PUIPosterSceneAttachment *)self init];
  if (v5)
  {
    id v6 = self;
    v7 = [v4 decodeObjectOfClass:v6 forKey:@"_contextId"];
    v5->_uint64_t contextId = [v7 unsignedIntValue];

    v8 = self;
    id v9 = [v4 decodeObjectOfClass:v8 forKey:@"_renderId"];
    v5->_renderId = [v9 unsignedLongLongValue];

    v10 = self;
    uint64_t v11 = [v4 decodeObjectOfClass:v10 forKey:@"_level"];
    v5->_level = [v11 unsignedIntegerValue];
  }
  return v5;
}

- (int64_t)level
{
  return self->_level;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (unint64_t)renderId
{
  return self->_renderId;
}

@end