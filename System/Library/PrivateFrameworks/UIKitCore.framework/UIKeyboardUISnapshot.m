@interface UIKeyboardUISnapshot
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (UIKeyboardUISnapshot)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)slotID;
- (void)encodeWithCoder:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setSlotID:(unsigned int)a3;
@end

@implementation UIKeyboardUISnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  if (([v7 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  uint64_t slotID = self->_slotID;
  if (slotID) {
    [v7 encodeInt32:slotID forKey:@"slot"];
  }
  if (self->_size.width != *MEMORY[0x1E4F1DB30] || self->_size.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:");
    [v7 encodeObject:v6 forKey:@"size"];
  }
}

- (UIKeyboardUISnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardUISnapshot;
  v5 = [(UIKeyboardUISnapshot *)&v11 init];
  if (v5)
  {
    v5->_uint64_t slotID = [v4 decodeInt32ForKey:@"slot"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    id v7 = v6;
    if (v6)
    {
      [v6 sizeValue];
      v5->_size.width = v8;
      v5->_size.height = v9;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[UIKeyboardUISnapshot allocWithZone:a3] init];
  *((_DWORD *)result + 2) = self->_slotID;
  *((_OWORD *)result + 1) = self->_size;
  return result;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  if ([(UIKeyboardUISnapshot *)self slotID]) {
    objc_msgSend(v3, "appendFormat:", @"; uint64_t slotID = %u", -[UIKeyboardUISnapshot slotID](self, "slotID"));
  }
  [(UIKeyboardUISnapshot *)self size];
  if (v5 != *MEMORY[0x1E4F1DB30] || v4 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(UIKeyboardUISnapshot *)self size];
    id v7 = NSStringFromSize(v10);
    [v3 appendFormat:@"; size = %@", v7];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (UIKeyboardUISnapshot *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      unsigned int v6 = [(UIKeyboardUISnapshot *)self slotID];
      if (v6 == [(UIKeyboardUISnapshot *)v5 slotID])
      {
        [(UIKeyboardUISnapshot *)self size];
        double v8 = v7;
        double v10 = v9;
        [(UIKeyboardUISnapshot *)v5 size];
        BOOL v13 = v10 == v12 && v8 == v11;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unsigned)slotID
{
  return self->_slotID;
}

- (void)setSlotID:(unsigned int)a3
{
  self->_uint64_t slotID = a3;
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

@end