@interface NTKCornerComplicationConfiguration
- (BOOL)complicationExistenceInvalidatesSnapshot;
- (NTKCornerComplicationConfiguration)init;
- (NTKCornerComplicationConfiguration)initWithTopLeftComplication:(unint64_t)a3 topRightComplication:(unint64_t)a4 bottomLeftComplication:(unint64_t)a5 bottomRightComplication:(unint64_t)a6;
- (id)complicationSlotDescriptors;
- (id)defaultSelectedComplicationSlotForDevice:(id)a3;
- (id)orderedComplicationSlots;
- (id)richComplicationSlotsForDevice:(id)a3;
@end

@implementation NTKCornerComplicationConfiguration

- (NTKCornerComplicationConfiguration)init
{
  return [(NTKCornerComplicationConfiguration *)self initWithTopLeftComplication:43 topRightComplication:10 bottomLeftComplication:3 bottomRightComplication:7];
}

- (NTKCornerComplicationConfiguration)initWithTopLeftComplication:(unint64_t)a3 topRightComplication:(unint64_t)a4 bottomLeftComplication:(unint64_t)a5 bottomRightComplication:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)NTKCornerComplicationConfiguration;
  result = [(NTKCornerComplicationConfiguration *)&v11 init];
  if (result)
  {
    result->_topLeftComplication = a3;
    result->_topRightComplication = a4;
    result->_bottomLeftComplication = a5;
    result->_bottomRightComplication = a6;
  }
  return result;
}

- (id)complicationSlotDescriptors
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v23 = [MEMORY[0x1E4F28E60] indexSet];
  v3 = NTKAllSignatureCircularTypes();
  [v23 addIndexes:v3];

  v4 = NTKAllSignatureCornerTypes();
  v5 = [NSNumber numberWithUnsignedInteger:self->_topLeftComplication];
  v29[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v7 = NTKComplicationTypeRankedListWithDefaultTypes(v6);

  v8 = [NSNumber numberWithUnsignedInteger:self->_topRightComplication];
  v28 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v10 = NTKComplicationTypeRankedListWithDefaultTypes(v9);

  objc_super v11 = [NSNumber numberWithUnsignedInteger:self->_bottomLeftComplication];
  v27 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v13 = NTKComplicationTypeRankedListWithDefaultTypes(v12);

  v14 = [NSNumber numberWithUnsignedInteger:self->_bottomRightComplication];
  v26 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v16 = NTKComplicationTypeRankedListWithDefaultTypes(v15);

  v24[0] = @"top-left";
  v17 = NTKComplicationSlotDescriptor(8, v4, v7);
  v25[0] = v17;
  v24[1] = @"top-right";
  v18 = NTKComplicationSlotDescriptor(8, v4, v10);
  v25[1] = v18;
  v24[2] = @"bottom-left";
  v19 = NTKComplicationSlotDescriptor(8, v4, v13);
  v25[2] = v19;
  v24[3] = @"bottom-right";
  v20 = NTKComplicationSlotDescriptor(8, v4, v16);
  v25[3] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];

  return v21;
}

- (id)defaultSelectedComplicationSlotForDevice:(id)a3
{
  return @"top-left";
}

- (BOOL)complicationExistenceInvalidatesSnapshot
{
  return 0;
}

- (id)orderedComplicationSlots
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top-left";
  v4[1] = @"top-right";
  v4[2] = @"bottom-left";
  v4[3] = @"bottom-right";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return v2;
}

- (id)richComplicationSlotsForDevice:(id)a3
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"top-left";
  v5[1] = @"top-right";
  v5[2] = @"bottom-left";
  v5[3] = @"bottom-right";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];

  return v3;
}

@end