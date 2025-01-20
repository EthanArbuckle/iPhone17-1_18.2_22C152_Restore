@interface _UIFeedbackPattern
+ (BOOL)supportsSecureCoding;
+ (Class)_parametersClass;
+ (id)feedbackPattern;
+ (id)type;
- (BOOL)canReuseCoreHapticsPlayer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighPriority;
- (BOOL)isPlaying;
- (BOOL)isRepeating;
- (CGPoint)_location;
- (NSMutableArray)feedbacks;
- (NSTimer)repeatTimer;
- (_UIFeedbackPattern)initWithDictionaryRepresentation:(id)a3;
- (double)duration;
- (id)_allEventTypes;
- (id)_allSystemSoundIDs;
- (id)_debugDictionary;
- (id)_individualFeedbacks;
- (id)_playableProtocol;
- (id)_view;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)_effectivePlayableFeedbackTypes;
- (void)_playPattern;
- (void)_setLocation:(CGPoint)a3;
- (void)_setView:(id)a3;
- (void)addFeedback:(id)a3 atTime:(double)a4;
- (void)play;
- (void)setCanReuseCoreHapticsPlayer:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setFeedbacks:(id)a3;
- (void)setPosition:(float)a3;
- (void)setRepeatTimer:(id)a3;
- (void)stop;
@end

@implementation _UIFeedbackPattern

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"pattern";
}

+ (id)feedbackPattern
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (Class)_parametersClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)_UIFeedbackPattern;
  id v4 = [(_UIFeedback *)&v16 copyWithZone:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(_UIFeedbackPattern *)self feedbacks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 _delay];
        objc_msgSend(v4, "addFeedback:atTime:", v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackPattern;
  if ([(_UIFeedback *)&v7 isEqual:v4]) {
    char v5 = [(NSMutableArray *)self->_feedbacks isEqual:v4[18]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (_UIFeedbackPattern)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_UIFeedbackPattern;
  char v5 = [(_UIFeedback *)&v27 initWithDictionaryRepresentation:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"duration"];
    [v6 doubleValue];
    v5->_duration = v7;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v22 = v4;
    v9 = [v4 objectForKeyedSubscript:@"feedbacks"];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = +[_UIFeedback feedbackWithDictionaryRepresentation:*(void *)(*((void *)&v23 + 1) + 8 * v13)];
          if (v14)
          {
            long long v15 = [(_UIFeedback *)v5 audioParameters];
            objc_super v16 = [v14 audioParameters];
            [v16 setParentParameters:v15];

            v17 = [(_UIFeedback *)v5 hapticParameters];
            uint64_t v18 = [v14 hapticParameters];
            [v18 setParentParameters:v17];

            [v8 addObject:v14];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);
    }

    [(_UIFeedbackPattern *)v5 setFeedbacks:v8];
    id v4 = v22;
    v19 = [v22 objectForKeyedSubscript:@"canReuseCoreHapticsPlayer"];
    v5->_canReuseCoreHapticsPlayer = [v19 BOOLValue];

    v20 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)_UIFeedbackPattern;
  v3 = [(_UIFeedback *)&v19 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  char v5 = [NSNumber numberWithDouble:self->_duration];
  [v4 setObject:v5 forKeyedSubscript:@"duration"];

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v7 = [(_UIFeedbackPattern *)self feedbacks];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dictionaryRepresentation];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }

  [v4 setObject:v6 forKeyedSubscript:@"feedbacks"];
  uint64_t v13 = [NSNumber numberWithBool:self->_canReuseCoreHapticsPlayer];
  [v4 setObject:v13 forKeyedSubscript:@"canReuseCoreHapticsPlayer"];

  return v4;
}

- (id)_playableProtocol
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_duration <= 0.0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = [(_UIFeedbackPattern *)self feedbacks];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) _playableProtocol];

          if (v8 == &unk_1ED54E8B0)
          {
            id v9 = &unk_1ED54E8B0;

            goto LABEL_14;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v2 = &unk_1ED54E6B8;
  }
  else
  {
    id v2 = &unk_1ED54E8B0;
  }
  id v9 = v2;
LABEL_14:
  return v9;
}

- (NSMutableArray)feedbacks
{
  feedbacks = self->_feedbacks;
  if (!feedbacks)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = self->_feedbacks;
    self->_feedbacks = v4;

    feedbacks = self->_feedbacks;
  }
  return feedbacks;
}

