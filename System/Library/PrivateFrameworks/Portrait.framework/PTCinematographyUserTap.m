@interface PTCinematographyUserTap
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)isGroupTap;
- (BOOL)isStrong;
- (NSNumber)trackNumber;
- (PTCinematographyDetection)detection;
- (PTCinematographyUserTap)initWithTime:(id *)a3 tappedDetection:(id)a4 strong:(BOOL)a5;
- (PTCinematographyUserTap)initWithTime:(id *)a3 tappedDetection:(id)a4 strong:(BOOL)a5 group:(BOOL)a6;
- (id)focusIdentifier;
- (int64_t)groupIdentifier;
- (int64_t)trackIdentifier;
@end

@implementation PTCinematographyUserTap

- (PTCinematographyUserTap)initWithTime:(id *)a3 tappedDetection:(id)a4 strong:(BOOL)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  return [(PTCinematographyUserTap *)self initWithTime:&v6 tappedDetection:a4 strong:a5 group:0];
}

- (PTCinematographyUserTap)initWithTime:(id *)a3 tappedDetection:(id)a4 strong:(BOOL)a5 group:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a4;
  v12 = [v11 trackNumber];

  if (v12)
  {
    v20.receiver = self;
    v20.super_class = (Class)PTCinematographyUserTap;
    v13 = [(PTCinematographyUserTap *)&v20 init];
    v14 = v13;
    if (v13)
    {
      long long v15 = *(_OWORD *)&a3->var0;
      *((void *)v13 + 5) = a3->var3;
      *(_OWORD *)(v13 + 24) = v15;
      objc_storeStrong((id *)v13 + 2, a4);
      v14[8] = a5;
      BOOL v16 = v6 && PTGroupIDIsValid([v11 groupIdentifier]);
      v14[9] = v16;
    }
    self = v14;
    v18 = self;
  }
  else
  {
    v17 = _PTLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyUserTap initWithTime:tappedDetection:strong:group:](v17);
    }

    v18 = 0;
  }

  return v18;
}

- (id)focusIdentifier
{
  v2 = [(PTCinematographyUserTap *)self detection];
  v3 = [v2 focusIdentifier];

  return v3;
}

- (int64_t)trackIdentifier
{
  v2 = [(PTCinematographyUserTap *)self detection];
  int64_t v3 = [v2 trackIdentifier];

  return v3;
}

- (NSNumber)trackNumber
{
  v2 = [(PTCinematographyUserTap *)self detection];
  int64_t v3 = [v2 trackNumber];

  return (NSNumber *)v3;
}

- (int64_t)groupIdentifier
{
  v2 = [(PTCinematographyUserTap *)self detection];
  int64_t v3 = [v2 groupIdentifier];

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (PTCinematographyDetection)detection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isStrong
{
  return self->_strong;
}

- (BOOL)isGroupTap
{
  return self->_groupTap;
}

- (void).cxx_destruct
{
}

- (void)initWithTime:(os_log_t)log tappedDetection:strong:group:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "error: attempt to create user tap with nil detection track number", v1, 2u);
}

@end