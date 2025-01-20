@interface WFPredictedLocationTransitionTrigger
+ (BOOL)isSupportedOnThisDevice;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyph;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (WFPredictedLocationTransitionTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (unint64_t)destinationType;
- (unint64_t)minutesBefore;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationType:(unint64_t)a3;
- (void)setMinutesBefore:(unint64_t)a3;
@end

@implementation WFPredictedLocationTransitionTrigger

- (void)setMinutesBefore:(unint64_t)a3
{
  self->_minutesBefore = a3;
}

- (unint64_t)minutesBefore
{
  return self->_minutesBefore;
}

- (void)setDestinationType:(unint64_t)a3
{
  self->_destinationType = a3;
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFPredictedLocationTransitionTrigger;
  id v4 = [(WFTrigger *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setDestinationType:", -[WFPredictedLocationTransitionTrigger destinationType](self, "destinationType"));
  objc_msgSend(v4, "setMinutesBefore:", -[WFPredictedLocationTransitionTrigger minutesBefore](self, "minutesBefore"));
  return v4;
}

- (WFPredictedLocationTransitionTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFPredictedLocationTransitionTrigger;
  v5 = [(WFTrigger *)&v14 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationType"];
    v7 = v6;
    if (v6) {
      uint64_t v8 = [v6 unsignedIntegerValue];
    }
    else {
      uint64_t v8 = 0;
    }
    [(WFPredictedLocationTransitionTrigger *)v5 setDestinationType:v8];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minutesBefore"];
    v10 = v9;
    if (v9) {
      uint64_t v11 = [v9 unsignedIntegerValue];
    }
    else {
      uint64_t v11 = 0;
    }
    [(WFPredictedLocationTransitionTrigger *)v5 setMinutesBefore:v11];
    v12 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFPredictedLocationTransitionTrigger;
  id v4 = a3;
  [(WFTrigger *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFPredictedLocationTransitionTrigger destinationType](self, "destinationType", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"destinationType"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFPredictedLocationTransitionTrigger minutesBefore](self, "minutesBefore"));
  [v4 encodeObject:v6 forKey:@"minutesBefore"];
}

- (id)localizedPastTenseDescription
{
  return &stru_1F229A4D8;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  unint64_t v3 = [(WFPredictedLocationTransitionTrigger *)self destinationType];
  if (!v3) {
    goto LABEL_5;
  }
  if (v3 != 1) {
    goto LABEL_8;
  }
  unint64_t v4 = [(WFPredictedLocationTransitionTrigger *)self minutesBefore];
  if (v4 < 6)
  {
    v5 = &off_1E654EDB8[v4];
  }
  else
  {
LABEL_5:
    unint64_t v3 = [(WFPredictedLocationTransitionTrigger *)self minutesBefore];
    if (v3 >= 6) {
      goto LABEL_8;
    }
    v5 = &off_1E654EDE8[v3];
  }
  unint64_t v3 = WFLocalizedString(*v5);
LABEL_8:
  return (id)v3;
}

- (BOOL)hasValidConfiguration
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)displayGlyph
{
  v2 = (void *)MEMORY[0x1E4FB4770];
  unint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  unint64_t v4 = [v2 imageNamed:@"LeaveTriggerIcon" inBundle:v3];

  return v4;
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “15 minutes before I leave for work”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Before I Commute");
}

+ (BOOL)isSupportedOnThisDevice
{
  return 1;
}

@end