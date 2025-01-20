@interface WFContextualActionIcon
+ (BOOL)supportsSecureCoding;
+ (WFContextualActionIcon)iconWithApplicationBundleIdentifier:(id)a3;
+ (WFContextualActionIcon)iconWithINImage:(id)a3 displayStyle:(unint64_t)a4 completion:(id)a5;
+ (WFContextualActionIcon)iconWithImageData:(id)a3 scale:(double)a4 displayStyle:(unint64_t)a5;
+ (WFContextualActionIcon)iconWithImageName:(id)a3;
+ (WFContextualActionIcon)iconWithImageURL:(id)a3 displayStyle:(unint64_t)a4;
+ (WFContextualActionIcon)iconWithSystemName:(id)a3;
+ (id)imageNamed:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)imageData;
- (NSString)applicationBundleIdentifier;
- (NSString)imageName;
- (NSString)lnPropertyIdentifier;
- (NSString)systemName;
- (NSURL)imageURL;
- (WFContextualActionIcon)initWithApplicationBundleIdentifier:(id)a3;
- (WFContextualActionIcon)initWithCoder:(id)a3;
- (WFContextualActionIcon)initWithImageData:(id)a3 scale:(double)a4 displayStyle:(unint64_t)a5;
- (WFContextualActionIcon)initWithImageName:(id)a3;
- (WFContextualActionIcon)initWithImageURL:(id)a3 displayStyle:(unint64_t)a4;
- (WFContextualActionIcon)initWithLNPropertyIdentifier:(id)a3 displayStyle:(unint64_t)a4;
- (WFContextualActionIcon)initWithSystemName:(id)a3;
- (WFIcon)wfIcon;
- (double)imageScale;
- (id)renderedImage;
- (unint64_t)displayStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)loadLNPropertyImageWithCompletion:(id)a3;
@end

@implementation WFContextualActionIcon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_lnPropertyIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)lnPropertyIdentifier
{
  return self->_lnPropertyIdentifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (WFContextualActionIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemName"];
  if (v5)
  {
    self = [(WFContextualActionIcon *)self initWithSystemName:v5];
    v6 = self;
  }
  else
  {
    uint64_t v7 = [v4 decodeIntegerForKey:@"displayStyle"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL"];
    if (v8)
    {
      self = [(WFContextualActionIcon *)self initWithImageURL:v8 displayStyle:v7];
      v6 = self;
    }
    else
    {
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
      [v4 decodeDoubleForKey:@"imageScale"];
      if (v9)
      {
        self = -[WFContextualActionIcon initWithImageData:scale:displayStyle:](self, "initWithImageData:scale:displayStyle:", v9, v7);
        v6 = self;
      }
      else
      {
        v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageName"];
        if (v10)
        {
          self = [(WFContextualActionIcon *)self initWithImageName:v10];
          v6 = self;
        }
        else
        {
          v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleIdentifier"];
          if (v11)
          {
            self = [(WFContextualActionIcon *)self initWithApplicationBundleIdentifier:v11];
            v6 = self;
          }
          else
          {
            v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lnPropertyIdentifier"];
            if (v12)
            {
              self = [(WFContextualActionIcon *)self initWithLNPropertyIdentifier:v12 displayStyle:v7];
              v6 = self;
            }
            else
            {
              v6 = 0;
            }
          }
        }
      }
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  systemName = self->_systemName;
  id v5 = a3;
  [v5 encodeObject:systemName forKey:@"systemName"];
  [v5 encodeObject:self->_imageData forKey:@"imageData"];
  [v5 encodeDouble:@"imageScale" forKey:self->_imageScale];
  [v5 encodeObject:self->_imageURL forKey:@"imageURL"];
  [v5 encodeObject:self->_imageName forKey:@"imageName"];
  [v5 encodeObject:self->_applicationBundleIdentifier forKey:@"applicationBundleIdentifier"];
  [v5 encodeInteger:self->_displayStyle forKey:@"displayStyle"];
  [v5 encodeObject:self->_lnPropertyIdentifier forKey:@"lnPropertyIdentifier"];
}

- (id)renderedImage
{
  v3 = [(WFContextualActionIcon *)self imageName];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1B3EC58F0]();
    id v5 = objc_opt_class();
    v6 = [(WFContextualActionIcon *)self imageName];
    uint64_t v7 = [v5 imageNamed:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)loadLNPropertyImageWithCompletion:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, id))a3;
  id v5 = [(WFContextualActionIcon *)self lnPropertyIdentifier];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v7 = [(WFContextualActionIcon *)self lnPropertyIdentifier];
    v8 = (void *)[v6 initWithUUIDString:v7];

    if (v8)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F72B48]) initWithOptions:2];
      v25[0] = v8;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      id v24 = 0;
      v11 = [v9 propertiesForIdentifiers:v10 error:&v24];
      id v12 = v24;

      if (v12)
      {
        v4[2](v4, 0, v12);
      }
      else
      {
        v13 = [v11 objectForKeyedSubscript:v8];
        v14 = v13;
        if (v13)
        {
          v21 = v13;
          v15 = [v13 value];
          v16 = [v15 displayRepresentation];
          v17 = [v16 image];
          v18 = [v17 inImage];

          if (v18)
          {
            unint64_t v19 = [(WFContextualActionIcon *)self displayStyle];
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __60__WFContextualActionIcon_loadLNPropertyImageWithCompletion___block_invoke;
            v22[3] = &unk_1E6079730;
            v23 = v4;
            +[WFContextualActionIcon iconWithINImage:v18 displayStyle:v19 completion:v22];
            v20 = v23;
          }
          else
          {
            v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFContextualActionIconErrorDomain" code:2 userInfo:0];
            v4[2](v4, 0, v20);
          }

          v14 = v21;
        }
        else
        {
          v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFContextualActionIconErrorDomain" code:1 userInfo:0];
          v4[2](v4, 0, v18);
        }
      }
    }
    else
    {
      v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFContextualActionIconErrorDomain" code:0 userInfo:0];
      v4[2](v4, 0, v9);
    }
  }
  else
  {
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFContextualActionIconErrorDomain" code:0 userInfo:0];
    v4[2](v4, 0, v8);
  }
}

