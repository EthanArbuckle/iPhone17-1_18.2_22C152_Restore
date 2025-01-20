@interface UIImage
+ (id)albumPlaceholder;
+ (id)artistPlaceholder;
+ (id)defaultPlaceholderForTraitCollection:(id)a3;
+ (id)geniusPlaylistPlaceholder;
+ (id)playlistFolderPlaceholder;
+ (id)playlistPlaceholder;
+ (id)playlistPlaceholderForPlaylist:(id)a3;
+ (id)playlistPlaceholderForPlaylistType:(int64_t)a3;
+ (id)smartPlaylistPlaceholder;
+ (id)tabBrowse;
+ (id)tabHome;
+ (id)tabLibrary;
+ (id)tabRadio;
@end

@implementation UIImage

+ (id)tabLibrary
{
  return [a1 _systemImageNamed:@"music.square.stack.fill"];
}

+ (id)tabHome
{
  return [a1 _systemImageNamed:@"home.fill"];
}

+ (id)tabBrowse
{
  return [a1 _systemImageNamed:@"square.grid.2x2.fill"];
}

+ (id)tabRadio
{
  return [a1 systemImageNamed:@"dot.radiowaves.left.and.right"];
}

+ (id)artistPlaceholder
{
  return [a1 _systemImageNamed:@"music.mic"];
}

+ (id)albumPlaceholder
{
  return [a1 _systemImageNamed:@"music.square.stack"];
}

+ (id)playlistPlaceholder
{
  return [a1 _systemImageNamed:@"music.note.list"];
}

+ (id)geniusPlaylistPlaceholder
{
  return [a1 _systemImageNamed:@"genius"];
}

+ (id)smartPlaylistPlaceholder
{
  return [a1 _systemImageNamed:@"gearshape"];
}

+ (id)playlistFolderPlaceholder
{
  return [a1 _systemImageNamed:@"folder"];
}

+ (id)playlistPlaceholderForPlaylistType:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = [a1 smartPlaylistPlaceholder];
  }
  else if (a3 == 3)
  {
    v3 = [a1 playlistFolderPlaceholder];
  }
  else
  {
    if (a3 == 2) {
      [a1 geniusPlaylistPlaceholder];
    }
    else {
    v3 = [a1 playlistPlaceholder];
    }
  }

  return v3;
}

+ (id)playlistPlaceholderForPlaylist:(id)a3
{
  id v4 = a3;
  if ([v4 hasLoadedValueForKey:MPModelPropertyPlaylistType]) {
    id v5 = [v4 type];
  }
  else {
    id v5 = 0;
  }
  v6 = [a1 playlistPlaceholderForPlaylistType:v5];

  return v6;
}

+ (id)defaultPlaceholderForTraitCollection:(id)a3
{
  return (id)_CPUIImageNamedWithTraitCollection(@"PlaceholderMusic", a3);
}

@end