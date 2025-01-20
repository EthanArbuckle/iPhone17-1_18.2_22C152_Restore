@interface SBDisplayArrangementItem
+ (id)_preferredArrangementOfExternalDisplay:(id)a3 relativeToEmbeddedDisplay:(id)a4 preferences:(id)a5;
+ (id)preferredArrangementOfDisplay:(id)a3 relativeTo:(id)a4 preferences:(id)a5;
- (BOOL)isEqual:(id)a3;
- (FBSDisplayIdentity)displayIdentity;
- (FBSDisplayIdentity)relativeDisplayIdentity;
- (NSString)description;
- (SBDisplayArrangementItem)initWithDisplayIdentity:(id)a3 relativeDisplayIdentity:(id)a4 edge:(unsigned int)a5 offset:(double)a6;
- (double)offset;
- (unint64_t)hash;
- (unsigned)edge;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBDisplayArrangementItem

- (SBDisplayArrangementItem)initWithDisplayIdentity:(id)a3 relativeDisplayIdentity:(id)a4 edge:(unsigned int)a5 offset:(double)a6
{
  id v12 = a3;
  id v13 = a4;
  v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBDisplayArrangementItem.m", 38, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SBDisplayArrangementItem.m", 39, @"Invalid parameter not satisfying: %@", @"relativeDisplayIdentity" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)SBDisplayArrangementItem;
  v15 = [(SBDisplayArrangementItem *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayIdentity, a3);
    objc_storeStrong((id *)&v16->_relativeDisplayIdentity, a4);
    v16->_edge = a5;
    v16->_offset = a6;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && [(FBSDisplayIdentity *)self->_displayIdentity isEqual:*((void *)v4 + 2)]
    && [(FBSDisplayIdentity *)self->_relativeDisplayIdentity isEqual:*((void *)v4 + 3)]
    && self->_edge == *((_DWORD *)v4 + 2)
    && self->_offset == *((double *)v4 + 4);

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_displayIdentity];
  id v5 = (id)[v3 appendObject:self->_relativeDisplayIdentity];
  id v6 = (id)[v3 appendUnsignedInteger:self->_edge];
  id v7 = (id)[v3 appendCGFloat:self->_offset];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__SBDisplayArrangementItem_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E6B04E90;
  v3[4] = self;
  [a3 appendCustomFormatWithName:@"layout" block:v3];
}

uint64_t __57__SBDisplayArrangementItem_appendDescriptionToFormatter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(int *)(v2 + 8);
  if (v3 == 0.0)
  {
    if (v5 > 3) {
      id v7 = @"EAST";
    }
    else {
      id v7 = off_1E6B04EB0[v5];
    }
    return [a2 appendFormat:@"[%@] is to the %@ of [%@]", v4, v7, *(void *)(*(void *)(a1 + 32) + 24), v9];
  }
  else
  {
    if (v5 > 3) {
      id v6 = @"EAST";
    }
    else {
      id v6 = off_1E6B04EB0[v5];
    }
    return [a2 appendFormat:@"[%@] is %lu pts to the %@ of [%@]", v4, *(void *)&v3, v6, *(void *)(*(void *)(a1 + 32) + 24)];
  }
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
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
  objc_storeStrong((id *)&self->_relativeDisplayIdentity, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

+ (id)_preferredArrangementOfExternalDisplay:(id)a3 relativeToEmbeddedDisplay:(id)a4 preferences:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"SBDisplayArrangementItem.m", 93, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];
  }
  if (objc_msgSend(v9, "sb_displayWindowingMode") == 1)
  {
    id v12 = [SBDisplayArrangementItem alloc];
    uint64_t v13 = [v11 arrangementEdge];
    [v11 arrangementOffset];
    v14 = -[SBDisplayArrangementItem initWithDisplayIdentity:relativeDisplayIdentity:edge:offset:](v12, "initWithDisplayIdentity:relativeDisplayIdentity:edge:offset:", v9, v10, v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)preferredArrangementOfDisplay:(id)a3 relativeTo:(id)a4 preferences:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"SBDisplayArrangementItem.m", 115, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_17:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"SBDisplayArrangementItem.m", 116, @"Invalid parameter not satisfying: %@", @"relativeDisplayIdentity" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_17;
  }
LABEL_3:
  if (objc_msgSend(v9, "sb_displayWindowingMode") == 1 && objc_msgSend(v10, "sb_displayWindowingMode") == 1)
  {
    if ([v10 isMainDisplay])
    {
      id v12 = +[SBDisplayArrangementItem _preferredArrangementOfExternalDisplay:v9 relativeToEmbeddedDisplay:v10 preferences:v11];
      goto LABEL_11;
    }
    if ([v9 isMainDisplay])
    {
      uint64_t v13 = +[SBDisplayArrangementItem _preferredArrangementOfExternalDisplay:v10 relativeToEmbeddedDisplay:v9 preferences:v11];
      unsigned int v14 = [v13 edge];
      if (v14 > 3) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = dword_1D8FD1DC0[v14];
      }
      [v13 offset];
      id v12 = [[SBDisplayArrangementItem alloc] initWithDisplayIdentity:v9 relativeDisplayIdentity:v10 edge:v15 offset:-v17];

      goto LABEL_11;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

@end