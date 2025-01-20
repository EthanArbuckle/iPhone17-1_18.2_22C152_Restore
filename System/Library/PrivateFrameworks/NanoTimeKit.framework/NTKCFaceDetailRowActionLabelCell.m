@interface NTKCFaceDetailRowActionLabelCell
+ (id)reuseIdentifier;
- (NTKCFaceDetailRowActionLabelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)rowHeight;
@end

@implementation NTKCFaceDetailRowActionLabelCell

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

- (NTKCFaceDetailRowActionLabelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NTKCFaceDetailRowActionLabelCell;
  double v4 = [(NTKCFaceDetailRowActionCell *)&v9 initWithStyle:1 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(NTKCFaceDetailRowActionLabelCell *)v4 textLabel];
    v7 = NTKCActionColor();
    [v6 setTextColor:v7];
  }
  return v5;
}

@end