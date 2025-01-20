@interface PDPassEndpointMetadata
- (BOOL)isDirty;
- (NSDate)lastUpdated;
- (NSString)passUniqueID;
- (PDPassEndpointMetadata)initWithType:(unint64_t)a3 passUniqueID:(id)a4;
- (unint64_t)type;
- (void)setDirty:(BOOL)a3;
- (void)setLastUpdated:(id)a3;
- (void)setPassUniqueID:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PDPassEndpointMetadata

- (PDPassEndpointMetadata)initWithType:(unint64_t)a3 passUniqueID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDPassEndpointMetadata;
  v8 = [(PDPassEndpointMetadata *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_passUniqueID, a4);
  }

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
}

@end