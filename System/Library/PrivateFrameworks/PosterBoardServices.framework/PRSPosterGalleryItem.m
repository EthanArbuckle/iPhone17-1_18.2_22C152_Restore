@interface PRSPosterGalleryItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isBlankTemplate;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldShowAsShuffleStack;
- (BSColor)titleColor;
- (NSArray)complications;
- (NSArray)landscapeComplications;
- (NSNumber)modeSemanticType;
- (NSString)descriptiveTextLocalizationKey;
- (NSString)descriptorIdentifier;
- (NSString)displayNameLocalizationKey;
- (NSString)extensionBundleIdentifier;
- (NSString)identifier;
- (NSString)localizedDisplayName;
- (NSString)localizedSubtitle;
- (NSString)modeUUID;
- (NSString)spokenNameLocalizationKey;
- (NSString)titleFontName;
- (PRSPosterGalleryItem)initWithCoder:(id)a3;
- (PRSPosterGalleryItem)initWithIdentifier:(id)a3 descriptorIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 displayNameLocalizationKey:(id)a6 spokenNameLocalizationKey:(id)a7 descriptiveTextLocalizationKey:(id)a8 localizedDisplayName:(id)a9 localizedSubtitle:(id)a10 titleFontName:(id)a11 titleColor:(id)a12 subtitleComplication:(id)a13 layoutType:(int64_t)a14 modeSemanticType:(id)a15 modeUUID:(id)a16 complications:(id)a17 landscapeComplications:(id)a18 blankTemplate:(BOOL)a19 shouldShowAsShuffleStack:(BOOL)a20 source:(int64_t)a21;
- (PRSPosterGalleryItem)initWithProactiveRepresentation:(id)a3;
- (PRSPosterGallerySuggestedComplication)subtitleComplication;
- (id)copyWithZone:(_NSZone *)a3;
- (id)proactiveRepresentation;
- (int64_t)layoutType;
- (int64_t)source;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterGalleryItem

- (PRSPosterGalleryItem)initWithIdentifier:(id)a3 descriptorIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 displayNameLocalizationKey:(id)a6 spokenNameLocalizationKey:(id)a7 descriptiveTextLocalizationKey:(id)a8 localizedDisplayName:(id)a9 localizedSubtitle:(id)a10 titleFontName:(id)a11 titleColor:(id)a12 subtitleComplication:(id)a13 layoutType:(int64_t)a14 modeSemanticType:(id)a15 modeUUID:(id)a16 complications:(id)a17 landscapeComplications:(id)a18 blankTemplate:(BOOL)a19 shouldShowAsShuffleStack:(BOOL)a20 source:(int64_t)a21
{
  id v26 = a3;
  id v27 = a4;
  id v68 = a5;
  id v28 = a6;
  id v73 = a7;
  id v72 = a8;
  id v71 = a9;
  v29 = v27;
  id v70 = a10;
  v30 = v28;
  id v69 = a11;
  id v31 = a12;
  id v32 = a13;
  id v67 = a15;
  id v33 = a16;
  id v34 = a17;
  id v35 = a18;
  v74.receiver = self;
  v74.super_class = (Class)PRSPosterGalleryItem;
  v36 = [(PRSPosterGalleryItem *)&v74 init];
  if (v36)
  {
    uint64_t v37 = [v26 copy];
    identifier = v36->_identifier;
    v36->_identifier = (NSString *)v37;

    uint64_t v39 = [v29 copy];
    descriptorIdentifier = v36->_descriptorIdentifier;
    v36->_descriptorIdentifier = (NSString *)v39;

    uint64_t v41 = [v68 copy];
    extensionBundleIdentifier = v36->_extensionBundleIdentifier;
    v36->_extensionBundleIdentifier = (NSString *)v41;

    uint64_t v43 = [v30 copy];
    displayNameLocalizationKey = v36->_displayNameLocalizationKey;
    v36->_displayNameLocalizationKey = (NSString *)v43;

    uint64_t v45 = [v73 copy];
    spokenNameLocalizationKey = v36->_spokenNameLocalizationKey;
    v36->_spokenNameLocalizationKey = (NSString *)v45;

    uint64_t v47 = [v72 copy];
    descriptiveTextLocalizationKey = v36->_descriptiveTextLocalizationKey;
    v36->_descriptiveTextLocalizationKey = (NSString *)v47;

    uint64_t v49 = [v71 copy];
    localizedDisplayName = v36->_localizedDisplayName;
    v36->_localizedDisplayName = (NSString *)v49;

    uint64_t v51 = [v70 copy];
    localizedSubtitle = v36->_localizedSubtitle;
    v36->_localizedSubtitle = (NSString *)v51;

    uint64_t v53 = [v69 copy];
    titleFontName = v36->_titleFontName;
    v36->_titleFontName = (NSString *)v53;

    uint64_t v55 = [v31 copy];
    titleColor = v36->_titleColor;
    v36->_titleColor = (BSColor *)v55;

    uint64_t v57 = [v32 copy];
    subtitleComplication = v36->_subtitleComplication;
    v36->_subtitleComplication = (PRSPosterGallerySuggestedComplication *)v57;

    v36->_layoutType = a14;
    objc_storeStrong((id *)&v36->_modeSemanticType, a15);
    uint64_t v59 = [v33 copy];
    modeUUID = v36->_modeUUID;
    v36->_modeUUID = (NSString *)v59;

    uint64_t v61 = [v34 copy];
    complications = v36->_complications;
    v36->_complications = (NSArray *)v61;

    uint64_t v63 = [v35 copy];
    landscapeComplications = v36->_landscapeComplications;
    v36->_landscapeComplications = (NSArray *)v63;

    v36->_blankTemplate = a19;
    v36->_shouldShowAsShuffleStack = a20;
    v36->_source = a21;
  }

  return v36;
}

