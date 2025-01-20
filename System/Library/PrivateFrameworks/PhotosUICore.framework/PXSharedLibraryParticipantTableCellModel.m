@interface PXSharedLibraryParticipantTableCellModel
+ (double)imageDiameter;
+ (double)imageInset;
+ (double)imageVerticalInset;
- (BOOL)ellipsisButtonAllowed;
- (BOOL)removeButtonVisible;
- (NSString)address;
- (NSString)name;
- (PXSharedLibraryParticipantTableCellModel)init;
- (UIImage)image;
- (int64_t)requestID;
- (void)configureForParticipant:(id)a3 displayScale:(double)a4 isRTL:(BOOL)a5;
- (void)setAddress:(id)a3;
- (void)setEllipsisButtonAllowed:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setName:(id)a3;
- (void)setRequestID:(int64_t)a3;
@end

@implementation PXSharedLibraryParticipantTableCellModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (BOOL)ellipsisButtonAllowed
{
  return self->_ellipsisButtonAllowed;
}

- (BOOL)removeButtonVisible
{
  return self->_removeButtonVisible;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (UIImage)image
{
  return self->_image;
}

- (void)configureForParticipant:(id)a3 displayScale:(double)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke;
  v18[3] = &unk_1E5DB8D28;
  v18[4] = self;
  v18[5] = &v19;
  int v9 = objc_msgSend(v8, "fetchImageForTargetSize:displayScale:isRTL:resultHandler:", v5, v18, 37.0, 37.0, a4);
  v20[3] = v9;
  v10 = [v8 name];
  v11 = [v8 appleIDAddress];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke_4;
  v14[3] = &unk_1E5DB8D50;
  v17 = &v19;
  id v12 = v10;
  id v15 = v12;
  id v13 = v11;
  id v16 = v13;
  [(PXSharedLibraryParticipantTableCellModel *)self performChanges:v14];

  _Block_object_dispose(&v19, 8);
}

void __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  px_dispatch_on_main_queue();
}

void __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setRequestID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v4 setName:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 32) isEqualToString:*(void *)(a1 + 40)]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  [v4 setAddress:v3];
  [v4 setEllipsisButtonAllowed:1];
}

void __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) requestID] == *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke_3;
    v3[3] = &unk_1E5DB8D00;
    id v2 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    [v2 performChanges:v3];
  }
}

uint64_t __87__PXSharedLibraryParticipantTableCellModel_configureForParticipant_displayScale_isRTL___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setImage:*(void *)(a1 + 32)];
}

- (void)setEllipsisButtonAllowed:(BOOL)a3
{
  if (self->_ellipsisButtonAllowed != a3)
  {
    self->_ellipsisButtonAllowed = a3;
    [(PXSharedLibraryParticipantTableCellModel *)self signalChange:16];
  }
}

- (void)setAddress:(id)a3
{
  id v8 = (NSString *)a3;
  id v4 = self->_address;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      address = self->_address;
      self->_address = v6;

      [(PXSharedLibraryParticipantTableCellModel *)self signalChange:8];
    }
  }
}

- (void)setName:(id)a3
{
  id v8 = (NSString *)a3;
  id v4 = self->_name;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      name = self->_name;
      self->_name = v6;

      [(PXSharedLibraryParticipantTableCellModel *)self signalChange:4];
    }
  }
}

- (void)setRequestID:(int64_t)a3
{
  if (self->_requestID != a3)
  {
    self->_requestID = a3;
    [(PXSharedLibraryParticipantTableCellModel *)self signalChange:2];
  }
}

- (void)setImage:(id)a3
{
  id v8 = (UIImage *)a3;
  id v4 = self->_image;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(UIImage *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (UIImage *)[(UIImage *)v8 copy];
      image = self->_image;
      self->_image = v6;

      [(PXSharedLibraryParticipantTableCellModel *)self signalChange:1];
    }
  }
}

- (PXSharedLibraryParticipantTableCellModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryParticipantTableCellModel;
  result = [(PXSharedLibraryParticipantTableCellModel *)&v3 init];
  if (result)
  {
    result->_removeButtonVisible = 0;
    result->_ellipsisButtonAllowed = 0;
  }
  return result;
}

+ (double)imageInset
{
  return 12.0;
}

+ (double)imageVerticalInset
{
  return 10.0;
}

+ (double)imageDiameter
{
  return 37.0;
}

@end