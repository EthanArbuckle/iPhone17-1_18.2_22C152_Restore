@interface NTKCFaceDetailMonogramComplicationCell
+ (id)reuseIdentifier;
- (NSString)slot;
- (NTKCFaceDetailMonogramComplicationCell)initWithSlot:(id)a3 inFace:(id)a4;
@end

@implementation NTKCFaceDetailMonogramComplicationCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailMonogramComplicationCell)initWithSlot:(id)a3 inFace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKCFaceDetailMonogramComplicationCell;
  v8 = [(NTKCFaceDetailToggleCell *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    slot = v8->_slot;
    v8->_slot = (NSString *)v9;

    v11 = [v7 displayNameForComplicationSlot:v8->_slot];
    v12 = [(NTKCFaceDetailMonogramComplicationCell *)v8 textLabel];
    [v12 setText:v11];
  }
  return v8;
}

- (NSString)slot
{
  return self->_slot;
}

- (void).cxx_destruct
{
}

@end