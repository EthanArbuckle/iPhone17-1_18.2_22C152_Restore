@interface WBSSavedAccountMatchCriteria
+ (id)criteriaForExactFQDNPasswordMatchesOfURL:(id)a3;
+ (id)criteriaForNonAutofillablePasskeyWithCredentialIdentifier:(id)a3;
- (BOOL)queryShouldIncludePasskeyMatchesForNonAutoFillContext;
- (BOOL)queryShouldIncludeSavedAccountsWithDoNotSaveMarkers;
- (BOOL)queryShouldOmitAutoFillPasskeyMatches;
- (BOOL)queryShouldOnlyIncludePasswordsWithoutWebsites;
- (BOOL)queryShouldReturnSavedAccountsMatchingAssociatedDomains;
- (BOOL)queryShouldReturnSavedAccountsMatchingHighLevelAndSimplifiedDomains;
- (BOOL)queryShouldReturnSavedAccountsWithEmptyUsernames;
- (NSData)passkeyCredentialIdentifier;
- (NSSet)associatedDomainsForURL;
- (NSURL)URL;
- (WBSAutoFillAssociatedDomainsManager)associatedDomainsManager;
- (WBSGlobalFrameIdentifier)webFrameIdentifier;
- (WBSSavedAccountContext)context;
- (WBSSavedAccountMatchCriteria)initWithURL:(id)a3 options:(unint64_t)a4 userNameQuery:(id)a5 associatedDomainsManager:(id)a6 webFrameIdentifier:(id)a7;
- (WBSSavedAccountMatchCriteria)initWithURL:(id)a3 options:(unint64_t)a4 userNameQuery:(id)a5 passkeyCredentialIdentifier:(id)a6 associatedDomainsManager:(id)a7 webFrameIdentifier:(id)a8;
- (WBSStringQuery)titleQuery;
- (WBSStringQuery)userNameQuery;
- (id)_optionsDescription;
- (id)description;
- (unint64_t)options;
- (void)setAssociatedDomainsManager:(id)a3;
- (void)setContext:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPasskeyCredentialIdentifier:(id)a3;
- (void)setTitleQuery:(id)a3;
- (void)setURL:(id)a3;
- (void)setUserNameQuery:(id)a3;
@end

@implementation WBSSavedAccountMatchCriteria

+ (id)criteriaForExactFQDNPasswordMatchesOfURL:(id)a3
{
  id v4 = a3;
  v5 = +[WBSStringQuery queryThatMatchesEverything];
  v6 = (void *)[objc_alloc((Class)a1) initWithURL:v4 options:16 userNameQuery:v5 associatedDomainsManager:0 webFrameIdentifier:0];

  return v6;
}

+ (id)criteriaForNonAutofillablePasskeyWithCredentialIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[WBSStringQuery queryThatMatchesEverything];
  v6 = (void *)[objc_alloc((Class)a1) initWithURL:0 options:48 userNameQuery:v5 passkeyCredentialIdentifier:v4 associatedDomainsManager:0 webFrameIdentifier:0];

  return v6;
}

- (WBSSavedAccountMatchCriteria)initWithURL:(id)a3 options:(unint64_t)a4 userNameQuery:(id)a5 associatedDomainsManager:(id)a6 webFrameIdentifier:(id)a7
{
  return [(WBSSavedAccountMatchCriteria *)self initWithURL:a3 options:a4 userNameQuery:a5 passkeyCredentialIdentifier:0 associatedDomainsManager:a6 webFrameIdentifier:a7];
}

- (WBSSavedAccountMatchCriteria)initWithURL:(id)a3 options:(unint64_t)a4 userNameQuery:(id)a5 passkeyCredentialIdentifier:(id)a6 associatedDomainsManager:(id)a7 webFrameIdentifier:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)WBSSavedAccountMatchCriteria;
  v19 = [(WBSSavedAccountMatchCriteria *)&v28 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    URL = v19->_URL;
    v19->_URL = (NSURL *)v20;

    v19->_options = a4;
    objc_storeStrong((id *)&v19->_userNameQuery, a5);
    objc_storeStrong((id *)&v19->_associatedDomainsManager, a7);
    uint64_t v22 = +[WBSSavedAccountContext defaultContext];
    context = v19->_context;
    v19->_context = (WBSSavedAccountContext *)v22;

    uint64_t v24 = [v16 copy];
    passkeyCredentialIdentifier = v19->_passkeyCredentialIdentifier;
    v19->_passkeyCredentialIdentifier = (NSData *)v24;

    if ((a4 & 0x70) == 0) {
      objc_storeStrong((id *)&v19->_webFrameIdentifier, a8);
    }
    v26 = v19;
  }

  return v19;
}

