@interface PXPeopleNamePickerTitleView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSMutableArray)fetchResults;
- (NSString)localizedName;
- (NSString)placeholder;
- (PHFace)face;
- (PHPerson)person;
- (PXPeopleNamePickerTitleView)initWithCoder:(id)a3;
- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3;
- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3 face:(id)a4;
- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3 person:(id)a4;
- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3 person:(id)a4 face:(id)a5;
- (PXPeopleScalableAvatarView)avatarView;
- (UIFont)nameFont;
- (UIFont)placeholderFont;
- (UITextField)nameField;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (void)_updateFieldPlaceholder;
- (void)_updateFieldText;
- (void)dealloc;
- (void)finishEditing;
- (void)resetImages;
- (void)setLocalizedName:(id)a3;
- (void)setNameFont:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setPlaceholderFont:(id)a3;
@end

@implementation PXPeopleNamePickerTitleView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_fetchResults, 0);
  objc_storeStrong((id *)&self->_placeholderFont, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_nameFont, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_nameField, 0);
}

- (PHFace)face
{
  return self->_face;
}

- (PHPerson)person
{
  return self->_person;
}

- (PXPeopleScalableAvatarView)avatarView
{
  return self->_avatarView;
}

- (NSMutableArray)fetchResults
{
  return self->_fetchResults;
}

- (UIFont)placeholderFont
{
  return self->_placeholderFont;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (UIFont)nameFont
{
  return self->_nameFont;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (UITextField)nameField
{
  return self->_nameField;
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [(PXPeopleNamePickerTitleView *)self fetchResults];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [v4 changeDetailsForFetchResult:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        if (v9)
        {
          v10 = v9;
          v11 = [v9 removedObjects];
          uint64_t v12 = [v11 count];

          if (v12)
          {
            LODWORD(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  v13 = [(PXPeopleNamePickerTitleView *)self face];
  if (!v13)
  {
    if (!v6) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v14 = [v4 changeDetailsForObject:v13];
  if (v14) {
    LOBYTE(v6) = 1;
  }

  if (v6)
  {
LABEL_16:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PXPeopleNamePickerTitleView_prepareForPhotoLibraryChange___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_17:

  return 0;
}

uint64_t __60__PXPeopleNamePickerTitleView_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetImages];
}

- (void)_updateFieldPlaceholder
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v4 = [(PXPeopleNamePickerTitleView *)self placeholder];
  v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1F00B0030;
  }
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  uint64_t v7 = [(PXPeopleNamePickerTitleView *)self placeholderFont];
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = (void *)[v3 initWithString:v6 attributes:v8];

  v10 = [(PXPeopleNamePickerTitleView *)self nameField];
  [v10 setAttributedPlaceholder:v9];
}

- (void)_updateFieldText
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v4 = [(PXPeopleNamePickerTitleView *)self localizedName];
  v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1F00B0030;
  }
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  uint64_t v7 = [(PXPeopleNamePickerTitleView *)self nameFont];
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = (void *)[v3 initWithString:v6 attributes:v8];

  v10 = [(PXPeopleNamePickerTitleView *)self nameField];
  [v10 setAttributedText:v9];
}

- (void)setPlaceholderFont:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderFont, a3);
  [(PXPeopleNamePickerTitleView *)self _updateFieldPlaceholder];
}

- (void)setNameFont:(id)a3
{
  objc_storeStrong((id *)&self->_nameFont, a3);
  [(PXPeopleNamePickerTitleView *)self _updateFieldText];
}

- (void)setPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_placeholder, a3);
  [(PXPeopleNamePickerTitleView *)self _updateFieldPlaceholder];
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
  [(PXPeopleNamePickerTitleView *)self _updateFieldText];
}

- (void)resetImages
{
  id v8 = [(PXPeopleNamePickerTitleView *)self avatarView];
  uint64_t v4 = [(PXPeopleNamePickerTitleView *)self person];

  if (v4)
  {
    v5 = [(PXPeopleNamePickerTitleView *)self person];
    [v8 setPerson:v5];
  }
  else
  {
    uint64_t v6 = [(PXPeopleNamePickerTitleView *)self face];

    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PXPeopleNamePickerTitleView.m" lineNumber:150 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v5 = [(PXPeopleNamePickerTitleView *)self face];
    [v8 setFace:v5];
  }
}

