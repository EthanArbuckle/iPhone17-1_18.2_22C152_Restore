@interface WFConfiguredTriggerRecord
- (BOOL)editableShortcut;
- (BOOL)isEnabled;
- (BOOL)shouldNotify;
- (BOOL)shouldPrompt;
- (BOOL)shouldRecur;
- (NSData)selectedEntryMetadata;
- (NSData)triggerData;
- (int)notificationLevel;
- (int)source;
- (void)setEditableShortcut:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setNotificationLevel:(int)a3;
- (void)setSelectedEntryMetadata:(id)a3;
- (void)setShouldNotify:(BOOL)a3;
- (void)setShouldPrompt:(BOOL)a3;
- (void)setShouldRecur:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)setTriggerData:(id)a3;
@end

@implementation WFConfiguredTriggerRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedEntryMetadata, 0);
  objc_storeStrong((id *)&self->_triggerData, 0);
}

- (void)setNotificationLevel:(int)a3
{
  self->_notificationLevel = a3;
}

- (int)notificationLevel
{
  return self->_notificationLevel;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (int)source
{
  return self->_source;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEditableShortcut:(BOOL)a3
{
  self->_editableShortcut = a3;
}

- (BOOL)editableShortcut
{
  return self->_editableShortcut;
}

- (void)setShouldRecur:(BOOL)a3
{
  self->_shouldRecur = a3;
}

- (BOOL)shouldRecur
{
  return self->_shouldRecur;
}

- (void)setShouldNotify:(BOOL)a3
{
  self->_shouldNotify = a3;
}

- (BOOL)shouldNotify
{
  return self->_shouldNotify;
}

- (void)setShouldPrompt:(BOOL)a3
{
  self->_shouldPrompt = a3;
}

- (BOOL)shouldPrompt
{
  return self->_shouldPrompt;
}

- (void)setSelectedEntryMetadata:(id)a3
{
}

- (NSData)selectedEntryMetadata
{
  return self->_selectedEntryMetadata;
}

- (void)setTriggerData:(id)a3
{
}

- (NSData)triggerData
{
  return self->_triggerData;
}

@end