@interface TVHighlightGroup
- (NSArray)highlights;
- (NSString)localizedName;
- (void)setHighlights:(id)a3;
- (void)setLocalizedName:(id)a3;
@end

@implementation TVHighlightGroup

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSArray)highlights
{
  return self->_highlights;
}

- (void)setHighlights:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end