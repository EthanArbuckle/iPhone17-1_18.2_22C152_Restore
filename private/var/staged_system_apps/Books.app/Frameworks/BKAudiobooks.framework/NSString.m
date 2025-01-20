@interface NSString
- (BOOL)bk_isAudioFileExtension;
- (BOOL)bk_isPlaylistExtension;
- (id)bk_titleByStrippingAudiobookTitle:(id)a3;
@end

@implementation NSString

- (BOOL)bk_isPlaylistExtension
{
  v2 = [(NSString *)self lowercaseString];
  unsigned __int8 v3 = [v2 isEqualToString:@"m3u8"];

  return v3;
}

- (BOOL)bk_isAudioFileExtension
{
  v2 = [(NSString *)self lowercaseString];
  if (([v2 isEqualToString:@"aac"] & 1) != 0
    || ([v2 isEqualToString:@"ts"] & 1) != 0
    || ([v2 isEqualToString:@"mp4"] & 1) != 0
    || ([v2 isEqualToString:@"m4b"] & 1) != 0)
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    unsigned __int8 v3 = [v2 isEqualToString:@"m4s"];
  }

  return v3;
}

- (id)bk_titleByStrippingAudiobookTitle:(id)a3
{
  id v4 = a3;
  if (qword_48F00 != -1) {
    dispatch_once(&qword_48F00, &stru_3D080);
  }
  v5 = self;
  if ([v4 length] && -[NSString hasPrefix:](v5, "hasPrefix:", v4))
  {
    v6 = -[NSString substringFromIndex:](v5, "substringFromIndex:", [v4 length]);
    v7 = [v6 stringByTrimmingCharactersInSet:qword_48EF8];

    if ([v7 length])
    {
      v8 = v7;

      v5 = v8;
    }
  }

  return v5;
}

@end