- (void)finishEditing
{
  [(PXPeopleNamePickerTitleView *)self _updateFieldText];
  id v3 = [(PXPeopleNamePickerTitleView *)self nameField];
  [v3 resignFirstResponder];
}

- (void)dealloc
{
  id v3 = [(PXPeopleNamePickerTitleView *)self person];
  if (v3) {
    [(PXPeopleNamePickerTitleView *)self person];
  }
  else {
  uint64_t v4 = [(PXPeopleNamePickerTitleView *)self face];
  }

  v5 = [v4 photoLibrary];
  objc_msgSend(v5, "px_unregisterChangeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleNamePickerTitleView;
  [(PXPeopleNamePickerTitleView *)&v6 dealloc];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = [(PXPeopleNamePickerTitleView *)self nameField];
  objc_msgSend(v7, "convertPoint:fromView:", self, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  uint64_t v12 = [(PXPeopleNamePickerTitleView *)self nameField];
  [v12 bounds];
  v14.double x = v9;
  v14.double y = v11;
  LOBYTE(v7) = CGRectContainsPoint(v15, v14);

  return (char)v7;
}

- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3 person:(id)a4 face:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v66[1] = *MEMORY[0x1E4F143B8];
  unint64_t v12 = (unint64_t)a4;
  unint64_t v13 = (unint64_t)a5;
  if (!(v12 | v13))
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2 object:self file:@"PXPeopleNamePickerTitleView.m" lineNumber:62 description:@"Both person and face are nil"];
  }
  v64.receiver = self;
  v64.super_class = (Class)PXPeopleNamePickerTitleView;
  CGPoint v14 = -[PXPeopleNamePickerTitleView initWithFrame:](&v64, sel_initWithFrame_, x, y, width, height);
  CGRect v15 = v14;
  if (v14)
  {
    if (v12)
    {
      uint64_t v16 = +[PXPeopleUtilities titleStringForPerson:v12];
      localizedName = v15->_localizedName;
      v15->_localizedName = (NSString *)v16;
      long long v18 = &OBJC_IVAR___PXPeopleNamePickerTitleView__person;
      long long v19 = (void *)v12;
    }
    else
    {
      localizedName = v14->_localizedName;
      v14->_localizedName = (NSString *)&stru_1F00B0030;
      long long v18 = &OBJC_IVAR___PXPeopleNamePickerTitleView__face;
      long long v19 = (void *)v13;
    }

    uint64_t v20 = *v18;
    v21 = v19;
    uint64_t v22 = *(Class *)((char *)&v15->super.super.super.isa + v20);
    *(Class *)((char *)&v15->super.super.super.isa + v20) = v21;

    id v23 = objc_alloc(MEMORY[0x1E4FB1D70]);
    [(PXPeopleNamePickerTitleView *)v15 bounds];
    v24 = objc_msgSend(v23, "initWithFrame:");
    [v24 setText:v15->_localizedName];
    [v24 setBorderStyle:0];
    [v24 setReturnKeyType:9];
    [v24 setAutocorrectionType:1];
    [v24 setAutocapitalizationType:1];
    uint64_t v25 = [v24 font];
    nameFont = v15->_nameFont;
    v15->_nameFont = (UIFont *)v25;

    objc_storeStrong((id *)&v15->_placeholderFont, v15->_nameFont);
    objc_storeStrong((id *)&v15->_nameField, v24);
    [(PXPeopleNamePickerTitleView *)v15 addSubview:v24];
    [v24 setTextAlignment:4];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = objc_alloc_init(PXPeopleScalableAvatarView);
    [(PXPeopleScalableAvatarView *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXPeopleScalableAvatarView *)v27 setAccessibilityIgnoresInvertColors:1];
    unint64_t v62 = v13;
    unint64_t v63 = v12;
    if (v12)
    {
      [(PXPeopleScalableAvatarView *)v27 setPerson:v12];
      v28 = [(id)v12 photoLibrary];
      v29 = [v28 librarySpecificFetchOptions];

      [v29 setFetchLimit:1];
      v30 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend((id)v12, "detectionType"));
      v66[0] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
      [v29 setIncludedDetectionTypes:v31];

      [v29 setIncludeTorsoAndFaceDetectionData:1];
      v32 = objc_msgSend(MEMORY[0x1E4F39050], "px_fetchKeyFaceForPerson:options:", v12, v29);
      uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
      fetchResults = v15->_fetchResults;
      v15->_fetchResults = (NSMutableArray *)v33;

      [(NSMutableArray *)v15->_fetchResults addObject:v32];
      v61 = (void *)v12;
    }
    else
    {
      [(PXPeopleScalableAvatarView *)v27 setFace:v13];
      v61 = (void *)v13;
    }
    avatarView = v15->_avatarView;
    v15->_avatarView = v27;
    v36 = v27;

    [(PXPeopleNamePickerTitleView *)v15 addSubview:v36];
    v52 = (void *)MEMORY[0x1E4F28DC8];
    v60 = [(PXPeopleScalableAvatarView *)v36 leadingAnchor];
    v59 = [(PXPeopleNamePickerTitleView *)v15 leadingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:10.0];
    v65[0] = v58;
    v57 = [(PXPeopleScalableAvatarView *)v36 centerYAnchor];
    v56 = [(PXPeopleNamePickerTitleView *)v15 centerYAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v65[1] = v55;
    v54 = [(PXPeopleScalableAvatarView *)v36 widthAnchor];
    v53 = [v54 constraintEqualToConstant:50.0];
    v65[2] = v53;
    v51 = [(PXPeopleScalableAvatarView *)v36 heightAnchor];
    v50 = [v51 constraintEqualToConstant:50.0];
    v65[3] = v50;
    v49 = [v24 leadingAnchor];
    v48 = [(PXPeopleScalableAvatarView *)v36 trailingAnchor];
    v47 = [v49 constraintEqualToAnchor:v48 constant:10.0];
    v65[4] = v47;
    v37 = [v24 trailingAnchor];
    v38 = [(PXPeopleNamePickerTitleView *)v15 trailingAnchor];
    v39 = [v37 constraintEqualToAnchor:v38 constant:-10.0];
    v65[5] = v39;
    v40 = [v24 centerYAnchor];
    v41 = [(PXPeopleNamePickerTitleView *)v15 centerYAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v65[6] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:7];
    [v52 activateConstraints:v43];

    v44 = [v61 photoLibrary];
    objc_msgSend(v44, "px_registerChangeObserver:", v15);

    unint64_t v13 = v62;
    unint64_t v12 = v63;
  }

  return v15;
}

- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3 face:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  if (!v10)
  {
    unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXPeopleNamePickerTitleView.m", 57, @"Invalid parameter not satisfying: %@", @"face" object file lineNumber description];
  }
  CGFloat v11 = -[PXPeopleNamePickerTitleView initWithFrame:person:face:](self, "initWithFrame:person:face:", 0, v10, x, y, width, height);

  return v11;
}

- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3 person:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  if (!v10)
  {
    unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXPeopleNamePickerTitleView.m", 52, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  CGFloat v11 = -[PXPeopleNamePickerTitleView initWithFrame:person:face:](self, "initWithFrame:person:face:", v10, 0, x, y, width, height);

  return v11;
}

- (PXPeopleNamePickerTitleView)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXPeopleNamePickerTitleView.m" lineNumber:46 description:@"invalid initializer"];

  return 0;
}

- (PXPeopleNamePickerTitleView)initWithFrame:(CGRect)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v5 handleFailureInMethod:a2 object:self file:@"PXPeopleNamePickerTitleView.m" lineNumber:39 description:@"invalid initializer"];

  return 0;
}

@end