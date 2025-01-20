@interface PBUIWallpaperImageSlotRequestAction
- (NSString)slotIdentifier;
- (PBUIWallpaperImageSlotRequestAction)initWithVariant:(int64_t)a3 desiredStyle:(int64_t)a4 traitCollection:(id)a5 slotIdentifier:(id)a6 forResponseOnQueue:(id)a7 withHandler:(id)a8;
- (UITraitCollection)traitCollection;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)desiredStyle;
- (int64_t)variant;
- (void)invalidate;
@end

@implementation PBUIWallpaperImageSlotRequestAction

- (PBUIWallpaperImageSlotRequestAction)initWithVariant:(int64_t)a3 desiredStyle:(int64_t)a4 traitCollection:(id)a5 slotIdentifier:(id)a6 forResponseOnQueue:(id)a7 withHandler:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  v16 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v17 = a6;
  id v18 = a5;
  id v19 = objc_alloc_init(v16);
  v20 = [NSNumber numberWithInteger:a3];
  [v19 setObject:v20 forSetting:1];

  v21 = [NSNumber numberWithInteger:a4];
  [v19 setObject:v21 forSetting:2];

  v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];

  [v19 setObject:v22 forSetting:3];
  [v19 setObject:v17 forSetting:4];

  if (v15)
  {
    v23 = [MEMORY[0x1E4F4F670] responderWithHandler:v15];
    v24 = v23;
    if (v14) {
      [v23 setQueue:v14];
    }
  }
  else
  {
    v24 = 0;
  }
  v28.receiver = self;
  v28.super_class = (Class)PBUIWallpaperImageSlotRequestAction;
  v25 = [(PBUIWallpaperImageSlotRequestAction *)&v28 initWithInfo:v19 responder:v24];
  v26 = v25;
  if (v25) {
    objc_storeStrong((id *)&v25->_responder, v24);
  }

  return v26;
}

- (int64_t)variant
{
  v2 = [(PBUIWallpaperImageSlotRequestAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)desiredStyle
{
  v2 = [(PBUIWallpaperImageSlotRequestAction *)self info];
  v3 = [v2 objectForSetting:2];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (UITraitCollection)traitCollection
{
  v2 = [(PBUIWallpaperImageSlotRequestAction *)self info];
  v3 = [v2 objectForSetting:3];

  int64_t v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];

  return (UITraitCollection *)v4;
}

- (NSString)slotIdentifier
{
  v2 = [(PBUIWallpaperImageSlotRequestAction *)self info];
  v3 = [v2 objectForSetting:4];

  return (NSString *)v3;
}

- (void)invalidate
{
  responder = self->_responder;
  if (responder)
  {
    [(BSActionResponder *)responder annul];
    int64_t v4 = self->_responder;
    self->_responder = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PBUIWallpaperImageSlotRequestAction;
    [(PBUIWallpaperImageSlotRequestAction *)&v5 invalidate];
  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return off_1E62B28E8[a3 - 1];
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6 = a4;
  v7 = v6;
  if (a5 == 2)
  {
    uint64_t v8 = PBUIWallpaperStyleDescription([v6 integerValue]);
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    uint64_t v8 = PBUIStringForWallpaperVariant([v6 integerValue]);
LABEL_5:
    v9 = (void *)v8;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (void).cxx_destruct
{
}

@end