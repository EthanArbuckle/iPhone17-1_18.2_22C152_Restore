@interface _SFNavigationIntent
+ (int64_t)defaultTabOrder;
+ (int64_t)effectiveTabOrderWithPreferredTabOrder:(int64_t)a3;
- (BOOL)canUseExistingBlankTab;
- (BOOL)externalURLSourceApplicationIsSpotlight;
- (BOOL)isChildIntent;
- (BOOL)neverPromptWhenOpeningMultipleIntents;
- (BOOL)opensInNewTab;
- (BOOL)opensInNewWindow;
- (BOOL)shouldDismissSidebarOnLoad;
- (BOOL)shouldOrderToForeground;
- (BOOL)shouldPromptBeforeHandling;
- (BOOL)shouldRelateToSourceTab;
- (NSArray)navigationIntents;
- (NSDictionary)externalOptions;
- (NSString)privacyPreservingDescription;
- (NSString)text;
- (NSURL)URL;
- (NSUUID)sourceTabUUID;
- (NSUUID)sourceWindowUUID;
- (SFTabStateData)recentlyClosedTabStateData;
- (SLHighlight)highlight;
- (TabDocument)usedTabDocument;
- (UIEventAttribution)eventAttribution;
- (UIWebClip)webClip;
- (WBSCloudTabItem)cloudTab;
- (WebBookmark)bookmark;
- (_WKActivatedElementInfo)sourceElementInfo;
- (id)_initWithType:(unint64_t)a3 value:(id)a4 policy:(int64_t)a5;
- (id)description;
- (int64_t)policy;
- (int64_t)provenance;
- (unint64_t)type;
- (void)setHighlight:(id)a3;
- (void)setIsChildIntent:(BOOL)a3;
- (void)setNeverPromptWhenOpeningMultipleIntents:(BOOL)a3;
- (void)setPolicy:(int64_t)a3;
- (void)setProvenance:(int64_t)a3;
- (void)setShouldDismissSidebarOnLoad:(BOOL)a3;
- (void)setShouldRelateToSourceTab:(BOOL)a3;
- (void)setSourceElementInfo:(id)a3;
- (void)setSourceTabUUID:(id)a3;
- (void)setSourceWindowUUID:(id)a3;
- (void)setUsedTabDocument:(id)a3;
@end

@implementation _SFNavigationIntent

+ (int64_t)defaultTabOrder
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  if ([v2 BOOLForKey:@"OpenLinksInBackground"]) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

+ (int64_t)effectiveTabOrderWithPreferredTabOrder:(int64_t)a3
{
  if (a3) {
    return a3;
  }
  else {
    return +[_SFNavigationIntent defaultTabOrder];
  }
}

- (id)_initWithType:(unint64_t)a3 value:(id)a4 policy:(int64_t)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SFNavigationIntent;
  v10 = [(_SFNavigationIntent *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_storeStrong(&v10->_value, a4);
    v11->_policy = a5;
    v11->_shouldRelateToSourceTab = 1;
    v12 = v11;
  }

  return v11;
}

- (id)description
{
  int64_t v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = self->_type - 1;
  if (v5 > 0xA) {
    v6 = @"Bookmark";
  }
  else {
    v6 = off_1E54EB8C0[v5];
  }
  unint64_t v7 = self->_policy - 1;
  if (v7 > 5) {
    v8 = @"Current Tab";
  }
  else {
    v8 = off_1E54EB918[v7];
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; type = %@; policy = %@; value = %@",
    v4,
    self,
    v6,
    v8,
  id v9 = self->_value);
  if ([(_SFNavigationIntent *)self shouldRelateToSourceTab])
  {
    [v9 appendFormat:@"; sourceWindow = %@", self->_sourceWindowUUID];
    [v9 appendFormat:@"; sourceTab = %@", self->_sourceTabUUID];
  }
  [v9 appendString:@">"];
  v10 = (void *)[v9 copy];

  return v10;
}

- (WebBookmark)bookmark
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = self->_value;
  }
  else {
    id v3 = 0;
  }

  return (WebBookmark *)v3;
}

