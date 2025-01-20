@interface _UIStatusBarDataEntry
+ (BOOL)supportsSecureCoding;
+ (id)disabledEntry;
+ (id)entry;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (_UIStatusBarDataEntry)init;
- (_UIStatusBarDataEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromData:(id *)a3 type:(int)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation _UIStatusBarDataEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)entry
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)disabledEntry
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setEnabled:0];
  return v2;
}

- (_UIStatusBarDataEntry)init
{
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarDataEntry;
  id v2 = [(_UIStatusBarDataEntry *)&v4 init];
  [(_UIStatusBarDataEntry *)v2 setEnabled:1];
  return v2;
}

- (unint64_t)hash
{
  return [(id)objc_opt_class() hash] << self->_enabled;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setEnabled:self->_enabled];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_UIStatusBarDataEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataEntry *)&v7 init];
  uint64_t v5 = objc_msgSend(v3, "decodeBoolForKey:", @"enabled", v7.receiver, v7.super_class);

  [(_UIStatusBarDataEntry *)v4 setEnabled:v5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    int enabled = self->_enabled;
    BOOL v6 = enabled == [v4 isEnabled];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_ui_descriptionBuilder
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataEntry;
  id v2 = [&v7 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_isEnabled);
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v2 appendKeys:v4];

  return v5;
}

- (id)description
{
  id v2 = [(_UIStatusBarDataEntry *)self _ui_descriptionBuilder];
  id v3 = [v2 string];

  return v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_int enabled = a3;
}

- (id)initFromData:(id *)a3 type:(int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDataEntry;
  BOOL v6 = [(_UIStatusBarDataEntry *)&v8 init];
  [(_UIStatusBarDataEntry *)v6 setEnabled:a3->var0[a4]];
  return v6;
}

@end