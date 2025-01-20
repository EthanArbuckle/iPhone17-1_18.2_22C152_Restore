@interface SiriSharedUITranscriptItem
+ (id)additionalContentViewPlatterCategories;
+ (id)transcriptItemWithAceObject:(id)a3;
- (AceObject)aceObject;
- (BOOL)isAnnouncementItem;
- (BOOL)isConversationItem;
- (BOOL)isHintItem;
- (BOOL)isRestored;
- (BOOL)shouldBeExposed;
- (BOOL)snippetViewControllerHasBeenUnloaded;
- (CGRect)previousFrame;
- (NSUUID)itemIdentifier;
- (NSUUID)taskIdentifier;
- (SiriSharedUITranscriptItem)initWithAceObject:(id)a3;
- (SiriSharedUIViewControlling)viewController;
- (id)description;
- (int64_t)platterCategory;
- (void)setAceObject:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setPreviousFrame:(CGRect)a3;
- (void)setRestored:(BOOL)a3;
- (void)setShouldBeExposed:(BOOL)a3;
- (void)setSnippetViewControllerHasBeenUnloaded:(BOOL)a3;
- (void)setTaskIdentifier:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation SiriSharedUITranscriptItem

+ (id)transcriptItemWithAceObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAceObject:v4];

  return v5;
}

- (SiriSharedUITranscriptItem)initWithAceObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUITranscriptItem;
  v6 = [(SiriSharedUITranscriptItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_aceObject, a3);
    *(_WORD *)&v7->_shouldBeExposed = 1;
  }

  return v7;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUITranscriptItem;
  v3 = [(SiriSharedUITranscriptItem *)&v8 description];
  uint64_t v4 = objc_opt_class();
  id v5 = [(SiriSharedUITranscriptItem *)self viewController];
  v6 = [v3 stringByAppendingFormat:@" aceObject=%@, viewController=%@", v4, v5];

  return v6;
}

- (BOOL)isConversationItem
{
  v3 = [(SiriSharedUITranscriptItem *)self aceObject];
  uint64_t v4 = [(SiriSharedUITranscriptItem *)self viewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 itemType];
    [v5 isEqualToString:*MEMORY[0x263F65118]];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v3 itemType];
    [v6 isEqualToString:*MEMORY[0x263F65120]];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v3 itemType];
    char v8 = [v7 isEqualToString:*MEMORY[0x263F65110]];

    if (v8) {
      goto LABEL_11;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = [v3 itemType];
    char v10 = [v9 isEqualToString:*MEMORY[0x263F65128]];

    if (v10) {
      goto LABEL_11;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 sash], v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
LABEL_11:
    LOBYTE(v12) = 0;
  }
  else if (objc_opt_respondsToSelector())
  {
    int v12 = [v4 hasSash] ^ 1;
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (BOOL)isHintItem
{
  v2 = [(SiriSharedUITranscriptItem *)self aceObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 itemType];
    char v4 = [v3 isEqualToString:*MEMORY[0x263F65120]];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isAnnouncementItem
{
  v2 = [(SiriSharedUITranscriptItem *)self aceObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 itemType];
    char v4 = [v3 isEqualToString:*MEMORY[0x263F65110]];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (int64_t)platterCategory
{
  if (([MEMORY[0x263F286B8] isSAEEnabled] & 1) != 0
    || [(SiriSharedUITranscriptItem *)self isConversationItem])
  {
    return 1;
  }
  if ([(SiriSharedUITranscriptItem *)self isAnnouncementItem]) {
    return 2;
  }
  return 0;
}

+ (id)additionalContentViewPlatterCategories
{
  return &unk_26C1AE578;
}

- (NSUUID)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSUUID)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
}

- (SiriSharedUIViewControlling)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (void)setAceObject:(id)a3
{
}

- (BOOL)isRestored
{
  return self->_restored;
}

- (void)setRestored:(BOOL)a3
{
  self->_restored = a3;
}

- (BOOL)shouldBeExposed
{
  return self->_shouldBeExposed;
}

- (void)setShouldBeExposed:(BOOL)a3
{
  self->_shouldBeExposed = a3;
}

- (BOOL)snippetViewControllerHasBeenUnloaded
{
  return self->_snippetViewControllerHasBeenUnloaded;
}

- (void)setSnippetViewControllerHasBeenUnloaded:(BOOL)a3
{
  self->_snippetViewControllerHasBeenUnloaded = a3;
}

- (CGRect)previousFrame
{
  double x = self->_previousFrame.origin.x;
  double y = self->_previousFrame.origin.y;
  double width = self->_previousFrame.size.width;
  double height = self->_previousFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousFrame:(CGRect)a3
{
  self->_previousFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceObject, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end