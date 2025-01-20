@interface PKPassField
+ (BOOL)supportsSecureCoding;
- (BOOL)isDrillInField;
- (NSDictionary)semantics;
- (NSSet)foreignReferenceIdentifiers;
- (NSString)changeMessage;
- (NSString)key;
- (NSString)label;
- (NSString)link;
- (NSString)value;
- (PKPassField)init;
- (PKPassField)initWithCoder:(id)a3;
- (PKPassFieldImage)accessoryImage;
- (PKPassFieldImage)labelImage;
- (PKPassFieldImage)valueImage;
- (double)amount;
- (double)threshold;
- (id)asDictionary;
- (id)asMutableDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)unformattedValue;
- (int64_t)cellStyle;
- (int64_t)foreignReferenceType;
- (int64_t)textAlignment;
- (int64_t)type;
- (int64_t)unitType;
- (unint64_t)dataDetectorTypes;
- (unint64_t)row;
- (void)encodeWithCoder:(id)a3;
- (void)flushCachedValue;
- (void)setAccessoryImage:(id)a3;
- (void)setAmount:(double)a3;
- (void)setCellStyle:(int64_t)a3;
- (void)setChangeMessage:(id)a3;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setForeignReferenceIdentifiers:(id)a3;
- (void)setForeignReferenceType:(int64_t)a3;
- (void)setKey:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelImage:(id)a3;
- (void)setLink:(id)a3;
- (void)setRow:(unint64_t)a3;
- (void)setSemantics:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setThreshold:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setUnformattedValue:(id)a3;
- (void)setUnitType:(int64_t)a3;
- (void)setValueImage:(id)a3;
@end

@implementation PKPassField

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignReferenceIdentifiers, 0);
  objc_storeStrong((id *)&self->_semantics, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_valueImage, 0);
  objc_storeStrong((id *)&self->_labelImage, 0);
  objc_storeStrong((id *)&self->_changeMessage, 0);
  objc_storeStrong(&self->_unformattedValue, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)setUnformattedValue:(id)a3
{
  id v7 = a3;
  value = self->_value;
  if (value)
  {
    self->_value = 0;
  }
  v5 = (void *)[v7 copy];
  id unformattedValue = self->_unformattedValue;
  self->_id unformattedValue = v5;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setKey:(id)a3
{
}

- (PKPassField)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassField;
  result = [(PKPassField *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_textAlignment = xmmword_191674B40;
    result->_unitType = 0;
  }
  return result;
}

- (void)setLink:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (void)setForeignReferenceType:(int64_t)a3
{
  self->_foreignReferenceType = a3;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (void)setChangeMessage:(id)a3
{
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (void)setRow:(unint64_t)a3
{
  self->_row = a3;
}

- (int64_t)foreignReferenceType
{
  return self->_foreignReferenceType;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (PKPassField)initWithCoder:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PKPassField;
  v5 = [(PKPassField *)&v44 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v6 integerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"labelImage"];
    labelImage = v5->_labelImage;
    v5->_labelImage = (PKPassFieldImage *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueImage"];
    valueImage = v5->_valueImage;
    v5->_valueImage = (PKPassFieldImage *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"unformattedValue"];
    id unformattedValue = v5->_unformattedValue;
    v5->_id unformattedValue = (id)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryImage"];
    accessoryImage = v5->_accessoryImage;
    v5->_accessoryImage = (PKPassFieldImage *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"link"];
    link = v5->_link;
    v5->_link = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changeMessage"];
    changeMessage = v5->_changeMessage;
    v5->_changeMessage = (NSString *)v27;

    v5->_textAlignment = [v4 decodeIntegerForKey:@"textAlignment"];
    v5->_dataDetectorTypes = [v4 decodeIntegerForKey:@"dataDetectorTypes"];
    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"semantics"];
    semantics = v5->_semantics;
    v5->_semantics = (NSDictionary *)v33;

    v5->_cellStyle = [v4 decodeIntegerForKey:@"cellStyle"];
    v5->_foreignReferenceType = [v4 decodeIntegerForKey:@"foreignReferenceType"];
    v5->_unitType = (int)[v4 decodeIntForKey:@"unitType"];
    id v35 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v35, "initWithObjects:", v36, objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"combinedForeignReferenceIdentifiers"];
    foreignReferenceIdentifiers = v5->_foreignReferenceIdentifiers;
    v5->_foreignReferenceIdentifiers = (NSSet *)v38;

    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"row"];
    v5->_row = [v40 unsignedIntegerValue];

    [v4 decodeFloatForKey:@"amount"];
    v5->_amount = v41;
    [v4 decodeFloatForKey:@"threshold"];
    v5->_threshold = v42;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  int64_t type = self->_type;
  id v10 = a3;
  v6 = [v4 numberWithInteger:type];
  [v10 encodeObject:v6 forKey:@"type"];

  [v10 encodeObject:self->_key forKey:@"key"];
  [v10 encodeObject:self->_label forKey:@"label"];
  [v10 encodeObject:self->_labelImage forKey:@"labelImage"];
  [v10 encodeObject:self->_value forKey:@"value"];
  [v10 encodeObject:self->_valueImage forKey:@"valueImage"];
  [v10 encodeObject:self->_unformattedValue forKey:@"unformattedValue"];
  [v10 encodeObject:self->_accessoryImage forKey:@"accessoryImage"];
  [v10 encodeObject:self->_link forKey:@"link"];
  [v10 encodeObject:self->_changeMessage forKey:@"changeMessage"];
  [v10 encodeInteger:self->_textAlignment forKey:@"textAlignment"];
  [v10 encodeInteger:self->_dataDetectorTypes forKey:@"dataDetectorTypes"];
  [v10 encodeObject:self->_semantics forKey:@"semantics"];
  [v10 encodeInteger:self->_cellStyle forKey:@"cellStyle"];
  [v10 encodeInteger:self->_foreignReferenceType forKey:@"foreignReferenceType"];
  [v10 encodeInteger:self->_unitType forKey:@"unitType"];
  [v10 encodeObject:self->_foreignReferenceIdentifiers forKey:@"combinedForeignReferenceIdentifiers"];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_row];
  [v10 encodeObject:v7 forKey:@"row"];

  double amount = self->_amount;
  *(float *)&double amount = amount;
  [v10 encodeFloat:@"amount" forKey:amount];
  double threshold = self->_threshold;
  *(float *)&double threshold = threshold;
  [v10 encodeFloat:@"threshold" forKey:threshold];
}

