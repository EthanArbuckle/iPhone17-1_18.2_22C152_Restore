@interface NTKCFaceDetailComplicationCell
+ (id)reuseIdentifier;
- (BOOL)active;
- (BOOL)dateSlot;
- (BOOL)enabled;
- (BOOL)isRichSlot;
- (NSString)slot;
- (NTKCFaceDetailComplicationCell)initWithSlot:(id)a3 dateSlot:(BOOL)a4 isRichSlot:(BOOL)a5 inFace:(id)a6;
- (NTKComplication)complication;
- (double)rowHeight;
- (id)_disabledColor;
- (id)_inactiveColor;
- (id)_traitCollectionAdjustedIfNeeded;
- (void)_updateDetailText;
- (void)_updateLabelFonts;
- (void)_updateState;
- (void)setActive:(BOOL)a3;
- (void)setComplication:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation NTKCFaceDetailComplicationCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (double)rowHeight
{
  return *MEMORY[0x1E4FB2F28];
}

- (NTKCFaceDetailComplicationCell)initWithSlot:(id)a3 dateSlot:(BOOL)a4 isRichSlot:(BOOL)a5 inFace:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NTKCFaceDetailComplicationCell;
  v12 = [(NTKCDetailTableViewCell *)&v18 initWithStyle:1];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    slot = v12->_slot;
    v12->_slot = (NSString *)v13;

    v12->_dateSlot = a4;
    v12->_isRichSlot = a5;
    [(NTKCFaceDetailComplicationCell *)v12 setEnabled:1];
    v15 = [v11 displayNameForComplicationSlot:v12->_slot];
    v16 = [(NTKCFaceDetailComplicationCell *)v12 textLabel];
    [v16 setText:v15];

    [(NTKCDetailTableViewCell *)v12 setShowsSeparator:1];
    [(NTKCDetailTableViewCell *)v12 setIgnoresRTLCorrection:1];
    [(NTKCFaceDetailComplicationCell *)v12 setAccessoryType:1];
    [(NTKCFaceDetailComplicationCell *)v12 _updateLabelFonts];
  }

  return v12;
}

- (void)_updateLabelFonts
{
  id v9 = [(NTKCFaceDetailComplicationCell *)self _traitCollectionAdjustedIfNeeded];
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908] compatibleWithTraitCollection:v9];
  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] compatibleWithTraitCollection:v9];
  v5 = [(NTKCFaceDetailComplicationCell *)self textLabel];
  [v5 setFont:v3];

  v6 = [(NTKCFaceDetailComplicationCell *)self textLabel];
  [v6 sizeToFit];

  v7 = [(NTKCFaceDetailComplicationCell *)self detailTextLabel];
  [v7 setFont:v4];

  v8 = [(NTKCFaceDetailComplicationCell *)self detailTextLabel];
  [v8 sizeToFit];
}

- (id)_traitCollectionAdjustedIfNeeded
{
  v3 = [(NTKCFaceDetailComplicationCell *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];

  uint64_t v5 = *MEMORY[0x1E4FB2790];
  if (UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending) {
    [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v5];
  }
  else {
  v6 = [(NTKCFaceDetailComplicationCell *)self traitCollection];
  }

  return v6;
}

- (void)setComplication:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_complication] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_complication, a3);
    [(NTKCFaceDetailComplicationCell *)self _updateDetailText];
  }
}

- (void)_updateDetailText
{
  if (self->_dateSlot && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = +[NTKDateComplicationController textForDateStyle:[(NTKComplication *)self->_complication dateStyle]];
  }
  else
  {
    uint64_t v3 = [(NTKComplication *)self->_complication ntk_localizedNameWithOptions:1 forRichComplicationSlot:[(NTKCFaceDetailComplicationCell *)self isRichSlot]];
  }
  id v5 = (id)v3;
  v4 = [(NTKCFaceDetailComplicationCell *)self detailTextLabel];
  [v4 setText:v5];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(NTKCFaceDetailComplicationCell *)self _updateState];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    self->_active = 0;
    if (self->_enabled) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 0;
    }
    [(NTKCFaceDetailComplicationCell *)self setSelectionStyle:v4];
    [(NTKCFaceDetailComplicationCell *)self _updateState];
  }
}

- (void)_updateState
{
  if (self->_enabled)
  {
    uint64_t v3 = [(id)objc_opt_class() defaultTextColor];
    uint64_t v4 = [(NTKCFaceDetailComplicationCell *)self textLabel];
    [v4 setTextColor:v3];

    if (self->_active) {
      [(NTKCFaceDetailComplicationCell *)self _activeColor];
    }
    else {
    uint64_t v5 = [(NTKCFaceDetailComplicationCell *)self _inactiveColor];
    }
  }
  else
  {
    v6 = [(NTKCFaceDetailComplicationCell *)self _disabledColor];
    v7 = [(NTKCFaceDetailComplicationCell *)self textLabel];
    [v7 setTextColor:v6];

    uint64_t v5 = [(NTKCFaceDetailComplicationCell *)self _disabledColor];
  }
  id v9 = (id)v5;
  v8 = [(NTKCFaceDetailComplicationCell *)self detailTextLabel];
  [v8 setTextColor:v9];
}

- (id)_disabledColor
{
  return (id)[MEMORY[0x1E4FB1618] tertiaryLabelColor];
}

- (id)_inactiveColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (NSString)slot
{
  return self->_slot;
}

- (NTKComplication)complication
{
  return self->_complication;
}

- (BOOL)dateSlot
{
  return self->_dateSlot;
}

- (BOOL)isRichSlot
{
  return self->_isRichSlot;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_slot, 0);
}

@end