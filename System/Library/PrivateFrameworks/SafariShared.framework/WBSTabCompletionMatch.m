@interface WBSTabCompletionMatch
+ (int64_t)_matchLocationForString:(id)a3 url:(id)a4 title:(id)a5;
- (NSURL)url;
- (WBSTabCompletionMatch)initWithUserTypedString:(id)a3 url:(id)a4 title:(id)a5 forQueryID:(int64_t)a6;
- (id)originalURLString;
- (id)title;
- (id)userVisibleURLString;
@end

@implementation WBSTabCompletionMatch

- (WBSTabCompletionMatch)initWithUserTypedString:(id)a3 url:(id)a4 title:(id)a5 forQueryID:(int64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a3;
  v14 = [[WBSURLCompletionUserTypedString alloc] initWithString:v13];

  uint64_t v15 = [(id)objc_opt_class() _matchLocationForString:v14 url:v11 title:v12];
  if (v15 >= 5
    && (uint64_t v16 = v15,
        [(WBSURLCompletionUserTypedString *)v14 normalizedString],
        v17 = objc_claimAutoreleasedReturnValue(),
        v22.receiver = self,
        v22.super_class = (Class)WBSTabCompletionMatch,
        self = [(WBSURLCompletionMatch *)&v22 initWithMatchLocation:v16 userInput:v17 forQueryID:a6], v17, self))
  {
    objc_storeStrong((id *)&self->_url, a4);
    v18 = (NSString *)[v12 copy];
    title = self->_title;
    self->_title = v18;

    self = self;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)originalURLString
{
  return [(NSURL *)self->_url safari_originalDataAsString];
}

- (id)userVisibleURLString
{
  return [(NSURL *)self->_url safari_userVisibleString];
}

+ (int64_t)_matchLocationForString:(id)a3 url:(id)a4 title:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!a4)
  {
    int64_t v13 = 0;
    goto LABEL_11;
  }
  v10 = objc_msgSend(a4, "safari_userVisibleString");
  id v11 = [v8 normalizedString];
  if (objc_msgSend(v11, "safari_isPrefixOfWwwDot"))
  {
    int v12 = [MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled];

    if (!v12) {
      goto LABEL_6;
    }
    objc_msgSend(v10, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 8, 0, 0);
    v10 = id v11 = v10;
  }

LABEL_6:
  int64_t v13 = [a1 matchLocationForString:v8 inURLString:v10];
  if ((unint64_t)(v13 - 9) >= 2)
  {
    uint64_t v14 = [a1 matchLocationForString:v8 inTitle:v9];
    if (v13 <= v14) {
      int64_t v13 = v14;
    }
  }

LABEL_11:
  return v13;
}

- (id)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end