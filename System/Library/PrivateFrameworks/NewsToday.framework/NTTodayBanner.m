@interface NTTodayBanner
+ (BOOL)supportsSecureCoding;
- (NSArray)gradientBackgroundPair;
- (NSArray)solidBackgroundColorPair;
- (NSString)actionButtonText;
- (NSString)body;
- (NSString)identifier;
- (NSString)title;
- (NSURL)actionURL;
- (NSURL)imageURL;
- (NTTodayBanner)init;
- (NTTodayBanner)initWithCoder:(id)a3;
- (NTTodayBanner)initWithIdentifier:(id)a3 title:(id)a4 body:(id)a5 actionURL:(id)a6 actionButtonText:(id)a7 imageMethod:(unint64_t)a8 imageURL:(id)a9 backgroundMethod:(unint64_t)a10 solidBackgroundColorPair:(id)a11 gradientBackgroundPair:(id)a12 numberOfAppearancesToHide:(unint64_t)a13 numberOfTapsToHide:(unint64_t)a14;
- (unint64_t)backgroundMethod;
- (unint64_t)imageMethod;
- (unint64_t)numberOfAppearancesToHide;
- (unint64_t)numberOfTapsToHide;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTTodayBanner

- (NTTodayBanner)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTTodayBanner init]";
    __int16 v9 = 2080;
    v10 = "NTTodayResults.m";
    __int16 v11 = 1024;
    int v12 = 20;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTTodayBanner init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTTodayBanner)initWithIdentifier:(id)a3 title:(id)a4 body:(id)a5 actionURL:(id)a6 actionButtonText:(id)a7 imageMethod:(unint64_t)a8 imageURL:(id)a9 backgroundMethod:(unint64_t)a10 solidBackgroundColorPair:(id)a11 gradientBackgroundPair:(id)a12 numberOfAppearancesToHide:(unint64_t)a13 numberOfTapsToHide:(unint64_t)a14
{
  id v20 = a3;
  id obj = a4;
  id v21 = a4;
  id v30 = a5;
  id v22 = a5;
  id v31 = a6;
  id v34 = a6;
  id v33 = a7;
  id v23 = a9;
  id v24 = a11;
  id v25 = a12;
  v35.receiver = self;
  v35.super_class = (Class)NTTodayBanner;
  v26 = [(NTTodayBanner *)&v35 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_identifier, a3);
    objc_storeStrong((id *)&v27->_title, obj);
    objc_storeStrong((id *)&v27->_body, v30);
    objc_storeStrong((id *)&v27->_actionURL, v31);
    objc_storeStrong((id *)&v27->_actionButtonText, a7);
    v27->_imageMethod = a8;
    objc_storeStrong((id *)&v27->_imageURL, a9);
    v27->_backgroundMethod = a10;
    objc_storeStrong((id *)&v27->_solidBackgroundColorPair, a11);
    objc_storeStrong((id *)&v27->_gradientBackgroundPair, a12);
    v27->_numberOfAppearancesToHide = a13;
    v27->_numberOfTapsToHide = a14;
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [(NTTodayBanner *)self identifier];
  [v20 encodeObject:v4 forKey:@"identifier"];

  v5 = [(NTTodayBanner *)self title];

  if (v5)
  {
    id v6 = [(NTTodayBanner *)self title];
    [v20 encodeObject:v6 forKey:@"title"];
  }
  v7 = [(NTTodayBanner *)self body];

  if (v7)
  {
    v8 = [(NTTodayBanner *)self body];
    [v20 encodeObject:v8 forKey:@"body"];
  }
  __int16 v9 = [(NTTodayBanner *)self actionURL];

  if (v9)
  {
    v10 = [(NTTodayBanner *)self actionURL];
    [v20 encodeObject:v10 forKey:@"actionURL"];
  }
  __int16 v11 = [(NTTodayBanner *)self actionButtonText];

  if (v11)
  {
    int v12 = [(NTTodayBanner *)self actionButtonText];
    [v20 encodeObject:v12 forKey:@"actionButtonText"];
  }
  __int16 v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTTodayBanner imageMethod](self, "imageMethod"));
  [v20 encodeObject:v13 forKey:@"imageMethod"];

  v14 = [(NTTodayBanner *)self imageURL];

  if (v14)
  {
    uint64_t v15 = [(NTTodayBanner *)self imageURL];
    [v20 encodeObject:v15 forKey:@"imageURL"];
  }
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTTodayBanner backgroundMethod](self, "backgroundMethod"));
  [v20 encodeObject:v16 forKey:@"backgroundMethod"];

  v17 = [(NTTodayBanner *)self solidBackgroundColorPair];

  if (v17)
  {
    v18 = [(NTTodayBanner *)self solidBackgroundColorPair];
    [v20 encodeObject:v18 forKey:@"solidBackgroundColorPair"];
  }
  v19 = [(NTTodayBanner *)self gradientBackgroundPair];
  [v20 encodeObject:v19 forKey:@"gradientBackgroundPair"];

  objc_msgSend(v20, "encodeInt64:forKey:", -[NTTodayBanner numberOfAppearancesToHide](self, "numberOfAppearancesToHide"), @"numberOfAppearancesToHide");
  objc_msgSend(v20, "encodeInt64:forKey:", -[NTTodayBanner numberOfTapsToHide](self, "numberOfTapsToHide"), @"numberOfTapToHide");
}

- (NTTodayBanner)initWithCoder:(id)a3
{
  id v3 = a3;
  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
  id v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"actionURL"];
  id v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"actionButtonText"];
  id v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"imageMethod"];
  uint64_t v20 = (int)[v24 intValue];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundMethod"];
  uint64_t v6 = (int)[v19 intValue];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  v18 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  __int16 v9 = [v3 decodeObjectOfClasses:v18 forKey:@"solidBackgroundColorPair"];
  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  int v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  __int16 v13 = [v3 decodeObjectOfClasses:v12 forKey:@"gradientBackgroundPair"];
  uint64_t v14 = [v3 decodeInt64ForKey:@"numberOfAppearancesToHide"];
  uint64_t v15 = [v3 decodeInt64ForKey:@"numberOfTapToHide"];

  v16 = [(NTTodayBanner *)self initWithIdentifier:v21 title:v25 body:v4 actionURL:v23 actionButtonText:v22 imageMethod:v20 imageURL:v5 backgroundMethod:v6 solidBackgroundColorPair:v9 gradientBackgroundPair:v13 numberOfAppearancesToHide:v14 numberOfTapsToHide:v15];
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (NSString)actionButtonText
{
  return self->_actionButtonText;
}

- (unint64_t)imageMethod
{
  return self->_imageMethod;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (unint64_t)backgroundMethod
{
  return self->_backgroundMethod;
}

- (NSArray)solidBackgroundColorPair
{
  return self->_solidBackgroundColorPair;
}

- (NSArray)gradientBackgroundPair
{
  return self->_gradientBackgroundPair;
}

- (unint64_t)numberOfAppearancesToHide
{
  return self->_numberOfAppearancesToHide;
}

- (unint64_t)numberOfTapsToHide
{
  return self->_numberOfTapsToHide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientBackgroundPair, 0);
  objc_storeStrong((id *)&self->_solidBackgroundColorPair, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_actionButtonText, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end