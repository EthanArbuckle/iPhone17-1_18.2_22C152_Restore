@interface MSVLyricsSection
+ (int64_t)_songPartForText:(id)a3;
- (MSVLyricsSection)init;
- (NSArray)lines;
- (NSString)songPartText;
- (id)description;
- (int64_t)songPart;
- (void)setLines:(id)a3;
- (void)setSongPart:(int64_t)a3;
- (void)setSongPartText:(id)a3;
@end

@implementation MSVLyricsSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_songPartText, 0);
}

- (void)setLines:(id)a3
{
}

- (NSArray)lines
{
  return self->_lines;
}

- (NSString)songPartText
{
  return self->_songPartText;
}

- (void)setSongPart:(int64_t)a3
{
  self->_songPart = a3;
}

- (int64_t)songPart
{
  return self->_songPart;
}

- (void)setSongPartText:(id)a3
{
  objc_storeStrong((id *)&self->_songPartText, a3);
  id v5 = a3;
  int64_t v6 = +[MSVLyricsSection _songPartForText:v5];

  [(MSVLyricsSection *)self setSongPart:v6];
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(MSVLyricsSection *)self songPart];
  id v5 = [(MSVLyricsSection *)self songPartText];
  int64_t v6 = [(MSVLyricsSection *)self lines];
  uint64_t v7 = [v6 count];
  v11.receiver = self;
  v11.super_class = (Class)MSVLyricsSection;
  v8 = [(MSVLyricsElement *)&v11 description];
  v9 = [v3 stringWithFormat:@"Song part: %ld (%@), %ld lines, element: %@", v4, v5, v7, v8];

  return v9;
}

- (MSVLyricsSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSVLyricsSection;
  v2 = [(MSVLyricsSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MSVLyricsElement *)v2 setType:0];
    lines = v3->_lines;
    v3->_lines = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

+ (int64_t)_songPartForText:(id)a3
{
  id v3 = a3;
  int64_t v4 = v3;
  if (v3)
  {
    if ([v3 caseInsensitiveCompare:@"verse"])
    {
      if ([v4 caseInsensitiveCompare:@"chorus"])
      {
        if ([v4 caseInsensitiveCompare:@"pre-chorus"])
        {
          if ([v4 caseInsensitiveCompare:@"bridge"])
          {
            if ([v4 caseInsensitiveCompare:@"intro"])
            {
              if ([v4 caseInsensitiveCompare:@"outro"])
              {
                if ([v4 caseInsensitiveCompare:@"refrain"]) {
                  int64_t v5 = 8 * ([v4 caseInsensitiveCompare:@"instrumental"] == 0);
                }
                else {
                  int64_t v5 = 7;
                }
              }
              else
              {
                int64_t v5 = 6;
              }
            }
            else
            {
              int64_t v5 = 5;
            }
          }
          else
          {
            int64_t v5 = 4;
          }
        }
        else
        {
          int64_t v5 = 3;
        }
      }
      else
      {
        int64_t v5 = 2;
      }
    }
    else
    {
      int64_t v5 = 1;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

@end