@interface PGCommand
+ (id)commandForBeginInterruption;
+ (id)commandForCancelPIP;
+ (id)commandForEndInterruptionWithShouldResumeSuggestion:(BOOL)a3;
+ (id)commandForEndOrLeaveActivityRequested;
+ (id)commandForFaceTimeAction:(int64_t)a3;
+ (id)commandForFaceTimeAction:(int64_t)a3 associatedBoolValue:(BOOL)a4;
+ (id)commandForFaceTimeAction:(int64_t)a3 associatedIntegerValue:(int64_t)a4;
+ (id)commandForInvalidateFromProxy;
+ (id)commandForMenuItemSelected:(int64_t)a3;
+ (id)commandForPlaybackAction:(int64_t)a3;
+ (id)commandForPlaybackAction:(int64_t)a3 associatedBoolValue:(BOOL)a4;
+ (id)commandForPlaybackAction:(int64_t)a3 associatedDoubleValue:(double)a4;
+ (id)commandForRestoreFromPIP;
+ (id)commandForSendActionButtonTapped;
+ (id)commandForSetCameraEnabled:(BOOL)a3;
+ (id)commandForSetMicrophoneMuted:(BOOL)a3;
+ (id)commandForSetMuted:(BOOL)a3;
+ (id)commandForSetPlaying:(BOOL)a3;
+ (id)commandForSetSuspended:(BOOL)a3;
+ (id)commandForShowHUD;
+ (id)commandForSkipByInterval:(double)a3;
+ (id)commandForSkipPreroll;
+ (id)commandForSkipToLive;
+ (id)commandForStartPIP;
+ (id)commandForSwitchCamera;
+ (id)commandForSystemAction:(int64_t)a3;
+ (id)commandForTestStartPIP;
+ (id)commandForTestingAction:(int64_t)a3;
+ (id)commandForToggleControlsVisibility;
+ (id)commandForToggleZoom;
- (BOOL)associatedBoolValue;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (PGCommand)initWithDictionary:(id)a3;
- (double)associatedDoubleValue;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)associatedIntegerValue;
- (int64_t)faceTimeAction;
- (int64_t)playbackAction;
- (int64_t)systemAction;
- (int64_t)testingAction;
- (void)appendDescriptionForKey:(int64_t)a3 value:(id)a4 toBuilder:(id)a5;
@end

@implementation PGCommand

+ (id)commandForPlaybackAction:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc((Class)a1);
  v9 = &unk_1F0E5D498;
  v5 = [NSNumber numberWithInteger:a3];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = (void *)[v4 initWithDictionary:v6];

  return v7;
}

+ (id)commandForPlaybackAction:(int64_t)a3 associatedBoolValue:(BOOL)a4
{
  BOOL v4 = a4;
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc((Class)a1);
  v12[0] = &unk_1F0E5D498;
  v7 = [NSNumber numberWithInteger:a3];
  v12[1] = &unk_1F0E5D4B0;
  v13[0] = v7;
  v8 = [NSNumber numberWithBool:v4];
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = (void *)[v6 initWithDictionary:v9];

  return v10;
}

+ (id)commandForPlaybackAction:(int64_t)a3 associatedDoubleValue:(double)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc((Class)a1);
  v12[0] = &unk_1F0E5D498;
  v7 = [NSNumber numberWithInteger:a3];
  v12[1] = &unk_1F0E5D4C8;
  v13[0] = v7;
  v8 = [NSNumber numberWithDouble:a4];
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = (void *)[v6 initWithDictionary:v9];

  return v10;
}

+ (id)commandForSetMuted:(BOOL)a3
{
  return (id)[a1 commandForPlaybackAction:4 associatedBoolValue:a3];
}

+ (id)commandForSetPlaying:(BOOL)a3
{
  return (id)[a1 commandForPlaybackAction:3 associatedBoolValue:a3];
}

