@interface _PXPhotoLibraryProcessingProgressRowCell
- (NSString)briefTitle;
- (UIImage)briefImage;
- (void)_handleBriefDescriptionResultsWithTitle:(id)a3 image:(id)a4;
- (void)setBriefImage:(id)a3;
- (void)setBriefTitle:(id)a3;
- (void)updateDisplayedContent;
@end

@implementation _PXPhotoLibraryProcessingProgressRowCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_briefImage, 0);
  objc_storeStrong((id *)&self->_briefTitle, 0);
}

- (UIImage)briefImage
{
  return self->_briefImage;
}

- (NSString)briefTitle
{
  return self->_briefTitle;
}

- (void)setBriefImage:(id)a3
{
  v17 = (UIImage *)a3;
  v6 = self->_briefImage;
  v7 = v17;
  if (v6 == v17) {
    goto LABEL_6;
  }
  v8 = v6;
  char v9 = -[UIImage isEqual:](v6, "isEqual:");

  if (v9) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->_briefImage, a3);
  v7 = [(PTUIRowTableViewCell *)self row];
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXPhotoLibraryProcessingProgressRow.m", 121, @"%@ should be an instance inheriting from %@, but it is nil", @"self.row", v14 object file lineNumber description];
LABEL_12:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXPhotoLibraryProcessingProgressRow.m", 121, @"%@ should be an instance inheriting from %@, but it is %@", @"self.row", v14, v16 object file lineNumber description];

    goto LABEL_12;
  }
LABEL_5:
  v10 = [v7 settings];
  v11 = [v7 imageKeyPath];
  [v10 setValue:v17 forKeyPath:v11];

LABEL_6:
LABEL_7:
}

- (void)setBriefTitle:(id)a3
{
  v17 = (NSString *)a3;
  v6 = self->_briefTitle;
  v7 = v17;
  if (v6 == v17) {
    goto LABEL_6;
  }
  v8 = v6;
  char v9 = -[NSString isEqual:](v6, "isEqual:");

  if (v9) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->_briefTitle, a3);
  v7 = [(PTUIRowTableViewCell *)self row];
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXPhotoLibraryProcessingProgressRow.m", 111, @"%@ should be an instance inheriting from %@, but it is nil", @"self.row", v14 object file lineNumber description];
LABEL_12:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXPhotoLibraryProcessingProgressRow.m", 111, @"%@ should be an instance inheriting from %@, but it is %@", @"self.row", v14, v16 object file lineNumber description];

    goto LABEL_12;
  }
LABEL_5:
  v10 = [v7 settings];
  v11 = [v7 titleKeyPath];
  [v10 setValue:v17 forKeyPath:v11];

LABEL_6:
LABEL_7:
}

- (void)_handleBriefDescriptionResultsWithTitle:(id)a3 image:(id)a4
{
  id v6 = a4;
  [(_PXPhotoLibraryProcessingProgressRowCell *)self setBriefTitle:a3];
  [(_PXPhotoLibraryProcessingProgressRowCell *)self setBriefImage:v6];
}

- (void)updateDisplayedContent
{
  v14.receiver = self;
  v14.super_class = (Class)_PXPhotoLibraryProcessingProgressRowCell;
  [(PTUIRowTableViewCell *)&v14 updateDisplayedContent];
  if (!self->_hasRequestedBriefDescription)
  {
    self->_hasRequestedBriefDescription = 1;
    objc_initWeak(&location, self);
    v4 = [(PTUIRowTableViewCell *)self row];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        v5 = [v4 photoLibrary];

        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __66___PXPhotoLibraryProcessingProgressRowCell_updateDisplayedContent__block_invoke;
        v11[3] = &unk_1E5DCD7E8;
        objc_copyWeak(&v12, &location);
        +[PXPhotoLibraryProcessingProgressReport requestBriefDescriptionForLibrary:v5 resultBlock:v11];
        objc_destroyWeak(&v12);

        objc_destroyWeak(&location);
        return;
      }
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      char v9 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v9);
      v10 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v6 handleFailureInMethod:a2, self, @"PXPhotoLibraryProcessingProgressRow.m", 93, @"%@ should be an instance inheriting from %@, but it is %@", @"self.row", v8, v10 object file lineNumber description];
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      [v6 handleFailureInMethod:a2, self, @"PXPhotoLibraryProcessingProgressRow.m", 93, @"%@ should be an instance inheriting from %@, but it is nil", @"self.row", v8 object file lineNumber description];
    }

    goto LABEL_4;
  }
}

@end