uint64_t __60__WFContextualActionIcon_loadLNPropertyImageWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)imageScale
{
  v3 = [(WFContextualActionIcon *)self renderedImage];
  if (v3)
  {
    id v4 = [(WFContextualActionIcon *)self renderedImage];
    [v4 scale];
    double imageScale = v5;
  }
  else
  {
    double imageScale = self->_imageScale;
  }

  return imageScale;
}

- (NSData)imageData
{
  v3 = [(WFContextualActionIcon *)self renderedImage];
  if (v3)
  {
    id v4 = [(WFContextualActionIcon *)self renderedImage];
    double v5 = [v4 PNGRepresentation];
  }
  else
  {
    double v5 = self->_imageData;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFContextualActionIcon *)a3;
  double v5 = v4;
  if (v4 != self)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v7 = [(WFContextualActionIcon *)v6 systemName];
    v8 = [(WFContextualActionIcon *)self systemName];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_29;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    v16 = [(WFContextualActionIcon *)v6 imageData];
    v17 = [(WFContextualActionIcon *)self imageData];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      unint64_t v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_28;
      }
      LODWORD(v12) = [v14 isEqual:v18];

      if (!v12) {
        goto LABEL_29;
      }
    }
    [(WFContextualActionIcon *)v6 imageScale];
    double v22 = v21;
    [(WFContextualActionIcon *)self imageScale];
    if (v22 != v23)
    {
      LOBYTE(v12) = 0;
LABEL_29:

      goto LABEL_30;
    }
    id v24 = [(WFContextualActionIcon *)v6 applicationBundleIdentifier];
    v25 = [(WFContextualActionIcon *)self applicationBundleIdentifier];
    id v20 = v24;
    id v26 = v25;
    unint64_t v19 = v26;
    if (v20 == v26)
    {
    }
    else
    {
      if (!v20 || !v26)
      {

        LOBYTE(v12) = 0;
        goto LABEL_28;
      }
      LODWORD(v12) = [v20 isEqualToString:v26];

      if (!v12) {
        goto LABEL_28;
      }
    }
    uint64_t v12 = [(WFContextualActionIcon *)v6 displayStyle];
    LOBYTE(v12) = v12 == [(WFContextualActionIcon *)self displayStyle];
LABEL_28:

    goto LABEL_29;
  }
  LOBYTE(v12) = 1;
