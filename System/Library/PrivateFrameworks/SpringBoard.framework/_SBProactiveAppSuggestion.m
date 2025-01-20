@interface _SBProactiveAppSuggestion
- (ATXProactiveSuggestion)appSuggestion;
- (BOOL)isBluetoothAudioPrediction;
- (BOOL)isBluetoothPrediction;
- (BOOL)isCarPlayPrediction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstWakePrediction;
- (BOOL)isHeadphonesPrediction;
- (BOOL)isLocallyGeneratedSuggestion;
- (BOOL)isLocationBasedSuggestion;
- (BOOL)isPrediction;
- (NSUUID)resultUUID;
- (_SBProactiveAppSuggestion)initWithAppSuggestion:(id)a3;
- (id)bundleIdentifier;
- (unint64_t)hash;
@end

@implementation _SBProactiveAppSuggestion

- (_SBProactiveAppSuggestion)initWithAppSuggestion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBProactiveAppSuggestion;
  v6 = [(_SBProactiveAppSuggestion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appSuggestion, a3);
  }

  return v7;
}

- (NSUUID)resultUUID
{
  return (NSUUID *)[(ATXProactiveSuggestion *)self->_appSuggestion uuid];
}

- (id)bundleIdentifier
{
  v2 = [(ATXProactiveSuggestion *)self->_appSuggestion executableSpecification];
  v3 = [v2 executableObject];

  return v3;
}

- (BOOL)isLocationBasedSuggestion
{
  v2 = [(ATXProactiveSuggestion *)self->_appSuggestion uiSpecification];
  int v3 = [v2 predictionReasons];

  return (*(void *)&v3 & 0x11800) != 0;
}

- (BOOL)isLocallyGeneratedSuggestion
{
  return 1;
}

- (BOOL)isPrediction
{
  return 1;
}

- (BOOL)isHeadphonesPrediction
{
  v2 = [(ATXProactiveSuggestion *)self->_appSuggestion uiSpecification];
  BOOL v3 = [v2 predictionReasons] == 4;

  return v3;
}

- (BOOL)isBluetoothPrediction
{
  v2 = [(ATXProactiveSuggestion *)self->_appSuggestion uiSpecification];
  BOOL v3 = [v2 predictionReasons] == 16;

  return v3;
}

- (BOOL)isBluetoothAudioPrediction
{
  v2 = [(ATXProactiveSuggestion *)self->_appSuggestion uiSpecification];
  BOOL v3 = (~[v2 predictionReasons] & 0x14) == 0;

  return v3;
}

- (BOOL)isCarPlayPrediction
{
  v2 = [(ATXProactiveSuggestion *)self->_appSuggestion uiSpecification];
  unint64_t v3 = ((unint64_t)[v2 predictionReasons] >> 6) & 1;

  return v3;
}

- (BOOL)isFirstWakePrediction
{
  v2 = [(ATXProactiveSuggestion *)self->_appSuggestion uiSpecification];
  unint64_t v3 = ((unint64_t)[v2 predictionReasons] >> 10) & 1;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SBProactiveAppSuggestion *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(_SBProactiveAppSuggestion *)v4 resultUUID];
      v6 = [(_SBProactiveAppSuggestion *)self resultUUID];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(_SBProactiveAppSuggestion *)self resultUUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (ATXProactiveSuggestion)appSuggestion
{
  return self->_appSuggestion;
}

- (void).cxx_destruct
{
}

@end