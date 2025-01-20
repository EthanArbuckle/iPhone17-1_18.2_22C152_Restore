@interface ICUITextSuggestion
+ (id)calculateResultLiteralTextSuggestionWithResult:(id)a3;
+ (id)calculateResultTextSuggestionWithResult:(id)a3;
+ (id)hashtagTextSuggestionWithIdentifier:(id)a3 displayText:(id)a4;
+ (id)literalTextSuggestionWithInputText:(id)a3;
+ (id)mentionTextSuggestionWithIdentifier:(id)a3 displayText:(id)a4 inputText:(id)a5 image:(id)a6;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
- (void)setIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation ICUITextSuggestion

+ (id)literalTextSuggestionWithInputText:(id)a3
{
  id v3 = a3;
  v4 = +[UITextSuggestion textSuggestionWithInputText:v3];
  [v4 setType:1];
  v5 = objc_msgSend(v3, "ic_quotedString");

  [v4 setDisplayText:v5];
  return v4;
}

+ (id)hashtagTextSuggestionWithIdentifier:(id)a3 displayText:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[UITextSuggestion textSuggestionWithInputText:v5 searchText:v5];
  [v7 setType:2];
  [v7 setIdentifier:v6];

  [v7 setDisplayText:v5];
  return v7;
}

+ (id)mentionTextSuggestionWithIdentifier:(id)a3 displayText:(id)a4 inputText:(id)a5 image:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = +[UITextSuggestion textSuggestionWithInputText:a5];
  [v12 setType:3];
  [v12 setIdentifier:v11];

  [v12 setDisplayText:v10];
  [v12 setImage:v9];

  return v12;
}

+ (id)calculateResultTextSuggestionWithResult:(id)a3
{
  id v3 = a3;
  v4 = [v3 formattedResult];
  id v5 = [v3 formattedResult];
  id v6 = +[UITextSuggestion textSuggestionWithInputText:v4 searchText:v5];

  [v6 setType:4];
  v7 = NSString;
  v8 = [v3 expression];
  id v9 = objc_msgSend(NSString, "ic_calculateEqualsSignString");
  id v10 = [v3 formattedResult];

  id v11 = [v7 stringWithFormat:@"%@%@%@", v8, v9, v10];
  [v6 setDisplayText:v11];

  return v6;
}

+ (id)calculateResultLiteralTextSuggestionWithResult:(id)a3
{
  id v3 = a3;
  v4 = [v3 formattedResult];
  id v5 = [v3 formattedResult];
  id v6 = +[UITextSuggestion textSuggestionWithInputText:v4 searchText:v5];

  [v6 setType:5];
  v7 = [v3 formattedResult];

  [v6 setDisplayText:v7];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(UITextSuggestion *)self inputText];
  id v5 = +[UITextSuggestion textSuggestionWithInputText:v4];

  objc_msgSend(v5, "setType:", -[ICUITextSuggestion type](self, "type"));
  id v6 = [(ICUITextSuggestion *)self identifier];
  [v5 setIdentifier:v6];

  v7 = [(UITextSuggestion *)self displayText];
  [v5 setDisplayText:v7];

  v8 = [(UITextSuggestion *)self searchText];
  [v5 setSearchText:v8];

  id v9 = [(UITextSuggestion *)self image];
  [v5 setImage:v9];

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end