+ (id)commandForSetSuspended:(BOOL)a3
{
  return (id)[a1 commandForPlaybackAction:5 associatedBoolValue:a3];
}

+ (id)commandForBeginInterruption
{
  return (id)[a1 commandForPlaybackAction:6];
}

+ (id)commandForEndInterruptionWithShouldResumeSuggestion:(BOOL)a3
{
  return (id)[a1 commandForPlaybackAction:7 associatedBoolValue:a3];
}

+ (id)commandForSkipToLive
{
  return (id)[a1 commandForPlaybackAction:2];
}

+ (id)commandForSkipPreroll
{
  return (id)[a1 commandForPlaybackAction:8];
}

+ (id)commandForSkipByInterval:(double)a3
{
  return (id)[a1 commandForPlaybackAction:1 associatedDoubleValue:a3];
}

+ (id)commandForEndOrLeaveActivityRequested
{
  return (id)[a1 commandForPlaybackAction:9];
}

+ (id)commandForSystemAction:(int64_t)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PGCommand.m", 88, @"Invalid parameter not satisfying: %@", @"action != PGSystemActionSendToProxy" object file lineNumber description];
  }
  id v5 = objc_alloc((Class)a1);
  v12 = &unk_1F0E5D4E0;
  id v6 = [NSNumber numberWithInteger:a3];
  v13[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v8 = (void *)[v5 initWithDictionary:v7];

  return v8;
}

+ (id)commandForCancelPIP
{
  return (id)[a1 commandForSystemAction:3];
}

+ (id)commandForRestoreFromPIP
{
  return (id)[a1 commandForSystemAction:2];
}

+ (id)commandForToggleControlsVisibility
{
  return (id)[a1 commandForSystemAction:4];
}

+ (id)commandForSendActionButtonTapped
{
  return (id)[a1 commandForSystemAction:1];
}

+ (id)commandForToggleZoom
{
  return (id)[a1 commandForSystemAction:5];
}

+ (id)commandForStartPIP
{
  return (id)[a1 commandForSystemAction:6];
}

+ (id)commandForInvalidateFromProxy
{
  return (id)[a1 commandForSystemAction:7];
}

+ (id)commandForTestingAction:(int64_t)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PGCommand.m", 123, @"Invalid parameter not satisfying: %@", @"action != 0" object file lineNumber description];
  }
  id v5 = objc_alloc((Class)a1);
  v12 = &unk_1F0E5D4F8;
  id v6 = [NSNumber numberWithInteger:a3];
  v13[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v8 = (void *)[v5 initWithDictionary:v7];

  return v8;
}

+ (id)commandForTestStartPIP
{
  return (id)[a1 commandForTestingAction:1];
}

+ (id)commandForSetCameraEnabled:(BOOL)a3
{
  return (id)[a1 commandForFaceTimeAction:1 associatedBoolValue:a3];
}

+ (id)commandForSetMicrophoneMuted:(BOOL)a3
{
  return (id)[a1 commandForFaceTimeAction:2 associatedBoolValue:a3];
}

+ (id)commandForSwitchCamera
{
  return (id)[a1 commandForFaceTimeAction:3];
}

+ (id)commandForMenuItemSelected:(int64_t)a3
{
  return (id)[a1 commandForFaceTimeAction:4 associatedIntegerValue:a3];
}

+ (id)commandForShowHUD
{
  return (id)[a1 commandForFaceTimeAction:5];
}

+ (id)commandForFaceTimeAction:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc((Class)a1);
  v9 = &unk_1F0E5D510;
  id v5 = [NSNumber numberWithInteger:a3];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = (void *)[v4 initWithDictionary:v6];

  return v7;
}

+ (id)commandForFaceTimeAction:(int64_t)a3 associatedBoolValue:(BOOL)a4
{
  BOOL v4 = a4;
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc((Class)a1);
  v12[0] = &unk_1F0E5D510;
  v7 = [NSNumber numberWithInteger:a3];
  v12[1] = &unk_1F0E5D4B0;
  v13[0] = v7;
  v8 = [NSNumber numberWithBool:v4];
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = (void *)[v6 initWithDictionary:v9];

  return v10;
}

