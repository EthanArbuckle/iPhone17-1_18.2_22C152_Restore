@interface NTKUserPhotoFace
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3;
- (BOOL)_option:(id)a3 migratesToValidOption:(id *)a4 forCustomEditMode:(int64_t)a5;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (int64_t)editModeForCustomEditViewController;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKUserPhotoFace

- (id)_customEditModes
{
  return &unk_1F16E8BA8;
}

- (int64_t)editModeForCustomEditViewController
{
  return 12;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 14)
  {
    v7 = [(NTKFace *)self device];
    uint64_t v8 = +[NTKDateAlignmentEditOption optionWithAlignment:0 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 12)
  {
    v7 = [(NTKFace *)self device];
    uint64_t v8 = +[NTKUserPhotoEditOption optionUsingDefaultPhoto:1 forDevice:v7];
LABEL_5:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 12)
  {
    v4 = objc_msgSend(@"EDIT_MODE_LABEL_PHOTO_CONTENT", "stringByAppendingString:", @"_COMPANION", a4);
    v5 = NTKCompanionClockFaceLocalizedString(v4, @"Photo");
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NTKUserPhotoFace;
    v5 = objc_msgSendSuper2(&v7, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, a4);
  }

  return v5;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  if (a3 == 12) {
    return 0;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)NTKUserPhotoFace;
  return -[NTKFace _hasOptionsForCustomEditMode:](&v6, sel__hasOptionsForCustomEditMode_);
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 != 14) {
    return 0;
  }
  uint64_t v4 = [(NTKFace *)self device];
  unint64_t v5 = +[NTKEnumeratedEditOption numberOfOptionsForDevice:v4];

  return v5;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  if (a4 == 14)
  {
    v10 = [(NTKFace *)self device];
    v9 = +[NTKEnumeratedEditOption optionAtIndex:a3 forDevice:v10];
  }
  else if (a4 == 12 && !a3)
  {
    v9 = [(NTKFace *)self selectedOptionForCustomEditMode:12 slot:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 14)
  {
    id v10 = [(NTKFace *)self device];
    unint64_t v11 = +[NTKEnumeratedEditOption indexOfOption:v8 forDevice:v10];
  }
  else
  {
    if (a4 != 12)
    {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_9;
    }
    id v10 = [(NTKFace *)self selectedOptionForCustomEditMode:12 slot:v9];
    if (v10 == v8) {
      unint64_t v11 = 0;
    }
    else {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

LABEL_9:
  return v11;
}

- (BOOL)_option:(id)a3 migratesToValidOption:(id *)a4 forCustomEditMode:(int64_t)a5
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if (([v8 isDefaultPhoto] & 1) == 0)
    {
      uint64_t v9 = [v8 path];
      if (v9)
      {
        id v10 = (void *)v9;
        [(NTKFace *)self setResourceDirectoryByTransferringOwnership:v9];
        unint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v11 removeItemAtPath:v10 error:0];
      }
    }
    uint64_t v12 = [v8 isDefaultPhoto];
    v13 = [(NTKFace *)self device];
    *a4 = +[NTKUserPhotoEditOption optionUsingDefaultPhoto:v12 forDevice:v13];

    BOOL v14 = *a4 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 12 || a3 == 14)
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (Class)v4;
}

@end