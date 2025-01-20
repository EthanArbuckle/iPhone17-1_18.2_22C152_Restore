@interface PGMusicCurationInflationOptions
+ (id)stringFromInflationActionSource:(int64_t)a3;
- (BOOL)shouldForceMetadataRefetch;
- (PGMusicCurationInflationOptions)initWithInflationActionSource:(int64_t)a3;
- (PGMusicCurationInflationOptions)initWithRequestOptionsDictionary:(id)a3 inflationActionSource:(int64_t)a4;
- (int64_t)inflationActionSource;
- (void)setInflationActionSource:(int64_t)a3;
@end

@implementation PGMusicCurationInflationOptions

- (void)setInflationActionSource:(int64_t)a3
{
  self->_inflationActionSource = a3;
}

- (int64_t)inflationActionSource
{
  return self->_inflationActionSource;
}

- (BOOL)shouldForceMetadataRefetch
{
  return self->_shouldForceMetadataRefetch;
}

- (PGMusicCurationInflationOptions)initWithRequestOptionsDictionary:(id)a3 inflationActionSource:(int64_t)a4
{
  id v6 = a3;
  v7 = [(PGMusicCurationInflationOptions *)self initWithInflationActionSource:a4];
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F8B050];
    v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8B050]];
    if (v9)
    {
      v10 = [v6 objectForKeyedSubscript:v8];
      v7->_shouldForceMetadataRefetch = [v10 BOOLValue];
    }
    else
    {
      v7->_shouldForceMetadataRefetch = 0;
    }
  }
  return v7;
}

- (PGMusicCurationInflationOptions)initWithInflationActionSource:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGMusicCurationInflationOptions;
  result = [(PGMusicCurationInflationOptions *)&v5 init];
  if (result)
  {
    result->_shouldForceMetadataRefetch = 0;
    result->_inflationActionSource = a3;
  }
  return result;
}

+ (id)stringFromInflationActionSource:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"unknown";
  }
  else {
    return off_1E68EEC28[a3];
  }
}

@end