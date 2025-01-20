@interface PBFGenericComplicationLookupInfo
+ (id)complicationLookupForWidgetFamily:(id)a3 extensionBundleIdentifier:(id)a4 containingBundleIdentifier:(id)a5 kind:(id)a6 intent:(id)a7 suggestedComplication:(id)a8;
- (BOOL)isEqual:(id)a3;
- (INIntent)complicationIntent;
- (NSNumber)complicationWidgetFamily;
- (NSString)complicationContainingBundleIdentifier;
- (NSString)complicationExtensionBundleIdentifier;
- (NSString)complicationWidgetKind;
- (PRSPosterGallerySuggestedComplication)suggestedComplication;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation PBFGenericComplicationLookupInfo

+ (id)complicationLookupForWidgetFamily:(id)a3 extensionBundleIdentifier:(id)a4 containingBundleIdentifier:(id)a5 kind:(id)a6 intent:(id)a7 suggestedComplication:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v19 = (INIntent *)a7;
  id v20 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"PBFPosterPreview.m", 103, @"Invalid parameter not satisfying: %@", @"widgetFamily" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
LABEL_10:
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2, a1, @"PBFPosterPreview.m", 105, @"Invalid parameter not satisfying: %@", @"complicationContainingBundleIdentifier" object file lineNumber description];

      if (v18) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, a1, @"PBFPosterPreview.m", 104, @"Invalid parameter not satisfying: %@", @"complicationExtensionBundleIdentifier" object file lineNumber description];

  if (!v17) {
    goto LABEL_10;
  }
LABEL_4:
  if (v18) {
    goto LABEL_5;
  }
LABEL_11:
  v38 = [MEMORY[0x1E4F28B00] currentHandler];
  [v38 handleFailureInMethod:a2, a1, @"PBFPosterPreview.m", 106, @"Invalid parameter not satisfying: %@", @"complicationWidgetKind" object file lineNumber description];

LABEL_5:
  v21 = objc_alloc_init(PBFGenericComplicationLookupInfo);
  uint64_t v22 = [v15 copy];
  complicationWidgetFamily = v21->_complicationWidgetFamily;
  v21->_complicationWidgetFamily = (NSNumber *)v22;

  uint64_t v24 = [v16 copy];
  complicationExtensionBundleIdentifier = v21->_complicationExtensionBundleIdentifier;
  v21->_complicationExtensionBundleIdentifier = (NSString *)v24;

  uint64_t v26 = [v17 copy];
  complicationContainingBundleIdentifier = v21->_complicationContainingBundleIdentifier;
  v21->_complicationContainingBundleIdentifier = (NSString *)v26;

  uint64_t v28 = [v18 copy];
  complicationWidgetKind = v21->_complicationWidgetKind;
  v21->_complicationWidgetKind = (NSString *)v28;

  complicationIntent = v21->_complicationIntent;
  v21->_complicationIntent = v19;
  v31 = v19;

  uint64_t v32 = [v20 copy];
  suggestedComplication = v21->_suggestedComplication;
  v21->_suggestedComplication = (PRSPosterGallerySuggestedComplication *)v32;

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PBFGenericComplicationLookupInfo);
  uint64_t v5 = [(NSNumber *)self->_complicationWidgetFamily copy];
  complicationWidgetFamily = v4->_complicationWidgetFamily;
  v4->_complicationWidgetFamily = (NSNumber *)v5;

  uint64_t v7 = [(NSString *)self->_complicationExtensionBundleIdentifier copy];
  complicationExtensionBundleIdentifier = v4->_complicationExtensionBundleIdentifier;
  v4->_complicationExtensionBundleIdentifier = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_complicationContainingBundleIdentifier copy];
  complicationContainingBundleIdentifier = v4->_complicationContainingBundleIdentifier;
  v4->_complicationContainingBundleIdentifier = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_complicationWidgetKind copy];
  complicationWidgetKind = v4->_complicationWidgetKind;
  v4->_complicationWidgetKind = (NSString *)v11;

  uint64_t v13 = [(PRSPosterGallerySuggestedComplication *)self->_suggestedComplication copy];
  suggestedComplication = v4->_suggestedComplication;
  v4->_suggestedComplication = (PRSPosterGallerySuggestedComplication *)v13;

  v4->_hash = self->_hash;
  return v4;
}

- (unint64_t)hash
{
  uint64_t hash = self->_hash;
  if (!hash)
  {
    v4 = objc_opt_new();
    id v5 = (id)[v4 appendObject:self->_complicationWidgetFamily];
    id v6 = (id)[v4 appendString:self->_complicationContainingBundleIdentifier];
    id v7 = (id)[v4 appendString:self->_complicationExtensionBundleIdentifier];
    id v8 = (id)[v4 appendString:self->_complicationWidgetKind];
    uint64_t hash = [v4 hash];
    self->_uint64_t hash = hash;
  }
  return hash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PBFGenericComplicationLookupInfo *)a3;
  id v5 = v4;
  if (v4 == self
    || (uint64_t v6 = [(PBFGenericComplicationLookupInfo *)v4 hash],
        v6 == [(PBFGenericComplicationLookupInfo *)self hash]))
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = v5;
      v10 = [(PBFGenericComplicationLookupInfo *)v9 complicationWidgetFamily];
      uint64_t v11 = [(PBFGenericComplicationLookupInfo *)self complicationWidgetFamily];
      int v12 = BSEqualObjects();

      if (!v12) {
        goto LABEL_11;
      }
      uint64_t v13 = [(PBFGenericComplicationLookupInfo *)v9 complicationContainingBundleIdentifier];
      v14 = [(PBFGenericComplicationLookupInfo *)self complicationContainingBundleIdentifier];
      int v15 = BSEqualObjects();

      if (!v15) {
        goto LABEL_11;
      }
      id v16 = [(PBFGenericComplicationLookupInfo *)v9 complicationExtensionBundleIdentifier];
      id v17 = [(PBFGenericComplicationLookupInfo *)self complicationExtensionBundleIdentifier];
      int v18 = BSEqualObjects();

      if (v18)
      {
        v19 = [(PBFGenericComplicationLookupInfo *)v9 complicationWidgetKind];
        id v20 = [(PBFGenericComplicationLookupInfo *)self complicationWidgetKind];
        char v7 = BSEqualObjects();
      }
      else
      {
LABEL_11:
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSNumber)complicationWidgetFamily
{
  return self->_complicationWidgetFamily;
}

- (NSString)complicationExtensionBundleIdentifier
{
  return self->_complicationExtensionBundleIdentifier;
}

- (NSString)complicationContainingBundleIdentifier
{
  return self->_complicationContainingBundleIdentifier;
}

- (NSString)complicationWidgetKind
{
  return self->_complicationWidgetKind;
}

- (INIntent)complicationIntent
{
  return self->_complicationIntent;
}

- (PRSPosterGallerySuggestedComplication)suggestedComplication
{
  return self->_suggestedComplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedComplication, 0);
  objc_storeStrong((id *)&self->_complicationIntent, 0);
  objc_storeStrong((id *)&self->_complicationWidgetKind, 0);
  objc_storeStrong((id *)&self->_complicationContainingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_complicationExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_complicationWidgetFamily, 0);
}

@end