@interface _UIStatusBarDataTetheringEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_UIStatusBarDataTetheringEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)connectionCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConnectionCount:(int64_t)a3;
@end

@implementation _UIStatusBarDataTetheringEntry

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataTetheringEntry;
  return self->_connectionCount ^ [(_UIStatusBarDataEntry *)&v3 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataTetheringEntry;
  id v4 = [(_UIStatusBarDataEntry *)&v6 copyWithZone:a3];
  [v4 setConnectionCount:self->_connectionCount];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataTetheringEntry;
  id v4 = a3;
  [(_UIStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_connectionCount, @"connectionCount", v5.receiver, v5.super_class);
}

- (_UIStatusBarDataTetheringEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataTetheringEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataEntry *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeIntegerForKey:", @"connectionCount", v7.receiver, v7.super_class);

  [(_UIStatusBarDataTetheringEntry *)v4 setConnectionCount:v5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataTetheringEntry;
  if ([(_UIStatusBarDataEntry *)&v9 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      int64_t connectionCount = self->_connectionCount;
      BOOL v7 = connectionCount == [v5 connectionCount];
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_ui_descriptionBuilder
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataTetheringEntry;
  v2 = [(_UIStatusBarDataEntry *)&v7 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_connectionCount);
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v5 = [v2 appendKeys:v4];

  return v5;
}

- (int64_t)connectionCount
{
  return self->_connectionCount;
}

- (void)setConnectionCount:(int64_t)a3
{
  self->_int64_t connectionCount = a3;
}

@end