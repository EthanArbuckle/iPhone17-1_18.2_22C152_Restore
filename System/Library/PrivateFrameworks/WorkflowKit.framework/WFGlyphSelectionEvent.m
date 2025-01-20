@interface WFGlyphSelectionEvent
+ (Class)codableEventClass;
- (BOOL)searchActive;
- (NSString)identifier;
- (NSString)key;
- (void)setIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setSearchActive:(BOOL)a3;
@end

@implementation WFGlyphSelectionEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setSearchActive:(BOOL)a3
{
  self->_searchActive = a3;
}

- (BOOL)searchActive
{
  return self->_searchActive;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end