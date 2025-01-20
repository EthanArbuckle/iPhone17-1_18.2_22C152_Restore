@interface PHShareParticipant(PXSharedLibraryPhotoKitParticipant)
- (PXSharedLibraryPhotoKitImageProvider)imageProvider;
- (id)person;
- (uint64_t)status;
@end

@implementation PHShareParticipant(PXSharedLibraryPhotoKitParticipant)

- (PXSharedLibraryPhotoKitImageProvider)imageProvider
{
  v1 = [[PXSharedLibraryPhotoKitImageProvider alloc] initWithParticipant:a1];
  return v1;
}

- (uint64_t)status
{
  if ([a1 exitState]) {
    return 3;
  }
  unsigned int v3 = [a1 acceptanceStatus] - 1;
  if (v3 > 2) {
    return 0;
  }
  else {
    return qword_1AB35B5D0[v3];
  }
}

- (id)person
{
  v2 = [a1 photoLibrary];
  unsigned int v3 = [v2 librarySpecificFetchOptions];

  v4 = [MEMORY[0x1E4F391F0] fetchPersonForShareParticipant:a1 options:v3];
  v5 = [v4 firstObject];

  return v5;
}

@end