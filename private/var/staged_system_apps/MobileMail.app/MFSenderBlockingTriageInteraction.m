@interface MFSenderBlockingTriageInteraction
+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 blockSender:(BOOL)a7;
+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 blockSender:(BOOL)a7;
- (BOOL)shouldUpdateWidget;
- (BOOL)supportsSelectAll;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)color;
- (id)shortTitle;
- (id)title;
- (id)triageAction;
- (void)setTriageAction:(id)a3;
@end

@implementation MFSenderBlockingTriageInteraction

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSSenderBlockingTriageAction);
    v5 = [(MFTriageInteraction *)self messageListItemSelection];
    v6 = [v4 initWithMessageListSelection:v5 origin:[self origin] actor:[self actor] delegate:self blockSender:self->_blockSender];
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 blockSender:(BOOL)a7
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___MFSenderBlockingTriageInteraction;
  [super interactionWithMessageListItemSelection:a3 undoManager:a4 origin:a5 actor:a6];
  v8 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    v8[88] = a7;
  }

  return v8;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 blockSender:(BOOL)a7
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___MFSenderBlockingTriageInteraction;
  [super interactionWithMessageListItems:a3, a4, a5, a6];
  v8 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    v8[88] = a7;
  }

  return v8;
}

- (id)title
{
  BOOL blockSender = self->_blockSender;
  v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (blockSender) {
    [v3 localizedStringForKey:@"BLOCK_SENDER" value:&stru_100619928 table:@"Main"];
  }
  else {
  v5 = [v3 localizedStringForKey:@"UNBLOCK_SENDER" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerBlockSender;
}

- (id)shortTitle
{
  BOOL blockSender = self->_blockSender;
  v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (blockSender) {
    [v3 localizedStringForKey:@"BLOCK_SENDER" value:&stru_100619928 table:@"Main"];
  }
  else {
  v5 = [v3 localizedStringForKey:@"UNBLOCK_SENDER" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)_iconImageName
{
  return MFImageGlyphStatusIndicatorBlockSender;
}

- (id)_previewImageName
{
  return MFImageGlyphStatusIndicatorBlockSender;
}

- (id)color
{
  return +[UIColor systemIndigoColor];
}

- (BOOL)supportsSelectAll
{
  return 0;
}

- (BOOL)shouldUpdateWidget
{
  return 1;
}

- (void)setTriageAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end