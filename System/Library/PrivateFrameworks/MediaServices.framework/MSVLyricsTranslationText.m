@interface MSVLyricsTranslationText
- (MSVLyricsTranslationText)init;
- (NSString)lyricsLineKey;
- (id)description;
- (void)setLyricsLineKey:(id)a3;
@end

@implementation MSVLyricsTranslationText

- (void).cxx_destruct
{
}

- (void)setLyricsLineKey:(id)a3
{
}

- (NSString)lyricsLineKey
{
  return self->_lyricsLineKey;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MSVLyricsTranslationText *)self lyricsLineKey];
  v9.receiver = self;
  v9.super_class = (Class)MSVLyricsTranslationText;
  v6 = [(MSVLyricsLine *)&v9 description];
  v7 = [v3 stringWithFormat:@"<%@ %p> key: %@, lyrics line: %@", v4, self, v5, v6];

  return v7;
}

- (MSVLyricsTranslationText)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSVLyricsTranslationText;
  v2 = [(MSVLyricsLine *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MSVLyricsElement *)v2 setType:3];
  }
  return v3;
}

@end