- (PRSPosterGalleryItem)initWithProactiveRepresentation:(id)a3
{
  id v3 = a3;
  v4 = [v3 complications];
  id v31 = objc_msgSend(v4, "bs_map:", &__block_literal_global_10);

  v5 = [v3 landscapeComplications];
  v30 = objc_msgSend(v5, "bs_map:", &__block_literal_global_6_1);

  v29 = [v3 identifier];
  id v27 = [v3 descriptorIdentifier];
  id v26 = [v3 extensionBundleIdentifier];
  v25 = [v3 displayNameLocalizationKey];
  v24 = [v3 spokenNameLocalizationKey];
  v21 = [v3 descriptiveTextLocalizationKey];
  id v28 = [v3 localizedDisplayName];
  v6 = [v3 localizedSubtitle];
  v7 = [v3 titleFontName];
  v8 = [v3 titleColor];
  v20 = [v3 subtitleComplication];
  v9 = [v20 posterBoardRepresentation];
  uint64_t v10 = [v3 layoutType];
  if ((unint64_t)(v10 - 1) >= 4) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  v12 = [v3 modeSemanticType];
  v13 = [v3 modeUUID];
  char v14 = [v3 isBlankTemplate];
  char v15 = [v3 shouldShowAsShuffleStack];
  uint64_t v16 = [v3 source];
  if ((unint64_t)(v16 - 1) >= 6) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v16;
  }
  BYTE1(v19) = v15;
  LOBYTE(v19) = v14;
  v23 = -[PRSPosterGalleryItem initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:](self, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:", v29, v27, v26, v25, v24, v21, v28, v6, v7, v8, v9, v11, v12, v13,
          v31,
          v30,
          v19,
          v17);

  return v23;
}

uint64_t __56__PRSPosterGalleryItem_initWithProactiveRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 posterBoardRepresentation];
}

uint64_t __56__PRSPosterGalleryItem_initWithProactiveRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 posterBoardRepresentation];
}

