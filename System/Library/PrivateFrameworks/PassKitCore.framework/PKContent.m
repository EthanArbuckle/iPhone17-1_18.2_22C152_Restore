@interface PKContent
+ (BOOL)supportsSecureCoding;
+ (id)createWithFileURL:(id)a3 dataTypeIdentifier:(id)a4;
- (NSArray)auxiliaryStoreIdentifiers;
- (NSArray)storeIdentifiers;
- (NSArray)systemAppBundleIdentifiers;
- (NSString)localizedDescription;
- (NSURL)appLaunchURL;
- (PKBarcode)barcode;
- (PKContent)initWithCoder:(id)a3;
- (PKContent)initWithDictionary:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setAppLaunchURL:(id)a3;
- (void)setAuxiliaryStoreIdentifiers:(id)a3;
- (void)setBarcode:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setStoreIdentifiers:(id)a3;
- (void)setSystemAppBundleIdentifiers:(id)a3;
@end

@implementation PKContent

- (NSArray)systemAppBundleIdentifiers
{
  return self->_systemAppBundleIdentifiers;
}

- (NSArray)storeIdentifiers
{
  return self->_storeIdentifiers;
}

- (PKBarcode)barcode
{
  return self->_barcode;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (PKContent)initWithDictionary:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PKContent;
  v12 = [(PKContent *)&v24 init];
  if (v12)
  {
    v13 = [v9 PKStringForKey:@"description"];
    v14 = PKLocalizedPassStringForPassBundle(v13, v10, v11);
    [(PKContent *)v12 setLocalizedDescription:v14];

    v15 = [v9 objectForKey:@"associatedStoreIdentifiers"];
    [(PKContent *)v12 setStoreIdentifiers:v15];

    v16 = [v9 objectForKey:@"associatedStoreIdentifiers"];
    [(PKContent *)v12 setStoreIdentifiers:v16];

    v17 = [v9 objectForKey:@"auxiliaryStoreIdentifiers"];
    [(PKContent *)v12 setAuxiliaryStoreIdentifiers:v17];

    v18 = [v9 objectForKey:@"systemAppBundleIdentifiers"];
    [(PKContent *)v12 setSystemAppBundleIdentifiers:v18];

    v19 = (void *)MEMORY[0x1E4F1CB10];
    v20 = [v9 PKStringForKey:@"appLaunchURL"];
    v21 = [v19 URLWithString:v20];
    [(PKContent *)v12 setAppLaunchURL:v21];

    v22 = [[PKBarcode alloc] initWithPassDictionary:v9 bundle:v10];
    [(PKContent *)v12 setBarcode:v22];
  }
  return v12;
}

- (void)setStoreIdentifiers:(id)a3
{
}

- (void)setBarcode:(id)a3
{
}

- (void)setSystemAppBundleIdentifiers:(id)a3
{
}

- (void)setLocalizedDescription:(id)a3
{
}

- (void)setAuxiliaryStoreIdentifiers:(id)a3
{
}

- (void)setAppLaunchURL:(id)a3
{
}

+ (id)createWithFileURL:(id)a3 dataTypeIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    PKDataTypeIdentifier(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = PKObjectDictionary(v5);
  v8 = [MEMORY[0x1E4F28B50] bundleWithURL:v5];
  id v9 = (void *)MEMORY[0x1E4F28B50];
  id v11 = PKPassPrivateDirectoryURLWithPassURL(v5, v10);
  v12 = [v9 bundleWithURL:v11];

  if (!v7 || !v8)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_22:
        v16 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      v18 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138543362;
        id v22 = v5;
        _os_log_error_impl(&dword_190E10000, v18, OS_LOG_TYPE_ERROR, "Failed to load object dictionary from %{public}@", (uint8_t *)&v21, 0xCu);
      }

      if (v8) {
        goto LABEL_22;
      }
    }
    v17 = PKLogFacilityTypeGetObject(0);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_21:

      goto LABEL_22;
    }
    int v21 = 138543362;
    id v22 = v5;
    v19 = "Failed to load bundle from %{public}@";
LABEL_25:
    _os_log_error_impl(&dword_190E10000, v17, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 0xCu);
    goto LABEL_21;
  }
  if (![v6 isEqual:@"com.apple.pkpass"])
  {
    v17 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543618;
      id v22 = v6;
      __int16 v23 = 2114;
      id v24 = v5;
      _os_log_error_impl(&dword_190E10000, v17, OS_LOG_TYPE_ERROR, "Unexpected data type identifier '%{public}@' from %{public}@", (uint8_t *)&v21, 0x16u);
    }

    goto LABEL_20;
  }
  v13 = [v7 PKStringForKey:@"passTypeIdentifier"];
  uint64_t v14 = PKPassTypeForPassTypeIdentifier(v13);
  v15 = (objc_class *)objc_opt_class();

  if (!v15)
  {
    v17 = PKLogFacilityTypeGetObject(0);
LABEL_20:
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    int v21 = 138543362;
    id v22 = v5;
    v19 = "Failed to instantiate content, content class unavailable for object at %{public}@";
    goto LABEL_25;
  }
  v16 = (void *)[[v15 alloc] initWithDictionary:v7 bundle:v8 privateBundle:v12 passType:v14 == 1];
LABEL_23:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_appLaunchURL, 0);
  objc_storeStrong((id *)&self->_systemAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_auxiliaryStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_storeIdentifiers, 0);
  objc_storeStrong((id *)&self->_barcode, 0);
}

- (PKContent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x192FDC630]();
  v26.receiver = self;
  v26.super_class = (Class)PKContent;
  id v6 = [(PKContent *)&v26 init];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"barcode"];
    barcode = v6->_barcode;
    v6->_barcode = (PKBarcode *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
    localizedDescription = v6->_localizedDescription;
    v6->_localizedDescription = (NSString *)v9;

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"storeIDs"];
    storeIdentifiers = v6->_storeIdentifiers;
    v6->_storeIdentifiers = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:v13 forKey:@"auxiliaryStoreIDs"];
    auxiliaryStoreIdentifiers = v6->_auxiliaryStoreIdentifiers;
    v6->_auxiliaryStoreIdentifiers = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"systemAppBundleIdentifiers"];
    systemAppBundleIdentifiers = v6->_systemAppBundleIdentifiers;
    v6->_systemAppBundleIdentifiers = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appLaunchURL"];
    appLaunchURL = v6->_appLaunchURL;
    v6->_appLaunchURL = (NSURL *)v23;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  barcode = self->_barcode;
  id v5 = a3;
  [v5 encodeObject:barcode forKey:@"barcode"];
  [v5 encodeObject:self->_storeIdentifiers forKey:@"storeIDs"];
  [v5 encodeObject:self->_auxiliaryStoreIdentifiers forKey:@"auxiliaryStoreIDs"];
  [v5 encodeObject:self->_systemAppBundleIdentifiers forKey:@"systemAppBundleIdentifiers"];
  [v5 encodeObject:self->_appLaunchURL forKey:@"appLaunchURL"];
  [v5 encodeObject:self->_localizedDescription forKey:@"description"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)auxiliaryStoreIdentifiers
{
  return self->_auxiliaryStoreIdentifiers;
}

- (NSURL)appLaunchURL
{
  return self->_appLaunchURL;
}

@end