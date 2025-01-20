@interface NTKConnectivityTimelineEntryModel
- (NSString)connectivity;
- (id)_newUtilitarianLargeTemplate;
- (id)templateForComplicationFamily:(int64_t)a3;
- (void)setConnectivity:(id)a3;
@end

@implementation NTKConnectivityTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  if (a3 == 3 || a3 == 104) {
    id v3 = [(NTKConnectivityTimelineEntryModel *)self _newUtilitarianLargeTemplate];
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (id)_newUtilitarianLargeTemplate
{
  v2 = (void *)MEMORY[0x1E4F19AB0];
  id v3 = [(NTKConnectivityTimelineEntryModel *)self connectivity];
  v4 = [v2 textProviderWithText:v3];

  v5 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v4];
  [v5 finalize];

  return v5;
}

- (NSString)connectivity
{
  return self->_connectivity;
}

- (void)setConnectivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end