LABEL_32:

  return v12;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = [(WFContextualActionIcon *)self systemName];

  if (v4)
  {
    double v5 = [(WFContextualActionIcon *)self systemName];
    id v6 = (id)[v3 combineContentsOfPropertyListObject:v5];
  }
  uint64_t v7 = [(WFContextualActionIcon *)self imageData];

  if (v7)
  {
    v8 = [(WFContextualActionIcon *)self imageData];
    id v9 = (id)[v3 combineContentsOfPropertyListObject:v8];
  }
  id v10 = NSNumber;
  [(WFContextualActionIcon *)self imageScale];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  id v12 = (id)[v3 combineContentsOfPropertyListObject:v11];

  v13 = [(WFContextualActionIcon *)self applicationBundleIdentifier];

  if (v13)
  {
    id v14 = [(WFContextualActionIcon *)self applicationBundleIdentifier];
    id v15 = (id)[v3 combineContentsOfPropertyListObject:v14];
  }
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFContextualActionIcon displayStyle](self, "displayStyle"));
  id v17 = (id)[v3 combineContentsOfPropertyListObject:v16];

  unint64_t v18 = [v3 finalize];
  return v18;
}

- (WFContextualActionIcon)initWithApplicationBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFContextualActionIcon.m", 103, @"Invalid parameter not satisfying: %@", @"applicationBundleIdentifier" object file lineNumber description];
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];
  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)WFContextualActionIcon,
        (self = [(WFContextualActionIcon *)&v12 init]) != 0))
  {
    uint64_t v7 = (NSString *)[v5 copy];
    applicationBundleIdentifier = self->_applicationBundleIdentifier;
    self->_applicationBundleIdentifier = v7;

    self = self;
    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (WFContextualActionIcon)initWithLNPropertyIdentifier:(id)a3 displayStyle:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFContextualActionIcon.m", 90, @"Invalid parameter not satisfying: %@", @"lnPropertyIdentifier" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFContextualActionIcon;
  id v9 = [(WFContextualActionIcon *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lnPropertyIdentifier, a3);
    v10->_displayStyle = a4;
    v11 = v10;
  }

  return v10;
}

- (WFContextualActionIcon)initWithImageName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFContextualActionIcon.m", 75, @"Invalid parameter not satisfying: %@", @"imageName" object file lineNumber description];
  }
  id v6 = [(id)objc_opt_class() imageNamed:v5];
  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)WFContextualActionIcon,
        (self = [(WFContextualActionIcon *)&v12 init]) != 0))
  {
    uint64_t v7 = (NSString *)[v5 copy];
    imageName = self->_imageName;
    self->_imageName = v7;

    self = self;
    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (WFContextualActionIcon)initWithImageURL:(id)a3 displayStyle:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFContextualActionIcon.m", 63, @"Invalid parameter not satisfying: %@", @"imageURL" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFContextualActionIcon;
  id v9 = [(WFContextualActionIcon *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageURL, a3);
    v10->_displayStyle = a4;
    v11 = v10;
  }

  return v10;
}

- (WFContextualActionIcon)initWithImageData:(id)a3 scale:(double)a4 displayStyle:(unint64_t)a5
{
  id v10 = a3;
  if (!v10)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFContextualActionIcon.m", 50, @"Invalid parameter not satisfying: %@", @"imageData" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)WFContextualActionIcon;
  v11 = [(WFContextualActionIcon *)&v16 init];
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_imageData, a3);
    v12->_double imageScale = a4;
    v12->_displayStyle = a5;
    v13 = v12;
  }

  return v12;
}

