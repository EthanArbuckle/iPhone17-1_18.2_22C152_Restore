@interface NTKCFaceDetailEnumeratedEditOptionCell
+ (id)reuseIdentifier;
- (BOOL)active;
- (NTKCFaceDetailEnumeratedEditOptionCell)initWithEditOption:(id)a3;
- (NTKEditOption)editOption;
- (double)rowHeight;
- (void)setActive:(BOOL)a3;
@end

@implementation NTKCFaceDetailEnumeratedEditOptionCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (double)rowHeight
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 _scaledValueForValue:44.0];
  double v4 = v3;

  return v4;
}

- (NTKCFaceDetailEnumeratedEditOptionCell)initWithEditOption:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKCFaceDetailEnumeratedEditOptionCell;
  v6 = [(NTKCDetailTableViewCell *)&v16 init];
  v7 = v6;
  if (v6)
  {
    [(NTKCFaceDetailEnumeratedEditOptionCell *)v6 setSelectionStyle:3];
    [(NTKCDetailTableViewCell *)v7 setShowsSeparator:1];
    v8 = NTKCActionColor();
    [(NTKCFaceDetailEnumeratedEditOptionCell *)v7 setTintColor:v8];

    objc_storeStrong((id *)&v7->_editOption, a3);
    v9 = [(NTKEditOption *)v7->_editOption localizedName];
    v10 = [(NTKCFaceDetailEnumeratedEditOptionCell *)v7 textLabel];
    [v10 setText:v9];

    v11 = [(NTKCFaceDetailEnumeratedEditOptionCell *)v7 textLabel];
    v12 = [v11 text];
    uint64_t v13 = [v12 isEqualToString:&stru_1F1635E90];
    v14 = [(NTKCFaceDetailEnumeratedEditOptionCell *)v7 textLabel];
    [v14 setHidden:v13];
  }
  return v7;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 0;
    }
    [(NTKCFaceDetailEnumeratedEditOptionCell *)self setAccessoryType:v3];
  }
}

- (BOOL)active
{
  return self->_active;
}

- (NTKEditOption)editOption
{
  return self->_editOption;
}

- (void).cxx_destruct
{
}

@end