@interface SBSRelativeDisplayArrangement
+ (BOOL)supportsSecureCoding;
- (NSString)displayIdentifier;
- (SBSRelativeDisplayArrangement)initWithCoder:(id)a3;
- (SBSRelativeDisplayArrangement)initWithDisplayIdentifier:(id)a3 edge:(unsigned int)a4 offset:(double)a5;
- (double)offset;
- (unsigned)edge;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSRelativeDisplayArrangement

- (SBSRelativeDisplayArrangement)initWithDisplayIdentifier:(id)a3 edge:(unsigned int)a4 offset:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSRelativeDisplayArrangement;
  v10 = [(SBSRelativeDisplayArrangement *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_displayIdentifier, a3);
    v11->_edge = a4;
    v11->_offset = a5;
  }

  return v11;
}

- (SBSRelativeDisplayArrangement)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBSRelativeDisplayArrangement;
  v5 = [(SBSRelativeDisplayArrangement *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayID"];
    displayIdentifier = v5->_displayIdentifier;
    v5->_displayIdentifier = (NSString *)v6;

    v5->_edge = [v4 decodeInt32ForKey:@"edge"];
    [v4 decodeDoubleForKey:@"offset"];
    v5->_offset = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  displayIdentifier = self->_displayIdentifier;
  id v5 = a3;
  [v5 encodeObject:displayIdentifier forKey:@"displayID"];
  [v5 encodeInt32:self->_edge forKey:@"edge"];
  [v5 encodeDouble:@"offset" forKey:self->_offset];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayIdentifier
{
  return self->_displayIdentifier;
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