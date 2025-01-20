@interface EditShortcutType
+ (id)shortcutWithType:(int64_t)a3;
- (int64_t)type;
- (void)setType:(int64_t)a3;
@end

@implementation EditShortcutType

+ (id)shortcutWithType:(int64_t)a3
{
  v4 = objc_alloc_init(EditShortcutType);
  [(EditShortcutType *)v4 setType:a3];

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end