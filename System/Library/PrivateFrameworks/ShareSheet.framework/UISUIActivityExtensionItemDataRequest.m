@interface UISUIActivityExtensionItemDataRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestForActivity:(id)a3 activityType:(id)a4;
+ (id)requestForActivity:(id)a3 activityType:(id)a4 activitySpecificMetadata:(id)a5;
+ (id)requestForActivity:(id)a3 activityType:(id)a4 sourceAppIsManaged:(BOOL)a5;
- (BOOL)activitySupportsPromiseURLs;
- (BOOL)isAirDropActivity;
- (BOOL)sourceAppIsManaged;
- (BOOL)wantsAttachmentURLItemData;
- (BOOL)wantsThumbnailItemData;
- (CGSize)thumbnailSize;
- (Class)classForPreparingExtensionItemData;
- (NSDictionary)activitySpecificMetadata;
- (NSString)activityType;
- (NSString)extensionIdentifier;
- (NSUUID)activityUUID;
- (UISUIActivityExtensionItemDataRequest)initWithCoder:(id)a3;
- (id)_initWithClassForPreparingExtensionItemData:(Class)a3;
- (int64_t)activityCategory;
- (int64_t)maxPreviews;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityCategory:(int64_t)a3;
- (void)setActivitySpecificMetadata:(id)a3;
- (void)setActivitySupportsPromiseURLs:(BOOL)a3;
- (void)setActivityType:(id)a3;
- (void)setActivityUUID:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setIsAirDropActivity:(BOOL)a3;
- (void)setMaxPreviews:(int64_t)a3;
- (void)setSourceAppIsManaged:(BOOL)a3;
- (void)setThumbnailSize:(CGSize)a3;
- (void)setWantsAttachmentURLItemData:(BOOL)a3;
- (void)setWantsThumbnailItemData:(BOOL)a3;
@end

@implementation UISUIActivityExtensionItemDataRequest

+ (id)requestForActivity:(id)a3 activityType:(id)a4
{
  return (id)[a1 requestForActivity:a3 activityType:a4 activitySpecificMetadata:0];
}

+ (id)requestForActivity:(id)a3 activityType:(id)a4 sourceAppIsManaged:(BOOL)a5
{
  BOOL v5 = a5;
  v6 = [a1 requestForActivity:a3 activityType:a4];
  [v6 setSourceAppIsManaged:v5];
  return v6;
}

+ (id)requestForActivity:(id)a3 activityType:(id)a4 activitySpecificMetadata:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 activityType];
  uint64_t v12 = [v11 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

  v13 = objc_msgSend(objc_alloc((Class)a1), "_initWithClassForPreparingExtensionItemData:", objc_msgSend((id)objc_opt_class(), "classForPreparingExtensionItemData"));
  v14 = [v10 activityUUID];
  [v13 setActivityUUID:v14];

  objc_msgSend(v13, "setActivityCategory:", objc_msgSend((id)objc_opt_class(), "activityCategory"));
  v15 = [v10 applicationExtension];
  v16 = [v15 identifier];
  [v13 setExtensionIdentifier:v16];

  [v13 setIsAirDropActivity:v12];
  [v10 _thumbnailSize];
  objc_msgSend(v13, "setThumbnailSize:");
  objc_msgSend(v13, "setWantsThumbnailItemData:", objc_msgSend(v10, "_wantsThumbnailItemData"));
  objc_msgSend(v13, "setWantsAttachmentURLItemData:", objc_msgSend(v10, "_wantsAttachmentURLItemData"));
  objc_msgSend(v13, "setActivitySupportsPromiseURLs:", objc_msgSend(v10, "_activitySupportsPromiseURLs"));
  [v13 setActivityType:v9];

  [v13 setActivitySpecificMetadata:v8];
  uint64_t v17 = [v10 maxPreviews];

  [v13 setMaxPreviews:v17];
  return v13;
}

