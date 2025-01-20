@interface PGCuratedLibraryFTEMetricEvent
- (BOOL)shouldReportMetrics;
- (PGCuratedLibraryFTEMetricEvent)initWithLibrarySizeRange:(int64_t)a3 migrationDate:(id)a4;
- (id)identifier;
- (id)payload;
@end

@implementation PGCuratedLibraryFTEMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_migrationDate, 0);
}

- (id)payload
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = +[PGCuratedLibraryIntelligenceMetricEvent librarySizeRangeDescriptionForLibrarySizeRange:self->_librarySizeRange];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:self->_migrationDate];
  v8[0] = @"librarySizeRange";
  v8[1] = @"firstTimeExperienceDuration";
  v9[0] = v3;
  v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (BOOL)shouldReportMetrics
{
  return 1;
}

- (id)identifier
{
  return @"com.apple.Photos.Intelligence.CuratedLibrary.FTE";
}

- (PGCuratedLibraryFTEMetricEvent)initWithLibrarySizeRange:(int64_t)a3 migrationDate:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGCuratedLibraryFTEMetricEvent;
  v8 = [(PGCuratedLibraryFTEMetricEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_librarySizeRange = a3;
    objc_storeStrong((id *)&v8->_migrationDate, a4);
  }

  return v9;
}

@end