- (id)proactiveRepresentation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4B030]) initWithPosterBoardRepresentation:self];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOWORD(v6) = *(_WORD *)&self->_blankTemplate;
  return (id)objc_msgSend(v4, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:", self->_identifier, self->_descriptorIdentifier, self->_extensionBundleIdentifier, self->_displayNameLocalizationKey, self->_spokenNameLocalizationKey, self->_descriptiveTextLocalizationKey, self->_localizedDisplayName, self->_localizedSubtitle, self->_titleFontName, self->_titleColor, self->_subtitleComplication, self->_layoutType, self->_modeSemanticType, self->_modeUUID,
               self->_complications,
               self->_landscapeComplications,
               v6,
               self->_source);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRSPosterGalleryItem *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F4F738] builder];
      identifier = self->_identifier;
      v104[0] = MEMORY[0x1E4F143A8];
      v104[1] = 3221225472;
      v104[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke;
      v104[3] = &unk_1E5D00878;
      v12 = v9;
      v105 = v12;
      id v13 = (id)[v10 appendObject:identifier counterpart:v104];
      descriptorIdentifier = self->_descriptorIdentifier;
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_2;
      v102[3] = &unk_1E5D00878;
      char v15 = v12;
      v103 = v15;
      id v16 = (id)[v10 appendObject:descriptorIdentifier counterpart:v102];
      extensionBundleIdentifier = self->_extensionBundleIdentifier;
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_3;
      v100[3] = &unk_1E5D00878;
      v18 = v15;
      v101 = v18;
      id v19 = (id)[v10 appendObject:extensionBundleIdentifier counterpart:v100];
      displayNameLocalizationKey = self->_displayNameLocalizationKey;
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_4;
      v98[3] = &unk_1E5D00878;
      v21 = v18;
      v99 = v21;
      id v22 = (id)[v10 appendObject:displayNameLocalizationKey counterpart:v98];
      spokenNameLocalizationKey = self->_spokenNameLocalizationKey;
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_5;
      v96[3] = &unk_1E5D00878;
      v24 = v21;
      v97 = v24;
      id v25 = (id)[v10 appendObject:spokenNameLocalizationKey counterpart:v96];
      descriptiveTextLocalizationKey = self->_descriptiveTextLocalizationKey;
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_6;
      v94[3] = &unk_1E5D00878;
      id v27 = v24;
      id v95 = v27;
      id v28 = (id)[v10 appendObject:descriptiveTextLocalizationKey counterpart:v94];
      localizedDisplayName = self->_localizedDisplayName;
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_7;
      v92[3] = &unk_1E5D00878;
      id v30 = v27;
      id v93 = v30;
      id v31 = (id)[v10 appendObject:localizedDisplayName counterpart:v92];
      localizedSubtitle = self->_localizedSubtitle;
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_8;
      v90[3] = &unk_1E5D00878;
      id v33 = v30;
      id v91 = v33;
      id v34 = (id)[v10 appendObject:localizedSubtitle counterpart:v90];
      titleFontName = self->_titleFontName;
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_9;
      v88[3] = &unk_1E5D00878;
      id v36 = v33;
      id v89 = v36;
      id v37 = (id)[v10 appendObject:titleFontName counterpart:v88];
      titleColor = self->_titleColor;
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_10;
      v86[3] = &unk_1E5D00878;
      id v39 = v36;
      id v87 = v39;
      id v40 = (id)[v10 appendObject:titleColor counterpart:v86];
      subtitleComplication = self->_subtitleComplication;
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_11;
      v84[3] = &unk_1E5D00878;
      id v42 = v39;
      id v85 = v42;
      id v43 = (id)[v10 appendObject:subtitleComplication counterpart:v84];
      int64_t layoutType = self->_layoutType;
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_12;
      v82[3] = &unk_1E5D008C8;
      id v45 = v42;
      id v83 = v45;
      id v46 = (id)[v10 appendInteger:layoutType counterpart:v82];
      modeSemanticType = self->_modeSemanticType;
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_13;
      v80[3] = &unk_1E5D00878;
      id v48 = v45;
      id v81 = v48;
      id v49 = (id)[v10 appendObject:modeSemanticType counterpart:v80];
      modeUUID = self->_modeUUID;
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_14;
      v78[3] = &unk_1E5D00878;
      id v51 = v48;
      id v79 = v51;
      id v52 = (id)[v10 appendObject:modeUUID counterpart:v78];
      complications = self->_complications;
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_15;
      v76[3] = &unk_1E5D00878;
      id v54 = v51;
      id v77 = v54;
      id v55 = (id)[v10 appendObject:complications counterpart:v76];
      landscapeComplications = self->_landscapeComplications;
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_16;
      v74[3] = &unk_1E5D00878;
      id v57 = v54;
      id v75 = v57;
      id v58 = (id)[v10 appendObject:landscapeComplications counterpart:v74];
      BOOL blankTemplate = self->_blankTemplate;
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_17;
      v72[3] = &unk_1E5D008A0;
      id v60 = v57;
      id v73 = v60;
      id v61 = (id)[v10 appendBool:blankTemplate counterpart:v72];
      BOOL shouldShowAsShuffleStack = self->_shouldShowAsShuffleStack;
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_18;
      v70[3] = &unk_1E5D008A0;
      id v63 = v60;
      id v71 = v63;
      id v64 = (id)[v10 appendBool:shouldShowAsShuffleStack counterpart:v70];
      int64_t source = self->_source;
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_19;
      v68[3] = &unk_1E5D008C8;
      id v69 = v63;
      id v66 = (id)[v10 appendInteger:source counterpart:v68];
      char v8 = [v10 isEqual];
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 56);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 64);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 72);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_9(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 80);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_10(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 88);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_11(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 96);
}

