@interface _WBBookmarkSyncDataForPositionDecoding
+ (BOOL)supportsSecureCoding;
- (WBSCRDTPosition)position;
- (_WBBookmarkSyncDataForPositionDecoding)initWithCoder:(id)a3;
@end

@implementation _WBBookmarkSyncDataForPositionDecoding

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WBBookmarkSyncDataForPositionDecoding)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_WBBookmarkSyncDataForPositionDecoding;
  v5 = [(_WBBookmarkSyncDataForPositionDecoding *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Position"];
    position = v5->_position;
    v5->_position = (WBSCRDTPosition *)v6;

    v8 = v5;
  }

  return v5;
}

- (WBSCRDTPosition)position
{
  return self->_position;
}

- (void).cxx_destruct
{
}

@end