@interface UISearchSuggestionItem
+ (NSCopying)visualStyleRegistryIdentity;
+ (UISearchSuggestionItem)suggestionWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion;
+ (UISearchSuggestionItem)suggestionWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion descriptionString:(NSString *)description;
+ (UISearchSuggestionItem)suggestionWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion descriptionString:(NSString *)description iconImage:(UIImage *)iconImage;
+ (UISearchSuggestionItem)suggestionWithLocalizedSuggestion:(NSString *)suggestion;
+ (UISearchSuggestionItem)suggestionWithLocalizedSuggestion:(NSString *)suggestion descriptionString:(NSString *)description;
+ (UISearchSuggestionItem)suggestionWithLocalizedSuggestion:(NSString *)suggestion descriptionString:(NSString *)description iconImage:(UIImage *)iconImage;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)localizedAttributedSuggestion;
- (NSString)debugDescription;
- (NSString)localizedDescription;
- (NSString)localizedSuggestion;
- (UIImage)iconImage;
- (UISearchSuggestionItem)initWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion;
- (UISearchSuggestionItem)initWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion localizedDescription:(NSString *)description;
- (UISearchSuggestionItem)initWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion localizedDescription:(NSString *)description iconImage:(UIImage *)iconImage;
- (UISearchSuggestionItem)initWithLocalizedSuggestion:(NSString *)suggestion;
- (UISearchSuggestionItem)initWithLocalizedSuggestion:(NSString *)suggestion localizedDescription:(NSString *)description;
- (UISearchSuggestionItem)initWithLocalizedSuggestion:(NSString *)suggestion localizedDescription:(NSString *)description iconImage:(UIImage *)iconImage;
- (id)representedObject;
- (unint64_t)hash;
- (void)setRepresentedObject:(id)representedObject;
@end

@implementation UISearchSuggestionItem

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"UISearchSuggestionItem";
}

+ (UISearchSuggestionItem)suggestionWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion
{
  return +[UISearchSuggestionItem suggestionWithLocalizedAttributedSuggestion:suggestion descriptionString:0 iconImage:0];
}

+ (UISearchSuggestionItem)suggestionWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion descriptionString:(NSString *)description
{
  return +[UISearchSuggestionItem suggestionWithLocalizedAttributedSuggestion:suggestion descriptionString:description iconImage:0];
}

+ (UISearchSuggestionItem)suggestionWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion descriptionString:(NSString *)description iconImage:(UIImage *)iconImage
{
  v7 = iconImage;
  v8 = description;
  v9 = suggestion;
  v10 = [[UISearchSuggestionItem alloc] initWithLocalizedAttributedSuggestion:v9 localizedDescription:v8 iconImage:v7];

  return v10;
}

+ (UISearchSuggestionItem)suggestionWithLocalizedSuggestion:(NSString *)suggestion
{
  return +[UISearchSuggestionItem suggestionWithLocalizedSuggestion:suggestion descriptionString:0 iconImage:0];
}

+ (UISearchSuggestionItem)suggestionWithLocalizedSuggestion:(NSString *)suggestion descriptionString:(NSString *)description
{
  return +[UISearchSuggestionItem suggestionWithLocalizedSuggestion:suggestion descriptionString:description iconImage:0];
}

+ (UISearchSuggestionItem)suggestionWithLocalizedSuggestion:(NSString *)suggestion descriptionString:(NSString *)description iconImage:(UIImage *)iconImage
{
  v7 = iconImage;
  v8 = description;
  v9 = suggestion;
  v10 = [[UISearchSuggestionItem alloc] initWithLocalizedSuggestion:v9 localizedDescription:v8 iconImage:v7];

  return v10;
}

- (UISearchSuggestionItem)initWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion
{
  return [(UISearchSuggestionItem *)self initWithLocalizedAttributedSuggestion:suggestion localizedDescription:0 iconImage:0];
}

- (UISearchSuggestionItem)initWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion localizedDescription:(NSString *)description
{
  return [(UISearchSuggestionItem *)self initWithLocalizedAttributedSuggestion:suggestion localizedDescription:description iconImage:0];
}