- (NSString)value
{
  value = self->_value;
  p_value = &self->_value;
  id v4 = value;
  if (!value)
  {
    objc_storeStrong((id *)p_value, self->_unformattedValue);
    id v4 = self->_value;
  }
  return v4;
}

- (NSDictionary)semantics
{
  return self->_semantics;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)key
{
  return self->_key;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)unformattedValue
{
  return self->_unformattedValue;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v4 setType:self->_type];
  v5 = (void *)[(NSString *)self->_key copy];
  [v4 setKey:v5];

  v6 = (void *)[(NSString *)self->_label copy];
  [v4 setLabel:v6];

  uint64_t v7 = (void *)[(PKPassFieldImage *)self->_labelImage copy];
  [v4 setLabelImage:v7];

  v8 = (void *)[(NSString *)self->_value copy];
  [v4 setValue:v8 forKey:@"value"];

  uint64_t v9 = (void *)[(PKPassFieldImage *)self->_valueImage copy];
  [v4 setValueImage:v9];

  id v10 = (void *)[self->_unformattedValue copy];
  [v4 setUnformattedValue:v10];

  uint64_t v11 = (void *)[(PKPassFieldImage *)self->_accessoryImage copy];
  [v4 setAccessoryImage:v11];

  v12 = (void *)[(NSString *)self->_link copy];
  [v4 setLink:v12];

  uint64_t v13 = (void *)[(NSString *)self->_changeMessage copy];
  [v4 setChangeMessage:v13];

  [v4 setTextAlignment:self->_textAlignment];
  [v4 setDataDetectorTypes:self->_dataDetectorTypes];
  v14 = (void *)[(NSDictionary *)self->_semantics copy];
  [v4 setSemantics:v14];

  [v4 setCellStyle:self->_cellStyle];
  [v4 setUnitType:self->_unitType];
  [v4 setForeignReferenceType:self->_foreignReferenceType];
  uint64_t v15 = (void *)[(NSSet *)self->_foreignReferenceIdentifiers copy];
  [v4 setForeignReferenceIdentifiers:v15];

  [v4 setRow:self->_row];
  [v4 setAmount:self->_amount];
  [v4 setThreshold:self->_threshold];
  return v4;
}

- (void)flushCachedValue
{
  value = self->_value;
  self->_value = 0;
}

- (id)asDictionary
{
  v2 = [(PKPassField *)self asMutableDictionary];
  objc_super v3 = (void *)[v2 copy];

  return v3;
}