- (BOOL)queryShouldReturnSavedAccountsMatchingHighLevelAndSimplifiedDomains
{
  return self->_options & 1;
}

- (BOOL)queryShouldReturnSavedAccountsMatchingAssociatedDomains
{
  return (self->_options & 2) != 0 && self->_associatedDomainsManager != 0;
}

- (BOOL)queryShouldReturnSavedAccountsWithEmptyUsernames
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)queryShouldOmitAutoFillPasskeyMatches
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (BOOL)queryShouldIncludePasskeyMatchesForNonAutoFillContext
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (BOOL)queryShouldIncludeSavedAccountsWithDoNotSaveMarkers
{
  if ((self->_options & 4) != 0) {
    return 1;
  }
  v2 = [(WBSStringQuery *)self->_userNameQuery string];
  v3 = +[WBSDontSaveMarker dontSaveMarker];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)queryShouldOnlyIncludePasswordsWithoutWebsites
{
  return (LOBYTE(self->_options) >> 6) & 1;
}

- (NSSet)associatedDomainsForURL
{
  if ([(WBSSavedAccountMatchCriteria *)self queryShouldReturnSavedAccountsMatchingAssociatedDomains])
  {
    associatedDomainsManager = self->_associatedDomainsManager;
    char v4 = [(NSURL *)self->_URL host];
    v5 = objc_msgSend(v4, "safari_stringByRemovingWwwDotPrefix");
    v6 = [(WBSAutoFillAssociatedDomainsManager *)associatedDomainsManager domainsWithAssociatedCredentialsForDomain:v5];
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v6;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)WBSSavedAccountMatchCriteria;
  char v4 = [(WBSSavedAccountMatchCriteria *)&v11 description];
  v5 = [(NSURL *)self->_URL absoluteString];
  v6 = [(WBSStringQuery *)self->_userNameQuery string];
  v7 = [(WBSStringQuery *)self->_userNameQuery matchingTypeDescriptionString];
  v8 = [(WBSSavedAccountMatchCriteria *)self _optionsDescription];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ url=%@; userNameQuery='%@', '%@'; options=%@; associatedDomains=%@ context=%@; passkeyCredentialID=%@; webFrameID=%@;>",
    v4,
    v5,
    v6,
    v7,
    v8,
    self->_associatedDomainsManager,
    self->_context,
    self->_passkeyCredentialIdentifier,
  v9 = self->_webFrameIdentifier);

  return v9;
}

- (id)_optionsDescription
{
  if (self->_options)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    char v4 = v3;
    unint64_t options = self->_options;
    if (options)
    {
      [v3 addObject:@"highLevelAndSimplifiedDomains"];
      unint64_t options = self->_options;
      if ((options & 2) == 0)
      {
LABEL_4:
        if ((options & 4) == 0) {
          goto LABEL_5;
        }
        goto LABEL_15;
      }
    }
    else if ((options & 2) == 0)
    {
      goto LABEL_4;
    }
    [v4 addObject:@"quirkAffiliatedDomains"];
    unint64_t options = self->_options;
    if ((options & 4) == 0)
    {
LABEL_5:
      if ((options & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
LABEL_15:
    [v4 addObject:@"doNotSave"];
    unint64_t options = self->_options;
    if ((options & 8) == 0)
    {
LABEL_6:
      if ((options & 0x10) == 0)
      {
LABEL_8:
        v6 = [v4 componentsJoinedByString:@" | "];

        goto LABEL_10;
      }
LABEL_7:
      [v4 addObject:@"autoFillPasskeys"];
      goto LABEL_8;
    }
LABEL_16:
    [v4 addObject:@"emptyUsername"];
    if ((self->_options & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v6 = @"none";
LABEL_10:
  return v6;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (WBSStringQuery)userNameQuery
{
  return self->_userNameQuery;
}

- (void)setUserNameQuery:(id)a3
{
}

- (WBSSavedAccountContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (WBSAutoFillAssociatedDomainsManager)associatedDomainsManager
{
  return self->_associatedDomainsManager;
}

- (void)setAssociatedDomainsManager:(id)a3
{
}

- (WBSStringQuery)titleQuery
{
  return self->_titleQuery;
}

- (void)setTitleQuery:(id)a3
{
}

- (NSData)passkeyCredentialIdentifier
{
  return self->_passkeyCredentialIdentifier;
}

- (void)setPasskeyCredentialIdentifier:(id)a3
{
}

- (WBSGlobalFrameIdentifier)webFrameIdentifier
{
  return self->_webFrameIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webFrameIdentifier, 0);
  objc_storeStrong((id *)&self->_passkeyCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_titleQuery, 0);
  objc_storeStrong((id *)&self->_associatedDomainsManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_userNameQuery, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end