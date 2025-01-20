@interface WFCreateFolderEvent
+ (Class)codableEventClass;
- (NSString)folderSource;
- (NSString)key;
- (unsigned)icon;
- (unsigned)shortcutCount;
- (void)setFolderSource:(id)a3;
- (void)setIcon:(unsigned int)a3;
- (void)setKey:(id)a3;
- (void)setShortcutCount:(unsigned int)a3;
@end

@implementation WFCreateFolderEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setShortcutCount:(unsigned int)a3
{
  self->_shortcutCount = a3;
}

- (unsigned)shortcutCount
{
  return self->_shortcutCount;
}

- (void)setIcon:(unsigned int)a3
{
  self->_icon = a3;
}

- (unsigned)icon
{
  return self->_icon;
}

- (void)setFolderSource:(id)a3
{
}

- (NSString)folderSource
{
  return self->_folderSource;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end