- (id)_initWithClassForPreparingExtensionItemData:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISUIActivityExtensionItemDataRequest;
  id result = [(UISUIActivityExtensionItemDataRequest *)&v5 init];
  if (result) {
    *((void *)result + 2) = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUIActivityExtensionItemDataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_classNameForPreparingExtensionItemData);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id v8 = [(UISUIActivityExtensionItemDataRequest *)self _initWithClassForPreparingExtensionItemData:NSClassFromString(v7)];
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    id v10 = NSStringFromSelector(sel_activityUUID);
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(UISUIActivityExtensionItemDataRequest *)v8 setActivityUUID:v11];

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector(sel_activityType);
    v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    [(UISUIActivityExtensionItemDataRequest *)v8 setActivityType:v14];

    v15 = NSStringFromSelector(sel_activityCategory);
    -[UISUIActivityExtensionItemDataRequest setActivityCategory:](v8, "setActivityCategory:", [v4 decodeIntegerForKey:v15]);

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = NSStringFromSelector(sel_extensionIdentifier);
    v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    [(UISUIActivityExtensionItemDataRequest *)v8 setExtensionIdentifier:v18];

    v19 = NSStringFromSelector(sel_isAirDropActivity);
    -[UISUIActivityExtensionItemDataRequest setIsAirDropActivity:](v8, "setIsAirDropActivity:", [v4 decodeBoolForKey:v19]);

    v20 = NSStringFromSelector(sel_thumbnailSize);
    [(UISUIActivityExtensionItemDataRequest *)v8 setThumbnailSize:_UISecureDecodeCGSizeWithKeyAndDefaultSize(v4, v20, *MEMORY[0x1E4F1DB30])];

    v21 = NSStringFromSelector(sel_wantsThumbnailItemData);
    -[UISUIActivityExtensionItemDataRequest setWantsThumbnailItemData:](v8, "setWantsThumbnailItemData:", [v4 decodeBoolForKey:v21]);

    v22 = NSStringFromSelector(sel_wantsAttachmentURLItemData);
    -[UISUIActivityExtensionItemDataRequest setWantsAttachmentURLItemData:](v8, "setWantsAttachmentURLItemData:", [v4 decodeBoolForKey:v22]);

    v23 = NSStringFromSelector(sel_activitySupportsPromiseURLs);
    -[UISUIActivityExtensionItemDataRequest setActivitySupportsPromiseURLs:](v8, "setActivitySupportsPromiseURLs:", [v4 decodeBoolForKey:v23]);

    v24 = _UISecureStandardPropertyListClasses();
    v25 = NSStringFromSelector(sel_activitySpecificMetadata);
    v26 = [v4 decodeObjectOfClasses:v24 forKey:v25];
    [(UISUIActivityExtensionItemDataRequest *)v8 setActivitySpecificMetadata:v26];

    v27 = NSStringFromSelector(sel_maxPreviews);
    -[UISUIActivityExtensionItemDataRequest setMaxPreviews:](v8, "setMaxPreviews:", [v4 decodeIntegerForKey:v27]);

    v28 = NSStringFromSelector(sel_sourceAppIsManaged);
    -[UISUIActivityExtensionItemDataRequest setSourceAppIsManaged:](v8, "setSourceAppIsManaged:", [v4 decodeBoolForKey:v28]);
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  NSStringFromClass([(UISUIActivityExtensionItemDataRequest *)self classForPreparingExtensionItemData]);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = NSStringFromSelector(sel_classNameForPreparingExtensionItemData);
  [v4 encodeObject:v33 forKey:v5];

  v6 = [(UISUIActivityExtensionItemDataRequest *)self activityType];
  v7 = NSStringFromSelector(sel_activityType);
  [v4 encodeObject:v6 forKey:v7];

  id v8 = [(UISUIActivityExtensionItemDataRequest *)self activityUUID];
  uint64_t v9 = NSStringFromSelector(sel_activityUUID);
  [v4 encodeObject:v8 forKey:v9];

  int64_t v10 = [(UISUIActivityExtensionItemDataRequest *)self activityCategory];
  v11 = NSStringFromSelector(sel_activityCategory);
  [v4 encodeInteger:v10 forKey:v11];

  uint64_t v12 = [(UISUIActivityExtensionItemDataRequest *)self extensionIdentifier];
  v13 = NSStringFromSelector(sel_isPhotoServiceAccessGranted);
  [v4 encodeObject:v12 forKey:v13];

  BOOL v14 = [(UISUIActivityExtensionItemDataRequest *)self isAirDropActivity];
  v15 = NSStringFromSelector(sel_isAirDropActivity);
  [v4 encodeBool:v14 forKey:v15];

  [(UISUIActivityExtensionItemDataRequest *)self thumbnailSize];
  double v17 = v16;
  double v19 = v18;
  v20 = NSStringFromSelector(sel_thumbnailSize);
  _UISecureEncodeCGSizeWithKey(v4, v20, v17, v19);

  BOOL v21 = [(UISUIActivityExtensionItemDataRequest *)self wantsThumbnailItemData];
  v22 = NSStringFromSelector(sel_wantsThumbnailItemData);
  [v4 encodeBool:v21 forKey:v22];

  BOOL v23 = [(UISUIActivityExtensionItemDataRequest *)self wantsAttachmentURLItemData];
  v24 = NSStringFromSelector(sel_wantsAttachmentURLItemData);
  [v4 encodeBool:v23 forKey:v24];

  BOOL v25 = [(UISUIActivityExtensionItemDataRequest *)self activitySupportsPromiseURLs];
  v26 = NSStringFromSelector(sel_activitySupportsPromiseURLs);
  [v4 encodeBool:v25 forKey:v26];

  v27 = [(UISUIActivityExtensionItemDataRequest *)self activitySpecificMetadata];
  v28 = NSStringFromSelector(sel_activitySpecificMetadata);
  [v4 encodeObject:v27 forKey:v28];

  int64_t v29 = [(UISUIActivityExtensionItemDataRequest *)self maxPreviews];
  v30 = NSStringFromSelector(sel_maxPreviews);
  [v4 encodeInteger:v29 forKey:v30];

  BOOL v31 = [(UISUIActivityExtensionItemDataRequest *)self sourceAppIsManaged];
  v32 = NSStringFromSelector(sel_sourceAppIsManaged);
  [v4 encodeBool:v31 forKey:v32];
}

