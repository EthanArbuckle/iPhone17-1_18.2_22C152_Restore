@interface AEAudiobookReadingTimeTracker
+ (id)startTracking;
+ (id)testInstanceWithPlayer:(id)a3 bcTracker:(id)a4;
- (AEAudiobookReadingTimeTracker)initWithPlayer:(id)a3;
- (BCBookReadingTimeTracker)bcTracker;
- (BKAudiobookPlayer)player;
- (NSDate)pausedTime;
- (NSUUID)sessionID;
- (void)_beginReadingSessionForEventType:(unint64_t)a3;
- (void)_endReadingSessionForEventType:(unint64_t)a3;
- (void)player:(id)a3 audiobookDidChange:(id)a4;
- (void)player:(id)a3 audiobookWillChange:(id)a4;
- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)setBcTracker:(id)a3;
- (void)setPausedTime:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation AEAudiobookReadingTimeTracker

+ (id)startTracking
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9372C;
  block[3] = &unk_1DCDE8;
  block[4] = a1;
  if (qword_22B5A8 != -1) {
    dispatch_once(&qword_22B5A8, block);
  }
  v2 = (void *)qword_22B5B0;

  return v2;
}

+ (id)testInstanceWithPlayer:(id)a3 bcTracker:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithPlayer:v7];

  [v8 setBcTracker:v6];

  return v8;
}

- (AEAudiobookReadingTimeTracker)initWithPlayer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AEAudiobookReadingTimeTracker;
  id v6 = [(AEAudiobookReadingTimeTracker *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    id v8 = [(AEAudiobookReadingTimeTracker *)v7 player];
    [v8 addObserver:v7];
  }
  return v7;
}

- (void)player:(id)a3 audiobookWillChange:(id)a4
{
  id v5 = [(AEAudiobookReadingTimeTracker *)self sessionID];

  if (v5)
  {
    [(AEAudiobookReadingTimeTracker *)self _endReadingSessionForEventType:9];
  }
}

- (void)player:(id)a3 audiobookDidChange:(id)a4
{
  if ([a3 state] == (char *)&dword_0 + 2)
  {
    id v5 = [(AEAudiobookReadingTimeTracker *)self sessionID];

    if (!v5)
    {
      [(AEAudiobookReadingTimeTracker *)self _beginReadingSessionForEventType:7];
    }
  }
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7 = a3;
  id v8 = v7;
  if (a5 == 3)
  {
    v16 = v7;
    v12 = [(AEAudiobookReadingTimeTracker *)self sessionID];

    id v8 = v16;
    if (v12)
    {
      id v7 = [v16 isScrubbing];
      id v8 = v16;
      if ((v7 & 1) == 0)
      {
        v13 = [v16 skipController];
        if ([v13 isSkipping])
        {
        }
        else
        {
          v14 = [v16 skipController];
          unsigned __int8 v15 = [v14 isSeeking];

          id v8 = v16;
          if (v15) {
            goto LABEL_15;
          }
          id v7 = [(AEAudiobookReadingTimeTracker *)self _endReadingSessionForEventType:10];
        }
        goto LABEL_14;
      }
    }
  }
  else if (a5 == 2)
  {
    v16 = v7;
    v9 = [(AEAudiobookReadingTimeTracker *)self sessionID];

    id v8 = v16;
    if (!v9)
    {
      objc_super v10 = [(AEAudiobookReadingTimeTracker *)self pausedTime];

      if (v10) {
        uint64_t v11 = 11;
      }
      else {
        uint64_t v11 = 7;
      }
      id v7 = [(AEAudiobookReadingTimeTracker *)self _beginReadingSessionForEventType:v11];
LABEL_14:
      id v8 = v16;
    }
  }
LABEL_15:

  _objc_release_x1(v7, v8);
}

- (void)_beginReadingSessionForEventType:(unint64_t)a3
{
  id v5 = +[NSUUID UUID];
  [(AEAudiobookReadingTimeTracker *)self setSessionID:v5];

  id v6 = [(AEAudiobookReadingTimeTracker *)self player];
  id v7 = [v6 currentAudiobook];
  id v8 = [v7 assetID];

  v9 = _AEBookPluginsAudiobookLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v10 = [(AEAudiobookReadingTimeTracker *)self sessionID];
    int v13 = 138543874;
    v14 = v10;
    __int16 v15 = 2112;
    v16 = v8;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "beginReadingSession: %{public}@ assetID:%@ eventType:%lu", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v11 = [(AEAudiobookReadingTimeTracker *)self bcTracker];
  v12 = [(AEAudiobookReadingTimeTracker *)self sessionID];
  [v11 trackReadingSessionBeganWithAssetID:v8 sessionID:v12 trackerEventType:a3 readingFeatureFlags:1 completion:0];
}

- (void)_endReadingSessionForEventType:(unint64_t)a3
{
  id v5 = [(AEAudiobookReadingTimeTracker *)self player];
  id v6 = [v5 currentAudiobook];
  id v7 = [v6 assetID];

  id v8 = _AEBookPluginsAudiobookLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(AEAudiobookReadingTimeTracker *)self sessionID];
    int v13 = 138543874;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v7;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "endReadingSession:%{public}@ assetID:%@ eventType:%lu", (uint8_t *)&v13, 0x20u);
  }
  objc_super v10 = [(AEAudiobookReadingTimeTracker *)self bcTracker];
  uint64_t v11 = [(AEAudiobookReadingTimeTracker *)self sessionID];
  [v10 trackReadingSessionEndedWithAssetID:v7 sessionID:v11 trackerEventType:a3 readingFeatureFlags:1 completion:0];

  if (a3 == 10)
  {
    v12 = +[NSDate date];
    [(AEAudiobookReadingTimeTracker *)self setPausedTime:v12];
  }
  else
  {
    [(AEAudiobookReadingTimeTracker *)self setPausedTime:0];
  }
  [(AEAudiobookReadingTimeTracker *)self setSessionID:0];
}

- (BKAudiobookPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (NSDate)pausedTime
{
  return self->_pausedTime;
}

- (void)setPausedTime:(id)a3
{
  self->_pausedTime = (NSDate *)a3;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (BCBookReadingTimeTracker)bcTracker
{
  return self->_bcTracker;
}

- (void)setBcTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bcTracker, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end