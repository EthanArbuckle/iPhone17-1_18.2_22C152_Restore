@interface UITextSuggestion
+ (BOOL)supportsSecureCoding;
+ (id)classFallbacksForKeyedArchiver;
+ (id)decodeTextSuggestions:(id)a3;
+ (id)encodeTextSuggestions:(id)a3;
+ (id)textSuggestionWithInputText:(id)a3;
+ (id)textSuggestionWithInputText:(id)a3 searchText:(id)a4;
+ (id)textSuggestionWithInputText:(id)a3 searchText:(id)a4 customInfoType:(unint64_t)a5;
- (BOOL)canDisplayInline;
- (BOOL)displayStylePlain;
- (NSString)displayText;
- (NSString)headerText;
- (NSString)inputText;
- (NSString)searchText;
- (NSUUID)uuid;
- (TIKeyboardCandidate)_keyboardCandidate;
- (UIColor)backgroundColor;
- (UIColor)foregroundColor;
- (UIImage)image;
- (UITextSuggestion)init;
- (UITextSuggestion)initWithCoder:(id)a3;
- (UITextSuggestion)initWithInputText:(id)a3 searchText:(id)a4 displayText:(id)a5 headerText:(id)a6 customInfoType:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)customInfoType;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanDisplayInline:(BOOL)a3;
- (void)setCustomInfoType:(unint64_t)a3;
- (void)setDisplayStylePlain:(BOOL)a3;
- (void)setDisplayText:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setHeaderText:(id)a3;
- (void)setImage:(id)a3;
- (void)setInputText:(id)a3;
- (void)setSearchText:(id)a3;
@end

@implementation UITextSuggestion

- (UITextSuggestion)init
{
  v6.receiver = self;
  v6.super_class = (Class)UITextSuggestion;
  v2 = [(UITextSuggestion *)&v6 init];
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    uuid = v2->_uuid;
    v2->_uuid = v3;
  }
  return v2;
}

- (UITextSuggestion)initWithInputText:(id)a3 searchText:(id)a4 displayText:(id)a5 headerText:(id)a6 customInfoType:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v28.receiver = self;
  v28.super_class = (Class)UITextSuggestion;
  v16 = [(UITextSuggestion *)&v28 init];
  if (v16)
  {
    v17 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    uuid = v16->_uuid;
    v16->_uuid = v17;

    uint64_t v19 = [v12 copy];
    inputText = v16->_inputText;
    v16->_inputText = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    searchText = v16->_searchText;
    v16->_searchText = (NSString *)v21;

    uint64_t v23 = [v14 copy];
    displayText = v16->_displayText;
    v16->_displayText = (NSString *)v23;

    uint64_t v25 = [v15 copy];
    headerText = v16->_headerText;
    v16->_headerText = (NSString *)v25;

    v16->_customInfoType = a7;
  }

  return v16;
}

+ (id)textSuggestionWithInputText:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithInputText:v4 searchText:v4 displayText:v4 headerText:0 customInfoType:0];

  return v5;
}

+ (id)textSuggestionWithInputText:(id)a3 searchText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithInputText:v7 searchText:v6 displayText:v7 headerText:0 customInfoType:0];

  return v8;
}

+ (id)textSuggestionWithInputText:(id)a3 searchText:(id)a4 customInfoType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithInputText:v9 searchText:v8 displayText:v9 headerText:0 customInfoType:a5];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UITextSuggestion);
  uint64_t v5 = [(NSUUID *)self->_uuid copy];
  uuid = v4->_uuid;
  v4->_uuid = (NSUUID *)v5;

  uint64_t v7 = [(NSString *)self->_inputText copy];
  inputText = v4->_inputText;
  v4->_inputText = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_searchText copy];
  searchText = v4->_searchText;
  v4->_searchText = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_displayText copy];
  displayText = v4->_displayText;
  v4->_displayText = (NSString *)v11;

  uint64_t v13 = [(NSString *)self->_headerText copy];
  headerText = v4->_headerText;
  v4->_headerText = (NSString *)v13;

  v4->_displayStylePlain = self->_displayStylePlain;
  uint64_t v15 = [(UIImage *)self->_image copy];
  image = v4->_image;
  v4->_image = (UIImage *)v15;

  uint64_t v17 = [(UIColor *)self->_foregroundColor copy];
  foregroundColor = v4->_foregroundColor;
  v4->_foregroundColor = (UIColor *)v17;

  uint64_t v19 = [(UIColor *)self->_backgroundColor copy];
  backgroundColor = v4->_backgroundColor;
  v4->_backgroundColor = (UIColor *)v19;

  v4->_canDisplayInline = self->_canDisplayInline;
  v4->_customInfoType = self->_customInfoType;
  return v4;
}

