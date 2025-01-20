@interface MSVLyricsTextElement
- (BOOL)keepParentheses;
- (MSVLyricsTextElement)init;
- (NSAttributedString)lyricsText;
- (id)description;
- (void)setKeepParentheses:(BOOL)a3;
- (void)setLyricsText:(id)a3;
@end

@implementation MSVLyricsTextElement

- (void).cxx_destruct
{
}

- (void)setKeepParentheses:(BOOL)a3
{
  self->_keepParentheses = a3;
}

- (BOOL)keepParentheses
{
  return self->_keepParentheses;
}

- (void)setLyricsText:(id)a3
{
}

- (NSAttributedString)lyricsText
{
  return self->_lyricsText;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MSVLyricsTextElement *)self lyricsText];
  v8.receiver = self;
  v8.super_class = (Class)MSVLyricsTextElement;
  v5 = [(MSVLyricsElement *)&v8 description];
  v6 = [v3 stringWithFormat:@"Text: \"%@\", lyrics element: %@", v4, v5];

  return v6;
}

- (MSVLyricsTextElement)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSVLyricsTextElement;
  v2 = [(MSVLyricsTextElement *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28E78] string];
    [(MSVLyricsXMLElement *)v2 setMutableText:v3];
  }
  return v2;
}

@end