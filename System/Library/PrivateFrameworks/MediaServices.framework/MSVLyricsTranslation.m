@interface MSVLyricsTranslation
- (NSString)language;
- (id)description;
- (void)setLanguage:(id)a3;
@end

@implementation MSVLyricsTranslation

- (void).cxx_destruct
{
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MSVLyricsTranslation *)self language];
  v6 = [v3 stringWithFormat:@"<%@ %p> language: %@", v4, self, v5];

  return v6;
}

@end