@interface _UISceneHostingSheetPresentationActionToHost
+ (id)actionForSheetGrabberDidTriggerPrimaryAction;
+ (id)actionForSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5;
+ (id)actionForSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6;
+ (id)actionForSheetInteractionDraggingDidEnd;
- (void)executeActionForSheetPresentationController:(id)a3;
@end

@implementation _UISceneHostingSheetPresentationActionToHost

+ (id)actionForSheetGrabberDidTriggerPrimaryAction
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v3 setObject:&unk_1ED3F38A0 forSetting:0];
  v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

+ (id)actionForSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  BOOL v7 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v10 setObject:&unk_1ED3F38B8 forSetting:0];
  v11 = [NSNumber numberWithDouble:a3];
  [v10 setObject:v11 forSetting:1];

  v12 = [NSNumber numberWithBool:v7];
  [v10 setObject:v12 forSetting:2];

  *(CGFloat *)v16 = x;
  *(CGFloat *)&v16[1] = y;
  v13 = [MEMORY[0x1E4F29238] valueWithBytes:v16 objCType:"{CGPoint=dd}"];
  [v10 setObject:v13 forSetting:3];

  v14 = (void *)[objc_alloc((Class)a1) initWithInfo:v10 responder:0];
  return v14;
}

+ (id)actionForSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v10 = a3.y;
  CGFloat v11 = a3.x;
  id v13 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v13 setObject:&unk_1ED3F38D0 forSetting:0];
  *(CGFloat *)v21 = v11;
  *(CGFloat *)&v21[1] = v10;
  v14 = [MEMORY[0x1E4F29238] valueWithBytes:v21 objCType:"{CGPoint=dd}"];
  [v13 setObject:v14 forSetting:4];

  *(CGFloat *)v20 = x;
  *(CGFloat *)&v20[1] = y;
  v15 = [MEMORY[0x1E4F29238] valueWithBytes:v20 objCType:"{CGPoint=dd}"];
  [v13 setObject:v15 forSetting:5];

  v16 = [NSNumber numberWithBool:v7];
  [v13 setObject:v16 forSetting:6];

  v17 = [NSNumber numberWithBool:v6];
  [v13 setObject:v17 forSetting:2];

  v18 = (void *)[objc_alloc((Class)a1) initWithInfo:v13 responder:0];
  return v18;
}

+ (id)actionForSheetInteractionDraggingDidEnd
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v3 setObject:&unk_1ED3F38E8 forSetting:0];
  v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

- (void)executeActionForSheetPresentationController:(id)a3
{
  id v38 = a3;
  v4 = [(_UISceneHostingSheetPresentationActionToHost *)self info];
  v5 = [v4 objectForSetting:0];
  uint64_t v6 = [v5 unsignedIntegerValue];

  switch(v6)
  {
    case 0:
      [v38 _remoteSheetGrabberDidTriggerPrimaryAction];
      break;
    case 1:
      BOOL v7 = [(_UISceneHostingSheetPresentationActionToHost *)self info];
      v8 = [v7 objectForSetting:1];
      [v8 floatValue];
      double v10 = v9;

      CGFloat v11 = [(_UISceneHostingSheetPresentationActionToHost *)self info];
      v12 = [v11 objectForSetting:2];
      uint64_t v13 = [v12 BOOLValue];

      v14 = [(_UISceneHostingSheetPresentationActionToHost *)self info];
      v15 = [v14 objectForSetting:3];
      [v15 CGPointValue];
      double v17 = v16;
      double v19 = v18;

      objc_msgSend(v38, "_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", v13, v10, v17, v19);
      break;
    case 2:
      v20 = [(_UISceneHostingSheetPresentationActionToHost *)self info];
      v21 = [v20 objectForSetting:4];
      [v21 CGPointValue];
      double v23 = v22;
      double v25 = v24;

      v26 = [(_UISceneHostingSheetPresentationActionToHost *)self info];
      v27 = [v26 objectForSetting:5];
      [v27 CGPointValue];
      double v29 = v28;
      double v31 = v30;

      v32 = [(_UISceneHostingSheetPresentationActionToHost *)self info];
      v33 = [v32 objectForSetting:6];
      uint64_t v34 = [v33 BOOLValue];

      v35 = [(_UISceneHostingSheetPresentationActionToHost *)self info];
      v36 = [v35 objectForSetting:2];
      uint64_t v37 = [v36 BOOLValue];

      objc_msgSend(v38, "_remoteSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", v34, v37, v23, v25, v29, v31);
      break;
    case 3:
      [v38 _remoteSheetInteractionDraggingDidEnd];
      break;
    default:
      break;
  }
}

@end