@interface EditShortcutSection
+ (id)sectionWithType:(unint64_t)a3;
- (unint64_t)type;
- (void)setType:(unint64_t)a3;
@end

@implementation EditShortcutSection

+ (id)sectionWithType:(unint64_t)a3
{
  v4 = objc_alloc_init(EditShortcutSection);
  [(EditShortcutSection *)v4 setType:a3];

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end