- (Class)classForPreparingExtensionItemData
{
  return self->_classForPreparingExtensionItemData;
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (void)setActivityCategory:(int64_t)a3
{
  self->_activityCategory = a3;
}

- (BOOL)wantsThumbnailItemData
{
  return self->_wantsThumbnailItemData;
}

- (void)setWantsThumbnailItemData:(BOOL)a3
{
  self->_wantsThumbnailItemData = a3;
}

- (BOOL)wantsAttachmentURLItemData
{
  return self->_wantsAttachmentURLItemData;
}

- (void)setWantsAttachmentURLItemData:(BOOL)a3
{
  self->_wantsAttachmentURLItemData = a3;
}

- (int64_t)maxPreviews
{
  return self->_maxPreviews;
}

- (void)setMaxPreviews:(int64_t)a3
{
  self->_maxPreviews = a3;
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
  self->_extensionIdentifier = (NSString *)a3;
}

- (BOOL)isAirDropActivity
{
  return self->_isAirDropActivity;
}

- (void)setIsAirDropActivity:(BOOL)a3
{
  self->_isAirDropActivity = a3;
}

- (BOOL)activitySupportsPromiseURLs
{
  return self->_activitySupportsPromiseURLs;
}

- (void)setActivitySupportsPromiseURLs:(BOOL)a3
{
  self->_activitySupportsPromiseURLs = a3;
}

- (NSDictionary)activitySpecificMetadata
{
  return self->_activitySpecificMetadata;
}

- (void)setActivitySpecificMetadata:(id)a3
{
}

- (BOOL)sourceAppIsManaged
{
  return self->_sourceAppIsManaged;
}

- (void)setSourceAppIsManaged:(BOOL)a3
{
  self->_sourceAppIsManaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySpecificMetadata, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

@end