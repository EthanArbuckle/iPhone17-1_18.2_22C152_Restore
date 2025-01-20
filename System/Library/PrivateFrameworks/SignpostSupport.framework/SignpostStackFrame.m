@interface SignpostStackFrame
- (BOOL)isEqual:(id)a3;
- (NSUUID)symbolOwnerUUID;
- (SignpostStackFrame)initWithArrayRepresentation:(id)a3;
- (SignpostStackFrame)initWithUUID:(id)a3 offset:(unint64_t)a4;
- (id)_serializableArrayRepresentation;
- (id)debugDescription;
- (unint64_t)offset;
@end

@implementation SignpostStackFrame

- (void).cxx_destruct
{
}

- (SignpostStackFrame)initWithUUID:(id)a3 offset:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SignpostStackFrame;
  v8 = [(SignpostStackFrame *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_symbolOwnerUUID, a3);
    v9->_offset = a4;
  }

  return v9;
}

- (id)_serializableArrayRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = [(SignpostStackFrame *)self symbolOwnerUUID];
  v4 = [v3 UUIDString];
  v8[0] = v4;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostStackFrame offset](self, "offset"));
  v8[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

- (SignpostStackFrame)initWithArrayRepresentation:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 2)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    v6 = [v4 objectAtIndexedSubscript:1];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v7 = (objc_class *)MEMORY[0x1E4F29128];
      id v8 = v6;
      id v9 = v5;
      v10 = (void *)[[v7 alloc] initWithUUIDString:v9];

      uint64_t v11 = [v8 unsignedLongLongValue];
      self = [(SignpostStackFrame *)self initWithUUID:v10 offset:v11];

      v12 = self;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SignpostStackFrame *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if (v4 && [(SignpostStackFrame *)v4 isMemberOfClass:objc_opt_class()])
  {
    v6 = v5;
    unint64_t v7 = [(SignpostStackFrame *)self offset];
    if (v7 == [(SignpostStackFrame *)v6 offset])
    {
      id v8 = [(SignpostStackFrame *)self symbolOwnerUUID];
      id v9 = [(SignpostStackFrame *)v6 symbolOwnerUUID];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = [(SignpostStackFrame *)self symbolOwnerUUID];
  v5 = [v4 UUIDString];
  v6 = [v3 stringWithFormat:@"%@+%llu", v5, -[SignpostStackFrame offset](self, "offset")];

  return v6;
}

- (NSUUID)symbolOwnerUUID
{
  return self->_symbolOwnerUUID;
}

- (unint64_t)offset
{
  return self->_offset;
}

@end