@interface FRPersonalizationAutoFavoritesCursor
- (FRPersonalizationAutoFavoritesCursor)initWithCoreDuetLastQueryDate:(id)a3 portraitLastQueryDate:(id)a4;
- (NSDate)coreDuetLastQueryDate;
- (NSDate)lastExternalSignalProcessingDate;
- (NSDate)lastInternalSignalProcessingDate;
- (NSDate)portraitLastQueryDate;
- (NSSet)lastAppUsageAutoFavoriteResults;
- (NSSet)lastInternalSignalAutoFavorites;
- (NSSet)lastInternalSignalGroupableFavorites;
- (NSSet)lastLocationAutoFavoriteResults;
- (NSSet)lastPortraitAutoFavoriteResults;
- (NSSet)lastSafariAutoFavoriteResults;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCoreDuetLastQueryDate:(id)a3;
- (void)setLastAppUsageAutoFavoriteResults:(id)a3;
- (void)setLastExternalSignalProcessingDate:(id)a3;
- (void)setLastInternalSignalAutoFavorites:(id)a3;
- (void)setLastInternalSignalGroupableFavorites:(id)a3;
- (void)setLastInternalSignalProcessingDate:(id)a3;
- (void)setLastLocationAutoFavoriteResults:(id)a3;
- (void)setLastPortraitAutoFavoriteResults:(id)a3;
- (void)setLastSafariAutoFavoriteResults:(id)a3;
- (void)setPortraitLastQueryDate:(id)a3;
@end

@implementation FRPersonalizationAutoFavoritesCursor

- (FRPersonalizationAutoFavoritesCursor)initWithCoreDuetLastQueryDate:(id)a3 portraitLastQueryDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FRPersonalizationAutoFavoritesCursor;
  v9 = [(FRPersonalizationAutoFavoritesCursor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coreDuetLastQueryDate, a3);
    objc_storeStrong((id *)&v10->_portraitLastQueryDate, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = [(FRPersonalizationAutoFavoritesCursor *)self lastInternalSignalProcessingDate];
  [v4 setLastInternalSignalProcessingDate:v5];

  v6 = [(FRPersonalizationAutoFavoritesCursor *)self lastExternalSignalProcessingDate];
  [v4 setLastExternalSignalProcessingDate:v6];

  id v7 = [(FRPersonalizationAutoFavoritesCursor *)self coreDuetLastQueryDate];
  [v4 setCoreDuetLastQueryDate:v7];

  id v8 = [(FRPersonalizationAutoFavoritesCursor *)self portraitLastQueryDate];
  [v4 setPortraitLastQueryDate:v8];

  v9 = [(FRPersonalizationAutoFavoritesCursor *)self lastAppUsageAutoFavoriteResults];
  [v4 setLastAppUsageAutoFavoriteResults:v9];

  v10 = [(FRPersonalizationAutoFavoritesCursor *)self lastSafariAutoFavoriteResults];
  [v4 setLastSafariAutoFavoriteResults:v10];

  v11 = [(FRPersonalizationAutoFavoritesCursor *)self lastPortraitAutoFavoriteResults];
  [v4 setLastPortraitAutoFavoriteResults:v11];

  objc_super v12 = [(FRPersonalizationAutoFavoritesCursor *)self lastLocationAutoFavoriteResults];
  [v4 setLastLocationAutoFavoriteResults:v12];

  v13 = [(FRPersonalizationAutoFavoritesCursor *)self lastInternalSignalAutoFavorites];
  [v4 setLastInternalSignalAutoFavorites:v13];

  v14 = [(FRPersonalizationAutoFavoritesCursor *)self lastInternalSignalGroupableFavorites];
  [v4 setLastInternalSignalGroupableFavorites:v14];

  return v4;
}

- (NSDate)coreDuetLastQueryDate
{
  return self->_coreDuetLastQueryDate;
}

- (void)setCoreDuetLastQueryDate:(id)a3
{
}

- (NSDate)portraitLastQueryDate
{
  return self->_portraitLastQueryDate;
}

- (void)setPortraitLastQueryDate:(id)a3
{
}

- (NSDate)lastInternalSignalProcessingDate
{
  return self->_lastInternalSignalProcessingDate;
}

- (void)setLastInternalSignalProcessingDate:(id)a3
{
}

- (NSDate)lastExternalSignalProcessingDate
{
  return self->_lastExternalSignalProcessingDate;
}

- (void)setLastExternalSignalProcessingDate:(id)a3
{
}

- (NSSet)lastAppUsageAutoFavoriteResults
{
  return self->_lastAppUsageAutoFavoriteResults;
}

- (void)setLastAppUsageAutoFavoriteResults:(id)a3
{
}

- (NSSet)lastSafariAutoFavoriteResults
{
  return self->_lastSafariAutoFavoriteResults;
}

- (void)setLastSafariAutoFavoriteResults:(id)a3
{
}

- (NSSet)lastPortraitAutoFavoriteResults
{
  return self->_lastPortraitAutoFavoriteResults;
}

- (void)setLastPortraitAutoFavoriteResults:(id)a3
{
}

- (NSSet)lastLocationAutoFavoriteResults
{
  return self->_lastLocationAutoFavoriteResults;
}

- (void)setLastLocationAutoFavoriteResults:(id)a3
{
}

- (NSSet)lastInternalSignalAutoFavorites
{
  return self->_lastInternalSignalAutoFavorites;
}

- (void)setLastInternalSignalAutoFavorites:(id)a3
{
}

- (NSSet)lastInternalSignalGroupableFavorites
{
  return self->_lastInternalSignalGroupableFavorites;
}

- (void)setLastInternalSignalGroupableFavorites:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastInternalSignalGroupableFavorites, 0);
  objc_storeStrong((id *)&self->_lastInternalSignalAutoFavorites, 0);
  objc_storeStrong((id *)&self->_lastLocationAutoFavoriteResults, 0);
  objc_storeStrong((id *)&self->_lastPortraitAutoFavoriteResults, 0);
  objc_storeStrong((id *)&self->_lastSafariAutoFavoriteResults, 0);
  objc_storeStrong((id *)&self->_lastAppUsageAutoFavoriteResults, 0);
  objc_storeStrong((id *)&self->_lastExternalSignalProcessingDate, 0);
  objc_storeStrong((id *)&self->_lastInternalSignalProcessingDate, 0);
  objc_storeStrong((id *)&self->_portraitLastQueryDate, 0);

  objc_storeStrong((id *)&self->_coreDuetLastQueryDate, 0);
}

@end