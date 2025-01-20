@interface VKUserReportedTrafficIncident
- (VKUserReportedTrafficIncident)initWithIncidentType:(int64_t)a3 uniqueIdentifier:(id)a4 position:(id)a5 onRoute:(id)a6;
- (int64_t)type;
@end

@implementation VKUserReportedTrafficIncident

- (int64_t)type
{
  return *(void *)&self->super._routeLegWhen._hasValue;
}

- (VKUserReportedTrafficIncident)initWithIncidentType:(int64_t)a3 uniqueIdentifier:(id)a4 position:(id)a5 onRoute:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)VKUserReportedTrafficIncident;
  v7 = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:position:onRoute:](&v11, sel_initWithFeatureType_uniqueIdentifier_position_onRoute_, 4, a4, a6, a5.var0, a5.var1, a5.var2);
  v8 = v7;
  if (v7)
  {
    *(void *)&v7->super._routeLegWhen._hasValue = a3;
    v9 = v7;
  }

  return v8;
}

@end