@interface MTAToneManager
+ (MTAToneManager)sharedManager;
- (BOOL)isPlayingTone;
- (MTATone)stopPlaying;
- (MTAToneManager)init;
- (NSArray)classicTones;
- (NSArray)modernTones;
- (NSString)selectedToneIdentifier;
- (TLAlert)alert;
- (float)previewAudioVolume;
- (void)loadAvailableTones;
- (void)previewTone:(id)a3 forType:(int64_t)a4;
- (void)setAlert:(id)a3;
- (void)setClassicTones:(id)a3;
- (void)setModernTones:(id)a3;
- (void)setPreviewAudioVolume:(float)a3;
- (void)setSelectedToneIdentifier:(id)a3;
- (void)stopPreviewingTone;
@end

@implementation MTAToneManager

- (MTAToneManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTAToneManager;
  v2 = [(MTAToneManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    alert = v2->_alert;
    v2->_alert = 0;

    v3->_previewAudioVolume = 1.0;
    [(MTAToneManager *)v3 loadAvailableTones];
    v5 = [MTATone alloc];
    v6 = [(MTATone *)v5 initWithIdentifier:TLToneIdentifierNone];
    stopPlaying = v3->_stopPlaying;
    v3->_stopPlaying = v6;

    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"STOP_PLAYING" value:&stru_1000A2560 table:0];
    [(MTATone *)v3->_stopPlaying setToneName:v9];
  }
  return v3;
}

- (void)loadAvailableTones
{
  v2 = +[TLToneManager sharedToneManager];
  v27 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/ToneKit.framework"];
  v3 = [v27 URLForResource:@"TKRingtones-EncoreInfinitum" withExtension:@"plist"];
  v4 = +[NSDictionary dictionaryWithContentsOfURL:v3];

  v5 = +[TLToneManager sharedToneManager];
  v6 = [v5 defaultToneIdentifierForAlertType:13];

  v28 = v4;
  v7 = [v4 objectForKeyedSubscript:@"modern"];
  v31 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v13 = [[MTATone alloc] initWithIdentifier:v12];
        v14 = [v2 nameForToneIdentifier:v12];
        [(MTATone *)v13 setToneName:v14];

        -[MTATone setDefaultTone:](v13, "setDefaultTone:", [v6 isEqualToString:v12]);
        [v31 addObject:v13];
      }
      id v9 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v9);
  }

  v15 = [v31 sortedArrayUsingComparator:&stru_1000A1528];
  [(MTAToneManager *)self setModernTones:v15];

  v16 = [v4 objectForKeyedSubscript:@"classic"];
  v17 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v16 count]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * (void)j);
        v24 = [[MTATone alloc] initWithIdentifier:v23];
        v25 = [v2 nameForToneIdentifier:v23];
        [(MTATone *)v24 setToneName:v25];

        -[MTATone setDefaultTone:](v24, "setDefaultTone:", [v6 isEqualToString:v23]);
        [v17 addObject:v24];
      }
      id v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v20);
  }

  v26 = [v17 sortedArrayUsingComparator:&stru_1000A1528];
  [(MTAToneManager *)self setClassicTones:v26];
}

+ (MTAToneManager)sharedManager
{
  if (qword_1000C7B68 != -1) {
    dispatch_once(&qword_1000C7B68, &stru_1000A1568);
  }
  v2 = (void *)qword_1000C7B60;

  return (MTAToneManager *)v2;
}

- (BOOL)isPlayingTone
{
  v2 = [(MTAToneManager *)self alert];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)previewTone:(id)a3 forType:(int64_t)a4
{
  v6 = [a3 identifier];
  v7 = [(MTAToneManager *)self alert];
  id v8 = [v7 toneIdentifier];
  unsigned int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    [(MTAToneManager *)self stopPreviewingTone];
  }
  else
  {
    id v10 = [objc_alloc((Class)TLAlertConfiguration) initWithType:a4];
    [v10 setToneIdentifier:v6];
    [(MTAToneManager *)self previewAudioVolume];
    [v10 setAudioVolume:];
    [v10 setForPreview:1];
    [v10 setShouldRepeat:0];
    objc_super v11 = [(MTAToneManager *)self alert];
    [v11 stop];

    uint64_t v12 = +[TLAlert alertWithConfiguration:v10];
    [(MTAToneManager *)self setAlert:v12];

    v13 = [(MTAToneManager *)self alert];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100015EBC;
    v14[3] = &unk_1000A1590;
    v14[4] = self;
    [v13 playWithCompletionHandler:v14];
  }
}

- (void)stopPreviewingTone
{
  BOOL v3 = [(MTAToneManager *)self alert];
  [v3 stop];

  [(MTAToneManager *)self setAlert:0];
}

- (NSArray)modernTones
{
  return self->_modernTones;
}

- (void)setModernTones:(id)a3
{
}

- (NSArray)classicTones
{
  return self->_classicTones;
}

- (void)setClassicTones:(id)a3
{
}

- (MTATone)stopPlaying
{
  return self->_stopPlaying;
}

- (NSString)selectedToneIdentifier
{
  return self->_selectedToneIdentifier;
}

- (void)setSelectedToneIdentifier:(id)a3
{
}

- (float)previewAudioVolume
{
  return self->_previewAudioVolume;
}

- (void)setPreviewAudioVolume:(float)a3
{
  self->_previewAudioVolume = a3;
}

- (TLAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_selectedToneIdentifier, 0);
  objc_storeStrong((id *)&self->_stopPlaying, 0);
  objc_storeStrong((id *)&self->_classicTones, 0);

  objc_storeStrong((id *)&self->_modernTones, 0);
}

@end