@interface SSMusicResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
+ (id)stringWithAlbum:(id)a3 releaseDate:(id)a4;
- (BOOL)buildButtonItemsAreTrailing;
- (BOOL)isExplicit;
- (NSDate)creationDate;
- (NSNumber)songLengthInSeconds;
- (NSString)album;
- (NSString)artist;
- (NSString)mediaId;
- (NSString)song;
- (SSMusicResultBuilder)initWithResult:(id)a3;
- (id)buildButtonItems;
- (id)buildCompactCardSection;
- (id)buildDescriptions;
- (id)buildFootnote;
- (id)buildResult;
- (id)buildThumbnail;
- (id)buildTitle;
- (unint64_t)numberOfLinesForDescriptions;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setMediaId:(id)a3;
- (void)setSong:(id)a3;
- (void)setSongLengthInSeconds:(id)a3;
@end

@implementation SSMusicResultBuilder

+ (id)stringWithAlbum:(id)a3 releaseDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  if ([v5 length]) {
    [v7 addObject:v5];
  }
  if (v6)
  {
    v8 = +[SSDateFormatManager calendar];
    uint64_t v9 = [v8 component:4 fromDate:v6];

    v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:v9];
    v11 = [v10 stringValue];
    [v7 addObject:v11];
  }
  v12 = [v7 componentsJoinedByString:@" · "];

  return v12;
}

+ (id)bundleId
{
  return @"com.apple.Music";
}

+ (BOOL)supportsResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 applicationBundleIdentifier];
  id v6 = [a1 bundleId];
  if ([v5 isEqualToString:v6])
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___SSMusicResultBuilder;
    unsigned __int8 v7 = objc_msgSendSuper2(&v9, sel_supportsResult_, v4);
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSMusicResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSMusicResultBuilder;
  id v5 = [(SSResultBuilder *)&v14 initWithResult:v4];
  if (v5)
  {
    id v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22A68] withType:objc_opt_class()];
    [(SSMusicResultBuilder *)v5 setAlbum:v6];

    unsigned __int8 v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22AD8] withType:objc_opt_class()];
    [(SSMusicResultBuilder *)v5 setArtist:v7];

    v8 = [v4 valueForAttribute:*MEMORY[0x1E4F23670] withType:objc_opt_class()];
    [(SSMusicResultBuilder *)v5 setMediaId:v8];

    objc_super v9 = [v4 valueForAttribute:*MEMORY[0x1E4F22D38] withType:objc_opt_class()];
    [(SSMusicResultBuilder *)v5 setSongLengthInSeconds:v9];

    v10 = [v4 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
    [(SSMusicResultBuilder *)v5 setCreationDate:v10];

    v11 = [v4 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
    [(SSMusicResultBuilder *)v5 setSong:v11];

    v12 = [v4 valueForAttribute:*MEMORY[0x1E4F22C50] withType:objc_opt_class()];
    -[SSMusicResultBuilder setIsExplicit:](v5, "setIsExplicit:", [v12 BOOLValue]);
  }
  return v5;
}

- (id)buildResult
{
  v6.receiver = self;
  v6.super_class = (Class)SSMusicResultBuilder;
  v3 = [(SSResultBuilder *)&v6 buildResult];
  id v4 = [(SSMusicResultBuilder *)self mediaId];
  [v3 setIdentifier:v4];

  return v3;
}

- (id)buildCompactCardSection
{
  v8.receiver = self;
  v8.super_class = (Class)SSMusicResultBuilder;
  v2 = [(SSResultBuilder *)&v8 buildCompactCardSection];
  v3 = [v2 footnote];

  if (v3)
  {
    id v4 = [v2 descriptions];
    id v5 = [v2 footnote];
    objc_super v6 = [v4 arrayByAddingObject:v5];
    [v2 setDescriptions:v6];
  }
  [v2 setFootnote:0];
  return v2;
}

- (id)buildTitle
{
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = [(SSMusicResultBuilder *)self song];

  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F9A0E0];
    unsigned __int8 v7 = [(SSMusicResultBuilder *)self song];
    objc_super v8 = [v6 textWithString:v7];
    [v3 addObject:v8];
  }
  if ([(SSMusicResultBuilder *)self isExplicit])
  {
    objc_super v9 = [v3 firstObject];
    [v9 setIsEmphasized:1];

    v10 = objc_opt_new();
    [v10 setSymbolName:@"e.square.fill"];
    [v10 setIsTemplate:1];
    v11 = objc_opt_new();
    [v11 setGlyph:v10];
    v12 = [MEMORY[0x1E4F9A0E0] textWithString:@" "];
    [v3 addObject:v12];

    [v3 addObject:v11];
  }
  v13 = (void *)[v3 copy];
  [v4 setFormattedTextPieces:v13];

  return v4;
}

