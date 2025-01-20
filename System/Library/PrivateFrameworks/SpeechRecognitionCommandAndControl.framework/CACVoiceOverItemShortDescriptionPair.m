@interface CACVoiceOverItemShortDescriptionPair
- (CACVoiceOverDescribable)item;
- (NSString)shortDescription;
- (void)setItem:(id)a3;
- (void)setShortDescription:(id)a3;
@end

@implementation CACVoiceOverItemShortDescriptionPair

- (CACVoiceOverDescribable)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (void)setShortDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end