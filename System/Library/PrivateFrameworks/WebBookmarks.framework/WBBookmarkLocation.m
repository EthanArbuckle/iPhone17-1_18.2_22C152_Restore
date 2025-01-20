@interface WBBookmarkLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (WBBookmarkLocation)init;
- (WBBookmarkLocation)initWithCoder:(id)a3;
- (WBBookmarkLocation)initWithParentID:(int)a3 position:(id)a4;
- (WBBookmarkLocation)locationWithParentID:(int)a3;
- (WBBookmarkLocation)locationWithPosition:(id)a3;
- (WBSCRDTPosition)position;
- (id)description;
- (int)parentID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBBookmarkLocation

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBBookmarkLocation *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int v6 = [(WBBookmarkLocation *)v5 parentID];
      if (v6 == [(WBBookmarkLocation *)self parentID])
      {
        v7 = [(WBBookmarkLocation *)v5 position];
        v8 = [(WBBookmarkLocation *)self position];
        char v9 = WBSIsEqual();
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (int)parentID
{
  return self->_parentID;
}

- (WBBookmarkLocation)initWithParentID:(int)a3 position:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBBookmarkLocation;
  v8 = [(WBBookmarkLocation *)&v12 init];
  char v9 = v8;
  if (v8)
  {
    v8->_parentID = a3;
    objc_storeStrong((id *)&v8->_position, a4);
    v10 = v9;
  }

  return v9;
}

- (WBBookmarkLocation)locationWithParentID:(int)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParentID:*(void *)&a3 position:self->_position];
  return (WBBookmarkLocation *)v3;
}

- (WBBookmarkLocation)init
{
  return [(WBBookmarkLocation *)self initWithParentID:0x7FFFFFFFLL position:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBBookmarkLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"Parent"];
  int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Position"];

  id v7 = [(WBBookmarkLocation *)self initWithParentID:v5 position:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t parentID = self->_parentID;
  id v5 = a3;
  [v5 encodeInt32:parentID forKey:@"Parent"];
  [v5 encodeObject:self->_position forKey:@"Position"];
}

- (unint64_t)hash
{
  uint64_t parentID = self->_parentID;
  return [(WBSCRDTPosition *)self->_position hash] ^ parentID;
}

- (WBBookmarkLocation)locationWithPosition:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParentID:self->_parentID position:v4];

  return (WBBookmarkLocation *)v5;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; parent ID: %d, position: %@>",
               objc_opt_class(),
               self,
               self->_parentID,
               self->_position);
}

- (WBSCRDTPosition)position
{
  return self->_position;
}

@end