@interface _UIOHypogeanViewHandle
+ (BOOL)supportsSecureCoding;
- (CGRect)bounds;
- (NSString)uniqueIdentifier;
- (_UIOHypogeanViewHandle)initWithCoder:(id)a3;
- (unint64_t)renderId;
- (unsigned)contextId;
- (void)encodeWithCoder:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContextId:(unsigned int)a3;
- (void)setRenderId:(unint64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation _UIOHypogeanViewHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIOHypogeanViewHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_UIOHypogeanViewHandle *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_uniqueIdentifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    v10 = NSStringFromSelector(sel_renderId);
    v5->_renderId = [v4 decodeInt64ForKey:v10];

    v11 = NSStringFromSelector(sel_contextId);
    v5->_contextId = [v4 decodeInt32ForKey:v11];

    v12 = NSStringFromSelector(sel_bounds);
    [v4 decodeCGRectForKey:v12];
    v5->_bounds.origin.x = v13;
    v5->_bounds.origin.y = v14;
    v5->_bounds.size.width = v15;
    v5->_bounds.size.height = v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_uniqueIdentifier);
  [v5 encodeObject:uniqueIdentifier forKey:v6];

  unint64_t renderId = self->_renderId;
  uint64_t v8 = NSStringFromSelector(sel_renderId);
  [v5 encodeInt64:renderId forKey:v8];

  uint64_t contextId = self->_contextId;
  v10 = NSStringFromSelector(sel_contextId);
  [v5 encodeInt32:contextId forKey:v10];

  NSStringFromSelector(sel_bounds);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeCGRect:forKey:", v11, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (unint64_t)renderId
{
  return self->_renderId;
}

- (void)setRenderId:(unint64_t)a3
{
  self->_unint64_t renderId = a3;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setContextId:(unsigned int)a3
{
  self->_uint64_t contextId = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void).cxx_destruct
{
}

@end