+ (id)commandForFaceTimeAction:(int64_t)a3 associatedIntegerValue:(int64_t)a4
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc((Class)a1);
  v12[0] = &unk_1F0E5D510;
  v7 = [NSNumber numberWithInteger:a3];
  v12[1] = &unk_1F0E5D528;
  v13[0] = v7;
  v8 = [NSNumber numberWithInteger:a4];
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = (void *)[v6 initWithDictionary:v9];

  return v10;
}

- (PGCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGCommand;
  id v5 = [(PGCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 dictionaryRepresentation];
    uint64_t v6 = [(PGCommand *)self dictionaryRepresentation];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)playbackAction
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:&unk_1F0E5D498];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)systemAction
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:&unk_1F0E5D4E0];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)faceTimeAction
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:&unk_1F0E5D510];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)testingAction
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:&unk_1F0E5D4F8];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)associatedBoolValue
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:&unk_1F0E5D4B0];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)associatedIntegerValue
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:&unk_1F0E5D528];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (double)associatedDoubleValue
{
  v2 = [(NSDictionary *)self->_dictionaryRepresentation objectForKeyedSubscript:&unk_1F0E5D4C8];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)description
{
  return [(PGCommand *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(PGCommand *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(PGCommand *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (void)appendDescriptionForKey:(int64_t)a3 value:(id)a4 toBuilder:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  switch(a3)
  {
    case 1:
      unint64_t v8 = [v16 integerValue] - 1;
      if (v8 >= 9) {
        objc_super v9 = @"invalid";
      }
      else {
        objc_super v9 = off_1E610C400[v8];
      }
      v12 = @"playbackAction";
      goto LABEL_21;
    case 2:
      unint64_t v10 = [v16 integerValue] - 1;
      if (v10 >= 5) {
        objc_super v9 = @"invalid";
      }
      else {
        objc_super v9 = off_1E610C448[v10];
      }
      v12 = @"faceTimeAction";
      goto LABEL_21;
    case 3:
      unint64_t v11 = [v16 integerValue];
      if (v11 >= 8) {
        objc_super v9 = @"invalid";
      }
      else {
        objc_super v9 = off_1E610C470[v11];
      }
      v12 = @"systemAction";
      goto LABEL_21;
    case 4:
      if ([v16 integerValue] == 1) {
        objc_super v9 = @"startPIP";
      }
      else {
        objc_super v9 = @"invalid";
      }
      v12 = @"testingAction";
LABEL_21:
      [v7 appendString:v9 withName:v12];
      break;
    case 5:
      id v13 = (id)objc_msgSend(v7, "appendBool:withName:", objc_msgSend(v16, "BOOLValue"), @"associatedBoolValue");
      break;
    case 6:
      [v16 doubleValue];
      id v14 = (id)objc_msgSend(v7, "appendDouble:withName:decimalPrecision:", @"associatedDoubleValue", 2);
      break;
    case 7:
      id v15 = (id)objc_msgSend(v7, "appendInteger:withName:", objc_msgSend(v16, "integerValue"), @"associatedIntegerValue");
      break;
    default:
      break;
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(PGCommand *)self succinctDescriptionBuilder];
  v13.receiver = self;
  v13.super_class = (Class)PGCommand;
  uint64_t v6 = [(PGCommand *)&v13 description];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__PGCommand_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E610C258;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  [v7 appendBodySectionWithName:v6 multilinePrefix:v4 block:v11];

  unint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

void __51__PGCommand_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dictionaryRepresentation];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PGCommand_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v4[3] = &unk_1E610C3E0;
  double v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __51__PGCommand_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appendDescriptionForKey:value:toBuilder:", objc_msgSend(a2, "integerValue"), v5, *(void *)(a1 + 40));
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
}

@end