- (TIKeyboardCandidate)_keyboardCandidate
{
  unint64_t v3 = [(UITextSuggestion *)self customInfoType];
  return (TIKeyboardCandidate *)+[TIKeyboardCandidateSuggestion candidateWithSuggestion:self customInfoType:v3];
}

+ (id)classFallbacksForKeyedArchiver
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"UITextSuggestion", 0);
}

+ (id)encodeTextSuggestions:(id)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
}

+ (id)decodeTextSuggestions:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
    id v4 = a3;
    uint64_t v5 = objc_opt_class();
    id v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
    id v10 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v4 error:&v10];

    id v8 = v10;
    if (v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to decode UITextSuggestions with error: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  id v4 = [(UITextSuggestion *)self uuid];
  [v21 encodeObject:v4 forKey:@"uuid"];

  uint64_t v5 = [(UITextSuggestion *)self inputText];

  if (v5)
  {
    id v6 = [(UITextSuggestion *)self inputText];
    [v21 encodeObject:v6 forKey:@"inputText"];
  }
  uint64_t v7 = [(UITextSuggestion *)self searchText];

  if (v7)
  {
    id v8 = [(UITextSuggestion *)self searchText];
    [v21 encodeObject:v8 forKey:@"searchText"];
  }
  uint64_t v9 = [(UITextSuggestion *)self displayText];

  if (v9)
  {
    id v10 = [(UITextSuggestion *)self displayText];
    [v21 encodeObject:v10 forKey:@"displayText"];
  }
  uint64_t v11 = [(UITextSuggestion *)self headerText];

  if (v11)
  {
    id v12 = [(UITextSuggestion *)self headerText];
    [v21 encodeObject:v12 forKey:@"headerText"];
  }
  objc_msgSend(v21, "encodeBool:forKey:", -[UITextSuggestion displayStylePlain](self, "displayStylePlain"), @"displayStylePlain");
  uint64_t v13 = [(UITextSuggestion *)self image];

  if (v13)
  {
    id v14 = [(UITextSuggestion *)self image];
    [v21 encodeObject:v14 forKey:@"image"];
  }
  uint64_t v15 = [(UITextSuggestion *)self foregroundColor];

  if (v15)
  {
    v16 = [(UITextSuggestion *)self foregroundColor];
    [v21 encodeObject:v16 forKey:@"foregroundColor"];
  }
  uint64_t v17 = [(UITextSuggestion *)self backgroundColor];

  if (v17)
  {
    v18 = [(UITextSuggestion *)self backgroundColor];
    [v21 encodeObject:v18 forKey:@"backgroundColor"];
  }
  if ([(UITextSuggestion *)self canDisplayInline]) {
    objc_msgSend(v21, "encodeBool:forKey:", -[UITextSuggestion canDisplayInline](self, "canDisplayInline"), @"canDisplayInline");
  }
  unint64_t v19 = [(UITextSuggestion *)self customInfoType];
  v20 = v21;
  if (v19)
  {
    objc_msgSend(v21, "encodeInt64:forKey:", -[UITextSuggestion customInfoType](self, "customInfoType"), @"customInfoType");
    v20 = v21;
  }
}

- (UITextSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UITextSuggestion;
  uint64_t v5 = [(UITextSuggestion *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputText"];
    [(UITextSuggestion *)v5 setInputText:v8];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchText"];
    [(UITextSuggestion *)v5 setSearchText:v9];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayText"];
    [(UITextSuggestion *)v5 setDisplayText:v10];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"headerText"];
    [(UITextSuggestion *)v5 setHeaderText:v11];

    -[UITextSuggestion setDisplayStylePlain:](v5, "setDisplayStylePlain:", [v4 decodeBoolForKey:@"displayStylePlain"]);
    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    [(UITextSuggestion *)v5 setImage:v12];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foregroundColor"];
    [(UITextSuggestion *)v5 setForegroundColor:v13];

    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    [(UITextSuggestion *)v5 setBackgroundColor:v14];

    -[UITextSuggestion setCanDisplayInline:](v5, "setCanDisplayInline:", [v4 decodeBoolForKey:@"canDisplayInline"]);
    -[UITextSuggestion setCustomInfoType:](v5, "setCustomInfoType:", [v4 decodeInt64ForKey:@"customInfoType"]);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)inputText
{
  return self->_inputText;
}

- (void)setInputText:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
}

- (BOOL)displayStylePlain
{
  return self->_displayStylePlain;
}

- (void)setDisplayStylePlain:(BOOL)a3
{
  self->_displayStylePlain = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (BOOL)canDisplayInline
{
  return self->_canDisplayInline;
}

- (void)setCanDisplayInline:(BOOL)a3
{
  self->_canDisplayInline = a3;
}

- (unint64_t)customInfoType
{
  return self->_customInfoType;
}

- (void)setCustomInfoType:(unint64_t)a3
{
  self->_customInfoType = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_inputText, 0);
}

@end