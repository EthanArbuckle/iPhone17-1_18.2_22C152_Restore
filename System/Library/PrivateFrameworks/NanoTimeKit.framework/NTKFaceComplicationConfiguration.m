@interface NTKFaceComplicationConfiguration
+ (id)defaultLocalizedNameForComplicationSlot:(id)a3;
- (BOOL)complicationExistenceInvalidatesSnapshot;
- (id)complicationSlotDescriptors;
- (id)defaultSelectedComplicationSlotForDevice:(id)a3;
- (id)localizedNameForComplicationSlot:(id)a3;
- (id)orderedComplicationSlots;
- (id)richComplicationSlotsForDevice:(id)a3;
@end

@implementation NTKFaceComplicationConfiguration

- (id)complicationSlotDescriptors
{
  return 0;
}

- (id)defaultSelectedComplicationSlotForDevice:(id)a3
{
  return 0;
}

- (id)localizedNameForComplicationSlot:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() defaultLocalizedNameForComplicationSlot:v3];

  return v4;
}

+ (id)defaultLocalizedNameForComplicationSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"top-left"])
  {
    v4 = @"TOP_LEFT";
LABEL_14:
    v5 = [NSString stringWithFormat:@"SLOT_LABEL_%@", v4];
    v6 = NTKClockFaceLocalizedString(v5, @"slot label");

    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"top-right"])
  {
    v4 = @"TOP_RIGHT";
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"top"])
  {
    v4 = @"TOP";
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"bottom-left"])
  {
    v4 = @"BOTTOM_LEFT";
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"bottom-right"])
  {
    v4 = @"BOTTOM_RIGHT";
    goto LABEL_14;
  }
  if (([v3 isEqualToString:@"bottom-center"] & 1) != 0
    || ([v3 isEqualToString:@"bottom"] & 1) != 0)
  {
    v4 = @"BOTTOM";
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"center"])
  {
    v4 = @"CENTER";
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"date"])
  {
    v4 = @"DATE";
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"monogram"])
  {
    v4 = @"MONOGRAM";
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"subdial-left"])
  {
    v4 = @"SUBDIAL_LEFT";
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"subdial-right"])
  {
    v4 = @"SUBDIAL_RIGHT";
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"subdial-bottom"])
  {
    v4 = @"SUBDIAL_BOTTOM";
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"subdial-top"])
  {
    v4 = @"SUBDIAL_TOP";
    goto LABEL_14;
  }
  v6 = 0;
LABEL_15:

  return v6;
}

- (BOOL)complicationExistenceInvalidatesSnapshot
{
  return 0;
}

- (id)orderedComplicationSlots
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)richComplicationSlotsForDevice:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end