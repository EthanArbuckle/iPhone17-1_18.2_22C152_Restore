@interface ATXPosterDescriptorGalleryOptions(PRSAdditions)
- (PRSPosterGalleryItemOptions)posterBoardRepresentation;
- (id)initWithPosterBoardRepresentation:()PRSAdditions;
@end

@implementation ATXPosterDescriptorGalleryOptions(PRSAdditions)

- (id)initWithPosterBoardRepresentation:()PRSAdditions
{
  id v4 = a3;
  v22.receiver = a1;
  v22.super_class = (Class)&off_1EFDA05C0;
  id v5 = objc_msgSendSuper2(&v22, sel_init);
  if (v5)
  {
    v6 = [v4 modularComplications];
    v7 = objc_msgSend(v6, "bs_map:", &__block_literal_global_2);
    [v5 setModularComplications:v7];

    v8 = [v4 modularLandscapeComplications];
    v9 = objc_msgSend(v8, "bs_map:", &__block_literal_global_6);
    [v5 setModularLandscapeComplications:v9];

    v10 = [v4 inlineComplication];
    v11 = [v10 proactiveRepresentation];
    [v5 setInlineComplication:v11];

    objc_msgSend(v5, "setAllowsSystemSuggestedComplications:", objc_msgSend(v4, "allowsSystemSuggestedComplications"));
    objc_msgSend(v5, "setAllowsSystemSuggestedComplicationsInLandscape:", objc_msgSend(v4, "allowsSystemSuggestedComplicationsInLandscape"));
    uint64_t v12 = [v4 featuredConfidenceLevel];
    if (v12 == 2) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = v12 == 1;
    }
    [v5 setFeaturedConfidenceLevel:v13];
    v14 = [v4 displayNameLocalizationKey];
    [v5 setDisplayNameLocalizationKey:v14];

    v15 = [v4 spokenNameLocalizationKey];
    [v5 setSpokenNameLocalizationKey:v15];

    v16 = [v4 descriptiveTextLocalizationKey];
    [v5 setDescriptiveTextLocalizationKey:v16];

    objc_msgSend(v5, "setHero:", objc_msgSend(v4, "isHero"));
    objc_msgSend(v5, "setShouldShowAsShuffleStack:", objc_msgSend(v4, "shouldShowAsShuffleStack"));
    uint64_t v17 = [v4 photoSubtype];
    if ((unint64_t)(v17 - 1) >= 8) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v17;
    }
    [v5 setPhotoSubtype:v18];
    uint64_t v19 = [v4 focus];
    if ((unint64_t)(v19 - 1) >= 9) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = v19;
    }
    [v5 setFocus:v20];
    objc_msgSend(v5, "setOnlyEligibleForMadeForFocusSection:", objc_msgSend(v4, "isOnlyEligibleForMadeForFocusSection"));
  }

  return v5;
}

- (PRSPosterGalleryItemOptions)posterBoardRepresentation
{
  v1 = [[PRSPosterGalleryItemOptions alloc] initWithProactiveRepresentation:a1];
  return v1;
}

@end