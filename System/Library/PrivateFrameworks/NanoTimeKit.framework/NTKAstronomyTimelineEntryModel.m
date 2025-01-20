@interface NTKAstronomyTimelineEntryModel
- (CLLocation)anyLocation;
- (CLLocation)currentLocation;
- (NSDate)currentDate;
- (NTKAstronomyTimelineEntryModel)initWithVista:(unint64_t)a3 entryDate:(id)a4 currentDate:(id)a5 currentLocation:(id)a6 anyLocation:(id)a7;
- (id)_graphicRectangular;
- (id)templateForComplicationFamily:(int64_t)a3;
- (unint64_t)vista;
@end

@implementation NTKAstronomyTimelineEntryModel

- (NTKAstronomyTimelineEntryModel)initWithVista:(unint64_t)a3 entryDate:(id)a4 currentDate:(id)a5 currentLocation:(id)a6 anyLocation:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)NTKAstronomyTimelineEntryModel;
  v16 = [(NTKAstronomyTimelineEntryModel *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_vista = a3;
    objc_storeStrong((id *)&v16->_currentLocation, a6);
    objc_storeStrong((id *)&v17->_anyLocation, a7);
    objc_storeStrong((id *)&v17->_currentDate, a5);
    [(NTKTimelineEntryModel *)v17 setEntryDate:v12];
  }

  return v17;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v5 = _os_feature_enabled_impl();
  if (a3 == 11 && v5)
  {
    v6 = [(NTKAstronomyTimelineEntryModel *)self _graphicRectangular];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    v8 = [NSNumber numberWithInt:LODWORD(self->_vista)];
    [v7 setObject:v8 forKeyedSubscript:@"vista"];

    v9 = [(NTKTimelineEntryModel *)self entryDate];
    [v7 setObject:v9 forKeyedSubscript:@"entry date"];

    [v7 setObject:self->_currentDate forKeyedSubscript:@"current date"];
    [v7 setObject:self->_currentLocation forKeyedSubscript:@"current location"];
    [v7 setObject:self->_anyLocation forKeyedSubscript:@"any location"];
    v10 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      currentLocation = self->_currentLocation;
      anyLocation = self->_anyLocation;
      id v13 = [(NTKTimelineEntryModel *)self entryDate];
      int v16 = 138478339;
      v17 = currentLocation;
      __int16 v18 = 2113;
      objc_super v19 = anyLocation;
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "NTKAstronomyTimeLineEntryModel templateForComplicationFamily with currentLocation?:%{private}@, anyLocation?:%{private}@, with date:%@", (uint8_t *)&v16, 0x20u);
    }
    int64_t v14 = a3 - 8;
    if (unint64_t)(a3 - 8) <= 4 && ((0x17u >> v14))
    {
      v6 = [**((id **)&unk_1E62C4788 + v14) templateWithMetadata:v7];
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)_graphicRectangular
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v3 = [(NTKAstronomyTimelineEntryModel *)self currentDate];
  v4 = NUNILocalizedString();
  int v5 = [v3 dateByAddingTimeInterval:172800.0];
  v6 = [MEMORY[0x1E4F19AB0] textProviderWithText:v4];
  v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.811764706 green:0.937254902 blue:0.584313725 alpha:1.0];
  [v6 setTintColor:v7];

  v8 = (void *)MEMORY[0x1E4F1CA60];
  v9 = [(NTKAstronomyTimelineEntryModel *)self anyLocation];
  v10 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v3, @"CurrentEventDate", v5, @"MoonViewOffsetDate", v9, @"AnyLocation", 0);

  v11 = [(NTKAstronomyTimelineEntryModel *)self currentLocation];

  if (v11)
  {
    id v12 = [(NTKAstronomyTimelineEntryModel *)self currentLocation];
    [v10 setObject:v12 forKey:@"CurrentLocation"];
  }
  id v13 = [MEMORY[0x1E4F19A58] fullColorImageProviderWithImageViewClass:objc_opt_class()];
  int64_t v14 = (void *)[v10 copy];
  [v13 setMetadata:v14];

  id v15 = [MEMORY[0x1E4F19928] templateWithTextProvider:v6 imageProvider:v13];
  uint64_t v18 = *MEMORY[0x1E4F19690];
  v19[0] = &unk_1F16E1860;
  int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  [v15 setMetadata:v16];

  return v15;
}

- (unint64_t)vista
{
  return self->_vista;
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (CLLocation)anyLocation
{
  return self->_anyLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyLocation, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);

  objc_storeStrong((id *)&self->_currentDate, 0);
}

@end