- (UISearchSuggestionItem)initWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion localizedDescription:(NSString *)description iconImage:(UIImage *)iconImage
{
  v8 = suggestion;
  v9 = description;
  v10 = iconImage;
  v19.receiver = self;
  v19.super_class = (Class)UISearchSuggestionItem;
  v11 = [(UISearchSuggestionItem *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [(NSAttributedString *)v8 copy];
    localizedAttributedSuggestion = v11->_localizedAttributedSuggestion;
    v11->_localizedAttributedSuggestion = (NSAttributedString *)v12;

    uint64_t v14 = [(NSAttributedString *)v8 string];
    localizedSuggestion = v11->_localizedSuggestion;
    v11->_localizedSuggestion = (NSString *)v14;

    uint64_t v16 = [(NSString *)v9 copy];
    localizedDescription = v11->_localizedDescription;
    v11->_localizedDescription = (NSString *)v16;

    objc_storeStrong((id *)&v11->_iconImage, iconImage);
  }

  return v11;
}

- (UISearchSuggestionItem)initWithLocalizedSuggestion:(NSString *)suggestion
{
  return [(UISearchSuggestionItem *)self initWithLocalizedSuggestion:suggestion localizedDescription:0 iconImage:0];
}

- (UISearchSuggestionItem)initWithLocalizedSuggestion:(NSString *)suggestion localizedDescription:(NSString *)description
{
  return [(UISearchSuggestionItem *)self initWithLocalizedSuggestion:suggestion localizedDescription:description iconImage:0];
}

- (UISearchSuggestionItem)initWithLocalizedSuggestion:(NSString *)suggestion localizedDescription:(NSString *)description iconImage:(UIImage *)iconImage
{
  v8 = suggestion;
  v9 = description;
  v10 = iconImage;
  v17.receiver = self;
  v17.super_class = (Class)UISearchSuggestionItem;
  v11 = [(UISearchSuggestionItem *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [(NSString *)v8 copy];
    localizedSuggestion = v11->_localizedSuggestion;
    v11->_localizedSuggestion = (NSString *)v12;

    uint64_t v14 = [(NSString *)v9 copy];
    localizedDescription = v11->_localizedDescription;
    v11->_localizedDescription = (NSString *)v14;

    objc_storeStrong((id *)&v11->_iconImage, iconImage);
  }

  return v11;
}

- (void)setRepresentedObject:(id)representedObject
{
  id v5 = representedObject;
  if (v5 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UISearchSuggestion.m", 100, @"Invalid parameter not satisfying: %@", @"representedObject == nil || [representedObject respondsToSelector:@selector(isEqual:)]" object file lineNumber description];
  }
  id v6 = self->_representedObject;
  self->_representedObject = v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UISearchSuggestionItem *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      localizedAttributedSuggestion = v5->_localizedAttributedSuggestion;
      v7 = self->_localizedAttributedSuggestion;
      v8 = localizedAttributedSuggestion;
      if (v7 == v8)
      {
      }
      else
      {
        v9 = v8;
        LOBYTE(v10) = 0;
        if (!v7 || !v8) {
          goto LABEL_34;
        }
        int v10 = [(NSAttributedString *)v7 isEqual:v8];

        if (!v10) {
          goto LABEL_35;
        }
      }
      localizedSuggestion = v5->_localizedSuggestion;
      v7 = self->_localizedSuggestion;
      uint64_t v12 = localizedSuggestion;
      if (v7 == v12)
      {
      }
      else
      {
        v9 = v12;
        LOBYTE(v10) = 0;
        if (!v7 || !v12) {
          goto LABEL_34;
        }
        int v10 = [(NSAttributedString *)v7 isEqual:v12];

        if (!v10) {
          goto LABEL_35;
        }
      }
      localizedDescription = v5->_localizedDescription;
      v7 = self->_localizedDescription;
      uint64_t v14 = localizedDescription;
      if (v7 == v14)
      {
      }
      else
      {
        v9 = v14;
        LOBYTE(v10) = 0;
        if (!v7 || !v14) {
          goto LABEL_34;
        }
        int v10 = [(NSAttributedString *)v7 isEqual:v14];

        if (!v10) {
          goto LABEL_35;
        }
      }
      iconImage = v5->_iconImage;
      v7 = self->_iconImage;
      uint64_t v16 = iconImage;
      if (v7 == v16)
      {

LABEL_29:
        id representedObject = self->_representedObject;
        id v18 = v5->_representedObject;
        v7 = (NSAttributedString *)representedObject;
        objc_super v19 = (NSAttributedString *)v18;
        if (v7 == v19)
        {
          LOBYTE(v10) = 1;
          v9 = v7;
        }
        else
        {
          v9 = v19;
          LOBYTE(v10) = 0;
          if (v7 && v19) {
            LOBYTE(v10) = [(NSAttributedString *)v7 isEqual:v19];
          }
        }
        goto LABEL_34;
      }
      v9 = v16;
      LOBYTE(v10) = 0;
      if (v7 && v16)
      {
        int v10 = [(NSAttributedString *)v7 isEqual:v16];

        if (!v10) {
          goto LABEL_35;
        }
        goto LABEL_29;
      }
LABEL_34:

LABEL_35:
      goto LABEL_36;
    }
    LOBYTE(v10) = 0;
  }
LABEL_36:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSAttributedString *)self->_localizedAttributedSuggestion hash];
  return [(NSString *)self->_localizedSuggestion hash] ^ v3;
}

- (NSString)debugDescription
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@", self];
  localizedAttributedSuggestion = self->_localizedAttributedSuggestion;
  if (localizedAttributedSuggestion)
  {
    id v5 = [(NSAttributedString *)localizedAttributedSuggestion string];
    [v3 appendFormat:@" '%@'", v5];
  }
  else
  {
    [v3 appendFormat:@" '%@'", self->_localizedSuggestion];
  }
  if (self->_localizedAttributedSuggestion) {
    objc_msgSend(v3, "appendFormat:", @" attributedSuggestion=%p", self->_localizedAttributedSuggestion);
  }
  if (self->_localizedDescription) {
    [v3 appendFormat:@" description='%@'", self->_localizedDescription];
  }
  iconImage = self->_iconImage;
  if (iconImage)
  {
    v7 = _UIImageName(self->_iconImage);
    if ([v7 length])
    {
      v8 = NSString;
      v9 = _UIImageName(self->_iconImage);
      int v10 = [v8 stringWithFormat:@" '%@'", v9];
      [v3 appendFormat:@" image=%p%@", iconImage, v10];
    }
    else
    {
      [v3 appendFormat:@" image=%p%@", iconImage, &stru_1ED0E84C0];
    }
  }
  if (self->_representedObject) {
    objc_msgSend(v3, "appendFormat:", @" representedObject=%p", self->_representedObject);
  }
  return (NSString *)v3;
}

- (NSAttributedString)localizedAttributedSuggestion
{
  return self->_localizedAttributedSuggestion;
}

- (NSString)localizedSuggestion
{
  return self->_localizedSuggestion;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_representedObject, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedSuggestion, 0);
  objc_storeStrong((id *)&self->_localizedAttributedSuggestion, 0);
}

@end