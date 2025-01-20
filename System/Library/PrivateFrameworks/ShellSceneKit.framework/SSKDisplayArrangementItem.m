@interface SSKDisplayArrangementItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FBSDisplayIdentity)relativeDisplayIdentity;
- (NSString)description;
- (SSKDisplayArrangementItem)initWithCoder:(id)a3;
- (SSKDisplayArrangementItem)initWithRelativeDisplayIdentity:(id)a3 edge:(unsigned int)a4 offset:(double)a5;
- (double)offset;
- (unint64_t)hash;
- (unsigned)edge;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SSKDisplayArrangementItem

- (SSKDisplayArrangementItem)initWithRelativeDisplayIdentity:(id)a3 edge:(unsigned int)a4 offset:(double)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSKDisplayArrangementItem;
  v10 = [(SSKDisplayArrangementItem *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_relativeDisplayIdentity, a3);
    v11->_edge = a4;
    v11->_offset = a5;
  }
  v12 = [(SSKDisplayArrangementItem *)v11 init];

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_relativeDisplayIdentity];
  id v5 = (id)[v3 appendInt64:self->_edge];
  id v6 = (id)[v3 appendCGFloat:self->_offset];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  relativeDisplayIdentity = self->_relativeDisplayIdentity;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __37__SSKDisplayArrangementItem_isEqual___block_invoke;
  v20[3] = &unk_2654B16E0;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendObject:relativeDisplayIdentity counterpart:v20];
  uint64_t edge = self->_edge;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __37__SSKDisplayArrangementItem_isEqual___block_invoke_2;
  v18[3] = &unk_2654B1708;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendInt64:edge counterpart:v18];
  double offset = self->_offset;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __37__SSKDisplayArrangementItem_isEqual___block_invoke_3;
  v16[3] = &unk_2654B1730;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendCGFloat:v16 counterpart:offset];
  LOBYTE(v10) = [v5 isEqual];

  return (char)v10;
}

id __37__SSKDisplayArrangementItem_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

uint64_t __37__SSKDisplayArrangementItem_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 16);
}

double __37__SSKDisplayArrangementItem_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 24);
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x263F29C48] descriptionForRootObject:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSKDisplayArrangementItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSKDisplayArrangementItem;
  id v5 = [(SSKDisplayArrangementItem *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relativeDisplayIdentity"];
    relativeDisplayIdentity = v5->_relativeDisplayIdentity;
    v5->_relativeDisplayIdentity = (FBSDisplayIdentity *)v6;

    v5->_uint64_t edge = [v4 decodeInt32ForKey:@"edge"];
    [v4 decodeDoubleForKey:@"offset"];
    v5->_double offset = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  relativeDisplayIdentity = self->_relativeDisplayIdentity;
  id v5 = a3;
  [v5 encodeObject:relativeDisplayIdentity forKey:@"relativeDisplayIdentity"];
  [v5 encodeInt32:self->_edge forKey:@"edge"];
  [v5 encodeDouble:@"offset" forKey:self->_offset];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __58__SSKDisplayArrangementItem_appendDescriptionToFormatter___block_invoke;
  v12 = &unk_2654B15F8;
  id v13 = v4;
  id v14 = self;
  id v5 = v4;
  [v5 appendProem:self block:&v9];
  uint64_t edge = (int)self->_edge;
  if (edge > 3) {
    id v7 = 0;
  }
  else {
    id v7 = off_2654B1750[edge];
  }
  objc_msgSend(v5, "appendString:withName:", v7, @"toThe", v9, v10, v11, v12);
  id v8 = (id)[v5 appendFloat:@"offset" withName:self->_offset];
}

id __58__SSKDisplayArrangementItem_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"from"];
}

- (FBSDisplayIdentity)relativeDisplayIdentity
{
  return self->_relativeDisplayIdentity;
}

- (unsigned)edge
{
  return self->_edge;
}

- (double)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
}

@end