- (id)asMutableDictionary
{
  v57[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKeyedSubscript:@"key"];
  }
  label = self->_label;
  if (label) {
    [v9 setObject:label forKeyedSubscript:@"label"];
  }
  if (self->_labelImage)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v56[0] = @"symbolName";
    uint64_t v13 = [(PKPassFieldImage *)self->_labelImage symbolName];
    v57[0] = v13;
    v56[1] = @"imageName";
    v14 = [(PKPassFieldImage *)self->_labelImage imageName];
    v57[1] = v14;
    v56[2] = @"tintColor";
    uint64_t v15 = PKSemanticColorToString([(PKPassFieldImage *)self->_labelImage tintColor]);
    v57[2] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
    v17 = (void *)[v12 initWithDictionary:v16];
    [v9 setObject:v17 forKeyedSubscript:@"imageLabel"];
  }
  value = self->_value;
  if (value) {
    [v9 setObject:value forKeyedSubscript:@"value"];
  }
  if (self->_valueImage)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v54[0] = @"symbolName";
    v20 = [(PKPassFieldImage *)self->_valueImage symbolName];
    v55[0] = v20;
    v54[1] = @"imageName";
    uint64_t v21 = [(PKPassFieldImage *)self->_valueImage imageName];
    v55[1] = v21;
    v54[2] = @"tintColor";
    v22 = PKSemanticColorToString([(PKPassFieldImage *)self->_valueImage tintColor]);
    v55[2] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
    v24 = (void *)[v19 initWithDictionary:v23];
    [v9 setObject:v24 forKeyedSubscript:@"imageValue"];
  }
  if (self->_accessoryImage)
  {
    id v25 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v52[0] = @"symbolName";
    v26 = [(PKPassFieldImage *)self->_accessoryImage symbolName];
    v53[0] = v26;
    v52[1] = @"imageName";
    uint64_t v27 = [(PKPassFieldImage *)self->_accessoryImage imageName];
    v53[1] = v27;
    v52[2] = @"tintColor";
    v28 = PKSemanticColorToString([(PKPassFieldImage *)self->_accessoryImage tintColor]);
    v53[2] = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
    uint64_t v30 = (void *)[v25 initWithDictionary:v29];
    [v9 setObject:v30 forKeyedSubscript:@"imageAccessory"];
  }
  link = self->_link;
  if (link) {
    [v9 setObject:link forKeyedSubscript:@"link"];
  }
  if (self->_foreignReferenceType == 1)
  {
    [v9 setObject:@"Balance" forKeyedSubscript:@"foreignReferenceType"];
    foreignReferenceIdentifiers = self->_foreignReferenceIdentifiers;
    if (foreignReferenceIdentifiers)
    {
      uint64_t v33 = (void *)[(NSSet *)foreignReferenceIdentifiers copy];
      [v9 setObject:v33 forKeyedSubscript:@"combinedForeignReferenceIdentifiers"];
    }
  }
  v34 = _PKEnumValueToString(self->_unitType, @"PKFieldUnitType", @"PKFieldUnitTypeNone, PKFieldUnitTypeDefault, PKFieldUnitTypeRides, PKFieldUnitTypeTickets, PKFieldUnitTypeLoyaltyPoints", v4, v5, v6, v7, v8, -1);
  [v9 setObject:v34 forKeyedSubscript:@"unitType"];

  changeMessage = self->_changeMessage;
  if (changeMessage) {
    [v9 setObject:changeMessage forKeyedSubscript:@"changeMessage"];
  }
  if (self->_type == 3 && self->_row)
  {
    float v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v9 setObject:v41 forKeyedSubscript:@"row"];
  }
  float v42 = _PKEnumValueToString(self->_textAlignment, @"PKTextAlignment", @"PKTextAlignmentLeft, PKTextAlignmentCenter, PKTextAlignmentRight, PKTextAlignmentNatural", v35, v36, v37, v38, v39, 0);
  [v9 setObject:v42 forKeyedSubscript:@"textAlignment"];

  v48 = _PKEnumValueToString(self->_cellStyle, @"PKTableViewCellStyle", @"PKTableViewCellStyleDefault, PKTableViewCellStyleValue1, PKTableViewCellStyleValue2, PKTableViewCellStyleSubtitle", v43, v44, v45, v46, v47, 0);
  [v9 setObject:v48 forKeyedSubscript:@"cellStyle"];

  v49 = [NSNumber numberWithDouble:self->_amount];
  [v9 setObject:v49 forKeyedSubscript:@"amount"];

  v50 = [NSNumber numberWithDouble:self->_threshold];
  [v9 setObject:v50 forKeyedSubscript:@"threshold"];

  return v9;
}

- (id)description
{
  v2 = NSString;
  label = self->_label;
  uint64_t v4 = [(PKPassField *)self value];
  uint64_t v5 = [v2 stringWithFormat:@"[%@][%@]", label, v4];

  return v5;
}

- (BOOL)isDrillInField
{
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)changeMessage
{
  return self->_changeMessage;
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->_cellStyle = a3;
}

- (int64_t)unitType
{
  return self->_unitType;
}

- (void)setUnitType:(int64_t)a3
{
  self->_unitType = a3;
}

- (PKPassFieldImage)labelImage
{
  return self->_labelImage;
}

- (void)setLabelImage:(id)a3
{
}

- (PKPassFieldImage)valueImage
{
  return self->_valueImage;
}

- (void)setValueImage:(id)a3
{
}

- (PKPassFieldImage)accessoryImage
{
  return self->_accessoryImage;
}

- (void)setAccessoryImage:(id)a3
{
}

- (NSString)link
{
  return self->_link;
}

- (unint64_t)row
{
  return self->_row;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setSemantics:(id)a3
{
}

- (double)amount
{
  return self->_amount;
}

- (void)setAmount:(double)a3
{
  self->_double amount = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_double threshold = a3;
}

- (NSSet)foreignReferenceIdentifiers
{
  return self->_foreignReferenceIdentifiers;
}

- (void)setForeignReferenceIdentifiers:(id)a3
{
}

@end