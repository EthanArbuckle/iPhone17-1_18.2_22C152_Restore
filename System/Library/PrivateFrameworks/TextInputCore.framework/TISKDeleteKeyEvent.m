@interface TISKDeleteKeyEvent
- (id)description;
- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
- (int64_t)_metricDeleteKeyPostion;
- (int64_t)deletePostion;
- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4;
- (void)reportToSession:(id)a3;
- (void)setDeletePostion:(int64_t)a3;
@end

@implementation TISKDeleteKeyEvent

- (void)setDeletePostion:(int64_t)a3
{
  self->_deletePostion = a3;
}

- (int64_t)deletePostion
{
  return self->_deletePostion;
}

- (id)description
{
  v2 = NSString;
  v3 = [(TISKInputEvent *)self input];
  if ([v3 isRapidDelete]) {
    v4 = @"rdel";
  }
  else {
    v4 = @"del";
  }
  v5 = [v2 stringWithFormat:v4];

  return v5;
}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v19.receiver = self;
    v19.super_class = (Class)TISKDeleteKeyEvent;
    [(TISKInputEvent *)&v19 reportInterKeyTiming:v6 previousEvent:v7];
    [(TISKEvent *)self touchDownTimestamp];
    double v9 = v8;
    [v7 touchDownTimestamp];
    double v11 = v9 - v10;
    switch([v7 type])
    {
      case 0u:
        v12 = [NSNumber numberWithDouble:v11];
        uint64_t v13 = kTISKKeyToDeleteMetric;
        goto LABEL_8;
      case 2u:
        v12 = [NSNumber numberWithDouble:v11];
        uint64_t v13 = kTISKSpaceToDeleteMetric;
        goto LABEL_8;
      case 3u:
        v14 = [NSNumber numberWithDouble:v11];
        [v6 addSample:v14 forKey:kTISKDeleteToDeleteMetric];

        if (self->_deletePostion < 0) {
          break;
        }
        v12 = [NSNumber numberWithDouble:v11];
        objc_msgSend(v6, "addSample:forKey:withPosition:", v12, kTISKDeleteToDeletePositionalMetric, -[TISKDeleteKeyEvent _metricDeleteKeyPostion](self, "_metricDeleteKeyPostion"));
        goto LABEL_9;
      case 8u:
        v15 = NSNumber;
        [(TISKEvent *)self touchDownTimestamp];
        double v17 = v16;
        [v7 touchUpTimestamp];
        v12 = [v15 numberWithDouble:v17 - v18];
        uint64_t v13 = kTISKPathToDeleteMetric;
LABEL_8:
        [v6 addSample:v12 forKey:v13];
LABEL_9:

        break;
      default:
        break;
    }
  }
}

- (void)reportToSession:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TISKDeleteKeyEvent;
  [(TISKInputEvent *)&v11 reportToSession:v4];
  [v4 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfDeletesCounter];
  if (![(TISKInputEvent *)self ignoreTapData])
  {
    v5 = NSNumber;
    [(TISKInputEvent *)self touchDownErrorDistance];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
    [v4 addSample:v6 forKey:kTISKDeleteDownErrorDistance];

    id v7 = NSNumber;
    [(TISKInputEvent *)self touchUpErrorDistance];
    double v8 = objc_msgSend(v7, "numberWithDouble:");
    [v4 addSample:v8 forKey:kTISKDeleteUpErrorDistance];

    double v9 = NSNumber;
    [(TISKInputEvent *)self downUpTimeDelta];
    double v10 = objc_msgSend(v9, "numberWithDouble:");
    [v4 addSample:v10 forKey:kTISKDeleteTouchDownUpMetric];
  }
}

- (int64_t)_metricDeleteKeyPostion
{
  if (self->_deletePostion >= 4uLL) {
    return 4;
  }
  else {
    return self->_deletePostion;
  }
}

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TISKDeleteKeyEvent;
  v5 = [(TISKInputEvent *)&v9 init:a3 type:3 emojiSearchMode:a4 order:a5];
  id v6 = v5;
  if (v5)
  {
    v5[8] = -1;
    id v7 = [v5 input];
    objc_msgSend(v6, "setIgnoreTapData:", objc_msgSend(v7, "isRapidDelete"));
  }
  return v6;
}

@end