- (void)addFeedback:(id)a3 atTime:(double)a4
{
  double v7 = (_UIFeedbackPattern *)a3;
  long long v14 = v7;
  if (v7 == self)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:v14 file:@"_UIFeedback.m" lineNumber:1281 description:@"Cannot add a feedback pattern to itself."];
  }
  else
  {
    uint64_t v8 = (_UIFeedbackPattern *)[(_UIFeedbackPattern *)v7 copy];

    id v9 = [(_UIFeedback *)self audioParameters];
    uint64_t v10 = [(_UIFeedback *)v8 audioParameters];
    [v10 setParentParameters:v9];

    long long v11 = [(_UIFeedback *)self hapticParameters];
    long long v12 = [(_UIFeedback *)v8 hapticParameters];
    [v12 setParentParameters:v11];

    [(_UIFeedback *)v8 _setParentPattern:self];
    [(_UIFeedback *)v8 _setDelay:a4];
    long long v13 = [(_UIFeedbackPattern *)self feedbacks];
    [v13 addObject:v8];
    long long v14 = v8;
  }
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = self->_feedbacks;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "_effectivePlayableFeedbackTypes", (void)v9);
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_individualFeedbacks
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_feedbacks, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_feedbacks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "_individualFeedbacks", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_allEventTypes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E60] indexSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_feedbacks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "_allEventTypes", (void)v11);
        [v3 addIndexes:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_allSystemSoundIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E60] indexSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_feedbacks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "_allSystemSoundIDs", (void)v11);
        [v3 addIndexes:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)play
{
  if (self->_duration > 0.0)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB00], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__playPattern, 0, 1);
    [(_UIFeedbackPattern *)self setRepeatTimer:v3];
  }
  [(_UIFeedbackPattern *)self _playPattern];
}

- (void)_playPattern
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[_UIFeedbackEngine engineForFeedback:self];
  if ([(id)objc_opt_class() _supportsPlayingFeedbackPatternsDirectly])
  {
    v13.receiver = self;
    v13.super_class = (Class)_UIFeedbackPattern;
    [(_UIFeedback *)&v13 play];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = [(_UIFeedbackPattern *)self feedbacks];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) play];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)stop
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  repeatTimer = self->_repeatTimer;
  if (repeatTimer)
  {
    [(NSTimer *)repeatTimer invalidate];
    [(_UIFeedbackPattern *)self setRepeatTimer:0];
  }
  uint64_t v4 = +[_UIFeedbackEngine engineForFeedback:self];
  if ([(id)objc_opt_class() _supportsPlayingFeedbackPatternsDirectly])
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIFeedbackPattern;
    [(_UIFeedback *)&v14 stop];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [(_UIFeedbackPattern *)self feedbacks];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) stop];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)isPlaying
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[_UIFeedbackEngine engineForFeedback:self];
  if ([(id)objc_opt_class() _supportsPlayingFeedbackPatternsDirectly])
  {
    v15.receiver = self;
    v15.super_class = (Class)_UIFeedbackPattern;
    BOOL v4 = [(_UIFeedback *)&v15 isPlaying];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [(_UIFeedbackPattern *)self feedbacks];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) isPlaying])
          {

            BOOL v4 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    BOOL v4 = 0;
  }
LABEL_13:

  return v4;
}

- (void)setPosition:(float)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFeedbackPattern;
  -[_UIFeedback setPosition:](&v3, sel_setPosition_);
}

- (id)_debugDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"feedbacks";
  id v2 = [(_UIFeedbackPattern *)self feedbacks];
  v6[0] = v2;
  objc_super v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)setCanReuseCoreHapticsPlayer:(BOOL)a3
{
  self->_canReuseCoreHapticsPlayer = a3;
}

- (BOOL)canReuseCoreHapticsPlayer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_canReuseCoreHapticsPlayer) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(_UIFeedbackPattern *)self feedbacks];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0 || ![v7 canReuseCoreHapticsPlayer])
        {
          BOOL v8 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 1;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (CGPoint)_location
{
  id v2 = [(_UIFeedbackPattern *)self feedbacks];
  uint64_t v3 = [v2 firstObject];

  if (v3)
  {
    [v3 _location];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v7 = 0x7FEFFFFFFFFFFFFFLL;
  }

  double v8 = *(double *)&v5;
  double v9 = *(double *)&v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_setLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(_UIFeedbackPattern *)self feedbacks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_setLocation:", x, y);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_view
{
  id v2 = [(_UIFeedbackPattern *)self feedbacks];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = [v3 _view];

  return v4;
}

- (void)_setView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(_UIFeedbackPattern *)self feedbacks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _setView:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setFeedbacks:(id)a3
{
}

- (BOOL)isRepeating
{
  return self->_isRepeating;
}

- (NSTimer)repeatTimer
{
  return self->_repeatTimer;
}

- (void)setRepeatTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatTimer, 0);
  objc_storeStrong((id *)&self->_feedbacks, 0);
}

@end