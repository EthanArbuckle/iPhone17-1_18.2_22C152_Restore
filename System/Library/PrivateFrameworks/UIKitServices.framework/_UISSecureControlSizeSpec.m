@interface _UISSecureControlSizeSpec
+ (BOOL)supportsSecureCoding;
+ (id)specWithStyle:(id)a3 tag:(id)a4;
- (BOOL)arrangeVertically;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToStyle:(id)a3 tag:(id)a4;
- (UISSlotStyle)style;
- (_UISSecureControlCategory)category;
- (_UISSecureControlSizeSpec)initWithCategory:(id)a3 arrangeVertically:(BOOL)a4 accessibilityContrast:(unint64_t)a5 displayScale:(unsigned __int8)a6 layoutDirection:(unint64_t)a7 legibilityWeight:(unint64_t)a8 localization:(id)a9 preferredContentSizeCategory:(unint64_t)a10 userInterfaceIdiom:(unint64_t)a11;
- (_UISSecureControlSizeSpec)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UISSecureControlSizeSpec

+ (id)specWithStyle:(id)a3 tag:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v19 = [_UISSecureControlSizeSpec alloc];
  v7 = [v5 category];
  BOOL v8 = [v5 imagePlacement] == 1 || objc_msgSend(v5, "imagePlacement") == 4;
  BOOL v18 = v8;
  uint64_t v9 = [v6 accessibilityContrast];
  uint64_t v10 = [v6 displayScale];
  uint64_t v11 = [v6 layoutDirection];
  uint64_t v12 = [v6 legibilityWeight];
  v13 = [v6 localization];
  uint64_t v14 = [v6 preferredContentSizeCategory];
  uint64_t v15 = [v6 userInterfaceIdiom];

  v16 = [(_UISSecureControlSizeSpec *)v19 initWithCategory:v7 arrangeVertically:v18 accessibilityContrast:v9 displayScale:v10 layoutDirection:v11 legibilityWeight:v12 localization:v13 preferredContentSizeCategory:v14 userInterfaceIdiom:v15];
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISSecureControlSizeSpec)initWithCategory:(id)a3 arrangeVertically:(BOOL)a4 accessibilityContrast:(unint64_t)a5 displayScale:(unsigned __int8)a6 layoutDirection:(unint64_t)a7 legibilityWeight:(unint64_t)a8 localization:(id)a9 preferredContentSizeCategory:(unint64_t)a10 userInterfaceIdiom:(unint64_t)a11
{
  char v11 = a8;
  char v12 = a7;
  char v14 = a5;
  __int16 v15 = a4;
  id v18 = a3;
  id v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)_UISSecureControlSizeSpec;
  v20 = [(_UISSecureControlSizeSpec *)&v23 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_category, a3);
    objc_storeStrong((id *)&v21->_localization, a9);
    v21->_fields.all = v15 & 0xC001 | (2 * (v14 & 1)) & 3 | (4 * (a6 & 7)) & 0x1F | (32 * (v12 & 1)) & 0x3F | ((v11 & 1) << 6) & 0x7F | ((a10 & 0xF) << 7) & 0xC7FF | ((a11 & 7) << 11) | v21->_fields.all & 0xC000;
  }

  return v21;
}

- (_UISSecureControlSizeSpec)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISSecureControlSizeSpec;
  id v5 = [(_UISSecureControlSizeSpec *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (_UISSecureControlCategory *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localization"];
    localization = v5->_localization;
    v5->_localization = (NSString *)v8;

    v5->_fields.all = [v4 decodeInt32ForKey:@"fieldsAll"];
  }

  return v5;
}

- (BOOL)arrangeVertically
{
  return self->_fields.all & 1;
}

- (void)encodeWithCoder:(id)a3
{
  category = self->_category;
  id v5 = a3;
  [v5 encodeObject:category forKey:@"category"];
  [v5 encodeObject:self->_localization forKey:@"localization"];
  [v5 encodeInt32:self->_fields.all forKey:@"fieldsAll"];
}

- (unint64_t)hash
{
  uint64_t v3 = +[_UISSecureControlSizeSpec hash];
  unint64_t v4 = [(_UISSecureControlCategory *)self->_category hash];
  return v4 ^ [(NSString *)self->_localization hash] ^ v3 ^ self->_fields.all;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (_UISSecureControlCategory **)a3;
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
    && ((category = self->_category, category == v4[3]) || -[_UISSecureControlCategory isEqual:](category, "isEqual:"))
    && ((localization = self->_localization, localization == (NSString *)v4[1])
     || -[NSString isEqual:](localization, "isEqual:"))
    && self->_fields.all == *((unsigned __int16 *)v4 + 8);

  return v7;
}

- (BOOL)isEquivalentToStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  category = self->_category;
  uint64_t v9 = [v7 category];
  if (category == v9 || [(_UISSecureControlCategory *)category isEqual:v9])
  {
    localization = self->_localization;
    objc_super v11 = [v6 localization];
    if ((localization == v11 || [(NSString *)localization isEqual:v11])
      && ((int v12 = self->_fields.all & 1, [v7 imagePlacement] != 1)
        ? (int v13 = [v7 imagePlacement] == 4)
        : (int v13 = 1),
          v13 == v12
       && (unint64_t v15 = ((unint64_t)self->_fields.all >> 1) & 1, [v6 accessibilityContrast] == v15)
       && (int v16 = (self->_fields.all >> 2) & 7, v16 == [v6 displayScale])
       && (unint64_t v17 = ((unint64_t)self->_fields.all >> 5) & 1, [v6 layoutDirection] == v17)
       && (unint64_t v18 = ((unint64_t)self->_fields.all >> 6) & 1, [v6 legibilityWeight] == v18)
       && (unint64_t v19 = ((unint64_t)self->_fields.all >> 7) & 0xF,
           [v6 preferredContentSizeCategory] == v19)))
    {
      unint64_t v20 = ((unint64_t)self->_fields.all >> 11) & 7;
      BOOL v14 = [v6 userInterfaceIdiom] == v20;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (UISSlotStyle)style
{
  unint64_t all = self->_fields.all;
  return +[UISSlotStyle slotStyleWithAccessibilityButtonShapes:0 accessibilityContrast:(all >> 1) & 1 displayRange:1 displayScale:(all >> 2) & 7 layoutDirection:(all >> 5) & 1 legibilityWeight:(all >> 6) & 1 localization:self->_localization preferredContentSizeCategory:(all >> 7) & 0xF tintColor:CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DCB8]) userInterfaceIdiom:(all >> 11) & 7 userInterfaceStyle:0];
}

- (_UISSecureControlCategory)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_localization, 0);
}

@end