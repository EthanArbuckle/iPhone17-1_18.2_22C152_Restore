@interface PKPrecursorPassUpgradeRequestDescription
- (NSString)localizedActionText;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSURL)actionURL;
- (PKPrecursorPassUpgradeRequestDescription)init;
- (id)_init;
- (unint64_t)actionType;
- (void)setActionType:(unint64_t)a3;
- (void)setActionURL:(id)a3;
- (void)setLocalizedActionText:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation PKPrecursorPassUpgradeRequestDescription

- (PKPrecursorPassUpgradeRequestDescription)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPrecursorPassUpgradeRequestDescription;
  return [(PKPrecursorPassUpgradeRequestDescription *)&v3 init];
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)localizedActionText
{
  return self->_localizedActionText;
}

- (void)setLocalizedActionText:(id)a3
{
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_localizedActionText, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end