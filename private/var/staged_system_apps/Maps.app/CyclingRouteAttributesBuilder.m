@interface CyclingRouteAttributesBuilder
- (CyclePreferences)cyclePreferences;
- (id)initWihCyclePreferences:(id)a3;
- (void)fillRouteAttributes:(id)a3;
@end

@implementation CyclingRouteAttributesBuilder

- (id)initWihCyclePreferences:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CyclingRouteAttributesBuilder;
  v6 = [(CyclingRouteAttributesBuilder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cyclePreferences, a3);
  }

  return v7;
}

- (void)fillRouteAttributes:(id)a3
{
  id v7 = a3;
  [v7 setMainTransportType:3];
  v4 = [(CyclingRouteAttributesBuilder *)self cyclePreferences];
  id v5 = [v4 cyclingOptions];
  [v7 setCyclingOptions:v5];

  [v7 addUiContext:4];
  [v7 setIncludePhonetics:1];
  if (GEOConfigGetBOOL()) {
    uint64_t v6 = MGGetBoolAnswer();
  }
  else {
    uint64_t v6 = 0;
  }
  [v7 setIncludeCellularCoverage:v6];
}

- (CyclePreferences)cyclePreferences
{
  return self->_cyclePreferences;
}

- (void).cxx_destruct
{
}

@end