- (WFContextualActionIcon)initWithSystemName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFContextualActionIcon.m", 39, @"Invalid parameter not satisfying: %@", @"systemName" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFContextualActionIcon;
  id v6 = [(WFContextualActionIcon *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    systemName = v6->_systemName;
    v6->_systemName = (NSString *)v7;

    id v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)imageNamed:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F28B50];
    id v4 = a3;
    id v5 = [v3 bundleForClass:objc_opt_class()];
    id v6 = +[WFImage imageNamed:v4 inBundle:v5 scale:2.0];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (WFContextualActionIcon)iconWithINImage:(id)a3 displayStyle:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 _isSystem]
    && ([v7 _name], id v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    id v10 = [v7 _name];
    uint64_t v11 = +[WFContextualActionIcon iconWithSystemName:v10];
  }
  else
  {
    objc_super v12 = [v7 _imageData];

    if (v12)
    {
      id v10 = [v7 _imageData];
      uint64_t v11 = +[WFContextualActionIcon iconWithImageData:v10 scale:a4 displayStyle:0.0];
    }
    else
    {
      v13 = [v7 _uri];

      if (!v13)
      {
LABEL_10:
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __66__WFContextualActionIcon_iconWithINImage_displayStyle_completion___block_invoke;
        v16[3] = &unk_1E6079708;
        id v17 = v8;
        [v7 retrieveImageDataWithCompletion:v16];
        objc_super v14 = v17;
        goto LABEL_11;
      }
      id v10 = [v7 _uri];
      uint64_t v11 = +[WFContextualActionIcon iconWithImageURL:v10 displayStyle:a4];
    }
  }
  objc_super v14 = (void *)v11;

  if (!v14) {
    goto LABEL_10;
  }
  (*((void (**)(id, void *, void))v8 + 2))(v8, v14, 0);
LABEL_11:

  return result;
}

void __66__WFContextualActionIcon_iconWithINImage_displayStyle_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 _imageData];
    id v8 = (id)v3;
    if (v3)
    {
      id v4 = +[WFContextualActionIcon iconWithImageData:v3 scale:0 displayStyle:0.0];
      id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFContextualActionIconErrorDomain" code:3 userInfo:0];
      id v5 = *(void (**)(void))(v7 + 16);
    }
    v5();
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

+ (WFContextualActionIcon)iconWithApplicationBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[WFContextualActionIcon alloc] initWithApplicationBundleIdentifier:v3];

  return v4;
}

+ (WFContextualActionIcon)iconWithImageName:(id)a3
{
  id v3 = a3;
  id v4 = [[WFContextualActionIcon alloc] initWithImageName:v3];

  return v4;
}

+ (WFContextualActionIcon)iconWithImageURL:(id)a3 displayStyle:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [[WFContextualActionIcon alloc] initWithImageURL:v5 displayStyle:a4];

  return v6;
}

+ (WFContextualActionIcon)iconWithImageData:(id)a3 scale:(double)a4 displayStyle:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [[WFContextualActionIcon alloc] initWithImageData:v7 scale:a5 displayStyle:a4];

  return v8;
}

+ (WFContextualActionIcon)iconWithSystemName:(id)a3
{
  id v3 = a3;
  id v4 = [[WFContextualActionIcon alloc] initWithSystemName:v3];

  return v4;
}

- (WFIcon)wfIcon
{
  id v3 = [(WFContextualActionIcon *)self applicationBundleIdentifier];

  if (v3)
  {
    id v4 = [WFAppIcon alloc];
    id v5 = [(WFContextualActionIcon *)self applicationBundleIdentifier];
    id v6 = [(WFAppIcon *)v4 initWithBundleIdentifier:v5];
  }
  else
  {
    id v7 = [(WFContextualActionIcon *)self systemName];

    if (v7)
    {
      id v8 = [WFSymbolIcon alloc];
      id v5 = [(WFContextualActionIcon *)self systemName];
      id v9 = +[WFColor colorWithSystemColor:1];
      id v10 = +[WFIconColorBackground clearBackground];
      id v6 = [(WFSymbolIcon *)v8 initWithSymbolName:v5 symbolColor:v9 background:v10];
    }
    else
    {
      uint64_t v11 = [(WFContextualActionIcon *)self imageURL];

      objc_super v12 = [WFImage alloc];
      if (v11)
      {
        v13 = [(WFContextualActionIcon *)self imageURL];
        uint64_t v14 = [(WFImage *)v12 initWithContentsOfURL:v13];
      }
      else
      {
        v13 = [(WFContextualActionIcon *)self imageData];
        [(WFContextualActionIcon *)self imageScale];
        uint64_t v14 = -[WFImage initWithData:scale:allowAnimated:](v12, "initWithData:scale:allowAnimated:", v13, 0);
      }
      id v5 = (void *)v14;

      if (v5)
      {
        id v15 = objc_msgSend(v5, "imageWithDisplayStyle:", -[WFContextualActionIcon displayStyle](self, "displayStyle") == 1);
        id v6 = [[WFImageIcon alloc] initWithImage:v15];
      }
      else
      {
        id v6 = 0;
      }
    }
  }

  return (WFIcon *)v6;
}

@end