- (SFTabStateData)recentlyClosedTabStateData
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = self->_value;
  }
  else {
    id v3 = 0;
  }

  return (SFTabStateData *)v3;
}

- (WBSCloudTabItem)cloudTab
{
  if ([self->_value conformsToProtocol:&unk_1EDAC5CF0]) {
    id v3 = self->_value;
  }
  else {
    id v3 = 0;
  }

  return (WBSCloudTabItem *)v3;
}

- (NSURL)URL
{
  v2 = 0;
  switch(self->_type)
  {
    case 0uLL:
      uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
      unint64_t v5 = [(_SFNavigationIntent *)self bookmark];
      uint64_t v6 = [v5 address];
      goto LABEL_6;
    case 1uLL:
      unint64_t v5 = [(_SFNavigationIntent *)self cloudTab];
      v2 = [v5 url];
      goto LABEL_7;
    case 2uLL:
    case 6uLL:
    case 8uLL:
    case 0xAuLL:
      id v3 = self->_value;
      goto LABEL_9;
    case 3uLL:
      uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
      unint64_t v5 = [(_SFNavigationIntent *)self recentlyClosedTabStateData];
      uint64_t v6 = [v5 url];
LABEL_6:
      unint64_t v7 = (void *)v6;
      v2 = [v4 URLWithString:v6];

LABEL_7:
      break;
    case 9uLL:
      id v3 = [self->_value URL];
LABEL_9:
      v2 = v3;
      break;
    default:
      break;
  }

  return (NSURL *)v2;
}

- (UIWebClip)webClip
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = self->_value;
  }
  else {
    id v3 = 0;
  }

  return (UIWebClip *)v3;
}

- (NSString)text
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = self->_value;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (UIEventAttribution)eventAttribution
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [self->_value options];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [v3 eventAttribution];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (UIEventAttribution *)v4;
}

- (NSDictionary)externalOptions
{
  if (self->_type == 9)
  {
    v2 = [self->_value URLOptionsDictionary];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }

  return (NSDictionary *)v2;
}

