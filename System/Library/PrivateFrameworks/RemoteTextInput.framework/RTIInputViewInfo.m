@interface RTIInputViewInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldShowDockView;
- (CGSize)size;
- (NSEdgeInsets)insets;
- (RTIInputViewInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)contextId;
- (void)encodeWithCoder:(id)a3;
- (void)setContextId:(unsigned int)a3;
- (void)setInsets:(NSEdgeInsets)a3;
- (void)setShouldShowDockView:(BOOL)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation RTIInputViewInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (([v8 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  uint64_t contextId = self->_contextId;
  if (contextId) {
    [v8 encodeInt32:contextId forKey:@"cid"];
  }
  if (self->_size.width != *MEMORY[0x1E4F1DB30] || self->_size.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:");
    [v8 encodeObject:v6 forKey:@"size"];
  }
  if (!NSEdgeInsetsEqual(self->_insets, *MEMORY[0x1E4F28250]))
  {
    v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithEdgeInsets:", self->_insets.top, self->_insets.left, self->_insets.bottom, self->_insets.right);
    [v8 encodeObject:v7 forKey:@"insets"];
  }
  [v8 encodeBool:self->_shouldShowDockView forKey:@"dockView"];
}

- (RTIInputViewInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v17.receiver = self;
  v17.super_class = (Class)RTIInputViewInfo;
  v5 = [(RTIInputViewInfo *)&v17 init];
  if (v5)
  {
    v5->_uint64_t contextId = [v4 decodeInt32ForKey:@"cid"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    v7 = v6;
    if (v6)
    {
      [v6 sizeValue];
      v5->_size.width = v8;
      v5->_size.height = v9;
    }
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"insets"];
    v11 = v10;
    if (v10)
    {
      [v10 edgeInsetsValue];
      v5->_insets.top = v12;
      v5->_insets.left = v13;
      v5->_insets.bottom = v14;
      v5->_insets.right = v15;
    }
    v5->_shouldShowDockView = [v4 decodeBoolForKey:@"dockView"];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[RTIInputViewInfo allocWithZone:a3] init];
  *((_DWORD *)result + 3) = self->_contextId;
  *((_OWORD *)result + 1) = self->_size;
  long long v5 = *(_OWORD *)&self->_insets.bottom;
  *((_OWORD *)result + 2) = *(_OWORD *)&self->_insets.top;
  *((_OWORD *)result + 3) = v5;
  *((unsigned char *)result + 8) = self->_shouldShowDockView;
  return result;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  if ([(RTIInputViewInfo *)self contextId]) {
    objc_msgSend(v3, "appendFormat:", @"; uint64_t contextId = %u", -[RTIInputViewInfo contextId](self, "contextId"));
  }
  [(RTIInputViewInfo *)self size];
  if (v5 != *MEMORY[0x1E4F1DB30] || v4 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(RTIInputViewInfo *)self size];
    v7 = NSStringFromSize(v17);
    [v3 appendFormat:@"; size = %@", v7];
  }
  [(RTIInputViewInfo *)self insets];
  if (!NSEdgeInsetsEqual(v18, *MEMORY[0x1E4F28250]))
  {
    [(RTIInputViewInfo *)self insets];
    uint64_t v9 = v8;
    [(RTIInputViewInfo *)self insets];
    uint64_t v11 = v10;
    [(RTIInputViewInfo *)self insets];
    uint64_t v13 = v12;
    [(RTIInputViewInfo *)self insets];
    [v3 appendFormat:@"; insets = {%f, %f, %f, %f}", v9, v11, v13, v14];
  }
  if ([(RTIInputViewInfo *)self shouldShowDockView]) {
    [v3 appendFormat:@"; shouldShowDockView = YES"];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (RTIInputViewInfo *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      unsigned int v6 = [(RTIInputViewInfo *)self contextId];
      if (v6 != [(RTIInputViewInfo *)v5 contextId]) {
        goto LABEL_10;
      }
      [(RTIInputViewInfo *)self size];
      double v8 = v7;
      double v10 = v9;
      [(RTIInputViewInfo *)v5 size];
      LOBYTE(v12) = 0;
      if (v8 != v13 || v10 != v11) {
        goto LABEL_11;
      }
      [(RTIInputViewInfo *)self insets];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      [(RTIInputViewInfo *)v5 insets];
      v29.top = v22;
      v29.left = v23;
      v29.bottom = v24;
      v29.right = v25;
      v28.top = v15;
      v28.left = v17;
      v28.bottom = v19;
      v28.right = v21;
      if (NSEdgeInsetsEqual(v28, v29))
      {
        BOOL v26 = [(RTIInputViewInfo *)self shouldShowDockView];
        BOOL v12 = v26 ^ [(RTIInputViewInfo *)v5 shouldShowDockView] ^ 1;
      }
      else
      {
LABEL_10:
        LOBYTE(v12) = 0;
      }
LABEL_11:

      goto LABEL_12;
    }
    LOBYTE(v12) = 0;
  }
LABEL_12:

  return v12;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(NSEdgeInsets)a3
{
  self->_insets = a3;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setContextId:(unsigned int)a3
{
  self->_uint64_t contextId = a3;
}

- (BOOL)shouldShowDockView
{
  return self->_shouldShowDockView;
}

- (void)setShouldShowDockView:(BOOL)a3
{
  self->_shouldShowDockView = a3;
}

@end