- (id)buildDescriptions
{
  v41[2] = *MEMORY[0x1E4F143B8];
  int v3 = SSSnippetModernizationEnabled();
  id v4 = objc_opt_new();
  if (!v3)
  {
    v26 = [(SSMusicResultBuilder *)self artist];
    uint64_t v27 = [v26 length];

    if (v27)
    {
      v28 = (void *)MEMORY[0x1E4F9A378];
      v29 = [(SSMusicResultBuilder *)self artist];
      v30 = [v28 textWithString:v29];
      [v4 addObject:v30];
    }
    v31 = [(SSMusicResultBuilder *)self album];
    if ([v31 length])
    {
    }
    else
    {
      v32 = [(SSMusicResultBuilder *)self creationDate];

      if (!v32)
      {
LABEL_16:
        v25 = (void *)[v4 copy];
        goto LABEL_17;
      }
    }
    v33 = (void *)MEMORY[0x1E4F9A378];
    v34 = objc_opt_class();
    v35 = [(SSMusicResultBuilder *)self album];
    v36 = [(SSMusicResultBuilder *)self creationDate];
    v37 = [v34 stringWithAlbum:v35 releaseDate:v36];
    v38 = [v33 textWithString:v37];
    [v4 addObject:v38];

    goto LABEL_16;
  }
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v6 = [(SSResultBuilder *)self result];
  unsigned __int8 v7 = [v6 contentType];
  objc_super v8 = [(id)*MEMORY[0x1E4F44478] identifier];
  if ([v7 isEqualToString:v8]) {
    objc_super v9 = @"PLAYLIST";
  }
  else {
    objc_super v9 = @"SONG";
  }
  v10 = [v5 localizedStringForKey:v9 value:&stru_1F1824018 table:@"SpotlightServices"];
  [v4 addObject:v10];

  v11 = [(SSMusicResultBuilder *)self artist];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [(SSMusicResultBuilder *)self artist];
    [v4 addObject:v13];
  }
  objc_super v14 = [(SSMusicResultBuilder *)self songLengthInSeconds];

  if (v14)
  {
    v15 = [(SSMusicResultBuilder *)self songLengthInSeconds];
    [v15 doubleValue];
    v16 = +[SSDateFormatManager stringFromTimeInterval:](SSDateFormatManager, "stringFromTimeInterval:");
    [v4 addObject:v16];
  }
  v17 = objc_opt_new();
  [v17 setSymbolName:@"music.square.stack.fill"];
  [v17 setIsTemplate:1];
  v18 = objc_opt_new();
  [v18 setGlyph:v17];
  v19 = objc_opt_new();
  v41[0] = v18;
  v20 = (void *)MEMORY[0x1E4F9A0E0];
  v21 = [v4 componentsJoinedByString:@" · "];
  v22 = [@" " stringByAppendingString:v21];
  v23 = [v20 textWithString:v22];
  v41[1] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  [v19 setFormattedTextPieces:v24];

  v40 = v19;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];

LABEL_17:
  return v25;
}

- (id)buildFootnote
{
  uint64_t v3 = [(SSMusicResultBuilder *)self songLengthInSeconds];
  if (v3 && (v4 = (void *)v3, char v5 = SSSnippetModernizationEnabled(), v4, (v5 & 1) == 0))
  {
    unsigned __int8 v7 = (void *)MEMORY[0x1E4F9A378];
    objc_super v8 = [(SSMusicResultBuilder *)self songLengthInSeconds];
    [v8 doubleValue];
    objc_super v9 = +[SSDateFormatManager stringFromTimeInterval:](SSDateFormatManager, "stringFromTimeInterval:");
    objc_super v6 = [v7 textWithString:v9];
  }
  else
  {
    objc_super v6 = 0;
  }
  return v6;
}

- (unint64_t)numberOfLinesForDescriptions
{
  return 1;
}

- (id)buildThumbnail
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(SSMusicResultBuilder *)self mediaId];
  [v3 setSpotlightIdentifier:v4];

  return v3;
}

- (id)buildButtonItems
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SSMusicResultBuilder *)self mediaId];

  if (v3)
  {
    id v4 = objc_opt_new();
    char v5 = [(SSMusicResultBuilder *)self mediaId];
    [v4 setMediaIdentifier:v5];

    objc_super v6 = (void *)*MEMORY[0x1E4F44478];
    unsigned __int8 v7 = [(SSResultBuilder *)self uniformType];
    LODWORD(v6) = [v6 conformsToType:v7];

    if (v6) {
      uint64_t v8 = 5;
    }
    else {
      uint64_t v8 = 1;
    }
    [v4 setMediaType:v8];
    objc_super v9 = objc_opt_new();
    [v9 setMediaMetadata:v4];
    v12[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSString)mediaId
{
  return self->_mediaId;
}

- (void)setMediaId:(id)a3
{
}

- (NSString)song
{
  return self->_song;
}

- (void)setSong:(id)a3
{
}

- (NSNumber)songLengthInSeconds
{
  return self->_songLengthInSeconds;
}

- (void)setSongLengthInSeconds:(id)a3
{
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songLengthInSeconds, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_mediaId, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end