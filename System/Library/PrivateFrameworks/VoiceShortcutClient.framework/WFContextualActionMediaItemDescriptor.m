@interface WFContextualActionMediaItemDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)playbackStoreId;
- (NSString)name;
- (WFContextualActionMediaItemDescriptor)initWithCoder:(id)a3;
- (WFContextualActionMediaItemDescriptor)initWithPlaybackStoreId:(id)a3 name:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContextualActionMediaItemDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_playbackStoreId, 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)playbackStoreId
{
  return self->_playbackStoreId;
}

- (void)encodeWithCoder:(id)a3
{
  playbackStoreId = self->_playbackStoreId;
  id v5 = a3;
  [v5 encodeObject:playbackStoreId forKey:@"playbackStoreId"];
  [v5 encodeObject:self->_name forKey:@"name"];
}

- (WFContextualActionMediaItemDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playbackStoreId"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(WFContextualActionMediaItemDescriptor *)self initWithPlaybackStoreId:v5 name:v6];
    v8 = self;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFContextualActionMediaItemDescriptor *)a3;
  id v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    BOOL v7 = [(WFContextualActionMediaItemDescriptor *)v6 playbackStoreId];
    v8 = [(WFContextualActionMediaItemDescriptor *)self playbackStoreId];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(WFContextualActionMediaItemDescriptor *)v6 name];
    v16 = [(WFContextualActionMediaItemDescriptor *)self name];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqualToString:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = [(WFContextualActionMediaItemDescriptor *)self playbackStoreId];
  id v5 = (id)[v3 combineContentsOfPropertyListObject:v4];

  v6 = [(WFContextualActionMediaItemDescriptor *)self name];
  id v7 = (id)[v3 combineContentsOfPropertyListObject:v6];

  unint64_t v8 = [v3 finalize];
  return v8;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(WFContextualActionMediaItemDescriptor *)self name];
  id v7 = [(WFContextualActionMediaItemDescriptor *)self playbackStoreId];
  unint64_t v8 = [v3 stringWithFormat:@"<%@ %p> Name: %@, Playback Store ID: %@", v5, self, v6, v7];

  return v8;
}

- (WFContextualActionMediaItemDescriptor)initWithPlaybackStoreId:(id)a3 name:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFContextualActionMediaItemDescriptor.m", 17, @"Invalid parameter not satisfying: %@", @"playbackStoreId" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFContextualActionMediaItemDescriptor.m", 18, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFContextualActionMediaItemDescriptor;
  v11 = [(WFContextualActionMediaItemDescriptor *)&v19 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_playbackStoreId, a3);
    uint64_t v13 = [v10 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v15 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end