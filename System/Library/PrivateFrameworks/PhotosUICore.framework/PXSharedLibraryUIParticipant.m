@interface PXSharedLibraryUIParticipant
+ (int)_fetchImageForContact:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 resultHandler:(id)a7;
+ (int)_fetchImageForEmailAddress:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 resultHandler:(id)a7;
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (NSPersonNameComponents)nameComponents;
- (NSString)appleIDAddress;
- (NSString)description;
- (NSString)name;
- (PXSharedLibraryUIParticipant)initWithEmailAddress:(id)a3 contact:(id)a4;
- (PXSharedLibraryUIParticipant)initWithPhoneNumber:(id)a3 contact:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int)fetchImageForTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6;
- (unint64_t)addressKind;
- (unint64_t)hash;
- (void)px_requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6;
- (void)setAppleIDAddress:(id)a3;
@end

@implementation PXSharedLibraryUIParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_appleIDAddress, 0);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setAppleIDAddress:(id)a3
{
}

- (unint64_t)addressKind
{
  return self->_addressKind;
}

- (NSString)description
{
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryUIParticipant;
  v3 = [(PXSharedLibraryUIParticipant *)&v16 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = NSString;
  v6 = [(PXSharedLibraryUIParticipant *)self contact];
  v7 = [v5 stringWithFormat:@"contact: %@,\n", v6];
  [v4 appendString:v7];

  v8 = NSString;
  v9 = [(PXSharedLibraryUIParticipant *)self appleIDAddress];
  v10 = [v8 stringWithFormat:@"address: %@,\n", v9];
  [v4 appendString:v10];

  v11 = NSString;
  unint64_t v12 = [(PXSharedLibraryUIParticipant *)self addressKind];
  v13 = @"PXSharedLibraryUIParticipantAddressKindInvalid";
  if (v12 == 1) {
    v13 = @"PXSharedLibraryUIParticipantAddressKindEmail";
  }
  if (v12 == 2) {
    v13 = @"PXSharedLibraryUIParticipantAddressKindPhone";
  }
  v14 = [v11 stringWithFormat:@"addressKind: %@", v13];
  [v4 appendString:v14];

  return (NSString *)v4;
}

- (void)px_requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6
{
  BOOL v6 = a5;
  double height = a3.height;
  double width = a3.width;
  id v11 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__PXSharedLibraryUIParticipant_px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke;
  v13[3] = &unk_1E5DD24E8;
  id v14 = v11;
  id v12 = v11;
  -[PXSharedLibraryUIParticipant fetchImageForTargetSize:displayScale:isRTL:resultHandler:](self, "fetchImageForTargetSize:displayScale:isRTL:resultHandler:", v6, v13, width, height, a4);
}

uint64_t __95__PXSharedLibraryUIParticipant_px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PXSharedLibraryUIParticipant allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_contact, self->_contact);
  objc_storeStrong((id *)&v4->_appleIDAddress, self->_appleIDAddress);
  v4->_addressKind = self->_addressKind;
  return v4;
}

- (unint64_t)hash
{
  v2 = [(PXSharedLibraryUIParticipant *)self appleIDAddress];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(PXSharedLibraryUIParticipant *)self appleIDAddress];
    v7 = [v5 appleIDAddress];
    if (v6 == v7) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 isEqualToString:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (int)fetchImageForTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6
{
  BOOL v6 = a5;
  double height = a3.height;
  double width = a3.width;
  id v12 = a6;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXSharedLibraryUIParticipant.m", 104, @"Invalid parameter not satisfying: %@", @"!CGSizeEqualToSize(targetSize, CGSizeZero)" object file lineNumber description];
  }
  if (a4 < 1.0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXSharedLibraryUIParticipant.m", 105, @"Invalid parameter not satisfying: %@", @"displayScale >= 1" object file lineNumber description];
  }
  id v14 = [(PXSharedLibraryUIParticipant *)self contact];

  if (v14)
  {
    v15 = [(PXSharedLibraryUIParticipant *)self contact];
    int v16 = +[PXSharedLibraryUIParticipant _fetchImageForContact:targetSize:displayScale:isRTL:resultHandler:](PXSharedLibraryUIParticipant, "_fetchImageForContact:targetSize:displayScale:isRTL:resultHandler:", v15, v6, v12, width, height, a4);
  }
  else
  {
    v17 = [(PXSharedLibraryUIParticipant *)self appleIDAddress];

    if (!v17)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryUIParticipant.m" lineNumber:121 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v15 = [(PXSharedLibraryUIParticipant *)self appleIDAddress];
    int v16 = +[PXSharedLibraryUIParticipant _fetchImageForEmailAddress:targetSize:displayScale:isRTL:resultHandler:](PXSharedLibraryUIParticipant, "_fetchImageForEmailAddress:targetSize:displayScale:isRTL:resultHandler:", v15, v6, v12, width, height, a4);
  }
  int v18 = v16;

  return v18;
}

