@interface _UIStatusBarDataLocationEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_UIStatusBarDataLocationEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _UIStatusBarDataLocationEntry

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataLocationEntry;
  return self->_type ^ [(_UIStatusBarDataEntry *)&v3 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataLocationEntry;
  id v4 = [(_UIStatusBarDataEntry *)&v6 copyWithZone:a3];
  [v4 setType:self->_type];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataLocationEntry;
  id v4 = a3;
  [(_UIStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
}

- (_UIStatusBarDataLocationEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataLocationEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataEntry *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeIntegerForKey:", @"type", v7.receiver, v7.super_class);

  [(_UIStatusBarDataLocationEntry *)v4 setType:v5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataLocationEntry;
  if ([(_UIStatusBarDataEntry *)&v9 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      int64_t type = self->_type;
      BOOL v7 = type == [v5 type];
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
  v7.super_class = (Class)_UIStatusBarDataLocationEntry;
  v2 = [(_UIStatusBarDataEntry *)&v7 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_type);
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v5 = [v2 appendKeys:v4];

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

@end