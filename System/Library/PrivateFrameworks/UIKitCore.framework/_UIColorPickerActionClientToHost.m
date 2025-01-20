@interface _UIColorPickerActionClientToHost
+ (id)_actionForActionType:(int64_t)a3;
+ (id)actionForColorPickerDidDismissEyedropper;
+ (id)actionForColorPickerDidFinish;
+ (id)actionForColorPickerDidFloatEyedropper;
+ (id)actionForColorPickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5;
+ (id)actionForColorPickerDidShowEyedropper;
- (void)performActionForSceneController:(id)a3;
@end

@implementation _UIColorPickerActionClientToHost

+ (id)actionForColorPickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = (void *)MEMORY[0x1E4F1C9B8];
  id v9 = a4;
  v10 = objc_msgSend(v8, "bs_secureDataFromObject:", a3);
  id v11 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v11 setObject:&unk_1ED3F3D68 forSetting:0];
  [v11 setObject:v10 forSetting:1];
  [v11 setObject:v9 forSetting:2];

  [v11 setFlag:v5 forSetting:3];
  v12 = (void *)[objc_alloc((Class)a1) initWithInfo:v11 responder:0];

  return v12;
}

+ (id)actionForColorPickerDidShowEyedropper
{
  return (id)[a1 _actionForActionType:1];
}

+ (id)actionForColorPickerDidFinish
{
  return (id)[a1 _actionForActionType:2];
}

+ (id)actionForColorPickerDidFloatEyedropper
{
  return (id)[a1 _actionForActionType:3];
}

+ (id)actionForColorPickerDidDismissEyedropper
{
  return (id)[a1 _actionForActionType:4];
}

+ (id)_actionForActionType:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:0];

  v7 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];
  return v7;
}

- (void)performActionForSceneController:(id)a3
{
  id v5 = [a3 delegate];
  if (([v5 conformsToProtocol:&unk_1ED4AF7E8] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UIColorPickerActionClientToHost.m", 76, @"Scene controller's delegate (%@) does not conform to _UIColorPickerViewProvidingDelegate", objc_opt_class() object file lineNumber description];
  }
  id v17 = v5;
  v6 = [(_UIColorPickerActionClientToHost *)self info];
  v7 = [v6 objectForSetting:0];
  uint64_t v8 = [v7 integerValue];

  switch(v8)
  {
    case 0:
      id v9 = [(_UIColorPickerActionClientToHost *)self info];
      v10 = [v9 objectForSetting:1];
      id v11 = +[UIColor bs_secureDecodedFromData:v10];

      v12 = [(_UIColorPickerActionClientToHost *)self info];
      v13 = [v12 objectForSetting:2];

      v14 = [(_UIColorPickerActionClientToHost *)self info];
      uint64_t v15 = [v14 BOOLForSetting:3];

      [v17 _pickerDidSelectColor:v11 colorSpace:v13 isVolatile:v15];
      break;
    case 1:
      [v17 _pickerDidShowEyedropper];
      break;
    case 2:
      [v17 _pickerDidFinish];
      break;
    case 3:
      [v17 _pickerDidFloatEyedropper];
      break;
    case 4:
      [v17 _pickerDidDismissEyedropper];
      break;
    default:
      break;
  }
}

@end