- (NSString)appleIDAddress
{
  appleIDAddress = self->_appleIDAddress;
  if (!appleIDAddress)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryUIParticipant.m" lineNumber:95 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return appleIDAddress;
}

- (NSPersonNameComponents)nameComponents
{
  v2 = [(PXSharedLibraryUIParticipant *)self contact];
  unint64_t v3 = [v2 givenName];
  id v4 = [v2 familyName];
  if ([v3 length] || objc_msgSend(v4, "length"))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    [v5 setGivenName:v3];
    [v5 setFamilyName:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (NSPersonNameComponents *)v5;
}

- (NSString)name
{
  id v4 = [(PXSharedLibraryUIParticipant *)self contact];
  id v5 = [v4 givenName];
  BOOL v6 = [v4 familyName];
  if ([v5 length] || objc_msgSend(v6, "length"))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    [v7 setGivenName:v5];
    [v7 setFamilyName:v6];
    char v8 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v7 style:0 options:0];
  }
  else
  {
    v10 = [(PXSharedLibraryUIParticipant *)self appleIDAddress];

    if (!v10)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryUIParticipant.m" lineNumber:69 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    char v8 = [(PXSharedLibraryUIParticipant *)self appleIDAddress];
  }

  return (NSString *)v8;
}

- (PXSharedLibraryUIParticipant)initWithPhoneNumber:(id)a3 contact:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryUIParticipant;
  v10 = [(PXSharedLibraryUIParticipant *)&v13 init];
  if (v10)
  {
    if (![v8 length])
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v10, @"PXSharedLibraryUIParticipant.m", 44, @"Invalid parameter not satisfying: %@", @"phoneNumber.length > 0" object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_appleIDAddress, a3);
    v10->_addressKind = 2;
    objc_storeStrong((id *)&v10->_contact, a4);
  }

  return v10;
}

- (PXSharedLibraryUIParticipant)initWithEmailAddress:(id)a3 contact:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryUIParticipant;
  v10 = [(PXSharedLibraryUIParticipant *)&v13 init];
  if (v10)
  {
    if (![v8 length])
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v10, @"PXSharedLibraryUIParticipant.m", 33, @"Invalid parameter not satisfying: %@", @"emailAddress.length > 0" object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_appleIDAddress, a3);
    v10->_addressKind = 1;
    objc_storeStrong((id *)&v10->_contact, a4);
  }

  return v10;
}

+ (int)_fetchImageForEmailAddress:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 resultHandler:(id)a7
{
  BOOL v8 = a6;
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a7;
  if (!v14)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PXSharedLibraryUIParticipant.m", 176, @"Invalid parameter not satisfying: %@", @"emailAddress" object file lineNumber description];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __103__PXSharedLibraryUIParticipant__fetchImageForEmailAddress_targetSize_displayScale_isRTL_resultHandler___block_invoke;
  v20[3] = &unk_1E5DD24C0;
  id v21 = v15;
  id v16 = v15;
  +[PXActivityUtilities requestMonogramForEmailAddress:targetSize:displayScale:isRTL:completion:](PXActivityUtilities, "requestMonogramForEmailAddress:targetSize:displayScale:isRTL:completion:", v14, v8, v20, width, height, a5);
  int v17 = +[PXPeopleFaceCropManager generateUniqueRequestID];

  return v17;
}

void __103__PXSharedLibraryUIParticipant__fetchImageForEmailAddress_targetSize_displayScale_isRTL_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      uint64_t v10 = *(void *)off_1E5DAAFC8;
      v11[0] = v6;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v9);
    }
    else
    {
      (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v5, MEMORY[0x1E4F1CC08]);
    }
  }
}

+ (int)_fetchImageForContact:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 resultHandler:(id)a7
{
  BOOL v8 = a6;
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a7;
  if (!v14)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PXSharedLibraryUIParticipant.m", 156, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __98__PXSharedLibraryUIParticipant__fetchImageForContact_targetSize_displayScale_isRTL_resultHandler___block_invoke;
  v20[3] = &unk_1E5DD24C0;
  id v21 = v15;
  id v16 = v15;
  +[PXActivityUtilities requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:](PXActivityUtilities, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v14, v8, 0, v20, width, height, a5);
  int v17 = +[PXPeopleFaceCropManager generateUniqueRequestID];

  return v17;
}

void __98__PXSharedLibraryUIParticipant__fetchImageForContact_targetSize_displayScale_isRTL_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      uint64_t v10 = *(void *)off_1E5DAAFC8;
      v11[0] = v6;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v9);
    }
    else
    {
      (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v5, MEMORY[0x1E4F1CC08]);
    }
  }
}

@end