- (NSArray)navigationIntents
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = self->_value;
  }
  else {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (BOOL)shouldOrderToForeground
{
  return (self->_policy < 5uLL) & (0x1Bu >> self->_policy);
}

- (BOOL)opensInNewTab
{
  return (self->_policy > 6uLL) | (0x1Eu >> self->_policy) & 1;
}

- (BOOL)opensInNewWindow
{
  return self->_policy > 6uLL || (self->_policy & 0x7F) == 4;
}

- (BOOL)canUseExistingBlankTab
{
  unint64_t type = self->_type;
  switch(type)
  {
    case 0xBuLL:
      unint64_t v5 = [(_SFNavigationIntent *)self navigationIntents];
      uint64_t v6 = [v5 objectAtIndexedSubscript:0];
      char v7 = [v6 canUseExistingBlankTab];

      return v7;
    case 9uLL:
      return 1;
    case 3uLL:
      return 0;
    default:
      return [(_SFNavigationIntent *)self opensInNewWindow]
          || ![(_SFNavigationIntent *)self opensInNewTab]
          || self->_policy == 3;
  }
}

- (BOOL)shouldRelateToSourceTab
{
  return (unint64_t)(self->_policy - 1) <= 3 && self->_shouldRelateToSourceTab;
}

- (NSString)privacyPreservingDescription
{
  switch(self->_type)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
      id v3 = NSString;
      uint64_t v4 = [(_SFNavigationIntent *)self URL];
      unint64_t v5 = [v4 scheme];
      [v3 stringWithFormat:@"<url; scheme = %@>", v5];
      goto LABEL_3;
    case 4uLL:
    case 5uLL:
      uint64_t v4 = [(_SFNavigationIntent *)self text];
      v15 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v16 = objc_msgSend(v4, "safari_stringByRemovingCharactersInSet:", v15);
      uint64_t v17 = [v16 length];

      v18 = NSString;
      uint64_t v19 = [v4 length];
      v20 = @"false";
      if (!v17) {
        v20 = @"true";
      }
      uint64_t v6 = [v18 stringWithFormat:@"<text length = %lu; onlyWhitespace = %@>", v19, v20];;
      goto LABEL_5;
    case 7uLL:
      v21 = NSString;
      uint64_t v4 = [(_SFNavigationIntent *)self webClip];
      unint64_t v5 = [v4 uuid];
      v22 = [v5 UUIDString];
      uint64_t v6 = [v21 stringWithFormat:@"<web clip identifier = %@>", v22];;

      goto LABEL_4;
    case 8uLL:
      v23 = NSString;
      uint64_t v4 = [(_SFNavigationIntent *)self URL];
      unint64_t v5 = [v4 scheme];
      [v23 stringWithFormat:@"<service worker open URL; scheme = %@>", v5];
      goto LABEL_3;
    case 0xBuLL:
      v24 = [(_SFNavigationIntent *)self navigationIntents];
      uint64_t v4 = objc_msgSend(v24, "safari_mapObjectsUsingBlock:", &__block_literal_global_29);

      v25 = NSString;
      unint64_t v5 = [v4 componentsJoinedByString:@",\n\t"];
      [v25 stringWithFormat:@"[\n\t%@\n]", v5];
      uint64_t v6 = LABEL_3:;
LABEL_4:

LABEL_5:
      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  char v7 = NSString;
  uint64_t v8 = objc_opt_class();
  unint64_t v9 = self->_type - 1;
  if (v9 > 0xA) {
    v10 = @"Bookmark";
  }
  else {
    v10 = off_1E54EB8C0[v9];
  }
  unint64_t v11 = self->_policy - 1;
  if (v11 > 5) {
    v12 = @"Current Tab";
  }
  else {
    v12 = off_1E54EB918[v11];
  }
  v13 = [v7 stringWithFormat:@"<%@ unint64_t type = %@; policy = %@; value = %@>", v8, v10, v12, v6];;

  return (NSString *)v13;
}

- (BOOL)externalURLSourceApplicationIsSpotlight
{
  if (self->_type != 9) {
    return 0;
  }
  v2 = [self->_value options];
  id v3 = [v2 sourceApplication];
  char v4 = [v3 isEqualToString:@"com.apple.Spotlight"];

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
}

- (TabDocument)usedTabDocument
{
  return self->_usedTabDocument;
}

- (void)setUsedTabDocument:(id)a3
{
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (void)setShouldRelateToSourceTab:(BOOL)a3
{
  self->_shouldRelateToSourceTab = a3;
}

- (BOOL)shouldPromptBeforeHandling
{
  return self->_shouldPromptBeforeHandling;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (BOOL)shouldDismissSidebarOnLoad
{
  return self->_shouldDismissSidebarOnLoad;
}

- (void)setShouldDismissSidebarOnLoad:(BOOL)a3
{
  self->_shouldDismissSidebarOnLoad = a3;
}

- (NSUUID)sourceTabUUID
{
  return self->_sourceTabUUID;
}

- (void)setSourceTabUUID:(id)a3
{
}

- (NSUUID)sourceWindowUUID
{
  return self->_sourceWindowUUID;
}

- (void)setSourceWindowUUID:(id)a3
{
}

- (_WKActivatedElementInfo)sourceElementInfo
{
  return self->_sourceElementInfo;
}

- (void)setSourceElementInfo:(id)a3
{
}

- (BOOL)isChildIntent
{
  return self->_isChildIntent;
}

- (void)setIsChildIntent:(BOOL)a3
{
  self->_isChildIntent = a3;
}

- (BOOL)neverPromptWhenOpeningMultipleIntents
{
  return self->_neverPromptWhenOpeningMultipleIntents;
}

- (void)setNeverPromptWhenOpeningMultipleIntents:(BOOL)a3
{
  self->_neverPromptWhenOpeningMultipleIntents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceElementInfo, 0);
  objc_storeStrong((id *)&self->_sourceWindowUUID, 0);
  objc_storeStrong((id *)&self->_sourceTabUUID, 0);
  objc_storeStrong((id *)&self->_usedTabDocument, 0);
  objc_storeStrong((id *)&self->_highlight, 0);

  objc_storeStrong(&self->_value, 0);
}

@end