uint64_t __32__PRSPosterGalleryItem_isEqual___block_invoke_12(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 120);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_13(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 128);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_14(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 136);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_15(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 104);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_16(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 112);
}

uint64_t __32__PRSPosterGalleryItem_isEqual___block_invoke_17(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

uint64_t __32__PRSPosterGalleryItem_isEqual___block_invoke_18(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 9);
}

uint64_t __32__PRSPosterGalleryItem_isEqual___block_invoke_19(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 144);
}

- (unint64_t)hash
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_identifier];
  id v5 = (id)[v3 appendObject:self->_descriptorIdentifier];
  id v6 = (id)[v3 appendObject:self->_extensionBundleIdentifier];
  id v7 = (id)[v3 appendObject:self->_displayNameLocalizationKey];
  id v8 = (id)[v3 appendObject:self->_spokenNameLocalizationKey];
  id v9 = (id)[v3 appendObject:self->_descriptiveTextLocalizationKey];
  id v10 = (id)[v3 appendObject:self->_localizedDisplayName];
  id v11 = (id)[v3 appendObject:self->_localizedSubtitle];
  id v12 = (id)[v3 appendObject:self->_titleFontName];
  id v13 = (id)[v3 appendObject:self->_titleColor];
  id v14 = (id)[v3 appendObject:self->_subtitleComplication];
  id v15 = (id)[v3 appendInteger:self->_layoutType];
  id v16 = (id)[v3 appendObject:self->_modeSemanticType];
  id v17 = (id)[v3 appendObject:self->_modeUUID];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v18 = self->_complications;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v40;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = (id)[v3 appendObject:*(void *)(*((void *)&v39 + 1) + 8 * v22++)];
      }
      while (v20 != v22);
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v20);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v24 = self->_landscapeComplications;
  uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v36;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = (id)objc_msgSend(v3, "appendObject:", *(void *)(*((void *)&v35 + 1) + 8 * v28++), (void)v35);
      }
      while (v26 != v28);
      uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v26);
  }

  id v30 = (id)[v3 appendBool:self->_blankTemplate];
  id v31 = (id)[v3 appendBool:self->_shouldShowAsShuffleStack];
  id v32 = (id)[v3 appendInteger:self->_source];
  unint64_t v33 = [v3 hash];

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGalleryItem)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = NSStringFromSelector(sel_identifier);
  id v60 = [v3 decodeObjectOfClass:v4 forKey:v5];

  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(sel_descriptorIdentifier);
  uint64_t v59 = [v3 decodeObjectOfClass:v6 forKey:v7];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_extensionBundleIdentifier);
  id v58 = [v3 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v10 = objc_opt_class();
  id v11 = NSStringFromSelector(sel_displayNameLocalizationKey);
  id v55 = [v3 decodeObjectOfClass:v10 forKey:v11];

  uint64_t v12 = objc_opt_class();
  id v13 = NSStringFromSelector(sel_spokenNameLocalizationKey);
  id v54 = [v3 decodeObjectOfClass:v12 forKey:v13];

  uint64_t v14 = objc_opt_class();
  id v15 = NSStringFromSelector(sel_descriptiveTextLocalizationKey);
  uint64_t v53 = [v3 decodeObjectOfClass:v14 forKey:v15];

  uint64_t v16 = objc_opt_class();
  id v17 = NSStringFromSelector(sel_localizedDisplayName);
  id v52 = [v3 decodeObjectOfClass:v16 forKey:v17];

  uint64_t v18 = objc_opt_class();
  uint64_t v19 = NSStringFromSelector(sel_localizedSubtitle);
  id v51 = [v3 decodeObjectOfClass:v18 forKey:v19];

  uint64_t v20 = objc_opt_class();
  uint64_t v21 = NSStringFromSelector(sel_titleFontName);
  v50 = [v3 decodeObjectOfClass:v20 forKey:v21];

  uint64_t v22 = objc_opt_class();
  id v23 = NSStringFromSelector(sel_titleColor);
  id v49 = [v3 decodeObjectOfClass:v22 forKey:v23];

  uint64_t v24 = objc_opt_class();
  uint64_t v25 = NSStringFromSelector(sel_subtitleComplication);
  uint64_t v26 = [v3 decodeObjectOfClass:v24 forKey:v25];

  uint64_t v27 = NSStringFromSelector(sel_layoutType);
  uint64_t v48 = [v3 decodeIntegerForKey:v27];

  uint64_t v28 = objc_opt_class();
  id v29 = NSStringFromSelector(sel_modeSemanticType);
  uint64_t v47 = [v3 decodeObjectOfClass:v28 forKey:v29];

  uint64_t v30 = objc_opt_class();
  id v31 = NSStringFromSelector(sel_modeUUID);
  id v46 = [v3 decodeObjectOfClass:v30 forKey:v31];

  uint64_t v32 = objc_opt_class();
  unint64_t v33 = NSStringFromSelector(sel_complications);
  id v34 = [v3 decodeArrayOfObjectsOfClass:v32 forKey:v33];

  uint64_t v35 = objc_opt_class();
  long long v36 = NSStringFromSelector(sel_landscapeComplications);
  long long v37 = [v3 decodeArrayOfObjectsOfClass:v35 forKey:v36];

  long long v38 = NSStringFromSelector(sel_isBlankTemplate);
  char v39 = [v3 decodeBoolForKey:v38];

  long long v40 = NSStringFromSelector(sel_shouldShowAsShuffleStack);
  char v41 = [v3 decodeBoolForKey:v40];

  long long v42 = NSStringFromSelector(sel_source);
  uint64_t v43 = [v3 decodeIntegerForKey:v42];

  BYTE1(v45) = v41;
  LOBYTE(v45) = v39;
  id v57 = -[PRSPosterGalleryItem initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:](self, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:", v60, v59, v58, v55, v54, v53, v52, v51, v50, v49, v26, v48, v47, v46,
          v34,
          v37,
          v45,
          v43);

  return v57;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_identifier);
  [v5 encodeObject:identifier forKey:v6];

  descriptorIdentifier = self->_descriptorIdentifier;
  uint64_t v8 = NSStringFromSelector(sel_descriptorIdentifier);
  [v5 encodeObject:descriptorIdentifier forKey:v8];

  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  uint64_t v10 = NSStringFromSelector(sel_extensionBundleIdentifier);
  [v5 encodeObject:extensionBundleIdentifier forKey:v10];

  displayNameLocalizationKey = self->_displayNameLocalizationKey;
  uint64_t v12 = NSStringFromSelector(sel_displayNameLocalizationKey);
  [v5 encodeObject:displayNameLocalizationKey forKey:v12];

  spokenNameLocalizationKey = self->_spokenNameLocalizationKey;
  uint64_t v14 = NSStringFromSelector(sel_spokenNameLocalizationKey);
  [v5 encodeObject:spokenNameLocalizationKey forKey:v14];

  descriptiveTextLocalizationKey = self->_descriptiveTextLocalizationKey;
  uint64_t v16 = NSStringFromSelector(sel_descriptiveTextLocalizationKey);
  [v5 encodeObject:descriptiveTextLocalizationKey forKey:v16];

  localizedDisplayName = self->_localizedDisplayName;
  uint64_t v18 = NSStringFromSelector(sel_localizedDisplayName);
  [v5 encodeObject:localizedDisplayName forKey:v18];

  localizedSubtitle = self->_localizedSubtitle;
  uint64_t v20 = NSStringFromSelector(sel_localizedSubtitle);
  [v5 encodeObject:localizedSubtitle forKey:v20];

  titleFontName = self->_titleFontName;
  uint64_t v22 = NSStringFromSelector(sel_titleFontName);
  [v5 encodeObject:titleFontName forKey:v22];

  titleColor = self->_titleColor;
  uint64_t v24 = NSStringFromSelector(sel_titleColor);
  [v5 encodeObject:titleColor forKey:v24];

  subtitleComplication = self->_subtitleComplication;
  uint64_t v26 = NSStringFromSelector(sel_subtitleComplication);
  [v5 encodeObject:subtitleComplication forKey:v26];

  int64_t layoutType = self->_layoutType;
  uint64_t v28 = NSStringFromSelector(sel_layoutType);
  [v5 encodeInteger:layoutType forKey:v28];

  modeSemanticType = self->_modeSemanticType;
  uint64_t v30 = NSStringFromSelector(sel_modeSemanticType);
  [v5 encodeObject:modeSemanticType forKey:v30];

  modeUUID = self->_modeUUID;
  uint64_t v32 = NSStringFromSelector(sel_modeUUID);
  [v5 encodeObject:modeUUID forKey:v32];

  complications = self->_complications;
  id v34 = NSStringFromSelector(sel_complications);
  [v5 encodeObject:complications forKey:v34];

  landscapeComplications = self->_landscapeComplications;
  long long v36 = NSStringFromSelector(sel_landscapeComplications);
  [v5 encodeObject:landscapeComplications forKey:v36];

  BOOL blankTemplate = self->_blankTemplate;
  long long v38 = NSStringFromSelector(sel_isBlankTemplate);
  [v5 encodeBool:blankTemplate forKey:v38];

  BOOL shouldShowAsShuffleStack = self->_shouldShowAsShuffleStack;
  long long v40 = NSStringFromSelector(sel_shouldShowAsShuffleStack);
  [v5 encodeBool:shouldShowAsShuffleStack forKey:v40];

  int64_t source = self->_source;
  NSStringFromSelector(sel_source);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:source forKey:v42];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)descriptorIdentifier
{
  return self->_descriptorIdentifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (NSString)spokenNameLocalizationKey
{
  return self->_spokenNameLocalizationKey;
}

- (NSString)descriptiveTextLocalizationKey
{
  return self->_descriptiveTextLocalizationKey;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)titleFontName
{
  return self->_titleFontName;
}

- (BSColor)titleColor
{
  return self->_titleColor;
}

- (PRSPosterGallerySuggestedComplication)subtitleComplication
{
  return self->_subtitleComplication;
}

- (NSArray)complications
{
  return self->_complications;
}

- (NSArray)landscapeComplications
{
  return self->_landscapeComplications;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (NSNumber)modeSemanticType
{
  return self->_modeSemanticType;
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (BOOL)isBlankTemplate
{
  return self->_blankTemplate;
}

- (BOOL)shouldShowAsShuffleStack
{
  return self->_shouldShowAsShuffleStack;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeUUID, 0);
  objc_storeStrong((id *)&self->_modeSemanticType, 0);
  objc_storeStrong((id *)&self->_landscapeComplications, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_subtitleComplication, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_descriptiveTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_spokenNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end