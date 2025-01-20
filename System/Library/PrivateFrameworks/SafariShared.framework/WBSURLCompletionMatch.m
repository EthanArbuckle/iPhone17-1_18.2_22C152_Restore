@interface WBSURLCompletionMatch
+ (int64_t)matchLocationForString:(id)a3 inTitle:(id)a4;
+ (int64_t)matchLocationForString:(id)a3 inURLString:(id)a4;
- (BOOL)containsBookmark;
- (BOOL)containsReadingListItem;
- (BOOL)isTopHit;
- (BOOL)matchLocationIsInURL;
- (BOOL)matchesAutocompleteTrigger;
- (BOOL)onlyContainsCloudTab;
- (BOOL)shouldPreload;
- (NSString)alternativeDisplayTextForURL;
- (NSString)cloudTabDeviceName;
- (NSString)description;
- (NSString)parsecDomainIdentifier;
- (NSString)title;
- (NSString)userInput;
- (NSString)userVisibleURLString;
- (NSString)uuidString;
- (SFSearchResult)sfSearchResultValue;
- (WBSURLCompletionMatch)initWithMatchLocation:(int64_t)a3 userInput:(id)a4 forQueryID:(int64_t)a5;
- (double)lastVisitTimeInterval;
- (float)topSitesScore;
- (id)matchingStringWithUserTypedPrefix:(id)a3;
- (id)originalURLString;
- (int64_t)matchLocation;
- (int64_t)parsecQueryID;
- (int64_t)visitCountScore;
- (unint64_t)engagementDestination;
- (void)setAlternativeDisplayTextForURL:(id)a3;
- (void)setParsecQueryID:(int64_t)a3;
@end

@implementation WBSURLCompletionMatch

+ (int64_t)matchLocationForString:(id)a3 inURLString:(id)a4
{
  return SafariShared::computeURLMatchLocation((CFStringRef)a4, (NSString *)a3, (WBSURLCompletionUserTypedString *)a3);
}

+ (int64_t)matchLocationForString:(id)a3 inTitle:(id)a4
{
  return SafariShared::computeTitleMatchLocation((CFStringRef)a4, (NSString *)a3, (WBSURLCompletionUserTypedString *)a3);
}

- (WBSURLCompletionMatch)initWithMatchLocation:(int64_t)a3 userInput:(id)a4 forQueryID:(int64_t)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSURLCompletionMatch;
  v9 = [(WBSURLCompletionMatch *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_matchLocation = a3;
    uint64_t v11 = [v8 copy];
    userInput = v10->_userInput;
    v10->_userInput = (NSString *)v11;

    v10->_parsecQueryID = a5;
    v13 = v10;
  }

  return v10;
}

- (BOOL)matchLocationIsInURL
{
  return (self->_matchLocation > 0xAuLL) | (0x627u >> self->_matchLocation) & 1;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WBSURLCompletionMatch *)self title];
  v7 = [(WBSURLCompletionMatch *)self userVisibleURLString];
  id v8 = [v3 stringWithFormat:@"<%@: %p title = \"%@\"; URL = %@>", v5, self, v6, v7];;

  return (NSString *)v8;
}

- (BOOL)matchesAutocompleteTrigger
{
  return 0;
}

- (id)originalURLString
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (NSString)userVisibleURLString
{
  return 0;
}

- (int64_t)visitCountScore
{
  return -1;
}

- (float)topSitesScore
{
  return -1.0;
}

- (BOOL)isTopHit
{
  return 0;
}

- (BOOL)shouldPreload
{
  return 0;
}

- (BOOL)containsBookmark
{
  return 0;
}

- (BOOL)containsReadingListItem
{
  return 0;
}

- (BOOL)onlyContainsCloudTab
{
  return 0;
}

- (NSString)cloudTabDeviceName
{
  return 0;
}

- (double)lastVisitTimeInterval
{
  return 0.0;
}

- (NSString)uuidString
{
  uuidString = self->_uuidString;
  if (!uuidString)
  {
    v4 = [MEMORY[0x1E4F29128] UUID];
    v5 = [v4 UUIDString];
    v6 = self->_uuidString;
    self->_uuidString = v5;

    uuidString = self->_uuidString;
  }
  return uuidString;
}

