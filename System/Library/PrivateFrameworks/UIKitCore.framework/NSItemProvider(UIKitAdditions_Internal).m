@interface NSItemProvider(UIKitAdditions_Internal)
- (void)_addFileURLRepresentationIfPossible;
@end

@implementation NSItemProvider(UIKitAdditions_Internal)

- (void)_addFileURLRepresentationIfPossible
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v2 = [a1 registeredTypeIdentifiers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationIfPossible__block_invoke;
  v11[3] = &unk_1E52FF3F8;
  v11[4] = &v12;
  [v2 enumerateObjectsUsingBlock:v11];

  if (!*((unsigned char *)v13 + 24))
  {
    v3 = [a1 registeredTypeIdentifiers];
    v4 = _UIFirstTypeIdentifierEligibleForMassStorage(v3);

    if (!v4)
    {
LABEL_10:

      goto LABEL_11;
    }
    v5 = [a1 _representationConformingToType:v4];
    if ([v5 preferredRepresentation] == 2)
    {
      uint64_t v6 = [v5 visibility];
      id v7 = v4;
      if (a1)
      {
        objc_initWeak(&location, a1);
        uint64_t v8 = *MEMORY[0x1E4F443B8];
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        v18 = __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke;
        v19 = &unk_1E52FF448;
        objc_copyWeak(&v21, &location);
        id v20 = v7;
        [a1 registerDataRepresentationForContentType:v8 visibility:v6 loadHandler:&v16];
LABEL_8:

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      uint64_t v9 = [v5 visibility];
      id v7 = v4;
      if (a1)
      {
        objc_initWeak(&location, a1);
        uint64_t v10 = *MEMORY[0x1E4F443B8];
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        v18 = __131__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationByCopyingAndCachingRepresentationWithTypeIdentifier_visibility___block_invoke;
        v19 = &unk_1E52FF448;
        objc_copyWeak(&v21, &location);
        id v20 = v7;
        [a1 registerDataRepresentationForContentType:v10 visibility:v9 loadHandler:&v16];
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_11:
  _Block_object_dispose(&v12, 8);
}

@end