@interface _PXGenerativeStoryFeatureEligibilityRowCell
- (NSString)briefTitle;
- (UIImage)briefImage;
- (void)_handleResultsWithTitle:(id)a3 image:(id)a4;
- (void)setBriefImage:(id)a3;
- (void)setBriefTitle:(id)a3;
- (void)updateDisplayedContent;
@end

@implementation _PXGenerativeStoryFeatureEligibilityRowCell

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
    [v12 handleFailureInMethod:a2, self, @"PXGenerativeStoryFeatureEligibilityRow.m", 133, @"%@ should be an instance inheriting from %@, but it is nil", @"self.row", v14 object file lineNumber description];
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
    [v12 handleFailureInMethod:a2, self, @"PXGenerativeStoryFeatureEligibilityRow.m", 133, @"%@ should be an instance inheriting from %@, but it is %@", @"self.row", v14, v16 object file lineNumber description];

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
    [v12 handleFailureInMethod:a2, self, @"PXGenerativeStoryFeatureEligibilityRow.m", 123, @"%@ should be an instance inheriting from %@, but it is nil", @"self.row", v14 object file lineNumber description];
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
    [v12 handleFailureInMethod:a2, self, @"PXGenerativeStoryFeatureEligibilityRow.m", 123, @"%@ should be an instance inheriting from %@, but it is %@", @"self.row", v14, v16 object file lineNumber description];

    goto LABEL_12;
  }
LABEL_5:
  v10 = [v7 settings];
  v11 = [v7 titleKeyPath];
  [v10 setValue:v17 forKeyPath:v11];

LABEL_6:
LABEL_7:
}

- (void)_handleResultsWithTitle:(id)a3 image:(id)a4
{
  id v6 = a4;
  [(_PXGenerativeStoryFeatureEligibilityRowCell *)self setBriefTitle:a3];
  [(_PXGenerativeStoryFeatureEligibilityRowCell *)self setBriefImage:v6];
}

- (void)updateDisplayedContent
{
  v15.receiver = self;
  v15.super_class = (Class)_PXGenerativeStoryFeatureEligibilityRowCell;
  [(PTUIRowTableViewCell *)&v15 updateDisplayedContent];
  if (!self->_hasRequestedMCAvailability)
  {
    self->_hasRequestedMCAvailability = 1;
    objc_initWeak(&location, self);
    v4 = [(PTUIRowTableViewCell *)self row];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        v5 = [v4 photoLibrary];

        id v6 = (void *)[objc_alloc(MEMORY[0x1E4F39230]) initWithPhotoLibrary:v5];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __69___PXGenerativeStoryFeatureEligibilityRowCell_updateDisplayedContent__block_invoke;
        v12[3] = &unk_1E5DB1B58;
        objc_copyWeak(&v13, &location);
        +[PXGenerativeStoryFeatureEligibilityDataSource generateFeatureEligibilityStateUsingProcessingAvailabilityReporter:v6 photoLibrary:v5 completionHandler:v12];
        objc_destroyWeak(&v13);

        objc_destroyWeak(&location);
        return;
      }
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = (objc_class *)objc_opt_class();
      char v9 = NSStringFromClass(v10);
      v11 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v7 handleFailureInMethod:a2, self, @"PXGenerativeStoryFeatureEligibilityRow.m", 101, @"%@ should be an instance inheriting from %@, but it is %@", @"self.row", v9, v11 object file lineNumber description];
    }
    else
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = (objc_class *)objc_opt_class();
      char v9 = NSStringFromClass(v8);
      [v7 handleFailureInMethod:a2, self, @"PXGenerativeStoryFeatureEligibilityRow.m", 101, @"%@ should be an instance inheriting from %@, but it is nil", @"self.row", v9 object file lineNumber description];
    }

    goto LABEL_4;
  }
}

@end