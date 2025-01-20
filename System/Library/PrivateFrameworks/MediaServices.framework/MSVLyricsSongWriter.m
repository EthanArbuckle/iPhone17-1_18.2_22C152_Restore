@interface MSVLyricsSongWriter
- (MSVLyricsSongWriter)init;
- (NSString)artistID;
- (NSString)name;
- (id)description;
- (void)setArtistID:(id)a3;
- (void)setName:(id)a3;
@end

@implementation MSVLyricsSongWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artistID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setArtistID:(id)a3
{
}

- (NSString)artistID
{
  return self->_artistID;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MSVLyricsSongWriter *)self name];
  v6 = [(MSVLyricsSongWriter *)self artistID];
  v7 = [v3 stringWithFormat:@"<%@ %p> name: %@, artistID: %@", v4, self, v5, v6];

  return v7;
}

- (MSVLyricsSongWriter)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSVLyricsSongWriter;
  v2 = [(MSVLyricsSongWriter *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28E78] string];
    [(MSVLyricsXMLElement *)v2 setMutableText:v3];
  }
  return v2;
}

@end