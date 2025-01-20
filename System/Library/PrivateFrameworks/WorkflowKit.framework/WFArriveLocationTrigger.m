@interface WFArriveLocationTrigger
+ (BOOL)isSupportedOnThisDevice;
+ (id)displayGlyph;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (int64_t)triggerBacking;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
@end

@implementation WFArriveLocationTrigger

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)displayGlyph
{
  v2 = (void *)MEMORY[0x1E4FB4770];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  v4 = [v2 imageNamed:@"ArriveTriggerIcon" inBundle:v3];

  return v4;
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When I arrive at the gym”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Arrive");
}

+ (BOOL)isSupportedOnThisDevice
{
  return 1;
}

- (id)localizedPastTenseDescription
{
  return &stru_1F229A4D8;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  uint64_t v3 = [(WFLocationTrigger *)self startTime];
  if (v3
    && (v4 = (void *)v3,
        [(WFLocationTrigger *)self endTime],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = +[WFLocationTrigger timestampDateFormatter];
    v7 = NSString;
    v8 = WFLocalizedString(@"When I arrive at %1$@ between %2$@ and %3$@");
    v9 = [(WFLocationTrigger *)self region];
    v10 = [v9 identifier];
    v11 = [(WFLocationTrigger *)self startTime];
    v12 = [v6 stringFromDate:v11];
    v13 = [(WFLocationTrigger *)self endTime];
    v14 = [v6 stringFromDate:v13];
    v15 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v10, v12, v14);
  }
  else
  {
    v16 = NSString;
    v6 = WFLocalizedString(@"When I arrive at %@");
    v8 = [(WFLocationTrigger *)self region];
    v9 = [v8 identifier];
    v15 = objc_msgSend(v16, "localizedStringWithFormat:", v6, v9);
  }

  return v15;
}

@end