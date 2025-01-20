@interface WBSBrowserTabCompletionMatch
- (BOOL)isHighlyRelevant;
- (BOOL)isLessRelevant;
- (NSString)tabGroupTitle;
- (NSUUID)tabGroupUUID;
- (NSUUID)tabUUID;
- (NSUUID)windowUUID;
- (WBSBrowserTabCompletionMatch)initWithTabInfo:(id)a3 userTypedString:(id)a4 alternativeDisplayTextForURL:(id)a5 forQueryID:(int64_t)a6;
- (WBSBrowserTabCompletionMatch)initWithTabUUID:(id)a3 windowUUID:(id)a4 tabIndex:(unint64_t)a5 userTypedString:(id)a6 tabURL:(id)a7 tabTitle:(id)a8 forQueryID:(int64_t)a9;
- (id)parsecDomainIdentifier;
- (unint64_t)tabIndex;
- (void)setHighlyRelevant:(BOOL)a3;
@end

@implementation WBSBrowserTabCompletionMatch

- (WBSBrowserTabCompletionMatch)initWithTabUUID:(id)a3 windowUUID:(id)a4 tabIndex:(unint64_t)a5 userTypedString:(id)a6 tabURL:(id)a7 tabTitle:(id)a8 forQueryID:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WBSBrowserTabCompletionMatch;
  v18 = [(WBSTabCompletionMatch *)&v22 initWithUserTypedString:a6 url:a7 title:a8 forQueryID:a9];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_tabUUID, a3);
    objc_storeStrong((id *)&v19->_windowUUID, a4);
    v19->_tabIndex = a5;
    v20 = v19;
  }

  return v19;
}

- (WBSBrowserTabCompletionMatch)initWithTabInfo:(id)a3 userTypedString:(id)a4 alternativeDisplayTextForURL:(id)a5 forQueryID:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v10 tabGroupTitle];
  if (v13
    && (unint64_t)[v11 length] <= 2
    && (objc_msgSend(v11, "safari_allowsLooserMatchingInSearch") & 1) == 0
    && ([MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled] & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    v27 = v13;
    id v15 = v12;
    if ([v10 pageStatus] == 2)
    {
      id v16 = 0;
    }
    else
    {
      id v16 = [v10 title];
    }
    id v17 = [v10 uuid];
    v18 = [v10 windowUUID];
    uint64_t v19 = [v10 tabIndex];
    v20 = [v10 url];
    self = [(WBSBrowserTabCompletionMatch *)self initWithTabUUID:v17 windowUUID:v18 tabIndex:v19 userTypedString:v11 tabURL:v20 tabTitle:v16 forQueryID:a6];

    id v12 = v15;
    v13 = v27;
    if (self)
    {
      v21 = [v10 tabGroupUUID];
      tabGroupUUID = self->_tabGroupUUID;
      self->_tabGroupUUID = v21;

      v23 = (NSString *)[v27 copy];
      tabGroupTitle = self->_tabGroupTitle;
      self->_tabGroupTitle = v23;

      [(WBSURLCompletionMatch *)self setAlternativeDisplayTextForURL:v12];
      v25 = self;
    }

    v14 = self;
  }

  return v14;
}

- (BOOL)isLessRelevant
{
  if (self->_tabGroupUUID || [(WBSURLCompletionMatch *)self matchLocation] < 7) {
    return 1;
  }
  v4 = [(WBSURLCompletionMatch *)self userInput];
  if ((unint64_t)[v4 length] >= 2)
  {
  }
  else
  {
    v5 = [(WBSURLCompletionMatch *)self userInput];
    char v6 = objc_msgSend(v5, "safari_allowsLooserMatchingInSearch");

    if ((v6 & 1) == 0) {
      return !self->_highlyRelevant;
    }
  }
  return 0;
}

- (id)parsecDomainIdentifier
{
  return @"switch_to_tab";
}

- (NSUUID)tabUUID
{
  return self->_tabUUID;
}

- (NSUUID)tabGroupUUID
{
  return self->_tabGroupUUID;
}

- (NSString)tabGroupTitle
{
  return self->_tabGroupTitle;
}

- (NSUUID)windowUUID
{
  return self->_windowUUID;
}

- (unint64_t)tabIndex
{
  return self->_tabIndex;
}

- (BOOL)isHighlyRelevant
{
  return self->_highlyRelevant;
}

- (void)setHighlyRelevant:(BOOL)a3
{
  self->_highlyRelevant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowUUID, 0);
  objc_storeStrong((id *)&self->_tabGroupTitle, 0);
  objc_storeStrong((id *)&self->_tabGroupUUID, 0);
  objc_storeStrong((id *)&self->_tabUUID, 0);
}

@end