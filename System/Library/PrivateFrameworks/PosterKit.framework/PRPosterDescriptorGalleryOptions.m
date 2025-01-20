@interface PRPosterDescriptorGalleryOptions
+ (BOOL)supportsSecureCoding;
+ (PRPosterDescriptorGalleryOptions)galleryOptionsWithAssetLookupInfo:(id)a3;
+ (PRPosterDescriptorGalleryOptions)galleryOptionsWithAssetLookupInfo:(id)a3 galleryPresentationStyle:(unint64_t)a4;
+ (PRPosterDescriptorGalleryOptions)galleryOptionsWithAssetLookupInfo:(id)a3 galleryPresentationStyle:(unint64_t)a4 galleryDisplayStyle:(unint64_t)a5;
+ (id)galleryOptionsFromDictionaryRepresentation:(id)a3;
- (PRPosterDescriptorGalleryAssetLookupInfo)galleryAssetLookupInfo;
- (PRPosterDescriptorGalleryOptions)initWithAssetLookupInfo:(id)a3 galleryPresentationStyle:(unint64_t)a4 galleryDisplayStyle:(unint64_t)a5;
- (PRPosterDescriptorGalleryOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)displayStyle;
- (unint64_t)presentationStyle;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterDescriptorGalleryOptions

+ (id)galleryOptionsFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"presentationStyle"];
  v5 = [v3 objectForKeyedSubscript:@"displayStyle"];

  uint64_t v6 = PRPosterGalleryPresentationStyleFromString(v4);
  uint64_t v7 = PRPosterGalleryDisplayStyleFromString(v5);
  v8 = [PRPosterDescriptorGalleryOptions alloc];
  v9 = +[PRPosterDescriptorGalleryAssetLookupInfo defaultLookupInfo];
  v10 = [(PRPosterDescriptorGalleryOptions *)v8 initWithAssetLookupInfo:v9 galleryPresentationStyle:v6 galleryDisplayStyle:v7];

  return v10;
}

+ (PRPosterDescriptorGalleryOptions)galleryOptionsWithAssetLookupInfo:(id)a3
{
  id v3 = a3;
  v4 = [PRPosterDescriptorGalleryOptions alloc];
  v5 = v4;
  if (v3)
  {
    uint64_t v6 = [(PRPosterDescriptorGalleryOptions *)v4 initWithAssetLookupInfo:v3 galleryPresentationStyle:0 galleryDisplayStyle:0];
  }
  else
  {
    uint64_t v7 = +[PRPosterDescriptorGalleryAssetLookupInfo defaultLookupInfo];
    uint64_t v6 = [(PRPosterDescriptorGalleryOptions *)v5 initWithAssetLookupInfo:v7 galleryPresentationStyle:0 galleryDisplayStyle:0];
  }
  return v6;
}

+ (PRPosterDescriptorGalleryOptions)galleryOptionsWithAssetLookupInfo:(id)a3 galleryPresentationStyle:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [PRPosterDescriptorGalleryOptions alloc];
  uint64_t v7 = v6;
  if (v5)
  {
    v8 = [(PRPosterDescriptorGalleryOptions *)v6 initWithAssetLookupInfo:v5 galleryPresentationStyle:a4 galleryDisplayStyle:0];
  }
  else
  {
    v9 = +[PRPosterDescriptorGalleryAssetLookupInfo defaultLookupInfo];
    v8 = [(PRPosterDescriptorGalleryOptions *)v7 initWithAssetLookupInfo:v9 galleryPresentationStyle:a4 galleryDisplayStyle:0];
  }
  return v8;
}

+ (PRPosterDescriptorGalleryOptions)galleryOptionsWithAssetLookupInfo:(id)a3 galleryPresentationStyle:(unint64_t)a4 galleryDisplayStyle:(unint64_t)a5
{
  id v7 = a3;
  v8 = [[PRPosterDescriptorGalleryOptions alloc] initWithAssetLookupInfo:v7 galleryPresentationStyle:a4 galleryDisplayStyle:a5];

  return v8;
}

- (PRPosterDescriptorGalleryOptions)initWithAssetLookupInfo:(id)a3 galleryPresentationStyle:(unint64_t)a4 galleryDisplayStyle:(unint64_t)a5
{
  id v8 = a3;
  NSClassFromString(&cfstr_Prposterdescri_4.isa);
  if (!v8)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:]();
    }
LABEL_15:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C24D118);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterDescriptorGalleryAssetLookupInfoClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C24D17CLL);
  }

  if (a4 >= 2)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"presentationStyle == PRPosterGalleryPresentationStyleDefault || presentationStyle == PRPosterGalleryPresentationStyleSlideUp"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:]();
    }
    goto LABEL_15;
  }
  v15.receiver = self;
  v15.super_class = (Class)PRPosterDescriptorGalleryOptions;
  v9 = [(PRPosterDescriptorGalleryOptions *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    galleryAssetLookupInfo = v9->_galleryAssetLookupInfo;
    v9->_galleryAssetLookupInfo = (PRPosterDescriptorGalleryAssetLookupInfo *)v10;

    v9->_presentationStyle = a4;
    v9->_displayStyle = a5;
  }

  return v9;
}

- (PRPosterDescriptorGalleryOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"galleryAssetLookupInfo"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"presentationStyle"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"displayStyle"];

  v9 = [(PRPosterDescriptorGalleryOptions *)self initWithAssetLookupInfo:v6 galleryPresentationStyle:v7 galleryDisplayStyle:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  galleryAssetLookupInfo = self->_galleryAssetLookupInfo;
  id v5 = a3;
  [v5 encodeObject:galleryAssetLookupInfo forKey:@"galleryAssetLookupInfo"];
  [v5 encodeInteger:self->_presentationStyle forKey:@"presentationStyle"];
  [v5 encodeInteger:self->_displayStyle forKey:@"displayStyle"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  galleryAssetLookupInfo = self->_galleryAssetLookupInfo;
  unint64_t presentationStyle = self->_presentationStyle;
  unint64_t displayStyle = self->_displayStyle;
  return (id)[v4 initWithAssetLookupInfo:galleryAssetLookupInfo galleryPresentationStyle:presentationStyle galleryDisplayStyle:displayStyle];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterDescriptorGalleryAssetLookupInfo)galleryAssetLookupInfo
{
  return self->_galleryAssetLookupInfo;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void).cxx_destruct
{
}

- (void)initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end