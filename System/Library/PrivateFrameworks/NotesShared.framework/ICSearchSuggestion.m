@interface ICSearchSuggestion
+ (NSArray)orderedDefaultSearchSuggestions;
+ (id)iconImageForToken:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CSSuggestion)csSuggestion;
- (ICSearchSuggestion)initWithSuggestion:(id)a3;
- (ICSearchSuggestion)initWithType:(unint64_t)a3;
- (ICSearchToken)token;
- (NSString)iconImageName;
- (NSString)subQueryString;
- (NSString)suggestionItemTitle;
- (UIImage)iconImage;
- (_UISearchSuggestionItem_dci)dciSuggestion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)type;
- (void)setCsSuggestion:(id)a3;
@end

@implementation ICSearchSuggestion

- (ICSearchSuggestion)initWithType:(unint64_t)a3
{
  v39.receiver = self;
  v39.super_class = (Class)ICSearchSuggestion;
  v4 = [(ICSearchSuggestion *)&v39 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    switch(a3)
    {
      case 0uLL:
        suggestionItemTitle = v4->_suggestionItemTitle;
        v4->_suggestionItemTitle = (NSString *)@" ";

        v7 = [[ICSearchToken alloc] initWithTitle:@" " subQueryString:&stru_1F1F2FFF8 suggestionType:0];
        token = v5->_token;
        v5->_token = v7;

        subQueryString = v5->_subQueryString;
        v5->_subQueryString = (NSString *)@" ";
        goto LABEL_12;
      case 1uLL:
        uint64_t v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared Notes" value:@"Shared Notes" table:0 allowSiri:1];
        v11 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v10;

        v12 = [ICSearchToken alloc];
        subQueryString = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared" value:@"Shared" table:0 allowSiri:1];
        v13 = (void *)[[NSString alloc] initWithFormat:@"%@ = 1", @"_ICItemIsShared"];
        v14 = v12;
        v15 = subQueryString;
        v16 = v13;
        uint64_t v17 = 1;
        goto LABEL_11;
      case 2uLL:
        uint64_t v18 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Locked Notes" value:@"Locked Notes" table:0 allowSiri:1];
        v19 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v18;

        v20 = [ICSearchToken alloc];
        subQueryString = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Locked" value:@"Locked" table:0 allowSiri:1];
        v13 = (void *)[[NSString alloc] initWithFormat:@"%@ = 1", @"_ICItemIsLocked"];
        v14 = v20;
        v15 = subQueryString;
        v16 = v13;
        uint64_t v17 = 2;
        goto LABEL_11;
      case 3uLL:
        uint64_t v21 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes with Checklists" value:@"Notes with Checklists" table:0 allowSiri:1];
        v22 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v21;

        v23 = [ICSearchToken alloc];
        subQueryString = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Checklists" value:@"Checklists" table:0 allowSiri:1];
        v13 = (void *)[[NSString alloc] initWithFormat:@"%@ = 1", @"_ICItemHasChecklists"];
        v14 = v23;
        v15 = subQueryString;
        v16 = v13;
        uint64_t v17 = 3;
        goto LABEL_11;
      case 4uLL:
        uint64_t v24 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes with Tags" value:@"Notes with Tags" table:0 allowSiri:1];
        v25 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v24;

        v26 = [ICSearchToken alloc];
        subQueryString = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Tags" value:@"Tags" table:0 allowSiri:1];
        v13 = (void *)[[NSString alloc] initWithFormat:@"%@ = 1", @"_ICItemHasICItemHasTags"];
        v14 = v26;
        v15 = subQueryString;
        v16 = v13;
        uint64_t v17 = 4;
        goto LABEL_11;
      case 5uLL:
        uint64_t v27 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes with Drawings" value:@"Notes with Drawings" table:0 allowSiri:1];
        v28 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v27;

        v29 = [ICSearchToken alloc];
        subQueryString = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Drawings" value:@"Drawings" table:0 allowSiri:1];
        v13 = (void *)[[NSString alloc] initWithFormat:@"%@ = 1", @"_ICItemHasDrawings"];
        v14 = v29;
        v15 = subQueryString;
        v16 = v13;
        uint64_t v17 = 5;
        goto LABEL_11;
      case 6uLL:
        uint64_t v30 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes with Scanned Documents" value:@"Notes with Scanned Documents" table:0 allowSiri:1];
        v31 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v30;

        v32 = [ICSearchToken alloc];
        subQueryString = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Scanned Documents" value:@"Scanned Documents" table:0 allowSiri:1];
        v13 = (void *)[[NSString alloc] initWithFormat:@"%@ = 1", @"_ICItemHasScannedDocuments"];
        v14 = v32;
        v15 = subQueryString;
        v16 = v13;
        uint64_t v17 = 6;
        goto LABEL_11;
      case 7uLL:
        uint64_t v33 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes with Attachments" value:@"Notes with Attachments" table:0 allowSiri:1];
        v34 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v33;

        v35 = [ICSearchToken alloc];
        subQueryString = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Attachments" value:@"Attachments" table:0 allowSiri:1];
        v13 = (void *)[[NSString alloc] initWithFormat:@"%@ = 1", @"_ICItemHasAttachments"];
        v14 = v35;
        v15 = subQueryString;
        v16 = v13;
        uint64_t v17 = 7;
LABEL_11:
        uint64_t v36 = [(ICSearchToken *)v14 initWithTitle:v15 subQueryString:v16 suggestionType:v17];
        v37 = v5->_token;
        v5->_token = (ICSearchToken *)v36;

LABEL_12:
        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (ICSearchSuggestion)initWithSuggestion:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICSearchSuggestion;
  v6 = [(ICSearchSuggestion *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_csSuggestion, a3);
    v8 = [v5 localizedAttributedSuggestion];
    uint64_t v9 = [v8 string];
    suggestionItemTitle = v7->_suggestionItemTitle;
    v7->_suggestionItemTitle = (NSString *)v9;

    v11 = [ICSearchToken alloc];
    v12 = [v5 currentToken];
    uint64_t v13 = [(ICSearchToken *)v11 initWithCSSuggestionToken:v12];
    token = v7->_token;
    v7->_token = (ICSearchToken *)v13;

    uint64_t v15 = [v5 userQueryString];
    subQueryString = v7->_subQueryString;
    v7->_subQueryString = (NSString *)v15;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t v5 = -[ICSearchSuggestion type](self, "type"), v5 == [v4 type]))
  {
    v6 = [(ICSearchSuggestion *)self csSuggestion];
    v7 = [v4 csSuggestion];
    if (v6 == v7)
    {
      uint64_t v10 = [(ICSearchSuggestion *)self suggestionItemTitle];
      v11 = [v4 suggestionItemTitle];
      char v8 = [v10 isEqualToString:v11];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICSearchSuggestion;
  id v4 = [(ICSearchSuggestion *)&v8 description];
  unint64_t v5 = [(ICSearchSuggestion *)self token];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (NSString)iconImageName
{
  v2 = [(ICSearchSuggestion *)self token];
  v3 = [v2 iconImageName];

  return (NSString *)v3;
}

- (UIImage)iconImage
{
  v3 = [(ICSearchSuggestion *)self csSuggestion];

  if (v3)
  {
    id v4 = [ICSearchToken alloc];
    unint64_t v5 = [(ICSearchSuggestion *)self csSuggestion];
    v6 = [v5 currentToken];
    v7 = [(ICSearchToken *)v4 initWithCSSuggestionToken:v6];
  }
  else
  {
    v7 = [(ICSearchSuggestion *)self token];
  }
  objc_super v8 = +[ICSearchSuggestion iconImageForToken:v7];

  return (UIImage *)v8;
}

+ (id)iconImageForToken:(id)a3
{
  uint64_t v3 = [a3 iconImageName];
  id v4 = (void *)v3;
  unint64_t v5 = @"magnifyingglass";
  if (v3) {
    unint64_t v5 = (__CFString *)v3;
  }
  v6 = v5;

  v7 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_systemImageNamed:textStyle:", v6, *MEMORY[0x1E4FB2998]);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [(ICSearchSuggestion *)self csSuggestion];

  if (v5)
  {
    v6 = [(ICSearchSuggestion *)self csSuggestion];
    v7 = (void *)[v6 copyWithZone:a3];

    objc_super v8 = [+[ICSearchSuggestion allocWithZone:a3] initWithSuggestion:v7];
    return v8;
  }
  else
  {
    uint64_t v10 = +[ICSearchSuggestion allocWithZone:a3];
    unint64_t v11 = [(ICSearchSuggestion *)self type];
    return [(ICSearchSuggestion *)v10 initWithType:v11];
  }
}

- (_UISearchSuggestionItem_dci)dciSuggestion
{
  id v3 = objc_alloc(MEMORY[0x1E4FB2288]);
  id v4 = [(ICSearchSuggestion *)self suggestionItemTitle];
  unint64_t v5 = [(ICSearchSuggestion *)self suggestionItemTitle];
  v6 = [(ICSearchSuggestion *)self iconImage];
  v7 = (void *)[v3 initWithLocalizedSuggestion:v4 localizedDescription:v5 iconImage:v6];

  [v7 setRepresentedObject:self];
  return (_UISearchSuggestionItem_dci *)v7;
}

+ (NSArray)orderedDefaultSearchSuggestions
{
  if (orderedDefaultSearchSuggestions_onceToken != -1) {
    dispatch_once(&orderedDefaultSearchSuggestions_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)orderedDefaultSearchSuggestions_orderedDefaultSearchSuggestions;
  return (NSArray *)v2;
}

void __53__ICSearchSuggestion_orderedDefaultSearchSuggestions__block_invoke()
{
  v9[7] = *MEMORY[0x1E4F143B8];
  v0 = [[ICSearchSuggestion alloc] initWithType:1];
  v1 = -[ICSearchSuggestion initWithType:]([ICSearchSuggestion alloc], "initWithType:", 2, v0);
  v9[1] = v1;
  v2 = [[ICSearchSuggestion alloc] initWithType:3];
  v9[2] = v2;
  id v3 = [[ICSearchSuggestion alloc] initWithType:4];
  v9[3] = v3;
  id v4 = [[ICSearchSuggestion alloc] initWithType:5];
  v9[4] = v4;
  unint64_t v5 = [[ICSearchSuggestion alloc] initWithType:6];
  v9[5] = v5;
  v6 = [[ICSearchSuggestion alloc] initWithType:7];
  v9[6] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];
  objc_super v8 = (void *)orderedDefaultSearchSuggestions_orderedDefaultSearchSuggestions;
  orderedDefaultSearchSuggestions_orderedDefaultSearchSuggestions = v7;
}

- (CSSuggestion)csSuggestion
{
  return self->_csSuggestion;
}

- (void)setCsSuggestion:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)suggestionItemTitle
{
  return self->_suggestionItemTitle;
}

- (ICSearchToken)token
{
  return self->_token;
}

- (NSString)subQueryString
{
  return self->_subQueryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subQueryString, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_suggestionItemTitle, 0);
  objc_storeStrong((id *)&self->_csSuggestion, 0);
}

@end