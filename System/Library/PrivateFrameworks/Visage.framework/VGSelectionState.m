@interface VGSelectionState
+ (id)capturedStatesFromCapturedPoses:(id)a3;
- (BOOL)completed;
- (BOOL)failed;
- (float)progress;
- (void)setCompleted:(BOOL)a3;
- (void)setFailed:(BOOL)a3;
- (void)setProgress:(float)a3;
@end

@implementation VGSelectionState

+ (id)capturedStatesFromCapturedPoses:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = NSNumber;
        v11 = objc_msgSend(v5, "objectForKey:", v9, (void)v14);
        v12 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "valid"));
        [v4 setObject:v12 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)failed
{
  return self->_failed;
}

- (void)setFailed:(BOOL)a3
{
  self->_failed = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

@end