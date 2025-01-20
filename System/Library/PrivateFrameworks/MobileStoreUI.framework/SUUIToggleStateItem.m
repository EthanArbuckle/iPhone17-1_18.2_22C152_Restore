@interface SUUIToggleStateItem
- (NSString)itemIdentifier;
- (NSString)nonToggleString;
- (NSString)toggledString;
- (char)toggled;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)count;
- (void)setCount:(int64_t)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setNonToggleString:(id)a3;
- (void)setToggled:(char)a3;
- (void)setToggledString:(id)a3;
@end

@implementation SUUIToggleStateItem

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 16) = self->_count;
  uint64_t v6 = [(NSString *)self->_itemIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(unsigned char *)(v5 + 8) = self->_toggled;
  uint64_t v8 = [(NSString *)self->_nonToggledString copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_toggledString copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  return (id)v5;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)nonToggleString
{
  return self->_nonToggledString;
}

- (void)setNonToggleString:(id)a3
{
}

- (char)toggled
{
  return self->_toggled;
}

- (void)setToggled:(char)a3
{
  self->_toggled = a3;
}

- (NSString)toggledString
{
  return self->_toggledString;
}

- (void)setToggledString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggledString, 0);
  objc_storeStrong((id *)&self->_nonToggledString, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end