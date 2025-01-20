@interface MSVLyricsAgent
- (NSString)artistID;
- (NSString)name;
- (NSString)type;
- (id)description;
- (void)setArtistID:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MSVLyricsAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artistID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
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

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MSVLyricsAgent *)self type];
  v6 = [(MSVLyricsAgent *)self name];
  v7 = [(MSVLyricsXMLElement *)self identifier];
  v8 = [(MSVLyricsAgent *)self artistID];
  v9 = [v3 stringWithFormat:@"<%@ %p> type: %@, name: %@, identifier: %@, artistID: %@", v4, self, v5, v6, v7, v8];

  return v9;
}

@end