- (NSString)parsecDomainIdentifier
{
  return (NSString *)@"other";
}

- (SFSearchResult)sfSearchResultValue
{
  sfSearchResultValue = self->_sfSearchResultValue;
  if (!sfSearchResultValue)
  {
    objc_msgSend(MEMORY[0x1E4F9A3C0], "safari_sfSearchResultWithUniqueIdentifier");
    v4 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sfSearchResultValue;
    self->_sfSearchResultValue = v4;

    v6 = [(WBSURLCompletionMatch *)self parsecDomainIdentifier];
    [(SFSearchResult *)self->_sfSearchResultValue setResultBundleId:v6];

    v7 = [(WBSURLCompletionMatch *)self parsecDomainIdentifier];
    [(SFSearchResult *)self->_sfSearchResultValue setSectionBundleIdentifier:v7];

    [(SFSearchResult *)self->_sfSearchResultValue setType:2];
    [(SFSearchResult *)self->_sfSearchResultValue setUserInput:self->_userInput];
    id v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = [(WBSURLCompletionMatch *)self originalURLString];
    v10 = [v8 URLWithString:v9];

    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v10];
      [(SFSearchResult *)self->_sfSearchResultValue setPunchout:v11];
    }
    if ([(WBSURLCompletionMatch *)self isTopHit]) {
      [(SFSearchResult *)self->_sfSearchResultValue setTopHit:2];
    }
    sfSearchResultValue = self->_sfSearchResultValue;
  }
  v12 = sfSearchResultValue;
  return v12;
}

- (unint64_t)engagementDestination
{
  return 2;
}

- (id)matchingStringWithUserTypedPrefix:(id)a3
{
  id v4 = a3;
  v5 = [(WBSURLCompletionMatch *)self userVisibleURLString];
  if ([v5 length] && objc_msgSend(v4, "length"))
  {
    int64_t v6 = [(WBSURLCompletionMatch *)self matchLocation];
    if ((unint64_t)(v6 - 6) < 3 || v6 == 3)
    {
      id v8 = [(WBSURLCompletionMatch *)self title];
      uint64_t v9 = [v8 rangeOfString:v4 options:1];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = 0;
LABEL_12:

        goto LABEL_19;
      }
      uint64_t v11 = [v8 substringFromIndex:v9];
    }
    else
    {
      if (v6 == 4) {
        goto LABEL_18;
      }
      if ([v4 rangeOfString:@":"] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v7 = [v5 rangeOfString:@":"] + 1;
      }
      else {
        uint64_t v7 = 0;
      }
      unint64_t v12 = objc_msgSend(v5, "rangeOfString:options:range:", v4, 1, v7, objc_msgSend(v5, "length") - v7);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL && v7) {
        unint64_t v12 = [v5 rangeOfString:v4 options:1];
      }
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_18;
      }
      unint64_t v17 = 0;
      id v8 = objc_msgSend(v5, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 5, 0, &v17);
      uint64_t v14 = [v4 length];
      unint64_t v15 = v17;
      if (v14 + v12 > [v8 length] + v15)
      {
        v16 = v5;
LABEL_27:
        uint64_t v11 = [v16 substringFromIndex:v12];
        goto LABEL_11;
      }
      if (v12 >= v17)
      {
        v16 = v8;
        v12 -= v17;
        goto LABEL_27;
      }
      uint64_t v11 = objc_msgSend(v5, "substringWithRange:", v12, v17 - v12 + objc_msgSend(v8, "length"));
    }
LABEL_11:
    v10 = (void *)v11;
    goto LABEL_12;
  }
LABEL_18:
  v10 = 0;
LABEL_19:

  return v10;
}

- (int64_t)matchLocation
{
  return self->_matchLocation;
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (NSString)alternativeDisplayTextForURL
{
  return self->_alternativeDisplayTextForURL;
}

- (void)setAlternativeDisplayTextForURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeDisplayTextForURL, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
}

@end