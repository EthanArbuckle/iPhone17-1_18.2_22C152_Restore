@interface GQDTCheckboxCell
- (BOOL)BOOLValue;
@end

@implementation GQDTCheckboxCell

- (BOOL)BOOLValue
{
  return self->super.mValue > 0.0;
}

@end